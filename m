Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0F36C009D2
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 13:02:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEFCC10E0CA;
	Thu, 23 Oct 2025 11:02:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xa+Q+LF6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BB6910E0CA
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 11:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761217341; x=1792753341;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=B92ChVHMGDm6RF7ktK2il4b8SfeYp/DBDe8RLqOsk8A=;
 b=Xa+Q+LF6RzE/1gALO+9gcgn3Wt0fJfIWkIUWZoC6UHYRyXJtyjLELjn2
 +fN52Z0BEHVXj/SN8++HkgR7mvxJsr6e+nHWmRkjpMPgXoSbQkzrSXM8i
 rSira3N4ZqRLLjErXMmiQzoFAythoQJ6bCyPVDpkZchHGKAMqzYyqMiiu
 pnV4lMSSojAor7BXqSq2n3y3i6iCLMoMllvRWl3Ch6U81Ciu77FjRtcXv
 OVEXEWkJK4BNjDendHhqfkqiBASPnDvQroId4pIRtelCh6Bw0NbORn2Io
 KyYlBbOdjA37pQQhNO8dGWifhnyENE3vHtLMYg7dYwtGhwNo+cP13wM13 w==;
X-CSE-ConnectionGUID: awqGmVOJQ2qnRXErSKt93g==
X-CSE-MsgGUID: HAnpp6eHSRKPg4d3yj5ICA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="67028841"
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; d="scan'208";a="67028841"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 04:02:20 -0700
X-CSE-ConnectionGUID: Ae+JYadPRseCWJhT6JHmKg==
X-CSE-MsgGUID: cDfOV+OZRPGZbj/xnFTFew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; d="scan'208";a="184903611"
Received: from mfalkows-mobl.ger.corp.intel.com (HELO [10.246.17.115])
 ([10.246.17.115])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 04:02:18 -0700
Message-ID: <69ab183b-8661-4aac-91ab-97804685cecd@linux.intel.com>
Date: Thu, 23 Oct 2025 13:02:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] accel/ivpu: Add support for Nova Lake's NPU
To: Jeff Hugo <jeff.hugo@oss.qualcomm.com>, dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, karol.wachowski@linux.intel.com, lizhi.hou@amd.com
References: <20251022105348.2237273-1-maciej.falkowski@linux.intel.com>
 <1f024aa7-3daa-4e2a-8110-e1ac72817dfe@oss.qualcomm.com>
Content-Language: en-US
From: "Falkowski, Maciej" <maciej.falkowski@linux.intel.com>
In-Reply-To: <1f024aa7-3daa-4e2a-8110-e1ac72817dfe@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 10/22/2025 4:43 PM, Jeff Hugo wrote:

> On 10/22/2025 4:53 AM, Maciej Falkowski wrote:
>> Add support for NPU6 generation that will be present on Nova Lake CPUs.
>> As with previous generations, it maintains compatibility
>> so no bigger functional changes apart from removing
>> deprecated call to soc_cpu_drive() function.
>>
>> Quiescing TOP_MMIO in SOC_CPU_NOC as part of boot procedure is no longer
>> needed starting from 60XX. Remove soc_cpu_drive() call from NPU6 onward.
>>
>> The VPU_CPU_NOC_QREQN, VPU_CPU_NOC_QACCEPTN, and VPU_CPU_NOC_QDENY
>> registers are deprecated and non-functional on 60XX. They will be
>> removed in future generations.
>>
>> Signed-off-by: Karol Wachowski <karol.wachowski@linux.intel.com>
>> Signed-off-by: Maciej Falkowski <maciej.falkowski@linux.intel.com>
>
> Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Pushed to drm-misc-next.

Best regards,
Maciej
