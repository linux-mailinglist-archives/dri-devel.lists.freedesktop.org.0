Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 162743AC69C
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jun 2021 10:56:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC7566E996;
	Fri, 18 Jun 2021 08:56:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8156F6E996
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jun 2021 08:56:18 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id c9so9890469wrt.5
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jun 2021 01:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=9BBHBKpuIHVNeFNocyi2iDHpvR/2bbHPGbZWJUlqwoI=;
 b=S09ISTL829LWd712uTVyiCFNwqS/1EQaL6fptcmNVTZWRYi7iy4gWi9Yr+0L9ftcuz
 9A39IgVl5i+qEei+60S3Zr5QTfzmmVtWEF0+h2o4ytkp0ZfzSA72paKmZLO4Hvec5kjc
 FlSsON4grKpyZIQag/zFQD4VM9FMsK2VFT59oycux5WT1IeZy5THo+7opQGccowYCHSb
 46xIWkhMozmn2DYJI58qD3VFdl6TNmtN6JwjQUveLUQNPt2X/3+1ymtGqkxMf4vOOO0X
 Kln7EBS9MaY87CrmtMKv8cDSZ8Hig7gSiN2u2+pWC55OsaSfrba9Zo7TMCwaUvfRomQM
 VXKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=9BBHBKpuIHVNeFNocyi2iDHpvR/2bbHPGbZWJUlqwoI=;
 b=OZRcupiuQAnkKBD9gbZ2EJZKjqX2ezOSFnX4Bh18g66nmVjPdUAhlogo4lwxEzlYu9
 SImn2+ztgNCcNBexIa8yG763VGUVq6WKtOZT9ZnjbKSHyXuHwEQtA+ZhqMxA5E4oOXKw
 ezZJHv1YEnbm8T4XAZutNAjBcmO8d+veIRCxPY5KAM5Nk53ECazDYvghHGnqZdtV0vFh
 Pp+e2f25xNMiOXN/+5cTKBHh0YT5ovjsRS6nCNF34TqeSHcbiQtf9/NiIR9JT+GU66jP
 jGy+pUJ4WSKiVlOXS8uHCNDmg/99gU60jDBlpzqvnu+2GLFJnUEx396ObBwnU5l6Fgyv
 WZsg==
X-Gm-Message-State: AOAM532Xorb9dy6rpcZ3fGPU9QjC1sWhu8HkceEph+QzVbUqZo7m6BcB
 aEK9/nHrGH28ZCLmHHZd5Rc=
X-Google-Smtp-Source: ABdhPJzU5tBXCe1rtBOZNzrps8DEDkD3x2CJOqoCLNcoFWdLDdwmfgtv3i3EzPqSMinWl5IPv6YP2A==
X-Received: by 2002:a2e:a584:: with SMTP id m4mr8745008ljp.64.1624006565984;
 Fri, 18 Jun 2021 01:56:05 -0700 (PDT)
Received: from erebos (85-76-76-133-nat.elisa-mobile.fi. [85.76.76.133])
 by smtp.gmail.com with ESMTPSA id v22sm305914ljk.51.2021.06.18.01.56.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jun 2021 01:56:05 -0700 (PDT)
Date: Fri, 18 Jun 2021 11:55:38 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v3] Documentation: gpu: Mention the requirements for new
 properties
Message-ID: <20210618115152.79af3537@erebos>
In-Reply-To: <YMtQClnvjGNDhn9q@pendragon.ideasonboard.com>
References: <20210614152413.nguqia3s4tlowio4@e110455-lin.cambridge.arm.com>
 <YMeE63G+9DSLPB3N@pendragon.ideasonboard.com>
 <20210615100335.0b8f96d5@eldfell>
 <ouNaZaqkV1d_wPRESVBQHxvMhmJ53xIrgtPfDs8mB88AN3FEWt7cq031k8ZqCva1Ob0TCNTnsWqNDS0l5NXfejXIL7YUky3XGdjmh1_hefk=@emersion.fr>
 <YMh21WBrADbZDcbp@pendragon.ideasonboard.com>
 <20210615131656.2ecefdc4@eldfell>
 <YMpnlDmzn0Re4Urn@pendragon.ideasonboard.com>
 <20210617102701.28f820b2@eldfell>
 <YMskHF8Bo/z3kqxf@pendragon.ideasonboard.com>
 <20210617143311.19896458@eldfell>
 <YMtQClnvjGNDhn9q@pendragon.ideasonboard.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/FvFnMvh/SbxNwAEjaUh=ULz";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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

--Sig_/FvFnMvh/SbxNwAEjaUh=ULz
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 17 Jun 2021 16:37:14 +0300
Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote:

> Hi Pekka,
>=20
> On Thu, Jun 17, 2021 at 02:33:11PM +0300, Pekka Paalanen wrote:
> > On Thu, 17 Jun 2021 13:29:48 +0300 Laurent Pinchart wrote: =20
> > > On Thu, Jun 17, 2021 at 10:27:01AM +0300, Pekka Paalanen wrote: =20
> > > > On Thu, 17 Jun 2021 00:05:24 +0300 Laurent Pinchart wrote:   =20
> > > > > On Tue, Jun 15, 2021 at 01:16:56PM +0300, Pekka Paalanen wrote:  =
 =20

...

> > > > > > That is where the documented tolerances come into play.     =20
> > > > >=20
> > > > > This is something I've experimented with a while ago, when develo=
ping
> > > > > automated tests for the rcar-du driver. When playing with differe=
nt
> > > > > input images we had to constantly increases tolerances, up to a p=
oint
> > > > > where the tests started to miss real problems :-(   =20
> > > >=20
> > > > What should we infer from that? That the hardware is broken and
> > > > exposing those KMS properties is a false promise?   =20
> > >=20
> > > No, just that the scaler doesn't document the internal hardware
> > > implementation (number of taps in the filters, coefficients, rounding,
> > > ...). That's the rule, not the exception, and it doesn't prevent corr=
ect
> > > operation, images get scaled in a reproducible way (the same input
> > > produces the same output).
> > >  =20
> > > > If a driver on certain hardware cannot correctly implement a KMS
> > > > property over the full domain of the input space, should that driver
> > > > then simply not expose the KMS property at all?   =20
> > >=20
> > > The properties involved here would the the SRC and CRTC rectangles for
> > > the planes. They don't document pixel-perfect scaling :-)
> > >  =20
> > > > But I would assume that the vendor still wants to expose the featur=
es
> > > > in upstream kernels, yet they cannot use the standard KMS properties
> > > > for that. Should the driver then expose vendor-specific properties =
with
> > > > the disclaimer that the result is not always what one would expect,=
 so
> > > > that userspace written and tested explicitly for that hardware can
> > > > still work?
> > > >=20
> > > > That is, a sufficient justification for a vendor-specific KMS prope=
rty
> > > > would be that a standard property already exists, but the hardware =
is
> > > > too buggy to make it work. IOW, give up trying to make sense.   =20
> > >=20
> > > It's not just about buggy hardware, it's also about implementation
> > > specificities, such as rounding, filters, order of operations in the
> > > color management pipeline (it's relatively easy when you only have two
> > > LUTs and a CCM matrix, but if you through 3D LUTs and other tonemappi=
ng
> > > features in the mix, not all hardware will implement the same pipelin=
e),
> > > or various types of image compression (this device implements a
> > > "near-lossless" compression scheme that reduces the memory bandwidth =
by
> > > 50% for instance). =20
> >=20
> > Rounding shouldn't result in needing wide tolerances.
> >=20
> > Filters are more difficult, but at least we can factor them out when
> > testing other things. Filters could be tested in isolation with some
> > image difference metrics rather than per-pixel independent comparisons.=
 =20
>=20
> The metrics I was using had both a tolerance on the pixel value and on
> the number of pixels accepted outside of the value tolerance. I'm sure
> we can improve it (perhaps taking locality into account), but that's
> heuristics, and keeping heuristics working across a wide variety of use
> cases is hard.

Hi Laurent,

I was thinking of using a more, um, scientific error measures, e.g.
sum or squared errors (SSE) or average SSE over the whole
re-scaled/filtered image result, ignoring pixels outside of that.

What one normally uses when matching images in computer vision, for
example. Could even add a threshold such that simple rounding-level
errors would not even register in SSE. I'm sure there is plenty of
literature on that, but it may be behind a paywall like IEEE.

SSE may or may not need to computed from light-linear pixel values,
too. If one wanted to go even further, I'm sure there are computational
models about human color and brightness difference sensitivity that
could be used to weigh the errors.


> The filter I mentioned, by the way, is the scaler filter. Out of
> curiosity, do any of the devices you work on document with pixel-perfect
> precision how the hardware scaler is implemented ?

I don't work on drivers, so wouldn't even look for hardware docs. I go
by what KMS UAPI documents because that is the API I work with and
nothing else. And yes, I ignore all the scaling filter issues for now.

Because I don't have a way to get feedback (writeback connectors maybe
not existing and not hooked up in Weston quite yet), testing
scaling/filtering precision has not been on-topic yet. Right now I'm
interested in color correctness rather than geometrical filtering. For
traditional color management, the expected pixel values are quite
precise.

> > The order of operations in the color management pipeline is very
> > important. We can't work with "whatever". All the variability in
> > hardware is exactly why I have been calling out for defined abstract
> > color pipeline in the DRM UAPI docs, so that drivers would know which
> > properties to map to their elements, so that userspace can have any
> > possibility of using them correctly. If the hardware has a block
> > that doesn't fit in the abstract pipeline, you get to add things to the
> > abstract pipeline, or invent a whole another abstract pipeline and
> > document that. =20
>=20
> One very typical difference between devices is the order of the
> processing blocks. By modelling the KMS pipeline as degamma -> ccm ->
> gamma, we can accommodate hardware that have any combination of
> [1-2] * 1D LUTs + 1 * CCM. Now, throw one 3D LUT into the mix, at

But you cannot represent pipelines like
1D LUT -> 1D LUT -> CCM
because the abstract pipeline just doesn't have the elements for that.
OTOH, maybe that ordering does not even make sense to have in hardware?
So maybe not all combinations are actually needed.

> different points in the pipeline depending on the device, and it will
> start getting complicated, even if the use case is quite simple and
> common. This is getting a bit out of topic, but how would you solve this
> one in particular ?

By defining all the points in the abstract color pipeline where a 3D
LUT could exist. Then each point would probably need its own KMS
property.

We already have the KMS pipeline exactly as degamma -> ctm -> gamma and
drivers need to respect that order.

If the combinatorial explosion gets out of hand, maybe we need a KMS
property to switch to whole another abstract pipeline which defines a
different ordering on the same and/or different KMS properties.

=46rom what I've learnt recently, if you have a 3D LUT, you want a 1D LUT
on each side of it for memory vs. precision optimization. And after the
degamma -> ctm -> gamma pipeline you may want one more ctm for
RGB-to-YCbCr conversion. So I have hope that the abstract pipeline with
all actually implemented hardware features might not go totally out of
hand.

> > Lossy compression needs its own KMS properties to ensure it can be
> > disabled when necessary. Near-lossless is not lossless, if a difference
> > can be measured. The driver or hardware cannot guess if the end user is
> > ok with "near-lossless" or not, so you have to be conservative and
> > assume not ok, offering an opt-in for lossy. =20
>=20
> Sure, but what would be the barrier to entry for such a property that
> would enable the compression (it could actually be a pixel format
> modifier) ? Would it only need to be documented ? Would we need a
> software implementation in VKMS and/or in IGT ? The compression
> algorithm is proprietary and not documented, so the latter can't be
> done.

Good questions. Shows that the idea of strictly requiring a VKMS
implementation won't fly, which is what I expected.

Saying it could be a pixel format modifier is a really good point. A
modifier cannot be the only thing to control it. Userspace does not
decode modifiers, so it cannot filter it out when it wants lossless
pixels. There must be something else to control it.

As a userspace dev, I would be ok with documenting a KMS property as
"improves blah blah, but also does significant violence to your
pixels", so I would know that this is something I need to consider.

You could argue that all KMS properties do violence to pixels, but
that's not a useful definition. It would just mean that in some use
cases I would never off-load anything to KMS. Depending on the use case
that might still be true even if the errors were limited to reasonable
rounding errors. I need an idea of how much error does KMS processing
do, and ultimately I expect compositors to also need a last resort
button for "do not trust KMS processing at all" which then makes the
display server always use the exact same simplest possible KMS
configuration and let the end user deal with the KMS errors via
color-profiling his monitor.

It's quite a different thing to have color processing elements in an
unexpected order in the pipeline than it is to have a scaling filter
doing slightly unknown operations.

> > ...
> >  =20
> > > > My underlying assumption is that generic userspace will not use
> > > > vendor-specific properties.   =20
> > >=20
> > > I expect some amount of device-specific code in userspace, yes.  =20
> >=20
> > If we had a reliable way to test device-specific code without the
> > hardware and automatically in CI, then maybe.
> >  =20
> > > There are usually large variations in how the hardware exposes access=
 to
> > > a given feature, which leads to code having to convert the standard A=
PI
> > > parameters to hardware parameters. To a large extend this can be done=
 in
> > > drivers, but for some more complex features, it may put too much burd=
en
> > > on the kernel. There's a reason mesa is a userspace stack :-) =20
> >=20
> > If we get a Khronos standardised 2D composition API... oh wait.
> >=20
> > Nothing wrong with userspace libraries, but it does mean that driver
> > developers need to contribute to them, like they do to Mesa. Is there
> > any of that going on for KMS? =20
>=20
> Not that I'm aware of, but I think that's a direction we can consider
> seriously.

That would be awesome if the API is generic.

> > In the mean time, DRM UAPI basically must define a 2D composition API,
> > or the new KMS properties will not see use outside of vendor trees.


Thanks,
pq

--Sig_/FvFnMvh/SbxNwAEjaUh=ULz
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmDMX4oACgkQI1/ltBGq
qqc91A/9FdlGscfrD5QGvQidCdZbx7tFUQcgjhEQVJmhor/60x/FC4Nih1+a4LSM
58gkkOkdnmiJU4BBJCoUXP5tCTlxraOfwMRwPY3o0s+UCSg7QBTMdTPF0zcWbd+5
OAbfpBEivQqrQzSrZw1wYgbv2ZGEELS6hvdL6lcDbfhYoR1r3TZcv3QgZc2/1n8w
SxgFr5K1KKyW2OhgpNif41p9hdf0VnAI5kjxZr5wZzH4mSvMqSYW2vqhShckfZmu
WNb0Kc1dJPm2UJRieVOcq0dsLF+PPtr7q4PMQxVR4F6imAYvOLe0Nj5yQFSqZGND
zFTkQZjfJ9U9qehLvw97PRhTQMysx2ed6C0VPFMA1gb1gEVhwmWLN/uKFnlpxkhe
sLhHXG/kkq2pF50r+YV/h0Bt5w26Hmo2LI22CU/nv5rChiOltV9wogyL6W0DJ0cu
pzuS3m1Zk0SjhdDphg2TfmOrD/F0/Ne+yRV7icw3Bk30EPo4hsdrcN4j+bLpfK3S
PjuVVY2scCuSsGnXlGDAaz8l4DwvJ8apQzxb0SpFyC3pUvLZ3g5k+9ZV5ISdq+V3
ZDKlHlnhmiy6IwBNlrB0OA6rcnnuB5L2gJTVx+uegPNe4A+uM7cE/feLcaqx8dwP
XxkH4aeWotLL6pucwSF2oJ3ibpot/jd0rPobHkUfeohOKHlbBvI=
=FD0J
-----END PGP SIGNATURE-----

--Sig_/FvFnMvh/SbxNwAEjaUh=ULz--
