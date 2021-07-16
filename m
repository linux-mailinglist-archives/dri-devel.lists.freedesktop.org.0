Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 19EAE3CB341
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jul 2021 09:30:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 920626E92D;
	Fri, 16 Jul 2021 07:30:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B04946E92D
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jul 2021 07:30:51 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id BD3D75C015E;
 Fri, 16 Jul 2021 03:30:48 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Fri, 16 Jul 2021 03:30:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:content-transfer-encoding:in-reply-to; s=fm3; bh=9
 cu5nt0G2+zON1HSxnAUZmT6I2/KCuA1/XNq5Jbxq68=; b=ZTZmABM8xyt1Rqud0
 yW55wutkGz+6GaC6nXzJVMRKnCJicBOEAe3ojqyoHefN52V1FLpSMKnfRcF7qJH/
 7uoMNY9Gg2IX2T3REgbynivXOVD+xFl6nPWXWjH5BpO4oOtSiK+HMby6kg/goNLT
 1vmEPI26OOVdBvF/nKXGfqkWE3F6hrxD/083y7GhYT5NLN+cQhc1uwcbV+aHHsxR
 AV+wx+HIGd8M3bdAVGgkPLF8o1aTWI8NECAKzYhtKFcMizG0HPKYHdrk4VIwHhdx
 5HjQf546ji/qqpOkcv9bTdxiTCKWedWCPgP2dR/UfQaKf1fGz2n3udrCGBau2GEk
 bj/hQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=9cu5nt0G2+zON1HSxnAUZmT6I2/KCuA1/XNq5Jbxq
 68=; b=dK8/h7ZwzqtJYUlT0zUsGRlZcEkULX1/ew/COYkVWU900kvrzp6C7TICB
 oy8pTwgHxi1WmbnBYUATpBGsD6ZrcgDow849GqA6ps+FGHDcUODzrNqyLCJ9D0e0
 qjck3NmtRA1fkiZNasEXjl8qrJhIBrCoPz977YfdSVv/kKmHyy167tB/AKTumQNs
 b8vW1TETDxY0ZSsCyeaiPv4d3cgbWgG7sqXpYjhf+Oa1tZHFGMvNUPWeXg7smePa
 rEvlg3fJ6JtgFDTnzUThb8JqpAVOYOZ1g3jCw3TlglaCdf7jmw9jw5VroJoq7qp4
 +dL5iAMzlrqMUGrXYqRnKk+9CTf+g==
X-ME-Sender: <xms:pzXxYFQWbqu209bzvZz5H_bJKRz-GVb0DAToiU-5Tz2AkLZqlR3dHw>
 <xme:pzXxYOwVVZtpqn2HGBFwRsSvMl3ZfxE3rFuHuit8wtmkYN3jv3gRNDklOdNyruBv1
 RrSM2sYXVS2TKCJgn8>
X-ME-Received: <xmr:pzXxYK213Gk07pidUvch42QjrGjt3a31TDIxvJI2XsluWw3sgXUZF6oT8DKdhH1ML5a58vWrwdBII-pWgSERyiul-pOdl9MPI7z0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvddvgdduudegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtugfgjgesthhqredttddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpefgjeettdejgffgffdvteeutdehtdehgeehueetkeefgefhtdetjeekledu
 gedvudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:pzXxYNA0kiQe_NhYx6-Y14v5OqtcIDzyLSQqLk982R434N4upUVE9w>
 <xmx:pzXxYOggtzl56UtV3gnRgvG5DF3dPuttUshV6Ccwp6z8CbqW9UptpQ>
 <xmx:pzXxYBoPUCGOWLa12gftpGpJrR7ESnTKXl9hYTJyCvd1vhK6_ZDSsg>
 <xmx:qDXxYCjzH3xbEX3qzRfSyKYF9aV6jbQJ0yDC5V9RtBaRjVAvsRFBOQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 16 Jul 2021 03:30:46 -0400 (EDT)
Date: Fri, 16 Jul 2021 09:30:44 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 1/5] drm: Define DRM_FORMAT_MAX_PLANES
Message-ID: <20210716073044.ff3avcrd5swruele@gilmour>
References: <20210715180133.3675-1-tzimmermann@suse.de>
 <20210715180133.3675-2-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210715180133.3675-2-tzimmermann@suse.de>
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
Cc: hamohammed.sa@gmail.com, rodrigosiqueiramelo@gmail.com, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, melissa.srw@gmail.com, noralf@tronnes.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, Jul 15, 2021 at 08:01:29PM +0200, Thomas Zimmermann wrote:
> DRM uses a magic number of 4 for the maximum number of planes per color
> format. Declare this constant via DRM_FORMAT_MAX_PLANES and update the
> related code.
>=20
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/drm_gem_framebuffer_helper.c | 14 ++++++++------
>  include/drm/drm_fourcc.h                     | 13 +++++++++----
>  include/drm/drm_framebuffer.h                |  8 ++++----
>  include/drm/drm_gem_atomic_helper.h          |  2 +-
>  4 files changed, 22 insertions(+), 15 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_gem_framebuffer_helper.c b/drivers/gpu/d=
rm/drm_gem_framebuffer_helper.c
> index e2c68822e05c..975a3df0561e 100644
> --- a/drivers/gpu/drm/drm_gem_framebuffer_helper.c
> +++ b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
> @@ -48,7 +48,7 @@
>  struct drm_gem_object *drm_gem_fb_get_obj(struct drm_framebuffer *fb,
>  					  unsigned int plane)
>  {
> -	if (plane >=3D 4)
> +	if (plane >=3D ARRAY_SIZE(fb->obj))
>  		return NULL;

This doesn't look related to what's mentionned in the commit log though?

>  	return fb->obj[plane];
> @@ -62,7 +62,8 @@ drm_gem_fb_init(struct drm_device *dev,
>  		 struct drm_gem_object **obj, unsigned int num_planes,
>  		 const struct drm_framebuffer_funcs *funcs)
>  {
> -	int ret, i;
> +	unsigned int i;
> +	int ret;
> =20
>  	drm_helper_mode_fill_fb_struct(dev, fb, mode_cmd);
> =20
> @@ -86,9 +87,9 @@ drm_gem_fb_init(struct drm_device *dev,
>   */
>  void drm_gem_fb_destroy(struct drm_framebuffer *fb)
>  {
> -	int i;
> +	size_t i;
> =20
> -	for (i =3D 0; i < 4; i++)
> +	for (i =3D 0; i < ARRAY_SIZE(fb->obj); i++)
>  		drm_gem_object_put(fb->obj[i]);

Ditto

Both these changes look fine though, but I guess you should just mention it

Maxime
