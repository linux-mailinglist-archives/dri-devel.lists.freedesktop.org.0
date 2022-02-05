Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0383B4AA745
	for <lists+dri-devel@lfdr.de>; Sat,  5 Feb 2022 08:15:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 196DB10E614;
	Sat,  5 Feb 2022 07:15:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D88C010E614
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Feb 2022 07:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644045338; x=1675581338;
 h=message-id:date:mime-version:cc:subject:to:references:
 from:in-reply-to:content-transfer-encoding;
 bh=wqxjsPauSARkDVGNFGjAynKzR2PwO1TvvGupa+oiPS4=;
 b=Xf8g8Z0uPjYiIlnpQQR6RdNpyxrvcXc6ItcZE7brsF16nqvZv+J+59/s
 mXCqF1DNdhtzxmdl7MR44xQcfr+bsclwHelcy8VTGVVcBnfHeUl+TP0lQ
 h07xpT1ExeNzY8/ZB6vDaLhApc6cWmaqWW9+Y0Rv/xqwyfYJBnUIkBLWr
 ruaY17lFP4Z0NekPyzVBHODl7RfCbLKEUiAFgamzwjf0fCT+QnyN+MxxR
 ietjq/zAC6h20N5NxGTKRZTEDo7sIln5eI5IJTletLrddxjURtAudk7Ul
 0jLWyYuYioEuOzn9tMKT6Ka+i1zpkzhVShC5GM8ck8gX9bquSLV8GpC/s Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10248"; a="334891037"
X-IronPort-AV: E=Sophos;i="5.88,345,1635231600"; d="scan'208";a="334891037"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2022 23:15:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,345,1635231600"; d="scan'208";a="677305032"
Received: from allen-box.sh.intel.com (HELO [10.239.159.118])
 ([10.239.159.118])
 by fmsmga001.fm.intel.com with ESMTP; 04 Feb 2022 23:15:36 -0800
Message-ID: <59dac4c6-b238-adb1-75a6-d17a260aa0ee@linux.intel.com>
Date: Sat, 5 Feb 2022 15:14:29 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] iommu/vt-d: Remove comment reference to
 iommu_dev_has_feature
Content-Language: en-US
To: Akeem G Abodunrin <akeem.g.abodunrin@intel.com>,
 matthew.d.roper@intel.com, dri-devel@lists.freedesktop.org
References: <20220202023743.28135-1-akeem.g.abodunrin@intel.com>
From: Lu Baolu <baolu.lu@linux.intel.com>
In-Reply-To: <20220202023743.28135-1-akeem.g.abodunrin@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: iommu@lists.linux-foundation.org, baolu.lu@linux.intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/2/22 10:37 AM, Akeem G Abodunrin wrote:
> iommu_dev_has_feature() api has been removed by the commit 262948f8ba573
> ("iommu: Delete iommu_dev_has_feature()") - So this patch removes comment
> about the api to avoid any confusion.
> 
> Signed-off-by: Akeem G Abodunrin <akeem.g.abodunrin@intel.com>
> Cc: Lu Baolu <baolu.lu@linux.intel.com>

It's not a change for iommu/vt-d, but for iommu core.

Please add Joerg in the to list.

Best regards,
baolu

> ---
>   include/linux/iommu.h | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/include/linux/iommu.h b/include/linux/iommu.h
> index de0c57a567c8..bea054f2bd4d 100644
> --- a/include/linux/iommu.h
> +++ b/include/linux/iommu.h
> @@ -153,8 +153,7 @@ struct iommu_resv_region {
>    *			 supported, this feature must be enabled before and
>    *			 disabled after %IOMMU_DEV_FEAT_SVA.
>    *
> - * Device drivers query whether a feature is supported using
> - * iommu_dev_has_feature(), and enable it using iommu_dev_enable_feature().
> + * Device drivers enable the feature via iommu_dev_enable_feature().
>    */
>   enum iommu_dev_features {
>   	IOMMU_DEV_FEAT_AUX,
