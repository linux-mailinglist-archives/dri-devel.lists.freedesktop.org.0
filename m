Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92F5538FCE4
	for <lists+dri-devel@lfdr.de>; Tue, 25 May 2021 10:33:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F322F6E1A5;
	Tue, 25 May 2021 08:33:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE7B56E1A5
 for <dri-devel@lists.freedesktop.org>; Tue, 25 May 2021 08:33:25 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.west.internal (Postfix) with ESMTP id 08861133D;
 Tue, 25 May 2021 04:33:21 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Tue, 25 May 2021 04:33:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=S1MKc2LTzqFfMkbzes6qor4rlMA
 0FRJOF8EOUe2EQAk=; b=Nd7m+vMGwBXoe5QAu5HYu6IxXnVBTbEE+4uv06Uq/hM
 BeETs5F7qrxEm/LoKyc3nSFfOw3V38Ad1bG97KUJFXrFKoeeIVrHHiFIDqc9HTYc
 kSk1Fh04MDN6TpX3GkC8H1B9MeQha22lXIuXc1tHIJT6if2hJO4mM1nc7sYnURUJ
 k1hTCemd7L1z1VHY0znscSdcZY/I3ATUDz+zkzZkoaNR4fCEKr2i+S7naRAPwJg1
 cI7pj1GwQNyfTLceZ/Urs3FS0Z0hXnikXj5RIGike9k1qHI3nbdEcOzLZR46DtD7
 3nckeiNWoKivRpF1Xs5mLVq4A3jkOlRmeZ0p4zZ+hgg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=S1MKc2
 LTzqFfMkbzes6qor4rlMA0FRJOF8EOUe2EQAk=; b=jSK+YWcG1vjuJHY2ewMiRj
 eRV2eoEFALrfZo3MiAnRwUafppEjmAPvY1tTUOSMQguzTAh4cOqQjxi/iGbC/x+f
 P9su7ZiFCvDzvIveaopKAdUrPMktK6W+6esiTv+u/CnJQ+Sani+t0WG0XFSRS9Zg
 ttlqqpMku5QRZdJ6GVGsD+TJuMG48XYpr136bkg1lz0bjKxE/NG2GChHPBwm3w8R
 Np5eYdx7iGj0OnK2BDJwRyLNaWze7S36XZmrMDwrpZTsGpM5C710N3d3yB9ebfjC
 41jgiKWNzR2QA8gG3ICtzLzKMufQcb27m/QMH6l8p4TXwu6nDrAnBdzD9amOBtcw
 ==
X-ME-Sender: <xms:ULasYM0rmX1BNhdfP-fv9hI7eX1esrkwRJyB2ocug-EbK7U1sD-71Q>
 <xme:ULasYHHwg4bzyXNfFCzJLigpxxyT9tOnolIrU1THk7s5u3VvqoRoe6d6st8duk7VC
 mPB-CEvfV35rtd1cs4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdekuddgtdehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:ULasYE4-v234zl_lB3gj0I46g3kEVNjxs7L_D4z1fbxpCIcv2I9FhQ>
 <xmx:ULasYF0HM-UI7vWzUwhHND1VRD3G9w530ZbiOj6xLITzc43fCm_loA>
 <xmx:ULasYPF0VxtTRryS-2Cfk95Je9ph6Wmzi7UedsyZeUsv83vgKkBuhA>
 <xmx:UbasYHBhuTk0XLsmuhoFFYnkiG_L1knxmmRJi_iiyNYdDDM_OJRg_A>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Tue, 25 May 2021 04:33:20 -0400 (EDT)
Date: Tue, 25 May 2021 10:33:18 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Zou Wei <zou_wei@huawei.com>
Subject: Re: [PATCH -next] drm/vc4: hdmi: Fix PM reference leak in
 vc4_hdmi_encoder_pre_crtc_co()
Message-ID: <20210525083318.il7fpw77hqz4xxos@gilmour>
References: <1621840854-105978-1-git-send-email-zou_wei@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="c42up2dtt3g7m2xe"
Content-Disposition: inline
In-Reply-To: <1621840854-105978-1-git-send-email-zou_wei@huawei.com>
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org, emma@anholt.net,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--c42up2dtt3g7m2xe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 24, 2021 at 03:20:54PM +0800, Zou Wei wrote:
> pm_runtime_get_sync will increment pm usage counter even it failed.
> Forgetting to putting operation will result in reference leak here.
> Fix it by replacing it with pm_runtime_resume_and_get to keep usage
> counter balanced.
>=20
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Zou Wei <zou_wei@huawei.com>

Applied, thanks
Maxime

--c42up2dtt3g7m2xe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYKy2TgAKCRDj7w1vZxhR
xaZaAQDZDCc9ASSbGCFKYex0RNg+c1/DnKu1cWu6Oi+cYt5y/gEA5/RuBztawrSQ
5dxqSNOHRwo/PUAIcARGH7Ea4vxBFws=
=olsI
-----END PGP SIGNATURE-----

--c42up2dtt3g7m2xe--
