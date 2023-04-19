Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61FDC6E8402
	for <lists+dri-devel@lfdr.de>; Wed, 19 Apr 2023 23:57:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1F6610EB14;
	Wed, 19 Apr 2023 21:57:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A12710E1F4;
 Wed, 19 Apr 2023 21:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681941423; x=1713477423;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=aXxIdgiOyXZJ9okendt+y5TzUg/k31o/n+nAtkb8YEA=;
 b=Gxx9Wnq/dOBkZ5nW27mroUql3kTxU+PvXRzZ/sMBGlP4VWNVSb+OWTvf
 GAniH5SF9u1pTtcl38cHVXAX+XDONz8ecMLZh7Bp5+LbBlg6ixrHAc974
 unI0J5y/1sigj0BYbKksOPUmDcDfeAYdBNn/FfpXjyzbopMRJJuwzNx4B
 lQ6boMtOHMwSJHM70OtUrM4CTKSWdN/tWB7e2bkSBWgRGpY8yg2EUGtgy
 k64lUdB2yk63aYTi0WC4SR+wBZM9XX8c46tLMnxy2aDlOsUDuK8YqkT3W
 qqZHBjS/B93jylmOTMCJcjmuDulOsFgI/zsQbPFB5K6B1DycxtgltkvvT w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="325180492"
X-IronPort-AV: E=Sophos;i="5.99,210,1677571200"; d="scan'208";a="325180492"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 14:57:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="835467646"
X-IronPort-AV: E=Sophos;i="5.99,210,1677571200"; d="scan'208";a="835467646"
Received: from mmzakhar-mobl2.ccr.corp.intel.com (HELO intel.com)
 ([10.251.213.234])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 14:57:00 -0700
Date: Wed, 19 Apr 2023 23:56:57 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: fei.yang@intel.com
Subject: Re: [Intel-gfx] [PATCH 1/8] drm/i915/mtl: Set has_llc=0
Message-ID: <ZEBjqa0W9PflR9RX@ashyti-mobl2.lan>
References: <20230419211219.2574008-1-fei.yang@intel.com>
 <20230419211219.2574008-2-fei.yang@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230419211219.2574008-2-fei.yang@intel.com>
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

Hi Fei,

On Wed, Apr 19, 2023 at 02:12:12PM -0700, fei.yang@intel.com wrote:
> From: Fei Yang <fei.yang@intel.com>
> 
> On MTL, LLC is not shared between GT and CPU, set has_llc=0.
> 
> Signed-off-by: Fei Yang <fei.yang@intel.com>

just an unanswered questino from Nirmoy:

This statement is bit unclear to me.  I would say "On MTL, LLC
is not shared between GT and CPU"

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>

Andi
