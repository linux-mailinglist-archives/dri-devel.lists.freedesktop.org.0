Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35428C3453C
	for <lists+dri-devel@lfdr.de>; Wed, 05 Nov 2025 08:45:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97B0310E2AE;
	Wed,  5 Nov 2025 07:45:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lvNvqf1g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AEFD10E6BA
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Nov 2025 07:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762328741; x=1793864741;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=rqr0AU80wfXy05Io81iPFacaaS5ggMo/c30wRHdVTKk=;
 b=lvNvqf1gOZn/kccPuTPue8mJ8tCkM7Pu0JTd31/iCQJfYbzEU12Zah1I
 n0CysU4yhKqPxQ2j3g1vfx06OEwKNZZgDGUtZXtWEXfz0FzAB34XnxXky
 Scorafou9mCP3jfkXw8nIm6mPt21R8Ywb3zkqtzhHfa96YWXvJw878+1S
 IP1fDDXsMmaB0krwSNlbQeMjM68j50CFJ4pUddYdsEet1m4kn1lMWnq7i
 0CyOpVAQ5oNEfu+u5ogJDrbAIrC3vLXKnOgqm6rAlzLnabjP1KqNfZ3ov
 P2OGt0YVVP1n1AkgRcSjsHAL/Wzxagn1WHxLoxh4yEM9gLX88LgDE6IvG g==;
X-CSE-ConnectionGUID: DUHH75X7RxeidVqGbxa2ZQ==
X-CSE-MsgGUID: 2jcDVH4JSJm/9QU5fPZHWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="75041198"
X-IronPort-AV: E=Sophos;i="6.19,281,1754982000"; d="scan'208";a="75041198"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 23:45:40 -0800
X-CSE-ConnectionGUID: Hoqd6HnHQ1K60oaGxRWkkw==
X-CSE-MsgGUID: 0SDwLpaFS4aBTCiq3cBqIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,281,1754982000"; d="scan'208";a="187833251"
Received: from unknown (HELO [10.102.88.18]) ([10.102.88.18])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 23:45:39 -0800
Message-ID: <1bd54c3e-7e97-46c6-8765-9ed17879ddff@linux.intel.com>
Date: Wed, 5 Nov 2025 08:45:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] accel/ivpu: Improve debug and warning messages
To: Jeff Hugo <jeff.hugo@oss.qualcomm.com>, dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, maciej.falkowski@linux.intel.com,
 lizhi.hou@amd.com, jani.nikula@linux.intel.com
References: <20251104132418.970784-1-karol.wachowski@linux.intel.com>
 <0ec71586-638b-4a9e-beb4-f7e95bfac14d@oss.qualcomm.com>
Content-Language: en-US
From: Karol Wachowski <karol.wachowski@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <0ec71586-638b-4a9e-beb4-f7e95bfac14d@oss.qualcomm.com>
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

On 11/4/2025 7:01 PM, Jeff Hugo wrote:
> On 11/4/2025 6:24 AM, Karol Wachowski wrote:
>> Add IOCTL debug bit for logging user provided parameter validation
>> errors.
>>
>> Refactor several warning and error messages to better reflect fault
>> reason. User generated faults should not flood kernel messages with
>> warnings or errors, so change those to ivpu_dbg(). Add additional debug
>> logs for parameter validation in IOCTLs.
>>
>> Check size provided by in metric streamer start and return -EINVAL
>> together with a debug message print.
>>
>> Signed-off-by: Karol Wachowski <karol.wachowski@linux.intel.com>
>
> Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com> 
Thanks, pushed to drm-misc-next.
