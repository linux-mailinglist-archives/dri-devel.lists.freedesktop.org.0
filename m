Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 551FEA21F67
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2025 15:41:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2E9710E808;
	Wed, 29 Jan 2025 14:41:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ORB1RihA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03A1910E808
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2025 14:41:39 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-4363ae65100so77610685e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2025 06:41:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738161698; x=1738766498; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=zSEV+em0N0SfQE1alVhrq6tX6ofwmLyBx4bRZxI20Mc=;
 b=ORB1RihAGvQN9+Nx2ynmaGBdbFIkq0GEjurqrXKa3xxmKkq2B1T1WlHITv06AGE6VC
 aoVmUoAB2ikS28sUoQskfZqtWjE/4tK9VTUbTp7wKd9JnaOPDZj4VUVTJUK3BKgoKNZV
 i3WwSzG/ldUID7Nj3FDt8OmOho3luEFZBYN/2JGqaIQbkLhE/nePAMdwSnis9cWBi9DM
 ESmr5nXO6hxJix7UgJSp2+mVkbu/y+4RqUNNMkaGNo/5rtwYQhoLBMphItwfaxBZdjQc
 /CJKGEsEnclNK+okSy6CawGyBiarqpQEEvnAE9/wM+ymgzD/38omvvN/8Cbgem3bTlfc
 pC9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738161698; x=1738766498;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zSEV+em0N0SfQE1alVhrq6tX6ofwmLyBx4bRZxI20Mc=;
 b=VCr5tjwsguJrj+S10nj+GYs2CAh78VjmJ31d2x8x7yybGj/Cd1BZCnxZ5L12MMczVH
 teIBDnFVLk0Sz9CgHGTI7B1lv78XnVHIOwCa4kCbJA00CU6dp69EFmj3VihXC8jKm/Le
 mJJB+OCztwYdF0gOgSEHOqNno5YCGHywAoMG/SQvWZeC8x2YYsacemojULzIq14ytCbv
 Q5nJDZyIiCx916avb4SIiAQ7JfpXKDUvtMgN+WZRyTkG4WtHP81LQcuGEudhXr+2c7eQ
 MSHJYbV/kIA5fDkrPiNYXxoSnQIHj4RMsxlalNNs77X4lRXom+8jhDH+leVmmJDrv84A
 biOA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUxbzbjwFvyTUh2U971yH2MwSyHb/+DbLsBolHmFaaJiUHC7P6uL6DCufrH6yXOAG60/Vmy/EXu+vo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyU1G5CbPWiNU4Z4+HFkqvS/6TFjo22RovNXjBhwl4lrdwj+NqQ
 91nmW6hW0W6aPgDrR6b+FVzVAzrAltkB4M5X+H/jqMdnba39xbYB
X-Gm-Gg: ASbGncu7cbPIbtJINwhyMe6A4JXoXzaJe77AnFxZH+aX5LzkjpKYdoVmYMcErur8xnh
 xdlCuxm9oP/i6XmF0RAqbbT1WLX4tu8r1niVQZDNjD+GzC2VNxxoISjzlDeVh7+DtVxQzuAfy/w
 k0d3IgmTqezT+DFofEaVwnu1r+miiSHS/+9GhZ71bZCd0d7QWfXVv2ZK2AR/023TdK4pavbPnIG
 NCzlqNStCqTbJjvbNz9NyHjSeyH4V5qcCdv+Ar5I5gwkcRDijpDeivo2sINcfcBG9JOPPeDtChj
 DfooJ7b6onxf5RbFr8BtTpiwh5lfxTElIUK0613oFxLLrYubv0sp2LUjHPUiNLGXt0SoT7aiLer
 lNA==
X-Google-Smtp-Source: AGHT+IGdWBqWeiv+jbIoBfzm7k0/2DrarU7EXB90OvgtRbMeVkAoe8ODcFAhL4eNP6mW3P0r12bwJA==
X-Received: by 2002:a05:600c:4e07:b0:436:e86e:e4ab with SMTP id
 5b1f17b1804b1-438dc4353e7mr35398335e9.30.1738161698102; 
 Wed, 29 Jan 2025 06:41:38 -0800 (PST)
Received: from orome (p200300e41f281900f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f28:1900:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438dcc2b1d9sm24718285e9.21.2025.01.29.06.41.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jan 2025 06:41:36 -0800 (PST)
Date: Wed, 29 Jan 2025 15:41:32 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, 
 Anusha Srivatsa <asrivats@redhat.com>, Joel Stanley <joel@jms.id.au>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Stefan Agner <stefan@agner.ch>, Alison Wang <alison.wang@nxp.com>, 
 Xinliang Liu <xinliang.liu@linaro.org>, Tian Tao <tiantao6@hisilicon.com>, 
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, 
 Yongqin Liu <yongqin.liu@linaro.org>, John Stultz <jstultz@google.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Marek Vasut <marex@denx.de>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Sandy Huang <hjc@rock-chips.com>, 
 Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>, 
 Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, Alain Volmat <alain.volmat@foss.st.com>, 
 Raphael Gallais-Pou <rgallaispou@gmail.com>,
 Yannick Fertre <yannick.fertre@foss.st.com>, 
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
 Philippe Cornu <philippe.cornu@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Mikko Perttunen <mperttunen@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Alexey Brodkin <abrodkin@synopsys.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Jonathan Corbet <corbet@lwn.net>, linux-aspeed@lists.ozlabs.org,
 dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, imx@lists.linux.dev,
 linux-rockchip@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, linux-tegra@vger.kernel.org,
 linux-doc@vger.kernel.org
Subject: Re: [PATCH 14/14] Documentation: Update the todo
Message-ID: <2y3lwycrggmktamu3j3gj65uco7quvtu7tlc3724e4mpokhjz2@icedc3kervme>
References: <20250128-cocci-memory-api-v1-0-0d1609a29587@redhat.com>
 <20250128-cocci-memory-api-v1-14-0d1609a29587@redhat.com>
 <a389f799-442e-45f3-8609-2eb2f0b7a825@suse.de>
 <li2awsqmdoye3u7n3gi2mrhbfxs77e3edjmsg5zclnyjinsnul@2bjkc5agyu5u>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="cigenp6alv7pkbet"
Content-Disposition: inline
In-Reply-To: <li2awsqmdoye3u7n3gi2mrhbfxs77e3edjmsg5zclnyjinsnul@2bjkc5agyu5u>
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


--cigenp6alv7pkbet
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 14/14] Documentation: Update the todo
MIME-Version: 1.0

On Wed, Jan 29, 2025 at 03:31:50PM +0100, Maxime Ripard wrote:
> Hi Thomas,
>=20
> On Wed, Jan 29, 2025 at 02:06:15PM +0100, Thomas Zimmermann wrote:
> > Am 28.01.25 um 23:29 schrieb Anusha Srivatsa:
> > > Remove the TODO now that this series addresses
> > > the changes needed.
> >=20
> > While your series is fine, this TODO item is unrelated. It's about vari=
ous
> > ancient fbdev drivers that do not reserve their memory regions correctl=
y. So
> > please drop patch 14 form the series.
>=20
> Is it? Could we rephrase the entry then? I'm the one that suggested
> Anusha to work on this, and it's still not clear to me what it means
> exactly if it's not what she worked on :)

The text in the TODO sounds pretty clear to me. It says that not all
drivers request the memory that they are going to use, and suggests to
add those missing calls. But all of the drivers in this series already
do that and the only change here is to convert them to use some of the
newer helpers.

Thierry

--cigenp6alv7pkbet
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmeaPhkACgkQ3SOs138+
s6H45hAAkHi6OubObNKNwO2CYc2mT8gjjY3iZP3UvxqouoU05ylZ0uUIxHOz8K8T
vXb+tkMFtsqIZZTJZGti+67m/YYOCtZsvXO79IMZy7WUab/bKWX7x2vy3WjN5lyG
yqlo8kp85y69za3sJHjRrUvr4acQSDyDejrwBdWN2xMCnDgzG5lzXkXhibhyOaMd
p0wyLE4EkS0pdxCg2FGGjiFOAnWmHd3+DPW3wRSMVsiXpVgWxEAQ6aGmNMtl0Y7F
KM7UDu0umziZxMyR2/4SFn7Q772BDa1dwInJhSBF3ugkGdQ3mSPpBeDPjf+cI2Mj
69Z5AA1KQOhvGcKM9WOW/kXV9/CeXD1dv6Z5c4ho4gnOWA9Sjj0PUVRIJy7oDtm5
4SdccVE1EPL/+IzByDQFxbG6/UFTJroG0+N9mpx9p2tZ0fJDGiQepxQ6XqLKlbZg
olV21Xytohgotp2SlQ8tk2PIln70QKzEanmMVBl2WEkxAByKbu/XK+4A9+3/Hy9l
+RdZ/r1pHfzlW7nzFGKpNeNaH3uMkupcb4PsceavHYDmabcKJtyK4J2/xp218nwA
EopzxkwqOiYMAHl1/tBeNlt4bEIhph/3ldgBr6fgUWSbddKQxr6YjU/Lyvp5KOFH
qkb1aCLDg6nKqceZe1QQeEDsVyZJA2a3ACyQ5rpyrniazDRDlU8=
=VcN2
-----END PGP SIGNATURE-----

--cigenp6alv7pkbet--
