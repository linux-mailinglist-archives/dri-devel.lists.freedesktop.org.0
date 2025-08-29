Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56AB5B3B1AA
	for <lists+dri-devel@lfdr.de>; Fri, 29 Aug 2025 05:36:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D84410E0FC;
	Fri, 29 Aug 2025 03:36:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="ykOBuaPU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7068B10E0FC
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Aug 2025 03:36:04 +0000 (UTC)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
 by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57T3Zgs82125605;
 Thu, 28 Aug 2025 22:35:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1756438542;
 bh=MnNnMiBnjKxS0KNBGKV1zsRKP9rn+onVDjDEmRf3yQA=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=ykOBuaPUjPUgE9CQXnFpiMjYB1r4xe6oQmsZOqS0NAtNisNiy2HMWZUMU54/2m3UA
 JSe1lCFnByQse2YrcjVy8yEaKk7xujz1uMP1whscHe3ieMHODTdCLM+4mMzTfVhxTf
 1BEb56jsnU8GPzAJFdXEegJ7QRhJOg9WWSf6zpno=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
 by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57T3Zfpc3360728
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
 Thu, 28 Aug 2025 22:35:41 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 28
 Aug 2025 22:35:41 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 28 Aug 2025 22:35:41 -0500
Received: from [172.24.233.20] (a0512632.dhcp.ti.com [172.24.233.20])
 by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57T3Zad21694012;
 Thu, 28 Aug 2025 22:35:37 -0500
Message-ID: <26637ec8-1a66-4f3f-9b8e-1fe310c2cb81@ti.com>
Date: Fri, 29 Aug 2025 09:05:36 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] drm/tidss: Remove max_pclk_khz from tidss display
 features
To: Maxime Ripard <mripard@kernel.org>, Tomi Valkeinen
 <tomi.valkeinen@ideasonboard.com>
CC: <h-shenoy@ti.com>, <devarsht@ti.com>, <vigneshr@ti.com>, <praneeth@ti.com>,
 <u-kumar1@ti.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <jyri.sarha@iki.fi>,
 <maarten.lankhorst@linux.intel.com>, <tzimmermann@suse.de>,
 <airlied@gmail.com>, <simona@ffwll.ch>, <aradhya.bhatia@linux.dev>
References: <20250819192113.2420396-1-s-jain1@ti.com>
 <20250819192113.2420396-3-s-jain1@ti.com>
 <b95b60c3-5988-4238-a8d4-73bd8bbf8779@ideasonboard.com>
 <20250827-illegal-splendid-coyote-aff8cc@houat>
Content-Language: en-US
From: Swamil Jain <s-jain1@ti.com>
In-Reply-To: <20250827-illegal-splendid-coyote-aff8cc@houat>
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



On 8/27/25 14:57, Maxime Ripard wrote:
> On Wed, Aug 27, 2025 at 11:49:22AM +0300, Tomi Valkeinen wrote:
>> On 19/08/2025 22:21, Swamil Jain wrote:
>>> From: Jayesh Choudhary <j-choudhary@ti.com>
>>>
>>> TIDSS hardware by itself does not have variable max_pclk for each VP.
>>> The maximum pixel clock is determined by the limiting factor between
>>> the functional clock and the PLL (parent to the VP/pixel clock).
>>
>> Hmm, this is actually not in the driver, is it? We're not limiting the
>> pclk based on the fclk.
>>
>>> The limitation that has been modeled till now comes from the clock
>>> (PLL can only be programmed to a particular max value). Instead of
>>> putting it as a constant field in dispc_features, we can query the
>>> DM to see if requested clock can be set or not and use it in
>>> mode_valid().
>>>
>>> Replace constant "max_pclk_khz" in dispc_features with
>>> max_successful_rate and max_attempted_rate, both of these in
>>> tidss_device structure would be modified in runtime. In mode_valid()
>>> call, check if a best frequency match for mode clock can be found or
>>> not using "clk_round_rate()". Based on that, propagate
>>> max_successful_rate and max_attempted_rate and query DM again only if
>>> the requested mode clock is greater than max_attempted_rate. (As the
>>> preferred display mode is usually the max resolution, driver ends up
>>> checking the highest clock the first time itself which is used in
>>> subsequent checks).
>>>
>>> Since TIDSS display controller provides clock tolerance of 5%, we use
>>> this while checking the max_successful_rate. Also, move up
>>> "dispc_pclk_diff()" before it is called.
>>>
>>> This will make the existing compatibles reusable if DSS features are
>>> same across two SoCs with the only difference being the pixel clock.
>>>
>>> Fixes: 7246e0929945 ("drm/tidss: Add OLDI bridge support")
>>> Reviewed-by: Devarsh Thakkar <devarsht@ti.com>
>>> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
>>> Signed-off-by: Swamil Jain <s-jain1@ti.com>
>>> ---
>>>   drivers/gpu/drm/tidss/tidss_dispc.c | 85 +++++++++++++----------------
>>>   drivers/gpu/drm/tidss/tidss_dispc.h |  1 -
>>>   drivers/gpu/drm/tidss/tidss_drv.h   | 11 +++-
>>>   3 files changed, 47 insertions(+), 50 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c b/drivers/gpu/drm/tidss/tidss_dispc.c
>>> index c0277fa36425..c2c0fe0d4a0f 100644
>>> --- a/drivers/gpu/drm/tidss/tidss_dispc.c
>>> +++ b/drivers/gpu/drm/tidss/tidss_dispc.c
>>> @@ -58,10 +58,6 @@ static const u16 tidss_k2g_common_regs[DISPC_COMMON_REG_TABLE_LEN] = {
>>>   const struct dispc_features dispc_k2g_feats = {
>>>   	.min_pclk_khz = 4375,
>>>   
>>> -	.max_pclk_khz = {
>>> -		[DISPC_VP_DPI] = 150000,
>>> -	},
>>> -
>>>   	/*
>>>   	 * XXX According TRM the RGB input buffer width up to 2560 should
>>>   	 *     work on 3 taps, but in practice it only works up to 1280.
>>> @@ -144,11 +140,6 @@ static const u16 tidss_am65x_common_regs[DISPC_COMMON_REG_TABLE_LEN] = {
>>>   };
>>>   
>>>   const struct dispc_features dispc_am65x_feats = {
>>> -	.max_pclk_khz = {
>>> -		[DISPC_VP_DPI] = 165000,
>>> -		[DISPC_VP_OLDI_AM65X] = 165000,
>>> -	},
>>> -
>>>   	.scaling = {
>>>   		.in_width_max_5tap_rgb = 1280,
>>>   		.in_width_max_3tap_rgb = 2560,
>>> @@ -244,11 +235,6 @@ static const u16 tidss_j721e_common_regs[DISPC_COMMON_REG_TABLE_LEN] = {
>>>   };
>>>   
>>>   const struct dispc_features dispc_j721e_feats = {
>>> -	.max_pclk_khz = {
>>> -		[DISPC_VP_DPI] = 170000,
>>> -		[DISPC_VP_INTERNAL] = 600000,
>>> -	},
>>> -
>>>   	.scaling = {
>>>   		.in_width_max_5tap_rgb = 2048,
>>>   		.in_width_max_3tap_rgb = 4096,
>>> @@ -315,11 +301,6 @@ const struct dispc_features dispc_j721e_feats = {
>>>   };
>>>   
>>>   const struct dispc_features dispc_am625_feats = {
>>> -	.max_pclk_khz = {
>>> -		[DISPC_VP_DPI] = 165000,
>>> -		[DISPC_VP_INTERNAL] = 170000,
>>> -	},
>>> -
>>>   	.scaling = {
>>>   		.in_width_max_5tap_rgb = 1280,
>>>   		.in_width_max_3tap_rgb = 2560,
>>> @@ -376,15 +357,6 @@ const struct dispc_features dispc_am625_feats = {
>>>   };
>>>   
>>>   const struct dispc_features dispc_am62a7_feats = {
>>> -	/*
>>> -	 * if the code reaches dispc_mode_valid with VP1,
>>> -	 * it should return MODE_BAD.
>>> -	 */
>>> -	.max_pclk_khz = {
>>> -		[DISPC_VP_TIED_OFF] = 0,
>>> -		[DISPC_VP_DPI] = 165000,
>>> -	},
>>> -
>>>   	.scaling = {
>>>   		.in_width_max_5tap_rgb = 1280,
>>>   		.in_width_max_3tap_rgb = 2560,
>>> @@ -441,10 +413,6 @@ const struct dispc_features dispc_am62a7_feats = {
>>>   };
>>>   
>>>   const struct dispc_features dispc_am62l_feats = {
>>> -	.max_pclk_khz = {
>>> -		[DISPC_VP_DPI] = 165000,
>>> -	},
>>> -
>>>   	.subrev = DISPC_AM62L,
>>>   
>>>   	.common = "common",
>>> @@ -1347,25 +1315,57 @@ static void dispc_vp_set_default_color(struct dispc_device *dispc,
>>>   			DISPC_OVR_DEFAULT_COLOR2, (v >> 32) & 0xffff);
>>>   }
>>>   
>>> +/*
>>> + * Calculate the percentage difference between the requested pixel clock rate
>>> + * and the effective rate resulting from calculating the clock divider value.
>>> + */
>>> +unsigned int dispc_pclk_diff(unsigned long rate, unsigned long real_rate)
>>> +{
>>> +	int r = rate / 100, rr = real_rate / 100;
>>> +
>>> +	return (unsigned int)(abs(((rr - r) * 100) / r));
>>> +}
>>> +
>>> +static int check_pixel_clock(struct dispc_device *dispc,
>>> +			     u32 hw_videoport, unsigned long clock)
>>> +{
>>> +	unsigned long round_clock;
>>> +
>>> +	if (dispc->tidss->is_ext_vp_clk[hw_videoport])
>>> +		return 0;
>>> +
>>> +	if (clock <= dispc->tidss->max_successful_rate[hw_videoport])
>>> +		return 0;
>>> +
>>> +	if (clock < dispc->tidss->max_attempted_rate[hw_videoport])
>>> +		return -EINVAL;
>>> +
>>> +	round_clock = clk_round_rate(dispc->vp_clk[hw_videoport], clock);
>>> +
>>> +	if (dispc_pclk_diff(clock, round_clock) > 5)
>>> +		return -EINVAL;
>>> +
>>> +	dispc->tidss->max_successful_rate[hw_videoport] = round_clock;
>>> +	dispc->tidss->max_attempted_rate[hw_videoport] = clock;
>>
>> I still don't think this logic is sound. This is trying to find the
>> maximum clock rate, and optimize by avoiding the calls to
>> clk_round_rate() if possible. That makes sense.
>>
>> But checking for the 5% tolerance breaks it, in my opinion. If we find
>> out that the PLL can do, say, 100M, but we need pclk of 90M, the current
>> maximum is still the 100M, isn't it?
> 
> 5% is pretty large indeed. We've been using .5% in multiple drivers and
> it proved to be pretty ok. I would advise you tu use it too.
> 
> It's not clear to me why avoiding a clk_round_rate() call is something
> worth doing though?
> 
> Even caching the maximum rate you have been able to reach before is
> pretty fragile: if the PLL changes its rate, or if a sibling clock has
> set some limits on what the PLL can do, your maximum isn't relevant
> anymore.
> 
> in other words, what's wrong with simply calling clk_round_rate() and
> checking if it's within a .5% deviation?
> 
Hi Maxime,
Tomi already respoded for 5% tolerance.
> At the very least, this should be explained in comments or the commit
> message.
Sure, will add this in more detail in comments/commit message.

Regards,
Swamil
> 
> Maxime
