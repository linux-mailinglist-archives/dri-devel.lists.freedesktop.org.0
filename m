Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 743F36422B3
	for <lists+dri-devel@lfdr.de>; Mon,  5 Dec 2022 06:25:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89F7110E0B9;
	Mon,  5 Dec 2022 05:24:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0ABAE10E0B9
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Dec 2022 05:24:47 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2B55OY28129046;
 Sun, 4 Dec 2022 23:24:34 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1670217874;
 bh=2L12rrU9zuGOdW6laUEtJu1A/9LxnlcT6NCVKHOat9g=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=ZqteD1HxlFuT0Z41pudcsuJImkm2PpJ4ODLBJJCVqGiZAnYJK/4O4kRG0iJ7+goa0
 5jKZzf7W0dB7sTWIoSpoQ9OoHNWKT2YX9zGb3d6Jnv2g2+ZDQ5f0xq1+McAmP9MRAt
 iMkfyvRE9/KYHaL5qGE9fZRty2/gqf9J81Ni+yLk=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2B55OYZP013560
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Sun, 4 Dec 2022 23:24:34 -0600
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Sun, 4
 Dec 2022 23:24:34 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Sun, 4 Dec 2022 23:24:34 -0600
Received: from [172.24.217.116] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2B55OVIe031103;
 Sun, 4 Dec 2022 23:24:32 -0600
Message-ID: <ecc24073-4e0e-b9e1-b48f-a0b6d3a7ea38@ti.com>
Date: Mon, 5 Dec 2022 10:54:30 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH] drm: tidss: Fix pixel format definition
Content-Language: en-US
To: Andrew Davis <afd@ti.com>, Randolph Sapp <rs@ti.com>, <jyri.sarha@iki.fi>, 
 <tomba@kernel.org>
References: <20221202001803.1765805-1-rs@ti.com>
 <49761fcd-7cef-9c41-185a-0a6d7e2b4a5e@ti.com>
From: Aradhya Bhatia <a-bhatia1@ti.com>
In-Reply-To: <49761fcd-7cef-9c41-185a-0a6d7e2b4a5e@ti.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 02-Dec-22 23:22, Andrew Davis wrote:
> On 12/1/22 6:18 PM, Randolph Sapp wrote:
>> There was a long-standing bug from a typo that created 2 ARGB1555 and
>> ABGR1555 pixel format entries. Weston 10 has a sanity check that alerted
>> me to this issue.
>>
>> According to the Supported Pixel Data formats table we have the later
>> entries should have been for Alpha-X instead.
>>
> 
> Fixes 32a1795f57eecc
> 
> Acked-by: Andrew Davis <afd@ti.com>
> 
>> Signed-off-by: Randolph Sapp <rs@ti.com>

Reviewed-by: Aradhya Bhatia <a-bhatia1@ti.com>

>> ---
>>   drivers/gpu/drm/tidss/tidss_dispc.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c 
>> b/drivers/gpu/drm/tidss/tidss_dispc.c
>> index ad93acc9abd2..16301bdfead1 100644
>> --- a/drivers/gpu/drm/tidss/tidss_dispc.c
>> +++ b/drivers/gpu/drm/tidss/tidss_dispc.c
>> @@ -1858,8 +1858,8 @@ static const struct {
>>       { DRM_FORMAT_XBGR4444, 0x21, },
>>       { DRM_FORMAT_RGBX4444, 0x22, },
>> -    { DRM_FORMAT_ARGB1555, 0x25, },
>> -    { DRM_FORMAT_ABGR1555, 0x26, },
>> +    { DRM_FORMAT_XRGB1555, 0x25, },
>> +    { DRM_FORMAT_XBGR1555, 0x26, },
>>       { DRM_FORMAT_XRGB8888, 0x27, },
>>       { DRM_FORMAT_XBGR8888, 0x28, },
