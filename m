Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E37F16EC9D
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2020 18:37:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 860B46EB63;
	Tue, 25 Feb 2020 17:37:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com
 [IPv6:2607:f8b0:4864:20::e43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78B1C6E8FA;
 Tue, 25 Feb 2020 17:37:25 +0000 (UTC)
Received: by mail-vs1-xe43.google.com with SMTP id t12so8506268vso.13;
 Tue, 25 Feb 2020 09:37:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=eL99fWfbOC82WjarXQ0HpAvuE7P7THl7X3j0zyIlmXA=;
 b=nZR8rwmf3BvrC6U8Sp0UCVJL+3zNzktLmn+AvuRQxNuKiKh4DWZ0BpzmAklM94NAXu
 9Xgdj789bOpBQM+XN5cJTIlNaLuk//gmQb8OG0NOyUOzfO1pHuxqY0hbVg1VGj9fJ77v
 B3eUEcfOq3WZn1PkF7w+HZqtBlcXL2OP6LXHqIjkwKHzI12ZgfAM75QJuO4v8rGgzX8G
 +JEfgLIt9HLLPOjKp4lQEF5fXoVIXtmnfLkkIe2lMxR07bcW4y7e7DB/od+gRJnHhUf9
 HC9mTA4PTa+NecSUpJEablmGEMlbTv5zpFsVY2N+GnwIk2dAPZul2sIownwETkWTBynY
 dnjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=eL99fWfbOC82WjarXQ0HpAvuE7P7THl7X3j0zyIlmXA=;
 b=NicsFqpYNyoDNLjoMhABY/rUSd2Qr+dJ980l5qAiXHNZIAK259OwnxpULH+Pt/Y/e/
 Ttx0Sqyl8N0kg2BbLIxkD0nYelan8zgQQkcFDfWvThOcInBP1UzXF8/U0zq4qnulAXk7
 gApKgKIFjyvHXmvm79BBJRqhSfCJeINu721VU6K6GTZM6xj2nICCbjRbwXCJrL3xhohI
 iDMeO6UrXH/3YsVKQPkCmF+j7UWwhNMq1nA6dw5AFTjT337BfZ0nl5apAl3TpF9ahDnf
 NOgyFYT3c9lYtGAy53BolLG7Rc9P7+QLiM18O4gVH34LC6tuYE/nuJV8hdXGvE1/kWdP
 fsSQ==
X-Gm-Message-State: APjAAAVo1LGCBNi7ySvCsfKBD24t5tWpiS4x46iqwKQmIpmLFT3Hv3Rk
 sAyxYyUH4LFkbtsy7jZttbbVssbzRE73XMbTPAc=
X-Google-Smtp-Source: APXvYqwU98gfhqVAxJa7gosL8Ra6s1c69+eKdPuBlqgtOzj45DyTIyfXssXREHGb5HXhW6v3M5fDW4NNOvQuxusFBWg=
X-Received: by 2002:a67:fc54:: with SMTP id p20mr190520vsq.37.1582652244622;
 Tue, 25 Feb 2020 09:37:24 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:ab0:6c5:0:0:0:0:0 with HTTP;
 Tue, 25 Feb 2020 09:37:23 -0800 (PST)
In-Reply-To: <20200225155902.9751-2-tzimmermann@suse.de>
References: <20200225155902.9751-1-tzimmermann@suse.de>
 <20200225155902.9751-2-tzimmermann@suse.de>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Tue, 25 Feb 2020 17:37:23 +0000
Message-ID: <CACvgo52fCMEiohuOkXyZi_mVrFnhMmmB--W64AvhEgVe3i2T5A@mail.gmail.com>
Subject: Re: [Nouveau] [PATCH 1/3] drm: Add separate state structure for
 legacy, non-KMS drivers
To: Thomas Zimmermann <tzimmermann@suse.de>
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: "airlied@linux.ie" <airlied@linux.ie>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "bskeggs@redhat.com" <bskeggs@redhat.com>,
 "alexander.deucher@amd.com" <alexander.deucher@amd.com>,
 "sam@ravnborg.org" <sam@ravnborg.org>,
 "emil.velikov@collabora.com" <emil.velikov@collabora.com>
Content-Type: multipart/mixed; boundary="===============0635753418=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0635753418==
Content-Type: multipart/alternative; boundary="000000000000d80154059f69f093"

--000000000000d80154059f69f093
Content-Type: text/plain; charset="UTF-8"

Hi Thomas,

On Tuesday, 25 February 2020, Thomas Zimmermann <tzimmermann@suse.de> wrote:

> Non-KMS drivers store state in struct drm_driver. This bloats the
> structure for KMS drivers and prevents it from being declared with
> 'static const' qualifiers. Moving the non-KMS state into a separate
> data structure resolves this.
>
>
Have you considered subclassing the const drm_driver for legacy drivers.
This way the legacy (pointer) data does not need to be exposed to
non-legacy drivers.

Not to mention that const data (drm_driver), which has (const) pointer to
mutable data (legacy bits) is a trap IMHO

Emil

--000000000000d80154059f69f093
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div>Hi Thomas,</div><div><br></div>On Tuesday, 25 February 2020, Thomas Zi=
mmermann &lt;<a href=3D"mailto:tzimmermann@suse.de">tzimmermann@suse.de</a>=
&gt; wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex">Non-KMS drivers store state i=
n struct drm_driver. This bloats the<br>
structure for KMS drivers and prevents it from being declared with<br>
&#39;static const&#39; qualifiers. Moving the non-KMS state into a separate=
<br>
data structure resolves this.<br>
<br></blockquote><div><br></div><div>Have you considered subclassing the co=
nst drm_driver for legacy drivers. This way the legacy (pointer) data does =
not need to be exposed to non-legacy drivers.</div><div><br></div><div>Not =
to mention that const data (drm_driver), which has (const) pointer to mutab=
le data (legacy bits) is a trap IMHO</div><div><br></div><div>Emil</div>

--000000000000d80154059f69f093--

--===============0635753418==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0635753418==--
