Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E1394AD326
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 09:23:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED4CD10E381;
	Tue,  8 Feb 2022 08:23:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com
 [185.176.79.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C312C10F805
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Feb 2022 10:51:56 +0000 (UTC)
Received: from fraeml710-chm.china.huawei.com (unknown [172.18.147.207])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4JsjXS1KShz67xjg;
 Mon,  7 Feb 2022 18:47:52 +0800 (CST)
Received: from lhreml724-chm.china.huawei.com (10.201.108.75) by
 fraeml710-chm.china.huawei.com (10.206.15.59) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Mon, 7 Feb 2022 11:51:53 +0100
Received: from [10.47.86.164] (10.47.86.164) by lhreml724-chm.china.huawei.com
 (10.201.108.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.21; Mon, 7 Feb
 2022 10:51:49 +0000
Message-ID: <37dcfcad-ff08-09dd-b35c-a3f90fcaa37f@huawei.com>
Date: Mon, 7 Feb 2022 10:51:45 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v2] iommu/core: Remove comment reference to
 iommu_dev_has_feature
To: Akeem G Abodunrin <akeem.g.abodunrin@intel.com>,
 <matthew.d.roper@intel.com>, <baolu.lu@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>
References: <20220207032322.16667-1-akeem.g.abodunrin@intel.com>
From: John Garry <john.garry@huawei.com>
In-Reply-To: <20220207032322.16667-1-akeem.g.abodunrin@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.47.86.164]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 lhreml724-chm.china.huawei.com (10.201.108.75)
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Tue, 08 Feb 2022 08:23:40 +0000
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
Cc: iommu@lists.linux-foundation.org, hch@lst.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 07/02/2022 03:23, Akeem G Abodunrin wrote:
> iommu_dev_has_feature() api has been removed by the commit 262948f8ba573
> ("iommu: Delete iommu_dev_has_feature()") - So this patch removes comment
> about the api to avoid any confusion.
> 
> Signed-off-by: Akeem G Abodunrin <akeem.g.abodunrin@intel.com>
> Cc: Lu Baolu <baolu.lu@linux.intel.com>
> Reviewed-by: Christoph Hellwig <hch@lst.de>

Reviewed-by: John Garry <john.garry@huawei.com>

BTW, It looks like we can get rid of iommu_ops.dev_has_feat also.

It does not seem to be called, while arm-smmu-v3 driver does provide a 
callback.

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

