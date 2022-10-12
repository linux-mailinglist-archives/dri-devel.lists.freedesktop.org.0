Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AABB5FC601
	for <lists+dri-devel@lfdr.de>; Wed, 12 Oct 2022 15:10:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BF7F10E4DC;
	Wed, 12 Oct 2022 13:10:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA23810E4D7;
 Wed, 12 Oct 2022 13:10:49 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id C0AB85C015C;
 Wed, 12 Oct 2022 09:10:46 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Wed, 12 Oct 2022 09:10:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; t=1665580246; x=1665666646; bh=H9wPJAJOYb
 KfLaHG/xOSPuQgzeInqesMbKdluf/JwaM=; b=CHgZ+ol1rm0yEmpX0kDCchjYnx
 Gji3PnjvBc4BtHWkUFkmdTsDUIeeZFO/WI+oUJGhzAORg7RSGBKCcb+TEtA4isXH
 Qxfo+2ev2efX+KVnsZzWiS75XUtRHFvtTcDTO5zsUwuUbrTo/p41EN06U3beSvZ6
 O4JjFpBGAzD4TBfEJFmmzIVGSTh+YIj1yN9/CYaI6xMfhUgWXW8z4TCYHgvasSag
 MVI3jHfMDe53E4IEZJxmsjaxcXubnyh0XaMHd1Z79fPNjDq7bIypjs4zXiG5JHMq
 Y69mmMkFiyukA0IayRfk7EZDcVjq5z6VOBXX7qJJjPcBiJiDVe5jduQGVqPw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1665580246; x=1665666646; bh=H9wPJAJOYbKfLaHG/xOSPuQgzeIn
 qesMbKdluf/JwaM=; b=pT162Ocb6GYSW7++otmfB7Nj7tfZHRtOPLcY6VAWgt4k
 WzXdodFXCtEbfAC/W3f2zm9BEbECVi4WtagdsMNYb4BjvyWP4Hi2ckfALOtOJu53
 zjAyIiVM5sN4bLTbab7qbM3UU/iaIOgOCdUfhvaWGPHwSKINHPhW1/3k9RwU7fB+
 C+Bu89j1qdRc0/5U4UohgyI9UPqEMrWQ/7gYaX9FVUL2EFUJT6+FoHySy6nWWYpl
 YcM+1U6LL/1FwLJJPqVCNg2i95JKYJ9A5VOAiQImqnB4OQyvcf0DWqyFINLoOKB+
 CkJAAihJLbpJhubbSm+A0+z+z6p3eL+3oJl9lTETSw==
X-ME-Sender: <xms:1rxGYwdzrmi0kTM0ma1V72nCBM9gPtYsVuSlE1zduBSobgWSFuK5GQ>
 <xme:1rxGYyNgCbJ3VXvSTY7zKrLRjaTnrk89akn3MdpBhNOq_GbeovWBW4-ma_s20mwCj
 U6yNK_j-IJvcOfyLW4>
X-ME-Received: <xmr:1rxGYxi5ASwhJ2qB939XRAt6Z7xkgPFEWJ31_bGoGhALYJvD6BELJ2YNcUQlxtxttvYXAHpGKB9uLvU_6hfhhH6uCYCZ4NCtf8eP>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeejkedgiedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeetfefffefgkedtfefgledugfdtjeefjedvtddtkeetieffjedvgfehheff
 hfevudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:1rxGY1_LCgAnOIylDbQyfAknL6HIrYptziDPHhkdI0uPyynCLrzFjQ>
 <xmx:1rxGY8u1J9EwUgh1F1ws7Q6lfYxn-yvYKbGfRnnfSLJgvZsUvwIzzw>
 <xmx:1rxGY8FlR910fqzPJJ9kKfc2rZnEOhMjS8rli4_bkqBOGLsCFtvYlw>
 <xmx:1rxGY9lQ43rSBsDN-D65rk6JvU_KSFX0_O6q3G-xEFDAry1naLHYCA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 12 Oct 2022 09:10:46 -0400 (EDT)
Date: Wed, 12 Oct 2022 15:10:43 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v2] drm: split build lists one per line and sort
Message-ID: <20221012131043.teqj46p6dpi4opil@houat>
References: <20221011140830.3257655-1-jani.nikula@intel.com>
 <87k055w7bz.fsf@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="s7akttmaddptsmxz"
Content-Disposition: inline
In-Reply-To: <87k055w7bz.fsf@intel.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, intel-gfx@lists.freedesktop.org,
 Andi Shyti <andi.shyti@linux.intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--s7akttmaddptsmxz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 12, 2022 at 03:32:32PM +0300, Jani Nikula wrote:
> On Tue, 11 Oct 2022, Jani Nikula <jani.nikula@intel.com> wrote:
> > While it takes more vertical space, sorted build lists with one object
> > per line are arguably easier to manage, especially when there are
> > conflicting changes.
> >
> > Split anything with more than one object file.
> >
> > v2: also split drm_cache.o and put it after drm_bridge.o (Andi)
> >
> > Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> > Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
>=20
> Cc: drm-misc maintainers, don't really want to push this without an
> approval from you guys.

Acked-by: Maxime Ripard <maxime@cerno.tech>

Thanks for doing this

Maxime

--s7akttmaddptsmxz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCY0a80wAKCRDj7w1vZxhR
xcxmAP93UAO9EYAS02aw/JsbZypk+gvvpkFXRPWeaSxu4gLFTwD+KdgRf7uS1i0E
j347p3vhAn/c83jeTP5nPeU7Y8Pe6A8=
=TVgf
-----END PGP SIGNATURE-----

--s7akttmaddptsmxz--
