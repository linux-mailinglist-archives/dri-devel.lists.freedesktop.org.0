Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 48BD134D864
	for <lists+dri-devel@lfdr.de>; Mon, 29 Mar 2021 21:37:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1512F6E50D;
	Mon, 29 Mar 2021 19:37:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 412B76E508;
 Mon, 29 Mar 2021 19:37:39 +0000 (UTC)
IronPort-SDR: pqA7zYuL/ecXKplje0br9oFHaKuD8bjbsTiL6nI4oMQJslHBcYceeEnseyg9e8n+fgEDZqo9MD
 ckVKiUBXHW6Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9938"; a="252958929"
X-IronPort-AV: E=Sophos;i="5.81,288,1610438400"; d="scan'208";a="252958929"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2021 12:37:38 -0700
IronPort-SDR: iGgLZxmrcRCRVrLNu1TTrK4+ZJRmHyqbf7uiZpQ+vu4VwoQYQG3sW7LY3EeOUpiGH6cYXJOgvf
 8J5HN2AY0n8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,288,1610438400"; d="scan'208";a="411242380"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by fmsmga008.fm.intel.com with SMTP; 29 Mar 2021 12:37:35 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 29 Mar 2021 22:37:34 +0300
Date: Mon, 29 Mar 2021 22:37:34 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v2 8/8] drm/displayid: rename displayid_hdr to
 displayid_header
Message-ID: <YGIsfgDhoLQ8VIoH@intel.com>
References: <cover.1617024940.git.jani.nikula@intel.com>
 <ce083bd2789c7e22a91710726162287db88e3f6c.1617024940.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ce083bd2789c7e22a91710726162287db88e3f6c.1617024940.git.jani.nikula@intel.com>
X-Patchwork-Hint: comment
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 29, 2021 at 04:37:22PM +0300, Jani Nikula wrote:
> Avoid any confusion with High Dynamic Range. No functional changes.
> =

> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>

> ---
>  drivers/gpu/drm/drm_displayid.c | 10 +++++-----
>  include/drm/drm_displayid.h     |  2 +-
>  2 files changed, 6 insertions(+), 6 deletions(-)
> =

> diff --git a/drivers/gpu/drm/drm_displayid.c b/drivers/gpu/drm/drm_displa=
yid.c
> index e0b9e58a9dc8..32da557b960f 100644
> --- a/drivers/gpu/drm/drm_displayid.c
> +++ b/drivers/gpu/drm/drm_displayid.c
> @@ -11,9 +11,9 @@ static int validate_displayid(const u8 *displayid, int =
length, int idx)
>  {
>  	int i, dispid_length;
>  	u8 csum =3D 0;
> -	const struct displayid_hdr *base;
> +	const struct displayid_header *base;
>  =

> -	base =3D (const struct displayid_hdr *)&displayid[idx];
> +	base =3D (const struct displayid_header *)&displayid[idx];
>  =

>  	DRM_DEBUG_KMS("base revision 0x%x, length %d, %d %d\n",
>  		      base->rev, base->bytes, base->prod_id, base->ext_count);
> @@ -38,7 +38,7 @@ static const u8 *drm_find_displayid_extension(const str=
uct edid *edid,
>  					      int *ext_index)
>  {
>  	const u8 *displayid =3D drm_find_edid_extension(edid, DISPLAYID_EXT, ex=
t_index);
> -	const struct displayid_hdr *base;
> +	const struct displayid_header *base;
>  	int ret;
>  =

>  	if (!displayid)
> @@ -52,7 +52,7 @@ static const u8 *drm_find_displayid_extension(const str=
uct edid *edid,
>  	if (ret)
>  		return NULL;
>  =

> -	base =3D (const struct displayid_hdr *)&displayid[*idx];
> +	base =3D (const struct displayid_header *)&displayid[*idx];
>  	*length =3D *idx + sizeof(*base) + base->bytes;
>  =

>  	return displayid;
> @@ -118,7 +118,7 @@ __displayid_iter_next(struct displayid_iter *iter)
>  			return NULL;
>  		}
>  =

> -		iter->idx +=3D sizeof(struct displayid_hdr);
> +		iter->idx +=3D sizeof(struct displayid_header);
>  =

>  		block =3D displayid_iter_block(iter);
>  		if (block)
> diff --git a/include/drm/drm_displayid.h b/include/drm/drm_displayid.h
> index 10ee863f1734..ec64d141f578 100644
> --- a/include/drm/drm_displayid.h
> +++ b/include/drm/drm_displayid.h
> @@ -56,7 +56,7 @@ struct edid;
>  #define PRODUCT_TYPE_REPEATER 5
>  #define PRODUCT_TYPE_DIRECT_DRIVE 6
>  =

> -struct displayid_hdr {
> +struct displayid_header {
>  	u8 rev;
>  	u8 bytes;
>  	u8 prod_id;
> -- =

> 2.20.1

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
