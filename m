Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CED8747E8C
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jul 2023 09:50:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD0F210E336;
	Wed,  5 Jul 2023 07:50:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E43510E336
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jul 2023 07:48:13 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 947075C01A1;
 Wed,  5 Jul 2023 03:48:11 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Wed, 05 Jul 2023 03:48:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1688543291; x=1688629691; bh=KF
 LNRV6qIyqwAD5yG3l02YxSxy2zFT/Mrid+n8DZyEw=; b=oIZjXfDGcWPaXU8zA9
 UNDTRrZX9Ud9Z0LlOrS1RgBs2fLTKLZ3KS3A+//mmYOp4Or4ZkaZ7zj4LQ6MmSDy
 3hs961nwu0pDbadJxg38tSahgZbUdpzWkAFIY2b89hWzQ886ZbVDqEzK2v0sHkb/
 mGu74J9Y/rI+K5DjvBGeap6VWXK6HD+tAAzL4gZqY+NwdYoV2UDPy35K9Bd2HOPL
 VPoTH1gPAh3mJX0dpjM+KuM3fcRWT1y+lqzNJ+U/kU8Cl4GefEHxo0y6twfnlBAO
 4OKzcc2b5/O+yByBI4yBtlBIF3ysGSMQ1WzPot6Ca4m132tsMkhcjCvYJdFcW/rW
 KMIg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1688543291; x=1688629691; bh=KFLNRV6qIyqwA
 D5yG3l02YxSxy2zFT/Mrid+n8DZyEw=; b=n/vtpbHyrHd3DUNG8ekLGrMqj8Wnq
 J2Iq+cpyrw4AH0TGn6uhpMrCoGMEs8kmANyZiWCCCWVP6IScR16YwGynWon1fbwb
 sN2ldPSyQ0Rcl5WI37k8lgF+6GXFXv9tiHdPePSPXXjQikLy5fjrxHb/WnoX4NEY
 8i71qbK+cxXgSHx61oeID1i/2G5TfaDmRhaaIY/hVVY5x6zG7RgYALVwEBUn24x+
 zEy8NDwy8A1pZW/rG25BZEPK+YB2Ku9bCkFbNIxBWHYV9x4vrnFELnMd9X/KBwRy
 uElWAP5s8t4Lvl1AcR6N5k+c4PJh6N5PiTo1WLDmAUIcUoBXHgrK+Dcug==
X-ME-Sender: <xms:OiClZJ_d81rLK3R_I-ADFvXNRfu-TD1G9cdqgr4bPpiQhdPAdIP4xw>
 <xme:OiClZNtSfEuov3VeT4qg_Ks0VlsQ6Y8Z-XOQwX355iQ61h6_WiGAANUpJGoy945Tg
 -22wJNYmfv0Y2BjVqY>
X-ME-Received: <xmr:OiClZHBhpBmV-zRZYsHHkIEF1rmdgOhIb6c0fT7VFZzBh4q28UIefx0SPfen8kg1gCrn1y1mb07qhY064XD6GA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrudehgdduvddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtsfertddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeeuveduheeutdekvefgudevjeeufedvvdevhfejgfelgfdtkeevueegteek
 gfelfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:OiClZNeIq9I_973ZRtPv2NfSUtmYgjcdRq4lA3nvmBxPAiAFsEV9qA>
 <xmx:OiClZOMxcqRBwfAT9M0qQg3hcbp10tAG3QtKS7xNRIq1SXLhXnC7ZA>
 <xmx:OiClZPnLm_XPgYKBvi4LsXzQQbvLdoDDMufVVGrp9_E3UeQ7ZE9c_A>
 <xmx:OyClZDe3clP6zT98o_xsrNbGdwVpFJkYhyivnMfVrgsPzgB-HRAMnA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 5 Jul 2023 03:48:10 -0400 (EDT)
Date: Wed, 5 Jul 2023 09:48:07 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
Subject: Re: [v5, PATCH] drm/mediatek: add dma buffer control for drm plane
 disable
Message-ID: <gmzb7lja2lfciu5m7ggxkftacaa6fbui45icwerabqad3lwrcn@nhdxug7fvh6u>
References: <20230705060719.14700-1-yongqiang.niu@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ezt5bj6i4x32plog"
Content-Disposition: inline
In-Reply-To: <20230705060719.14700-1-yongqiang.niu@mediatek.com>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 Hsin-Yi Wang <hsinyi@chromium.org>, linux-media@vger.kernel.org,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--ezt5bj6i4x32plog
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Jul 05, 2023 at 02:07:18PM +0800, Yongqiang Niu wrote:
> dma buffer release before overlay disable, that will cause
> m4u translation fault warning.
>=20
> add dma buffer control flow in mediatek driver:
> get dma buffer when drm plane disable
> put dma buffer when overlay really disable
>=20
> Fixes: 41016fe1028e ("drm: Rename plane->state variables in atomic update=
 and disable")
> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>

I think we need more details in the commit message about what the issue
is exactly and how it's fixed.

This definitely feels like it's not something drivers should have to do.

Maxime

--ezt5bj6i4x32plog
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZKUgNwAKCRDj7w1vZxhR
xV9gAQCAWEWYfF2KLjV9WKYKh0fUDFpBhF7eQHAc8CjPAuRs2wD7BD2SfZEq8/6J
HC9N7/Gkq8EGh2R3CfWFFDxJBgqxawo=
=zLuL
-----END PGP SIGNATURE-----

--ezt5bj6i4x32plog--
