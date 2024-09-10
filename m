Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C54BC9736CC
	for <lists+dri-devel@lfdr.de>; Tue, 10 Sep 2024 14:05:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4095710E7A4;
	Tue, 10 Sep 2024 12:05:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hRhAvZ66";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0201F10E7A4
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Sep 2024 12:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725969951; x=1757505951;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=4CxAp4+TqCs9CQbuOVzNtuI8bbHAsMeqXVm2sFoeNyI=;
 b=hRhAvZ66qdPz0GiGmA80l3Jgi0VGQ15QYO2uxdWQ/EasGrM06az9wuV1
 lwyFySkai20W6HDjvk4xmnZFtFHVZE88s3dF0TfNSvww8QLORhjxGuLRl
 /mnqFsmGEUhh878Ipc8b47fBw0M4/vHOwwKazc4mg6nKKxE3Xpvk/HyC5
 ofZhG3QGLTElyMEO6vg5+FH3KMxHM5q/8Drl9rfGX0DJan7meY0A+jeHi
 ALu9aqeR+yhFHdZP/CUyoPA7dJwjP4WGuM6BAhPuAD6JhsbSPjOVLiFrz
 +Jro/uc8HkOFvPNr1JwpyihqTigU47aYvIOR9Hn1HceDsPXdKbJM9lO4Z g==;
X-CSE-ConnectionGUID: T2dZ1PKARCKVnWr8AjMf4g==
X-CSE-MsgGUID: N1hDs2sxTiuAi2kpmhs9iw==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="35850235"
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600"; d="scan'208";a="35850235"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 05:05:50 -0700
X-CSE-ConnectionGUID: 3ClEii5CS9yW87eYRy7ZUQ==
X-CSE-MsgGUID: iyxix+ObRCKerO/n6T8o1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600"; d="scan'208";a="71785531"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.43])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 05:05:46 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Hamza Mahfooz <hamza.mahfooz@amd.com>, dri-devel@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>, Alex
 Deucher <alexander.deucher@amd.com>, Rodrigo
 Siqueira <rodrigo.siqueira@amd.com>, Harry Wentland
 <harry.wentland@amd.com>, Hamza Mahfooz <hamza.mahfooz@amd.com>, Karol
 Herbst <kherbst@redhat.com>
Subject: Re: [PATCH v4] drm/edid: add CTA Video Format Data Block support
In-Reply-To: <20240909171228.148383-1-hamza.mahfooz@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240909171228.148383-1-hamza.mahfooz@amd.com>
Date: Tue, 10 Sep 2024 15:05:42 +0300
Message-ID: <87plpbk92h.fsf@intel.com>
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

On Mon, 09 Sep 2024, Hamza Mahfooz <hamza.mahfooz@amd.com> wrote:
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
> v3: move ovt stuff above add_cea_modes() and break up
>     calculate_ovt_mode() to make it easier to read.
>
> v4: fix 32 bit build and constify read-only vars.

Please find some review inline. I'm not finished, ran out of time/steam
a bit, and there's something to work on.

BR,
Jani.


> ---
>  drivers/gpu/drm/drm_edid.c | 452 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 452 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 855beafb76ff..01de2117aaf2 100644
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

Designated initializers would remove the need for the /* RID 0-9 */
comments:

	[1] = { ... },

> +};
> +
> +/* CTA-861-I Table 12 - AVI InfoFrame Video Format Frame Rate */
> +static const u16 cta_vf_fr[] = {

We don't have to make the names as cryptic as possible. This is only
needed in a few places, so could be video_format_frame_rates or
something. With a comment that it's indexed with rate index.

> +	/* Frame Rate 0-7 */
> +	0, 24, 25, 30, 48, 50, 60, 100,
> +	/* Frame Rate 8-15 */
> +	120, 144, 200, 240, 300, 360, 400, 480,

What if the preference is for 24/1.001 instead of 24?

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

Sparse stuff like this would work better with designated initializers?

	[1] = { ... },

Also removes the need for the /* RID 0-9 */ comments.

> +};
> +
>  /*
>   * From CEA/CTA-861 spec.
>   *
> @@ -4131,6 +4219,7 @@ static int add_detailed_modes(struct drm_connector *connector,
>  #define CTA_DB_VIDEO			2
>  #define CTA_DB_VENDOR			3
>  #define CTA_DB_SPEAKER			4
> +#define CTA_DB_VIDEO_FORMAT		6
>  #define CTA_DB_EXTENDED_TAG		7
>  
>  /* CTA-861-H Table 62 - CTA Extended Tag Codes */
> @@ -4972,6 +5061,16 @@ struct cea_db {
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
> @@ -5250,6 +5349,357 @@ static int edid_hfeeodb_extension_block_count(const struct edid *edid)
>  	return cta[4 + 2];
>  }
>  
> +/* CTA-861 Video Format Descriptor (CTA VFD) */
> +static void parse_cta_vfd(struct cta_vfd *vfd, const u8 *data, int vfd_len)
> +{
> +	vfd->rid = data[0] & 0x3f;
> +	vfd->bfr50 = data[0] & 0x80;
> +	vfd->fr24 = data[0] & 0x40;
> +	vfd->bfr60 = vfd_len > 1 ? (data[1] & 0x80) : 0x1;

It's a bool member, so true instead of 0x1.

> +	vfd->fr144 = vfd_len > 1 ? (data[1] & 0x40) : 0x0;

false instead of 0x0

> +	vfd->fr_fact = vfd_len > 1 ? (data[1] & 0x3f) : 0x3;
> +	vfd->fr48 = vfd_len > 2 ? (data[2] & 0x1) : 0x0;

false instead of 0x0

> +}
> +
> +static bool vfd_has_fr(const struct cta_vfd *vfd, int rate_idx)
> +{
> +	static const u8 factors[] = {
> +		1, 2, 4, 8, 12, 16
> +	};
> +	u16 rate = cta_vf_fr[rate_idx];

Would make more sense to have int rate parameter instead of rate_idx, so
you don't have to access cta_vf_fr here.

Having it int makes sense because it's used in calculation.

> +	u16 factor = 0;
> +	unsigned int i;

Just use int, for both.

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
> +static u32 calculate_ovt_min_vtotal(const struct cta_rid *rid, u64 max_vrate,
> +				    u32 vtotal_granularity)
> +{
> +	u64 max_active_time;
> +	u32 min_line_time;
> +	u32 min_vblank;
> +	u32 min_vtotal;
> +
> +	/* step 2 */
> +	max_active_time = div64_u64(1000000000000, max_vrate) -
> +		(u64)OVT_MIN_VBLANK_DURATION;
> +
> +	min_line_time = div_u64(max_active_time, rid->vactive);
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
> +	return min_vtotal;
> +}
> +
> +static u32 calculate_ovt_min_htotal(const struct cta_rid *rid,
> +				    const u32 max_vrate,
> +				    const u32 min_vtotal,
> +				    u32 *min_hblank,
> +				    u32 *htotal_granularity)
> +{
> +	u32 max_audio_packets_per_line;
> +	u32 htotal_granularity_chunk;
> +	u64 min_pixel_clock_rate;
> +	u32 min_line_rate;
> +	u32 min_htotal;
> +
> +	/* step 3 */
> +	min_line_rate = max_vrate * min_vtotal;
> +
> +	max_audio_packets_per_line = DIV_ROUND_UP(OVT_AUDIO_PACKET_RATE,
> +						  min_line_rate);
> +
> +	/* step 4 */
> +	*min_hblank = OVT_LINE_OVERHEAD + OVT_AUDIO_PACKET_SIZE *
> +		max_audio_packets_per_line;
> +
> +	min_htotal = rid->hactive + max(OVT_MIN_HBLANK_444, *min_hblank);
> +
> +	min_pixel_clock_rate = max_vrate * min_htotal * min_vtotal;
> +
> +	htotal_granularity_chunk =
> +		roundup_pow_of_two(DIV64_U64_ROUND_UP(min_pixel_clock_rate,
> +						      OVT_MAX_CHUNK_RATE));
> +
> +	*htotal_granularity = max(OVT_MIN_HTOTAL_GRANULARITY,
> +				  htotal_granularity_chunk);
> +
> +	if (min_htotal % *htotal_granularity)
> +		min_htotal += *htotal_granularity - (min_htotal %
> +						     *htotal_granularity);
> +
> +	return min_htotal;
> +}
> +
> +static u64 calculate_ovt_pixel_clock_rate(const struct cta_rid *rid,
> +					  const u32 max_vrate,
> +					  const u32 min_hblank,
> +					  u32 min_htotal,
> +					  u32 min_vtotal,
> +					  const u32 htotal_granularity,
> +					  const u32 vtotal_granularity,
> +					  u32 *htotal, u32 *vtotal)
> +{
> +	u32 resolution_granularity;
> +	u64 pixel_clock_rate;
> +	u64 min_resolution;
> +	u64 rem;
> +	u32 h;
> +	u64 r;
> +	u32 v;
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
> +			goto inner_loop_end;
> +
> +			while (rem || div64_u64(max_vrate * r, (h & ~(h - 1))) >
> +			       OVT_MAX_CHUNK_RATE) {
> +				h += htotal_granularity;
> +				r = (u64)h * (u64)v;
> +inner_loop_end:
> +				div64_u64_rem(r, resolution_granularity, &rem);
> +			}
> +
> +			if (!min_resolution || r < min_resolution) {
> +				*htotal = h;
> +				*vtotal = v;
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
> +
> +	} while (pixel_clock_rate >= OVT_MIN_CLOCK_RATE_420 &&
> +		 *htotal < min_htotal);
> +
> +	return pixel_clock_rate;
> +}
> +
> +/* OVT Algorthim as specified in CTA-861-I */
> +static struct drm_display_mode *
> +calculate_ovt_mode(struct drm_connector *connector, const struct cta_rid *rid,
> +		   u16 vrate)
> +{
> +	struct drm_display_mode *mode;
> +	u32 vtotal_granularity = 1;
> +	u32 htotal_granularity;
> +	u32 max_vrate = vrate;
> +	u64 pixel_clock_rate;
> +	u32 vsync_position;
> +	u32 min_hblank;
> +	u32 min_htotal;
> +	u32 min_vtotal;
> +	u32 htotal;
> +	u32 vtotal;
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
> +	min_vtotal = calculate_ovt_min_vtotal(rid, max_vrate,
> +					      vtotal_granularity);
> +
> +	min_htotal = calculate_ovt_min_htotal(rid, max_vrate, min_vtotal,
> +					      &min_hblank, &htotal_granularity);
> +
> +	pixel_clock_rate = calculate_ovt_pixel_clock_rate(rid, max_vrate,
> +							  min_hblank,
> +							  min_htotal,
> +							  min_vtotal,
> +							  htotal_granularity,
> +							  vtotal_granularity,
> +							  &htotal, &vtotal);
> +
> +	/* step 7 */
> +	vtotal = vtotal * max_vrate / (u32)vrate;
> +
> +	/* step 8 */
> +	vsync_position = max(OVT_MIN_VSYNC_LE_LINES,
> +			     DIV64_U64_ROUND_UP((u64)OVT_MIN_VSYNC_LE_LINES *
> +						pixel_clock_rate,
> +						(u64)htotal * (u64)1000000));
> +
> +	mode = drm_mode_create(connector->dev);
> +
> +	if (!mode)
> +		return NULL;
> +
> +	mode->clock = div_u64(pixel_clock_rate, 1000);
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

const

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

This can never happen on the account of + 1.

> +
> +	vfdb_len--;
> +
> +	vfdb_len -= (vfdb_len % vfd_len);

Matter of taste, I'd probably write the above lines as:

	num_vfd = (vfdb_len - 1) / vfd_len

> +
> +	for (i = 0; i < vfdb_len; i += vfd_len) {

And iterate like this:

	for (i = 0; i < num_vfd; i++) {
		const u8 *vfd = &db->data[1 + i * vfd_len];

Up to you.

> +		parse_cta_vfd(&vfd, &db->data[i + 1], vfd_len);
> +
> +		if (!vfd.rid || vfd.rid >= ARRAY_SIZE(rids))
> +			continue;
> +
> +		for (j = 1; j < ARRAY_SIZE(cta_vf_fr); j++) {

Maybe this should be int rate_index instead of j, because it does have a
name in the spec instead of just random iteration?

Probably helps to have

			int rate = video_format_frame_rate[rate_index];


> +			if (!vfd_has_fr(&vfd, j) ||

Pass in rate there.

> +			    (cta_vf_fr[j] < 144 && rid_to_vic[vfd.rid][j - 1]))

This makes my head spin. Probably want a function that says what it
does, and can explain in comments inside. Also useful because you'll
need to bounds check rid_to_vic access.

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
>   * CTA-861 YCbCr 4:2:0 Capability Map Data Block (CTA Y420CMDB)
>   *
> @@ -5318,6 +5768,8 @@ static int add_cea_modes(struct drm_connector *connector,
>  			/* Add 4:2:0(only) modes present in EDID */
>  			modes += do_y420vdb_modes(connector, vdb420,
>  						  cea_db_payload_len(db) - 1);
> +		} else if (cea_db_tag(db) == CTA_DB_VIDEO_FORMAT) {
> +			modes += add_modes_from_vfdb(connector, db);
>  		}
>  	}
>  	cea_db_iter_end(&iter);

-- 
Jani Nikula, Intel
