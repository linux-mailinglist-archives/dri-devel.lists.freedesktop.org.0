Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C71BA9F7B22
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2024 13:21:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7CF610E13C;
	Thu, 19 Dec 2024 12:21:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="huS5Y2rb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17ACD10E13C
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2024 12:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734610859; x=1766146859;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Zp+W+OkV8RdPImWU5B0lHLs31DWEkmQtDbwgm8gx4Dc=;
 b=huS5Y2rbVTiYezWyZwfBWd0V8giGeEDdAnhT/kf6g1re1Vj2xXwvvDmv
 /2vgnJVMX71pBnSVY7CmKDyBftWKTWcDLErLa0l9m5srfD7nvZcL9/B4r
 hDMon1vMH8x021m5UF3g2dtc/8ESKHTioLFcN5K5XsT5wCyR1Sgyr1oVG
 i26trK7yS0vvW2lDxs7siNeeh7HYGGdvyzV3YP9Ht2W953RBO01nbA8m/
 EY1BBCkfvmhSgoJ4M++STqOdGwCW5gjWBcAokHNyhJ/4OWyX5Pxxvv6DV
 Wa2ynSxubvYdBdDOsObaVkvXbAcSLpyyv8RLtyItW69QhQyyZdWtCrAyf w==;
X-CSE-ConnectionGUID: DpIIvBWAS1y2Drh7R3Bd+A==
X-CSE-MsgGUID: 97VO+79sS9+knYKJotrduQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="35004759"
X-IronPort-AV: E=Sophos;i="6.12,247,1728975600"; d="scan'208";a="35004759"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2024 04:20:59 -0800
X-CSE-ConnectionGUID: 7KFFoziLTEKaB9zi52tumA==
X-CSE-MsgGUID: AujcCBXRTneoRcJmwaSKiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,247,1728975600"; d="scan'208";a="103166212"
Received: from mtargan-mobl.ger.corp.intel.com (HELO [10.245.115.170])
 ([10.245.115.170])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2024 04:20:58 -0800
Message-ID: <094a93de-1001-44b8-8a1f-7b6013cf1f68@linux.intel.com>
Date: Thu, 19 Dec 2024 13:20:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] accel/ivpu: Fixes for 6.13
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com
References: <20241210130939.1575610-1-jacek.lawrynowicz@linux.intel.com>
Content-Language: en-US
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20241210130939.1575610-1-jacek.lawrynowicz@linux.intel.com>
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

Applied to drm-misc-fixes

On 12/10/2024 2:09 PM, Jacek Lawrynowicz wrote:
> This patchset addresses several issues in the accel/ivpu module,
> including fixing a general protection fault in ivpu_bo_list().
> 
> Jacek Lawrynowicz (3):
>   accel/ivpu: Fix general protection fault in ivpu_bo_list()
>   accel/ivpu: Fix memory leak in ivpu_mmu_reserved_context_init()
>   accel/ivpu: Fix WARN in ivpu_ipc_send_receive_internal()
> 
>  drivers/accel/ivpu/ivpu_gem.c         |  2 +-
>  drivers/accel/ivpu/ivpu_mmu_context.c | 10 +++++++---
>  drivers/accel/ivpu/ivpu_pm.c          |  2 +-
>  3 files changed, 9 insertions(+), 5 deletions(-)
> 
> --
> 2.45.1

