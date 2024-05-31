Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 583D68D6016
	for <lists+dri-devel@lfdr.de>; Fri, 31 May 2024 12:58:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A06410E12A;
	Fri, 31 May 2024 10:58:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="oK6eeztN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E150410E12A
 for <dri-devel@lists.freedesktop.org>; Fri, 31 May 2024 10:58:00 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 44VAvXH5079927;
 Fri, 31 May 2024 05:57:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1717153053;
 bh=hjtdY2sRv/3Z2vbHsQ/ld4i7cSC58nLl8ghKakpaSR0=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=oK6eeztNfdoiPYCwCSlA1WgYvfUjzbUmrRUgFJ+YKeI8U3j1a7UiLvYErfx1jWI5d
 y/yek9LTAxEDobjM8UcErw5+eUOjtBQ8zHEsfBv0X0VES5JrJfR48pnCNQmBflJGQK
 Ch6TF5Agi/q5Hu6WdhJ0Eglb9EkiIlbQ+RQqQkA0=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 44VAvXew012283
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 31 May 2024 05:57:33 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 31
 May 2024 05:57:32 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 31 May 2024 05:57:32 -0500
Received: from [172.24.227.193] (devarsht.dhcp.ti.com [172.24.227.193] (may be
 forged))
 by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 44VAvNwo116858;
 Fri, 31 May 2024 05:57:24 -0500
Message-ID: <0858f5d9-a694-7ee4-0edf-3f0610703b92@ti.com>
Date: Fri, 31 May 2024 16:27:23 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v10 07/11] Documentation: core-api: Add math.h macros and
 functions
Content-Language: en-US
To: Randy Dunlap <rdunlap@infradead.org>, <mchehab@kernel.org>,
 <hverkuil-cisco@xs4all.nl>, <linux-media@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <benjamin.gaignard@collabora.com>,
 <sebastian.fricke@collabora.com>, <akpm@linux-foundation.org>,
 <gregkh@linuxfoundation.org>, <andriy.shevchenko@linux.intel.com>,
 <adobriyan@gmail.com>, <jani.nikula@intel.com>,
 <p.zabel@pengutronix.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <corbet@lwn.net>,
 <broonie@kernel.org>, <linux-doc@vger.kernel.org>
CC: <laurent.pinchart@ideasonboard.com>, <praneeth@ti.com>, <nm@ti.com>,
 <vigneshr@ti.com>, <a-bhatia1@ti.com>, <j-luthra@ti.com>,
 <b-brnich@ti.com>, <detheridge@ti.com>, <p-mantena@ti.com>,
 <vijayp@ti.com>, <andrzej.p@collabora.com>, <nicolas@ndufresne.ca>,
 <davidgow@google.com>, <dlatypov@google.com>
References: <20240530165925.2715837-1-devarsht@ti.com>
 <20240530171740.2763221-1-devarsht@ti.com>
 <4951656c-2d15-49f6-89d8-aa7b5c333ec7@infradead.org>
From: Devarsh Thakkar <devarsht@ti.com>
In-Reply-To: <4951656c-2d15-49f6-89d8-aa7b5c333ec7@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Randy,

Thanks for the review.

On 31/05/24 04:14, Randy Dunlap wrote:
> 
> 
> On 5/30/24 10:17 AM, Devarsh Thakkar wrote:
>> Add documentation for rounding, scaling, absolute value and difference,
>> 32-bit division related macros and functions exported by math.h header
>> file.
>>
>> Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
>> ---
>> V1->V9 (No change)
>> V10: Patch introduced
>> ---
>>  Documentation/core-api/kernel-api.rst | 6 ++++++
>>  1 file changed, 6 insertions(+)
>>
>> diff --git a/Documentation/core-api/kernel-api.rst b/Documentation/core-api/kernel-api.rst
>> index ae92a2571388..fb467783d491 100644
>> --- a/Documentation/core-api/kernel-api.rst
>> +++ b/Documentation/core-api/kernel-api.rst
>> @@ -185,6 +185,12 @@ Division Functions
>>  .. kernel-doc:: lib/math/gcd.c
>>     :export:
>>  
>> +Rounding, absolute value, scaling and 32bit division functions
> 
>                                          32-bit
> please.
> 

Good catch. Also I see some division functions supporting non-32bit functions
too, so I would make it as below :
Rounding, absolute value, division and 32-bit scaling functions
---------------------------------------------------------------

Regards
Devarsh
