Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5301B944589
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2024 09:35:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4DF610E8A5;
	Thu,  1 Aug 2024 07:35:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XP/5raUe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0890710E8A5
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Aug 2024 07:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722497741; x=1754033741;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=BuOxmIw2grlsljBZYvcvceUFlSst62mZ9t9qCNgWfTI=;
 b=XP/5raUe+I02jn2sqOneEmAnsnal0SyUbPqlr8kularPa/DzkSnUvnXC
 7ucsCADqwnNw43kvPjFPoYvFnxW18UA1WfLogHXFgLAms1/kbjyNBGKMo
 wVDuIlqmwtLO83p8/6ogQqpgOd2s8o1y2B/D7xtkbRRhbJQk4RPinhcWt
 fW1IBUOVW2HHeZiGc+moAqk6dXDCj/Ei4JcOX/imBOMs1qaQattHvD7YF
 39G//WARgsG8qo8SAwuC1o/mu6Kmyl9r3xRCcftbXr99Qc5L8q7pUn+wl
 OBJ1mnsbPMAHeMsT6PQ/3jUeGR7b9FalC476n2oEa73PCxQ4wejZbcEmy g==;
X-CSE-ConnectionGUID: gcKKGNauSqOdevpXN01SJQ==
X-CSE-MsgGUID: vmfRGfDESm2muIbG1Noxzg==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="20247073"
X-IronPort-AV: E=Sophos;i="6.09,253,1716274800"; d="scan'208";a="20247073"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 00:35:40 -0700
X-CSE-ConnectionGUID: Pd+iKsvJRNawKAL2GaQVEw==
X-CSE-MsgGUID: z4hnIh7nSSK1JQ94e0LEWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,253,1716274800"; d="scan'208";a="59756080"
Received: from mwiniars-desk2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.228])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 00:35:36 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Hamza Mahfooz <hamza.mahfooz@amd.com>, dri-devel@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Alex Deucher
 <alexander.deucher@amd.com>, Rodrigo Siqueira <rodrigo.siqueira@amd.com>,
 Harry Wentland <harry.wentland@amd.com>, Hamza
 Mahfooz <hamza.mahfooz@amd.com>, Karol Herbst <kherbst@redhat.com>
Subject: Re: [PATCH v2] drm/edid: add CTA Video Format Data Block support
In-Reply-To: <20240731214941.257975-1-hamza.mahfooz@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240731214941.257975-1-hamza.mahfooz@amd.com>
Date: Thu, 01 Aug 2024 10:35:32 +0300
Message-ID: <87sevowv97.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 31 Jul 2024, Hamza Mahfooz <hamza.mahfooz@amd.com> wrote:
> Video Format Data Blocks (VFDBs) contain the necessary information that
> needs to be fed to the Optimized Video Timings (OVT) Algorithm.
> Also, we require OVT support to cover modes that aren't supported by
> earlier standards (e.g. CVT). So, parse all of the relevant VFDB data
> and feed it to the OVT Algorithm, to extract all of the missing OVT
> modes.
>
> Suggested-by: Karol Herbst <kherbst@redhat.com>
> Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
> ---
> v2: address comments from Jani
> ---
>  drivers/gpu/drm/drm_edid.c | 456 ++++++++++++++++++++++++++++++++++---
>  1 file changed, 428 insertions(+), 28 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index f68a41eeb1fa..f608ab4e32ae 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -31,6 +31,7 @@
>  #include <linux/bitfield.h>
>  #include <linux/byteorder/generic.h>
>  #include <linux/cec.h>
> +#include <linux/gcd.h>
>  #include <linux/hdmi.h>
>  #include <linux/i2c.h>
>  #include <linux/kernel.h>
> @@ -741,6 +742,93 @@ static const struct minimode extra_modes[] = {
>  	{ 2048, 1536, 60, 0 },
>  };
>  
> +struct cta_rid {
> +	u16 hactive;
> +	u16 vactive;
> +	u8 hratio;
> +	u8 vratio;
> +};
> +
> +/* CTA-861-I Table 11 - Resolution Identification (RID) */
> +static const struct cta_rid rids[] = {
> +	/* RID 0-9 */
> +	{ 0, 0, 0, 0 },
> +	{ 1280, 720, 16, 9 },
> +	{ 1280, 720, 64, 27 },
> +	{ 1680, 720, 64, 27 },
> +	{ 1920, 1080, 16, 9 },
> +	{ 1920, 1080, 64, 27 },
> +	{ 2560, 1080, 64, 27 },
> +	{ 3840, 1080, 32, 9 },
> +	{ 2560, 1440, 16, 9 },
> +	{ 3440, 1440, 64, 27 },
> +	/* RID 10-19 */
> +	{ 5120, 1440, 32, 9 },
> +	{ 3840, 2160, 16, 9 },
> +	{ 3840, 2160, 64, 27 },
> +	{ 5120, 2160, 64, 27 },
> +	{ 7680, 2160, 32, 9 },
> +	{ 5120, 2880, 16, 9 },
> +	{ 5120, 2880, 64, 27 },
> +	{ 6880, 2880, 64, 27 },
> +	{ 10240, 2880, 32, 9 },
> +	{ 7680, 4320, 16, 9 },
> +	/* RID 20-28 */
> +	{ 7680, 4320, 64, 27 },
> +	{ 10240, 4320, 64, 27 },
> +	{ 15360, 4320, 32, 9 },
> +	{ 11520, 6480, 16, 9 },
> +	{ 11520, 6480, 64, 27 },
> +	{ 15360, 6480, 64, 27 },
> +	{ 15360, 8640, 16, 9 },
> +	{ 15360, 8640, 64, 27 },
> +	{ 20480, 8640, 64, 27 },
> +};
> +
> +/* CTA-861-I Table 12 - AVI InfoFrame Video Format Frame Rate */
> +static const u16 cta_vf_fr[] = {
> +	/* Frame Rate 0-7 */
> +	0, 24, 25, 30, 48, 50, 60, 100,
> +	/* Frame Rate 8-15 */
> +	120, 144, 200, 240, 300, 360, 400, 480,
> +};
> +
> +/* CTA-861-I Table 13 - RID To VIC Mapping */
> +static const u8 rid_to_vic[][8] = {
> +	/* RID 0-9 */
> +	{},
> +	{ 60, 61, 62, 108, 19, 4, 41, 47 },
> +	{ 65, 66, 67, 109, 68, 69, 70, 71 },
> +	{ 79, 80, 81, 110, 82, 83, 84, 85 },
> +	{ 32, 33, 34, 111, 31, 16, 64, 63 },
> +	{ 72, 73, 74, 112, 75, 76, 77, 78 },
> +	{ 86, 87, 88, 113, 89, 90, 91, 92 },
> +	{},
> +	{},
> +	{},
> +	/* RID 10-19 */
> +	{},
> +	{ 93, 94, 95, 114, 96, 97, 117, 118 },
> +	{ 103, 104, 105, 116, 106, 107, 119, 120 },
> +	{ 121, 122, 123, 124, 125, 126, 127, 193 },
> +	{},
> +	{},
> +	{},
> +	{},
> +	{},
> +	{ 194, 195, 196, 197, 198, 199, 200, 201 },
> +	/* RID 20-28 */
> +	{ 202, 203, 204, 205, 206, 207, 208, 209 },
> +	{ 210, 211, 212, 213, 214, 215, 216, 217 },
> +	{},
> +	{},
> +	{},
> +	{},
> +	{},
> +	{},
> +	{},
> +};
> +
>  /*
>   * From CEA/CTA-861 spec.
>   *
> @@ -4140,6 +4228,7 @@ static int add_detailed_modes(struct drm_connector *connector,
>  #define CTA_DB_VIDEO			2
>  #define CTA_DB_VENDOR			3
>  #define CTA_DB_SPEAKER			4
> +#define CTA_DB_VIDEO_FORMAT		6
>  #define CTA_DB_EXTENDED_TAG		7
>  
>  /* CTA-861-H Table 62 - CTA Extended Tag Codes */
> @@ -4981,6 +5070,16 @@ struct cea_db {
>  	u8 data[];
>  } __packed;
>  
> +struct cta_vfd {
> +	u8 rid;
> +	u8 fr_fact;
> +	bool bfr50;
> +	bool fr24;
> +	bool bfr60;
> +	bool fr144;
> +	bool fr48;
> +};
> +
>  static int cea_db_tag(const struct cea_db *db)
>  {
>  	return db->tag_length >> 5;
> @@ -5306,34 +5405,6 @@ static void parse_cta_y420cmdb(struct drm_connector *connector,
>  	*y420cmdb_map = map;
>  }
>  
> -static int add_cea_modes(struct drm_connector *connector,
> -			 const struct drm_edid *drm_edid)
> -{
> -	const struct cea_db *db;
> -	struct cea_db_iter iter;
> -	int modes;
> -
> -	/* CTA VDB block VICs parsed earlier */
> -	modes = add_cta_vdb_modes(connector);
> -
> -	cea_db_iter_edid_begin(drm_edid, &iter);
> -	cea_db_iter_for_each(db, &iter) {
> -		if (cea_db_is_hdmi_vsdb(db)) {
> -			modes += do_hdmi_vsdb_modes(connector, (const u8 *)db,
> -						    cea_db_payload_len(db));
> -		} else if (cea_db_is_y420vdb(db)) {
> -			const u8 *vdb420 = cea_db_data(db) + 1;
> -
> -			/* Add 4:2:0(only) modes present in EDID */
> -			modes += do_y420vdb_modes(connector, vdb420,
> -						  cea_db_payload_len(db) - 1);
> -		}
> -	}
> -	cea_db_iter_end(&iter);
> -
> -	return modes;
> -}
> -

Is there anything that really requires moving add_cea_modes() down? You
could just add your new stuff above it, right?

Again, I'll reply with further comments when I've tracked down a more
recent spec...

BR,
Jani.

>  static void fixup_detailed_cea_mode_clock(struct drm_connector *connector,
>  					  struct drm_display_mode *mode)
>  {
> @@ -6018,6 +6089,305 @@ static void parse_cta_vdb(struct drm_connector *connector, const struct cea_db *
>  	}
>  }
>  
> +/* CTA-861 Video Format Descriptor (CTA VFD) */
> +static void parse_cta_vfd(struct cta_vfd *vfd, const u8 *data, int vfd_len)
> +{
> +	vfd->rid = data[0] & 0x3f;
> +	vfd->bfr50 = data[0] & 0x80;
> +	vfd->fr24 = data[0] & 0x40;
> +	vfd->bfr60 = vfd_len > 1 ? (data[1] & 0x80) : 0x1;
> +	vfd->fr144 = vfd_len > 1 ? (data[1] & 0x40) : 0x0;
> +	vfd->fr_fact = vfd_len > 1 ? (data[1] & 0x3f) : 0x3;
> +	vfd->fr48 = vfd_len > 2 ? (data[2] & 0x1) : 0x0;
> +}
> +
> +static bool vfd_has_fr(const struct cta_vfd *vfd, int rate_idx)
> +{
> +	static const u8 factors[] = {
> +		1, 2, 4, 8, 12, 16
> +	};
> +	u16 rate = cta_vf_fr[rate_idx];
> +	u16 factor = 0;
> +	unsigned int i;
> +
> +	switch (rate) {
> +	case 24:
> +		return vfd->fr24;
> +	case 48:
> +		return vfd->fr48;
> +	case 144:
> +		return vfd->fr144;
> +	}
> +
> +	if (!(rate % 25)) {
> +		if (!vfd->bfr50)
> +			return false;
> +
> +		factor = rate / 25;
> +	} else if (!(rate % 30)) {
> +		if (!vfd->bfr60)
> +			return false;
> +
> +		factor = rate / 30;
> +	}
> +
> +	for (i = 0; i < ARRAY_SIZE(factors); i++)
> +		if (factor == factors[i] && (vfd->fr_fact & (1 << i)))
> +			return true;
> +
> +	return false;
> +}
> +
> +#define OVT_PIXEL_CLOCK_GRANULARITY	1000		/* Hz */
> +#define OVT_MIN_HTOTAL_GRANULARITY	8		/* pixels */
> +#define OVT_MIN_VBLANK_DURATION	460000000	/* ps */
> +#define OVT_MIN_VBLANK_LINES		20
> +#define OVT_MIN_VSYNC_LEADING_EDGE	400		/* us */
> +#define OVT_MIN_VSYNC_LE_LINES		14
> +#define OVT_MIN_CLOCK_RATE_420		590000000	/* Hz */
> +#define OVT_PIXEL_FACTOR_420		2
> +#define OVT_MIN_HBLANK_444		80		/* pixels */
> +#define OVT_MIN_HBLANK_420		128		/* pixels */
> +#define OVT_MAX_CHUNK_RATE		650000000	/* Hz */
> +#define OVT_AUDIO_PACKET_RATE		195000		/* Hz */
> +#define OVT_AUDIO_PACKET_SIZE		32
> +#define OVT_LINE_OVERHEAD		32
> +#define OVT_HSYNC_WIDTH		32
> +#define OVT_VSYNC_WIDTH		8
> +
> +/* OVT Algorthim as specified in CTA-861-I */
> +static struct drm_display_mode *
> +calculate_ovt_mode(struct drm_connector *connector, const struct cta_rid *rid,
> +		   u16 vrate)
> +{
> +	u32 max_audio_packets_per_line;
> +	struct drm_display_mode *mode;
> +	u32 htotal_granularity_chunk;
> +	u32 resolution_granularity;
> +	u32 vtotal_granularity = 1;
> +	u64 min_pixel_clock_rate;
> +	u32 htotal_granularity;
> +	u32 max_vrate = vrate;
> +	u64 pixel_clock_rate;
> +	u64 max_active_time;
> +	u64 min_resolution;
> +	u32 vsync_position;
> +	u32 min_line_time;
> +	u32 min_line_rate;
> +	u32 min_hblank;
> +	u32 min_htotal;
> +	u32 min_vblank;
> +	u32 min_vtotal;
> +	u32 htotal;
> +	u32 vtotal;
> +	u32 h;
> +	u64 r;
> +	u32 v;
> +
> +	/* step 1 */
> +	switch (vrate) {
> +	case 24:
> +	case 25:
> +		max_vrate = 30;
> +		fallthrough;
> +	case 30:
> +		vtotal_granularity = 20;
> +		break;
> +	case 48:
> +	case 50:
> +		max_vrate = 60;
> +		fallthrough;
> +	case 60:
> +		vtotal_granularity = 20;
> +		break;
> +	case 100:
> +		max_vrate = 120;
> +		fallthrough;
> +	case 120:
> +		vtotal_granularity = 5;
> +		break;
> +	case 200:
> +		max_vrate = 240;
> +		fallthrough;
> +	case 240:
> +		vtotal_granularity = 5;
> +		break;
> +	case 300:
> +		max_vrate = 360;
> +		fallthrough;
> +	case 360:
> +		vtotal_granularity = 5;
> +		break;
> +	case 400:
> +		max_vrate = 480;
> +		fallthrough;
> +	case 480:
> +		vtotal_granularity = 5;
> +		break;
> +	}
> +
> +	/* step 2 */
> +	max_active_time = ((u64)1000000000000 / (u64)max_vrate) -
> +		(u64)OVT_MIN_VBLANK_DURATION;
> +
> +	min_line_time = max_active_time / (u64)rid->vactive;
> +
> +	min_vblank = max_t(u64, (u64)OVT_MIN_VBLANK_LINES,
> +			   DIV64_U64_ROUND_UP(OVT_MIN_VBLANK_DURATION,
> +					      min_line_time));
> +
> +	min_vtotal = rid->vactive + min_vblank;
> +
> +	if (min_vtotal % vtotal_granularity)
> +		min_vtotal += vtotal_granularity - (min_vtotal %
> +						    vtotal_granularity);
> +
> +	/* step 3 */
> +	min_line_rate = max_vrate * min_vtotal;
> +
> +	max_audio_packets_per_line = DIV_ROUND_UP(OVT_AUDIO_PACKET_RATE,
> +						  min_line_rate);
> +
> +	/* step 4 */
> +	min_hblank = OVT_LINE_OVERHEAD + OVT_AUDIO_PACKET_SIZE *
> +		max_audio_packets_per_line;
> +
> +	min_htotal = rid->hactive + max(OVT_MIN_HBLANK_444, min_hblank);
> +
> +	min_pixel_clock_rate = max_vrate * min_htotal * min_vtotal;
> +
> +	htotal_granularity_chunk =
> +		roundup_pow_of_two(DIV_ROUND_UP(min_pixel_clock_rate,
> +						OVT_MAX_CHUNK_RATE));
> +
> +	htotal_granularity = max(OVT_MIN_HTOTAL_GRANULARITY,
> +				 htotal_granularity_chunk);
> +
> +	if (min_htotal % htotal_granularity)
> +		min_htotal += htotal_granularity - (min_htotal %
> +						    htotal_granularity);
> +
> +	resolution_granularity = OVT_PIXEL_CLOCK_GRANULARITY /
> +		gcd(OVT_PIXEL_CLOCK_GRANULARITY, max_vrate);
> +
> +	do {
> +		/* step 5 */
> +		min_resolution = 0;
> +		v = min_vtotal;
> +
> +		goto loop_end;
> +
> +		while (!min_resolution || r <= min_resolution) {
> +			while (r % resolution_granularity ||
> +			       max_vrate * r / (h & ~(h - 1)) >
> +			       OVT_MAX_CHUNK_RATE) {
> +				h += htotal_granularity;
> +				r = (u64)h * (u64)v;
> +			}
> +
> +			if (!min_resolution || r < min_resolution) {
> +				htotal = h;
> +				vtotal = v;
> +				min_resolution = r;
> +			}
> +
> +			v += vtotal_granularity;
> +
> +loop_end:
> +			h = min_htotal;
> +			r = (u64)h * (u64)v;
> +		}
> +
> +		pixel_clock_rate = max_vrate * min_resolution;
> +
> +		/* step 6 */
> +		min_htotal = rid->hactive + max(OVT_MIN_HBLANK_420,
> +						OVT_PIXEL_FACTOR_420 *
> +						min_hblank);
> +	} while (pixel_clock_rate >= OVT_MIN_CLOCK_RATE_420 &&
> +		 htotal < min_htotal);
> +
> +	/* step 7 */
> +	vtotal = vtotal * max_vrate / vrate;
> +
> +	/* step 8 */
> +	vsync_position = max(OVT_MIN_VSYNC_LE_LINES,
> +			     DIV64_U64_ROUND_UP((u64)OVT_MIN_VSYNC_LE_LINES *
> +						(u64)pixel_clock_rate,
> +						(u64)htotal * (u64)1000000));
> +
> +	mode = drm_mode_create(connector->dev);
> +
> +	if (!mode)
> +		return NULL;
> +
> +	mode->clock = pixel_clock_rate / 1000;
> +	mode->hdisplay = rid->hactive;
> +	mode->hsync_start = htotal - OVT_HSYNC_WIDTH * 2;
> +	mode->hsync_end = mode->hsync_start + OVT_HSYNC_WIDTH;
> +	mode->htotal = htotal;
> +
> +	mode->vdisplay = rid->vactive;
> +	mode->vsync_start = vtotal - vsync_position;
> +	mode->vsync_end = mode->vsync_start + OVT_VSYNC_WIDTH;
> +	mode->vtotal = vtotal;
> +
> +	return mode;
> +}
> +
> +/* CTA-861 Video Format Data Block (CTA VFDB) */
> +static int add_modes_from_vfdb(struct drm_connector *connector,
> +			       const struct cea_db *db)
> +{
> +	struct drm_display_info *info = &connector->display_info;
> +	int vfdb_len = cea_db_payload_len(db);
> +	struct drm_display_mode *mode;
> +	struct cta_vfd vfd;
> +	int num_modes = 0;
> +	int vfd_len;
> +	int i;
> +	int j;
> +
> +	if (!vfdb_len)
> +		return 0;
> +
> +	vfd_len = (db->data[0] & 0x3) + 1;
> +
> +	if (!vfd_len)
> +		return 0;
> +
> +	vfdb_len--;
> +
> +	vfdb_len -= (vfdb_len % vfd_len);
> +
> +	for (i = 0; i < vfdb_len; i += vfd_len) {
> +		parse_cta_vfd(&vfd, &db->data[i + 1], vfd_len);
> +
> +		if (!vfd.rid || vfd.rid >= ARRAY_SIZE(rids))
> +			continue;
> +
> +		for (j = 1; j < ARRAY_SIZE(cta_vf_fr); j++) {
> +			if (!vfd_has_fr(&vfd, j) ||
> +			    (cta_vf_fr[j] < 144 && rid_to_vic[vfd.rid][j - 1]))
> +				continue;
> +
> +			mode = calculate_ovt_mode(connector, &rids[vfd.rid],
> +						  cta_vf_fr[j]);
> +
> +			if (!mode)
> +				continue;
> +
> +			mode->height_mm = info->height_mm;
> +			mode->width_mm = info->width_mm;
> +
> +			drm_mode_probed_add(connector, mode);
> +			num_modes++;
> +		}
> +	}
> +
> +	return num_modes;
> +}
> +
>  /*
>   * Update y420_cmdb_modes based on previously parsed CTA VDB and Y420CMDB.
>   *
> @@ -6831,6 +7201,36 @@ static int add_displayid_detailed_1_modes(struct drm_connector *connector,
>  	return num_modes;
>  }
>  
> +static int add_cea_modes(struct drm_connector *connector,
> +			 const struct drm_edid *drm_edid)
> +{
> +	const struct cea_db *db;
> +	struct cea_db_iter iter;
> +	int modes;
> +
> +	/* CTA VDB block VICs parsed earlier */
> +	modes = add_cta_vdb_modes(connector);
> +
> +	cea_db_iter_edid_begin(drm_edid, &iter);
> +	cea_db_iter_for_each(db, &iter) {
> +		if (cea_db_is_hdmi_vsdb(db)) {
> +			modes += do_hdmi_vsdb_modes(connector, (const u8 *)db,
> +						    cea_db_payload_len(db));
> +		} else if (cea_db_is_y420vdb(db)) {
> +			const u8 *vdb420 = cea_db_data(db) + 1;
> +
> +			/* Add 4:2:0(only) modes present in EDID */
> +			modes += do_y420vdb_modes(connector, vdb420,
> +						  cea_db_payload_len(db) - 1);
> +		} else if (cea_db_tag(db) == CTA_DB_VIDEO_FORMAT) {
> +			modes += add_modes_from_vfdb(connector, db);
> +		}
> +	}
> +	cea_db_iter_end(&iter);
> +
> +	return modes;
> +}
> +
>  static int add_displayid_detailed_modes(struct drm_connector *connector,
>  					const struct drm_edid *drm_edid)
>  {

-- 
Jani Nikula, Intel
