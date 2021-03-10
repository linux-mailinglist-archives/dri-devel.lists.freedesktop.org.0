Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EBB3A334735
	for <lists+dri-devel@lfdr.de>; Wed, 10 Mar 2021 19:54:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1DB36E233;
	Wed, 10 Mar 2021 18:54:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5000C6E222;
 Wed, 10 Mar 2021 18:54:45 +0000 (UTC)
IronPort-SDR: xweirK/YhJJo6LZDJCeWi6q+1C3KG2f5vF1u1JpL8rW3cAA79dWjqMHbamfJy1BpkDaXGvOsBo
 JGHcMERROSZA==
X-IronPort-AV: E=McAfee;i="6000,8403,9919"; a="186161517"
X-IronPort-AV: E=Sophos;i="5.81,238,1610438400"; d="scan'208";a="186161517"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2021 10:54:44 -0800
IronPort-SDR: XxtQmEqfzd7x5aLTfSO/O6hvm0Wayz48PvSGxRGkF5T12HE0e3q0qdbN43UZmhBM8ubVrXpxLT
 Im82CpLm8mGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,238,1610438400"; d="scan'208";a="410305306"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by orsmga008.jf.intel.com with SMTP; 10 Mar 2021 10:54:39 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 10 Mar 2021 20:54:38 +0200
Date: Wed, 10 Mar 2021 20:54:38 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [Intel-gfx] [RFC v1 1/6] drm/edid: make a number of functions,
 parameters and variables const
Message-ID: <YEkV7r2G0so84WkR@intel.com>
References: <cover.1615297748.git.jani.nikula@intel.com>
 <23463d5d4c75291d0665a23c91160e38cf6dbe5d.1615297748.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <23463d5d4c75291d0665a23c91160e38cf6dbe5d.1615297748.git.jani.nikula@intel.com>
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

On Tue, Mar 09, 2021 at 03:54:09PM +0200, Jani Nikula wrote:
> If there's no need to change it, it should be const. There's more to be
> done, but start off with changes that make follow-up work easier. No
> functional changes.
> =

> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

const is good.

Reviewed-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>

> ---
>  drivers/gpu/drm/drm_edid.c  | 58 ++++++++++++++++++-------------------
>  include/drm/drm_displayid.h |  4 +--
>  2 files changed, 31 insertions(+), 31 deletions(-)
> =

> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index c2bbe7bee7b6..d510b827a1f8 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -1585,7 +1585,7 @@ module_param_named(edid_fixup, edid_fixup, int, 040=
0);
>  MODULE_PARM_DESC(edid_fixup,
>  		 "Minimum number of valid EDID header bytes (0-8, default 6)");
>  =

> -static int validate_displayid(u8 *displayid, int length, int idx);
> +static int validate_displayid(const u8 *displayid, int length, int idx);
>  =

>  static int drm_edid_block_checksum(const u8 *raw_edid)
>  {
> @@ -3241,10 +3241,10 @@ add_detailed_modes(struct drm_connector *connecto=
r, struct edid *edid,
>  /*
>   * Search EDID for CEA extension block.
>   */
> -static u8 *drm_find_edid_extension(const struct edid *edid,
> -				   int ext_id, int *ext_index)
> +static const u8 *drm_find_edid_extension(const struct edid *edid,
> +					 int ext_id, int *ext_index)
>  {
> -	u8 *edid_ext =3D NULL;
> +	const u8 *edid_ext =3D NULL;
>  	int i;
>  =

>  	/* No EDID or EDID extensions */
> @@ -3253,7 +3253,7 @@ static u8 *drm_find_edid_extension(const struct edi=
d *edid,
>  =

>  	/* Find CEA extension */
>  	for (i =3D *ext_index; i < edid->extensions; i++) {
> -		edid_ext =3D (u8 *)edid + EDID_LENGTH * (i + 1);
> +		edid_ext =3D (const u8 *)edid + EDID_LENGTH * (i + 1);
>  		if (edid_ext[0] =3D=3D ext_id)
>  			break;
>  	}
> @@ -3267,12 +3267,12 @@ static u8 *drm_find_edid_extension(const struct e=
did *edid,
>  }
>  =

>  =

> -static u8 *drm_find_displayid_extension(const struct edid *edid,
> -					int *length, int *idx,
> -					int *ext_index)
> +static const u8 *drm_find_displayid_extension(const struct edid *edid,
> +					      int *length, int *idx,
> +					      int *ext_index)
>  {
> -	u8 *displayid =3D drm_find_edid_extension(edid, DISPLAYID_EXT, ext_inde=
x);
> -	struct displayid_hdr *base;
> +	const u8 *displayid =3D drm_find_edid_extension(edid, DISPLAYID_EXT, ex=
t_index);
> +	const struct displayid_hdr *base;
>  	int ret;
>  =

>  	if (!displayid)
> @@ -3286,18 +3286,18 @@ static u8 *drm_find_displayid_extension(const str=
uct edid *edid,
>  	if (ret)
>  		return NULL;
>  =

> -	base =3D (struct displayid_hdr *)&displayid[*idx];
> +	base =3D (const struct displayid_hdr *)&displayid[*idx];
>  	*length =3D *idx + sizeof(*base) + base->bytes;
>  =

>  	return displayid;
>  }
>  =

> -static u8 *drm_find_cea_extension(const struct edid *edid)
> +static const u8 *drm_find_cea_extension(const struct edid *edid)
>  {
>  	int length, idx;
> -	struct displayid_block *block;
> -	u8 *cea;
> -	u8 *displayid;
> +	const struct displayid_block *block;
> +	const u8 *cea;
> +	const u8 *displayid;
>  	int ext_index;
>  =

>  	/* Look for a top level CEA extension block */
> @@ -3318,7 +3318,7 @@ static u8 *drm_find_cea_extension(const struct edid=
 *edid)
>  		idx +=3D sizeof(struct displayid_hdr);
>  		for_each_displayid_db(displayid, block, idx, length) {
>  			if (block->tag =3D=3D DATA_BLOCK_CTA)
> -				return (u8 *)block;
> +				return (const u8 *)block;
>  		}
>  	}
>  =

> @@ -4503,8 +4503,8 @@ static void clear_eld(struct drm_connector *connect=
or)
>  static void drm_edid_to_eld(struct drm_connector *connector, struct edid=
 *edid)
>  {
>  	uint8_t *eld =3D connector->eld;
> -	u8 *cea;
> -	u8 *db;
> +	const u8 *cea;
> +	const u8 *db;
>  	int total_sad_count =3D 0;
>  	int mnl;
>  	int dbl;
> @@ -4600,7 +4600,7 @@ int drm_edid_to_sad(struct edid *edid, struct cea_s=
ad **sads)
>  {
>  	int count =3D 0;
>  	int i, start, end, dbl;
> -	u8 *cea;
> +	const u8 *cea;
>  =

>  	cea =3D drm_find_cea_extension(edid);
>  	if (!cea) {
> @@ -4619,7 +4619,7 @@ int drm_edid_to_sad(struct edid *edid, struct cea_s=
ad **sads)
>  	}
>  =

>  	for_each_cea_db(cea, i, start, end) {
> -		u8 *db =3D &cea[i];
> +		const u8 *db =3D &cea[i];
>  =

>  		if (cea_db_tag(db) =3D=3D AUDIO_BLOCK) {
>  			int j;
> @@ -4631,7 +4631,7 @@ int drm_edid_to_sad(struct edid *edid, struct cea_s=
ad **sads)
>  			if (!*sads)
>  				return -ENOMEM;
>  			for (j =3D 0; j < count; j++) {
> -				u8 *sad =3D &db[1 + j * 3];
> +				const u8 *sad =3D &db[1 + j * 3];
>  =

>  				(*sads)[j].format =3D (sad[0] & 0x78) >> 3;
>  				(*sads)[j].channels =3D sad[0] & 0x7;
> @@ -4755,7 +4755,7 @@ EXPORT_SYMBOL(drm_av_sync_delay);
>   */
>  bool drm_detect_hdmi_monitor(struct edid *edid)
>  {
> -	u8 *edid_ext;
> +	const u8 *edid_ext;
>  	int i;
>  	int start_offset, end_offset;
>  =

> @@ -4793,7 +4793,7 @@ EXPORT_SYMBOL(drm_detect_hdmi_monitor);
>   */
>  bool drm_detect_monitor_audio(struct edid *edid)
>  {
> -	u8 *edid_ext;
> +	const u8 *edid_ext;
>  	int i, j;
>  	bool has_audio =3D false;
>  	int start_offset, end_offset;
> @@ -5287,13 +5287,13 @@ u32 drm_add_display_info(struct drm_connector *co=
nnector, const struct edid *edi
>  	return quirks;
>  }
>  =

> -static int validate_displayid(u8 *displayid, int length, int idx)
> +static int validate_displayid(const u8 *displayid, int length, int idx)
>  {
>  	int i, dispid_length;
>  	u8 csum =3D 0;
> -	struct displayid_hdr *base;
> +	const struct displayid_hdr *base;
>  =

> -	base =3D (struct displayid_hdr *)&displayid[idx];
> +	base =3D (const struct displayid_hdr *)&displayid[idx];
>  =

>  	DRM_DEBUG_KMS("base revision 0x%x, length %d, %d %d\n",
>  		      base->rev, base->bytes, base->prod_id, base->ext_count);
> @@ -5359,7 +5359,7 @@ static struct drm_display_mode *drm_mode_displayid_=
detailed(struct drm_device *d
>  }
>  =

>  static int add_displayid_detailed_1_modes(struct drm_connector *connecto=
r,
> -					  struct displayid_block *block)
> +					  const struct displayid_block *block)
>  {
>  	struct displayid_detailed_timing_block *det =3D (struct displayid_detai=
led_timing_block *)block;
>  	int i;
> @@ -5387,9 +5387,9 @@ static int add_displayid_detailed_1_modes(struct dr=
m_connector *connector,
>  static int add_displayid_detailed_modes(struct drm_connector *connector,
>  					struct edid *edid)
>  {
> -	u8 *displayid;
> +	const u8 *displayid;
>  	int length, idx;
> -	struct displayid_block *block;
> +	const struct displayid_block *block;
>  	int num_modes =3D 0;
>  	int ext_index =3D 0;
>  =

> diff --git a/include/drm/drm_displayid.h b/include/drm/drm_displayid.h
> index 77941efb5426..f141c0eff083 100644
> --- a/include/drm/drm_displayid.h
> +++ b/include/drm/drm_displayid.h
> @@ -93,11 +93,11 @@ struct displayid_detailed_timing_block {
>  };
>  =

>  #define for_each_displayid_db(displayid, block, idx, length) \
> -	for ((block) =3D (struct displayid_block *)&(displayid)[idx]; \
> +	for ((block) =3D (const struct displayid_block *)&(displayid)[idx]; \
>  	     (idx) + sizeof(struct displayid_block) <=3D (length) && \
>  	     (idx) + sizeof(struct displayid_block) + (block)->num_bytes <=3D (=
length) && \
>  	     (block)->num_bytes > 0; \
>  	     (idx) +=3D sizeof(struct displayid_block) + (block)->num_bytes, \
> -	     (block) =3D (struct displayid_block *)&(displayid)[idx])
> +	     (block) =3D (const struct displayid_block *)&(displayid)[idx])
>  =

>  #endif
> -- =

> 2.20.1
> =

> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
