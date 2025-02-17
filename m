Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB6B1A387B5
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2025 16:36:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6CFE10E30D;
	Mon, 17 Feb 2025 15:36:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LEEAoMiS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFF0110E30D
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 15:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739806562; x=1771342562;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=xv/lm9695X21ZhapPGclFF88lTPJnLppm/yV4hljyIo=;
 b=LEEAoMiSc0bZIPb9G/M+g+4KeCOef8+XGBlc9q9GVtKlzlWSdmWNsFS5
 EPjHH11d+pokZf+P27nniHLdGSul4HhNP61aHL9HgURZRXBcB3549vdWE
 1Lg66cET6yxE6dYFOFTBa5QxznEsNa1lqdIFixiokCK5n7uMXfoXl2nOQ
 NGhD+MdNqa/reZSqU2y6kq8J3PXhx6I/IKhP66xfRO8Cq4PAT7vQgDjaQ
 uzT/yzMXb9DuvvCVsVyhAkwxGoJacmr+6F8yrIMte8ia7yBQSImfjdv7Q
 mVKG0bHUQve6YHvDZqWfdeJsfEAGEM3VTNuEEpW0t5lykNEXT+BCQx4Kx Q==;
X-CSE-ConnectionGUID: qXZw5GRYQOaTsDhc1jryXg==
X-CSE-MsgGUID: iQsLUZqXR8OG7SMqWYHwwA==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="39679803"
X-IronPort-AV: E=Sophos;i="6.13,293,1732608000"; d="scan'208";a="39679803"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2025 07:36:02 -0800
X-CSE-ConnectionGUID: tQvLMGRESc+XC6Twyhlzkw==
X-CSE-MsgGUID: x6V+QHW2Q/GkJlREDb+ogw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="145061160"
Received: from anishsin-mobl1.ger.corp.intel.com (HELO [10.245.114.74])
 ([10.245.114.74])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2025 07:36:01 -0800
Message-ID: <4d41ad8c-636f-404e-9e55-4c7dc674044f@linux.intel.com>
Date: Mon, 17 Feb 2025 16:35:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] accel/ivpu: Implement D0i2 disable test mode
To: Jeffrey Hugo <quic_jhugo@quicinc.com>, dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, maciej.falkowski@linux.intel.com,
 Karol Wachowski <karol.wachowski@intel.com>
References: <20250204084622.2422544-1-jacek.lawrynowicz@linux.intel.com>
 <20250204084622.2422544-7-jacek.lawrynowicz@linux.intel.com>
 <a89af8ab-db02-84fa-2ed5-9f1addfdc241@quicinc.com>
Content-Language: en-US
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <a89af8ab-db02-84fa-2ed5-9f1addfdc241@quicinc.com>
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

Hi,

On 2/14/2025 6:04 PM, Jeffrey Hugo wrote:
> On 2/4/2025 1:46 AM, Jacek Lawrynowicz wrote:
>> From: Karol Wachowski <karol.wachowski@intel.com>
>>
>> Add power_profile firmware boot param and set it to 0 by default
>> which is default FW power profile.
> 
> I don't think that patch does this. It looks like boot_params->power_profile is already defined. What am I missing?
 
Yes, the description is unfortunate, the power_profile is indeed already defined and always set to 0. This change adds the ability to set it to 1 using a WA.
I will fix the description.

Jacek

