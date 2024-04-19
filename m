Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B6038AADAE
	for <lists+dri-devel@lfdr.de>; Fri, 19 Apr 2024 13:28:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B616310E5F0;
	Fri, 19 Apr 2024 11:28:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="eYMdwXiA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0C2E10E5F0
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Apr 2024 11:28:41 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id
 4fb4d7f45d1cf-571c22d9de4so1976429a12.3
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Apr 2024 04:28:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1713526120; x=1714130920; darn=lists.freedesktop.org;
 h=in-reply-to:references:subject:cc:to:from:message-id:date
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=3vJkoh0Y88E8xelvHUeCB5ZFGBjLcpHSC6lZET6ARl0=;
 b=eYMdwXiAn04fxU/Ktdu1oAx/iZSqTw5CHnCUs6/oRJEEtwn+XXB7Smhshx+0pABcw2
 7fCMLcHArF4/sbdmpZJr6JWLy0NEzJH53CVZ5mlERcnA9ktTrP5p58hwlIf1xb946od2
 FJdq3LFL3uyjjU9xQtTY4Nu6Q1JUZOmPMGQARriQS39yuW6m5YGR4n0H/F5i0FJYjGuw
 lbt6z9RTWB0K91Uh3i7hXxooHnb6yD8s8SdBk4R3i4/ga0LHCb3P7szX2ivB810HmPMd
 0uBZOli+cBRIm96ibn9Q+PpPE8FbRdyQbmlK15cymgVSK7K7oUPVexaCJQsIbD2Fqrtw
 5TUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713526120; x=1714130920;
 h=in-reply-to:references:subject:cc:to:from:message-id:date
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3vJkoh0Y88E8xelvHUeCB5ZFGBjLcpHSC6lZET6ARl0=;
 b=HFyUIdMf+WX3P4/S+QaFuB436cdWD4O6S+JxKdAqsxRyXsxQPCUfDEe+ZZfzQa1FJn
 JUTixH6L8Cx5WtWL3qEQuP8VWNTMkxaLhfF8To/WsGEAEZQ8RssMsPQoBY6XcWSODHst
 5bsdRhboEBEQWmbk4E8riduqZpRUqaESkGDse0DywfCHaHg/zDDSPnT4TmEZRl4Z3rcc
 3n+sxQG3eTnYoT/xznT0YceeymG0zkJrYFNnQTYlr2QRQuSqMXrzSZeSliiYRqG+fE8i
 x/QCPFSxYcL0DQJp4pBVPeEjV42e1BRlvlHwuURpITuZtq22UNxPlYeXDpYIqQrcHYQ0
 MZig==
X-Forwarded-Encrypted: i=1;
 AJvYcCU4Tb6cwwUbmcXMn/V2XDFQKvXvqrHAqMjXHCCuiburX7CDyfPaxPKj6pwCLVr7KUzUuuK8KJL1CH8sxzduqVqvIgJsbKF4ApGxEUqnShRr
X-Gm-Message-State: AOJu0YyhJpOBv56EPKGN5CvK2gRHKD/hY7ZeQsRbz/6PCYuvfthXfbA9
 HnmOAuJu7v5P9tjfEMclEe/bSikxJFjBV0hGJNz22Wh4kxDQ7a1z
X-Google-Smtp-Source: AGHT+IFKiwmp4FLKAWcTXgidfN19IfMXqqvkx3T/mYwog55rvnWpsnKvb8Yadb5rRXuT3dRv4qU4Xg==
X-Received: by 2002:a17:906:2a4b:b0:a52:1770:965 with SMTP id
 k11-20020a1709062a4b00b00a5217700965mr1248210eje.42.1713526119786; 
 Fri, 19 Apr 2024 04:28:39 -0700 (PDT)
Received: from localhost
 (p200300e41f162000f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f16:2000:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 bi14-20020a170907368e00b00a5588ed8fa2sm552797ejc.113.2024.04.19.04.28.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Apr 2024 04:28:39 -0700 (PDT)
Content-Type: multipart/signed;
 boundary=cd669ce6bdd8f9700a6a46cb06d3d090071a64c757641859cb60bdf1475c;
 micalg=pgp-sha256; protocol="application/pgp-signature"
Mime-Version: 1.0
Date: Fri, 19 Apr 2024 13:28:38 +0200
Message-Id: <D0O2BBOL89ME.QEWHYL0GV4MY@gmail.com>
From: "Thierry Reding" <thierry.reding@gmail.com>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 "David Airlie" <airlied@gmail.com>, "Daniel Vetter" <daniel@ffwll.ch>
Cc: "Frank Binns" <frank.binns@imgtec.com>, "Matt Coster"
 <matt.coster@imgtec.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 "Chun-Kuang Hu" <chunkuang.hu@kernel.org>, "Philipp Zabel"
 <p.zabel@pengutronix.de>, "Matthias Brugger" <matthias.bgg@gmail.com>,
 "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>,
 <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, "Mikko Perttunen"
 <mperttunen@nvidia.com>, <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH 0/4] gpu: Convert to platform remove callback returning
 void
X-Mailer: aerc 0.16.0-1-0-g560d6168f0ed-dirty
References: <cover.1712681770.git.u.kleine-koenig@pengutronix.de>
 <xqwcrxfrg3ogplh35c5etl6nbzw6zueilm4h6euh7bnpszyir4@6dtn5qdvijv3>
In-Reply-To: <xqwcrxfrg3ogplh35c5etl6nbzw6zueilm4h6euh7bnpszyir4@6dtn5qdvijv3>
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

--cd669ce6bdd8f9700a6a46cb06d3d090071a64c757641859cb60bdf1475c
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Fri Apr 19, 2024 at 9:20 AM CEST, Uwe Kleine-K=C3=B6nig wrote:
> Hello,
>
> On Tue, Apr 09, 2024 at 07:02:47PM +0200, Uwe Kleine-K=C3=B6nig wrote:
> > with some patches sent earlier[1], this series converts all platform
> > drivers below drivers/gpu to not use struct platform_device::remove()
> > any more.
> >=20
> > See commit 5c5a7680e67b ("platform: Provide a remove callback that
> > returns no value") for an extended explanation and the eventual goal.
> >=20
> > All conversations are trivial, because the driver's .remove() callbacks
> > returned zero unconditionally.
> >=20
> > There are no interdependencies between these patches. This is merge
> > window material.
>
> I wonder how this series will make it in. While I would prefer these
> patches to go in together (that I can consider this thread completed in
> one go), I think with how drm maintenace works, it's best if the patches
> are picked up by their individual maintainers. I guess that's:
>
>  - Frank Binns + Matt Coster for imagination
>
>  - Chun-Kuang Hu + Philipp Zabel for mediatek
>
>  - Thierry Reding + Mikko Perttunen for the host1x driver
>    (Note there is another patch for this driver set at
>     20240409165043.105137-2-u.kleine-koenig@pengutronix.de that is
>     relevant for the same quest.)
>
>  - Philipp Zabel for ipu-v3
>
> I plan to send a patch changing struct platform_driver::remove after the
> end of the merge window leading to 6.10-rc1 for inclusion in next via
> Greg's driver core. So please either care the patches land in 6.10-rc1
> or ack that I include them in the submission to Greg.

I think the latter would make more sense. I'll go ack those patches.

Thierry

--cd669ce6bdd8f9700a6a46cb06d3d090071a64c757641859cb60bdf1475c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmYiVWcACgkQ3SOs138+
s6EMWxAAuBhTV9ovczgI1JfXW9dVlwEMXj4ZN4Wo303HNjKbzE/U9v17jp2EZP+t
s35e09Yav10cM7qTAnoTkHG/O7TbJ1j1eFN0dYuog+C28+u3a7FKYFzjxrDdohFD
nWXufe9EklSmTeDiA9LVY/hQgiebLT6zHLh4QxIPwhE2HpnZcT9JOq5Q95w9HYY+
wMSiJ0eQCGLCWgtDGZoWtCPNkp39ViRF59soniQuEHhm5pXc5eFfYbUOP940CJ44
8UWu69np3LlX7Gx0TMaqIuzlBWaG+MfU7vBI7hnyA5VgSjcuT0iEJwFW6lZAeBgm
I4h1xdDIMbrHoVIXqj81dZWFTCO6FILwyb7X1sEKAWqN/axoa6C/PPt4UrURzPfD
mMiWc006q+mYajFqk2S31q/WBfssrmC4F4boDphofmJHmsKT0z9Oj8jCpPM8+RHP
lpATu13Rq+zzNIGeqpodAvPEQrX8QGpE9xxncQwWPiXJ7PnG1UdZoiERW5hdE8zN
XcaZB7crWn1A0NbseWFFAb09WoPQmvR2JIO8gzsQ1a9CKs0UK4O8UNlfwnJp7suo
TkG+kqH5kUunGRVpvJbF9sS7raVtB0HRN28xWCY/jFpd0nmfi1tcfxcLBJhDBLRS
KtLx+oMwRhWxpalupIX1hLGY+QmcLxEi4tjYfCd/vHRoAShnV0Y=
=abck
-----END PGP SIGNATURE-----

--cd669ce6bdd8f9700a6a46cb06d3d090071a64c757641859cb60bdf1475c--
