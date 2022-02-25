Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 84E714C4D58
	for <lists+dri-devel@lfdr.de>; Fri, 25 Feb 2022 19:09:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0160F10E8D7;
	Fri, 25 Feb 2022 18:09:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7651210E8D7
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Feb 2022 18:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645812558; x=1677348558;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=BgVr96BwmuRQQd1N/s9vIThv5HkU2lle/CJsp+SNDIY=;
 b=aRcba4Als+eJ/eEQwWpAvkGbMBt4tYBjFDwK0iLaBh9aSCF/SKm26jXQ
 l+WLZOSLxXxnH1FkYAZg/dMmuUGDUCOIfviys3vWErSnLq/sRzuimYxuS
 akOd56It4wGgGxlBuF8SCtAwfhhIH4YkCpiS9lou1Az1Y+L2bel3CaVK1
 7nYE3Jser/8FjHiovWv5POZ0Lc46+uPjLiVL4V9Wy9DVli36VnC44fFHu
 aYV1rL6A2cqLxWb/EkicNgzhMtGWzEmH5nn3KcYEsBykbUktSwBxo8oDd
 YhDcoMZmp5TzpJ4ym1+jcNhrzhfc9zY5HfLU2KAgGFVij90hzNtE5tib8 Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10268"; a="233174022"
X-IronPort-AV: E=Sophos;i="5.90,136,1643702400"; d="scan'208";a="233174022"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2022 10:09:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,136,1643702400"; d="scan'208";a="592562700"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.151])
 by fmsmga008.fm.intel.com with SMTP; 25 Feb 2022 10:09:15 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 25 Feb 2022 20:09:14 +0200
Date: Fri, 25 Feb 2022 20:09:14 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Lee Shawn C <shawn.c.lee@intel.com>
Subject: Re: [PATCH 2/3] drm/edid: read HF-EEODB ext block
Message-ID: <YhkbSj+GfNyOIWE8@intel.com>
References: <20220224141625.19070-1-shawn.c.lee@intel.com>
 <20220224141625.19070-3-shawn.c.lee@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220224141625.19070-3-shawn.c.lee@intel.com>
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
Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 24, 2022 at 10:16:24PM +0800, Lee Shawn C wrote:
> Support to read HF_EEODB block that request by HDMI 2.1 specification.

Please spell out what that thing is and why it exists.

> 
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
> Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> Signed-off-by: Lee Shawn C <shawn.c.lee@intel.com>
> ---
>  drivers/gpu/drm/drm_connector.c |  5 ++-
>  drivers/gpu/drm/drm_edid.c      | 76 ++++++++++++++++++++++++++++++---
>  include/drm/drm_edid.h          |  2 +
>  3 files changed, 77 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> index a50c82bc2b2f..0f9e3ef00be7 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -2137,8 +2137,11 @@ int drm_connector_update_edid_property(struct drm_connector *connector,
>  	if (connector->override_edid)
>  		return 0;
>  
> -	if (edid)
> +	if (edid) {
>  		size = EDID_LENGTH * (1 + edid->extensions);
> +		if (drm_edid_is_hf_eeodb_blk_available(edid))
> +			size = EDID_LENGTH * (1 + drm_edid_read_hf_eeodb_blk_size(edid));

I think we just want a small helper function that gives us the number
of ext blocks whether it be from the base block or from this thing.

> +	}
>  
>  	/* Set the display info, using edid if available, otherwise
>  	 * resetting the values to defaults. This duplicates the work
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 19426f28b411..056e735ef932 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -1991,7 +1991,7 @@ struct edid *drm_do_get_edid(struct drm_connector *connector,
>  	void *data)
>  {
>  	int i, j = 0, valid_extensions = 0;
> -	u8 *edid, *new;
> +	u8 *edid, *new, ext_eeodb_blk_size;
>  	struct edid *override;
>  
>  	override = drm_get_override_edid(connector);
> @@ -2051,7 +2051,40 @@ struct edid *drm_do_get_edid(struct drm_connector *connector,
>  		}
>  
>  		kfree(edid);
> +		return (struct edid *)new;
> +	}
> +
> +	if (drm_edid_is_hf_eeodb_blk_available((struct edid *)edid)) {
> +		ext_eeodb_blk_size = drm_edid_read_hf_eeodb_blk_size((struct edid *)edid);
> +
> +		// no more ext blk wait for read
> +		if (ext_eeodb_blk_size <= 1)
> +			return (struct edid *)edid;
> +
> +		new = krealloc(edid, (ext_eeodb_blk_size + 1) * EDID_LENGTH, GFP_KERNEL);
> +		if (!new)
> +			goto out;
>  		edid = new;
> +
> +		valid_extensions = ext_eeodb_blk_size - 1;
> +		for (j = 2; j <= ext_eeodb_blk_size; j++) {
> +			u8 *block = edid + j * EDID_LENGTH;
> +
> +			for (i = 0; i < 4; i++) {
> +				if (get_edid_block(data, block, j, EDID_LENGTH))
> +					goto out;
> +				if (drm_edid_block_valid(block, j, false, NULL))
> +					break;
> +			}
> +
> +			if (i == 4)
> +				valid_extensions--;
> +		}
> +
> +		if (valid_extensions != ext_eeodb_blk_size - 1) {
> +			DRM_ERROR("Not able to retrieve proper EDID contain HF-EEODB data.\n");
> +			goto out;
> +		}
>  	}
>  
>  	return (struct edid *)edid;
> @@ -3315,15 +3348,17 @@ add_detailed_modes(struct drm_connector *connector, struct edid *edid,
>  #define VIDEO_BLOCK     0x02
>  #define VENDOR_BLOCK    0x03
>  #define SPEAKER_BLOCK	0x04
> -#define HDR_STATIC_METADATA_BLOCK	0x6
> -#define USE_EXTENDED_TAG 0x07
> -#define EXT_VIDEO_CAPABILITY_BLOCK 0x00
> +#define EXT_VIDEO_CAPABILITY_BLOCK	0x00
> +#define HDR_STATIC_METADATA_BLOCK	0x06
> +#define USE_EXTENDED_TAG		0x07
>  #define EXT_VIDEO_DATA_BLOCK_420	0x0E
> -#define EXT_VIDEO_CAP_BLOCK_Y420CMDB 0x0F
> +#define EXT_VIDEO_CAP_BLOCK_Y420CMDB	0x0F
> +#define EXT_VIDEO_HF_EEODB_DATA_BLOCK	0x78
>  #define EDID_BASIC_AUDIO	(1 << 6)
>  #define EDID_CEA_YCRCB444	(1 << 5)
>  #define EDID_CEA_YCRCB422	(1 << 4)
>  #define EDID_CEA_VCDB_QS	(1 << 6)
> +#define HF_EEODB_LENGTH		2
>  
>  /*
>   * Search EDID for CEA extension block.
> @@ -4273,6 +4308,37 @@ static bool cea_db_is_y420vdb(const u8 *db)
>  	return true;
>  }
>  
> +static bool cea_db_is_hdmi_forum_eeodb(const u8 *db)
> +{
> +	if (cea_db_tag(db) != USE_EXTENDED_TAG)
> +		return false;
> +
> +	if (cea_db_payload_len(db) != HF_EEODB_LENGTH)

We don't have any defines for the length of other blocks. Don't see why
this one should be different.

Also, the spec says
"The Sources that are compliant to This Specification will not
 be adversely affected by the presence of the additional bytes within
 the Length field range."

> +		return false;
> +
> +	if (cea_db_extended_tag(db) != EXT_VIDEO_HF_EEODB_DATA_BLOCK)
> +		return false;
> +
> +	return true;
> +}
> +
> +bool drm_edid_is_hf_eeodb_blk_available(const struct edid *edid)
> +{
> +	const u8 *eeodb_header = (u8 *)edid + EDID_LENGTH + 4;
> +
> +	if (!edid->extensions)
> +		return false;
> +
> +	return cea_db_is_hdmi_forum_eeodb(eeodb_header);
> +}
> +EXPORT_SYMBOL_GPL(drm_edid_is_hf_eeodb_blk_available);
> +
> +u8 drm_edid_read_hf_eeodb_blk_size(const struct edid *edid)
> +{
> +	return ((u8 *)edid)[EDID_LENGTH + 6];

Not a big fan of these hardcoded offsets and stuff. Seems too 
easy to screw up.

> +}
> +EXPORT_SYMBOL_GPL(drm_edid_read_hf_eeodb_blk_size);
> +
>  #define for_each_cea_db(cea, i, start, end) \
>  	for ((i) = (start); (i) < (end) && (i) + cea_db_payload_len(&(cea)[(i)]) < (end); (i) += cea_db_payload_len(&(cea)[(i)]) + 1)
>  
> diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
> index 144c495b99c4..22872d9731a8 100644
> --- a/include/drm/drm_edid.h
> +++ b/include/drm/drm_edid.h
> @@ -593,5 +593,7 @@ drm_display_mode_from_cea_vic(struct drm_device *dev,
>  const u8 *drm_find_edid_extension(const struct edid *edid,
>  				  int ext_id, int *ext_index);
>  
> +bool drm_edid_is_hf_eeodb_blk_available(const struct edid *edid);
> +u8 drm_edid_read_hf_eeodb_blk_size(const struct edid *edid);
>  
>  #endif /* __DRM_EDID_H__ */
> -- 
> 2.17.1

-- 
Ville Syrjälä
Intel
