Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65480A8432C
	for <lists+dri-devel@lfdr.de>; Thu, 10 Apr 2025 14:33:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF94010E98B;
	Thu, 10 Apr 2025 12:33:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gKdv4iRm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FCC810E98C
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Apr 2025 12:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744288383; x=1775824383;
 h=message-id:date:mime-version:subject:from:to:cc:
 references:in-reply-to:content-transfer-encoding;
 bh=sUXnT7AzCAWYuB7NRP8HhyTBB43qiPBWKF5ffiMn7jU=;
 b=gKdv4iRmew0lzhuc9stufHzt4bSqpJMYVTPyFEfL9XzlQC9UBLhpzEiS
 8XXKfePbLITDjvkwiFJdsvit1L3cNlS1/MQKOJ957nW+XnMAfqbzvwg97
 w2oOAxvdGlOR4YSRsL4haOPMWQ5mohfJkumZKMW5xXnQ1RGyiMdBVE2NH
 T4Rl6iTP53r4eLSobOImsqFOzS6zR0gv3rR+sIfEM6dFTjKNoKSjnI8nw
 aLCByEJ2Agiwa9kNPNJ6Uc6NPO3ZfgQ8AYaW+p0xoXB2HYh7nQJ5JQn49
 ZP8k9vgHoHSmV/GSZc0v3cxro1CGwHLSG49UhIVQmTknQCV+kh3lTEHHk g==;
X-CSE-ConnectionGUID: r3HRSu2CRoWzi14js5lmDQ==
X-CSE-MsgGUID: Q+NL29rgQ7iij3j+gjCpxw==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="56472304"
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; d="scan'208";a="56472304"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2025 05:33:02 -0700
X-CSE-ConnectionGUID: 9tWWqaaoRSKL1fTtzWFU2g==
X-CSE-MsgGUID: gFPjeusmTZebHr/9ZVK+oA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; d="scan'208";a="128808925"
Received: from mfalkows-mobl.ger.corp.intel.com (HELO [10.245.121.109])
 ([10.245.121.109])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2025 05:33:00 -0700
Message-ID: <47838624-609e-4719-ae65-a8482f1a6225@linux.intel.com>
Date: Thu, 10 Apr 2025 14:32:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/ivpu: Add cmdq_id to job related logs
From: "Falkowski, Maciej" <maciej.falkowski@linux.intel.com>
To: Jeff Hugo <jeff.hugo@oss.qualcomm.com>, dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, jacek.lawrynowicz@linux.intel.com,
 lizhi.hou@amd.com, Karol Wachowski <karol.wachowski@intel.com>
References: <20250401155939.4049467-1-maciej.falkowski@linux.intel.com>
 <7508a003-7a2e-4525-8466-099953e31497@oss.qualcomm.com>
 <1de68a42-52a2-431e-8a5c-5bff746964b7@linux.intel.com>
Content-Language: en-US
In-Reply-To: <1de68a42-52a2-431e-8a5c-5bff746964b7@linux.intel.com>
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

On 4/8/2025 3:53 PM, Falkowski, Maciej wrote:

> On 4/4/2025 5:18 PM, Jeff Hugo wrote:
>
>> On 4/1/2025 9:59 AM, Maciej Falkowski wrote:
>>> From: Karol Wachowski <karol.wachowski@intel.com>
>>>
>>> Add tracking of command queue ID in JOB debug message to improve
>>> debugging capabilities.
>>>
>>> Signed-off-by: Karol Wachowski <karol.wachowski@intel.com>
>>> Signed-off-by: Maciej Falkowski <maciej.falkowski@linux.intel.com>
>>
>> Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
>>
>> When reviewing this patch, I noticed the kernel doc for struct 
>> ivpu_job does not document cmdq_id.  I think that would cause an 
>> error when generating the documentation.  Please address that.
>
> Yes, cmdq_id was added recently without according doc line and I will 
> fix that accordingly.
Hi Jeff,

FYI I see more issues with current kerneldoc for our driver and I will 
create a separate patch for these fixes.
Thank you for pointing this out.

Best regards,
Maciej
>
> Best regards,
> Maciej
>
