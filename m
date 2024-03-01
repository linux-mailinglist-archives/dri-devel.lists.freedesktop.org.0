Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5563686DE3F
	for <lists+dri-devel@lfdr.de>; Fri,  1 Mar 2024 10:28:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B805B10EC3C;
	Fri,  1 Mar 2024 09:28:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tomeuvizoso-net.20230601.gappssmtp.com header.i=@tomeuvizoso-net.20230601.gappssmtp.com header.b="qGsJXO0J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com
 [209.85.128.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EAE810EC3C
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Mar 2024 09:28:01 +0000 (UTC)
Received: by mail-yw1-f172.google.com with SMTP id
 00721157ae682-60925d20af0so20051587b3.2
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Mar 2024 01:28:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tomeuvizoso-net.20230601.gappssmtp.com; s=20230601; t=1709285280;
 x=1709890080; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Q8qW88cphawb78fzlQE30+dz9GpFORGHSZEKQV6kMnE=;
 b=qGsJXO0JT+sOdGPRM1Af6eNOJm8aD8qjrqmXd/x3V33Zy07Vytoho1Jo/hQc17Kj6+
 3nNRxO6i2od5antr0uqZhIH7kcaWwumKfsmM9jILNIOn0GopdfflVWXtMHULalOaCNb8
 KoZ/3PF8I9D62LxB81GTRmkhKLl8qMCt9EijGK1lD4PH9eEtYelSBrsFUWRkrAk1LyOD
 EZSJtbdJuWMCkupFyj8mr9qLHpK/TargRKHLJmdirsrnu3mg6vvjGo3+FED5JjLDkh35
 r1TDtcxOdApDARsEDRQSEy5n55ManfhiMP3yi5u35DEefrHlIvCjJLNhWbyE3zd8V3NV
 AHTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709285280; x=1709890080;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Q8qW88cphawb78fzlQE30+dz9GpFORGHSZEKQV6kMnE=;
 b=Zwf2z8kaywPFyAEXv9lrnFRXzC55Bf0sH7/ta7fFD7EDcMQaHcL+/xc+dbwxUKOOzF
 13vIb6W6uUg536SWVOHfO1nlq9Gd69/Na4o9sgMSGESZ//EQe/jSVumti8Tcikj5K2EZ
 MtcmRHwK7qxU4tYFZF8JOB2BMIybdlIcfsRO4xiFcAMDiBynJKi0aGhuTlRnlIx/MH1H
 7kew0lGfXQr0YUGNEQZDdAkPhbo8tbMPBqDutjQmXZ/m3Pw/GFE36jMC+JgMTEIgn6EV
 egXn4Xv3hHPVNYTM/rU/t3M41PuVh5JtMfYFBYPt5pElst063/CQjPRv7wf2wegMvbCm
 f4Qw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWJYok9bpYQNo1BMSYIZgpkw3Qs7CdOP0zrR125/FID1alv+bFI7zV/ryhAdLC5J3JnDVljUPGMUu7V2H03WPR96wa9Pp74d+avwPjFw1YB
X-Gm-Message-State: AOJu0Ywg02/PlCwoT5wTPHtCMkIill0cPmKpxuBd9mIsc5NjrPYRHzX7
 SAdOqlSgdOeY/vWjWKWNfr3y93hsKtnls2v6Gnqx7qFnQZrG9FlkrbrLrRCTIZsV6qBDPCAqxwe
 pzRYAEQ==
X-Google-Smtp-Source: AGHT+IGsTn2TWpbJAfHhfKk3WnR3D7Npabl1838tl0WKScxLVoMeC+gxxFYTQSIYZJaJzjk5A8vXpg==
X-Received: by 2002:a81:4fc3:0:b0:604:9262:4a4c with SMTP id
 d186-20020a814fc3000000b0060492624a4cmr1018393ywb.28.1709285279741; 
 Fri, 01 Mar 2024 01:27:59 -0800 (PST)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com.
 [209.85.219.175]) by smtp.gmail.com with ESMTPSA id
 t1-20020a81e441000000b00607af248292sm847350ywl.49.2024.03.01.01.27.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Mar 2024 01:27:59 -0800 (PST)
Received: by mail-yb1-f175.google.com with SMTP id
 3f1490d57ef6-dcc4de7d901so1854836276.0; 
 Fri, 01 Mar 2024 01:27:59 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWqWQmbqlK3xmsXaTDpGCB9/1IVljbsBEoeJI0nbGQpwkFwHQKAEj0sKBfEV4+HmIamjsqaMJyBBch1dYbuiNQ6NkHVIn3azzRIw9KVIr/T/wnwNUcg+CT+lYWCFT+1YInel9t2mJOl6LtaYem0ng==
X-Received: by 2002:a05:6902:3:b0:dbd:5bfa:9681 with SMTP id
 l3-20020a056902000300b00dbd5bfa9681mr791205ybh.37.1709285279107; Fri, 01 Mar
 2024 01:27:59 -0800 (PST)
MIME-Version: 1.0
References: <20240229195532.7815-1-christian.gmeiner@gmail.com>
In-Reply-To: <20240229195532.7815-1-christian.gmeiner@gmail.com>
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Fri, 1 Mar 2024 10:27:47 +0100
X-Gmail-Original-Message-ID: <CAAObsKBEV0q78CFmy1ezwKLQEY0hLDn4ct0UxedGKVZM7tCKeg@mail.gmail.com>
Message-ID: <CAAObsKBEV0q78CFmy1ezwKLQEY0hLDn4ct0UxedGKVZM7tCKeg@mail.gmail.com>
Subject: Re: [PATCH] etnaviv: Restore some id values
To: Christian Gmeiner <christian.gmeiner@gmail.com>
Cc: Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Christian Gmeiner <cgmeiner@igalia.com>, stable@vger.kernel.org,
 etnaviv@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

On Thu, Feb 29, 2024 at 8:55=E2=80=AFPM Christian Gmeiner
<christian.gmeiner@gmail.com> wrote:
>
> From: Christian Gmeiner <cgmeiner@igalia.com>
>
> The hwdb selection logic as a feature that allows it to mark some fields
> as 'don't care'. If we match with such a field we memcpy(..)
> the current etnaviv_chip_identity into ident.
>
> This step can overwrite some id values read from the GPU with the
> 'don't care' value.
>
> Fix this issue by restoring the affected values after the memcpy(..).
>
> As this is crucial for user space to know when this feature works as
> expected increment the minor version too.
>
> Fixes: 4078a1186dd3 ("drm/etnaviv: update hwdb selection logic")
> Cc: stable@vger.kernel.org

Oops.

Reviewed-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>

Cheers,

Tomeu

> Signed-off-by: Christian Gmeiner <cgmeiner@igalia.com>
> ---
>  drivers/gpu/drm/etnaviv/etnaviv_drv.c  |  2 +-
>  drivers/gpu/drm/etnaviv/etnaviv_hwdb.c | 14 ++++++++++++++
>  2 files changed, 15 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etna=
viv/etnaviv_drv.c
> index 6228ce603248..9a2965741dab 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> @@ -494,7 +494,7 @@ static const struct drm_driver etnaviv_drm_driver =3D=
 {
>         .desc               =3D "etnaviv DRM",
>         .date               =3D "20151214",
>         .major              =3D 1,
> -       .minor              =3D 3,
> +       .minor              =3D 4,
>  };
>
>  /*
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_hwdb.c b/drivers/gpu/drm/etn=
aviv/etnaviv_hwdb.c
> index 67201242438b..1e38d66702f1 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_hwdb.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_hwdb.c
> @@ -265,6 +265,9 @@ static const struct etnaviv_chip_identity etnaviv_chi=
p_identities[] =3D {
>  bool etnaviv_fill_identity_from_hwdb(struct etnaviv_gpu *gpu)
>  {
>         struct etnaviv_chip_identity *ident =3D &gpu->identity;
> +       const u32 product_id =3D ident->product_id;
> +       const u32 customer_id =3D ident->customer_id;
> +       const u32 eco_id =3D ident->eco_id;
>         int i;
>
>         for (i =3D 0; i < ARRAY_SIZE(etnaviv_chip_identities); i++) {
> @@ -278,6 +281,17 @@ bool etnaviv_fill_identity_from_hwdb(struct etnaviv_=
gpu *gpu)
>                          etnaviv_chip_identities[i].eco_id =3D=3D ~0U)) {
>                         memcpy(ident, &etnaviv_chip_identities[i],
>                                sizeof(*ident));
> +
> +                       /* Restore some id values if ~0U aka 'don't care'=
 is used. */
> +                       if (etnaviv_chip_identities[i].product_id =3D=3D =
~0U)
> +                               ident->product_id =3D product_id;
> +
> +                       if (etnaviv_chip_identities[i].customer_id =3D=3D=
 ~0U)
> +                               ident->customer_id =3D customer_id;
> +
> +                       if (etnaviv_chip_identities[i].eco_id =3D=3D ~0U)
> +                               ident->eco_id =3D eco_id;
> +
>                         return true;
>                 }
>         }
> --
> 2.44.0
>
