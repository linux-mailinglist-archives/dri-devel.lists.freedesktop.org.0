Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 12B213AAF52
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jun 2021 11:09:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 327466E8C3;
	Thu, 17 Jun 2021 09:09:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A97276E0DD
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jun 2021 09:09:11 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id s22so7936550ljg.5
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jun 2021 02:09:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=2HjwvT+SV5+/NgCoeu9k5QwUA4VIDEdumWwRrwq0kqk=;
 b=IjG2/5BOiWh4J/EZL9lyBLtOQ+l9zGj2pUo5V1uoSqPKU3/qS1ogqr4zGXA1b5MfiW
 Bm911EzAiCBQ/NtAPLLVk1GRQjSHxuZKl+tEoC41CiuUWUJPucyfvooFrXjLW7cYSf1P
 qMKwR746tIAP49KzjmemjSmUPkj8rxKR0aYaK95R0m5KYow/gCJpNevDMsraxp7jv/lq
 alwx/jqb0U/RTgo6/WBJ/gZtTxJXCKNYayb34AKQnFwO6ydxFuyv9QLtv/lp7ZMao/4y
 LTga6unHMop7t5uLyyO3JDfjOs/5h7byspS+IGF3NAIfpZ8+/DjvFaeZeYaFwforhOXI
 SFYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=2HjwvT+SV5+/NgCoeu9k5QwUA4VIDEdumWwRrwq0kqk=;
 b=YyhMo7i7mGNu3JU+0ALP8eAqWYmxPZVKdav1L6IXvprwzF/28xUl8/4MkCaRtFJApd
 zg4CUkMqU9h9psRxIZYylyx6fdPfIiZLCisqp4MlLajOb6rm8A9YK4os0lJQYr3D/eSP
 1X1jRWnZHFkY3ggT2CBEnThCX6Wida9iQiqklfSGdv90Fvk642cbwOn0gjXPRbzSeDWh
 0ExdLZSuxns5eRKKbhfxauV0opNsrfrgdP9i6TiJhpVRK6NeyKHud6WH2rs1fKyTL64h
 ReAIfLDmo3h22g9kx+LXRZ6Zf6UNB2iat2+nW5eyg4PTmmYYZGMitBVEx1hufRArxbpg
 q+AA==
X-Gm-Message-State: AOAM5307ptaLmEIUm0H+LUNbj4lYBFcqTjYKN0LF6E26cT3IkeMCTp0+
 UoOAjpsCTdSCYSccBVcTxsc=
X-Google-Smtp-Source: ABdhPJzU1Ppf+JWgqlR+K1m3CQOUVFDedVECYutiw3EohMlCte3llAtBfNmj9OVMU1JFefVOsM9PZA==
X-Received: by 2002:a19:6a0e:: with SMTP id u14mr3010213lfu.184.1623914835517; 
 Thu, 17 Jun 2021 00:27:15 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id c9sm546233ljr.104.2021.06.17.00.27.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 00:27:15 -0700 (PDT)
Date: Thu, 17 Jun 2021 10:27:01 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v3] Documentation: gpu: Mention the requirements for new
 properties
Message-ID: <20210617102701.28f820b2@eldfell>
In-Reply-To: <YMpnlDmzn0Re4Urn@pendragon.ideasonboard.com>
References: <CAKMK7uG_Wkko0L6sv0U1bXWdYk4fg3OTcp5=+qfRV0CP9V44=A@mail.gmail.com>
 <KNFHfqvJUVq9oy9BSdznj1S6xhDoZUAx1_DwfSNvUv8u1d-TroKBTq2hxtv7u1aJnxnpI5CxUXSMTn73YsVhZjnRW78gv-QLsK6AkJ5m3Fw=@emersion.fr>
 <20210611120309.2b5eb4htupv5ss32@e110455-lin.cambridge.arm.com>
 <20210614174912.15a49336@eldfell>
 <20210614152413.nguqia3s4tlowio4@e110455-lin.cambridge.arm.com>
 <YMeE63G+9DSLPB3N@pendragon.ideasonboard.com>
 <20210615100335.0b8f96d5@eldfell>
 <ouNaZaqkV1d_wPRESVBQHxvMhmJ53xIrgtPfDs8mB88AN3FEWt7cq031k8ZqCva1Ob0TCNTnsWqNDS0l5NXfejXIL7YUky3XGdjmh1_hefk=@emersion.fr>
 <YMh21WBrADbZDcbp@pendragon.ideasonboard.com>
 <20210615131656.2ecefdc4@eldfell>
 <YMpnlDmzn0Re4Urn@pendragon.ideasonboard.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/d.Guy7TlX58IGrQiolhw1zS"; protocol="application/pgp-signature"
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

--Sig_/d.Guy7TlX58IGrQiolhw1zS
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 17 Jun 2021 00:05:24 +0300
Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote:

> On Tue, Jun 15, 2021 at 01:16:56PM +0300, Pekka Paalanen wrote:
> > On Tue, 15 Jun 2021 12:45:57 +0300 Laurent Pinchart wrote: =20
> > > On Tue, Jun 15, 2021 at 07:15:18AM +0000, Simon Ser wrote: =20
> > > > On Tuesday, June 15th, 2021 at 09:03, Pekka Paalanen wrote:
> > > >    =20
> > > > > indeed it will, but what else could one do to test userspace KMS
> > > > > clients in generic CI where all you can have is virtual hardware?=
 Maybe
> > > > > in the long run VKMS needs to loop back to a userspace daemon that
> > > > > implements all the complex processing and returns the writeback r=
esult
> > > > > via VKMS again? That daemon would then need a single upstream, li=
ke the
> > > > > kernel, where it is maintained and correctness verified.   =20
> > > >=20
> > > > The complex processing must be implemented even without write-back,=
 because
> > > > user-space can ask for CRCs of the CRTC.
> > > >    =20
> > > > > Or an LD_PRELOAD that hijacks all KMS ioctls and implements virtu=
al
> > > > > stuff in userspace? Didn't someone already have something like th=
at?
> > > > > It would need to be lifted to be a required part of kernel UAPI
> > > > > submissions, I suppose like IGT is nowadays.   =20
> > > >=20
> > > > FWIW, I have a mock libdrm [1] for libliftoff. This is nowhere near=
 a full
> > > > software implementation with write-back connectors, but allows to e=
xpose
> > > > virtual planes and check atomic commits in CI.
> > > >=20
> > > > [1]: https://github.com/emersion/libliftoff/blob/master/test/libdrm=
_mock.c
> > > >    =20
> > > > > For compositor developers like me knowing the exact formulas woul=
d be a huge
> > > > > benefit as it would allow me to use KMS to off-load precision-sen=
sitive
> > > > > operations (e.g.  professional color management). Otherwise, comp=
ositors
> > > > > probably need a switch: "high quality color management? Then do n=
ot use KMS
> > > > > features."   =20
> > > >=20
> > > > I think for alpha blending there are already rounding issues depend=
ing on the
> > > > hardware. I wouldn't keep my hopes up for any guarantee that all hw=
 uses the
> > > > exact same formulae for color management stuff.   =20
> > >=20
> > > Good, because otherwise you would be very quickly disappointed :-)
> > >=20
> > > For scaling we would also need to replicate the exact same filter tap=
s,
> > > which are often not documented. =20
> >=20
> > That is where the documented tolerances come into play. =20
>=20
> This is something I've experimented with a while ago, when developing
> automated tests for the rcar-du driver. When playing with different
> input images we had to constantly increases tolerances, up to a point
> where the tests started to miss real problems :-(

What should we infer from that? That the hardware is broken and
exposing those KMS properties is a false promise?

If a driver on certain hardware cannot correctly implement a KMS
property over the full domain of the input space, should that driver
then simply not expose the KMS property at all?

But I would assume that the vendor still wants to expose the features
in upstream kernels, yet they cannot use the standard KMS properties
for that. Should the driver then expose vendor-specific properties with
the disclaimer that the result is not always what one would expect, so
that userspace written and tested explicitly for that hardware can
still work?

That is, a sufficient justification for a vendor-specific KMS property
would be that a standard property already exists, but the hardware is
too buggy to make it work. IOW, give up trying to make sense.

I would like to move towards a direction where *hardware* design and
testing is eventually guided by Linux KMS property definitions and
their tests. If we could have a rule that if a driver cannot correctly
implement a property then it must not expose the property, maybe in the
long term that might start having an effect?

My underlying assumption is that generic userspace will not use
vendor-specific properties.

Or, since we have atomic commits with TEST_ONLY, should it be driver's
responsibility to carefully inspect the full state and reject the
commit if the hardware is incapable of implementing it correctly?
Vendor-specific userspace would know to avoid failing configurations to
begin with. I suppose that might put an endless whack-a-mole game on
drivers though.


Thanks,
pq

--Sig_/d.Guy7TlX58IGrQiolhw1zS
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmDK+UUACgkQI1/ltBGq
qqd4jg/9Gz/McKt8xwdcttPaWFXB9ivvFWRu0kt8hZTrY263TnycqkKFoG66ZY3X
Apy1WGcub+AJdi/ajH+AexOSwViT5cO6CUHVBc9MldtPjQFjtxbZxh3GVYW+Pg5Y
OM1HqI8pDA2z0qEMgWvzb+v3nimdgdlRAw47tXWIoj1xlbtjEhJTSTyb6YrlmJq5
KfiFQ6iC26gUY9UFyDrg5zkzvjYzVFt6+B4fLJovNzsZN3funJkrh1kWiHckpcHk
YfeT7Z03FAcWp/L2PrLOskCe6aJ8ds4DzLAmxPCJVoSR6MdQX49ZmRKiNHryiXg7
K//IDmhM59dDfuFIllv0XqM1/xeEiycZ9E5rS0wwZp9MnHUppmV58r6hg9NkrU2Q
sRIkh0gcFDTz55o5Pc3gULoQh6klV3LIKUjbqm0ulynSDpe7yfRAISwYDhJTUmSu
HPWfSJN2duDXV8OKZNDQHTBqqhgQENkjfJNAswZxGAstWo+KaXCjNdg0cUV91Ick
wsUZd7CVoLtsalDN0BmD/IdvwppwqxBjEJg4g+PhvxSLojUlxxf+rkf+jM9SYknW
2FYhEZ4pI88Z9XpJy8MlPicW0EqL6UppWyECGwTFjPPd7IEsT+IRvxWV+GjegOtN
YjAmqWraLFf0RiTwF1Qq3riHAmcGqG5rMQNnAnRVrD4SLP6nCsQ=
=XQ+7
-----END PGP SIGNATURE-----

--Sig_/d.Guy7TlX58IGrQiolhw1zS--
