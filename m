Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A906C7F5D8A
	for <lists+dri-devel@lfdr.de>; Thu, 23 Nov 2023 12:14:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5614B10E71A;
	Thu, 23 Nov 2023 11:14:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7365E10E71A;
 Thu, 23 Nov 2023 11:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700738071; x=1732274071;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=f96XyUr097Mm9GcRMiQP6oB3PyFc743sh+fNU1O5iBY=;
 b=MvnfpedNTTajIIUOba1HXjI9Mc+LO8+s+icRNO6cIUdqVQ9vhGn7tPwu
 PsAytDm0P3NWaGr60mc7nWkbzJHjcMiqfjq6fF6qgsYm0D6wAjeOB4OR7
 doRHeJEt/xv8nywStWhpHyzkkpDP3UwVUpQ+QdKfqZYeGBsxuOR+0SImp
 /9TvLqfbWkIMxwHRFQqtl1BV6mm3rQXrA5/e5j+VT/qHXMEH4ZF/T2U0A
 tfFF8a/z7QLb+T68KWLtr5xguIDHkAvjYs6YJ1/fL7dGKC1lZbFZKx69S
 gGYrNdC8eZr/EZJxitLKRRwPxjFSajk3aRUq5Yh9EoBFCoevMN/4CE/rM Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="5439205"
X-IronPort-AV: E=Sophos;i="6.04,221,1695711600"; 
   d="scan'208";a="5439205"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2023 03:14:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="890762366"
X-IronPort-AV: E=Sophos;i="6.04,221,1695711600"; d="scan'208";a="890762366"
Received: from amongesa-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.252.57.132])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2023 03:14:24 -0800
Date: Thu, 23 Nov 2023 12:14:21 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Intel-gfx] [PATCH v5 15/20] drivers/gpu/drm/i915/display:
 remove I2C_CLASS_DDC support
Message-ID: <ZV80DQqQthCLMX2P@ashyti-mobl2.lan>
References: <20231123094040.592-1-hkallweit1@gmail.com>
 <20231123094040.592-16-hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231123094040.592-16-hkallweit1@gmail.com>
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
Cc: Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Wolfram Sang <wsa@kernel.org>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, linux-i2c@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Heiner,

On Thu, Nov 23, 2023 at 10:40:35AM +0100, Heiner Kallweit wrote:
> After removal of the legacy EEPROM driver and I2C_CLASS_DDC support in
> olpc_dcon there's no i2c client driver left supporting I2C_CLASS_DDC.
> Class-based device auto-detection is a legacy mechanism and shouldn't
> be used in new code. So we can remove this class completely now.
> 
> Preferably this series should be applied via the i2c tree.
> 
> Acked-by: Jani Nikula <jani.nikula@intel.com>
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks,
Andi
