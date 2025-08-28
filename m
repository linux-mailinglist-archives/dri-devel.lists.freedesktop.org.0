Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E7A2B3A6C6
	for <lists+dri-devel@lfdr.de>; Thu, 28 Aug 2025 18:45:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5E3710EA4B;
	Thu, 28 Aug 2025 16:45:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="olV9FDnI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D893F10EA4D
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 16:45:36 +0000 (UTC)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
 by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57SGisPw2022902;
 Thu, 28 Aug 2025 11:44:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1756399494;
 bh=uvOzIUOt4mRyEwxd4Xgg6NBzk4tyhr5ea4GoxBX2rz0=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=olV9FDnIudQJKaDsNmUyDlKi+4Qe8y9KFTAjT4QvBNDEezi4sE9wlkFbsW9PuMYUe
 76UWa6Tb/Qv4jnc9pE/mPakWBgZIxu5shDVqVnYwtKoCVLM5+2Iu9jW/mqXpidhv6U
 TM2sPTvjj6QulzAiRGwkARXu72PpD52E4+MjtsM0=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
 by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57SGisS93593614
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
 Thu, 28 Aug 2025 11:44:54 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 28
 Aug 2025 11:44:53 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 28 Aug 2025 11:44:53 -0500
Received: from [172.24.233.20] (a0512632.dhcp.ti.com [172.24.233.20])
 by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57SGinYH928769;
 Thu, 28 Aug 2025 11:44:50 -0500
Message-ID: <9e09e8d9-d2b4-4c94-955a-903aec4e812e@ti.com>
Date: Thu, 28 Aug 2025 22:14:49 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] drm/tidss: Remove max_pclk_khz from tidss display
 features
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
CC: <h-shenoy@ti.com>, <devarsht@ti.com>, <vigneshr@ti.com>, <praneeth@ti.com>,
 <u-kumar1@ti.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <jyri.sarha@iki.fi>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <aradhya.bhatia@linux.dev>
References: <20250819192113.2420396-1-s-jain1@ti.com>
 <20250819192113.2420396-3-s-jain1@ti.com>
 <b95b60c3-5988-4238-a8d4-73bd8bbf8779@ideasonboard.com>
Content-Language: en-US
From: Swamil Jain <s-jain1@ti.com>
In-Reply-To: <b95b60c3-5988-4238-a8d4-73bd8bbf8779@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
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



On 8/27/25 14:19, Tomi Valkeinen wrote:
> Hi,
> 
> On 19/08/2025 22:21, Swamil Jain wrote:
>> From: Jayesh Choudhary <j-choudhary@ti.com>
>>
>> TIDSS hardware by itself does not have variable max_pclk for each VP.
>> The maximum pixel clock is determined by the limiting factor between
>> the functional clock and the PLL (parent to the VP/pixel clock).
> 
> Hmm, this is actually not in the driver, is it? We're not limiting the
> pclk based on the fclk.
Hi Tomi,
We are checking what all pclks can be supported, which is limited by 
fclk, thats what Jayesh wanted to mention here.
> 
>> The limitation that has been modeled till now comes from the clock
>> (PLL can only be programmed to a particular max value). Instead of
>> putting it as a constant field in dispc_features, we can query the
>> DM to see if requested clock can be set or not and use it in
>> mode_valid().
>>
>> Replace constant "max_pclk_khz" in dispc_features with
>> max_successful_rate and max_attempted_rate, both of these in
>> tidss_device structure would be modified in runtime. In mode_valid()
>> call, check if a best frequency match for mode clock can be found or
>> not using "clk_round_rate()". Based on that, propagate
>> max_successful_rate and max_attempted_rate and query DM again only if
>> the requested mode clock is greater than max_attempted_rate. (As the
>> preferred display mode is usually the max resolution, driver ends up
>> checking the highest clock the first time itself which is used in
>> subsequent checks).
>>
>> Since TIDSS display controller provides clock tolerance of 5%, we use
>> this while checking the max_successful_rate. Also, move up
>> "dispc_pclk_diff()" before it is called.
>>
>> This will make the existing compatibles reusable if DSS features are
>> same across two SoCs with the only difference being the pixel clock.
>>
>> Fixes: 7246e0929945 ("drm/tidss: Add OLDI bridge support")
>> Reviewed-by: Devarsh Thakkar <devarsht@ti.com>
>> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
>> Signed-off-by: Swamil Jain <s-jain1@ti.com>
>> ---
>>   drivers/gpu/drm/tidss/tidss_dispc.c | 85 +++++++++++++----------------
>>   drivers/gpu/drm/tidss/tidss_dispc.h |  1 -
>>   drivers/gpu/drm/tidss/tidss_drv.h   | 11 +++-
>>   3 files changed, 47 insertions(+), 50 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c b/drivers/gpu/drm/tidss/tidss_dispc.c
>> index c0277fa36425..c2c0fe0d4a0f 100644
>> --- a/drivers/gpu/drm/tidss/tidss_dispc.c
>> +++ b/drivers/gpu/drm/tidss/tidss_dispc.c
>> @@ -58,10 +58,6 @@ static const u16 tidss_k2g_common_regs[DISPC_COMMON_REG_TABLE_LEN] = {
>>   const struct dispc_features dispc_k2g_feats = {
>>   	.min_pclk_khz = 4375,
>>   
>> -	.max_pclk_khz = {
>> -		[DISPC_VP_DPI] = 150000,
>> -	},
>> -
>>   	/*
>>   	 * XXX According TRM the RGB input buffer width up to 2560 should
>>   	 *     work on 3 taps, but in practice it only works up to 1280.
>> @@ -144,11 +140,6 @@ static const u16 tidss_am65x_common_regs[DISPC_COMMON_REG_TABLE_LEN] = {
>>   };
>>   
>>   const struct dispc_features dispc_am65x_feats = {
>> -	.max_pclk_khz = {
>> -		[DISPC_VP_DPI] = 165000,
>> -		[DISPC_VP_OLDI_AM65X] = 165000,
>> -	},
>> -
>>   	.scaling = {
>>   		.in_width_max_5tap_rgb = 1280,
>>   		.in_width_max_3tap_rgb = 2560,
>> @@ -244,11 +235,6 @@ static const u16 tidss_j721e_common_regs[DISPC_COMMON_REG_TABLE_LEN] = {
>>   };
>>   
>>   const struct dispc_features dispc_j721e_feats = {
>> -	.max_pclk_khz = {
>> -		[DISPC_VP_DPI] = 170000,
>> -		[DISPC_VP_INTERNAL] = 600000,
>> -	},
>> -
>>   	.scaling = {
>>   		.in_width_max_5tap_rgb = 2048,
>>   		.in_width_max_3tap_rgb = 4096,
>> @@ -315,11 +301,6 @@ const struct dispc_features dispc_j721e_feats = {
>>   };
>>   
>>   const struct dispc_features dispc_am625_feats = {
>> -	.max_pclk_khz = {
>> -		[DISPC_VP_DPI] = 165000,
>> -		[DISPC_VP_INTERNAL] = 170000,
>> -	},
>> -
>>   	.scaling = {
>>   		.in_width_max_5tap_rgb = 1280,
>>   		.in_width_max_3tap_rgb = 2560,
>> @@ -376,15 +357,6 @@ const struct dispc_features dispc_am625_feats = {
>>   };
>>   
>>   const struct dispc_features dispc_am62a7_feats = {
>> -	/*
>> -	 * if the code reaches dispc_mode_valid with VP1,
>> -	 * it should return MODE_BAD.
>> -	 */
>> -	.max_pclk_khz = {
>> -		[DISPC_VP_TIED_OFF] = 0,
>> -		[DISPC_VP_DPI] = 165000,
>> -	},
>> -
>>   	.scaling = {
>>   		.in_width_max_5tap_rgb = 1280,
>>   		.in_width_max_3tap_rgb = 2560,
>> @@ -441,10 +413,6 @@ const struct dispc_features dispc_am62a7_feats = {
>>   };
>>   
>>   const struct dispc_features dispc_am62l_feats = {
>> -	.max_pclk_khz = {
>> -		[DISPC_VP_DPI] = 165000,
>> -	},
>> -
>>   	.subrev = DISPC_AM62L,
>>   
>>   	.common = "common",
>> @@ -1347,25 +1315,57 @@ static void dispc_vp_set_default_color(struct dispc_device *dispc,
>>   			DISPC_OVR_DEFAULT_COLOR2, (v >> 32) & 0xffff);
>>   }
>>   
>> +/*
>> + * Calculate the percentage difference between the requested pixel clock rate
>> + * and the effective rate resulting from calculating the clock divider value.
>> + */
>> +unsigned int dispc_pclk_diff(unsigned long rate, unsigned long real_rate)
>> +{
>> +	int r = rate / 100, rr = real_rate / 100;
>> +
>> +	return (unsigned int)(abs(((rr - r) * 100) / r));
>> +}
>> +
>> +static int check_pixel_clock(struct dispc_device *dispc,
>> +			     u32 hw_videoport, unsigned long clock)
>> +{
>> +	unsigned long round_clock;
>> +
>> +	if (dispc->tidss->is_ext_vp_clk[hw_videoport])
>> +		return 0;
>> +
>> +	if (clock <= dispc->tidss->max_successful_rate[hw_videoport])
>> +		return 0;
>> +
>> +	if (clock < dispc->tidss->max_attempted_rate[hw_videoport])
>> +		return -EINVAL;
>> +
>> +	round_clock = clk_round_rate(dispc->vp_clk[hw_videoport], clock);
>> +
>> +	if (dispc_pclk_diff(clock, round_clock) > 5)
>> +		return -EINVAL;
>> +
>> +	dispc->tidss->max_successful_rate[hw_videoport] = round_clock;
>> +	dispc->tidss->max_attempted_rate[hw_videoport] = clock;
> 
> I still don't think this logic is sound. This is trying to find the
> maximum clock rate, and optimize by avoiding the calls to
> clk_round_rate() if possible. That makes sense.
> 
> But checking for the 5% tolerance breaks it, in my opinion. If we find
> out that the PLL can do, say, 100M, but we need pclk of 90M, the current
> maximum is still the 100M, isn't it?
> 
> Why can't we replace the "if (mode->clock > max_pclk)" check with a new
> check that only looks for the max rate? If we want to add tolerance
> checks to mode_valid (which are currently not there), let's add it in a
> separate patch.
> 

Yeah, we can drop tolerance check. So, should we drop 
check_pixel_clock() and also clk_round_rate(), but then how can we know 
the maximum supported pclk?

Regards,
Swamil
>   Tomi
> 
>> +	return 0;
>> +}
>> +
>>   enum drm_mode_status dispc_vp_mode_valid(struct dispc_device *dispc,
>>   					 u32 hw_videoport,
>>   					 const struct drm_display_mode *mode)
>>   {
>>   	u32 hsw, hfp, hbp, vsw, vfp, vbp;
>>   	enum dispc_vp_bus_type bus_type;
>> -	int max_pclk;
>>   
>>   	bus_type = dispc->feat->vp_bus_type[hw_videoport];
>>   
>> -	max_pclk = dispc->feat->max_pclk_khz[bus_type];
>> -
>> -	if (WARN_ON(max_pclk == 0))
>> +	if (WARN_ON(bus_type == DISPC_VP_TIED_OFF))
>>   		return MODE_BAD;
>>   
>>   	if (mode->clock < dispc->feat->min_pclk_khz)
>>   		return MODE_CLOCK_LOW;
>>   
>> -	if (mode->clock > max_pclk)
>> +	if (check_pixel_clock(dispc, hw_videoport, mode->clock * 1000))
>>   		return MODE_CLOCK_HIGH;
>>   
>>   	if (mode->hdisplay > 4096)
>> @@ -1437,17 +1437,6 @@ void dispc_vp_disable_clk(struct dispc_device *dispc, u32 hw_videoport)
>>   	clk_disable_unprepare(dispc->vp_clk[hw_videoport]);
>>   }
>>   
>> -/*
>> - * Calculate the percentage difference between the requested pixel clock rate
>> - * and the effective rate resulting from calculating the clock divider value.
>> - */
>> -unsigned int dispc_pclk_diff(unsigned long rate, unsigned long real_rate)
>> -{
>> -	int r = rate / 100, rr = real_rate / 100;
>> -
>> -	return (unsigned int)(abs(((rr - r) * 100) / r));
>> -}
>> -
>>   int dispc_vp_set_clk_rate(struct dispc_device *dispc, u32 hw_videoport,
>>   			  unsigned long rate)
>>   {
>> diff --git a/drivers/gpu/drm/tidss/tidss_dispc.h b/drivers/gpu/drm/tidss/tidss_dispc.h
>> index b8614f62186c..45b1a8aa9089 100644
>> --- a/drivers/gpu/drm/tidss/tidss_dispc.h
>> +++ b/drivers/gpu/drm/tidss/tidss_dispc.h
>> @@ -75,7 +75,6 @@ enum dispc_dss_subrevision {
>>   
>>   struct dispc_features {
>>   	int min_pclk_khz;
>> -	int max_pclk_khz[DISPC_VP_MAX_BUS_TYPE];
>>   
>>   	struct dispc_features_scaling scaling;
>>   
>> diff --git a/drivers/gpu/drm/tidss/tidss_drv.h b/drivers/gpu/drm/tidss/tidss_drv.h
>> index 4e38cfa99e84..667c0d772519 100644
>> --- a/drivers/gpu/drm/tidss/tidss_drv.h
>> +++ b/drivers/gpu/drm/tidss/tidss_drv.h
>> @@ -23,7 +23,16 @@ struct tidss_device {
>>   	const struct dispc_features *feat;
>>   	struct dispc_device *dispc;
>>   	bool is_ext_vp_clk[TIDSS_MAX_PORTS];
>> -
>> +	/*
>> +	 * Stores highest pixel clock value found to be valid while checking
>> +	 * supported modes for connected display
>> +	 */
>> +	unsigned long max_successful_rate[TIDSS_MAX_PORTS];
>> +	/*
>> +	 * Stores the highest attempted pixel clock rate whose validated
>> +	 * clock is within the tolerance range
>> +	 */
>> +	unsigned long max_attempted_rate[TIDSS_MAX_PORTS];
>>   
>>   	unsigned int num_crtcs;
>>   	struct drm_crtc *crtcs[TIDSS_MAX_PORTS];
> 
