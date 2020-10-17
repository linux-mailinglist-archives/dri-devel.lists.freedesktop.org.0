Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F821291409
	for <lists+dri-devel@lfdr.de>; Sat, 17 Oct 2020 21:05:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C7396E405;
	Sat, 17 Oct 2020 19:04:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nat-hk.nvidia.com (nat-hk.nvidia.com [203.18.50.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B83E56F3EA
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Oct 2020 00:18:07 +0000 (UTC)
Received: from HKMAIL104.nvidia.com (Not Verified[10.18.92.77]) by
 nat-hk.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5f8a383b0000>; Sat, 17 Oct 2020 08:18:03 +0800
Received: from HKMAIL104.nvidia.com (10.18.16.13) by HKMAIL104.nvidia.com
 (10.18.16.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sat, 17 Oct
 2020 00:17:56 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.175)
 by HKMAIL104.nvidia.com (10.18.16.13) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Frontend Transport; Sat, 17 Oct 2020 00:17:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j7FT+UHyBM1rXsBxDPdrbgjRqAiFjj/SybQT5xlSAFNt/nW1YTcFdbam75OO1kOJ4rKn5ydQs9fXxry1QDX+700/e9EdNZVQrtc9ynP+GTGbHA+XaZXrScmIce+17HlgdtxVQe4Zsc5FAyjPnoFPhaOOFh1xLkKzczrkHxwgdAtJGKL1WrDZSHPAYWeVjlM5Q/ds/7l67KkHlIHQV8wuX7hLJMLSUOZk2qIZBZiKKlJpjKnRxAuHUEmV0jr728wfzCfrJ0Ugf1Xa0dJQkL/LYu0VwncK7qDrnf9jGmhWILzVxTzsn4JzG0fFwBn4x7H/YP+ruZcH4AdCh4huQizLLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hDC+cLdTvDs7cePMhIVkbmioJWl/ykLyDE/oZnOBvmE=;
 b=dBe/wnLaGcO2du2RrOJV9ipBUFb7jESNxMWINJTTEXMe1ygdScFU3OVu2cCMDj93htDHA4F/MtqT22JzjH1UtCqSHnfRb9WsCLt1F36RAfNhkySxli5dYctxnThN4m6PdPbQxFwhn3f9MZBECo5JouMPAwK0KJa+nuunAlYd979b9YHufWjWJhqOY+ym02Za32lB0ozRLrA9Bp0DsTiJTy2+ZowCn2hperNCEsfrjhgxXVcLHoEareIvlMcPGphN91x38yeFycGyUwdlcrz8+MHGf+ysZMxk5N65GAXYQZD7qT8Uu9PiDfZFHpc7b8SJ8wjud3BAXDWfEQYhil73xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Received: from DM6PR12MB3834.namprd12.prod.outlook.com (2603:10b6:5:14a::12)
 by DM6PR12MB3019.namprd12.prod.outlook.com (2603:10b6:5:3d::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.21; Sat, 17 Oct
 2020 00:17:53 +0000
Received: from DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::cdbe:f274:ad65:9a78]) by DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::cdbe:f274:ad65:9a78%7]) with mapi id 15.20.3477.027; Sat, 17 Oct 2020
 00:17:53 +0000
Date: Fri, 16 Oct 2020 21:17:51 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Jianxin Xiong <jianxin.xiong@intel.com>
Subject: Re: [PATCH v5 3/5] RDMA/uverbs: Add uverbs command for dma-buf based
 MR registration
Message-ID: <20201017001751.GA334582@nvidia.com>
References: <1602799375-138277-1-git-send-email-jianxin.xiong@intel.com>
Content-Disposition: inline
In-Reply-To: <1602799375-138277-1-git-send-email-jianxin.xiong@intel.com>
X-ClientProxiedBy: BL0PR02CA0029.namprd02.prod.outlook.com
 (2603:10b6:207:3c::42) To DM6PR12MB3834.namprd12.prod.outlook.com
 (2603:10b6:5:14a::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (156.34.48.30) by
 BL0PR02CA0029.namprd02.prod.outlook.com (2603:10b6:207:3c::42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3477.21 via Frontend Transport; Sat, 17 Oct 2020 00:17:52 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1kTZux-001P58-Gy; Fri, 16 Oct 2020 21:17:51 -0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1602893883; bh=hDC+cLdTvDs7cePMhIVkbmioJWl/ykLyDE/oZnOBvmE=;
 h=ARC-Seal:ARC-Message-Signature:ARC-Authentication-Results:Date:
 From:To:CC:Subject:Message-ID:References:Content-Type:
 Content-Disposition:In-Reply-To:X-ClientProxiedBy:MIME-Version:
 X-MS-Exchange-MessageSentRepresentingType;
 b=IkMSJFx9RllQvIvNQT9oDT0UxX3jU//md25XDWl2SxWeOrWponQSR+deEUDi3ztD7
 L+kWWrGy3jjICaDQOTBQLERBeRNmOBBJutc8EuBH0EGS4APVHcvUO+j5giLvzlYw8g
 gp7nEudtxxTTduRg5PSbQx4BoQ5nPejrJaYVHauTq6lZB8bhV0m32dyJLhjcHV8Z/R
 G9jqokvQuIpduewyroDiXFrtBlivMH5WpoTAXX4tarW/4AWF4bdQc56pEtq94QG2HN
 aXGxPlMF4HOEGT8mB8m4JxaDA3BSe5EHcppcKltfue7YCJNfxXTDDiZth5uW1oeNlv
 fa34YPpOjsqNQ==
X-Mailman-Approved-At: Sat, 17 Oct 2020 19:04:47 +0000
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
Cc: Leon Romanovsky <leon@kernel.org>, linux-rdma@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Doug
 Ledford <dledford@redhat.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 15, 2020 at 03:02:55PM -0700, Jianxin Xiong wrote:
> Implement a new uverbs ioctl method for memory registration with file
> descriptor as an extra parameter.
> 
> Signed-off-by: Jianxin Xiong <jianxin.xiong@intel.com>
> Reviewed-by: Sean Hefty <sean.hefty@intel.com>
> Acked-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> Acked-by: Christian Koenig <christian.koenig@amd.com>
> Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>  drivers/infiniband/core/uverbs_std_types_mr.c | 112 ++++++++++++++++++++++++++
>  include/uapi/rdma/ib_user_ioctl_cmds.h        |  14 ++++
>  2 files changed, 126 insertions(+)
> 
> diff --git a/drivers/infiniband/core/uverbs_std_types_mr.c b/drivers/infiniband/core/uverbs_std_types_mr.c
> index 9b22bb5..e54459f 100644
> +++ b/drivers/infiniband/core/uverbs_std_types_mr.c
> @@ -1,5 +1,6 @@
>  /*
>   * Copyright (c) 2018, Mellanox Technologies inc.  All rights reserved.
> + * Copyright (c) 2020, Intel Corporation.  All rights reserved.
>   *
>   * This software is available to you under a choice of one of two
>   * licenses.  You may choose to be licensed under the terms of the GNU
> @@ -178,6 +179,85 @@ static int UVERBS_HANDLER(UVERBS_METHOD_QUERY_MR)(
>  	return IS_UVERBS_COPY_ERR(ret) ? ret : 0;
>  }
>  
> +static int UVERBS_HANDLER(UVERBS_METHOD_REG_DMABUF_MR)(
> +	struct uverbs_attr_bundle *attrs)
> +{
> +	struct ib_uobject *uobj =
> +		uverbs_attr_get_uobject(attrs, UVERBS_ATTR_REG_DMABUF_MR_HANDLE);
> +	struct ib_pd *pd =
> +		uverbs_attr_get_obj(attrs, UVERBS_ATTR_REG_DMABUF_MR_PD_HANDLE);
> +	struct ib_device *ib_dev = pd->device;
> +
> +	u64 start, length, virt_addr;
> +	u32 fd, access_flags;
> +	struct ib_mr *mr;
> +	int ret;
> +
> +	if (!ib_dev->ops.reg_user_mr_dmabuf)
> +		return -EOPNOTSUPP;
> +
> +	ret = uverbs_copy_from(&start, attrs,
> +			       UVERBS_ATTR_REG_DMABUF_MR_ADDR);

This should be called OFFSET uniformly here and in all the call chain
below. Not start and not addr.

> +	if (ret)
> +		return ret;
> +
> +	ret = uverbs_copy_from(&length, attrs,
> +			       UVERBS_ATTR_REG_DMABUF_MR_LENGTH);
> +	if (ret)
> +		return ret;
> +
> +	ret = uverbs_copy_from(&virt_addr, attrs,
> +			       UVERBS_ATTR_REG_DMABUF_MR_HCA_VA);

I've been trying to call this IOVA

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
