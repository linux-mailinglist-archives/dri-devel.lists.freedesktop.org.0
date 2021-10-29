Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8647743F885
	for <lists+dri-devel@lfdr.de>; Fri, 29 Oct 2021 10:05:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A45A56EA1B;
	Fri, 29 Oct 2021 08:05:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADED26EA1D;
 Fri, 29 Oct 2021 08:05:28 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 9229158061F;
 Fri, 29 Oct 2021 04:05:27 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Fri, 29 Oct 2021 04:05:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=T8QQliYtEhk4q5t0tdm2Hh5O/Vf
 QXZ9zBNnZxk/jzEI=; b=Z6eoJZJq0Ut5F4hP4+9TCoaJtIJDtD7k2Xv5fnNEVtd
 8G1SVwIbIWfIfVbCxznEJDE/HUjHwkCnhXswpDg1Pbnkrlae/yJD6wpwkpJDtC6E
 dPLMlCUXqua4EuvIrLoLx54Cq+2NuryE63/4sq2tG5FMO0jYmeH7XnkYLW+/59lB
 19iOOlcePZpMXSjpkKjmoHdJYNogrIZ87qF/UyvO8vG7adqSHcbUVIf8Sb7pc1/2
 sljnabVdRqspEvblyb0qroYOlmNRshtWaB6u7QN0CiTjkUUgCO1oEtwP3495P7tM
 DjnnJD8YYwJUTCz6Zpl+sA2FR8bLIKai2qWu9Up3Sug==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=T8QQli
 YtEhk4q5t0tdm2Hh5O/VfQXZ9zBNnZxk/jzEI=; b=FLlTNFaJVmhAdFWHXLmXZU
 voY3leb/37+JIBex0QIhiHWUvDsipU1M1e3dbO02bGXaQR9UDRYDRKoWJ3xVzVWU
 ETjexx4DI3QkPN5mpYCyUa9ovlgr19aTpgniBU10J6T9y4gQ1XHmnXuwI6xuvVNO
 Rkso5Z4MO+R3PGcIfTExgS3YipF2Tg9Z4QN/1puWkRbd26xFdFwYxrHoi8FXJBbg
 bG+SjN/eJU1+4XS8KXhLPSyJ4kbcbHjIZ+vymaCcsB6BKIu/URls5IC2iJYgSo1L
 bQ9xPNIFmZ4Nch8DiOH91iNNvXEsdrPEp0V3h0RNuWgd8KHOKaf57gjKpKywkVog
 ==
X-ME-Sender: <xms:RKt7YeSXrCiCbeO7YFYq-XCqAHMPpgAc2wGvelyRtrJ717gNiSnSpw>
 <xme:RKt7YTygGWgbm3gyH8GdK2h4aEcBCMrIWY2iBahNDknFEADWQlX0u5gNDxvNl2MHz
 K1FTnX8aAQKO3riRTc>
X-ME-Received: <xmr:RKt7Yb15jw_gmxeV_c-5egrQN7_LUMb1Z-WEhLI6eqJU8yu4sMY1otnFawahSlKx9n9Rn2Vo75jr2cFKgHUGRiYxMx-5rkK_hzL_4cXU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvdeggedguddvfecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheei
 heegudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:RKt7YaAPluwc6X3oDdXbDgGqiv8XU4-dAA6g7edKUI-23EZZv01tug>
 <xmx:RKt7YXgrsvHS8i_b9ZzzaCdJQrM1IFnHUFXEj-56N4bfA-fLE2DXUg>
 <xmx:RKt7YWrucJ8cWTSX5Svt8sS1i_TikQjRUrm64LZ7ZMbd2ZsTpLbk0w>
 <xmx:R6t7YTCYbFmAnADED1yUnEGcEsCum-vXgjgXqLs6YvSN6HXt9cf44g>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 29 Oct 2021 04:05:24 -0400 (EDT)
Date: Fri, 29 Oct 2021 10:05:21 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Robert Foss <robert.foss@linaro.org>,	Jonas Karlman <jonas@kwiboo.se>,
 Daniel Vetter <daniel.vetter@intel.com>,	David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,	linux-arm-msm@vger.kernel.org,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Rob Clark <robdclark@gmail.com>, Tian Tao <tiantao6@hisilicon.com>,
 Chen Feng <puck.chen@hisilicon.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 linux-samsung-soc@vger.kernel.org, Xinliang Liu <xinliang.liu@linaro.org>,
 John Stultz <john.stultz@linaro.org>, linux-kernel@vger.kernel.org,
 Inki Dae <inki.dae@samsung.com>, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>
Subject: Re: [v6,02/21] drm/bridge: adv7511: Register and attach our DSI
 device at probe
Message-ID: <20211029080521.6tmfq4kjngu5slv7@gilmour>
References: <20211025151536.1048186-3-maxime@cerno.tech>
 <CGME20211029062347eucas1p1431402205321b066349e3ccf432d2452@eucas1p1.samsung.com>
 <73c13cf5-ca36-f47b-f53a-11d4f015505c@samsung.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="dxkmld7iruoye3zb"
Content-Disposition: inline
In-Reply-To: <73c13cf5-ca36-f47b-f53a-11d4f015505c@samsung.com>
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


--dxkmld7iruoye3zb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Marek,

On Fri, Oct 29, 2021 at 08:23:45AM +0200, Marek Szyprowski wrote:
> Hi,
>=20
> On 25.10.2021 17:15, Maxime Ripard wrote:
> > In order to avoid any probe ordering issue, the best practice is to move
> > the secondary MIPI-DSI device registration and attachment to the
> > MIPI-DSI host at probe time. Let's do this.
> >
> > Acked-by: Sam Ravnborg <sam@ravnborg.org>
> > Tested-by: John Stultz <john.stultz@linaro.org>
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
>
> This patch landed in linux-next as commit 864c49a31d6b ("drm/bridge:
> adv7511: Register and attach our DSI device at probe"). Sadly it causes
> endless probe-fail-defer loop on DragonBoard 410c board
> (arch/arm64/boot/dts/qcom/apq8016-sbc.dts):

I'm sorry to hear that (but would have been surprised if it didn't occur)

This is supposed to be fixed by 8f59ee9a570c ("drm/msm/dsi: Adjust probe
order"). Do you have that patch applied?

Maxime

--dxkmld7iruoye3zb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYXurQQAKCRDj7w1vZxhR
xVUEAP9BeVQOJLXYw9Qy6X8VqVrrt6ZD7ANhFfeWPIL13SPJCQD/aD1IaYsn/2Vy
K56opVCzXYlbVeFJIDN28pPvj+x/ngE=
=e1Zt
-----END PGP SIGNATURE-----

--dxkmld7iruoye3zb--
