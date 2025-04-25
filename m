Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B490A9C994
	for <lists+dri-devel@lfdr.de>; Fri, 25 Apr 2025 14:55:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54FE810E109;
	Fri, 25 Apr 2025 12:55:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="DVbPO376";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E72910E109
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 12:55:20 +0000 (UTC)
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi
 [91.158.153.178])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0EA3E82E;
 Fri, 25 Apr 2025 14:55:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1745585716;
 bh=V0vzS2SBMmSwtDfpTnUAKP1Fy9rXUK+2CtvLBI82r4Y=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=DVbPO376F5YxoK8yNsIZgZ0pvtugPze8+PlJBPY6F1/C60SvPFGge85a9lMg/1ztK
 B8fHRQQJ1wc3xOUk0mZuvhQ3I6b/40hvxZTifRSOv/gdTupPu84Zfm5QPFGjoSENCd
 mCK1bLdJqVBlEZj8qWd9BmOf1hf+n7sHDbNTGpSo=
Message-ID: <9c8f2ab2-4492-47df-a27e-7c603436ce36@ideasonboard.com>
Date: Fri, 25 Apr 2025 15:55:14 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 16/17] drm/bridge: cdns-dsi: Tune adjusted_mode->clock
 according to dsi needs
To: Aradhya Bhatia <aradhya.bhatia@linux.dev>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, Francesco Dolcini <francesco@dolcini.it>,
 Devarsh Thakkar <devarsht@ti.com>, Jyri Sarha <jyri.sarha@iki.fi>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jayesh Choudhary <j-choudhary@ti.com>
References: <20250414-cdns-dsi-impro-v3-0-4e52551d4f07@ideasonboard.com>
 <20250414-cdns-dsi-impro-v3-16-4e52551d4f07@ideasonboard.com>
 <7de0229a-192f-4d0f-8add-1a50c58f367b@linux.dev>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <7de0229a-192f-4d0f-8add-1a50c58f367b@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 20/04/2025 21:01, Aradhya Bhatia wrote:
> Hi Tomi,
> 
> On 14/04/25 16:41, Tomi Valkeinen wrote:
>> The driver currently expects the pixel clock and the HS clock to be
>> compatible, but the DPHY PLL doesn't give very finely grained rates.
>> This often leads to the situation where the pipeline just fails, as the
>> resulting HS clock is just too off.
>>
>> We could change the driver to do a better job on adjusting the DSI
>> blanking values, hopefully getting a working pipeline even if the pclk
>> and HS clocks are not exactly compatible. But that is a bigger work.
>>
>> What we can do easily is to see in .atomic_check() what HS clock rate we
>> can get, based on the pixel clock rate, and then convert the HS clock
>> rate back to pixel clock rate and ask that rate from the crtc. If the
>> crtc has a good PLL (which is the case for TI K3 SoCs), this will fix
>> any issues wrt. the clock rates.
>>
>> If the crtc cannot provide the requested clock, well, we're no worse off
>> with this patch than what we have at the moment.
>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>> ---
>>   drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c | 37 ++++++++++++++++++++++++++
>>   1 file changed, 37 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
>> index 63031379459e..165df5d595b8 100644
>> --- a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
>> +++ b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
>> @@ -908,6 +908,28 @@ static u32 *cdns_dsi_bridge_get_input_bus_fmts(struct drm_bridge *bridge,
>>   	return input_fmts;
>>   }
>>   
>> +static long cdns_dsi_round_pclk(struct cdns_dsi *dsi, unsigned long pclk)
>> +{
>> +	struct cdns_dsi_output *output = &dsi->output;
>> +	unsigned int nlanes = output->dev->lanes;
>> +	union phy_configure_opts phy_opts = { 0 };
>> +	u32 bitspp;
>> +	int ret;
>> +
>> +	bitspp = mipi_dsi_pixel_format_to_bpp(output->dev->format);
>> +
>> +	ret = phy_mipi_dphy_get_default_config(pclk, bitspp, nlanes,
>> +					       &phy_opts.mipi_dphy);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = phy_validate(dsi->dphy, PHY_MODE_MIPI_DPHY, 0, &phy_opts);
>> +	if (ret)
>> +		return ret;
>> +
>> +	return div_u64((u64)phy_opts.mipi_dphy.hs_clk_rate * nlanes, bitspp);
>> +}
>> +
>>   static int cdns_dsi_bridge_atomic_check(struct drm_bridge *bridge,
>>   					struct drm_bridge_state *bridge_state,
>>   					struct drm_crtc_state *crtc_state,
>> @@ -919,11 +941,26 @@ static int cdns_dsi_bridge_atomic_check(struct drm_bridge *bridge,
>>   	struct drm_display_mode *adjusted_mode = &crtc_state->adjusted_mode;
>>   	struct cdns_dsi_cfg *dsi_cfg = &dsi_state->dsi_cfg;
>>   	struct videomode vm;
>> +	long pclk;
>>   
>>   	/* cdns-dsi requires negative syncs */
>>   	adjusted_mode->flags &= ~(DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC);
>>   	adjusted_mode->flags |= DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC;
>>   
>> +	/*
>> +	 * The DPHY PLL has quite a coarsely grained clock rate options. See
>> +	 * what hsclk rate we can achieve based on the pixel clock, convert it
>> +	 * back to pixel clock, set that to the adjusted_mode->clock. This is
>> +	 * all in hopes that the CRTC will be able to provide us the requested
>> +	 * clock, as otherwise the DPI and DSI clocks will be out of sync.
>> +	 */
>> +
>> +	pclk = cdns_dsi_round_pclk(dsi, adjusted_mode->clock * 1000);
>> +	if (pclk < 0)
>> +		return (int)pclk;
>> +
>> +	adjusted_mode->clock = pclk / 1000;
>> +
>>   	drm_display_mode_to_videomode(adjusted_mode, &vm);
>>   
>>   	return cdns_dsi_check_conf(dsi, &vm, dsi_cfg);
> 
> I think at this point cdns_dsi_check_conf is really only creating a
> dsi_cfg (from the video-mode) so that it can later be used, and then
> running phy_mipi_dphy_get_default_config(), and phy_validate(), both of
> which have nothing to do with the freshly made dsi_cfg.

True. And cdns_dsi_mode2cfg() can't fail anymore, so it could be just a 
void function.

> If there is no benefit in running both the latter functions again after
> cdns_dsi_round_pclk() runs them, then perhaps we can just drop the
> cdns_dsi_check_conf() altogether in favor of cdns_dsi_mode2cfg() being
> called from .atomic_check()?

cdns_dsi_round_pclk() doesn't store the phy_cfg anywhere, whereas 
cdns_dsi_check_conf() does.

I think I originally wanted to have this structure, because:

cdns_dsi_round_pclk() is given adjusted_mode->clock * 1000, and it 
returns an "optimal" pixel clock that matches the DSI clock what the DSI 
PLL can provide us.

This rate is then divided by 1000, and set to adjusted_mode->clock.

We then call cdns_dsi_check_conf(), calling 
phy_mipi_dphy_get_default_config() and phy_validate(), but this time 
it's with the "optimal" pixel clock (although truncated to kHz). So the 
calls are not identical to cdns_dsi_round_pclk().

Then, I have a local patch that adds some code to cdns_dsi_check_conf(). 
It will check if there is a difference between the requested hs-clk 
(which we got from phy_mipi_dphy_get_default_config()) and the final one 
(which we got from phy_validate()), and if so, adjusts the DSI HFP so 
that the total DSI line time would be close to the one we would have 
gotten with the requested hs-clk.

While I think that code is valid, the adjustments were always so small 
that they rounded to 0, so I did not post that patch. Nevertheless, it 
kind of points out that calling the functions again is not totally 
pointless =).

To be honest, I'm a bit reluctant to start rehashing the series. It's 
rather time consuming to test, and some errors are not immediately 
visible, if they're only seen as occasional glitches on the screen.

If the code has no issues as such, I would suggest to do further 
cleanups on top so that we'd get the upstream fixed (as it's very badly 
broken at the moment) asap.

> Furthermore, I understand updating the adjusted_mode->clock might help
> the CRTC to use a pixel clock that's more in-tune with the _actual_
> hs_clk_rate that is going to be generated. But, I am worried that it'll
> cause a delta from the intended fps from the CRTC's end because the
> timings aren't adjusted in accordance with the pixel-clock.

Yes, it does. Also, it's not "more in-tune", as in some cases the clocks 
are not at all in-tune =). The DSI PLL here is quite coarse with the rates.

> Perhaps, along with pixel-clock, we can update the dsi_htotal and
> dpi_htotal both too, to
> 
> new_dsi_htotal = (hs_clk_rate * #lanes) / (dpi_votal * fps * 8)
> new_dpi_htotal = (hs_clk_rate * #lanes) / (dpi_vtotal * fps * bitspp).
> 
> And then, the respective front-porches can too get updated accordingly.

Perhaps. But if there's a bridge after the cdns-dsi, its atomic_check 
has already been called, with the original timings. Did it already use 
those timings for creating its config?

And is it better to output with the timings that (at least try to) match 
the requested ones, but with an adjusted pclk, resulting in fps that 
slightly off, or with both adjusted timings and adjusted pclk, getting a 
better fps match?

In my experience devices usually allow variations in the pixel clock 
quite easily, but some are very strict at getting exactly the timings 
that it expects.

  Tomi

