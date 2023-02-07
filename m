Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 392BC68E372
	for <lists+dri-devel@lfdr.de>; Tue,  7 Feb 2023 23:34:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9FE710E207;
	Tue,  7 Feb 2023 22:34:21 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A57510E207;
 Tue,  7 Feb 2023 22:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675809260; x=1707345260;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=6C3047gH3FD39X8xZoeHWp4MEl6wA0xmvOgzGwhHcdM=;
 b=ObZaq4eeDbXTrgCnOv0zcJstTnlGeREH62TXviAl1OysvuKroerh9EJT
 oYM1aqPzbCqDz6Y1yHmGf2ya4mPN7OPaxCKAZ5WcLRNneDf5Sp2L+sCbI
 Q+bR6OLQ31tlb1ZdE+GLN0QU9dxJlS1qvPLYi4GHTyeq7AygA/8yRGUo+
 +zIxn36lS/xXy0YRIGobjO1Uc1yuOex55Aayg7Dnf/iFKv6kJcGnCJnJY
 yhOsX4RgK2FB7Lv4aH/najkwCIS0VUlcpoemrHJ5aQDkGyPepT/nWiCs5
 4rO9HGqs2rZewzd65+FCSK79hdWHs0ihbuxZeGP/5rqQJuEruwAheNiBE A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="313290132"
X-IronPort-AV: E=Sophos;i="5.97,279,1669104000"; d="scan'208";a="313290132"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2023 14:34:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="775745571"
X-IronPort-AV: E=Sophos;i="5.97,279,1669104000"; d="scan'208";a="775745571"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmsmga002.fm.intel.com with ESMTP; 07 Feb 2023 14:34:17 -0800
Received: from [10.249.149.185] (mwajdecz-MOBL.ger.corp.intel.com
 [10.249.149.185])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 923E237838;
 Tue,  7 Feb 2023 22:34:16 +0000 (GMT)
Message-ID: <bf48f3bb-6cf1-49fb-d3b9-f0738c404516@intel.com>
Date: Tue, 7 Feb 2023 23:34:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.6.1
Subject: Re: [PATCH v2 0/6] More drm_dbg to guc_dbg changes
To: John.C.Harrison@Intel.com, Intel-GFX@Lists.FreeDesktop.Org
References: <20230207050717.1833718-1-John.C.Harrison@Intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20230207050717.1833718-1-John.C.Harrison@Intel.com>
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
Cc: DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 07.02.2023 06:07, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
> 
> Update more print messages to the new scheme.
> 
> v2: Also change all errors to %pe rather than %d (MichalW).
> Few other tweaks.
> 
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>

LGTM, series is

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

> 
> 
> John Harrison (6):
>   drm/i915/guc: More debug print updates - UC firmware
>   drm/i915/guc: More debug print updates - GSC firmware
>   drm/i915/guc: More debug print updates - GuC reg capture
>   drm/i915/guc: More debug print updates - GuC selftests
>   drm/i915/guc: More debug print updates - GuC SLPC
>   drm/i915/guc: More debug print updates - GuC logging
> 
>  drivers/gpu/drm/i915/gt/intel_gt_print.h      |   3 +
>  drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c     |   9 +-
>  drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c     |   7 +-
>  .../gpu/drm/i915/gt/uc/intel_guc_capture.c    |  51 ++++----
>  drivers/gpu/drm/i915/gt/uc/intel_guc_log.c    |   3 +-
>  drivers/gpu/drm/i915/gt/uc/intel_guc_print.h  |   3 +
>  drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c     |   8 +-
>  drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c   |  61 ++++-----
>  drivers/gpu/drm/i915/gt/uc/intel_uc.c         |  42 +++----
>  drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c      | 116 +++++++++---------
>  drivers/gpu/drm/i915/gt/uc/selftest_guc.c     |  42 ++++---
>  .../drm/i915/gt/uc/selftest_guc_hangcheck.c   |  23 ++--
>  .../drm/i915/gt/uc/selftest_guc_multi_lrc.c   |  11 +-
>  13 files changed, 174 insertions(+), 205 deletions(-)
> 
