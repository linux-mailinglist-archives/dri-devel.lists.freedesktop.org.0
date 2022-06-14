Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 994DD54AAC1
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jun 2022 09:37:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5FFB10FB46;
	Tue, 14 Jun 2022 07:37:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B014710FB46
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jun 2022 07:37:21 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 0FBF03200933;
 Tue, 14 Jun 2022 03:37:19 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 14 Jun 2022 03:37:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1655192239; x=
 1655278639; bh=wg1WM9Qi3pY7fS1DztK4KJHjvM53ufqXrbABiVEfdQM=; b=D
 1IKy4x5n9grz56po4wxtG8rhnugFCUVkMvti8oLheqFdQmXEGqWSSG0hG4qhPP9p
 o3spYPFlqQdg6bGNLl9f7FCWsrPqqWElVArUkabhPW1lWX6w+llxnWio8jQ28vmt
 V9T/f6xuWjN2G2gsVhn3/ZPdk9mpLEr6N8sgBJaCGbhGS7XsPT10lNJYdzzpfkUS
 eHlpWXofiajo+6t+p97Cf/+dLGkfG6eJqL4smtGOmhEeSXTjFxpXwsabJkyICEbl
 HdOkE2PrN/bN6FdUiitLhGZHOQ+XmsE1VuBRaOm8jKEspelfhMm1HmX/c0yB4KJe
 wr4VjiQjbjasekC+uFcrQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1655192239; x=
 1655278639; bh=wg1WM9Qi3pY7fS1DztK4KJHjvM53ufqXrbABiVEfdQM=; b=F
 NyvYv2pqioHoACPFwzAAdjSpX8epxZye3e7svC2CoG85UGtzIg3RvdbVw4uHKQ98
 RFhNL2j3SkbpyCBfmwbPXJGra0L5yf6CK6eeI1uyNQiOnv5I/xZr3L3MFcr9U1vo
 zvBP561V6AqwMF6IUqGqXnRNP745KYnkKfhKyrC63iEGix+ZY8QTX/EPQzM4iSUK
 gpvNbqWuHHij0EsMbugCfj1MvcEYo5DXa6GK6wonnpLsn2fCOWBcse7WuMMtX/6b
 2A/3TjOpWx83VvzpllzZOmfvxDtUEwbEqRoMkaGt7V0ssGM3AP0ugrPPhDRtQ1Qv
 5sD5OHc4otbJxZCE9H+qQ==
X-ME-Sender: <xms:rzqoYnPhaGKyugFi_yRsMXFtA9Bwa7puq7N1X9L3jAFI2JQALS2ERg>
 <xme:rzqoYh9sL_meOr5A5UOf5kqYPbn1AddbEWHIY9cDMBPn7PR53PeQvQq0qnmNt2LYL
 qXaqzWBeyEtKVdcX9w>
X-ME-Received: <xmr:rzqoYmQ7STpg8rrbyuH7YosdjYveauhIzQK38uItvmZr3Qb2zZOgaTz32rJF1gi4_TVq9wuPfqMTNNpHsmU3f6SgJD4vbqbz_prC4sk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedruddukedguddulecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvvefukfhfgggtugfgjgesthhqredttddtvdenucfhrhhomhepofgr
 gihimhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtf
 frrghtthgvrhhnpeetgfelgefggeekkefggfeludeiudffjeffgeevveekjedukedtudeu
 teefteefgfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:rzqoYruNnVnK6Lyh1LlOdgRW4leqGXJGZ760NUZzROQczj--ZA7Q7g>
 <xmx:rzqoYvceE8ShWkFxmIINr0F0l7d9K020t-InmOi2DYhcebMQwYuZGg>
 <xmx:rzqoYn21kOjghJEX03klDK-p0YFGqeC6DFjH9YJkDE86jB1U1VsTVQ>
 <xmx:rzqoYr5tGZ-3a0y9DG7wGJqmd9p0EF6PMvbjRSt3WgI8xASWmzurHw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 14 Jun 2022 03:37:18 -0400 (EDT)
Date: Tue, 14 Jun 2022 09:37:16 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 02/64] drm/crtc: Introduce drmm_crtc_init_with_planes
Message-ID: <20220614073716.zwshdcf3q5fjobuq@houat>
References: <20220610092924.754942-1-maxime@cerno.tech>
 <20220610092924.754942-3-maxime@cerno.tech>
 <d975dc1d-7573-7976-427f-e941cbfa0caf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <d975dc1d-7573-7976-427f-e941cbfa0caf@suse.de>
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
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

On Mon, Jun 13, 2022 at 01:23:54PM +0200, Thomas Zimmermann wrote:
> Am 10.06.22 um 11:28 schrieb Maxime Ripard:
> > The DRM-managed function to register a CRTC is
> > drmm_crtc_alloc_with_planes(), which will allocate the underlying
> > structure and initialisation the CRTC.
> >=20
> > However, we might want to separate the structure creation and the CRTC
> > initialisation, for example if the structure is shared across multiple
> > DRM entities, for example an encoder and a connector.
> >=20
> > Let's create an helper to only initialise a CRTC that would be passed as
> > an argument.
>=20
> Before I review all of thes patches, one question. it's yet not clear to =
me
> why drm_crtc_init_with_planes() wouldn't work. (I know we discussed this =
on
> IRC.)
>=20
> If you're calling drmm_mode_config_init(), it will clean up all the CRTC,
> encoder connector, etc. data structures for you. For CRTC instances in
> kmalloced memory, wouldn't it be simpler to put the corresponding kfree i=
nto
> vc4_crtc_destroy()?

My intent was to remove as much of the lifetime handling and
memory-management from drivers as possible.

My feeling is that while the solution you suggest would definitely work,
it relies on drivers authors to know about this, and make the effort to
convert the drivers themselves. And then we would have to review that,
which we will probably miss (collectively), because it's a bit obscure.

While with either the drmm_alloc_* functions, or the new functions I
introduce there, we can just deprecate the old ones, create a TODO entry
and a coccinelle script and trust that it works properly.

Maxime
