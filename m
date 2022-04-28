Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 32361513466
	for <lists+dri-devel@lfdr.de>; Thu, 28 Apr 2022 15:04:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B3EF10E377;
	Thu, 28 Apr 2022 13:04:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24E0410E377;
 Thu, 28 Apr 2022 13:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651151089; x=1682687089;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ZT40+5ypfFrah6Spt7Oh29I2neBL8MrrOa3wJLnFnnQ=;
 b=UNzCpN+uYzI8rVyZHBKRepBCmAbifrsMMFhI5mADHv84vdz1dc9SOmSH
 WF0mUUDdepe7AxFu14rO85N5/TD3Nw3sT2q15vQimIPdYinCRquLV007Q
 xizeZheOAQHYNmXJ3ch/+qHISiGRIzKWhtPOlSQqlP8PR6Sx4czVCv9Bu
 A0XgTJKPNy/PAu/sBe8M/9lJF4Z2qugzht0xpxdFbcZTjAfWoJx2WOieT
 23Rjj5jsDGpxxba0Da3cdsyqggUwGY080kh1vghREZpr3vKlEGOQ9hfU7
 ayQs5HuwIPTXiW8b455n18mPPGiEsegZK5g5f8GlsbKzWXBL7z4e5ojem g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10330"; a="291444560"
X-IronPort-AV: E=Sophos;i="5.91,295,1647327600"; d="scan'208";a="291444560"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2022 06:04:45 -0700
X-IronPort-AV: E=Sophos;i="5.91,295,1647327600"; d="scan'208";a="559659784"
Received: from sbacanu-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.251.217.212])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2022 06:04:44 -0700
Date: Thu, 28 Apr 2022 15:04:41 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [Intel-gfx] [PATCH v2 3/4] drm/i915/xehp: Add compute engine ABI
Message-ID: <YmqQ6UbbjYH5v4yB@intel.intel>
References: <20220428041926.1483683-1-matthew.d.roper@intel.com>
 <20220428041926.1483683-4-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220428041926.1483683-4-matthew.d.roper@intel.com>
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
Cc: Szymon Morek <szymon.morek@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Matt,

On Wed, Apr 27, 2022 at 09:19:25PM -0700, Matt Roper wrote:
> We're now ready to start exposing compute engines to userspace.
> 
> v2:
>  - Move kerneldoc for other engine classes to a separate patch.  (Andi)
> 
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> Cc: Jordan Justen <jordan.l.justen@intel.com>
> Cc: Szymon Morek <szymon.morek@intel.com>
> UMD (mesa): https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/14395
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

looks good,

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks,
Andi
