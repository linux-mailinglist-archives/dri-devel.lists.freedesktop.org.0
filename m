Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F4152786A6
	for <lists+dri-devel@lfdr.de>; Fri, 25 Sep 2020 14:06:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F2676ECAC;
	Fri, 25 Sep 2020 12:06:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30E8C6ECAC
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Sep 2020 12:06:12 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 08PC5tmt093269;
 Fri, 25 Sep 2020 07:05:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1601035556;
 bh=i6eYY8OBgdmdDZktif8ptsrKzV9No+HQPVFfVU62NxI=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=EfV9IW7beqQFnzDQH2UUCGhO3RWJsk/rDkAxtYkb1t9n6Y27+TZUheso3HJXOLmcs
 YbxA0fhRM0VvioR8qa6m+pwhaG9HZiZkTkMC1xfUnYebNzSALfHOIgS0H7+ehKe0pT
 sBp9bKLfyckzIcgzqAmKibKcyDDOsowrm2QYx0Jo=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 08PC5tDb114461
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 25 Sep 2020 07:05:55 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 25
 Sep 2020 07:05:55 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 25 Sep 2020 07:05:55 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08PC5rCN070058;
 Fri, 25 Sep 2020 07:05:54 -0500
Subject: Re: [PATCH] drm: bridge: cdns-mhdp8546: fix compile warning
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20200923083057.113367-1-tomi.valkeinen@ti.com>
 <20200924114810.GB3968@pendragon.ideasonboard.com>
 <01359a54-964f-c748-442e-eeab30f08e56@ti.com>
 <20200925120018.GC3933@pendragon.ideasonboard.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <0abebdad-45fb-9862-b031-e1c9107ba820@ti.com>
Date: Fri, 25 Sep 2020 15:05:52 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200925120018.GC3933@pendragon.ideasonboard.com>
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

On 25/09/2020 15:00, Laurent Pinchart wrote:
> On Fri, Sep 25, 2020 at 10:36:44AM +0300, Tomi Valkeinen wrote:
>> On 24/09/2020 14:48, Laurent Pinchart wrote:
>>> Hi Tomi,
>>>
>>> Thank you for the patch.
>>>
>>> On Wed, Sep 23, 2020 at 11:30:57AM +0300, Tomi Valkeinen wrote:
>>>> On x64 we get:
>>>>
>>>> drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c:751:10: warning: conversion from 'long unsigned int' to 'unsigned int' changes value from '18446744073709551613' to '4294967293' [-Woverflow]
>>>>
>>>> The registers are 32 bit, so fix by casting to u32.
>>>
>>> I wonder if we need a BIT32 macro... This is a common issue, it would be
>>> nice to handle it in the macros that define register fields.
>>
>> That's probably a good idea. I think
>>
>> #define BIT32(nr) (1u << (nr))
>>
>> should work correct on all archs. Although I'm not quite sure if nr should be cast to u32, but in my
>> tests a u64 nr doesn't cause type promotion to u64.
> 
> I don't think we need to support nr values larger than 2^32-1 ;-)

That's true, but we might have:

u64 nr = 1;
BIT32(nr)

Afaics, we don't need to cast nr to u32, but maybe that's still the safe thing to do.

>> Anyway, I'd like to merge this fix as it is to get rid of the warning for the merge window.
> 
> Sounds good to me.

Was that a reviewed-by? =)

 Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
