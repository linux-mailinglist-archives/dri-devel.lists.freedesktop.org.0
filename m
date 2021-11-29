Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E66D1461178
	for <lists+dri-devel@lfdr.de>; Mon, 29 Nov 2021 10:57:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A4856EE1C;
	Mon, 29 Nov 2021 09:56:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31C1C6EE1C
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Nov 2021 09:56:58 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id E353C3200F72;
 Mon, 29 Nov 2021 04:56:56 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Mon, 29 Nov 2021 04:56:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=m8TyYIsx9xOvR1vRNaFs/1pR+xi
 5e9uMtHXU0T6smks=; b=UAositeveOhIS7t0TSvqu8tJTLNoal89yynv1VexHYV
 +HXfNDsqQA3bf95fLcaVmnqK2Za0hGZzQv1ZFhVMOVLUcWIj/e+f4/Y1cHMzLmY9
 eO9y/8dBZh6nBN7y0BcdJxedxoD8pcXnS4j0iZU8ROuQ3GIan9O0GLf/4QtcFaWt
 3E5/mzE+azS8VTVfTEjb09UuuNS6AZWqAUYLXXP2f7z51VjMsZUqhEfahwOy464y
 bBGwRRQbk/8o9R/HgcoUyFHLjD+8g6QVK3zB0vSlTJ/PpIs1Eje5rVujT6bZTSPE
 hiwGrVH0J07Dxzj7fGbwELov8lI3+y7DBvq4rq9hSEw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=m8TyYI
 sx9xOvR1vRNaFs/1pR+xi5e9uMtHXU0T6smks=; b=ge3jFCMt2i1gIL9ZWxkI4c
 76B9LmfwOAT84VoX1yL/VkTp2uE/Sx1l2MTj//vhmWlOPwlOcCY9ZiB8u82wLXJy
 ftmEt8STHDAnKSSjU3cRS73GE+13yscu/EIwTvRFFPwLuiAL3H/OsaxCQSivkNp9
 tl2vu4let1PMu98zyPhWKr+EzBwIiAnHF7CXzqFvlFLDH5+OQwT9gMSTLiadmgmd
 NKUetSlJf72DxlwDSfpOkXFYNQ3Mhaf8w+O6/25f+ZJuhzIOaoqpWEIIpDDVvdf+
 Na7/JY/HxyxVjcg85mB5XQKz2axdKihLJB0bm5XPp4ixX3xWazIk4dNjdlKNNEow
 ==
X-ME-Sender: <xms:56OkYTVB53wORVyPK1ixElvnpiP7-lG9MrdUMIlIfLW7Bk1dcW2i4w>
 <xme:56OkYbl93k33XYTnnWxqnJN6dEhWcepVLe-2nXEQP5zjsF8G5huRbRsMKuKtglu1T
 QuFX86y80gtI3Bnt-k>
X-ME-Received: <xmr:56OkYfYVnFjlgjrGv0tuaZCjIMP9NbViL-YbuxDvT_ADJvD8CUfFpNzPqHe0FbzXBuX0of1QTsOWKbNt-fmI61zn446An8dDDGw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrheelgddutdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
 udenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:56OkYeXJ283TB6CWI4TnY7iAUlg-CLOx-_J6r4My8s2d74FUfG23uw>
 <xmx:56OkYdl4WA_H_VZbvbzoye78aTYLHYoBYjZ3naNVGrqQWeJ9HPRt-A>
 <xmx:56OkYbcGMRyq2T4ci_b9B8BiZCbBqb-olnCj1T-LyV8WUNeKh6N9BA>
 <xmx:6KOkYTXotsx_LTg6moEL35gSVakb3bNWi_gYfL1iwIe_zJB8F0FLkw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 29 Nov 2021 04:56:55 -0500 (EST)
Date: Mon, 29 Nov 2021 10:56:53 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 2/3] drm/cma-helper: Export dedicated wrappers for GEM
 object functions
Message-ID: <20211129095653.s2psy7jioo4gbcks@houat>
References: <20211115120148.21766-1-tzimmermann@suse.de>
 <20211115120148.21766-3-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ngsbwmijeassbwht"
Content-Disposition: inline
In-Reply-To: <20211115120148.21766-3-tzimmermann@suse.de>
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
Cc: emma@anholt.net, airlied@linux.ie, dri-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org, kieran.bingham+renesas@ideasonboard.com,
 laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--ngsbwmijeassbwht
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 15, 2021 at 01:01:47PM +0100, Thomas Zimmermann wrote:
> Wrap GEM CMA functions for struct drm_gem_object_funcs and update
> all callers. This will allow for an update of the public interfaces
> of the GEM CMA helper library.
>=20
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Maxime Ripard <maxime@cerno.tech>

Maxime

--ngsbwmijeassbwht
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYaSj5QAKCRDj7w1vZxhR
xTnaAQCSOxr0EGxq4RfySbVOu+zRxX0vmXSKoHdMRVvyGOILyQD+OLSOazH7QBe3
1k/BjjbGOTA0xpCIRtRBQVShjGl1Jgs=
=vbmr
-----END PGP SIGNATURE-----

--ngsbwmijeassbwht--
