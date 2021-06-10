Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B02403A2D2D
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jun 2021 15:36:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CC226E85F;
	Thu, 10 Jun 2021 13:36:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A2C46E85F;
 Thu, 10 Jun 2021 13:36:01 +0000 (UTC)
IronPort-SDR: oWreXQCyTFkpAWsVZzzab4tBSMH1RpoeczWQwH5mBM2A87r7y2K+ZtljXVZlJflZhfIvzx71Fj
 moNIpufh5hag==
X-IronPort-AV: E=McAfee;i="6200,9189,10011"; a="226691050"
X-IronPort-AV: E=Sophos;i="5.83,263,1616482800"; d="scan'208";a="226691050"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2021 06:36:00 -0700
IronPort-SDR: 8bXh5qaVfUS3hLkwI02dYZfHEwjbv7qiQ6J8FEQk4VInya4hkWszA6Awl5R2TDkWsAeDKLUHIP
 Fh+sECrChfug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,263,1616482800"; d="scan'208";a="486169000"
Received: from irvmail001.ir.intel.com ([10.43.11.63])
 by fmsmga002.fm.intel.com with ESMTP; 10 Jun 2021 06:35:58 -0700
Received: from [10.249.139.200] (mwajdecz-MOBL.ger.corp.intel.com
 [10.249.139.200])
 by irvmail001.ir.intel.com (8.14.3/8.13.6/MailSET/Hub) with ESMTP id
 15ADZvt3020309; Thu, 10 Jun 2021 14:35:57 +0100
Subject: Re: [PATCH 00/13] Update firmware to v62.0.0
To: Matthew Brost <matthew.brost@intel.com>, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
References: <20210610043649.144416-1-matthew.brost@intel.com>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
Message-ID: <dce71640-7648-d321-c3e1-24e98a6276e9@intel.com>
Date: Thu, 10 Jun 2021 15:35:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210610043649.144416-1-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Cc: daniele.ceraolospurio@intel.com, john.c.harrison@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 10.06.2021 06:36, Matthew Brost wrote:
> As part of enabling GuC submission [1] we need to update to the latest
> and greatest firmware. This series does that. This is a destructive
> change. e.g. Without all the patches in this series it will break the

not really 'all'

> i915 driver. As such, after we review most of these patches they will
> squashed into a single patch for merging.

I assume final series will looks as follows:

1                      = hxg
2+3+5+6+7+8+4+10+11+13 = ctb/ads/fw
12                     = log
9                      = rst

> 
> v2: Address comments, looking for remaning RBs so patches can be

typo

and likely series should be generated with -v 2 option too


> squashed and sent for CI
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> 
> [1] https://patchwork.freedesktop.org/series/89844/i
> 
> John Harrison (3):
>   drm/i915/guc: Support per context scheduling policies
>   drm/i915/guc: Unified GuC log
>   drm/i915/guc: Update firmware to v62.0.0
> 
> Michal Wajdeczko (10):
>   drm/i915/guc: Introduce unified HXG messages
>   drm/i915/guc: Update MMIO based communication
>   drm/i915/guc: Update CTB response status definition
>   drm/i915/guc: Add flag for mark broken CTB
>   drm/i915/guc: New definition of the CTB descriptor
>   drm/i915/guc: New definition of the CTB registration action
>   drm/i915/guc: New CTB based communication
>   drm/i915/doc: Include GuC ABI documentation
>   drm/i915/guc: Kill guc_clients.ct_pool
>   drm/i915/guc: Kill ads.client_info
> 
>  Documentation/gpu/i915.rst                    |   8 +
>  .../gpu/drm/i915/gt/uc/abi/guc_actions_abi.h  | 107 ++++++
>  .../gt/uc/abi/guc_communication_ctb_abi.h     | 128 +++++--
>  .../gt/uc/abi/guc_communication_mmio_abi.h    |  65 ++--
>  .../gpu/drm/i915/gt/uc/abi/guc_messages_abi.h | 213 +++++++++++
>  drivers/gpu/drm/i915/gt/uc/intel_guc.c        | 107 ++++--
>  drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c    |  45 +--
>  drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c     | 356 +++++++++---------
>  drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h     |   6 +-
>  drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h   |  75 +---
>  drivers/gpu/drm/i915/gt/uc/intel_guc_log.c    |  29 +-
>  drivers/gpu/drm/i915/gt/uc/intel_guc_log.h    |   6 +-
>  drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c      |  26 +-
>  13 files changed, 750 insertions(+), 421 deletions(-)
> 
