Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C2D83EFE08
	for <lists+dri-devel@lfdr.de>; Wed, 18 Aug 2021 09:43:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33A496E45E;
	Wed, 18 Aug 2021 07:43:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 853976E45E
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 07:43:44 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 8061F3200924;
 Wed, 18 Aug 2021 03:43:41 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 18 Aug 2021 03:43:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=hTxAEm5NCILDJP8sqWCxMgjLIUz
 +QEPe6HKlycInzZY=; b=wLIhItgemXKHzDjR/KtpXhr0WAej/WxprMslJ4Tzr/o
 R1zt2BAgWKkGPQDOfMG86kM70q0hiUTJQBeuX5SgrpU/LcXY7QzQezthDgZQkO5k
 zQykwZhBO3UV2khfn0tnaUlnL58oyiAfI74vb3eLNgwwugS73tUUWrskxh6LkOHG
 N6kIWFrCg0kxRtt0+VIGkGn5KAuSnjj8OB6pWAr7A94kv6aapiOvCH0Ce+Y97NGC
 Qbu0y7ZR/6k7pd6DMedvTNsaoiS3qDlYXmaWKkz0E4gpNRZAKjW2g7d5XXpGmV6C
 UNZxYv7VmnvuvFv43Rxn/e5qsih5T8/VxTx45S3KVVg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=hTxAEm
 5NCILDJP8sqWCxMgjLIUz+QEPe6HKlycInzZY=; b=nGg1B46mxZiRvhSlMipJ9z
 nnp9VJYjmjWzBYNmgnaxqN8VVKKV34hfkJhrfsWNF4eams0iOgSSy9nceVUWNq9J
 EagJ++OlTDligRgMpx9/k0bg1lZhpZLBpnrU2LnxnEoPPN2Rzp3oU9sRKdCy1D9P
 qoVueZ+oUH2j0trh75CP9O8iyA6IONXqf03N74vv7fr5Pb2n7l9CMl8jpEO1DZEj
 WOXeIj59lVRn3yXahuHyRemMI+7uL1KTmaPw0Zrwz6h+YGhrWnQDTcwlDbe3cb0d
 t7cmfRy5pXnm0y3wAASlhy70ltgozPcrOjxd71M7OLHQR0hjJ9r5y6NaRtO9U9Lg
 ==
X-ME-Sender: <xms:KrocYQ_pFkf5dW58X0PBSpbRPsFQazBMBswi0cBh0MW4-PDqtRt6lQ>
 <xme:KrocYYvR7v3-EcKp-NXlk7wCOrK2yImndkKhqJryJyIaosQULbwzjLYEzty5IRHBM
 uFvn4aLrZnindOGIkQ>
X-ME-Received: <xmr:KrocYWBydlzjYyqQryVDXfuRVinEqcbiM9uRwHQSh8ifsTM7qL1OOfrN9wkweS4DqoaWqjwe6Y5I6ml58B2JjPiRgFA6JtDtA2q0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrleeggdduudelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:KrocYQdflL5fdJKFdu9CAIYSO9JH17tov_fy1zAJQoBWmblIAytXYw>
 <xmx:KrocYVOERFuphrKEbHUsMN5rEXBsZjeIwUFDcDKoYTTJ19aA2NuwaQ>
 <xmx:KrocYamFeeJldb9eXy-hL_nLhGxgImCjOdvmPQSGpt45niVCaAnSPg>
 <xmx:LbocYY1Ru1I61r3Mm_b7QloBRsoLPc7mcjxUz_HcKv-Uo7MqAn93LQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 18 Aug 2021 03:43:38 -0400 (EDT)
Date: Wed, 18 Aug 2021 09:43:36 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Cc: emma@anholt.net, airlied@linux.ie, daniel@ffwll.ch,
 p.zabel@pengutronix.de, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/vc4: hdmi: make vc4_hdmi_codec_pdata static
Message-ID: <20210818074336.lgrefafeq7wjqu43@gilmour>
References: <1627640794-15718-1-git-send-email-jiapeng.chong@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="x3nzq4ue4n5wbp67"
Content-Disposition: inline
In-Reply-To: <1627640794-15718-1-git-send-email-jiapeng.chong@linux.alibaba.com>
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


--x3nzq4ue4n5wbp67
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 30, 2021 at 06:26:34PM +0800, Jiapeng Chong wrote:
> This symbol is not used outside of vc4_hdmi.c, so marks it static.
>=20
> Fix the following sparse warning:
>=20
> drivers/gpu/drm/vc4/vc4_hdmi.c:1479:25: warning: symbol
> 'vc4_hdmi_codec_pdata' was not declared. Should it be static?
>=20
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>

Applied, thanks

Maxime

--x3nzq4ue4n5wbp67
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYRy6KAAKCRDj7w1vZxhR
xb+nAP4jWc1smvmcmwSRMne7nFgqkHVmsiVJTSa5CaWo6EFmWAEAqqdSdN/1Jpe1
GI3rmxX8XTAkEsUl2WATlZh9+oS7UwA=
=DW2Z
-----END PGP SIGNATURE-----

--x3nzq4ue4n5wbp67--
