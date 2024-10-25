Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56D549B0187
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2024 13:43:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1A6A10E051;
	Fri, 25 Oct 2024 11:43:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jgbzywzf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 264A110E051
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2024 11:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729856633; x=1761392633;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=Od1+IiJ7o7Ev9EKjzvRlk+vo7kdEal77LV50Vd1aXoY=;
 b=JgbzywzffVV2bFvyHBVfpZgJgdPrq1C23Qn0AnMF4GXbBgV+FamlVh6V
 gvgyMJQi7dVhaN+0mqXhBampV7swDNjELuJaLb4xTQbCwle0WcbfMRv0i
 ggmBszPbpgj3NFmm3HO5SPDnfz6RN1XXW5/iF795iR+s2CM8bwG/ey84k
 h2Y7Q88WJojd4BHUl3BJHxc5Hg/qA7m/uIS2nAGO0vweeF+4qXSMcyQPg
 troqFGD+D9qIy1hEdc6ccS1317hsFqj4gxOoZJyyMcHBXp9JwdIUOOLlW
 06rWMI8qPXiIeiqSuoBl/pUIrjtxeax3J8wDGisAerTiaMZJEJ6lurWTb A==;
X-CSE-ConnectionGUID: 8sYCbvdXTw+HOM4VSI9/+Q==
X-CSE-MsgGUID: hroMzmBvQ6OZKVH+V4n6Hg==
X-IronPort-AV: E=McAfee;i="6700,10204,11236"; a="33433687"
X-IronPort-AV: E=Sophos;i="6.11,231,1725346800"; d="scan'208";a="33433687"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2024 04:43:52 -0700
X-CSE-ConnectionGUID: ha3RT3GHTIW/pMRqCX124g==
X-CSE-MsgGUID: 3F/VlhyZTIeBh4W1XkCWug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,231,1725346800"; d="scan'208";a="80905170"
Received: from lwesiers-mobl.ger.corp.intel.com (HELO [10.245.115.50])
 ([10.245.115.50])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2024 04:43:52 -0700
Message-ID: <24c89cd6-666b-4b33-bd92-0644e3f1ed92@linux.intel.com>
Date: Fri, 25 Oct 2024 13:43:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/11] accel/ivpu: Add debug Kconfig option
To: dri-devel@lists.freedesktop.org
References: <20241017145817.121590-1-jacek.lawrynowicz@linux.intel.com>
 <20241017145817.121590-10-jacek.lawrynowicz@linux.intel.com>
 <c3f3c4a5-0927-0228-1cdf-3f8645a16681@quicinc.com>
Content-Language: en-US
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <c3f3c4a5-0927-0228-1cdf-3f8645a16681@quicinc.com>
Content-Type: text/plain; charset=UTF-8
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

Hi,

On 10/19/2024 12:09 AM, Jeffrey Hugo wrote:
> On 10/17/2024 8:58 AM, Jacek Lawrynowicz wrote:
>> From: Maciej Falkowski <maciej.falkowski@linux.intel.com>
>>
>> Add CONFIG_DRM_ACCEL_IVPU_DEBUG option that:
>>   - Adds -DDEBUG that enables printk regardless of the kernel config
>>   - Enables unsafe module params (that are now disabled by default)
>>
>> Signed-off-by: Maciej Falkowski <maciej.falkowski@linux.intel.com>
>> Reviewed-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
>> Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
>> ---
>>   drivers/accel/ivpu/Kconfig    | 10 ++++++++++
>>   drivers/accel/ivpu/Makefile   |  2 ++
>>   drivers/accel/ivpu/ivpu_drv.c |  2 ++
>>   drivers/accel/ivpu/ivpu_fw.c  |  2 ++
>>   drivers/accel/ivpu/ivpu_pm.c  |  2 ++
>>   5 files changed, 18 insertions(+)
>>
>> diff --git a/drivers/accel/ivpu/Kconfig b/drivers/accel/ivpu/Kconfig
>> index e4d418b44626e..8858b32e05640 100644
>> --- a/drivers/accel/ivpu/Kconfig
>> +++ b/drivers/accel/ivpu/Kconfig
>> @@ -16,3 +16,13 @@ config DRM_ACCEL_IVPU
>>         and Deep Learning applications.
>>           If "M" is selected, the module will be called intel_vpu.
>> +
>> +config DRM_ACCEL_IVPU_DEBUG
>> +    bool "Intel NPU debug mode"
>> +    depends on DRM_ACCEL_IVPU
>> +    default n
> 
> The default is N, so this is redundant, no?
> 

Yes, I will remove it.

