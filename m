Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EE813C356E
	for <lists+dri-devel@lfdr.de>; Sat, 10 Jul 2021 18:03:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 678FF6EB42;
	Sat, 10 Jul 2021 16:03:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78F9E6EB41;
 Sat, 10 Jul 2021 16:03:38 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id E600E5C008C;
 Sat, 10 Jul 2021 12:03:37 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Sat, 10 Jul 2021 12:03:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:content-transfer-encoding:in-reply-to; s=fm3; bh=D
 4kIgELXC+ja5B1M6F1y6Rp6QF6xA5GM7lTTLuwJwWk=; b=gc5Ao2BzuTk60gY+O
 fXAjXJVZVQGJhLnMcATvr4eJY+BmNPqj9p/ifSJxSK1pPpzRwc/qTrqC5laIzGB7
 n1SfuQFlC22itMgTNFk1SjGP2y5KUqtsFanm9CN31nrQLDnpZ4VNGOdPy7yYH0yx
 /OsE0gDRDbgGUoWRJYnBjy+WnaPBHefTqs/BGWU/aLjHwOxYPhTkTuOVzocmGPlJ
 lNt4AzpAM1yB/3Xa2D0Wuo+Yp3bw/BGZXt4ldFfBzQ+/tHXvrH1DDz50TgxQtiNf
 RigTALDXD1bybZ7bTdJU7JQlEHTzvKtknUqlF0exaMws8BKoKpxH8yoRiS1j4mVo
 /CufA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=D4kIgELXC+ja5B1M6F1y6Rp6QF6xA5GM7lTTLuwJw
 Wk=; b=lkQp/thpikiAE91x9WN+hmj9uKgjExmN1SWlovo4IDABxo/mt2nXED8e/
 0RvtGtFcjaQtKSWSTS8Q+2fZqD5Y+b8cSSQ1NWzfr7W8x+NstlGKKesNZhbJlNue
 ddIQGAqmQ+2mJL0N3FjALv907wGXbPPoDgYnAX4cI/yP9VjvQmgOFf529aFrFQLW
 Vb95xOB9cOp9m3Q/Z2VtY9f3IBGuq72WmCQpEvxBTTSJmFxfNkWJAjhhLrNoeCxx
 ucbKEWPql0bvJpaa6NWSSON+UPvZxkgIPr8Bi7I1fWP032hJ57SupCn41Q9dhof7
 uC1BThlR1blSwVXo+HGDPEHCbO91g==
X-ME-Sender: <xms:2MTpYNFKGwZVcFIIx4hSZTjwxeLfPN7s0q09YIJNtbinCt9F73QHVQ>
 <xme:2MTpYCW9eJ0Jbtwjm5V94L464e_ITVKfUbu8X9-8AxqZMZHlbzyEOonVdx9MQKUW_
 tG19H6c9Eg9jS3otkY>
X-ME-Received: <xmr:2MTpYPIe1PFZxBCIGDGk132WQCBHCGdMhjV9Ik1R0Va2sPJAVMomUQ1WPDQtyKgKsFMey_FzeT1Wnwof282EeW6h8MEzFcL8I6e5>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrtdekgdeliecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggugfgjsehtqhertddttddunecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepheelvdfhkeelgfevleekleduvefftefhudekvdffhffhgeefuefgheegfeej
 vedtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:2MTpYDEFGjOoMzCTW5jtWttBilh-3bHDfuvjSxuFoTJA9CaWyW6KOQ>
 <xmx:2MTpYDUALqbuqamxfvZmf01EWbfIFvJJnw9BAAACA9ka9qv4vxgwKQ>
 <xmx:2MTpYONQiL2FMeCVtEfMNN9394L4eh10XGY57AL7mPhF7C2wLieCiw>
 <xmx:2cTpYJc_gsCfYvDRoWb9BhL1c7T1BJbQLumJ8-oFxFzB8ZOE19JJdQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 10 Jul 2021 12:03:36 -0400 (EDT)
Date: Sat, 10 Jul 2021 18:03:35 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH] dim/drm-misc: Add rule to not push patches with issues
Message-ID: <20210710160335.ckpnyuoxegto5ekf@gilmour>
References: <20210709081116.4170288-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210709081116.4170288-1-daniel.vetter@ffwll.ch>
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
Cc: dim-tools@lists.freedesktop.org,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 09, 2021 at 10:11:16AM +0200, Daniel Vetter wrote:
> We kinda left this out, and I like the wording from the drm-intel
> side, so add that. Motivated by a discussion with Christian.
>=20
> Cc: Christian K=F6nig <christian.koenig@amd.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>

Acked-by: Maxime Ripard <maxime@cerno.tech>

Thanks!
Maxime
