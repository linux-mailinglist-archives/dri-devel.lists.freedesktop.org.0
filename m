Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DC112781BE
	for <lists+dri-devel@lfdr.de>; Fri, 25 Sep 2020 09:37:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BF766EC3E;
	Fri, 25 Sep 2020 07:37:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 554C26EC3E
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Sep 2020 07:37:02 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 08P7alUQ070019;
 Fri, 25 Sep 2020 02:36:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1601019407;
 bh=IpA0+LTMIqPMeU6WOTLjckw82oWJRkVrY12ZpbpuaJo=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=In/CHAozRGBav3EgU8WhYTY0vU9l/UV7Srlj78y7Peclkf9leVB8QQfjNR7HPL6uG
 M+WEAxqmUBHjt7TJcnYRdXQ6DIxijCJz/qEWmCcOULPdH5xD1TNHU4A2w1fYx5f0VN
 UW7Ythg+ESEpbcIhqktQ8xceWcDtostTlus+HNCQ=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 08P7alTe110268
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 25 Sep 2020 02:36:47 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 25
 Sep 2020 02:36:46 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 25 Sep 2020 02:36:46 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08P7aigL112717;
 Fri, 25 Sep 2020 02:36:45 -0500
Subject: Re: [PATCH] drm: bridge: cdns-mhdp8546: fix compile warning
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20200923083057.113367-1-tomi.valkeinen@ti.com>
 <20200924114810.GB3968@pendragon.ideasonboard.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <01359a54-964f-c748-442e-eeab30f08e56@ti.com>
Date: Fri, 25 Sep 2020 10:36:44 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200924114810.GB3968@pendragon.ideasonboard.com>
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
Cc: Dave Airlie <airlied@linux.ie>, Stephen Rothwell <sfr@canb.auug.org.au>,
 Yuti Amonkar <yamonkar@cadence.com>, dri-devel@lists.freedesktop.org,
 Swapnil Jakhade <sjakhade@cadence.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 24/09/2020 14:48, Laurent Pinchart wrote:
> Hi Tomi,
> 
> Thank you for the patch.
> 
> On Wed, Sep 23, 2020 at 11:30:57AM +0300, Tomi Valkeinen wrote:
>> On x64 we get:
>>
>> drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c:751:10: warning: conversion from 'long unsigned int' to 'unsigned int' changes value from '18446744073709551613' to '4294967293' [-Woverflow]
>>
>> The registers are 32 bit, so fix by casting to u32.
> 
> I wonder if we need a BIT32 macro... This is a common issue, it would be
> nice to handle it in the macros that define register fields.

That's probably a good idea. I think

#define BIT32(nr) (1u << (nr))

should work correct on all archs. Although I'm not quite sure if nr should be cast to u32, but in my
tests a u64 nr doesn't cause type promotion to u64.

Anyway, I'd like to merge this fix as it is to get rid of the warning for the merge window.

 Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
