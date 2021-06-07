Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C6A639E973
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jun 2021 00:19:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8F3C6E532;
	Mon,  7 Jun 2021 22:19:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0507F6E532;
 Mon,  7 Jun 2021 22:19:15 +0000 (UTC)
IronPort-SDR: PwxOVddPLXfc0C0bq0Xfb4sxbpGqm2NSNGuPY3WKmzkEPUtyLFwUWUYXRrkChi+i6Vt/F229hX
 w7y3sT3aTn/Q==
X-IronPort-AV: E=McAfee;i="6200,9189,10008"; a="185097758"
X-IronPort-AV: E=Sophos;i="5.83,256,1616482800"; d="scan'208";a="185097758"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2021 15:19:15 -0700
IronPort-SDR: ADIUi6Tnf4BlfgqJqW0WqNcI3SbQBmp7BkF7cZd4mIWVswWaC8DBNo1hNcStm+mw2C584D8HcX
 YzT/vW0hesDQ==
X-IronPort-AV: E=Sophos;i="5.83,256,1616482800"; d="scan'208";a="476373647"
Received: from dceraolo-mobl.amr.corp.intel.com (HELO [10.209.129.6])
 ([10.209.129.6])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2021 15:19:14 -0700
Subject: Re: [PATCH 00/13] Update firmware to v62.0.0
To: Matthew Brost <matthew.brost@intel.com>, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
References: <20210607180356.165785-1-matthew.brost@intel.com>
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Message-ID: <f270bb24-d9d3-c65e-0944-5d7dcb4f3b30@intel.com>
Date: Mon, 7 Jun 2021 15:19:11 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210607180356.165785-1-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
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
Cc: john.c.harrison@intel.com, Michal.Wajdeczko@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 6/7/2021 11:03 AM, Matthew Brost wrote:
> As part of enabling GuC submission [1] we need to update to the latest
> and greatest firmware. This series does that. This is a destructive
> change. e.g. Without all the patches in this series it will break the
> i915 driver. As such, after we review all of these patches they will
> squashed into a single patch for merging.

Can you resubmit with an added HAX patch for enable_guc=2 after the 
first round of review? none of the machines in CI seems to have 
attempted to load the guc, not even cfl-guc and kbl-guc. If all the 
reviews are good maybe just resubmit the squashed patch and the 
enablement with a CI tag, so we can merge once we get the results.

Daniele

>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>
> [1] https://patchwork.freedesktop.org/series/89844/
>
> John Harrison (3):
>    drm/i915/guc: Support per context scheduling policies
>    drm/i915/guc: Unified GuC log
>    drm/i915/guc: Update firmware to v62.0.0
>
> Michal Wajdeczko (10):
>    drm/i915/guc: Introduce unified HXG messages
>    drm/i915/guc: Update MMIO based communication
>    drm/i915/guc: Update CTB response status definition
>    drm/i915/guc: Add flag for mark broken CTB
>    drm/i915/guc: New definition of the CTB descriptor
>    drm/i915/guc: New definition of the CTB registration action
>    drm/i915/guc: New CTB based communication
>    drm/i915/doc: Include GuC ABI documentation
>    drm/i915/guc: Kill guc_clients.ct_pool
>    drm/i915/guc: Kill ads.client_info
>
>   Documentation/gpu/i915.rst                    |   8 +
>   .../gpu/drm/i915/gt/uc/abi/guc_actions_abi.h  | 107 ++++++
>   .../gt/uc/abi/guc_communication_ctb_abi.h     | 130 +++++--
>   .../gt/uc/abi/guc_communication_mmio_abi.h    |  63 ++--
>   .../gpu/drm/i915/gt/uc/abi/guc_messages_abi.h | 213 +++++++++++
>   drivers/gpu/drm/i915/gt/uc/intel_guc.c        | 107 ++++--
>   drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c    |  45 +--
>   drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c     | 355 +++++++++---------
>   drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h     |   6 +-
>   drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h   |  75 +---
>   drivers/gpu/drm/i915/gt/uc/intel_guc_log.c    |  29 +-
>   drivers/gpu/drm/i915/gt/uc/intel_guc_log.h    |   6 +-
>   drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c      |  26 +-
>   13 files changed, 750 insertions(+), 420 deletions(-)
>

