Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A3A347CE524
	for <lists+dri-devel@lfdr.de>; Wed, 18 Oct 2023 19:43:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3EAA10E442;
	Wed, 18 Oct 2023 17:43:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67DA710E43F;
 Wed, 18 Oct 2023 17:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697651034; x=1729187034;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=9OSjnQVswPsdEBm2KQP6sFWNDLZeZClOycBAmFelUQs=;
 b=a2Vj/VVdcb3X1D6dE+lOaWKg/2eTm4NyH2noU+2nRGLdOzhnVolyHi5B
 6s2rVjRCOa39V3Z7qtxSixwdm0ikOtmWJmPQUd0gJG5D3kWsGqaxDUYCU
 DSVW4/PSwtj59iOMib9oiH3RO3t6A1FyBWzaZbPUj5Xm0HtMQANvs5yfM
 YrW7giENZ3Dtb+otsr/dol8l5QARNb7dfJ7GHOIgXMT0lCC0rH3j2KSid
 /lOMtOqhNsIySNzVgzCBWwjSFNQGA4V1/4LtusVzp5aTyRfJE6Veevshx
 no+j0tbJ8c0EBiHZXjkPKQItfWmbSdiFkRYnaha2KqzSowCC03g0JIPUw w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="450293792"
X-IronPort-AV: E=Sophos;i="6.03,235,1694761200"; d="scan'208";a="450293792"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2023 10:43:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,235,1694761200"; 
   d="scan'208";a="4444314"
Received: from nurfahan-mobl3.gar.corp.intel.com (HELO intel.com)
 ([10.213.159.217])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2023 10:42:42 -0700
Date: Wed, 18 Oct 2023 19:43:42 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Subject: Re: [Intel-gfx] [PATCH v2] drm/i915/mtl: Don't set
 PIPE_CONTROL_FLUSH_L3
Message-ID: <ZTAZTiOKuSvcLR2D@ashyti-mobl2.lan>
References: <20231017195309.2476088-1-vinay.belgaumkar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231017195309.2476088-1-vinay.belgaumkar@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, Nirmoy Das <nirmoy.das@intel.com>,
 dri-devel@lists.freedesktop.org, Mika Kuoppala <mika.kuoppala@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Vinay,

On Tue, Oct 17, 2023 at 12:53:09PM -0700, Vinay Belgaumkar wrote:
> This bit does not cause an explicit L3 flush. We already use
> PIPE_CONTROL_DC_FLUSH_ENABLE for that purpose.
> 
> v2: Use FLUSH_L3 only pre-MTL since spec will likely remain
> the same going forward.
> 
> Cc: Nirmoy Das <nirmoy.das@intel.com>
> Cc: Mika Kuoppala <mika.kuoppala@intel.com>
> Acked-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
> Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

pushed to drm-intel-gt-next.

Thanks,
Andi
