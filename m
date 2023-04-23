Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 174196EBC30
	for <lists+dri-devel@lfdr.de>; Sun, 23 Apr 2023 02:46:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A4C210E2C6;
	Sun, 23 Apr 2023 00:46:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5D3410E2A9;
 Sun, 23 Apr 2023 00:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682210757; x=1713746757;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Z5ENp38Z5tRl05EjngXEpa8c5zlKMMtpUnM8BVxPcTA=;
 b=Ogn51WjC+2jHw0LUumTODXCOdma4uRLltGeUAgp79m1mJZxBY9efJ4QB
 SFwsRailGK09Dyp13/mRmm9Tz89iBhm11H07wKrPtEOnwYAahAQa37AQi
 3lq48clqbN1TmbeLPy9nbrU9oYHBF8/0/sklKiLNMQiGRe1VXxC01m309
 E4NLCrNsdBNOgZ74rZKZegsr7Md7SD+YPtb1Ynr9LW+Z/yj6G2xYHu9q3
 JNXGCBhnM9cB8TnQ+P7JdxyAXuZbEMq/BE1lNFcL/E9SCjeIguFG91jPc
 B5Fc421vlgrIWj2c6ZP5nnFjozZ8I5fs5RHQXwPfDo8/tVbu/QoqonQlw Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10688"; a="325816993"
X-IronPort-AV: E=Sophos;i="5.99,219,1677571200"; d="scan'208";a="325816993"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2023 17:45:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10688"; a="695318338"
X-IronPort-AV: E=Sophos;i="5.99,219,1677571200"; d="scan'208";a="695318338"
Received: from ilosev-mobl1.ccr.corp.intel.com (HELO intel.com)
 ([10.252.58.210])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2023 17:45:52 -0700
Date: Sun, 23 Apr 2023 02:45:47 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
Subject: Re: [PATCH 0/2] Use i915 instead of dev_priv
Message-ID: <ZER/u/tSEX8mXC7R@ashyti-mobl2.lan>
References: <20230421134654.273182-1-andi.shyti@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230421134654.273182-1-andi.shyti@linux.intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Andi Shyti <andi.shyti@kernel.org>,
 Intel GFX <intel-gfx@lists.freedesktop.org>,
 DRI Devel <dri-devel@lists.freedesktop.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, Apr 21, 2023 at 03:46:52PM +0200, Andi Shyti wrote:
> Hi,
> 
> just another "Friday patch". While reviewing some patches from
> Tejas I found a bit confusing the use of dev_priv__ inside the
> for_each_engine(), perhaps it should be moved inside the gt/?
> 
> As I was at it I made the /dev_priv/i915/ change which is still
> harmless. Next in queue is to change the i915_irq.h, which is a
> bit tricky (but not much) as the "dev_priv" is hardcoded inside
> some defines.
> 
> Andi
> 
> Andi Shyti (2):
>   drm/i915/i915_drv: Use proper parameter naming in for_each_gt()
>   drm/i915/i915_drv: Use i915 instead of dev_priv insied the file_priv
>     structure
> 
>  drivers/gpu/drm/i915/i915_drv.h | 462 ++++++++++++++++----------------
>  1 file changed, 231 insertions(+), 231 deletions(-)

Pushed to dmr-intel-gt-next.

Thanks Rodrigo and Andrzej for your review.

Andi
