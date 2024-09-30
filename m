Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEFD898AB07
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2024 19:22:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5392310E55F;
	Mon, 30 Sep 2024 17:22:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jP0ne484";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01E0F10E55F
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2024 17:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727716936; x=1759252936;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=0kmSe5KIr6TBE/0yo4+zp6CtVcDS0CZqwNkQ+9/BHgU=;
 b=jP0ne484bes9TOi4fWtGb+9k8MxqCQ3GhRUHIbPo/3Cs3v7EK54GK6yk
 wacL0eUy6dxEqR3c2nF6u4sn8s3jwjnaY8xEN97SvDosd3ucueVBvNUlj
 wZ1P/hzaCfs8OSAEKAnrHg5mcoN1nPpDC8YjPLeF2rJ8I2juTGJq1dBfh
 +wb5szlpe/SSAgEHkaY0RyVEsFbibNUOpx8B5r/9eIX2892DF1GWx2gC6
 SiqlQ6kl0330EiqakkOETh9vIkpBC2DPUwEX/9A3zrvu3ionASkVnkHA/
 mAadPlULx8o9DvG/Evk3p0VX23WJAKmlxKfVNE5mWm8H+X+iXjBPeHt7q w==;
X-CSE-ConnectionGUID: l8Axty0CT6mZBj3LvetiaQ==
X-CSE-MsgGUID: V6+1kaeDSvSIsMzTwLMbQw==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="52236626"
X-IronPort-AV: E=Sophos;i="6.11,166,1725346800"; d="scan'208";a="52236626"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 10:22:16 -0700
X-CSE-ConnectionGUID: pSDbUbI3RF2nzgjc74AXMQ==
X-CSE-MsgGUID: NQ/mT7MYQBGF5Vp10ISd4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,166,1725346800"; d="scan'208";a="78342382"
Received: from jpdavis-mobl1.ger.corp.intel.com (HELO [10.246.18.68])
 ([10.246.18.68])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 10:22:15 -0700
Message-ID: <0eadf977-45ea-4d16-a585-5602a2613f07@linux.intel.com>
Date: Mon, 30 Sep 2024 19:22:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/29] accel/ivpu: Fix JSM state dump message warnings
To: Jeffrey Hugo <quic_jhugo@quicinc.com>, dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, Tomasz Rusinowicz <tomasz.rusinowicz@intel.com>
References: <20240924081754.209728-1-jacek.lawrynowicz@linux.intel.com>
 <20240924081754.209728-7-jacek.lawrynowicz@linux.intel.com>
 <8a11b370-531e-91e3-40d8-d65c96065e30@quicinc.com>
Content-Language: en-US
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <8a11b370-531e-91e3-40d8-d65c96065e30@quicinc.com>
Content-Type: text/plain; charset=UTF-8
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

On 9/27/2024 10:44 PM, Jeffrey Hugo wrote:
> On 9/24/2024 2:17 AM, Jacek Lawrynowicz wrote:
>> From: Tomasz Rusinowicz <tomasz.rusinowicz@intel.com>
>>
>> We are disabling IRQs prior to queuing recovery work, so state dump
>> messages always timed out with a warning. Use simple msleep() to prevent
>> IPC warnings.
> 
> It looks to me like this patch is adding state dump messages, but this commit text reads like they already exist, but there is a logic flaw.
> 
> Did you perhaps copy the commit text for some internal fix that added the msleep line, but implement the entire feature?
> 
Yeah, I forgot to update the commit message. I will fix this in v2.

