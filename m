Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 595B9538DE5
	for <lists+dri-devel@lfdr.de>; Tue, 31 May 2022 11:40:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E01410F619;
	Tue, 31 May 2022 09:40:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0985F10F5EC
 for <dri-devel@lists.freedesktop.org>; Tue, 31 May 2022 09:40:15 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 686BB5C0114;
 Tue, 31 May 2022 05:40:14 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Tue, 31 May 2022 05:40:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1653990014; x=
 1654076414; bh=u4zEnhboDSeP51AyldaWO4MlerqqIGwbqEy3LDx4WY0=; b=U
 9jo/IQewrmwkHvbZ6ydG3imiPyhKXUaQ8HkiPN/lA375Q/McScOyViGhLRRvsUgK
 bNhPBhspY04DlKLZMPuxBhW4/uCfl27+HGQmmdVVNQR2usoDVs2c84mhJhk/MPCt
 d+X5WZjsMXG8GPBSPtLHxFoIAo6ATNgcyoKcVfGOXDvEo1MCAft7+PyMja+IdsqE
 6610TdeKJtyZ31HebQbUvyxnVyXiVvuutMhFrONusVf7OlhhUUwvhyXiL4UZ/RvA
 SUvDsKKTI+nGZf+EyF/kAXQQTEjEDEwd3GJkrfBBrTaq8PZb3rIiScbaOuzVZw6E
 NcIPLaCO/dXXQaaSLonog==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1653990014; x=
 1654076414; bh=u4zEnhboDSeP51AyldaWO4MlerqqIGwbqEy3LDx4WY0=; b=J
 t7I5ZECwa5sSbvYlOzwefAGwazTFDekq0P/vmxXYQD9nsmPj+9pCbIjB6e0rVH7i
 O68R+RgteRY7Ikj3URmzTXiMT9wWfCGpdC2tB1tUCzeQeS2d9gGhe5JZvdsz6Xhy
 3NGg4m0wc4SMUZo5n9E31zUoulPRvErPjW64dS/DOXp0D93ypq0hUazjAw7N+4MR
 VdLHESFV+3+AZlzYp1SNbTF7hfoMcsNJyhi19v0s8HdVuMuTdXtdC6MRdlQW0qH/
 qEUq/Rl2N4BwD43Tej6pYPFLJnTeEqRgWGHEdDi1HBdiYMUGMpZPCmPHxfIBFZ4u
 5+aWRg8NNv1r5DowRFHxg==
X-ME-Sender: <xms:feKVYhr73uzfoFzeDR8r3GdzftWfjr0DnjDK8s4VkXFH2a-I45ZPkw>
 <xme:feKVYjpieIC8OeTquLWESMlCireN9uc_HBpe12_Fpo01oj-TGFGMVS9KtWnq3pyio
 04MtZ12z3ekJxzlxDY>
X-ME-Received: <xmr:feKVYuNGWqyrp6SAA0wxOti35TBxDLhW6hR14oM3Yzy3b_b17LeBSyYf7kU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrkeekgddukecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvvefukfhfgggtugfgjgesthhqredttddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeetgfelgefggeekkefggfeludeiudffjeffgeevveekjedukedtudeuteef
 teefgfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:feKVYs6MR_bEdpIQt2a1Ti7R667qVsr1bsll5HKSsxdOgF5HYJwDVw>
 <xmx:feKVYg7MI9NRYzxYfirkQvp2FV1L70cpwX1pbhr5wGxnOrP-AE3MTQ>
 <xmx:feKVYkgSYdEjptbZ6EzDTjph6HR8JuQKjn4Bv_kb0Bow1Lc_dwkeRA>
 <xmx:fuKVYr1wiljD2cOba9zdl9E2xYVntTn43A4x-35qAYb_Pby_XC-WBg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 31 May 2022 05:40:13 -0400 (EDT)
Date: Tue, 31 May 2022 11:40:11 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Melissa Wen <mwen@igalia.com>
Subject: Re: [PATCH 14/14] drm/vc4: Warn if some v3d code is run on BCM2711
Message-ID: <20220531094011.f7i2rb36fxt3o4ao@penduick>
References: <20220503121341.983842-1-maxime@cerno.tech>
 <20220503121341.983842-15-maxime@cerno.tech>
 <20220509165134.dilly2kelknk3iz3@mail.igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220509165134.dilly2kelknk3iz3@mail.igalia.com>
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Melissa,

On Mon, May 09, 2022 at 03:52:04PM -0100, Melissa Wen wrote:
> > @@ -915,10 +954,14 @@ int vc4_set_tiling_ioctl(struct drm_device *dev, =
void *data,
> >  int vc4_get_tiling_ioctl(struct drm_device *dev, void *data,
> >  			 struct drm_file *file_priv)
> >  {
> > +	struct vc4_dev *vc4 =3D to_vc4_dev(dev);
> >  	struct drm_vc4_get_tiling *args =3D data;
> >  	struct drm_gem_object *gem_obj;
> >  	struct vc4_bo *bo;
> > =20
> > +	if (WARN_ON_ONCE(vc4->is_vc5))
> > +		return -ENODEV;
> > +
>=20
> Just to confirm: as none of these ioctls were wired up in
> vc5_drm_driver, is there any situation where this path can be taken
> wrongly?

For this particular function, no, it wasn't reachable before since the
ioctl were only exposed for devices with the render capability, and we
were not using it.

Other functions in that patch however are called prior to this series,
especially in the BO/GEM related path.

Maxime
