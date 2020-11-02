Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 202282A2524
	for <lists+dri-devel@lfdr.de>; Mon,  2 Nov 2020 08:25:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FD066E10D;
	Mon,  2 Nov 2020 07:25:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FC946E10D
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Nov 2020 07:25:24 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0A27PLg5073882;
 Mon, 2 Nov 2020 01:25:21 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1604301921;
 bh=T49Ll0TNMW2tVaT6eBJIbRqBWQ+Mz6fbnURVgElvpZg=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=ETOBV4U/+PBhoDueLMIWcES/Z3ZFlhKgpCiSJmISm2d22QWgVPXBDQyU1/BhrgK2r
 qGX39Rz0iKQW0xYDog+I57vZTVaMwM2iPQ5Khf99lv7PaFlarWq8vmlTboYtSkTO/4
 o5sXIOcA05LTxlLn4EKSIgt9zCY/h8hBUNQFpq+4=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0A27PLuw065968
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 2 Nov 2020 01:25:21 -0600
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 2 Nov
 2020 01:25:21 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 2 Nov 2020 01:25:21 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0A27PJur076314;
 Mon, 2 Nov 2020 01:25:20 -0600
Subject: Re: [PATCH 5/5] drm/bridge: mhdp8564: Support format negotiation
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Nikhil Devshatwar
 <nikhil.nd@ti.com>
References: <20201016103917.26838-1-nikhil.nd@ti.com>
 <20201016103917.26838-6-nikhil.nd@ti.com>
 <20201029223955.GG15024@pendragon.ideasonboard.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <46b3ac3e-b6f5-bc2c-de29-9bf227959f46@ti.com>
Date: Mon, 2 Nov 2020 09:25:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201029223955.GG15024@pendragon.ideasonboard.com>
Content-Language: en-US
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
Cc: Sekhar Nori <nsekhar@ti.com>, dri-devel@lists.freedesktop.org,
 Swapnil Jakhade <sjakhade@cadence.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 30/10/2020 00:39, Laurent Pinchart wrote:
> Hi Nikhil,
> 
> Thank you for the patch.
> 
> On Fri, Oct 16, 2020 at 04:09:17PM +0530, Nikhil Devshatwar wrote:
>> With new connector model, mhdp bridge will not create the connector and
>> SoC driver will rely on format negotiation to setup the encoder format.
>>
>> Support format negotiations hooks in the drm_bridge_funcs.
>> Support a single format for input.
>>
>> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
>> ---
>>  .../drm/bridge/cadence/cdns-mhdp8546-core.c   | 29 +++++++++++++++++++
>>  1 file changed, 29 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
>> index d0c65610ebb5..230f6e28f82f 100644
>> --- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
>> +++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
>> @@ -2078,6 +2078,34 @@ cdns_mhdp_bridge_atomic_reset(struct drm_bridge *bridge)
>>  	return &cdns_mhdp_state->base;
>>  }
>>  
>> +static u32 *cdns_mhdp_get_input_bus_fmts(struct drm_bridge *bridge,
>> +				      struct drm_bridge_state *bridge_state,
>> +				      struct drm_crtc_state *crtc_state,
>> +				      struct drm_connector_state *conn_state,
>> +				      u32 output_fmt,
>> +				      unsigned int *num_input_fmts)
>> +{
>> +	u32 *input_fmts;
>> +	u32 default_bus_format = MEDIA_BUS_FMT_RGB121212_1X36;
> 
> Display port supports quite a few different formats. See my reply to
> 4/5, except it's worse in the DP case :-) Especially given that multiple
> displays need to be taken into account. I'm afraid we need to decide how
> to map media bus formats to different DP use cases, possibly adding new
> bus formats as part of this exercise, and then revisit this patch.

I agree with the points you make here and for the tfp410 patch, but the point of these patches are
just to keep drivers working with the new connector model.

With the old model both tfp410 and mhdp create their own connector, and set the input bus format to
connector's display_info. With the new model, that doesn't happen and there's no bus format, and so
the display controller fails.

I see these more as fixes than implementing new features.

Nikhil, I think the output_fmt at the moment should always be FMT_FIXED. Maybe we can just check for
that.

 Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
