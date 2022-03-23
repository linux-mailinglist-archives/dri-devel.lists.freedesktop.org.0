Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BE814E5550
	for <lists+dri-devel@lfdr.de>; Wed, 23 Mar 2022 16:33:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9A0810E6F0;
	Wed, 23 Mar 2022 15:33:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2801010E6E9;
 Wed, 23 Mar 2022 15:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648049602; x=1679585602;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=MKK1oWyHz1JtpH5BhOmnBy9zvcSHBTGdb3YZ/fif2q8=;
 b=DtI2AJhi3DZ6hdzae+GT3jBRoF7b/7BnhJaV+z0hwHq4p+05bMxj2kfK
 XBBl85/r7PzfIo1SCrT64D/cVD9Lu0ausJpyFixScZ6RjRa0AwCnakIdF
 L85Ht/kUiXIT9WH3xOTVkyrZO8+t/KVVCPUvmjUY6CnfbELFF+RAABhzG
 umawOBwl1wmwp9WVez9VTvQjIRaHXakPm2T+JqivFbdbaYaknxv7oi4ft
 vuJsb9lslgMt9nf0Ac1aKae00asgGjjmF6y9wWpgBCZmZDKmTOkGGniIl
 QgfbHT42d4zTu9ZECxetv8XXifF185A5X3wTsV0KZwRSP6I2+SoE6vgrj w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10295"; a="238741018"
X-IronPort-AV: E=Sophos;i="5.90,204,1643702400"; d="scan'208";a="238741018"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2022 08:33:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,204,1643702400"; d="scan'208";a="519398709"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.61])
 by orsmga006.jf.intel.com with SMTP; 23 Mar 2022 08:33:18 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 23 Mar 2022 17:33:18 +0200
Date: Wed, 23 Mar 2022 17:33:18 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [Intel-gfx] [RFC 03/19] drm/edid: clean up CEA data block tag
 definitions
Message-ID: <Yjs9vvhrIhQDbChJ@intel.com>
References: <cover.1647985054.git.jani.nikula@intel.com>
 <657900c5a984a0bd7a830686cb5f919ae16912f8.1647985054.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <657900c5a984a0bd7a830686cb5f919ae16912f8.1647985054.git.jani.nikula@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 22, 2022 at 11:40:32PM +0200, Jani Nikula wrote:
> Add prefixed names, group, sort, add references.
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/drm_edid.c | 59 +++++++++++++++++++++-----------------
>  1 file changed, 32 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index b96906774433..6c188539493e 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -3329,15 +3329,20 @@ add_detailed_modes(struct drm_connector *connector, struct edid *edid,
>  	return closure.modes;
>  }
>  
> -#define AUDIO_BLOCK	0x01
> -#define VIDEO_BLOCK     0x02
> -#define VENDOR_BLOCK    0x03
> -#define SPEAKER_BLOCK	0x04
> -#define HDR_STATIC_METADATA_BLOCK	0x6
> -#define USE_EXTENDED_TAG 0x07
> -#define EXT_VIDEO_CAPABILITY_BLOCK 0x00
> -#define EXT_VIDEO_DATA_BLOCK_420	0x0E
> -#define EXT_VIDEO_CAP_BLOCK_Y420CMDB 0x0F
> +/* CEA-861-F Table 44 CEA Data Block Tag Codes */

Table 55 in CTA-861-G, if we want to use a more recent reference.
Though IIRC someone did say CTA-861-H might already be out as well.

> +#define CEA_DB_AUDIO			1
> +#define CEA_DB_VIDEO			2
> +#define CEA_DB_VENDOR			3
> +#define CEA_DB_SPEAKER			4
> +#define CEA_DB_EXTENDED_TAG		7
> +
> +/* CEA-861-F Table 46 CEA Data Block Tag Codes */

Table 57 in CTA-861-G.

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> +#define CEA_EXT_DB_VIDEO_CAP		0
> +#define CEA_EXT_DB_VENDOR		1
> +#define CEA_EXT_DB_HDR_STATIC_METADATA	6 /* CEA-861.3 2005 */
> +#define CEA_EXT_DB_420_VIDEO_DATA	14
> +#define CEA_EXT_DB_420_VIDEO_CAP_MAP	15
> +
>  #define EDID_BASIC_AUDIO	(1 << 6)
>  #define EDID_CEA_YCRCB444	(1 << 5)
>  #define EDID_CEA_YCRCB422	(1 << 4)
> @@ -4220,7 +4225,7 @@ cea_db_offsets(const u8 *cea, int *start, int *end)
>  
>  static bool cea_db_is_hdmi_vsdb(const u8 *db)
>  {
> -	if (cea_db_tag(db) != VENDOR_BLOCK)
> +	if (cea_db_tag(db) != CEA_DB_VENDOR)
>  		return false;
>  
>  	if (cea_db_payload_len(db) < 5)
> @@ -4231,7 +4236,7 @@ static bool cea_db_is_hdmi_vsdb(const u8 *db)
>  
>  static bool cea_db_is_hdmi_forum_vsdb(const u8 *db)
>  {
> -	if (cea_db_tag(db) != VENDOR_BLOCK)
> +	if (cea_db_tag(db) != CEA_DB_VENDOR)
>  		return false;
>  
>  	if (cea_db_payload_len(db) < 7)
> @@ -4242,7 +4247,7 @@ static bool cea_db_is_hdmi_forum_vsdb(const u8 *db)
>  
>  static bool cea_db_is_microsoft_vsdb(const u8 *db)
>  {
> -	if (cea_db_tag(db) != VENDOR_BLOCK)
> +	if (cea_db_tag(db) != CEA_DB_VENDOR)
>  		return false;
>  
>  	if (cea_db_payload_len(db) != 21)
> @@ -4253,13 +4258,13 @@ static bool cea_db_is_microsoft_vsdb(const u8 *db)
>  
>  static bool cea_db_is_vcdb(const u8 *db)
>  {
> -	if (cea_db_tag(db) != USE_EXTENDED_TAG)
> +	if (cea_db_tag(db) != CEA_DB_EXTENDED_TAG)
>  		return false;
>  
>  	if (cea_db_payload_len(db) != 2)
>  		return false;
>  
> -	if (cea_db_extended_tag(db) != EXT_VIDEO_CAPABILITY_BLOCK)
> +	if (cea_db_extended_tag(db) != CEA_EXT_DB_VIDEO_CAP)
>  		return false;
>  
>  	return true;
> @@ -4267,13 +4272,13 @@ static bool cea_db_is_vcdb(const u8 *db)
>  
>  static bool cea_db_is_y420cmdb(const u8 *db)
>  {
> -	if (cea_db_tag(db) != USE_EXTENDED_TAG)
> +	if (cea_db_tag(db) != CEA_DB_EXTENDED_TAG)
>  		return false;
>  
>  	if (!cea_db_payload_len(db))
>  		return false;
>  
> -	if (cea_db_extended_tag(db) != EXT_VIDEO_CAP_BLOCK_Y420CMDB)
> +	if (cea_db_extended_tag(db) != CEA_EXT_DB_420_VIDEO_CAP_MAP)
>  		return false;
>  
>  	return true;
> @@ -4281,13 +4286,13 @@ static bool cea_db_is_y420cmdb(const u8 *db)
>  
>  static bool cea_db_is_y420vdb(const u8 *db)
>  {
> -	if (cea_db_tag(db) != USE_EXTENDED_TAG)
> +	if (cea_db_tag(db) != CEA_DB_EXTENDED_TAG)
>  		return false;
>  
>  	if (!cea_db_payload_len(db))
>  		return false;
>  
> -	if (cea_db_extended_tag(db) != EXT_VIDEO_DATA_BLOCK_420)
> +	if (cea_db_extended_tag(db) != CEA_EXT_DB_420_VIDEO_DATA)
>  		return false;
>  
>  	return true;
> @@ -4354,7 +4359,7 @@ add_cea_modes(struct drm_connector *connector, struct edid *edid)
>  			db = &cea[i];
>  			dbl = cea_db_payload_len(db);
>  
> -			if (cea_db_tag(db) == VIDEO_BLOCK) {
> +			if (cea_db_tag(db) == CEA_DB_VIDEO) {
>  				video = db + 1;
>  				video_len = dbl;
>  				modes += do_cea_modes(connector, video, dbl);
> @@ -4428,10 +4433,10 @@ static void fixup_detailed_cea_mode_clock(struct drm_display_mode *mode)
>  
>  static bool cea_db_is_hdmi_hdr_metadata_block(const u8 *db)
>  {
> -	if (cea_db_tag(db) != USE_EXTENDED_TAG)
> +	if (cea_db_tag(db) != CEA_DB_EXTENDED_TAG)
>  		return false;
>  
> -	if (db[1] != HDR_STATIC_METADATA_BLOCK)
> +	if (db[1] != CEA_EXT_DB_HDR_STATIC_METADATA)
>  		return false;
>  
>  	if (cea_db_payload_len(db) < 3)
> @@ -4622,7 +4627,7 @@ static void drm_edid_to_eld(struct drm_connector *connector, struct edid *edid)
>  			dbl = cea_db_payload_len(db);
>  
>  			switch (cea_db_tag(db)) {
> -			case AUDIO_BLOCK:
> +			case CEA_DB_AUDIO:
>  				/* Audio Data Block, contains SADs */
>  				sad_count = min(dbl / 3, 15 - total_sad_count);
>  				if (sad_count >= 1)
> @@ -4630,12 +4635,12 @@ static void drm_edid_to_eld(struct drm_connector *connector, struct edid *edid)
>  					       &db[1], sad_count * 3);
>  				total_sad_count += sad_count;
>  				break;
> -			case SPEAKER_BLOCK:
> +			case CEA_DB_SPEAKER:
>  				/* Speaker Allocation Data Block */
>  				if (dbl >= 1)
>  					eld[DRM_ELD_SPEAKER] = db[1];
>  				break;
> -			case VENDOR_BLOCK:
> +			case CEA_DB_VENDOR:
>  				/* HDMI Vendor-Specific Data Block */
>  				if (cea_db_is_hdmi_vsdb(db))
>  					drm_parse_hdmi_vsdb_audio(connector, db);
> @@ -4696,7 +4701,7 @@ int drm_edid_to_sad(struct edid *edid, struct cea_sad **sads)
>  	for_each_cea_db(cea, i, start, end) {
>  		const u8 *db = &cea[i];
>  
> -		if (cea_db_tag(db) == AUDIO_BLOCK) {
> +		if (cea_db_tag(db) == CEA_DB_AUDIO) {
>  			int j;
>  
>  			dbl = cea_db_payload_len(db);
> @@ -4758,7 +4763,7 @@ int drm_edid_to_speaker_allocation(struct edid *edid, u8 **sadb)
>  	for_each_cea_db(cea, i, start, end) {
>  		const u8 *db = &cea[i];
>  
> -		if (cea_db_tag(db) == SPEAKER_BLOCK) {
> +		if (cea_db_tag(db) == CEA_DB_SPEAKER) {
>  			dbl = cea_db_payload_len(db);
>  
>  			/* Speaker Allocation Data Block */
> @@ -4888,7 +4893,7 @@ bool drm_detect_monitor_audio(struct edid *edid)
>  		goto end;
>  
>  	for_each_cea_db(edid_ext, i, start_offset, end_offset) {
> -		if (cea_db_tag(&edid_ext[i]) == AUDIO_BLOCK) {
> +		if (cea_db_tag(&edid_ext[i]) == CEA_DB_AUDIO) {
>  			has_audio = true;
>  			for (j = 1; j < cea_db_payload_len(&edid_ext[i]) + 1; j += 3)
>  				DRM_DEBUG_KMS("CEA audio format %d\n",
> -- 
> 2.30.2

-- 
Ville Syrjälä
Intel
