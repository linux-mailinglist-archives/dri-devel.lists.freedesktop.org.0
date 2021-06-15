Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1F483A7D8E
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jun 2021 13:50:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A90AF89CD9;
	Tue, 15 Jun 2021 11:50:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F044789CD9
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jun 2021 11:50:22 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id bp38so26609173lfb.0
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jun 2021 04:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=1xUcdoU0rgH6jjTSj2XB1E78P9DWja+pl0vW8u+yUME=;
 b=loh2Rs1j+aBMTB7nwR1wvQdD871fGH12MVpbxkvb/HGtKVG5YUTUDbVx7OK9O23RHD
 CO0miiJiQwtvZ2Fizq52zvuPBeSfpHO2XkfnKUvu6P8nboa9/9qGPqVH7ov6QX0XBct5
 whgtfm1JxRtHiIcp4i9uB6ShT8tZkLSkFrmEvTn7kMbWQYapbcyOxKJ/rQlHwTQr941z
 v1aYcwND+61o78Dfd5AfNUjMVbz+6ucdAuQUdtrk+ANUquE8zOT1BUq9+v4zJt/lJKNF
 Imo1V3MbWn+DhBr3Xi1SDR30eAO2bqjLM0s928uFaSMDjyRHcvEiWJg932IIK9v8JBRM
 KPUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=1xUcdoU0rgH6jjTSj2XB1E78P9DWja+pl0vW8u+yUME=;
 b=d7fbtQ7/cQxcRzTnyPi2UgJIC63H2zUX8ApuEhW5iRS3rnMQ7Y6BhblmdVD9GdwBKD
 YiEhOfsS7NSPV6U15HtGEXBA2SQbgMRjyBRSdLN+l4DDDM/97NnVafed3odvYfJmREyR
 jzFcII10nOtMKbXcwTpPc8AsKDPxCFNmeJbpBWQSoXEVrSRFWZL2egXoQz8uTOsutx4r
 4gOBzBVX7utHhyLkGvM6l9VtNqmY7tsEJgjH354QY6Vkw1zHN6/f1EuQofg1BbotgDVI
 ebmam8Dym4MDLlKQdFYNir2tLHyFPonscRKCUG/9RmaaLnOCnk7OqnhSzgm4hbDwe4iA
 mVBQ==
X-Gm-Message-State: AOAM532GNnT6RMf/ly5YiUv9oM/MamEL7acaCm6r0VFNEzHYKjDGXlgN
 UrTnZm14sT+cywVqBp2D8uw=
X-Google-Smtp-Source: ABdhPJyVl/Us4ycZpKhFtZUdcJ/KKU637NmPeEn55W0oyLi7vLmz4aF3vWo84Ws3DTmeFHKHVmceuA==
X-Received: by 2002:a19:7d82:: with SMTP id y124mr15068746lfc.76.1623752229076; 
 Tue, 15 Jun 2021 03:17:09 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id z20sm2118351ljk.50.2021.06.15.03.17.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jun 2021 03:17:08 -0700 (PDT)
Date: Tue, 15 Jun 2021 13:16:56 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v3] Documentation: gpu: Mention the requirements for new
 properties
Message-ID: <20210615131656.2ecefdc4@eldfell>
In-Reply-To: <YMh21WBrADbZDcbp@pendragon.ideasonboard.com>
References: <20210610174731.1209188-1-maxime@cerno.tech>
 <CAKMK7uG_Wkko0L6sv0U1bXWdYk4fg3OTcp5=+qfRV0CP9V44=A@mail.gmail.com>
 <KNFHfqvJUVq9oy9BSdznj1S6xhDoZUAx1_DwfSNvUv8u1d-TroKBTq2hxtv7u1aJnxnpI5CxUXSMTn73YsVhZjnRW78gv-QLsK6AkJ5m3Fw=@emersion.fr>
 <20210611120309.2b5eb4htupv5ss32@e110455-lin.cambridge.arm.com>
 <20210614174912.15a49336@eldfell>
 <20210614152413.nguqia3s4tlowio4@e110455-lin.cambridge.arm.com>
 <YMeE63G+9DSLPB3N@pendragon.ideasonboard.com>
 <20210615100335.0b8f96d5@eldfell>
 <ouNaZaqkV1d_wPRESVBQHxvMhmJ53xIrgtPfDs8mB88AN3FEWt7cq031k8ZqCva1Ob0TCNTnsWqNDS0l5NXfejXIL7YUky3XGdjmh1_hefk=@emersion.fr>
 <YMh21WBrADbZDcbp@pendragon.ideasonboard.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/aSclia/U0zdUZzWMZ0xn.Ur"; protocol="application/pgp-signature"
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
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Xinliang Liu <xinliang.liu@linaro.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Sandy Huang <hjc@rock-chips.com>,
 Melissa Wen <melissa.srw@gmail.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Sam Ravnborg <sam@ravnborg.org>,
 Jerome Brunet <jbrunet@baylibre.com>, Marek Vasut <marex@denx.de>,
 Jonathan Corbet <corbet@lwn.net>, Joonyoung Shim <jy0922.shim@samsung.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Kevin Hilman <khilman@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>,
 Russell King <linux@armlinux.org.uk>, Steven Price <steven.price@arm.com>,
 David Airlie <airlied@linux.ie>, Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Noralf =?UTF-8?B?VHLDuG5uZXM=?= <noralf@tronnes.org>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Chen Feng <puck.chen@hisilicon.com>, Hyun Kwon <hyun.kwon@xilinx.com>,
 NXP Linux Team <linux-imx@nxp.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Tian Tao <tiantao6@hisilicon.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonas Karlman <jonas@kwiboo.se>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Edmund Dea <edmund.j.dea@intel.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Alison Wang <alison.wang@nxp.com>, Roland Scheidegger <sroland@vmware.com>,
 Shawn Guo <shawnguo@kernel.org>, Ben Skeggs <bskeggs@redhat.com>,
 Maxime Ripard <maxime@cerno.tech>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Sean Paul <sean@poorly.run>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Paul Cercueil <paul@crapouillou.net>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Tomi Valkeinen <tomba@kernel.org>, Hans de Goede <hdegoede@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>, Yannick Fertr e <yannick.fertre@foss.st.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Robert Foss <robert.foss@linaro.org>, Joel Stanley <joel@jms.id.au>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Qiang Yu <yuq825@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>, Huang Rui <ray.huang@amd.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Philippe Cornu <philippe.cornu@foss.st.com>, Jyri Sarha <jyri.sarha@iki.fi>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/aSclia/U0zdUZzWMZ0xn.Ur
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 15 Jun 2021 12:45:57 +0300
Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote:

> On Tue, Jun 15, 2021 at 07:15:18AM +0000, Simon Ser wrote:
> > On Tuesday, June 15th, 2021 at 09:03, Pekka Paalanen <ppaalanen@gmail.c=
om> wrote:
> >  =20
> > > indeed it will, but what else could one do to test userspace KMS
> > > clients in generic CI where all you can have is virtual hardware? May=
be
> > > in the long run VKMS needs to loop back to a userspace daemon that
> > > implements all the complex processing and returns the writeback result
> > > via VKMS again? That daemon would then need a single upstream, like t=
he
> > > kernel, where it is maintained and correctness verified. =20
> >=20
> > The complex processing must be implemented even without write-back, bec=
ause
> > user-space can ask for CRCs of the CRTC.
> >  =20
> > > Or an LD_PRELOAD that hijacks all KMS ioctls and implements virtual
> > > stuff in userspace? Didn't someone already have something like that?
> > > It would need to be lifted to be a required part of kernel UAPI
> > > submissions, I suppose like IGT is nowadays. =20
> >=20
> > FWIW, I have a mock libdrm [1] for libliftoff. This is nowhere near a f=
ull
> > software implementation with write-back connectors, but allows to expose
> > virtual planes and check atomic commits in CI.
> >=20
> > [1]: https://github.com/emersion/libliftoff/blob/master/test/libdrm_moc=
k.c
> >  =20
> > > For compositor developers like me knowing the exact formulas would be=
 a huge
> > > benefit as it would allow me to use KMS to off-load precision-sensiti=
ve
> > > operations (e.g.  professional color management). Otherwise, composit=
ors
> > > probably need a switch: "high quality color management? Then do not u=
se KMS
> > > features." =20
> >=20
> > I think for alpha blending there are already rounding issues depending =
on the
> > hardware. I wouldn't keep my hopes up for any guarantee that all hw use=
s the
> > exact same formulae for color management stuff. =20
>=20
> Good, because otherwise you would be very quickly disappointed :-)
>=20
> For scaling we would also need to replicate the exact same filter taps,
> which are often not documented.

That is where the documented tolerances come into play.

Userspace projects need screenshot-based testing, and we need to know
how much tolerance we should allow or expect.

Good reminder about CRCs. CRCs have zero tolerance, so they are not
useful for testing properties that have any leeway, are they?


Thanks,
pq

--Sig_/aSclia/U0zdUZzWMZ0xn.Ur
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmDIfhgACgkQI1/ltBGq
qqf9uw//Z7wP5lb4lQfPWOw5s+nFR9pu8B8zVwQzEuz2RTx5Vc/XXfa2Fc0rukCj
Y380sIPdp2+avUNDyitBKW8E7rU3mab7UmBdn6CmLnvZVM+BQ3vdtDvZ2WfezT7j
AkEzJYm9QhiYyqezwzCa1Jo2ugUJwSxT6TKQbVsT64vCCajdZIQJvDizCPy0HNvY
/dncTRXyWta650vMnzYle6YlWrYL+kJst8J/zU5+H3nffgJef6zpxz+o37Libz/w
WYZWYSJ7swv54xNCddkuJrSf60vs7KlwiXZuBEt5dSu2ro81unrU6FVpEazF8x1e
3jigPFgMppxYTIVOGtrjbQku7hJB1f9u+DNGjKTeH8HMc0QkAfcb+V7nrmaetZs6
02GvihbFh67ewL7hcIXVpNETdsfQD3pVCDz1Xz6w5A6bixa0HuH31C3ATBhUuKhH
tJNv99eZvmfBIaeuFNkCgPbxP2vdFmStT1x/bq06g+2RCG71+EzkKF6hX0JD+kRf
CqRqBDvwNy4sXgDkwz+ftpHrn+OvO7LrR4X5NtZUeo24VaXlrJTqqX5lSHr6OgZg
oREPacO/pUjTluJY+sb+qUBkxTcu9hP5MC5LnHvtiQ2yxWel2Wp+MOF42Sl2B98w
jTfx9rHSqauMN7hs33K2UBnAcpf2sswYagwmg0clpgF/ipcJ96k=
=4xXK
-----END PGP SIGNATURE-----

--Sig_/aSclia/U0zdUZzWMZ0xn.Ur--
