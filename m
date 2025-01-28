Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 740E8A20B2F
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jan 2025 14:17:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E16D910E3F6;
	Tue, 28 Jan 2025 13:17:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="STBS9u+L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02FC810E3F6
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jan 2025 13:17:35 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50SDH00d1185639
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 28 Jan 2025 07:17:00 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1738070220;
 bh=98kXBdxRQblqVYlGPy67fOXlBJtaWs9p1Zfnvmpx1rs=;
 h=Date:From:Subject:To:CC:References:In-Reply-To;
 b=STBS9u+LehGIgHLMXitumTZf3pDyrg310HsNtAyvkRWNoBRtzJ2mQQXpfVsIOHpo4
 cAX/+U3ZN+9ynXhpOyRNot0tTANowcrZcYkOEctRAzvnvU86j0J9fsTsLywWsx1Y3/
 qbzZkDGYNveYFozCMmtLUCjGuFztkwNM+tXB1ffI=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 50SDH0XK057397
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 28 Jan 2025 07:17:00 -0600
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 28
 Jan 2025 07:17:00 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 28 Jan 2025 07:16:59 -0600
Received: from [172.24.227.193] (devarsht.dhcp.ti.com [172.24.227.193] (may be
 forged))
 by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50SDGsvt014946;
 Tue, 28 Jan 2025 07:16:54 -0600
Message-ID: <dea025e1-98d4-2dcf-e729-19c9d49bf3ae@ti.com>
Date: Tue, 28 Jan 2025 18:46:53 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Devarsh Thakkar <devarsht@ti.com>
Subject: Re: [PATCH 2/2] drm/tidss: Add support for AM62L display subsystem
To: Aradhya Bhatia <aradhya.bhatia@linux.dev>, "jyri.sarha@iki.fi"
 <jyri.sarha@iki.fi>, "tomi.valkeinen@ideasonboard.com"
 <tomi.valkeinen@ideasonboard.com>, "airlied@gmail.com" <airlied@gmail.com>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "simona@ffwll.ch" <simona@ffwll.ch>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "robh@kernel.org" <robh@kernel.org>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>
CC: "Bajjuri, Praneeth" <praneeth@ti.com>, "Raghavendra, Vignesh"
 <vigneshr@ti.com>, "Jain, Swamil" <s-jain1@ti.com>, "Donadkar, Rishikesh"
 <r-donadkar@ti.com>, "Choudhary, Jayesh" <j-choudhary@ti.com>, "Shenoy,
 Harikrishna" <h-shenoy@ti.com>
References: <20241231090432.3649158-1-devarsht@ti.com>
 <20241231090432.3649158-3-devarsht@ti.com>
 <eab600f6-bfc2-489c-b384-5b620164a556@linux.dev>
Content-Language: en-US
In-Reply-To: <eab600f6-bfc2-489c-b384-5b620164a556@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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

Hi Aradhya,

On 18/01/25 14:57, Aradhya Bhatia wrote:
> Hi Devarsh,
>
> Thanks for the patches.
>

Thanks for the review.

> On 31/12/24 14:34, Devarsh Thakkar wrote:
>> Enable display for AM62L DSS [1] which supports only a single display
>> pipeline using a single overlay manager, single video port and a single
>> video lite pipeline which does not support scaling.
>>
>> The output of video port is routed to SoC boundary via DPI interface and
>> the DPI signals from the video port are also routed to DSI Tx controller
>> present within the SoC.
>>
>> [1]: Section 11.7 (Display Subsystem and Peripherals)
>> Link : https://www.ti.com/lit/pdf/sprujb4
>>
>> Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
>> ---

<snip>
>> 
>> +const struct dispc_features dispc_am62l_feats = {
>> +    .max_pclk_khz = {
>> +            [DISPC_VP_DPI] = 165000,
>
> The TRM mentions that the max the VP PLL can go is 150MHz, so maybe you
> might need to update this.
>
> That said, as far as I understand, the IP itself can support 165 MHz,
> and I am wondering, what would we do if there comes out a new SoC that
> uses AM62L DSS as is, but just bumps up the PLL capacity to 165MHz.
>
> It would be odd to have a ditto feats structure with just the frequency
> updated.

TRM mentions max VP PLL frequency as 165 Mhz and not 150 Mhz. Please refer
Table 11-343. DSS Signals for MIPI DPI 2.0 or BT.656/BT.1120 section in
section 11.7.1.2.1 DSS Parallel Interface of  AM62L TRM [1].
>
>> +    },
>> +
>> +    .subrev = DISPC_AM62L,
>> +
>> +    .common = "common",
>> +    .common_regs = tidss_am65x_common_regs,
>
> Also, I don't think we should utilize this as is.
>
> The AM62L common regions is different, and is, at best, a subset of the
> AM65x/AM62x common register space.
>
> For example, registers VID_IRQ{STATUS, ENABLE}_0 have been dropped,
> along with VP_IRQ{STATUS, ENABLE}_1.
>
> - Which brings to my next concern...
>

Thanks for pointing out, I probably missed this since the use-case still
worked since VP interrupts were still enabled and those were sufficient to
drive the display
but the VID underflow interrupts and VID specific bits were probably not
enabled at-all due to above miss, so agreed
we should probably go ahead with a different reg space for AM62L due to
aforementioned differences.

>> +
>> +    .num_vps = 1,
>> +    .vp_name = { "vp1" },
>> +    .ovr_name = { "ovr1" },
>> +    .vpclk_name =  { "vp1" },
>> +    .vp_bus_type = { DISPC_VP_DPI },
>> +
>> +    .vp_feat = { .color = {
>> +                    .has_ctm = true,
>> +                    .gamma_size = 256,
>> +                    .gamma_type = TIDSS_GAMMA_8BIT,
>> +            },
>> +    },
>> +
>> +    .num_planes = 1,
>> +    .vid_name = { "vidl1" },
>> +    .vid_lite = { true },
>> +    .vid_order = { 0 },
>
> ...
>
> Usually, VID1 is the first video pipeline, while VIDL1 remains the
> second. Which is why vid1 occupies the index 0, and vidl1 occupies 1 -
> even from the hardware perspective.
>
> While AM62L has only one video (lite) pipeline - vidl1, and there is no
> vid1, the hardware still treats vidl1 at index 1.
>
> For example, the TRM has defined DISPC_VID_IRQ{STATUS, ENABLE}_1 (and
> not _0) in the common region.
>
> So, the vid_order here should be 1, not 0.
>

We will have a separate register space for AM62L which would only have
DISPC_VID_IRQ{STATUS, ENABLE}_1 mapped,
so that should handle it.Also I think vid_order semantically maps to zorder
and since there is only a single plane available on AM62L
it is not correct to assign vid_order as 1 just to align with VIDL reg bit fields.
Furthermore, vid_order set to 1 won't work too, since driver also uses
vid_order for indexing the reg space for vid. For e.g.
if we use vid_order as 1 then hw_plane would get assigned as 1 too, then
dispc_vid* functions (as seen below) would fail as
there is no base_vid region at index 1 for AM62L as it has only single video
register space i.e. for VIDL.

static                                                                                                 
 
void dispc_vid_write(struct dispc_device *dispc, u32 hw_plane, u16 reg, u32
val)                         
{                                                                                                      
 
        void __iomem *base =
dispc->base_vid[hw_plane];                                                  
                                                                                                       
 
        iowrite32(val, base +
reg);                                                                      
}                                                                                                      
 

But with hw_plane set to 0 we also need to handle bit fields for VIDL which
are still at index 5 for registers DSS_COMMON_DISPC_IRQENABLE_SET,
DSS_COMMON_DISPC_IRQENABLE_CLR and DSS_COMMON_DISPC_IRQSTATUS_(RAW) and also
DSS_OVR1_ATTRIBUTES_0 which expects 1 to be set in bits 4:1,
and existing dispc_k3* functions managing these registers were handling it via
hw_plane set to 1.  To handle this and also since AM62L is the only one K3 SoC
which only supports VIDL plane, I will be adding separate wrapper implementer
functions dispc_am62l_ovr_set_plane, dispc_am62l_set_irqenable to handle this.

Regards
Devarsh
