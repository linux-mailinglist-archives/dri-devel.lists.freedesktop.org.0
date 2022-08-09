Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FA5558D373
	for <lists+dri-devel@lfdr.de>; Tue,  9 Aug 2022 07:59:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF2AEC6693;
	Tue,  9 Aug 2022 05:59:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CB53C6679
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Aug 2022 05:59:14 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2795wmT2064811;
 Tue, 9 Aug 2022 00:58:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1660024729;
 bh=LUvo/OXGaY+SlJRBebaT+WlLA9ZtximoQEN9c9PwbGE=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=rjCJODQXh1A0uAlqW+uoYJUJ7W2hlUcFdng4Uho9UFe6o2pYJXaRyx/STZ9Yi3myq
 9hS9XC8ER6DhI3CFThKlURDAseqOtWUsSi7UH1dBAebl6ZBZojjNGw/s8fmtwKHmyj
 RjquQMadPzpOv913jv8LL8K+0nneE51Vji2MTtr8=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2795wmms018047
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 9 Aug 2022 00:58:48 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 9
 Aug 2022 00:58:48 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 9 Aug 2022 00:58:48 -0500
Received: from [172.24.157.172] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2795whnR039818;
 Tue, 9 Aug 2022 00:58:44 -0500
Message-ID: <1f9de2d8-7507-bdc2-93c1-470c8e060586@ti.com>
Date: Tue, 9 Aug 2022 11:28:43 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.0
Subject: Re: [PATCH 4/8] drm/tidss: Add support for Dual Link LVDS Bus Format
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
References: <20220719080845.22122-1-a-bhatia1@ti.com>
 <20220719080845.22122-5-a-bhatia1@ti.com>
 <f2909af1-be23-009b-ba71-34206f099473@ideasonboard.com>
 <ec8dce9b-51d6-a566-67bb-b76f6f3458d7@ideasonboard.com>
Content-Language: en-US
From: Aradhya Bhatia <a-bhatia1@ti.com>
In-Reply-To: <ec8dce9b-51d6-a566-67bb-b76f6f3458d7@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: Nishanth Menon <nm@ti.com>, Devicetree List <devicetree@vger.kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Vignesh Raghavendra <vigneshr@ti.com>, Devarsh Thakkar <devarsht@ti.com>,
 David Airlie <airlied@linux.ie>,
 Linux Kernel List <linux-kernel@vger.kernel.org>,
 DRI Development List <dri-devel@lists.freedesktop.org>,
 Darren Etheridge <detheridge@ti.com>, Rob Herring <robh+dt@kernel.org>,
 Jyri Sarha <jyri.sarha@iki.fi>, Rahul T R <r-ravikumar@ti.com>,
 Krunal Bhargav <k-bhargav@ti.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tomi,

On 28-Jul-22 17:15, Tomi Valkeinen wrote:
> On 28/07/2022 14:03, Tomi Valkeinen wrote:
>> On 19/07/2022 11:08, Aradhya Bhatia wrote:
>>> The 2 OLDI TXes in the AM625 SoC can be synced together to output a 2K
>>> resolution video.
>>>
>>> Add support in the driver for the discovery of such a dual mode
>>> connection on the OLDI video port, using the values of "ti,oldi-mode"
>>> property.
>>>
>>> Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
>>> ---
>>>   drivers/gpu/drm/tidss/tidss_dispc.c | 39 +++++++++++++++++++++--------
>>>   1 file changed, 28 insertions(+), 11 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c 
>>> b/drivers/gpu/drm/tidss/tidss_dispc.c
>>> index add725fa682b..fb1fdecfc83a 100644
>>> --- a/drivers/gpu/drm/tidss/tidss_dispc.c
>>> +++ b/drivers/gpu/drm/tidss/tidss_dispc.c
>>> @@ -853,25 +853,36 @@ void dispc_set_irqenable(struct dispc_device 
>>> *dispc, dispc_irq_t mask)
>>>       }
>>>   }
>>> -enum dispc_oldi_mode_reg_val { SPWG_18 = 0, JEIDA_24 = 1, SPWG_24 = 
>>> 2 };
>>> +enum dispc_oldi_mode_reg_val {
>>> +    SPWG_18        = 0,
>>> +    JEIDA_24    = 1,
>>> +    SPWG_24        = 2,
>>> +    DL_SPWG_18    = 4,
>>> +    DL_JEIDA_24    = 5,
>>> +    DL_SPWG_24    = 6,
>>> +};
>>>   struct dispc_bus_format {
>>>       u32 bus_fmt;
>>>       u32 data_width;
>>>       bool is_oldi_fmt;
>>> +    bool is_dual_link;
>>>       enum dispc_oldi_mode_reg_val oldi_mode_reg_val;
>>>   };
>>>   static const struct dispc_bus_format dispc_bus_formats[] = {
>>> -    { MEDIA_BUS_FMT_RGB444_1X12,        12, false, 0 },
>>> -    { MEDIA_BUS_FMT_RGB565_1X16,        16, false, 0 },
>>> -    { MEDIA_BUS_FMT_RGB666_1X18,        18, false, 0 },
>>> -    { MEDIA_BUS_FMT_RGB888_1X24,        24, false, 0 },
>>> -    { MEDIA_BUS_FMT_RGB101010_1X30,        30, false, 0 },
>>> -    { MEDIA_BUS_FMT_RGB121212_1X36,        36, false, 0 },
>>> -    { MEDIA_BUS_FMT_RGB666_1X7X3_SPWG,    18, true, SPWG_18 },
>>> -    { MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,    24, true, SPWG_24 },
>>> -    { MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA,    24, true, JEIDA_24 },
>>> +    { MEDIA_BUS_FMT_RGB444_1X12,        12, false, false, 0 },
>>> +    { MEDIA_BUS_FMT_RGB565_1X16,        16, false, false, 0 },
>>> +    { MEDIA_BUS_FMT_RGB666_1X18,        18, false, false, 0 },
>>> +    { MEDIA_BUS_FMT_RGB888_1X24,        24, false, false, 0 },
>>> +    { MEDIA_BUS_FMT_RGB101010_1X30,        30, false, false, 0 },
>>> +    { MEDIA_BUS_FMT_RGB121212_1X36,        36, false, false, 0 },
>>> +    { MEDIA_BUS_FMT_RGB666_1X7X3_SPWG,    18, true, false, SPWG_18 },
>>> +    { MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,    24, true, false, SPWG_24 },
>>> +    { MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA,    24, true, false, JEIDA_24 },
>>> +    { MEDIA_BUS_FMT_RGB666_1X7X3_SPWG,    18, true, true, DL_SPWG_18 },
>>> +    { MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,    24, true, true, DL_SPWG_24 },
>>> +    { MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA,    24, true, true, DL_JEIDA_24 },
>>>   };
>>
>> So the dual link sends two pixels per clock, right? Are there panel or 
>> bridge drivers that support this? My initial thought was that it 
>> should be a new bus format.
> 
> Looks like we have drm bridges supporting dual link, and they use the 
> "normal" bus format. Did you have a look at them? They require two port 
> nodes for dual link, and use the existence of the second one to decide 
> if dual link is used or not.
The above edits were not for adding a new bus format for dual link
connections. I added them in order to be able to write the correct OLDI
config values in the register.

> 
> There are also lvds helpers in drm_of.c. I didn't look closely, but it 
> looked to me that the helpers can tell you if the ports are connected to 
> a dual link bridge. If not, you could fall back to cloning. This way no 
> extra properties are needed. But you will need to add a port node, which 
> I think you need to add anyway for cloning.
I have now seen drm_of.c and examples (renesas' rcar lvds) that use the
apis that drm_of.c is offering. In those cases, the OLDI TXes are being
modeled as separate devices, which is not the case with the tidss' OLDI
TXes. Since the only few OLDI registers are in the DSS address space,
they were just being configured through the tidss driver.

Even in DT, the dss port (for OLDI) connects to the panel port's
endpoint directly. Even in cases of dual link or cloning, it's only a
singular remote-to-endpoint connection between the (OLDI) VP and the
panel port. Hence the requirement of the properties in the earlier
patches of the series.

The use of lvds helper functions does not seem feasible in this case,
because even they read DT properties to determine the dual link
connection and those properties need to be a part of a lvds bridge
device.

I have also been considering the idea of implementing a new device
driver for the OLDI TXes, not unlike the renesas' one. That way the
driver could have the properties and the lvds helper functions at their
disposal. I am just slightly unsure if that would allow space for any
conflicts because of the shared register space.

Do let me know what you think!

Regards
Aradhya
