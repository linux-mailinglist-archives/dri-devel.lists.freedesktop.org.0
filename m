Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F18036E8463
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 00:11:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB21F10EB10;
	Wed, 19 Apr 2023 22:11:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A90910EB0C;
 Wed, 19 Apr 2023 22:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681942268; x=1713478268;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=dQPG+Q3UR6Qz326CbA+0NbXPtIfJnXSYnWtREBHcR2k=;
 b=eA4BqmrsfNdpLF9rAXSgkuAN/ywBYQiUOtRN4Uq6A7be5orAJZpVt7b0
 LxsNbTVrXpEmcb76gCaGxVDlUkrYEyzO4dwBy0N46vzErJ9BKXfg7GsPy
 Dc1pFMY+kx/RZuwsUj3ATQQo6OKRE+SbtVcMLRdk3h0+yDd4BFPwIBS3J
 bST8MxHXipUNBLUPYB9617m1odWdpt9gqxzdACYyBmM1FTkBPAZqmVIB3
 43kCXpdiH4/gUiOS8xLfszhoFJC/jGBJVqhztqg1Ki5awbwJkOavTciUJ
 e785La/T8QEPvLrJDsOwIDYGF1FzTbA+aZsonXzyREwXO1ShnoO8i6wjO w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="373460650"
X-IronPort-AV: E=Sophos;i="5.99,210,1677571200"; d="scan'208";a="373460650"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 15:09:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="641923050"
X-IronPort-AV: E=Sophos;i="5.99,210,1677571200"; d="scan'208";a="641923050"
Received: from mmzakhar-mobl2.ccr.corp.intel.com (HELO intel.com)
 ([10.251.213.234])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 15:09:06 -0700
Date: Thu, 20 Apr 2023 00:09:02 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: fei.yang@intel.com
Subject: Re: [Intel-gfx] [PATCH 5/8] drm/i915/mtl: end support for set
 caching ioctl
Message-ID: <ZEBmfvQ3CcbxFzJ4@ashyti-mobl2.lan>
References: <20230419211219.2574008-1-fei.yang@intel.com>
 <20230419211219.2574008-6-fei.yang@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230419211219.2574008-6-fei.yang@intel.com>
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

On Wed, Apr 19, 2023 at 02:12:16PM -0700, fei.yang@intel.com wrote:
> From: Fei Yang <fei.yang@intel.com>
> 
> The design is to keep Buffer Object's caching policy immutable through
> out its life cycle. This patch ends the support for set caching ioctl
> from MTL onward. While doing that we also set BO's to be 1-way coherent
> at creation time because GPU is no longer automatically snooping CPU
> cache. For UMD's need to fine tune the caching policy for BO's, a follow
> up patch will extend the GEM_CREATE uAPI to allow UMD's specify caching
> mode at BO creation time.
> 
> Signed-off-by: Fei Yang <fei.yang@intel.com>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com> 
Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Andi
