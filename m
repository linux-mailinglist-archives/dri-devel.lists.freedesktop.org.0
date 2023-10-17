Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDDDE7CBD2E
	for <lists+dri-devel@lfdr.de>; Tue, 17 Oct 2023 10:15:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45E4610E287;
	Tue, 17 Oct 2023 08:15:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCAF810E282;
 Tue, 17 Oct 2023 08:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697530505; x=1729066505;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=BmIoLY/o2k22RrWOitj8Qe8FW2JhcrTWbOo1QMJXiOA=;
 b=hCv1nSmqzJSC8YXmjQEOHtx2LaZR43uuyvfvFFxPENdYlCjiuZ7gIGsF
 zgbzx2ZwTBRANb7DELmWQDVatSFCLaSKgnl2eVV5dJkh5EU0Xv8MpExmG
 sbvs/pe8307nUmzW5kSKLSkui7APW9QmpCAEqb47ZzFcUOYYQc7gWCTRJ
 BntV78apa8xLqE/e2GZ8c0RU8txKPNk+5L3x/A0JkjTYGnStobQyUOFV6
 T/Axh3H7avUfdsqOA3uXSI7VtZGpiPf54GNTmLxbes2MZKUkr3suxruS0
 BaxZ3/vkJPQ+4sTvRfnhBMC8XRKEz51J167Oriva2RXDsOZPPiflMj5if g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="388590281"
X-IronPort-AV: E=Sophos;i="6.03,231,1694761200"; d="scan'208";a="388590281"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2023 01:15:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="846729731"
X-IronPort-AV: E=Sophos;i="6.03,231,1694761200"; d="scan'208";a="846729731"
Received: from fhoeg-mobl1.ger.corp.intel.com (HELO [10.249.254.103])
 ([10.249.254.103])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2023 01:15:02 -0700
Message-ID: <05ad4ca8-be19-ce78-7e71-48a02dd265c5@linux.intel.com>
Date: Tue, 17 Oct 2023 10:14:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] drm/gpuvm: Dual-licence the drm_gpuvm code GPL-2.0 OR MIT
Content-Language: en-US
To: Danilo Krummrich <dakr@redhat.com>
References: <20231010142725.8920-1-thomas.hellstrom@linux.intel.com>
 <ZS49uJq9kqJ2ueOv@polis>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <ZS49uJq9kqJ2ueOv@polis>
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
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 10/17/23 09:54, Danilo Krummrich wrote:
> On Tue, Oct 10, 2023 at 04:27:24PM +0200, Thomas Hellström wrote:
>> Dual-licence in order to make it possible for other non-GPL os'es
>> to re-implement the code. The use of EXPORT_SYMBOL_GPL() is intentionally
>> left untouched to prevent use of drm_gpuvm as a proxy for non-GPL drivers
>> to access GPL-only kernel symbols.
>>
>> Much of the ideas and algorithms used in the drm_gpuvm code is already
>> present in one way or another in MIT-licensed code.
>>
>> Cc: Danilo Krummrich <dakr@redhat.com>
>> Cc: airlied@gmail.com
>> Cc: daniel@ffwll.ch
>> Cc: linux-kernel@vger.kernel.org
>> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Acked-by: Danilo Krummrich <dakr@redhat.com>

Thanks, Danilo

Thomas


>
>> ---
>>   drivers/gpu/drm/drm_gpuvm.c | 2 +-
>>   include/drm/drm_gpuvm.h     | 2 +-
>>   2 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
>> index 02ce6baacdad..08c088319652 100644
>> --- a/drivers/gpu/drm/drm_gpuvm.c
>> +++ b/drivers/gpu/drm/drm_gpuvm.c
>> @@ -1,4 +1,4 @@
>> -// SPDX-License-Identifier: GPL-2.0-only
>> +// SPDX-License-Identifier: GPL-2.0 OR MIT
>>   /*
>>    * Copyright (c) 2022 Red Hat.
>>    *
>> diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
>> index 361fea5cb849..21bbf11415b3 100644
>> --- a/include/drm/drm_gpuvm.h
>> +++ b/include/drm/drm_gpuvm.h
>> @@ -1,4 +1,4 @@
>> -/* SPDX-License-Identifier: GPL-2.0-only */
>> +/* SPDX-License-Identifier: GPL-2.0 OR MIT */
>>   
>>   #ifndef __DRM_GPUVM_H__
>>   #define __DRM_GPUVM_H__
>> -- 
>> 2.41.0
>>
