Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7E4245556A
	for <lists+dri-devel@lfdr.de>; Thu, 18 Nov 2021 08:19:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E590A6E9C8;
	Thu, 18 Nov 2021 07:19:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2062.outbound.protection.outlook.com [40.107.96.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 637656E9F9;
 Thu, 18 Nov 2021 07:19:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IoOsxkbKt898PdWvbMFzvimwxyJUG9CRAesBhO5Am3XUIB+8Uvb3DyVWPB9qA3O5fvr8Y1YVdC4niNMMVYqkbKKpm1SV6X/P0P+NnFwZNFGVCHEHWXDJtXSMFId/q1Jpr+lfjBLejr64qZIwnSC+Neh8Y1TCzqQ0QSFtmiLvzv+Fm9XivH2E4xVITNl1qXuSvvx+ovlqlUVeaaJDgrGRhEqCcVK1h2AMMMf0cLGy96r8aeGcUMVna1Wk5cBWgggn58ZJpcwCCVmt+WXrlXvZjKHbDH3cZiY2y8TM8nvm9B/HpG0OOeeYKywnMnFRv84Y8eVP4B5aWlbS/GClGEA4zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zVxmmz55dKukc6wHmDEnAyBXiYT9S5ygyCgDGCyPJgQ=;
 b=LJ1MqbZMUHitXwinYLt8SLQerq+ZH5vJWH5AcIxAuvrrZlkii2g2/jEnawbR+o8CpUT0WU7wR1TqwIk1qdPrbx7t+yO3MfWk6ZtiZoh+dnltTOUsVm6RHzqW5HvUnmfCbwKT8iNfqtJ5pg8rB42JGy4tEq7SdUYSJekCwLMBriBgDfcGNWSYKi/2771cO5tLG0cUE+tYsLmGortynfqsOC5kIVPijIqDmFbipEQ7hy8CScqZpynhV2yey/+SWImBAKuMJ1MQ0lr1slIsM6JksDQLPhQFgQPRp8tPXoVoeTq5dbQMn4viUz7lbGESukPBss6DkYeFssOKle3uwTjG9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zVxmmz55dKukc6wHmDEnAyBXiYT9S5ygyCgDGCyPJgQ=;
 b=jDJ6ggmaKWYkTl6L1elJWXmDIxonu8LCiDDBWoCj/qXBXSUbFzdPtuVOCdjZBV3+/suNu/NVuGCM5k79PDmR20hfPFtUzFTJLAh7+/i8uWgRbGCobiqQ0YjZSh1OcFVYVt9apFisP3693Wpx7uPZqTRn+Rd9KF8p9aXtUZG5qNMueVcKMjROs38/ZSpr7Ppiu96dolEyudDTpCGEgO4mloL2pyVum+XehBNsMr651UjkbfHNHoIoZpKhWAJTCfYXLJSYs07AnymhMSujynIAQjMyqe66FLzHBMKQ3rC6DBJh+jRPRkVkI1Tw8XAtSt9Bg6CYzG4tzYk+53MKrXRgxg==
Received: from MWHPR2201CA0042.namprd22.prod.outlook.com
 (2603:10b6:301:16::16) by DM4PR12MB5039.namprd12.prod.outlook.com
 (2603:10b6:5:38a::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.15; Thu, 18 Nov
 2021 07:19:26 +0000
Received: from CO1NAM11FT040.eop-nam11.prod.protection.outlook.com
 (2603:10b6:301:16:cafe::17) by MWHPR2201CA0042.outlook.office365.com
 (2603:10b6:301:16::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19 via Frontend
 Transport; Thu, 18 Nov 2021 07:19:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; lists.freedesktop.org; dkim=none (message not
 signed) header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 CO1NAM11FT040.mail.protection.outlook.com (10.13.174.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4713.20 via Frontend Transport; Thu, 18 Nov 2021 07:19:25 +0000
Received: from nvdebian.localnet (172.20.187.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Thu, 18 Nov
 2021 07:19:20 +0000
From: Alistair Popple <apopple@nvidia.com>
To: <akpm@linux-foundation.org>, <Felix.Kuehling@amd.com>,
 <linux-mm@kvack.org>, <rcampbell@nvidia.com>, <linux-ext4@vger.kernel.org>,
 <linux-xfs@vger.kernel.org>, Alex Sierra <alex.sierra@amd.com>
Subject: Re: [PATCH v1 6/9] lib: test_hmm add module param for zone device type
Date: Thu, 18 Nov 2021 18:19:16 +1100
Message-ID: <3407110.cQXnMkeciP@nvdebian>
In-Reply-To: <20211115193026.27568-7-alex.sierra@amd.com>
References: <20211115193026.27568-1-alex.sierra@amd.com>
 <20211115193026.27568-7-alex.sierra@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Originating-IP: [172.20.187.5]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0a0e1548-8a66-407c-c6fb-08d9aa63c087
X-MS-TrafficTypeDiagnostic: DM4PR12MB5039:
X-Microsoft-Antispam-PRVS: <DM4PR12MB503938DAA438AC3BD401B7E0DF9B9@DM4PR12MB5039.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wuQWs1rOwdgaqWh5d6PKSMdYiSeMMSanyiixjfCl50fMB1VnXkqvQuQJ8RUMTyi/EYK4SwnNEf4DLJtWNO4Y4yiH/nqC/i6FKkAsmbmkX/wrHtUMEPNc9950UbL1UQque5Y5CqUS+P+UW2asqlW/gepQj5UydPwTO5Yuh7qMHadnUeSGncT4gcBvRvSOy1PtWReu8uZobfhFghSLWE2hYBjOlSu6CvH4HSnIZkTYBsDt3hJKsn74/od6ontSPwQ0m/XZw521vB1VZHwfY19jFNJdPcFENGjIcpbLAIcEalOkGjyvpOR6xUXhnCdw6zIDxwJCBS/eQ8EoFBYa0yH03RUECBxy/JcQugsXqMCLy4D2A+xb6oOydT0cGvH0YrQFMODynXs7MTmnqYrN1yKlTdJxH5UR92kp/pSVMAy+O2STaYKpYNAb3hYifc5JowMogUWj8M9eS0dD5G2UJ8SQiVSRxxBHVFrqzA+yyh7+R2hScBRlbghaXMtCd4CuOs43pY3iNT+erVOnM/G6Z0ErJ+b0lvU1UyTj22x41anzV6Vm1X5A8tt94NrgSLOvuiGQFvcutVBGpDckhMfB52KfhE69IUFcx/Z30LPTJojPXeJmaCw2wksggNUgdTAAoeueMDQzGEBLUuqpHQamcRLdALjkkckyvgOjCnQEzG5eLdvUKjsM4kW2rXjnvDdndfzqHxFIxAPq6rON5Knk7xPJ78zYm+qqlH8zVeARDr7Qr28=
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(70206006)(26005)(70586007)(86362001)(82310400003)(47076005)(9686003)(426003)(336012)(33716001)(16526019)(186003)(508600001)(36860700001)(8676002)(8936002)(2906002)(7416002)(36906005)(6666004)(316002)(83380400001)(54906003)(7636003)(356005)(5660300002)(110136005)(9576002)(4326008)(334744004);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2021 07:19:25.6984 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a0e1548-8a66-407c-c6fb-08d9aa63c087
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT040.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5039
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
Cc: amd-gfx@lists.freedesktop.org, willy@infradead.org, jglisse@redhat.com,
 dri-devel@lists.freedesktop.org, jgg@nvidia.com, hch@lst.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tuesday, 16 November 2021 6:30:23 AM AEDT Alex Sierra wrote:
> In order to configure device coherent in test_hmm, two module parameters
> should be passed, which correspond to the SP start address of each
> device (2) spm_addr_dev0 & spm_addr_dev1. If no parameters are passed,
> private device type is configured.

Thanks for taking the time to add proper tests for this, as previously
mentioned I don't like the need for module parameters but understand why these
are more difficult to avoid.

However as also mentioned previously the restriction of being able to test only
private *or* coherent device pages is unnecessary and makes testing both types harder, especially if we need to test migration between device private and coherent pages.

<snip>
 
> -	res = request_free_mem_region(&iomem_resource, DEVMEM_CHUNK_SIZE,
> -				      "hmm_dmirror");
> -	if (IS_ERR(res))
> -		goto err_devmem;
> +	if (!spm_addr_dev0 && !spm_addr_dev1) {
> +		res = request_free_mem_region(&iomem_resource, DEVMEM_CHUNK_SIZE,
> +					      "hmm_dmirror");
> +		if (IS_ERR_OR_NULL(res))
> +			goto err_devmem;
> +		devmem->pagemap.range.start = res->start;
> +		devmem->pagemap.range.end = res->end;
> +		devmem->pagemap.type = MEMORY_DEVICE_PRIVATE;
> +		mdevice->zone_device_type = HMM_DMIRROR_MEMORY_DEVICE_PRIVATE;
> +	} else if (spm_addr_dev0 && spm_addr_dev1) {
> +		devmem->pagemap.range.start = MINOR(mdevice->cdevice.dev) ?
> +							spm_addr_dev0 :
> +							spm_addr_dev1;

It seems like it would be fairly straight forward to address this concern by
adding extra minor character devices for the coherent devices. Would it be
possible for you to try that?

> +		devmem->pagemap.range.end = devmem->pagemap.range.start +
> +					    DEVMEM_CHUNK_SIZE - 1;
> +		devmem->pagemap.type = MEMORY_DEVICE_COHERENT;
> +		mdevice->zone_device_type = HMM_DMIRROR_MEMORY_DEVICE_COHERENT;
> +	} else {
> +		pr_err("Both spm_addr_dev parameters should be set\n");
> +	}
>  
> -	mdevice->zone_device_type = HMM_DMIRROR_MEMORY_DEVICE_PRIVATE;
> -	devmem->pagemap.type = MEMORY_DEVICE_PRIVATE;
> -	devmem->pagemap.range.start = res->start;
> -	devmem->pagemap.range.end = res->end;
>  	devmem->pagemap.nr_range = 1;
>  	devmem->pagemap.ops = &dmirror_devmem_ops;
>  	devmem->pagemap.owner = mdevice;
> @@ -495,10 +517,14 @@ static bool dmirror_allocate_chunk(struct dmirror_device *mdevice,
>  		mdevice->devmem_capacity = new_capacity;
>  		mdevice->devmem_chunks = new_chunks;
>  	}
> -
>  	ptr = memremap_pages(&devmem->pagemap, numa_node_id());
> -	if (IS_ERR(ptr))
> +	if (IS_ERR_OR_NULL(ptr)) {
> +		if (ptr)
> +			ret = PTR_ERR(ptr);
> +		else
> +			ret = -EFAULT;
>  		goto err_release;
> +	}
>  
>  	devmem->mdevice = mdevice;
>  	pfn_first = devmem->pagemap.range.start >> PAGE_SHIFT;
> @@ -531,7 +557,8 @@ static bool dmirror_allocate_chunk(struct dmirror_device *mdevice,
>  
>  err_release:
>  	mutex_unlock(&mdevice->devmem_lock);
> -	release_mem_region(devmem->pagemap.range.start, range_len(&devmem->pagemap.range));
> +	if (res)
> +		release_mem_region(devmem->pagemap.range.start, range_len(&devmem->pagemap.range));
>  err_devmem:
>  	kfree(devmem);
>  
> @@ -1219,10 +1246,8 @@ static int dmirror_device_init(struct dmirror_device *mdevice, int id)
>  	if (ret)
>  		return ret;
>  
> -	/* Build a list of free ZONE_DEVICE private struct pages */
> -	dmirror_allocate_chunk(mdevice, NULL);
> -
> -	return 0;
> +	/* Build a list of free ZONE_DEVICE struct pages */
> +	return dmirror_allocate_chunk(mdevice, NULL);
>  }
>  
>  static void dmirror_device_remove(struct dmirror_device *mdevice)
> @@ -1235,8 +1260,9 @@ static void dmirror_device_remove(struct dmirror_device *mdevice)
>  				mdevice->devmem_chunks[i];
>  
>  			memunmap_pages(&devmem->pagemap);
> -			release_mem_region(devmem->pagemap.range.start,
> -					   range_len(&devmem->pagemap.range));
> +			if (devmem->pagemap.type == MEMORY_DEVICE_PRIVATE)
> +				release_mem_region(devmem->pagemap.range.start,
> +						   range_len(&devmem->pagemap.range));
>  			kfree(devmem);
>  		}
>  		kfree(mdevice->devmem_chunks);
> diff --git a/lib/test_hmm_uapi.h b/lib/test_hmm_uapi.h
> index c42e57a6a71e..77f81e6314eb 100644
> --- a/lib/test_hmm_uapi.h
> +++ b/lib/test_hmm_uapi.h
> @@ -67,6 +67,7 @@ enum {
>  enum {
>  	/* 0 is reserved to catch uninitialized type fields */
>  	HMM_DMIRROR_MEMORY_DEVICE_PRIVATE = 1,
> +	HMM_DMIRROR_MEMORY_DEVICE_COHERENT,
>  };
>  
>  #endif /* _LIB_TEST_HMM_UAPI_H */
> 




