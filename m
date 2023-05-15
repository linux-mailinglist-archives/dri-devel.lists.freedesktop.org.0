Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE12070320C
	for <lists+dri-devel@lfdr.de>; Mon, 15 May 2023 17:59:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA4E410E236;
	Mon, 15 May 2023 15:59:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D71710E22C
 for <dri-devel@lists.freedesktop.org>; Mon, 15 May 2023 15:59:52 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 34FFxS6d003709;
 Mon, 15 May 2023 10:59:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1684166368;
 bh=qjABwUr1hXvkw414y+Eg3oGhQFuBwCDysLn+iQJNQ5s=;
 h=Date:From:Subject:To:CC:References:In-Reply-To;
 b=o65VZDhA6IbyPjFVJi8Xai37r2Vo709zJ9oODwsbk4REhO4K1/0t6EyiytEDepidH
 TM5n0XV4LEscwdWoRiRLtysGnKHwxBK8QayiX45qVf5WVpm2NbUtt+2hTDN9W0fp2I
 BcLLRzCXCpz3agYsrt27WrE9RBsbvp/JJXj9qqMo=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 34FFxSWv030704
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 15 May 2023 10:59:28 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 15
 May 2023 10:59:27 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 15 May 2023 10:59:27 -0500
Received: from [10.249.133.231] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 34FFxLdo091684;
 Mon, 15 May 2023 10:59:22 -0500
Message-ID: <d2777edc-151d-7f06-30c4-4634fdb6a63d@ti.com>
Date: Mon, 15 May 2023 21:29:20 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Aradhya Bhatia <a-bhatia1@ti.com>
Subject: Re: [PATCH v6 3/8] drm/bridge: mhdp8546: Add minimal format
 negotiation
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Jyri Sarha
 <jyri.sarha@iki.fi>, David Airlie <airlied@gmail.com>, Daniel Vetter
 <daniel@ffwll.ch>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Rahul T R
 <r-ravikumar@ti.com>, Swapnil Jakhade <sjakhade@cadence.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Francesco Dolcini <francesco@dolcini.it>
References: <20230509093036.3303-1-a-bhatia1@ti.com>
 <20230509093036.3303-4-a-bhatia1@ti.com>
 <db9b4117-b030-49a7-3732-2fc39d089ee2@ideasonboard.com>
Content-Language: en-US
In-Reply-To: <db9b4117-b030-49a7-3732-2fc39d089ee2@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Nishanth Menon <nm@ti.com>, Jayesh Choudhary <j-choudhary@ti.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Devarsh Thakkar <devarsht@ti.com>,
 Linux Kernel List <linux-kernel@vger.kernel.org>,
 DRI Development List <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tomi,

On 12-May-23 14:45, Tomi Valkeinen wrote:
> On 09/05/2023 12:30, Aradhya Bhatia wrote:
>> From: Nikhil Devshatwar <nikhil.nd@ti.com>
>>
>> With new connector model, mhdp bridge will not create the connector and
>> SoC driver will rely on format negotiation to setup the encoder format.
>>
>> Support minimal format negotiations hooks in the drm_bridge_funcs.
>> Complete format negotiation can be added based on EDID data.
>> This patch adds the minimal required support to avoid failure
>> after moving to new connector model.
>>
>> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
>> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> 
> You need to add your SoB to this and the other patches.

Okay!

> 
>> ---
>>
>> Notes:
>>
>>      changes from v1:
>>      * cosmetic fixes, commit message update.
>>
>>      changes from v5:
>>      * dropped the default_bus_format variable and directly assigned
>>        MEDIA_BUS_FMT_RGB121212_1X36 to input_fmts.
>>
>>   .../drm/bridge/cadence/cdns-mhdp8546-core.c   | 25 +++++++++++++++++++
>>   1 file changed, 25 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
>> b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
>> index f6822dfa3805..623e4235c94f 100644
>> --- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
>> +++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
>> @@ -2146,6 +2146,30 @@ cdns_mhdp_bridge_atomic_reset(struct drm_bridge
>> *bridge)
>>       return &cdns_mhdp_state->base;
>>   }
>>   +static u32 *cdns_mhdp_get_input_bus_fmts(struct drm_bridge *bridge,
>> +                     struct drm_bridge_state *bridge_state,
>> +                     struct drm_crtc_state *crtc_state,
>> +                     struct drm_connector_state *conn_state,
>> +                     u32 output_fmt,
>> +                     unsigned int *num_input_fmts)
>> +{
>> +    u32 *input_fmts;
>> +
>> +    *num_input_fmts = 0;
>> +
>> +    if (output_fmt != MEDIA_BUS_FMT_FIXED)
>> +        return NULL;
> 
> The tfp410 and sii902x drivers don't have the above check. Why does mhdp
> need it? Or the other way, why don't tfp410 and sii902x need it?

I had removed this condition in order to follow status quo, from the
ITE-66121 HDMI bridge driver.

The idea would have been to drop this for MHDP as well, but I guess I
overlooked this one.

However...

> I guess at the moment we always do get MEDIA_BUS_FMT_FIXED as the out
> fmt (in all three bridge drivers), don't we?

... I tested again to ensure that the above is indeed the case. And
ended up catching some odd behavior.

It turns out that for all the HDMI bridges (TFP410, SII902X, ITE-66121),
the format negotiation doesn't stop at output_fmt = MEDIA_BUS_FMT_FIXED.
The {bridge}_get_input_format API gets called again with the output_fmt
= MEDIA_BUS_FMT_RGB24_1X24.

This doesn't happen with the MHDP driver. Format negotiation with MHDP
bridge stops after one round, at output_fmt = MEDIA_BUS_FMT_FIXED.


Regards
Aradhya
