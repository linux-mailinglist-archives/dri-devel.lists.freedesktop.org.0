Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 80F795B874A
	for <lists+dri-devel@lfdr.de>; Wed, 14 Sep 2022 13:30:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F81110E296;
	Wed, 14 Sep 2022 11:29:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F8C310E179;
 Wed, 14 Sep 2022 11:29:38 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 151235C002F;
 Wed, 14 Sep 2022 07:29:36 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Wed, 14 Sep 2022 07:29:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; t=1663154976; x=1663241376; bh=nQu2SC9skj
 3zvKgRAY+OE/EsK7UjSaSgeju0QfEt0Cs=; b=sI6+pKkRrFiyWe0Di0vUI4Elub
 WU2WZ16qg5NsAIf4cYxne5RPHmLNkNbOnTap31OE31Ikj6KyXkxyRBvzyARaAhH1
 4WaF17Vp33VyqXlgHWVeTnX5TE8blIAtgT28busRsPYDhgksEk1HjeCc08Wvga+t
 bskfWscIPId4Ly552s6iPRxZIfV693nUdEISY1m1C6cuM/CBHr2clsj2w6waZpUc
 kcNd7KZM3nEz3ZczPhAysdEw9m6h8AG4IDnT16cTpd7wxRGIT51rselgZprVkbNo
 cV2i7Zr6x+DVMwNNIE9IhKXuFhnjxru5j7vvcHFaD2a37X7XKXbzwbCoWkvw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1663154976; x=1663241376; bh=nQu2SC9skj3zvKgRAY+OE/EsK7Uj
 SaSgeju0QfEt0Cs=; b=tB/hgMgRkBvvDe2Larr5g2Xf2i8pcNlw8zMWLcyXqMtz
 RB6o4uF3NQfWxsrTx4foH9n8N0buQUyc78NvdvGkG4UlhuwObb4DLW7+hBTGHLOI
 lz+e2Q5CLfsdCvSDgB0+WnUG5qLcyw1qIvyWSVO2MWJgapsJp1mP+Gu2aPma6Ict
 WXXqlCMcwpPIUC+xd91w/xzze6dFXsOtXBwdztItwSbghsQjRH2NPHQVRhFBnZ6q
 dY908u0Y4DOR5UQPGpXG3/WuBqpOiYl5lrcVVme9qasVWakJqRmTomu16NE1d1XL
 GnsoGxdlzWy+uNseiD8/XdR6ysJ9+BdoSF2XaJiEiw==
X-ME-Sender: <xms:H7shYy-z-Sy-s0CYkYhiWGEo-Fk_sa4yzpFsShmbVmcw8NKVEim-Ow>
 <xme:H7shYyuhl7apl0uzCWtoXaLVdsY3vIuHlVJPZVfymPsr4NqTL0cxTJskRvonuk2hn
 j43Mbjcps8eNMsiwoQ>
X-ME-Received: <xmr:H7shY4CZYM4ETUI7hJOe8i-3Bo9XlCMwvu1ooLO0z2Jo5DxvZAi390_OMsGo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeduiedggeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeetfefffefgkedtfefgledugfdtjeefjedvtddtkeetieffjedvgfehheff
 hfevudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:H7shY6fH7W_BVuQc_Pv1wOCbe0JZZwDcqIOQjR9ElV0d0XyvT8FDFA>
 <xmx:H7shY3PQ1WXtryglSTdW3rrdTj3tpcFZXxBJFYoc6JJb0xJRVeA8nQ>
 <xmx:H7shY0mvO9oKdlpqejxArcWaOLnY7GbsVZO4bMdJEo1YmlDQ9Owr_w>
 <xmx:ILshY6hp7U4y67xd1z7aW61uMylQ-NOWf_PLrKUGCD3bAJEil6TFPg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 14 Sep 2022 07:29:34 -0400 (EDT)
Date: Wed, 14 Sep 2022 12:29:33 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [GIT PULL] Immutable backlight-detect-refactor branch between
 acpi, drm-* and pdx86
Message-ID: <20220914112933.64ovljgsrv2l25rs@penduick>
References: <261afe3d-7790-e945-adf6-a2c96c9b1eff@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="hy5cszh57lz34buf"
Content-Disposition: inline
In-Reply-To: <261afe3d-7790-e945-adf6-a2c96c9b1eff@redhat.com>
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
Cc: Karol Herbst <kherbst@redhat.com>, "Rafael J . Wysocki" <rafael@kernel.org>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 platform-driver-x86@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 linux-acpi@vger.kernel.org, Ben Skeggs <bskeggs@redhat.com>,
 David Airlie <airlied@redhat.com>, Len Brown <lenb@kernel.org>,
 Daniel Dadap <ddadap@nvidia.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 intel-gfx <intel-gfx@lists.freedesktop.org>, Mark Gross <markgross@kernel.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Xinhui <Xinhui.Pan@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--hy5cszh57lz34buf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Hans,

On Mon, Sep 05, 2022 at 10:35:47AM +0200, Hans de Goede wrote:
> Hi All,
>=20
> Now that all patches have been reviewed/acked here is an immutable backli=
ght-detect-refactor
> branch with 6.0-rc1 + the v5 patch-set, for merging into the relevant (ac=
pi, drm-* and pdx86)
> subsystems.
>=20
> Please pull this branch into the relevant subsystems.
>=20
> I will merge this into the review-hans branch of the pdx86 git tree today=
 and
> from there it will move to for-next once the builders have successfully b=
uild-tested
> the merge.

I merged it into drm-misc-next, thanks!
Maxime

--hy5cszh57lz34buf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABMIAB0WIQTXEe0+DlZaRlgM8LOIQ8rmN6G3ywUCYyG7HQAKCRCIQ8rmN6G3
yxexAQD6R+v7rkQb0GeB4b/P6qIJ8gkrhQhlZLrmcPYoUuwldAD/fLehBZhVa7TE
ohzG1kghzg7S8i2Op8YPG+18dMDqoTU=
=37BB
-----END PGP SIGNATURE-----

--hy5cszh57lz34buf--
