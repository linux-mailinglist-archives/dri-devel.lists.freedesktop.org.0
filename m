Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86740A275F0
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2025 16:33:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2232A10E357;
	Tue,  4 Feb 2025 15:33:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="pzZcndCV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7751610E357
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Feb 2025 15:33:38 +0000 (UTC)
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi
 [91.158.153.178])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 23CACA98;
 Tue,  4 Feb 2025 16:32:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1738683145;
 bh=X4+mpXaZL1P+AvNuepDaKJ78T/53H89MENaLwjuUsGk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=pzZcndCVYu0XYLNdHAmZMx1N5k2gDiNkuIwgHCdGMjFRev5cw5GSGZ5aR2+fOs3XF
 sTFdIfNhHHul3/0miVvPclCjP4j9kM2YL4CCWfClv77wa3JxTlRJADj3/bYVcuESps
 CdphV3hD3rFMyBoD+AOyvH6ohpVElBOavIDFXzyQ=
Message-ID: <c6179f0b-c93f-483b-bfeb-322d800e5170@ideasonboard.com>
Date: Tue, 4 Feb 2025 17:33:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/tidss: Add support for AM62L display subsystem
To: Devarsh Thakkar <devarsht@ti.com>, "jyri.sarha@iki.fi"
 <jyri.sarha@iki.fi>, "airlied@gmail.com" <airlied@gmail.com>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "simona@ffwll.ch" <simona@ffwll.ch>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>
Cc: "Bajjuri, Praneeth" <praneeth@ti.com>,
 "Raghavendra, Vignesh" <vigneshr@ti.com>, "Jain, Swamil" <s-jain1@ti.com>,
 "Donadkar, Rishikesh" <r-donadkar@ti.com>,
 "Choudhary, Jayesh" <j-choudhary@ti.com>,
 "Shenoy, Harikrishna" <h-shenoy@ti.com>,
 Aradhya Bhatia <aradhya.bhatia@linux.dev>
References: <20241231090432.3649158-1-devarsht@ti.com>
 <20241231090432.3649158-3-devarsht@ti.com>
 <eab600f6-bfc2-489c-b384-5b620164a556@linux.dev>
 <dea025e1-98d4-2dcf-e729-19c9d49bf3ae@ti.com>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <dea025e1-98d4-2dcf-e729-19c9d49bf3ae@ti.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 28/01/2025 15:16, Devarsh Thakkar wrote:
> Hi Aradhya,
> 
> On 18/01/25 14:57, Aradhya Bhatia wrote:
>> Hi Devarsh,
>>
>> Thanks for the patches.
>>
> 
> Thanks for the review.
> 
>> On 31/12/24 14:34, Devarsh Thakkar wrote:
>>> Enable display for AM62L DSS [1] which supports only a single display
>>> pipeline using a single overlay manager, single video port and a single
>>> video lite pipeline which does not support scaling.
>>>
>>> The output of video port is routed to SoC boundary via DPI interface and
>>> the DPI signals from the video port are also routed to DSI Tx controller
>>> present within the SoC.
>>>
>>> [1]: Section 11.7 (Display Subsystem and Peripherals)
>>> Link : https://www.ti.com/lit/pdf/sprujb4
>>>
>>> Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
>>> ---
> 
> <snip>
>>>   
>>> +const struct dispc_features dispc_am62l_feats = {
>>> +    .max_pclk_khz = {
>>> +            [DISPC_VP_DPI] = 165000,
>>
>> The TRM mentions that the max the VP PLL can go is 150MHz, so maybe you
>> might need to update this.
>>
>> That said, as far as I understand, the IP itself can support 165 MHz,
>> and I am wondering, what would we do if there comes out a new SoC that
>> uses AM62L DSS as is, but just bumps up the PLL capacity to 165MHz.
>>
>> It would be odd to have a ditto feats structure with just the frequency
>> updated.
> 
> TRM mentions max VP PLL frequency as 165 Mhz and not 150 Mhz. Please refer
> Table 11-343. DSS Signals for MIPI DPI 2.0 or BT.656/BT.1120 section in
> section 11.7.1.2.1 DSS Parallel Interface of  AM62L TRM [1].
>>
>>> +    },
>>> +
>>> +    .subrev = DISPC_AM62L,
>>> +
>>> +    .common = "common",
>>> +    .common_regs = tidss_am65x_common_regs,
>>
>> Also, I don't think we should utilize this as is.
>>
>> The AM62L common regions is different, and is, at best, a subset of the
>> AM65x/AM62x common register space.
>>
>> For example, registers VID_IRQ{STATUS, ENABLE}_0 have been dropped,
>> along with VP_IRQ{STATUS, ENABLE}_1.
>>
>> - Which brings to my next concern...
>>
> 
> Thanks for pointing out, I probably missed this since the use-case still
> worked since VP interrupts were still enabled and those were sufficient to
> drive the display
> but the VID underflow interrupts and VID specific bits were probably not
> enabled at-all due to above miss, so agreed
> we should probably go ahead with a different reg space for AM62L due to
> aforementioned differences.

I think I disagree here. Afaiu, AM62L has plane at hw index 1 (VIDL1), 
but the plane at hw index 0 (VID1) is not instantiated in the hardware. 
But the registers are the same, i.e. AM62L's registers for VIDL1 match 
AM65x/AM62x registers, right?

If so, we just need to tell the driver the hw index, instead of creating 
new register offsets as done in v2.

Or am I missing something here? (I haven't looked at the HW manual yet).

  Tomi

