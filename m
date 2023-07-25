Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35EC6761ACF
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jul 2023 15:58:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04CB610E3EA;
	Tue, 25 Jul 2023 13:58:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14CCD10E3DC;
 Tue, 25 Jul 2023 13:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690293521; x=1721829521;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=pwjarub5hxpqZ9pO2xQXqXecdBzvAsuSVdAbFcrLqaE=;
 b=BmXKfxcb4B4cLaueSG1FbdpqD5dCVH16Y43LkO38ulFTolOE2oyOuW3w
 4x4+bI/1MswjJzsIT0Gmvlfo7JSwxgW37mQVbxtXZU/ML0v0lXw/1Q4rf
 b0J2kpCDpWKSKrQgjGyxmX7waYgsdbU2MAuwM/ZXq9+lB/Qe9FVWhIKl+
 HtaDG0VSJfteLK4QVqw8uaqJcSviJGorQP07aLa7APlKWlIftppHOu3NE
 vS/rn1J+Ol68jnyTrJeKwlnLij6Wk7veAxw5VdfYmMFxK01pYwQXS3WRx
 DhgyiH9y/8I034h40L3NZi5gg8L6XjFItogFUgo5gPsNGd349ywQrJSR7 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="431532597"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; d="scan'208";a="431532597"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2023 06:58:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="791403492"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; d="scan'208";a="791403492"
Received: from kshutemo-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.249.37.237])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2023 06:58:39 -0700
Date: Tue, 25 Jul 2023 15:58:36 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/huc: silence injected failure in
 the load via GSC path
Message-ID: <ZL/VDHoaQza3YxHx@ashyti-mobl2.lan>
References: <20230720230505.224659-1-daniele.ceraolospurio@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230720230505.224659-1-daniele.ceraolospurio@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniele,

On Thu, Jul 20, 2023 at 04:05:05PM -0700, Daniele Ceraolo Spurio wrote:
> If we can't load the HuC due to an injected failure, we don't want
> to throw and error and trip CI. Using the gt_probe_error macro for
> logging ensure that the error is only printed if it wasn't explicitly
> injected.
> 
> Link: https://gitlab.freedesktop.org/drm/intel/-/issues/7061
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com> 

Andi
