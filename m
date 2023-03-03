Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F0E8B6A9A38
	for <lists+dri-devel@lfdr.de>; Fri,  3 Mar 2023 16:08:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EF5C10E67D;
	Fri,  3 Mar 2023 15:08:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A76B910E67D
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Mar 2023 15:08:11 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id E82C25C018A;
 Fri,  3 Mar 2023 10:08:10 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Fri, 03 Mar 2023 10:08:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1677856090; x=1677942490; bh=AQ
 vAWBCpKh+OXyoXHEj1+6yBxi/X10+bIJofCu8bNLo=; b=d2URbeiDRmV+cmJyAp
 XKfMhxrG3lG6/HiWUo+/KEwqdz4bG93R8+ec9ZllE1rUWJ3Lrp3cLQrDbPclTszt
 2SKK/hH09jsQeN2umGusP5LeTC13NS6+v36DwHyXuYSW1UUulv/jJLorYo81pmWc
 m4sQoId2A9/sSesKGCATpDWA0xKKRK5MPbx9BZf0WQZPIOspDarhEunsqYBGsA4V
 6K1wAw3vbFm/y/TMZoxIvADcjfSKrIljB46P6iqMy554fY0D4FgFvtyOA1hvaEeh
 HIKr8DFlXryoOPeDLsIK4JBd9ix+32Zd6tJ6ZqZIxd9B2b9jvx/N9DYP9VndSEpr
 rDVQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1677856090; x=1677942490; bh=AQvAWBCpKh+OX
 yoXHEj1+6yBxi/X10+bIJofCu8bNLo=; b=hk6IXWe488hM1XU3LlZnlA32K2l2k
 BH1RSbkRPQpL0c6o/XSWkvgCib2rr+FSsxbdAgFOdtUzjrHi6dXVFB0l3/YBexQv
 qglCZ8aog+i9iKDaIhtZ0uxtjUhtjJXE9Kcb0Dnu79P8ihM0wwycgsT/92VbcDQP
 PtYs84vurHQlsynWswzwZqDZ7YEX7oe1SA905ZL0nIaVGcMVOW+P0Ykdug6JyZhy
 Vf6SRpsdggi9ncwlrkKxr861qOwQiuy1ZX/Fvgi1+otu+js+DWybQ892Wjl72ZNP
 iuz6Zty8gmaIkLEDcgUZYcGjoGRuXPdBJhxwQWo7bqtRPey99OWT2XmPw==
X-ME-Sender: <xms:WQ0CZNE-hpFYnvq9hfVfF8iirCforjAPEOP74cAyT3gVBefg8AANOw>
 <xme:WQ0CZCWhOgGCaK8DmpvYd-VGbaTE16P5UfIAtBw_6skuJPW4x5utb_ivir44SsPDS
 rNgOy516Gu-SLALsoo>
X-ME-Received: <xmr:WQ0CZPIyOs5uHzfjWZoQtiYLhmtLbUXgDS7d7g0PFZXdxrCvVks-sA2jg7NcTj8TQoQqio-R20rlpp_AC1j-nzE1ahstrko>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudelledgieejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeetfefffefgkedtfefgledugfdtjeefjedvtddtkeetieffjedvgfehheff
 hfevudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:WQ0CZDGJiDCa9hNtAuKu_xwxXnZvZ-oQs2Y-z24z05zSecwG0AlgnA>
 <xmx:WQ0CZDU01IigFpXzTaCZCYub0JSAwWQohvvBrVh5aPGxmahIt5hvOg>
 <xmx:WQ0CZON0BIF6g-cEboYrmkT2sc62m9s8A6gXPqqal2UQ6NLPkx_kEQ>
 <xmx:Wg0CZNhLybVzI5RGLDFIyE95XP0m3zlfBobl8LOi26o8c7_frigzWg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 3 Mar 2023 10:08:08 -0500 (EST)
Date: Fri, 3 Mar 2023 16:08:07 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [PATCH v15 12/16] drm: bridge: Generalize Exynos-DSI driver into
 a Samsung DSIM bridge
Message-ID: <20230303150807.4hhpjinuac6uyj3p@houat>
References: <20230303145138.29233-1-jagan@amarulasolutions.com>
 <20230303145138.29233-13-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="lyd376o5ks52xdet"
Content-Disposition: inline
In-Reply-To: <20230303145138.29233-13-jagan@amarulasolutions.com>
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
Cc: Marek Vasut <marex@denx.de>, Neil Armstrong <neil.armstrong@linaro.org>,
 linux-samsung-soc@vger.kernel.org, Matteo Lisi <matteo.lisi@engicam.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Kyungmin Park <kyungmin.park@samsung.com>, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>, Adam Ford <aford173@gmail.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--lyd376o5ks52xdet
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Mar 03, 2023 at 08:21:34PM +0530, Jagan Teki wrote:
> +static int samsung_dsim_host_detach(struct mipi_dsi_host *host,
> +				    struct mipi_dsi_device *device)
> +{
> +	struct samsung_dsim *dsi = host_to_dsi(host);
> +	const struct samsung_dsim_plat_data *pdata = dsi->plat_data;
> +
> +	if (dsi->out_bridge->funcs->detach)
> +		dsi->out_bridge->funcs->detach(dsi->out_bridge);

You should never call into the bridge ops directly. If there's an issue
in the helpers somewhere else, fix that instead.

Maxime

--lyd376o5ks52xdet
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZAINVwAKCRDj7w1vZxhR
xRHKAP9x8Qms3QfdWfBYHyfguem/IEU+Bpet7iyp2d5df7LJmQD8CM6pXlSWcIkt
6lb7wlxZKEOwCaQX70n6278IFKKgEQk=
=oyIt
-----END PGP SIGNATURE-----

--lyd376o5ks52xdet--
