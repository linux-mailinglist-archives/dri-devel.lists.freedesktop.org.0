Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 761745B2050
	for <lists+dri-devel@lfdr.de>; Thu,  8 Sep 2022 16:15:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0373710EB22;
	Thu,  8 Sep 2022 14:15:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CF0F10EB1E
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Sep 2022 14:15:22 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id b144so13276209pfb.7
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Sep 2022 07:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dowhile0-org.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=r7XJrRA3OEzMnfzsnavMA6D7vkPwDhHvgb1Bec7HWJc=;
 b=4U46p6GE6D6se0obhMUPa93J9GBnfrschxn7n+aQahJQamfSTbVtYY6dK4p1eHYzaQ
 Qs3Qvljn+n+H/p8RlNSlDpD6+mARPntg7YaP5DWgdfK+7xC+purW1bo1R+1UCf/HHSHQ
 CV3rYHPnrneUzefN94EQxZfyhR/dYCaUacTQuHRM5kV08fl7Rj9P6BnF7Jbl3NgGMwuu
 Ql6pbi/+xDcaY/ShVubsy6Z1XVs0uTySwbRVjsbvobunP/fsWAjvdrPqALw8Y795QLqS
 H8N5u+5q9FZzyMWTKgZOszl0kBahwDk7VSfzDvo8L6MQUuotlAourBG6zpL/U02GOgIW
 9AAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=r7XJrRA3OEzMnfzsnavMA6D7vkPwDhHvgb1Bec7HWJc=;
 b=IM2UeK6FLqv0HI92RTMNj+dmCyEGS/GrVKPpXCTY7BA7/jCXxfZp4LtZTv0BYa7/Q1
 MT8AFeJcUOxS6HfUauRrMTBP3kcgguPwfdvOjLrEXI7RIzbO667e6Ii667puE4RfSO9D
 Jbnu/Vdy9qJ4N/a2Lcmp8UkeIsDwpc0MJ/SYAvtEy0KC/PLRN9XlrBarbdvL9deCu30D
 rpbbUwzrjPTOpa9oFK3sQGKfFmVMfJXBZIX0ui/057G0MlYwdnGUDMW07G0+qS0BTkFm
 1vqXbcrr0tTKbkUTQyAKN+IrmaBIZPf2y6ces3yW7N/o2fbE9d+/ztEEnlQ4Rpmuj0eN
 BKxg==
X-Gm-Message-State: ACgBeo27cDynTTRkzOaezfFhbo1cCa3KNmNyGhs5SELzUUy+c/6tZbej
 eJaBwhg8nwLmh5lS10FmLnx/BcEIZUt/JErh2RH9E2kCuU4=
X-Google-Smtp-Source: AA6agR5wa0A254w6T/Whb1UStUkVBK95teLDJ55T3+aR9Mg3ru+49EW/svy11hrYxckKeB6adKO23teJAjZUVfNnkbk=
X-Received: by 2002:a62:168a:0:b0:535:ff3d:b68d with SMTP id
 132-20020a62168a000000b00535ff3db68dmr9217884pfw.86.1662646522208; Thu, 08
 Sep 2022 07:15:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220905222759.2597186-1-javierm@redhat.com>
In-Reply-To: <20220905222759.2597186-1-javierm@redhat.com>
From: Javier Martinez Canillas <javier@dowhile0.org>
Date: Thu, 8 Sep 2022 16:15:10 +0200
Message-ID: <CABxcv=mjP_p+ozfq7KTGE3aADzEJ3+dTDMGSAXKByXsDxhrHgA@mail.gmail.com>
Subject: Re: [PATCH v2] drm/ssd130x: Replace simple display helpers with the
 atomic helpers
To: Javier Martinez Canillas <javierm@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000057fc4f05e82b0f3d"
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--00000000000057fc4f05e82b0f3d
Content-Type: text/plain; charset="UTF-8"

On Tue, 6 Sep 2022 at 00:28 Javier Martinez Canillas <javierm@redhat.com>
wrote:

> The simple display pipeline is a set of helpers that can be used by DRM
> drivers to avoid dealing with all the needed components and just define
> a few functions to operate a simple display device with one full-screen
> scanout buffer feeding a single output.
>

Applied to drm-misc (drm-misc-next). Thanks!

Best regards,
Javier

--00000000000057fc4f05e82b0f3d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div>On Tue, 6 Sep 2022 at 00:28 Javier Martinez Canillas &lt;<a href=3D"ma=
ilto:javierm@redhat.com">javierm@redhat.com</a>&gt; wrote:<br></div><div><d=
iv class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-lef=
t:1ex;border-left-color:rgb(204,204,204)">The simple display pipeline is a =
set of helpers that can be used by DRM<br>
drivers to avoid dealing with all the needed components and just define<br>
a few functions to operate a simple display device with one full-screen<br>
scanout buffer feeding a single output.<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto"><span style=3D"w=
ord-spacing:1px;color:rgb(49,49,49)">Applied to drm-misc (drm-misc-next).=
=C2=A0</span><span style=3D"word-spacing:1px;color:rgb(49,49,49)">Thanks!</=
span></div><div dir=3D"auto"><span style=3D"word-spacing:1px;color:rgb(49,4=
9,49)"><br></span></div><div dir=3D"auto"><span style=3D"word-spacing:1px;c=
olor:rgb(49,49,49)">Best=C2=A0regards,</span></div><div dir=3D"auto"><span =
style=3D"word-spacing:1px;color:rgb(49,49,49)">Javier</span></div></div></d=
iv>

--00000000000057fc4f05e82b0f3d--
