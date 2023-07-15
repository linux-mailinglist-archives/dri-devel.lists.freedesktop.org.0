Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0C1875494E
	for <lists+dri-devel@lfdr.de>; Sat, 15 Jul 2023 16:20:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDB2B10E148;
	Sat, 15 Jul 2023 14:20:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCDD010E148
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Jul 2023 14:20:37 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-991da766865so412288866b.0
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Jul 2023 07:20:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689430835; x=1692022835;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=mWOWKY77PSowwfVfyg7pG2+T2RWtpkqnUSJjTJ58hDI=;
 b=afBRjLZdIegTtFMb1Ob3lK9EGH/NqIdyMt8SkjuQ4+W86sKU/eRuhcxRlcNLxpDa9X
 tU8RzrcMbg9Ihopi12Frk3eXJwfyocl42NWAZXwMLA6IZkHG9tGfXnAG9Ct7r35ks1/r
 VxeC5MbSXGH155cch2VJgbp5rJTxHGpsZTx9NGCsxrZ2wW6G33Yi3guueMWqG7tOCDv4
 1YO3gznWhdFnNEqJtbSJMT2nknLgNESRDJDqaJI8/GlJdsw/BKbECq/YHhLwNRdd9mPi
 kiPETyyF5u1xActhF4n07ou4qBiB9e9uN7/kAPVRTqBjZvYQZBF2fbUi7uaBYqGK6r9+
 kQHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689430835; x=1692022835;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mWOWKY77PSowwfVfyg7pG2+T2RWtpkqnUSJjTJ58hDI=;
 b=ZlFERytMJsP9lqxCtACvlsubcu7E8VBRZJlRUoxW9LgnpeRFg6o4s2Sq5gB59LUvPB
 nn5md8VrWcvrO4IXi+YtITHI6jM2rAtZStP9pR2sBQf5ovJHDG9WgvdhkEU5TFCkf/lN
 F+rOSWEZXUhndlufUbUAwclMPQ+qrRy1plJuSurVd8uR0/FPIXjZZzWcmkJB9uLhPHA4
 9ZFTvL71X3Vbe16nqdrziDsXG0wUdU4c/wgaJngBKRFp1ooWAHXPDhatqcwiLdQTF5ZA
 JyV665UNCWHwaHRbBD0oP80PJf7/zdDCG2eBNTyzqxNOj3r/IiwnS2Z4BGikm9BPzbFA
 GzRg==
X-Gm-Message-State: ABy/qLa82Rf747pGZM1awF8Esi6HDXEtR1xnP8z6csaPZm4T8pI9TpIL
 qNL5z2vrp9xKtKkfIDVJuYlhYTY2iiZMwSpnhmeWyYwa
X-Google-Smtp-Source: APBJJlHuBp5wgNzB1qH0TG9OfsWNIceOWbp17IWYyxztl3ysGx9fUxV/p9MHTinmCPyu4cvqKkmgUUFZchTq889dXzk=
X-Received: by 2002:a17:906:1054:b0:994:569b:61b0 with SMTP id
 j20-20020a170906105400b00994569b61b0mr2623263ejj.2.1689430835356; Sat, 15 Jul
 2023 07:20:35 -0700 (PDT)
MIME-Version: 1.0
References: <CAF23GwBA6R45968qDv4v-r+sKicjojVifqGsEDh8=F9RVkJ1Hw@mail.gmail.com>
In-Reply-To: <CAF23GwBA6R45968qDv4v-r+sKicjojVifqGsEDh8=F9RVkJ1Hw@mail.gmail.com>
From: Freelancer Intern <internfreelancer21@gmail.com>
Date: Sat, 15 Jul 2023 19:50:23 +0530
Message-ID: <CAJa=HVrHdoL3ZLUS-nmYXUxQd-MvLAG=NKm_rQsMnXObg8ZU-w@mail.gmail.com>
Subject: Re: [BUG]: Getting a unique connector name when identical displays
 are connected
To: SUNIDHI DIXIT <sdikshit786@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000d0781d06008744dd"
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--000000000000d0781d06008744dd
Content-Type: text/plain; charset="UTF-8"

I have also seen this case...

On Thu, Jul 13, 2023, 1:14 PM SUNIDHI DIXIT <sdikshit786@gmail.com> wrote:

> Hello all,
>
> This is regarding an issue I have encountered recently in drm. When I
> connect two identical HDMI display(with same resolution) there is no way to
> distinguish them uniquely.
>
> I looked into that and found that the connector id, and connector_type_id
> can be changed based on which connector appears first to the kernel.
>
> Is there any solution already implemented for this problem?
>
> I see following solution to this issue:
>
> Assigning a unique connector->name from drm_connector_init() and adding an
> api drmModeGetConnectorName().
>
> Please let me know what you think..
>
> Thanks in advance!
>

--000000000000d0781d06008744dd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">I have also seen this case...=C2=A0</div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jul 13, 2023=
, 1:14 PM SUNIDHI DIXIT &lt;<a href=3D"mailto:sdikshit786@gmail.com">sdiksh=
it786@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div=
 dir=3D"auto">Hello all,<div dir=3D"auto"><br></div><div dir=3D"auto">This =
is regarding an issue I have encountered recently in drm. When I connect tw=
o identical HDMI display(with same resolution) there is no way to distingui=
sh them uniquely.</div><div dir=3D"auto"><br></div><div dir=3D"auto">I look=
ed into that and found that the connector id, and connector_type_id can be =
changed based on which connector appears first to the kernel.</div><div dir=
=3D"auto"><br></div><div dir=3D"auto">Is there any solution already impleme=
nted for this problem?</div><div dir=3D"auto"><br></div><div dir=3D"auto">I=
 see following solution to this=C2=A0issue:</div><div dir=3D"auto"><br></di=
v><div dir=3D"auto">Assigning a unique connector-&gt;name from drm_connecto=
r_init() and adding an api drmModeGetConnectorName().</div><div dir=3D"auto=
"><br></div><div dir=3D"auto">Please let me know what you think..</div><div=
 dir=3D"auto"><br></div><div dir=3D"auto">Thanks in advance!</div></div>
</blockquote></div>

--000000000000d0781d06008744dd--
