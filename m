Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CC6CB418EF
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 10:43:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82A6810E53D;
	Wed,  3 Sep 2025 08:43:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=embeddedor.com header.i=@embeddedor.com header.b="XDiO88T6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 427 seconds by postgrey-1.36 at gabe;
 Wed, 03 Sep 2025 08:43:38 UTC
Received: from omta38.uswest2.a.cloudfilter.net
 (omta38.uswest2.a.cloudfilter.net [35.89.44.37])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B6C810E53D
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Sep 2025 08:43:38 +0000 (UTC)
Received: from eig-obgw-5007b.ext.cloudfilter.net ([10.0.29.167])
 by cmsmtp with ESMTPS
 id thhhuoRAheNqitiykuMfa7; Wed, 03 Sep 2025 08:36:30 +0000
Received: from gator4166.hostgator.com ([108.167.133.22]) by cmsmtp with ESMTPS
 id tiyjuBDgXNxiItiyjuFNpg; Wed, 03 Sep 2025 08:36:29 +0000
X-Authority-Analysis: v=2.4 cv=Qatmvtbv c=1 sm=1 tr=0 ts=68b7fe0d
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=XW3vq5T86JFyMsJaYQInbg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=7T7KSl7uo7wA:10 a=VwQbUJbxAAAA:8
 a=uY_jprAYB3ThRRmUuAoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=xYX6OU9JNrHFPr8prv8u:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xPOvRU10uK9ZVSCWCMReoRW7p5xBpgAQIHli3Z6J08M=; b=XDiO88T6B7hHpfDmMmWr7MKhOE
 /MJnEp8lWWDtzo9SXZ3rnysLZEAvqJkBXJZtB1hwpQ482HK9zxz7EqrtC0nmW9gv62piAsCrMDHHI
 dcLIlcnCfDC0pkD2S0tLKLaD3/hht+1pFoNbNnFCnOLPoy09zm3kvDBdMRZji4saGMLCthitVTTyf
 +JJtmLWQOzMixD8flw6YCp50vzNcKssfm7KfY1iBqTEM2Hy/NyQhk47km2cy5H7i8iNN19Zic3ylR
 zyOSEFfkdIFLEbloKZDFcaGk7Loz/f7N15PkOFByYOup990A/WKRCADmU0cOErAAnzLL1FHc1x7MQ
 jZ+uJtKg==;
Received: from d4b26982.static.ziggozakelijk.nl ([212.178.105.130]:50240
 helo=[172.17.143.44])
 by gator4166.hostgator.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.98.1)
 (envelope-from <gustavo@embeddedor.com>) id 1utiyi-000000047SS-2QJT;
 Wed, 03 Sep 2025 03:36:28 -0500
Message-ID: <3f7338c4-1737-4cf7-a789-252abe30bdc6@embeddedor.com>
Date: Wed, 3 Sep 2025 10:36:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH][next] drm/amdgpu/amdkfd: Avoid a couple hundred
 -Wflex-array-member-not-at-end warnings
To: "Kuehling, Felix" <felix.kuehling@amd.com>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
References: <aLF5vQv9P_vp0R6_@kspp>
 <7a25b5ae-b995-431b-bd46-6d2d58d18e36@amd.com>
Content-Language: en-US
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <7a25b5ae-b995-431b-bd46-6d2d58d18e36@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 212.178.105.130
X-Source-L: No
X-Exim-ID: 1utiyi-000000047SS-2QJT
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: d4b26982.static.ziggozakelijk.nl ([172.17.143.44])
 [212.178.105.130]:50240
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 3
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfLQwLptsyqHspP95JRDjrkblV4yDPnleNuC8Pa33+SmmTyQh6jsw6r+sVruBwNuq+HMAC9PZf+3wRiwVLmJ9//d0KyE2g3QuqQUN0oGZgP3TswEvMRob
 jv0D/ADGpE5aRIaLWgVaiyWR3NRBW6V9wQ+jQAV0M6r1oMQ+z+jIQO1oOeyqjdV1WqPt97Ip5fQLvS36MsRVKzLoYXZDMbqGZIrtge2ATsLzPpOmof3vRkHF
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



On 9/2/25 17:11, Kuehling, Felix wrote:
> On 2025-08-29 5:58 a.m., Gustavo A. R. Silva wrote:
>> -Wflex-array-member-not-at-end was introduced in GCC-14, and we are
>> getting ready to enable it, globally.
>>
>> Move the conflicting declarations to the end of the corresponding
>> structures. Notice that `struct dev_pagemap` is a flexible structure,
>> this is a structure that contains a flexible-array member.
>>
>> Fix 283 of the following type of warnings:
>>      283 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h:111:28: warning: structure containing a flexible array member is not at the end of another structure [- 
>> Wflex-array-member-not-at-end]
>>
>> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> 
> Thank you. I'll apply this to amd-staging-drm-next. I'll also add a note to the commit description that struct dev_pagemap always has space for at least one 
> range, and that amdgpu only uses a single range. Therefore no changes are needed in the way struct amdgpu_device is allocated.

Yep, that's correct. Thank you! :)

-Gustavo
