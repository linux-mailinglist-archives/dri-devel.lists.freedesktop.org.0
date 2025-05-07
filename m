Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C75BAAD69B
	for <lists+dri-devel@lfdr.de>; Wed,  7 May 2025 08:59:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B31D810E754;
	Wed,  7 May 2025 06:59:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cH3XG7Z3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 663F410E754
 for <dri-devel@lists.freedesktop.org>; Wed,  7 May 2025 06:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746601145; x=1778137145;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=3EU/TCB9MceBiQbHdNJWE4YdlJz0LAiUGc+U4rFuXo8=;
 b=cH3XG7Z3WE6oKdPZbXVvk93kp2hRKxRD7b6al8HoLvH8Lve3roUhox+6
 btWPWoDIz91xXFefGwMu2XpTvlRfNwnsb/wtUbnRw6bkFoQmX8+dxDajK
 y7MzPkFVbrWfrrVBtChnXbXcbJr1Sm+h5NcG24OVrRi2HkPr/WWOzaWED
 HJkW32kSGXb8jtU2rAC9Sgz5al7dHrGy+Khks8B4n3/McSeMe0tFoPLbB
 bfsmwbH9gEebwcMcm/8kwaNUxVZvAwahDpJZjYl8rOMtVbvYCgotsN3X/
 F8vGrEb5/XHY/OkoNBvSAcf49cg3gC6hTpYI+b/k07llx5+qBYSBpgmtv Q==;
X-CSE-ConnectionGUID: wmg/W3qXQUygIhy0sOZVzA==
X-CSE-MsgGUID: gw2hjhghSzOd7RSV9WIwfQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="58969647"
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; d="scan'208";a="58969647"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2025 23:59:05 -0700
X-CSE-ConnectionGUID: VtWBItpKQcOo6A2p0zgTEw==
X-CSE-MsgGUID: 0cqwUsMZQ2CU/0J3sB4m1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; d="scan'208";a="136262718"
Received: from ertle-mobl1.ger.corp.intel.com (HELO [10.245.112.108])
 ([10.245.112.108])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2025 23:59:03 -0700
Message-ID: <35f0d2b1-e958-44db-b4d2-978cd741c3ab@linux.intel.com>
Date: Wed, 7 May 2025 08:59:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/ivpu: Use firmware names from upstream repo
To: Lizhi Hou <lizhi.hou@amd.com>, dri-devel@lists.freedesktop.org
Cc: jeff.hugo@oss.qualcomm.com, stable@vger.kernel.org
References: <20250506092030.280276-1-jacek.lawrynowicz@linux.intel.com>
 <abf77771-ca6a-3b29-f5e7-fbb11c53844a@amd.com>
Content-Language: en-US
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <abf77771-ca6a-3b29-f5e7-fbb11c53844a@amd.com>
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

On 5/6/2025 5:41 PM, Lizhi Hou wrote:
> 
> On 5/6/25 02:20, Jacek Lawrynowicz wrote:
>> Use FW names from linux-firmware repo instead of deprecated ones.
>>
>> Fixes: c140244f0cfb ("accel/ivpu: Add initial Panther Lake support")
>> Cc: <stable@vger.kernel.org> # v6.13+
>> Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
>> ---
>>   drivers/accel/ivpu/ivpu_fw.c | 12 ++++++------
>>   1 file changed, 6 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/accel/ivpu/ivpu_fw.c b/drivers/accel/ivpu/ivpu_fw.c
>> index ccaaf6c100c02..9db741695401e 100644
>> --- a/drivers/accel/ivpu/ivpu_fw.c
>> +++ b/drivers/accel/ivpu/ivpu_fw.c
>> @@ -55,18 +55,18 @@ static struct {
>>       int gen;
>>       const char *name;
>>   } fw_names[] = {
>> -    { IVPU_HW_IP_37XX, "vpu_37xx.bin" },
>> +    { IVPU_HW_IP_37XX, "intel/vpu/vpu_37xx_v1.bin" },
> 
> What if old only vpu_37xx.bin is installed but not intel/vpu/vpu_37xx_v1?
> 
> Maybe just put *_v1 line in front without removing { ..., "vpu_37xx.bin"} ?
> 

The vpu_37xx.bin style names were never released. This was only for developer convenience but it turns out that developers don't use this anymore, so it is safe to remove. Maybe it make sense to mention this in commit message :)

> 
>>       { IVPU_HW_IP_37XX, "intel/vpu/vpu_37xx_v0.0.bin" },
>> -    { IVPU_HW_IP_40XX, "vpu_40xx.bin" },
>> +    { IVPU_HW_IP_40XX, "intel/vpu/vpu_40xx_v1.bin" },
>>       { IVPU_HW_IP_40XX, "intel/vpu/vpu_40xx_v0.0.bin" },
>> -    { IVPU_HW_IP_50XX, "vpu_50xx.bin" },
>> +    { IVPU_HW_IP_50XX, "intel/vpu/vpu_50xx_v1.bin" },
>>       { IVPU_HW_IP_50XX, "intel/vpu/vpu_50xx_v0.0.bin" },
>>   };
>>     /* Production fw_names from the table above */
>> -MODULE_FIRMWARE("intel/vpu/vpu_37xx_v0.0.bin");
>> -MODULE_FIRMWARE("intel/vpu/vpu_40xx_v0.0.bin");
>> -MODULE_FIRMWARE("intel/vpu/vpu_50xx_v0.0.bin");
>> +MODULE_FIRMWARE("intel/vpu/vpu_37xx_v1.bin");
>> +MODULE_FIRMWARE("intel/vpu/vpu_40xx_v1.bin");
>> +MODULE_FIRMWARE("intel/vpu/vpu_50xx_v1.bin");
>>     static int ivpu_fw_request(struct ivpu_device *vdev)
>>   {

