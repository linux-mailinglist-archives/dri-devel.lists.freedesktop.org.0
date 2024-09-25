Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1919C985CFE
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2024 14:58:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3713B10E0CA;
	Wed, 25 Sep 2024 12:58:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="AZVJDMmD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 996DD10E0CA
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2024 12:58:54 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-374ba78f192so4746791f8f.3
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2024 05:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727269133; x=1727873933; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=J1XJnhqq2OIsxXJzV7ym7OJSz2cacK1ZAV5wGYiQpu0=;
 b=AZVJDMmDVjXZEVUk2RclKbxW3mk/Wg0BXkEkiANkTLTWLcMTv1Bl+exHuXRIrQn+sb
 i8UwAB0Zd1eUVq9Ix5DCkMTQ9YzFFKBpNMIzYIGrP/KkB1kB6f3lE+siV2yfla4Ns40J
 MMoymRsL8jE7KK/JS/58e35SmIfykCibzwA7VmktRwYEJsazTDxVaoZ0mVJntA5/wRNU
 gIS0ZQmqRid0X0qvZt1+MfeqVX4QtxTv41RAJauFaQxfEZ+Ijm8vSwVt64v5J44voPLw
 gQtOE7RyHzrsVP9OTSMljrqmCB2p50I1Ik0T/6iExHmLuhs5hTrvOH6g5jUDnPt0o73h
 3swQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727269133; x=1727873933;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=J1XJnhqq2OIsxXJzV7ym7OJSz2cacK1ZAV5wGYiQpu0=;
 b=nYSTcUPiPc3RJ1enQMyDSk1sHroQmTWwPRzuiACgilc1O6NoVa5g1vfQE4+aPzdD0b
 fvnKmCSH2FOPGtwNwW+TobmaSamYrbNEYo/y6LB8bP05c3vg6gUTehJjJO7qQ8XlnQyK
 9vZYaioCSQUZaK5Dggfq2ZXCMCfYOQO3rAp4DeyQDPKbvHHGgv+eA75r3y3m4+9B5vMq
 NVH4tnkbLwgvqzMFR5dNo2JaWrjPZQyoMc/FftQhtsgFmqfIQy2OXqcl+6dYR4EoLqLI
 6AnBLHW7osWo/xWs/WGt1vPvYtYxgshtr4qwx9lu+k97iuWzHyYdaX1K0/dsa2mSDMNe
 oN+w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXCxqSNeO2RUYrIHFBCErGNG/P5X0J+pol7+rNY3i2iZQIMJei6qsTcm3gRglH/vpJTouL2LwuHCIc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy3IxNwDecKZw5MuHkudbv0ycJPHMNfOowZzZmRMndJzegptrIW
 jBG3VL2D2IYIYw8RUtLcNOW3e+GTh3ueSbGVXfGFSAPsrAYs2tg95P9U/A==
X-Google-Smtp-Source: AGHT+IHRHm8+liHKXUKRB0InXsm5LIUqNcGUyVFyJw6CMr61V79XcSVCKGwlzWTJOGOgcMO7kThCKQ==
X-Received: by 2002:a5d:5f85:0:b0:374:c92e:f69f with SMTP id
 ffacd0b85a97d-37cc2468e66mr2384982f8f.16.1727269132552; 
 Wed, 25 Sep 2024 05:58:52 -0700 (PDT)
Received: from orome (p200300e41f147300f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f14:7300:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37cbc2a8c1csm3998501f8f.11.2024.09.25.05.58.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Sep 2024 05:58:51 -0700 (PDT)
Date: Wed, 25 Sep 2024 14:58:50 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Mikko Perttunen <cyndis@kapsi.fi>, 
 Mikko Perttunen <mperttunen@nvidia.com>, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org
Subject: Re: [PATCH] gpu: host1x: Request syncpoint IRQs only during probe
Message-ID: <tsq6hbbeyxu5uqasx6jijijvxfomnxj4c2qakf7lmd2eut2zbk@z72tkzlzlfu6>
References: <20240531070719.2138-1-cyndis@kapsi.fi>
 <f0720898-aadc-4e98-9369-05ec5821414f@nvidia.com>
 <18b6c018-618d-42e6-81f4-48bfb4eba206@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="4vblk4xct4vaq62s"
Content-Disposition: inline
In-Reply-To: <18b6c018-618d-42e6-81f4-48bfb4eba206@nvidia.com>
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


--4vblk4xct4vaq62s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 24, 2024 at 07:33:05PM GMT, Jon Hunter wrote:
>=20
> On 06/09/2024 09:38, Jon Hunter wrote:
> > Hi Mikko,
> >=20
> > On 31/05/2024 08:07, Mikko Perttunen wrote:
> > > From: Mikko Perttunen <mperttunen@nvidia.com>
> > >=20
> > > Syncpoint IRQs are currently requested in a code path that runs
> > > during resume. Due to this, we get multiple overlapping registered
> > > interrupt handlers as host1x is suspended and resumed.
> > >=20
> > > Rearrange interrupt code to only request IRQs during initialization.
> > >=20
> > > Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
>=20
> ...
>=20
> > This change is causing a boot regression on Tegra186 with the latest
> > -next. I have reverted this to confirm that this fixes the problem. I
> > don't see any crash log but the board appears to just hang.
>=20
>=20
> I had a look at this and I was able to fix this by moving where
> we initialise the interrupts to after the PM runtime enable ...
>=20
> diff --git a/drivers/gpu/host1x/dev.c b/drivers/gpu/host1x/dev.c
> index b62e4f0e8130..ff98d4903cac 100644
> --- a/drivers/gpu/host1x/dev.c
> +++ b/drivers/gpu/host1x/dev.c
> @@ -625,12 +625,6 @@ static int host1x_probe(struct platform_device *pdev)
>                 goto free_contexts;
>         }
> -       err =3D host1x_intr_init(host);
> -       if (err) {
> -               dev_err(&pdev->dev, "failed to initialize interrupts\n");
> -               goto deinit_syncpt;
> -       }
> -
>         pm_runtime_enable(&pdev->dev);
>         err =3D devm_tegra_core_dev_init_opp_table_common(&pdev->dev);
> @@ -642,6 +636,12 @@ static int host1x_probe(struct platform_device *pdev)
>         if (err)
>                 goto pm_disable;
> +       err =3D host1x_intr_init(host);
> +       if (err) {
> +               dev_err(&pdev->dev, "failed to initialize interrupts\n");
> +               goto pm_put;
> +       }
> +

I think the reason why this might fail now is because host1x_intr_init()
ends up writing some registers during the call to the
host1x_hw_intr_disable_all_syncpt_intrs() function, which would hang or
crash if the device isn't on (which in turn happens during
pm_runtime_resume_and_get()).

Not sure exactly why this used to work because prior to Mikko's patch
because the sequence was the same before.

>         host1x_debug_init(host);
>         err =3D host1x_register(host);
> @@ -658,14 +658,11 @@ static int host1x_probe(struct platform_device *pde=
v)
>         host1x_unregister(host);
>  deinit_debugfs:
>         host1x_debug_deinit(host);
> -
> +       host1x_intr_deinit(host);
> +pm_put:
>         pm_runtime_put_sync_suspend(&pdev->dev);
>  pm_disable:
>         pm_runtime_disable(&pdev->dev);
> -
> -       host1x_intr_deinit(host);
> -deinit_syncpt:
> -       host1x_syncpt_deinit(host);
>  free_contexts:
>         host1x_memory_context_list_free(&host->context_list);
>  free_channels:
>=20
>=20
> Thierry, do you want to me to send a fix for the above or do you
> want to squash with the original (assuming that OK with Mikko)?

In any case, this looks like a good fix, so please send a proper patch.
This is merged through drm-misc, so squashing this into the original
patch is not an option any longer.

Thanks,
Thierry

--4vblk4xct4vaq62s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmb0CQcACgkQ3SOs138+
s6F4kw/8CFaMLKgI88knlMkHLGoEl3VY7lPbJEDoeHEsS2AIvBdDxtmoAMqGpc6A
/Ezs//MV/In2c/Ri5XF6WnK2+axWL2SypmiuGEypul4fD7LToyYtcllRFIpQ+Hnz
jbuD8UIPvLf/Um78X6uqmQQUm6R2O7mgMfheVdhv6bR5IxCn3r2iGRMxeukn3kbo
htBrnraFNtcEZ8V+qIi3WMZdgFb+QndL6RL9MvDXWNMog5TwBl4nvanS+gfgv93u
CxJkZMaecM67kPxmE4/T1bc2VZ8WijI0D7UyANV+jH3NCmZJtr0mNOFaChkXzY/e
gfzoraIp01qXSluOz3oilwZ/B4A/21X3J/9XKw7zQMOb0Dv72hgCR1Z5qbOKXHoe
bE7kt2Zmcx+cqNvmE7zJ/jaBPld1kP1grE7lW1/tztKyl/NHnOBTe4Cr/ilgzseI
cqR74D9AOLvtaDPbTsmPTS6GxNH/iTJwvHzAJvnaqUNYGh2hzcf+Pj/hNveUMPKQ
eZ4Au8RhRNYfq9v48IjpFF422mpc5lNGIyj0yaFjLj4aAoPiqZiYMMfThGOebd+y
jnh2gFp/vI++TAiaY6IxcrmMOALQTx03t3mmQIFVMlNwBb4u4BKEIXJdncT32Yuq
CqBChZv5ktN2IE7SScebB54ElUc+ieh+97hjWMeNJYay+9vmKuw=
=drRG
-----END PGP SIGNATURE-----

--4vblk4xct4vaq62s--
