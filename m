Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F9FCA0222A
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jan 2025 10:51:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16B0310E5F5;
	Mon,  6 Jan 2025 09:51:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KvrW2NSZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DE8310E5F4;
 Mon,  6 Jan 2025 09:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736157065; x=1767693065;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=X/iSGfNZXi2UYm9J0YvA8UPeEU6HkBQO/qkXOEv6dqs=;
 b=KvrW2NSZfZCdvx6fRCmohGVK2sMv8fbhBs44Ft30l6b53F3YGgfGcn73
 gtP5eDfMOleVTZ0scev943xIA/LHKDhH7Ymf1UgrKM6eFgBVkJcytIVvz
 XAKolaSGxwP8AqJAcLCgTBdjsnWHy/XJ4W8uzwGrgU03BlrWkfOEYT1da
 o/OVqaquC88ukVaEjPpgXEV0Ue1Ed9lGjkyN0Ln+bWm7e0nbBdQyA5KLd
 83u6Duc9UaGXkpm6Uke/dJB4BDgylck8NQLInPTTbLhA+U5FpjlzVvVEL
 3thz2aC6Y0+aNaEti+krc3rSKZd8ZBYml+A/Y7w1ohjQkynyT2IbRwsIJ Q==;
X-CSE-ConnectionGUID: lZCONj2KReeVNZFnWObvdA==
X-CSE-MsgGUID: Q9swVZQ1RS2hs3MA4k4p3w==
X-IronPort-AV: E=McAfee;i="6700,10204,11306"; a="40070232"
X-IronPort-AV: E=Sophos;i="6.12,292,1728975600"; d="scan'208";a="40070232"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2025 01:51:04 -0800
X-CSE-ConnectionGUID: RGomMJQlSPy7gQedefYuAA==
X-CSE-MsgGUID: Zk7puWFaSN23W6fTL+/w6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,292,1728975600"; d="scan'208";a="102474878"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO [10.245.244.64])
 ([10.245.244.64])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2025 01:51:02 -0800
Message-ID: <aa27455c-04b8-494c-a3b5-c4385a7748bc@intel.com>
Date: Mon, 6 Jan 2025 09:51:00 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] drm/buddy: Add a testcase to verify the multiroot
 fini
To: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Cc: christian.koenig@amd.com, alexander.deucher@amd.com,
 "Lin . Cao" <lincao12@amd.com>
References: <20241226070116.309290-1-Arunpravin.PaneerSelvam@amd.com>
 <20241226070116.309290-2-Arunpravin.PaneerSelvam@amd.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20241226070116.309290-2-Arunpravin.PaneerSelvam@amd.com>
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

On 26/12/2024 07:01, Arunpravin Paneer Selvam wrote:
> - Added a testcase to verify the multiroot force merge fini.
> - Added a new field in_use to track the mm freed status.

I guess this is out of date now?

> 
> v2:(Matthew)
>    - Add kunit_fail_current_test() when WARN_ON is true.
> 
> Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
> Signed-off-by: Lin.Cao <lincao12@amd.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>


