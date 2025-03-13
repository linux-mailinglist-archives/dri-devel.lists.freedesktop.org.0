Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A61EDA602E3
	for <lists+dri-devel@lfdr.de>; Thu, 13 Mar 2025 21:43:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 196EE10E94A;
	Thu, 13 Mar 2025 20:43:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="FgWvZno0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com
 [209.85.219.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6962410E93C
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Mar 2025 20:43:36 +0000 (UTC)
Received: by mail-yb1-f170.google.com with SMTP id
 3f1490d57ef6-e5dcc411189so1298832276.0
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Mar 2025 13:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1741898616; x=1742503416;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1VnjZC6vr5EXhWiQG8PDbTXzoInugv5bUtef8UzNIT4=;
 b=FgWvZno0J5LolwX4Zt9K4nKc4pOPrVCHMN/93ce7a9QFDXfJ2jnMHDEl1WDKXgHaGS
 ewkeLljn7Ak5DdTEtfkCUg52rMkuH6cpm8iu8WKkm98FKJuVL2KAa2ibRp2o3ZMDdB+t
 fnNwe7iK4EyjDub5I3LzsxJjR4/XVypFoESoU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741898616; x=1742503416;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1VnjZC6vr5EXhWiQG8PDbTXzoInugv5bUtef8UzNIT4=;
 b=M69TBah9ySF1BlOCI7Qa8P//wSb2B6WTKVDS6adcUEIjKGPaNLnk0sxmFoOZqCw6hz
 vex+ndLR669mmkFdEqp1lmxk0m4MTUUsZk3OjzDdQQWq5f1Dz0gtGgvKpz6/649NbP53
 dpwh/r2ZdmGIzroXUmQmU5fwxVa2FOfszxl5sAZRpXD4UAPGUvm482wGK/gczbVR4sO+
 QPmtkUrumd6U4NE2Cq60UCCbU6w2PU2fPJWCPgvsogVDgABHerwEKi3wZMKHiBjP8l4/
 zFFYil+pGbS4eP6pAxdkTECaLc8mutyOamVsM1rGIHWOqzQg6fdAjmpu1AsqDMoaNEa3
 LDVA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWMRpub2UPJJafenB44Pw7gmCZ4Ks1jFqLuc6/RNWSZng4TQYS+4Iz9nSXcnSCN2xerIw8/yQnFbC0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzmAYlFLQLlhrcVnYLe/hlwmjfkeyP9wF/R3DsEHlc+QyHOFbhb
 LLH2NYD4CUHFuupoBionxTQAp2m1erzOhHqXBJ/1aHwrW8Ma1AevmLy77vb/xiP95g2Xeh3VUPJ
 73PmM1ahxllm4jw0hgTbu0B6guw70ngl9OQphFg==
X-Gm-Gg: ASbGncufN1R/ycp9PsSmCvERJXSp9mN1sq7om38PBwCKJtAtGoXCrwNLFSOL3kyskwt
 Q4nLIhT04Jl+rgu3/99I1Ypx2z41rwoFxdQDt7PAuWWl/gMudYtCiL112xSz+LClhBtm2TGmwER
 gwyQC42WtT5MossXXfOOYSKNFIlpVyYMvuzcJ2Nw7ZGLPweZZvYphN0Wcm9Q==
X-Google-Smtp-Source: AGHT+IEEE4ZRBNeQADkkl6AKxkknaNJwbIuG665QnVzs56LBEdogUl2yhgopg+J6ZxgJ7v7x+mgi2noSX4lE2hICHLY=
X-Received: by 2002:a05:6902:284a:b0:e5d:b7d8:ad3b with SMTP id
 3f1490d57ef6-e63f6519314mr51690276.19.1741898615842; Thu, 13 Mar 2025
 13:43:35 -0700 (PDT)
MIME-Version: 1.0
References: <20250313-mxsfb_probe-fix-rollback-on-error-v1-1-ad2fb79de4cb@bootlin.com>
 <468c6352-3301-4f0b-a2d4-d6a013417a0e@suse.de>
In-Reply-To: <468c6352-3301-4f0b-a2d4-d6a013417a0e@suse.de>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Thu, 13 Mar 2025 21:43:24 +0100
X-Gm-Features: AQ5f1JoTykMqff1C-O-bh1Cbl3u9Tnh0pBlLKwre0Ge4smXB9EbXTEwKnEK0dhM
Message-ID: <CABGWkvqtj+05sdOuXg1WO99VNm9qdFgcYWEGuUPPZPoHZa6Dew@mail.gmail.com>
Subject: Re: [PATCH] drm/mxsfb: fix missing rollback on failure in
 mxsfb_probe()
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>, Marek Vasut <marex@denx.de>, 
 Stefan Agner <stefan@agner.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, 
 Michael Trimarchi <michael@amarulasolutions.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi All,

On Thu, Mar 13, 2025 at 3:40=E2=80=AFPM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
>
> Hi
>
> Am 13.03.25 um 15:25 schrieb Luca Ceresoli:
> > When aperture_remove_all_conflicting_devices() fails, the current code
> > returns without going through the rollback actions at the end of the
> > function, thus the actions done by drm_dev_alloc() and mxsfb_load() are=
 not
> > undone.
> >
> > Fix by using a goto statament, as done for the previous and following e=
rror
> > conditions.
> >
> > Fixes: c8e7b185d45b ("drm/mxsfb: Remove generic DRM drivers in probe fu=
nction")
> > Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> > ---
> > The offending commit is not yet merged into master, and even less in a
> > released kernel, so this does not need to go through stable.
> > ---
> >   drivers/gpu/drm/mxsfb/mxsfb_drv.c | 7 ++++---
> >   1 file changed, 4 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.c b/drivers/gpu/drm/mxsfb/=
mxsfb_drv.c
> > index c183b1112bc4e9fe4f3b048a2b6e4c98d1d47cb3..b4273e678d26dbc3dee2014=
266d61470da4e8010 100644
> > --- a/drivers/gpu/drm/mxsfb/mxsfb_drv.c
> > +++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
> > @@ -365,9 +365,10 @@ static int mxsfb_probe(struct platform_device *pde=
v)
> >        * located anywhere in RAM
> >        */
> >       ret =3D aperture_remove_all_conflicting_devices(mxsfb_driver.name=
);
> > -     if (ret)
> > -             return dev_err_probe(&pdev->dev, ret,
> > -                                  "can't kick out existing framebuffer=
s\n");
> > +     if (ret) {
> > +             dev_err_probe(&pdev->dev, ret, "can't kick out existing f=
ramebuffers\n");
> > +             goto err_unload;
> > +     }
>
> I must have missed that when I reviewed the patch. But this call should
> happen much earlier. right at the top of the probe function before
> drm_dev_alloc().

I had added the call to aperture_remove_all_conflicting_devices()
after mxsfb_load() to
keep the splash screen loaded by U-Boot. So, IMHO, it would be better
to add the
goto in case of an error rather than moving
aperture_remove_all_conflicting_devices()
to the beginning of the probe function.

Thanks and regards,
Dario

> Conflicting drivers need to be kicked out before
> setting up DRM. Could you please send a patch to move the call to the
> top? No extra cleanup would be required then.
>
> Best regards
> Thomas
>
> >
> >       ret =3D drm_dev_register(drm, 0);
> >       if (ret)
> >
> > ---
> > base-commit: f9f087d946266bc5da7c3a17bd8fd9d01969e3cf
> > change-id: 20250313-mxsfb_probe-fix-rollback-on-error-3074b9080f34
> >
> > Best regards,
>
> --
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Frankenstrasse 146, 90461 Nuernberg, Germany
> GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
> HRB 36809 (AG Nuernberg)
>


--=20

Dario Binacchi

Senior Embedded Linux Developer

dario.binacchi@amarulasolutions.com

__________________________________


Amarula Solutions SRL

Via Le Canevare 30, 31100 Treviso, Veneto, IT

T. +39 042 243 5310
info@amarulasolutions.com

www.amarulasolutions.com
