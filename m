Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B91A62636D
	for <lists+dri-devel@lfdr.de>; Fri, 11 Nov 2022 22:14:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D658010E8A3;
	Fri, 11 Nov 2022 21:14:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 322 seconds by postgrey-1.36 at gabe;
 Fri, 11 Nov 2022 21:14:14 UTC
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6503610E8A3
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Nov 2022 21:14:14 +0000 (UTC)
Received: from [192.168.1.139] ([37.4.248.83]) by mrelayeu.kundenserver.de
 (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MXXZf-1oU2ZK1IHX-00Z1to; Fri, 11 Nov 2022 22:08:41 +0100
Message-ID: <737e7e23-1bc5-eaf3-2d15-5498fc5b0415@i2se.com>
Date: Fri, 11 Nov 2022 22:08:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 1/2] drm/vc4: hdmi: Enforce the minimum rate at
 runtime_resume
Content-Language: en-US
To: Maxime Ripard <maxime@cerno.tech>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Emma Anholt <emma@anholt.net>
References: <20220929-rpi-pi3-unplugged-fixes-v1-0-cd22e962296c@cerno.tech>
 <20220929-rpi-pi3-unplugged-fixes-v1-1-cd22e962296c@cerno.tech>
From: Stefan Wahren <stefan.wahren@i2se.com>
In-Reply-To: <20220929-rpi-pi3-unplugged-fixes-v1-1-cd22e962296c@cerno.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:p1P9ebm+F+zvfBkVXdlQhDM4wdPDfMtQZFdKRBA4EtF/oQ2vqFl
 67GVvwHEHSTyJVq9hAnxdu1TbIgpEFbARDD1Xr6giCmH3SeC1WphljI/YrgImgT50QSGlVy
 xI4b1fdJaqEHwbweyC837c58JBHpqo4CaRlRo90//fLEGmi5QX7N4cA86jJs6j1yqKbJg51
 +ie/aUV76gGV/yb5mfdxQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Qty8BlEvRgk=:FUgm3urfx8jg+0HcT9nLs+
 6/ClRPsjN7FwZrj9XgjEEOBmVolk38NYPAZQyAsZ30r3F+S81jnbcdNOIbzZwaMz5UxsJPMm/
 SZfI5UjoskX7uzMi+hoLc1xRKSymX/5jKAFoh0X5iB55DqAQ53c//3RVQIrWN8x9gBhBqwILY
 CibJZLcN4/JkhoGuL/80MBbDTtjqGGbHt1xh17FHcEaFnfhIdXhrEaFar94f4i062i3bYLaFM
 IFa1+wP++0vG4JVdDsx5EfWDVDt0u/aQ7Cz0rkgIsG3Go/ZKgZj79NrIwCFuaUntHbTVdVn1r
 YUO8ZJs3gONYzpzZt0PWC6CmiYpCIAr2JgJJHe1c6gKWnUB1O7igM/Ryq56wTwMlaU4W4bKWs
 0CS01hLcUFwS8PyONXWFtKuXgjoIWbqyt1/gomvLSBtUHscISJFz7JUSJ354iLhUZgSpZFWzc
 yIUollYnuuvPattD2QhoxP3peG48gwRhDyOeqnk2SAoO4+eehM0K9rH7/2iBNK1u3xuJTGvBx
 fx4o9/1/RwvpYHXJWojX90lYQ8bQ1HenUbbcrHwB3Pr10U/U8AnS6+wPcA6/8zQn+QqGEVawx
 CRDDrxvmjN6k0wPzKPFKKuYSgpz0M8FA3VcAh8NrpPBXTkpISPBuBt5YLor0LVxzKYNBNt2/L
 //5+Si0mOy+4ON1+1lPmIlnseay8DRlX7kq7PMG9XSqEcc8gSgo77ImbYlJzvA3ftqngVYiUc
 5LbzRSiczIOcydp3ZrB3SlHCjabFLoxruZbxsLbrpygeKB/1cFGQ901oAwJUXPZC/Gsgb8pJ8
 aZdChkgww3i/1e4fmhiRRTQQKMK+UJ9q4PuVRGULCrWAtbedAVGJz26lFpJ09fi4Ri/F2GSwy
 /hYBdPOOXcHUWtZO1VzuPgeF+Z/GWRngG1QcixZMA/b/ykp0kqOqX3lHpZ7BhHFQ/Jld6UM+U
 xA1f5h9eR+ptBWBy3gcgY+42Rl/L0epOoJA2c4zPU1ylQqdchpi2Nj8eRi01EZyBGmqWCUFD1
 9S5NZtne8dbOChml9Q2L72WVtxnbdito/NgdqPq7aaiEWG9Oc8jBv0id/I0CqqCCWyzKy6riH
 1Sbs8Q5AeS4huIy1BEvERMJ+TrPVAYwCFBH65N2VuITiL6NiuOdYz+kLAZ+Qn50YvFSrZDXro
 YO4t5K/Ob9wUDW624ideEjUb5w4DVZsj4AW7gZEYbAog/6b8cgppIEOQ7OhiSCX3WVPuFpGKj
 XpLp6yJkyHDrIC8g8jjV1f76+tNNlHc/flqAjm7iTSkbEV+kN7Ar1Wag4c81ZRYlmQLGhQABd
 Nr6EbihHuIaM3ZDKsAKikTKoDkk+Xw==
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
Cc: Marc Kleine-Budde <mkl@pengutronix.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime,

Am 29.09.22 um 11:21 schrieb Maxime Ripard:
> This is a revert of commit fd5894fa2413 ("drm/vc4: hdmi: Remove clock
> rate initialization"), with the code slightly moved around.
>
> It turns out that we can't downright remove that code from the driver,
> since the Pi0-3 and Pi4 are in different cases, and it only works for
> the Pi4.
>
> Indeed, the commit mentioned above was relying on the RaspberryPi
> firmware clocks driver to initialize the rate if it wasn't done by the
> firmware. However, the Pi0-3 are using the clk-bcm2835 clock driver that
> wasn't doing this initialization. We therefore end up with the clock not
> being assigned a rate, and the CPU stalling when trying to access a
> register.
>
> We can't move that initialization in the clk-bcm2835 driver, since the
> HSM clock we depend on is actually part of the HDMI power domain, so any
> rate setup is only valid when the power domain is enabled. Thus, we
> reinstated the minimum rate setup at runtime_suspend, which should
> address both issues.
>
> Link: https://lore.kernel.org/dri-devel/20220922145448.w3xfywkn5ecak2et@pengutronix.de/
> Fixes: fd5894fa2413 ("drm/vc4: hdmi: Remove clock rate initialization")
> Reported-by: Marc Kleine-Budde <mkl@pengutronix.de>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>   drivers/gpu/drm/vc4/vc4_hdmi.c | 9 +++++++++
>   1 file changed, 9 insertions(+)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
> index 199bc398817f..2e28fe16ed5e 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -2891,6 +2891,15 @@ static int vc4_hdmi_runtime_resume(struct device *dev)
>   	u32 __maybe_unused value;
>   	int ret;
>   
> +	/*
> +	 * The HSM clock is in the HDMI power domain, so we need to set
> +	 * its frequency while the power domain is active so that it
> +	 * keeps its rate.
> +	 */
> +	ret = clk_set_min_rate(vc4_hdmi->hsm_clock, HSM_MIN_CLOCK_FREQ);
> +	if (ret)
> +		return ret;
> +

unfortunately this breaks X on Raspberry Pi 4 in Linux 6.0.5 
(multi_v7_defconfig + LPAE). Today i saw this report [1] and bisected 
the issue down to this patch. Shame on me that i only tested this patch 
with Rpi 3B+ :-(

Best regards

[1] - https://bugzilla.suse.com/show_bug.cgi?id=1205259

>   	ret = clk_prepare_enable(vc4_hdmi->hsm_clock);
>   	if (ret)
>   		return ret;
>
