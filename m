Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5811B5A4503
	for <lists+dri-devel@lfdr.de>; Mon, 29 Aug 2022 10:28:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2035010F0E6;
	Mon, 29 Aug 2022 08:28:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E65B110F0E6
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Aug 2022 08:28:17 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 21EDF58024B;
 Mon, 29 Aug 2022 04:28:14 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Mon, 29 Aug 2022 04:28:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; t=1661761694; x=1661768894; bh=WyDZXkUvNq
 q4D0ys6jWjIG48RlHKq49MwSu6MMSlx50=; b=pcgQG1ej6+y0m7r6DiMBbYPc08
 6Tg1eOTSepyvQmZxCSlULRt2iHE7knKMWeZvGrun29ZniyukW65rq740Ny8rdnvP
 wM7up1mWPM7KSoF6ECLVmizsIegz9xc/3oShVa7yGTzcvTEfmg1LB5nJ91Farpn8
 3kFvaC7hRprWxqGT+KZ8O8GUqQ86LD9ibCIDHuETLiH3hSJ/8JnRXXjyI7DCtIH2
 FoFhHwd9AXJgrSiTL2p02R6D1YFV57MTMuPsJ6+zmaDVCCUAnNajGLNiNIMwdYxs
 dDCFrPrA2MBCLvSLE6NMrO0JbjKA0WyyP8lAnwG7k/NOxiDCExp3VO4Jhduw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1661761694; x=1661768894; bh=WyDZXkUvNqq4D0ys6jWjIG48RlHK
 q49MwSu6MMSlx50=; b=yH9L3dwU+BM7jqIUnUji3NTnNFQu0SshB8oh4lGV1/Qq
 TDI1OhLZmFpTFW4X2DxH8tC66akwDO5+mf9GGIR0IWNq5I7WxVqQZd3U9dGOjAdH
 yJS3gZzds7K6AtpJERpzRWG0sQ23BHyLauPzMWQAOCbe2zGYH/xuEjhQnZfT3HJ0
 iIMOrzwHC06X83sO/b3RCOe4IUpL4Mvg82/gepUIdTIUad/Qxb0GBGu6XWNqC7gx
 O2Lv5T/wRIFI+GKRoA6vDHl6NHbbHbgelR/zOXHNAnWBllu8ncLeb4rcIIMAmNgM
 8jxbkr2jq+nGf7vAOyWZT6oIz90oHLSMSvzQ7CQHXg==
X-ME-Sender: <xms:nHgMYxY2A4ykQGvsFzJnc35gPBn6FxisToBs3EdyCOE55OekURZCtA>
 <xme:nHgMY4bnM7gY496bdnurVGht7a5AxE477IKpHVSnWAxEY1bX-xnPK2fm8BkaKzgD3
 u2e2YG1Gi40zeacoXg>
X-ME-Received: <xmr:nHgMYz9QBKsNgPrdI7VDRmqaBrhSGpHSbUXasZ593l-Zquaj1QqsLnn1F1ir>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdekuddgtdehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtudenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeeljeeugfegveetleevkeetffegudevieetieeugeeugeeivddtjeejvdef
 feetgfenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivg
 eptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggt
 hh
X-ME-Proxy: <xmx:nHgMY_ow5pHV0rSxiGc4MvEbrbiAc7aHw8xiJIUsZYCUkUWxmjh7tw>
 <xmx:nHgMY8o6vx0u6-toU5HvO0BEQdVthR3WUvyc3QiQ_VtSdoWUEeC1Kw>
 <xmx:nHgMY1QgXFj6sK1CpnQpdrPeODRxNP79qhr4DjFjqrVAt20ECAiE_A>
 <xmx:nngMY1YTK8jVd5f_LplnVCWLcQMSRvqd2B2zxST_G1IQeJWOpau9XQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 29 Aug 2022 04:28:11 -0400 (EDT)
Date: Mon, 29 Aug 2022 10:28:09 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>
Subject: Re: [PATCH v1 05/35] drm/connector: Add TV standard property
Message-ID: <20220829082809.6xhd4zzs7ootax2z@houat>
References: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
 <20220728-rpi-analog-tv-properties-v1-5-3d53ae722097@cerno.tech>
 <37a76651-a457-e50d-9a05-00ca9ed5d729@tronnes.org>
 <20220825134408.dioj2lbycl7jm3ld@houat>
 <863beb42-1012-b38a-0c3d-89b7e035aa82@tronnes.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="75abns6ys2rry5o6"
Content-Disposition: inline
In-Reply-To: <863beb42-1012-b38a-0c3d-89b7e035aa82@tronnes.org>
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
Cc: Emma Anholt <emma@anholt.net>, Neil Armstrong <narmstrong@baylibre.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Phil Elwell <phil@raspberrypi.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Samuel Holland <samuel@sholland.org>, Kevin Hilman <khilman@baylibre.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-sunxi@lists.linux.dev,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Dom Cobley <dom@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--75abns6ys2rry5o6
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 25, 2022 at 05:13:29PM +0200, Noralf Tr=F8nnes wrote:
>=20
>=20
> Den 25.08.2022 15.44, skrev Maxime Ripard:
> > Hi,
> >=20
> > On Sat, Aug 20, 2022 at 10:12:46PM +0200, Noralf Tr=F8nnes wrote:
> >>> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> >>> index 1e9996b33cc8..78275e68ff66 100644
> >>> --- a/include/drm/drm_connector.h
> >>> +++ b/include/drm/drm_connector.h
> >>> @@ -143,6 +143,32 @@ enum subpixel_order {
> >>> =20
> >>>  };
> >>> =20
> >>> +#define DRM_MODE_TV_NORM_NTSC_443	(1 << 0)
> >>> +#define DRM_MODE_TV_NORM_NTSC_J		(1 << 1)
> >>> +#define DRM_MODE_TV_NORM_NTSC_M		(1 << 2)
> >>> +#define DRM_MODE_TV_NORM_PAL_60		(1 << 3)
> >>> +#define DRM_MODE_TV_NORM_PAL_B		(1 << 4)
> >>> +#define DRM_MODE_TV_NORM_PAL_D		(1 << 5)
> >>> +#define DRM_MODE_TV_NORM_PAL_G		(1 << 6)
> >>> +#define DRM_MODE_TV_NORM_PAL_H		(1 << 7)
> >>> +#define DRM_MODE_TV_NORM_PAL_I		(1 << 8)
> >>> +#define DRM_MODE_TV_NORM_PAL_M		(1 << 9)
> >>> +#define DRM_MODE_TV_NORM_PAL_N		(1 << 10)
> >>> +#define DRM_MODE_TV_NORM_PAL_NC		(1 << 11)
> >>> +#define DRM_MODE_TV_NORM_SECAM_60	(1 << 12)
> >>> +#define DRM_MODE_TV_NORM_SECAM_B	(1 << 13)
> >>> +#define DRM_MODE_TV_NORM_SECAM_D	(1 << 14)
> >>> +#define DRM_MODE_TV_NORM_SECAM_G	(1 << 15)
> >>> +#define DRM_MODE_TV_NORM_SECAM_K	(1 << 16)
> >>> +#define DRM_MODE_TV_NORM_SECAM_K1	(1 << 17)
> >>> +#define DRM_MODE_TV_NORM_SECAM_L	(1 << 18)
> >>> +#define DRM_MODE_TV_NORM_HD480I		(1 << 19)
> >>> +#define DRM_MODE_TV_NORM_HD480P		(1 << 20)
> >>> +#define DRM_MODE_TV_NORM_HD576I		(1 << 21)
> >>> +#define DRM_MODE_TV_NORM_HD576P		(1 << 22)
> >>> +#define DRM_MODE_TV_NORM_HD720P		(1 << 23)
> >>> +#define DRM_MODE_TV_NORM_HD1080I	(1 << 24)
> >>> +
> >>
> >> This is an area where DRM overlaps with v4l2, see:
> >> - include/dt-bindings/display/sdtv-standards.h
> >> - v4l2_norm_to_name()
> >>
> >> Maybe we should follow suit, but if we do our own thing please mention
> >> why in the commit message.
> >=20
> > Are you suggesting that we'd share that definition with v4l2?
> >=20
>=20
> If possible, yes.
>=20
> > I've tried to share some code in the past between v4l2 and DRM, and it
> > got completely shut down so it's not something I'd like to try again, if
> > possible.
> >=20
>=20
> But that is a good enough reason not to do so. I just got the impression
> from some of Laurent's emails a while back that there was some
> cooperativ atmosphere, but I might be mistaken in my reading/understandin=
g.

Here's the original thread:
https://lore.kernel.org/lkml/cover.8ec406bf8f4f097e9dc909d5aac466556822f592=
=2E1555487650.git-series.maxime.ripard@bootlin.com/

It ended up stalling completely, without any will from either DRM or
v4l2 to get this through. So I will not work on anything like that until
both maintainership teams have expressed that it's something they
actually want.

> It is ofc possible to just copy the values from sdtv-standards.h, but I
> see that hd* is missing from that list, so not sure if there's much
> point if it has to be extended without changing the source.

HD formats were dropped, so it's not a big deal. However, we are missing
a few formats, but that were never used by either nouveau, i915 or any
other driver. I'm not sure it's worth adding at that point, and we can
always extend it later.

Maxime

--75abns6ys2rry5o6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYwx4mQAKCRDj7w1vZxhR
xYZDAQCtPJtDdO69aAVR+V32mB49Ic+bSm58hf0Ef9S43x8CQQEA6046rKs4GgON
IjqfdYygrMMKGLb9fH70LvlsWbizSgA=
=ydq5
-----END PGP SIGNATURE-----

--75abns6ys2rry5o6--
