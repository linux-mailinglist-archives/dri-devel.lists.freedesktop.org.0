Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A4CFD649A20
	for <lists+dri-devel@lfdr.de>; Mon, 12 Dec 2022 09:36:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1D7810E167;
	Mon, 12 Dec 2022 08:36:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x931.google.com (mail-ua1-x931.google.com
 [IPv6:2607:f8b0:4864:20::931])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D6AB10E15B;
 Mon, 12 Dec 2022 06:16:20 +0000 (UTC)
Received: by mail-ua1-x931.google.com with SMTP id x24so2902283uaf.4;
 Sun, 11 Dec 2022 22:16:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GsCAWYH/6Ly5RJfxqsLTMIE4sjnj1D21vsbYiQhM/Ms=;
 b=DaPNkFtO2K7zNU7T+6Bg2nDXLAtiOrhJflF2e2joCoAOijPEG0Xq98HlkfeKHaP0f0
 Im6Mn17X+e8pDWh/B0GATWxsy3bilElGn1xgOd5US9JAue4cvvy3A19pQnPSpmez/M/m
 6JZ5T5lhROrs1AXqJjuMSKPxtBtcs9hJ7ChAmu3SsTITSvZUzX6VOh8q+RPV5eex4Nyx
 O5u8PEFHvuyMFq4II0GCt6KomBp9DVIhHoCgvlcXtGJYec+gdDdPOrKihkCDFN7/kVFL
 u7ZrC+YS2WvnBxvJWSZLyUp1dzyzPBuWID67t9/XO+HZYgOKhV95Ma0R1eF4iNV2ASGV
 G4Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GsCAWYH/6Ly5RJfxqsLTMIE4sjnj1D21vsbYiQhM/Ms=;
 b=XncnxfTT5VutRInyl95OVMuWQBsh39O34oo6E9c5knE5zP3+kMhqwivIdf4WoF21Uc
 uyeWJnkatHnMh2jhcB6ylErfKj7iBtKDW7BGrO476X48oic3vakifdopfKuhlK4Q7An6
 BkvhKC8gmLT5Qbx7pT324sLuk0HJUHno6vuXlwfLFyVDeY5HxbERzHyRuC2kMaSYK27k
 l+UpkPijz1XuYj7uTv8U8FIJTmT84XWJ9ldON1oT+xCMdQLYx5nO/HUD0Tg2OdUuYhWe
 R457Bs2xr6/SJ6pMGaJnMXkdorgmzlBYbzB7nzxYR3xaKuivgVNCHVQGS7Nbi3wZT4N7
 ulTQ==
X-Gm-Message-State: ANoB5pmhqlkNkg7J3Q83rqUFvQuXBRCciMYCtOJLCwl15wel98YehnCz
 GHbPUeOH46g5taH3A7YYMqfBZAnCikOdFjisdx0=
X-Google-Smtp-Source: AA0mqf5ZxfTivUOs+Nd6gSoZKfIsopKCW+B8tfEdDExLqGNT305LE+CYvmVbfbJTGTlT9hUx0IozHTaZ2xYEuI2mENk=
X-Received: by 2002:ab0:7c3:0:b0:415:8954:bd51 with SMTP id
 d3-20020ab007c3000000b004158954bd51mr121871uaf.97.1670825779438; Sun, 11 Dec
 2022 22:16:19 -0800 (PST)
MIME-Version: 1.0
References: <20221211140905.752805-1-tegongkang@gmail.com>
 <CAOMZO5BoiKYJKhgQNW+=n-7KpEr_L8oj1zS2OcJR-B-NA0XqzA@mail.gmail.com>
In-Reply-To: <CAOMZO5BoiKYJKhgQNW+=n-7KpEr_L8oj1zS2OcJR-B-NA0XqzA@mail.gmail.com>
From: Kang Minchul <tegongkang@gmail.com>
Date: Mon, 12 Dec 2022 15:16:08 +0900
Message-ID: <CA+uqrQAyLcHKrooP7jFbu08+rngu8yuVZhSJQgGP7b9oO0gHgQ@mail.gmail.com>
Subject: Re: [PATCH] drm/etnaviv: Remove redundant dev_err()
To: Fabio Estevam <festevam@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Mon, 12 Dec 2022 08:36:13 +0000
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
Cc: David Airlie <airlied@linux.ie>, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Russell King <linux+etnaviv@armlinux.org.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

2022=EB=85=84 12=EC=9B=94 12=EC=9D=BC (=EC=9B=94) =EC=98=A4=EC=A0=84 3:18, =
Fabio Estevam <festevam@gmail.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> On Sun, Dec 11, 2022 at 3:02 PM Kang Minchul <tegongkang@gmail.com> wrote=
:
> >
> > Function dev_err() is redundant because platform_get_irq()
> > already prints an error.
> >
> > Signed-off-by: Kang Minchul <tegongkang@gmail.com>
> > ---
> >  drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 1 -
> >  1 file changed, 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/et=
naviv/etnaviv_gpu.c
> > index a31eeff2b297..097fa9034ee8 100644
> > --- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> > +++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> > @@ -1771,7 +1771,6 @@ static int etnaviv_gpu_platform_probe(struct plat=
form_device *pdev)
> >         /* Get Interrupt: */
> >         gpu->irq =3D platform_get_irq(pdev, 0);
> >         if (gpu->irq < 0) {
> > -               dev_err(dev, "failed to get irq: %d\n", gpu->irq);
> >                 return gpu->irq;
> >         }
>
> If the dev_err() line is removed, then the { and } should be removed as w=
ell.

Oh, I see.
I just sent patch v2 that reflects your feedback.

Regards,
Kang Minchul
