Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50479757ACC
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jul 2023 13:46:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F77710E313;
	Tue, 18 Jul 2023 11:46:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A613C10E313
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 11:46:06 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2b8413671b9so49648251fa.1
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 04:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=shruggie-ro.20221208.gappssmtp.com; s=20221208; t=1689680762; x=1692272762; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1kahMnjiGb0a+BAKQ+PGSCJLgK5Xwr5yNiHBFNUBoTw=;
 b=vyFCR+ny/btEupQuRxIlDOiNfd1dSyBqFLdX4PL1+tEBLB8u/WdH4NJjw3PcaUWz1D
 dNOyoFsRg/sRcROztZ06d6I8trHoDGC1eDldxrwPyo6hHr9Hz+gS6SaauPpSO05kfQd1
 LpVYQkSrnzvyyVgYbdy6sD9+TOVj/lncOrgYwLzM9Prgo0btROG8+EXEFtM9QLSzxeuW
 jn1o64Lk/UD2bh/lMDdOIP5QwnAL44frwEp+J4RjrReCLc318DTKEKn3UcTIp3RNzTrf
 foRHPNx0pR2jkjLtujeXjBaYsUbNwufufkUKdONnXJK50Htj9L14Gk2y5sopY8OxZ1kk
 Rsiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689680762; x=1692272762;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1kahMnjiGb0a+BAKQ+PGSCJLgK5Xwr5yNiHBFNUBoTw=;
 b=PD2Q+bXo8j/abqxRGaOzsSyDnSX0HAQpUbIqSpsrmfOM4GbbNBNXWmb4UkHWBY2iAj
 rDCOiEmjUf6DOzSoxt+3eE1c6n3nWtc6P7bMX6vp5IktPXJ/mcHPXWsdR+1jnsB6phen
 krxPRpVJyOOZksIgTfO6Wa1uF4/obdcwZHXyIcjJ4ObHWMnQWq3QpbI4CEjIrFxSo+x9
 hD3w49B0RnL/a1Vso/ZR2y/4u82YKkDLa2W4xZOZdjgvKLyJlgEr/vkw75U0HLZZyXHx
 BMFVutA/txvATbAJ6/VH2Y9QlVFiWjmfQxkAhFhw2E6ZwR3xWJsVH9WlnMAJ976h3Yrh
 SsLQ==
X-Gm-Message-State: ABy/qLabc6fol8sd0eVTGE9IRZhW2KaS05DLphzIyBgg6qnLr4y324Rt
 Xuj8sRdTm+q8O4bo8I9xHwnaeOWa0J2Oc/736vODUA==
X-Google-Smtp-Source: APBJJlHFP6SXU1NB/79g7oicNLEruyE/4c19mGoJXPpXQGAUSi9zbmzTwRjfkyxMvFrMCqcm+hhGqkWP5xVT9VedvN4=
X-Received: by 2002:a05:651c:233:b0:2b6:d47f:2a4 with SMTP id
 z19-20020a05651c023300b002b6d47f02a4mr5142113ljn.13.1689680762245; Tue, 18
 Jul 2023 04:46:02 -0700 (PDT)
MIME-Version: 1.0
References: <20190716131005.761-1-bogdan.togorean@analog.com>
 <20230718084215.12767-1-alex@shruggie.ro>
 <CAN6tsi5+WV65FSpuzjJY46beHU8SkOMYfZNS3DnXiVft_6MG4A@mail.gmail.com>
In-Reply-To: <CAN6tsi5+WV65FSpuzjJY46beHU8SkOMYfZNS3DnXiVft_6MG4A@mail.gmail.com>
From: Alexandru Ardelean <alex@shruggie.ro>
Date: Tue, 18 Jul 2023 14:45:51 +0300
Message-ID: <CAH3L5QoYgU7HVF-Dc2ZJVcK-paoxwh0ZHWWxBhYudm+Mjvt7tA@mail.gmail.com>
Subject: Re: [PATCH v3] drm: adv7511: Fix low refresh rate register for
 ADV7533/5
To: Robert Foss <rfoss@kernel.org>
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
Cc: neil.armstrong@linaro.org, andrzej.hajda@intel.com, jonas@kwiboo.se,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 nuno.sa@analog.com, bogdan.togorean@analog.com,
 Laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 18, 2023 at 11:50=E2=80=AFAM Robert Foss <rfoss@kernel.org> wro=
te:
>
> On Tue, Jul 18, 2023 at 10:42=E2=80=AFAM Alexandru Ardelean <alex@shruggi=
e.ro> wrote:
> >
> > From: Bogdan Togorean <bogdan.togorean@analog.com>
> >
> > For ADV7533 and ADV7535 low refresh rate is selected using
> > bits [3:2] of 0x4a main register.
> > So depending on ADV model write 0xfb or 0x4a register.
> >
> > Fixes: 2437e7cd88e8 ("drm/bridge: adv7533: Initial support for ADV7533"=
)
> > Reviewed-by: Nuno Sa <nuno.sa@analog.com>
> > Signed-off-by: Bogdan Togorean <bogdan.togorean@analog.com>
> > Signed-off-by: Alexandru Ardelean <alex@shruggie.ro>
> > ---
> >
> > Changelog v2 -> v3:
> > * https://lore.kernel.org/dri-devel/1c3fde3a873b0f948d3c4d37107c5bb67dc=
9f7bb.camel@gmail.com/T/#u
> > * Added my S-o-b tag back
> >
> > Changelog v1 -> v2:
> > * https://lore.kernel.org/dri-devel/20190716131005.761-1-bogdan.togorea=
n@analog.com/
> > * added Fixes: tag
> > * added Reviewed-by: tag for Nuno
> >
> >
> >  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 9 +++++++--
> >  1 file changed, 7 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu=
/drm/bridge/adv7511/adv7511_drv.c
> > index ddceafa7b637..09290a377957 100644
> > --- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> > +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> > @@ -786,8 +786,13 @@ static void adv7511_mode_set(struct adv7511 *adv75=
11,
> >         else
> >                 low_refresh_rate =3D ADV7511_LOW_REFRESH_RATE_NONE;
> >
> > -       regmap_update_bits(adv7511->regmap, 0xfb,
> > -               0x6, low_refresh_rate << 1);
> > +       if (adv7511->type =3D=3D ADV7511)
> > +               regmap_update_bits(adv7511->regmap, 0xfb,
> > +                       0x6, low_refresh_rate << 1);
> > +       else
> > +               regmap_update_bits(adv7511->regmap, 0x4a,
> > +                       0xc, low_refresh_rate << 2);
> > +
> >         regmap_update_bits(adv7511->regmap, 0x17,
> >                 0x60, (vsync_polarity << 6) | (hsync_polarity << 5));
> >
> > --
> > 2.41.0
> >
>
> This looks good, but I'm seeing some checkpatch style warnings, with
> those fixed feel free to add my r-b.

Thanks.
Will do.
May I ask what options you are using for checkpatch.pl?
I don't seem to get those warnings.
And I'm basing on an "exynos-drm-fixes"branch from here
   https://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git/
(I'll admit it may not be the correct branch)

# /scripts/checkpatch.pl
v3-0001-drm-adv7511-Fix-low-refresh-rate-register-for-ADV.patch
total: 0 errors, 0 warnings, 15 lines checked

v3-0001-drm-adv7511-Fix-low-refresh-rate-register-for-ADV.patch has no
obvious style problems and is ready for submission.


>
> CHECK: Alignment should match open parenthesis
> #32: FILE: drivers/gpu/drm/bridge/adv7511/adv7511_drv.c:791:
> +        regmap_update_bits(adv7511->regmap, 0xfb,
> +            0x6, low_refresh_rate << 1);
>
> CHECK: Alignment should match open parenthesis
> #35: FILE: drivers/gpu/drm/bridge/adv7511/adv7511_drv.c:794:
> +        regmap_update_bits(adv7511->regmap, 0x4a,
> +            0xc, low_refresh_rate << 2);
>
> total: 0 errors, 0 warnings, 2 checks, 15 lines checked
>
> NOTE: For some of the reported defects, checkpatch may be able to
>       mechanically convert to the typical style using --fix or --fix-inpl=
ace.
>
> Commit 1955dfe734e4 ("drm: adv7511: Fix low refresh rate register for
> ADV7533/5") has style problems, please review.
>
> NOTE: If any of the errors are false positives, please report
