Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C4E6C1EDE5
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 08:57:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DDCF10E905;
	Thu, 30 Oct 2025 07:57:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bvzPGEry";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72A0410E905
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 07:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761811051; x=1793347051;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=YDCjN8tLnzTXhpSamWl0231wAKdCwIQjAABC75aAnSk=;
 b=bvzPGErya7pb63jG2858Cfc1jO+idf2CsFvl04TzEWv3xHr+m9qJo6Hs
 TiuTrULOY6HkoVYlxNYVTttoHIMCeCzemBjyQEPtUH6Nx2Br43JY1RxCP
 68Z8Zkx4GzAIoZNy2W21UAkV25/vFSURteRiTEnE2udLtwcu6V5LihQjl
 xWYl3ZAuflZMu0j49FTNjBvAH5+Gkg7AgyXAiqT/11Oxvw6G7y1pXRALh
 Qv2X66CW5S4g2WV9IYFF+2atng8n23Phoh9A2oc4oH01yFuXJ0VMahnw4
 /Bx/S5skHZaaASXpaOzyIXZ6xHATtw2fqMJ00Q3pD9tUU9CwQehh6ywws w==;
X-CSE-ConnectionGUID: +0p9gC5OR16F6gy4WR1rhw==
X-CSE-MsgGUID: sffDujgaQreWstvQuXibJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="75393908"
X-IronPort-AV: E=Sophos;i="6.19,266,1754982000"; d="scan'208";a="75393908"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 00:57:30 -0700
X-CSE-ConnectionGUID: 0YJVLCuqQAe4FQvxoEvSag==
X-CSE-MsgGUID: KnMsTjKOSAmfG8LUq7BgIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,266,1754982000"; d="scan'208";a="190221504"
Received: from kwachows-mobl.ger.corp.intel.com (HELO [10.246.16.226])
 ([10.246.16.226])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 00:57:29 -0700
Message-ID: <763bb797-4307-4209-98d6-d2303541e33d@linux.intel.com>
Date: Thu, 30 Oct 2025 08:57:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] accel/ivpu: Add support for userptr buffer objects
To: Jeff Hugo <jeff.hugo@oss.qualcomm.com>, dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, maciej.falkowski@linux.intel.com,
 lizhi.hou@amd.com, Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
References: <20251029091752.203198-1-karol.wachowski@linux.intel.com>
 <0bb2b8d8-4ed7-46e0-a987-aab3dd7fd055@oss.qualcomm.com>
Content-Language: en-US
From: Karol Wachowski <karol.wachowski@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <0bb2b8d8-4ed7-46e0-a987-aab3dd7fd055@oss.qualcomm.com>
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

On 10/29/2025 4:43 PM, Jeff Hugo wrote:
> On 10/29/2025 3:17 AM, Karol Wachowski wrote:
>> From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
>>
>> Introduce a new ioctl `drm_ivpu_bo_create_from_userptr` that allows
>> users to create GEM buffer objects from user pointers to memory regions.
>> The user pointer must be page-aligned and the memory region must remain
>> valid for the buffer object's lifetime.
>>
>> Userptr buffers enable direct use of mmapped files (e.g. inference
>> weights) in NPU workloads without copying data to NPU buffer objects.
>> This reduces memory usage and provides better flexibility for NPU
>> applications.
>>
>> Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
>> Signed-off-by: Karol Wachowski <karol.wachowski@linux.intel.com>
>>
>
> Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com> 
Pushed to drm-misc-next.
-Karol
