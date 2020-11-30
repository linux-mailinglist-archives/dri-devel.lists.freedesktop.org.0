Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A833A2C86E8
	for <lists+dri-devel@lfdr.de>; Mon, 30 Nov 2020 15:36:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDD106E4F1;
	Mon, 30 Nov 2020 14:36:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FD1E6E4F1
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Nov 2020 14:36:55 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0AUEakL0008923;
 Mon, 30 Nov 2020 08:36:46 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1606747006;
 bh=7DBeTod5EdnnhhKfHPbhvDPCVBSBhP6TblzvWLrEH8Y=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=sgLBE7fWkLsM+yIORLx+XxlgFTvFAdc6rXa/wp7HABxyQTeuvwLuzY1b32+FLUKpV
 vkIew80D7w77V1RBFY9PI1pB1BRogoDejNzJb8IsvMswLD9KBPMmRoUR90T7bUXAWq
 sdkjFdP+3hk8FV3udCfyjTRLXqaZzkLnZHkAsMSY=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0AUEak7g050146
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 30 Nov 2020 08:36:46 -0600
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 30
 Nov 2020 08:36:46 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 30 Nov 2020 08:36:46 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0AUEaiDM062125;
 Mon, 30 Nov 2020 08:36:44 -0600
Subject: Re: [PATCH v2 5/5] drm/omap: Enable COLOR_ENCODING and COLOR_RANGE
 properties for planes
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20201103080310.164453-1-tomi.valkeinen@ti.com>
 <20201103080310.164453-6-tomi.valkeinen@ti.com>
 <20201130105038.GU4141@pendragon.ideasonboard.com>
 <762454cd-56e5-bcb7-cef0-f4fa3833591f@ti.com>
 <20201130141917.GA13082@pendragon.ideasonboard.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <554852e9-46ca-38dd-4ec9-d405d341b5cb@ti.com>
Date: Mon, 30 Nov 2020 16:36:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201130141917.GA13082@pendragon.ideasonboard.com>
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
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Sekhar Nori <nsekhar@ti.com>, Jyri Sarha <jsarha@ti.com>,
 Nikhil Devshatwar <nikhil.nd@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 30/11/2020 16:19, Laurent Pinchart wrote:

>>>> +	switch (color_encoding) {
>>>> +	case DRM_COLOR_YCBCR_BT601:
>>>> +		if (color_range == DRM_COLOR_YCBCR_FULL_RANGE)
>>>> +			csc = &coefs_yuv2rgb_bt601_full;
>>>> +		else
>>>> +			csc = &coefs_yuv2rgb_bt601_lim;
>>>> +		break;
>>>> +	case DRM_COLOR_YCBCR_BT709:
>>>> +		if (color_range == DRM_COLOR_YCBCR_FULL_RANGE)
>>>> +			csc = &coefs_yuv2rgb_bt709_full;
>>>> +		else
>>>> +			csc = &coefs_yuv2rgb_bt709_lim;
>>>> +		break;
>>>> +	default:
>>>> +		DSSERR("Unsupported CSC mode %d for plane %d\n",
>>>> +		       color_encoding, plane);
>>>> +		return -EINVAL;
>>>
>>> Can this happen, given that the properties are created with only the
>>> above four combinations being allowed ?
>>
>> No, it shouldn't happen. Are you just asking, or are you suggesting that we shouldn't check if
>> color_encoding is valid here?
>>
>> I don't usually check parameters which we can expect to be correct, but with we use switch/if with
>> the parameter, we have to deal with the "else" case too.
> 
> I use a default in that case, especially if it can avoid turning the
> function from void to int.

Yes, that's true. I'll do the change.

 Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
