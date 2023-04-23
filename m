Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A6AA6EBC2B
	for <lists+dri-devel@lfdr.de>; Sun, 23 Apr 2023 02:27:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E3B010E20E;
	Sun, 23 Apr 2023 00:27:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE74210E20E;
 Sun, 23 Apr 2023 00:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682209630; x=1713745630;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=/+9bs1+ST4zNnSFuHELbctUUVMFnD3Y6W7dXwXdWwog=;
 b=jGwTUZ33SVazLVjJ1X3DHW9GzEikgY/oqvZemNWDAZGkmxGY4BuaDNUH
 53cE8/i8JuoUvWXudZMQqLT1+lzTDQDOzqFWlbpqvn2OkmhjBMBFc22Kf
 StlUt8zDj96uCMeJRIdNzhQtv5MyYrHoYJUVu7/CNrJ6dO75E4gVtXkN4
 El2dfcGgCeDIfBc4JPqaKRF/nC0Ahynv1kyfsZbRZ8CsZ6Pd4NBZF2Kut
 8NZStSPsMVSNcRbq0hMAwIxbOqZYKSNPferYt1tKqR68xjhj3GgaggCYk
 UAWY9kk+ZMCOjPsNe17iO8i4Ji+Lx7NuZalQyAM1FTxcvz45XkynU/f+S w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10688"; a="346235190"
X-IronPort-AV: E=Sophos;i="5.99,219,1677571200"; d="scan'208";a="346235190"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2023 17:27:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10688"; a="723142820"
X-IronPort-AV: E=Sophos;i="5.99,219,1677571200"; d="scan'208";a="723142820"
Received: from ilosev-mobl1.ccr.corp.intel.com (HELO intel.com)
 ([10.252.58.210])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2023 17:27:04 -0700
Date: Sun, 23 Apr 2023 02:27:01 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
Subject: Re: [PATCH v2 0/2] Define MOCS and PAT tables for MTL
Message-ID: <ZER7VWawzTSW+9GB@ashyti-mobl2.lan>
References: <20230421182535.292670-1-andi.shyti@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230421182535.292670-1-andi.shyti@linux.intel.com>
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
Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>,
 Intel GFX <intel-gfx@lists.freedesktop.org>,
 Lucas Martins De Marchi <lucas.demarchi@intel.com>,
 DRI Devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Andi Shyti <andi.shyti@kernel.org>,
 Fei Yang <fei.yang@intel.com>, Matt Roper <matthew.d.roper@intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, Apr 21, 2023 at 08:25:33PM +0200, Andi Shyti wrote:
> Hi,
> 
> just extracting this patch from Fei's series.
> 
> Andi
> 
> Changelog:
> ==========
> v1 -> v2:
> Taken from Fei's new series: https://patchwork.freedesktop.org/series/115980/
>  - Removed unnecessary defines
>  - Place the selftest patches in a different patch
> 
> Fei Yang (1):
>   drm/i915/mtl: fix mocs selftest
> 
> Madhumitha Tolakanahalli Pradeep (1):
>   drm/i915/mtl: Define MOCS and PAT tables for MTL
> 
>  drivers/gpu/drm/i915/gt/intel_gt_regs.h |  6 ++-
>  drivers/gpu/drm/i915/gt/intel_gtt.c     | 47 ++++++++++++++++-
>  drivers/gpu/drm/i915/gt/intel_gtt.h     |  8 +++
>  drivers/gpu/drm/i915/gt/intel_mocs.c    | 70 ++++++++++++++++++++++++-
>  drivers/gpu/drm/i915/gt/selftest_mocs.c |  3 +-
>  5 files changed, 130 insertions(+), 4 deletions(-)

Pushed to drm-intel-gt-nex.

Thanks,
Andi
