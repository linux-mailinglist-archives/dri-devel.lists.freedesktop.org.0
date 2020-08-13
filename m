Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23508243DC1
	for <lists+dri-devel@lfdr.de>; Thu, 13 Aug 2020 18:56:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 313A16EA4B;
	Thu, 13 Aug 2020 16:56:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 397786EA4B
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Aug 2020 16:56:25 +0000 (UTC)
IronPort-SDR: Je55xH3SzXz9t39yjk4uN2ACoC0G3eRvEhkWvR6v8GklfH/q3UeWVJPeHuqBaXcO2z8eva7wTl
 j8YtVRKKqHLQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9712"; a="133797233"
X-IronPort-AV: E=Sophos;i="5.76,309,1592895600"; d="scan'208";a="133797233"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2020 09:56:24 -0700
IronPort-SDR: Uc80LtS6i3tPbPmBcmTkgi9VIQab3bteaqILMZme+KBX0oDIgCn9Td7b7NzxLFjaDyxgIzZ7i4
 RZfJz81L7Gzw==
X-IronPort-AV: E=Sophos;i="5.76,309,1592895600"; d="scan'208";a="470286607"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.27.168])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2020 09:56:23 -0700
Date: Thu, 13 Aug 2020 09:56:22 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: ssermsix <sunilx.kumar.dora.sermsity@intel.com>
Subject: Re: [PATCH libdrm] INTEL: Add PCI ID support to RKL platform
Message-ID: <20200813165622.GH2909565@mdroper-desk1.amr.corp.intel.com>
References: <20200813053338.7166-1-sunilx.kumar.dora.sermsity@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200813053338.7166-1-sunilx.kumar.dora.sermsity@intel.com>
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
Cc: Pankaj.Laxminarayan.Bharadiya@intel.com, Naveen1.Kumar@intel.com,
 hariom.pandey@intel.com, Srinivasa.RaoX.Tottadi@intel.com,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

On Thu, Aug 13, 2020 at 11:03:38AM +0530, ssermsix wrote:
> ---
>  intel/intel_chipset.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/intel/intel_chipset.c b/intel/intel_chipset.c
> index f6e37ee7..c3ce8f51 100644
> --- a/intel/intel_chipset.c
> +++ b/intel/intel_chipset.c
> @@ -35,6 +35,7 @@ static const struct pci_device {
>  	uint16_t gen;
>  } pciids[] = {
>  	/* Keep ids sorted by gen; latest gen first */
> +	INTEL_RKL_IDS(12),
>  	INTEL_TGL_12_IDS(12),
>  	INTEL_EHL_IDS(11),
>  	INTEL_ICL_11_IDS(11),
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
(916) 356-2795
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
