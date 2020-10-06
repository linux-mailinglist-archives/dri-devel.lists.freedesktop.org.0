Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 235B3285957
	for <lists+dri-devel@lfdr.de>; Wed,  7 Oct 2020 09:22:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53B666E898;
	Wed,  7 Oct 2020 07:22:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nat-hk.nvidia.com (nat-hk.nvidia.com [203.18.50.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCBCF89AC6
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Oct 2020 16:41:27 +0000 (UTC)
Received: from HKMAIL104.nvidia.com (Not Verified[10.18.92.9]) by
 nat-hk.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5f7c9e350000>; Wed, 07 Oct 2020 00:41:25 +0800
Received: from HKMAIL104.nvidia.com (10.18.16.13) by HKMAIL104.nvidia.com
 (10.18.16.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 6 Oct
 2020 16:41:24 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by HKMAIL104.nvidia.com (10.18.16.13) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Frontend Transport; Tue, 6 Oct 2020 16:41:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ik++/tIKMONf8soxqZWTru6PiAx3JVwfLmlv8r6lNMULjW24rzFLY35ZwSQlW04qvc12w4dCwGwa+nrFGRa1NOjYkmB+l7efyFtt4okI+BtnW6Tldq6sRyk+Pmx8pIFJEgsDQmkr1jspPWgati+KPiFsuCdek63lDDvhxs2FTOBUSURBJW5WdDGu3O7XJYK7ZKqKylOHcAZfWmTTgeLUi+8nYrLN6R8pMQM/UPB1wX0k39lDbmK0WL2lhHGtm98oOG5deQmy1zVFkf6V0pytYd399j4EJtLsl+AH6a5vCSqUgAYIId9SN8n+Jen+cov9jQiEGPePSLPL9mHpQoIQbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rTw7KivUQK98FPt1sICh7RNiaGw7fjOYW8Vux1i0+uA=;
 b=c0opHwMBpXPnWkwyuhH/MOB9r0EQd4rkCzD1YcCXGTaxRfipW2Wk05cxB21oUKFJiSFjvezVU/ZB35StxV+AN5vNsJa7qivxXCThlzQb8pKCd2S0ywgMO8wGxyQPIm+1Ha/Pnm4jb3t/W+1uvQxBnNFfFbLH3WJG/MP6L8za2H8j/xJKhSzs1XuZwTEroXRVH3E1X+cYVJQvWccBP0w5Scy8I7lS2xTds6upxPNfi0WnJHv6A4j2Auk46e9Gk7vnIsPqk36WbGCQvyuX8Ul7nOLDc+7cMmQMg8bmSFkR46e5rtoqpX8U/9Iqvg3pFaxhT5JHffzI8qW0i7m3uhlSOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Received: from DM6PR12MB3834.namprd12.prod.outlook.com (2603:10b6:5:14a::12)
 by DM5PR1201MB2490.namprd12.prod.outlook.com (2603:10b6:3:e3::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.38; Tue, 6 Oct
 2020 16:41:22 +0000
Received: from DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::cdbe:f274:ad65:9a78]) by DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::cdbe:f274:ad65:9a78%7]) with mapi id 15.20.3433.044; Tue, 6 Oct 2020
 16:41:22 +0000
Date: Tue, 6 Oct 2020 13:41:20 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the hmm tree
Message-ID: <20201006164120.GI4734@nvidia.com>
References: <20201006203508.3cb3d0e3@canb.auug.org.au>
Content-Disposition: inline
In-Reply-To: <20201006203508.3cb3d0e3@canb.auug.org.au>
X-ClientProxiedBy: BL0PR02CA0114.namprd02.prod.outlook.com
 (2603:10b6:208:35::19) To DM6PR12MB3834.namprd12.prod.outlook.com
 (2603:10b6:5:14a::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (156.34.48.30) by
 BL0PR02CA0114.namprd02.prod.outlook.com (2603:10b6:208:35::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3455.21 via Frontend Transport; Tue, 6 Oct 2020 16:41:22 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1kPq1g-000b5t-Fl; Tue, 06 Oct 2020 13:41:20 -0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1602002485; bh=rTw7KivUQK98FPt1sICh7RNiaGw7fjOYW8Vux1i0+uA=;
 h=ARC-Seal:ARC-Message-Signature:ARC-Authentication-Results:Date:
 From:To:CC:Subject:Message-ID:References:Content-Type:
 Content-Disposition:In-Reply-To:X-ClientProxiedBy:MIME-Version:
 X-MS-Exchange-MessageSentRepresentingType;
 b=o1AtKfVah4ZkmENh33BXicfgkRgyV/wRAciwyIHyhkWqM0Yi75/Ej12Y5UurgEl6H
 icPlXe8CZ+IrR9ruFmMYbJhkaCPOf5YMpZkq3OYS5/Iz/1uRT9m9G0p3V9925AuOI/
 8bh91FaPJsPcH1IOVJD6O6eW+b7QyRSzqYsfXmY0OBhPZGmmAJUT0rac4xdER9Rmac
 dsAjpJ+jwqyQIM5u8NfAAkhDPZZ33qj6wV6t2hQ3bxQW61N2eZB0wDXMUPPR9mgEcz
 sDEW00ePjg6J18bHvDTYJKqZMRgnY8RW6X2COvwu4tnFIIty4+M1oVIrhz6jjYLNv4
 Et9aBqrQVoohA==
X-Mailman-Approved-At: Wed, 07 Oct 2020 07:22:33 +0000
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
Cc: Dave Airlie <airlied@linux.ie>, Leon Romanovsky <leonro@nvidia.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Maor Gottlieb <maorg@nvidia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Oct 06, 2020 at 08:35:08PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the hmm tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
> 
> 
> Caused by commit
> 
>   07da1223ec93 ("lib/scatterlist: Add support in dynamic allocation of SG table from pages")
> 
> interacting with commit
> 
>   707d561f77b5 ("drm: allow limiting the scatter list size.")
> 
> from the drm tree.
> 
> I have added the following merge fix patch
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Tue, 6 Oct 2020 20:22:51 +1100
> Subject: [PATCH] lib/scatterlist: merge fix for "drm: allow limiting the
>  scatter list size."
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
>  drivers/gpu/drm/drm_prime.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
> index 11fe9ff76fd5..83ac901b65a2 100644
> +++ b/drivers/gpu/drm/drm_prime.c
> @@ -807,6 +807,7 @@ struct sg_table *drm_prime_pages_to_sg(struct drm_device *dev,
>  				       struct page **pages, unsigned int nr_pages)
>  {
>  	struct sg_table *sg = NULL;
> +	struct scatterlist *sl;
>  	size_t max_segment = 0;
>  	int ret;
>  
> @@ -820,11 +821,13 @@ struct sg_table *drm_prime_pages_to_sg(struct drm_device *dev,
>  		max_segment = dma_max_mapping_size(dev->dev);
>  	if (max_segment == 0 || max_segment > SCATTERLIST_MAX_SEGMENT)
>  		max_segment = SCATTERLIST_MAX_SEGMENT;
> -	ret = __sg_alloc_table_from_pages(sg, pages, nr_pages, 0,
> +	sl = __sg_alloc_table_from_pages(sg, pages, nr_pages, 0,
>  					  nr_pages << PAGE_SHIFT,
> -					  max_segment, GFP_KERNEL);
> -	if (ret)
> +					  max_segment, NULL, 0, GFP_KERNEL);
> +	if (IS_ERR(sl)) {
> +		ret = PTR_ERR(sl);
>  		goto out;
> +	}
>  
>  	return sg;
>  out:

This looks OK to me, thanks

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
