Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 141B95F3760
	for <lists+dri-devel@lfdr.de>; Mon,  3 Oct 2022 22:56:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC0A210E4D7;
	Mon,  3 Oct 2022 20:56:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E009F10E406;
 Mon,  3 Oct 2022 20:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664830593; x=1696366593;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=5JFuCp+8Wk4ieboVdzv748y1JMMemmYHxHZf1BsNXxU=;
 b=JqXienuuhfRoMpg/urMGVEmBQGmJa/75wDCb+s38jP4qmzp4l+lOromx
 c+O05f0FHJLk2JClN1VrPbXJuthWjn0JLQ37p4cF1+Ns8VS8uFI0KF3es
 BMiPIjGL+0/aTNBOs9diPicoBft/5o1/DRXojxe8GoiZRzsZ+gbPKxO78
 h5u+/ndj5ZGsBmXdiMHU7OTvjczFQ60TCPKnDVObFt+M74JhoiVoNH9dp
 Y6CogyOYcRQeczV3VdXLDd/Xod6ncXmzpYql9fylzusw6exuPp4mHxohn
 sL3c3c1abV9osAVnqBgcHggi52sTptMeL8/DJ8u+tGy9aKrUE4bjGCHIq w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10489"; a="285949073"
X-IronPort-AV: E=Sophos;i="5.93,366,1654585200"; d="scan'208";a="285949073"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2022 13:56:10 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10489"; a="654520246"
X-IronPort-AV: E=Sophos;i="5.93,366,1654585200"; d="scan'208";a="654520246"
Received: from kbalinsk-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.213.7.91])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2022 13:56:08 -0700
Date: Mon, 3 Oct 2022 22:56:05 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Badal Nilawar <badal.nilawar@intel.com>
Subject: Re: [Intel-gfx] [PATCH 2/7] drm/i915/hwmon: Add HWMON current
 voltage support
Message-ID: <YztMZc7wWCDuRhUi@ashyti-mobl2.lan>
References: <20220927055020.3499420-1-badal.nilawar@intel.com>
 <20220927055020.3499420-3-badal.nilawar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220927055020.3499420-3-badal.nilawar@intel.com>
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
Cc: linux-hwmon@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Badal,

[...]

>  static void
>  hwm_get_preregistration_info(struct drm_i915_private *i915)
>  {
> +	struct i915_hwmon *hwmon = i915->hwmon;
> +
> +	if (IS_DG1(i915) || IS_DG2(i915))

why not GRAPHICS_VER(i915) >= 12 here?

Andi

> +		hwmon->rg.gt_perf_status = GEN12_RPSTAT1;
> +	else
> +		hwmon->rg.gt_perf_status = INVALID_MMIO_REG;
>  }
>  
>  void i915_hwmon_register(struct drm_i915_private *i915)
> -- 
> 2.25.1
