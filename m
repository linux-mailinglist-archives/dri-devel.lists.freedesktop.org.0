Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FACEA9217F
	for <lists+dri-devel@lfdr.de>; Thu, 17 Apr 2025 17:28:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CBCC10EB4A;
	Thu, 17 Apr 2025 15:28:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T7n09zht";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66DFE10EB4A
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Apr 2025 15:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744903688; x=1776439688;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=2QLoxBn94cMIPtBRywwITBaH9G/y4ykhAWyGes6cQvk=;
 b=T7n09zhtTBoniYZ0aFwK1S+R4/jnfP2un6BymaIG7Auq3olDAbsARdbM
 IymLw3tzvHXbIY8P8h1Un3XBAF9hhCvAuD1o620hfz3bmf9KqOqLAZYsG
 gkJ/jKISlszA6pWdCFTsAowt+qnrd+sTdA+LxeZa/Vb/MLsiWM0sWCM6H
 zVsfAN+Tb9kNptS6JqJZYJzCWdHS2L8HOK+UXzMLblXDiZbywEDSXx6ZQ
 AaZ0K2AaBHbjIFhnK3HhuHcruepomZt1z3FEw2AQTQhkdqU+k216meMvG
 YkCZhqCvLrNbuZgRcnfBMZDOefi+0iBeXxheX8yhop6uUubFHsGzWFsUR g==;
X-CSE-ConnectionGUID: 5WfSCgG0S+CXwrqqkc9uEw==
X-CSE-MsgGUID: OcdocTTpRneOQSAb5r3hSQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11406"; a="57869509"
X-IronPort-AV: E=Sophos;i="6.15,219,1739865600"; d="scan'208";a="57869509"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2025 08:28:06 -0700
X-CSE-ConnectionGUID: 33ZsgTshTM+a1V0L58KO1w==
X-CSE-MsgGUID: J8AWYCzdQEmz9BLjh1SF+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,219,1739865600"; d="scan'208";a="136010023"
Received: from mfalkows-mobl.ger.corp.intel.com (HELO [10.245.121.109])
 ([10.245.121.109])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2025 08:28:02 -0700
Message-ID: <8dbc2f5a-cec4-43c7-a592-285d9b85c938@linux.intel.com>
Date: Thu, 17 Apr 2025 17:27:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] accel/ivpu: Show NPU frequency in sysfs
To: Jeff Hugo <jeff.hugo@oss.qualcomm.com>, dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, jacek.lawrynowicz@linux.intel.com,
 lizhi.hou@amd.com, Andrzej Kacprowski <Andrzej.Kacprowski@intel.com>
References: <20250401155912.4049340-1-maciej.falkowski@linux.intel.com>
 <20250401155912.4049340-3-maciej.falkowski@linux.intel.com>
 <464ccbb4-3c72-4ecf-a0cf-35d2ad9d04a4@oss.qualcomm.com>
 <07d3558d-54c9-45b9-9945-fb948d37e84f@linux.intel.com>
 <4e7f1b6b-9d24-4f9d-b9e7-efb4c55d9081@oss.qualcomm.com>
Content-Language: en-US
From: "Falkowski, Maciej" <maciej.falkowski@linux.intel.com>
In-Reply-To: <4e7f1b6b-9d24-4f9d-b9e7-efb4c55d9081@oss.qualcomm.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/11/2025 5:49 PM, Jeff Hugo wrote:

> On 4/8/2025 8:55 AM, Falkowski, Maciej wrote:
>> On 4/4/2025 5:13 PM, Jeff Hugo wrote:
>>
>>> On 4/1/2025 9:59 AM, Maciej Falkowski wrote:
>>>> From: Andrzej Kacprowski <Andrzej.Kacprowski@intel.com>
>>>>
>>>> Add sysfs files that show maximum and current
>>>> frequency of the NPU's data processing unit.
>>>> New sysfs entries:
>>>> - npu_max_frequency_mhz
>>>
>>> Don't you have an ioctl to get this, which is fixed in patch 1 of 
>>> the series?  Why duplicate that with a sysfs?
>>
>> We added this to keep it consistent with sysfs entry for current 
>> frequency.
>> This is more for a convenience but ioctl is still required as 
>> user-mode driver requires this.
>> Do you think it is justified having this consideration?
>
> The duplication is not great, but I understand the rational.
>
> Also, I think your last message was HTML formatted instead of plain 
> text.  I suggest you check your mail client settings.
Yes, it was set to automatic so I had not seen it before this occurence, 
thanks for pointing this out.
>
>>
>>>
>>>> - npu_current_frequency_mhz
>>>
>>> Do you have userspace code that consumes these?
>>
>> We do have a support for two device monitors in a userspace - 
>> resources[1] and  btop[2].
>> I develop myself a btop support and have already frequency included, 
>> I will also include it in resources.
>>
>> [1]: 
>> https://github.com/nokyan/resources/blob/main/src/utils/npu/intel.rs
>> <https://github.com/nokyan/resources/blob/main/src/utils/npu/ 
>> intel.rs>[2]: https://github.com/m-falkowski/btop
>
> It would be good to document this.  Without something in 
> Documentation, at least have this in the commit text.
I think it will be the best if we prepare appropriate documentation just 
like yours.
I will post kerneldoc fixes and doc in a separate series if that is not 
a problem.
Thank you for checking this.

Best regards,
Maciej
>
> -Jeff
