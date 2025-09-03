Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65417B41A0D
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 11:31:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 994B010E3CB;
	Wed,  3 Sep 2025 09:31:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Gom1oMnW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A211710E3CB
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Sep 2025 09:31:07 +0000 (UTC)
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi
 [91.158.153.178])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 41EDA8BF;
 Wed,  3 Sep 2025 11:29:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1756891798;
 bh=RZdHQmTa0OgWbWMU1TzBcbgf7k+g9lG3NCiNf061PQI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Gom1oMnWEY0kBeZocFqzQQt1+Si1hMu1dieLryTnFbfOztFg/hh+Z1pjd21Pe+qGg
 BhDsjyyZHxzCDcqicXHwPNJn+241bxUjRtGIXcIeBUoXp4K8xpQs5KCvwIzw0VPh5w
 9U90+QDAG90hGRPL7Pzc+44yv7Tb2a2Mwr9mkcXQ=
Message-ID: <67c54a2e-953e-4385-ac85-324a0d20e5c1@ideasonboard.com>
Date: Wed, 3 Sep 2025 12:31:03 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] drm/tidss: Remove max_pclk_khz from tidss display
 features
To: Swamil Jain <s-jain1@ti.com>, Maxime Ripard <mripard@kernel.org>
Cc: h-shenoy@ti.com, devarsht@ti.com, vigneshr@ti.com, praneeth@ti.com,
 u-kumar1@ti.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, jyri.sarha@iki.fi,
 maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, aradhya.bhatia@linux.dev
References: <20250819192113.2420396-1-s-jain1@ti.com>
 <20250819192113.2420396-3-s-jain1@ti.com>
 <b95b60c3-5988-4238-a8d4-73bd8bbf8779@ideasonboard.com>
 <20250827-illegal-splendid-coyote-aff8cc@houat>
 <c3488e85-5cf0-4c97-85c3-64f4c2f5c9c5@ideasonboard.com>
 <c7f6958f-2c05-4887-88fa-a36bba3c73b6@ti.com>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <c7f6958f-2c05-4887-88fa-a36bba3c73b6@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

Hi,

On 03/09/2025 11:38, Swamil Jain wrote:
> Hi Tomi, Maxime,
> 
> On 8/27/25 15:19, Tomi Valkeinen wrote:
>> Hi,
>>
>> On 27/08/2025 12:27, Maxime Ripard wrote:
>>> On Wed, Aug 27, 2025 at 11:49:22AM +0300, Tomi Valkeinen wrote:
>>>> On 19/08/2025 22:21, Swamil Jain wrote:
>>>>> From: Jayesh Choudhary <j-choudhary@ti.com>
>>>>>
>>>>> TIDSS hardware by itself does not have variable max_pclk for each VP.
>>>>> The maximum pixel clock is determined by the limiting factor between
>>>>> the functional clock and the PLL (parent to the VP/pixel clock).
>>>>
>>>> Hmm, this is actually not in the driver, is it? We're not limiting the
>>>> pclk based on the fclk.
>>>>
>>>>> The limitation that has been modeled till now comes from the clock
>>>>> (PLL can only be programmed to a particular max value). Instead of
>>>>> putting it as a constant field in dispc_features, we can query the
>>>>> DM to see if requested clock can be set or not and use it in
>>>>> mode_valid().
>>>>>
>>>>> Replace constant "max_pclk_khz" in dispc_features with
>>>>> max_successful_rate and max_attempted_rate, both of these in
>>>>> tidss_device structure would be modified in runtime. In mode_valid()
>>>>> call, check if a best frequency match for mode clock can be found or
>>>>> not using "clk_round_rate()". Based on that, propagate
>>>>> max_successful_rate and max_attempted_rate and query DM again only if
>>>>> the requested mode clock is greater than max_attempted_rate. (As the
>>>>> preferred display mode is usually the max resolution, driver ends up
>>>>> checking the highest clock the first time itself which is used in
>>>>> subsequent checks).
>>>>>
>>>>> Since TIDSS display controller provides clock tolerance of 5%, we use
>>>>> this while checking the max_successful_rate. Also, move up
>>>>> "dispc_pclk_diff()" before it is called.
>>>>>
>>>>> This will make the existing compatibles reusable if DSS features are
>>>>> same across two SoCs with the only difference being the pixel clock.
>>>>>
>>>>> Fixes: 7246e0929945 ("drm/tidss: Add OLDI bridge support")
>>>>> Reviewed-by: Devarsh Thakkar <devarsht@ti.com>
>>>>> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
>>>>> Signed-off-by: Swamil Jain <s-jain1@ti.com>
>>>>> ---
>>>>>   drivers/gpu/drm/tidss/tidss_dispc.c | 85 ++++++++++++
>>>>> +----------------
>>>>>   drivers/gpu/drm/tidss/tidss_dispc.h |  1 -
>>>>>   drivers/gpu/drm/tidss/tidss_drv.h   | 11 +++-
>>>>>   3 files changed, 47 insertions(+), 50 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c b/drivers/gpu/drm/
>>>>> tidss/tidss_dispc.c
>>>>> index c0277fa36425..c2c0fe0d4a0f 100644
>>>>> --- a/drivers/gpu/drm/tidss/tidss_dispc.c
>>>>> +++ b/drivers/gpu/drm/tidss/tidss_dispc.c
>>>>> @@ -58,10 +58,6 @@ static const u16
>>>>> tidss_k2g_common_regs[DISPC_COMMON_REG_TABLE_LEN] = {
>>>>>   const struct dispc_features dispc_k2g_feats = {
>>>>>       .min_pclk_khz = 4375,
>>>>>   -    .max_pclk_khz = {
>>>>> -        [DISPC_VP_DPI] = 150000,
>>>>> -    },
>>>>> -
>>>>>       /*
>>>>>        * XXX According TRM the RGB input buffer width up to 2560
>>>>> should
>>>>>        *     work on 3 taps, but in practice it only works up to 1280.
>>>>> @@ -144,11 +140,6 @@ static const u16
>>>>> tidss_am65x_common_regs[DISPC_COMMON_REG_TABLE_LEN] = {
>>>>>   };
>>>>>     const struct dispc_features dispc_am65x_feats = {
>>>>> -    .max_pclk_khz = {
>>>>> -        [DISPC_VP_DPI] = 165000,
>>>>> -        [DISPC_VP_OLDI_AM65X] = 165000,
>>>>> -    },
>>>>> -
>>>>>       .scaling = {
>>>>>           .in_width_max_5tap_rgb = 1280,
>>>>>           .in_width_max_3tap_rgb = 2560,
>>>>> @@ -244,11 +235,6 @@ static const u16
>>>>> tidss_j721e_common_regs[DISPC_COMMON_REG_TABLE_LEN] = {
>>>>>   };
>>>>>     const struct dispc_features dispc_j721e_feats = {
>>>>> -    .max_pclk_khz = {
>>>>> -        [DISPC_VP_DPI] = 170000,
>>>>> -        [DISPC_VP_INTERNAL] = 600000,
>>>>> -    },
>>>>> -
>>>>>       .scaling = {
>>>>>           .in_width_max_5tap_rgb = 2048,
>>>>>           .in_width_max_3tap_rgb = 4096,
>>>>> @@ -315,11 +301,6 @@ const struct dispc_features dispc_j721e_feats = {
>>>>>   };
>>>>>     const struct dispc_features dispc_am625_feats = {
>>>>> -    .max_pclk_khz = {
>>>>> -        [DISPC_VP_DPI] = 165000,
>>>>> -        [DISPC_VP_INTERNAL] = 170000,
>>>>> -    },
>>>>> -
>>>>>       .scaling = {
>>>>>           .in_width_max_5tap_rgb = 1280,
>>>>>           .in_width_max_3tap_rgb = 2560,
>>>>> @@ -376,15 +357,6 @@ const struct dispc_features dispc_am625_feats = {
>>>>>   };
>>>>>     const struct dispc_features dispc_am62a7_feats = {
>>>>> -    /*
>>>>> -     * if the code reaches dispc_mode_valid with VP1,
>>>>> -     * it should return MODE_BAD.
>>>>> -     */
>>>>> -    .max_pclk_khz = {
>>>>> -        [DISPC_VP_TIED_OFF] = 0,
>>>>> -        [DISPC_VP_DPI] = 165000,
>>>>> -    },
>>>>> -
>>>>>       .scaling = {
>>>>>           .in_width_max_5tap_rgb = 1280,
>>>>>           .in_width_max_3tap_rgb = 2560,
>>>>> @@ -441,10 +413,6 @@ const struct dispc_features dispc_am62a7_feats
>>>>> = {
>>>>>   };
>>>>>     const struct dispc_features dispc_am62l_feats = {
>>>>> -    .max_pclk_khz = {
>>>>> -        [DISPC_VP_DPI] = 165000,
>>>>> -    },
>>>>> -
>>>>>       .subrev = DISPC_AM62L,
>>>>>         .common = "common",
>>>>> @@ -1347,25 +1315,57 @@ static void
>>>>> dispc_vp_set_default_color(struct dispc_device *dispc,
>>>>>               DISPC_OVR_DEFAULT_COLOR2, (v >> 32) & 0xffff);
>>>>>   }
>>>>>   +/*
>>>>> + * Calculate the percentage difference between the requested pixel
>>>>> clock rate
>>>>> + * and the effective rate resulting from calculating the clock
>>>>> divider value.
>>>>> + */
>>>>> +unsigned int dispc_pclk_diff(unsigned long rate, unsigned long
>>>>> real_rate)
>>>>> +{
>>>>> +    int r = rate / 100, rr = real_rate / 100;
>>>>> +
>>>>> +    return (unsigned int)(abs(((rr - r) * 100) / r));
>>>>> +}
>>>>> +
>>>>> +static int check_pixel_clock(struct dispc_device *dispc,
>>>>> +                 u32 hw_videoport, unsigned long clock)
>>>>> +{
>>>>> +    unsigned long round_clock;
>>>>> +
>>>>> +    if (dispc->tidss->is_ext_vp_clk[hw_videoport])
>>>>> +        return 0;
>>>>> +
>>>>> +    if (clock <= dispc->tidss->max_successful_rate[hw_videoport])
>>>>> +        return 0;
>>>>> +
>>>>> +    if (clock < dispc->tidss->max_attempted_rate[hw_videoport])
>>>>> +        return -EINVAL;
>>>>> +
>>>>> +    round_clock = clk_round_rate(dispc->vp_clk[hw_videoport], clock);
>>>>> +
>>>>> +    if (dispc_pclk_diff(clock, round_clock) > 5)
>>>>> +        return -EINVAL;
>>>>> +
>>>>> +    dispc->tidss->max_successful_rate[hw_videoport] = round_clock;
>>>>> +    dispc->tidss->max_attempted_rate[hw_videoport] = clock;
>>>>
>>>> I still don't think this logic is sound. This is trying to find the
>>>> maximum clock rate, and optimize by avoiding the calls to
>>>> clk_round_rate() if possible. That makes sense.
>>>>
>>>> But checking for the 5% tolerance breaks it, in my opinion. If we find
>>>> out that the PLL can do, say, 100M, but we need pclk of 90M, the
>>>> current
>>>> maximum is still the 100M, isn't it?
>>>
>>> 5% is pretty large indeed. We've been using .5% in multiple drivers and
>>> it proved to be pretty ok. I would advise you tu use it too.
>>
>> The 5% comes from OMAP DSS, where we had to do pixel clock with a few
>> dividers and multipliers. The rates were quite coarse, and we ended up
>> having quite a large tolerance.
>>
>> I think with tidss, we always have a PLL we control, so we should always
>> have very exact clocks. So I'm fine with dropping it to .5%. However,
>> this patch and series is about removing the a-bit-too-hardcoded VP clk
>> max rate code in the driver, so I would leave everything else to another
>> series.
>>
>>> It's not clear to me why avoiding a clk_round_rate() call is something
>>> worth doing though?
>>
>> Hard to say if it's worth doing, someone should make some perf tests.
>> However, afaik, the calls do go to the firmware, so it involves
>> inter-processor calls. On OMAP DSS checking the clock rates was slow, as
>> it involved lots of iterating with dividers and multipliers. Perhaps
>> it's much faster here.
>>
>>> Even caching the maximum rate you have been able to reach before is
>>> pretty fragile: if the PLL changes its rate, or if a sibling clock has
>>> set some limits on what the PLL can do, your maximum isn't relevant
>>> anymore.
>>
>> You're right, although afaik it should not happen with TI's SoCs. We
>> would be in trouble anyway if that were the case (e.g. someone starts
>> the camera, and suddenly we can't support 1080p anymore).
>>
>>> in other words, what's wrong with simply calling clk_round_rate() and
>>> checking if it's within a .5% deviation?
>>
>> This started with discussions how to replace the hardcoded max VP clock
>> rate (used to quickly weed out impossible rates), which in reality was
>> actually PLL max clock rate. We don't know the PLL max rate, and can't
>> query it, so this approach was taken.
>>
>>> At the very least, this should be explained in comments or the commit
>>> message.
>>
>> I agree.
>>
>> Swamil, can you do some perf tests with clk_round_rate()? If it's fast
>> (enough), it will simplify the driver.
> 
> Average execution time is around 112 us.
> Trace file including the execution time for clk_round_rate(): https://
> gist.github.com/swamiljain/2abe86982cdeba1d69223d2d525e0cb6
> It is better to reduce calls to clk_round_rate().
> 
> Need your suggestions for a better approach.

We can cache the clk_round_rate calls. Checking my monitor, there are 36
modes it offers me, but only 20 different pclk rates. Also, we could
have multiple clk_round_rate calls happening in the driver for the same
mode, and that would also be handled.

Even if clk_round_rate takes a bit long, it only happens once (I hope)
when an app does a modeset, and multiple times when a display is
connected, I wonder if 100 us is an issue?

Just using clk_round_rate() without any tricks would simplify the driver
nicely, so I think we should try to see if we can get that working.

Do you know if there's anything to improve on the clock side, ti-sci or
firmare?

 Tomi

