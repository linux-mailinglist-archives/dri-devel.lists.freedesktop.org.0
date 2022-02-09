Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3796C4AFF41
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 22:36:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76BBB89CCB;
	Wed,  9 Feb 2022 21:36:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2044.outbound.protection.outlook.com [40.107.94.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F276E89CCB;
 Wed,  9 Feb 2022 21:36:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I8Q6oQgKrh3sUSwIIvmqn7j/6HAjtocv7MRxqFshjiEl/sE8uX0q73Eqrdw33FUPz3B//hXgUovnUc0dLB08PJwPxw1WM1v+KrC8IRMrs0C44am+wcI9YrShXsKntH5DWJe16KEZuhJxp3r7uhVi4BCxKmNmJDg6QXh4P+5BpT8HkEgmJl5/qygVS/lycwcTeO9KXW3s0VvNcfnMn1ONeU/yPu5wi3zYsX4zqT747W6ws6Nr5xiJCDd7MxLCIzc702eyi5TaoA7fm0dnmRSdlzCKFnvi6tLHMmxG2m32tNgdj/Vw8Wk/I+r86rv934zKpdIPrs8KuBh1Tfui1R3qXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QLbfPQHS/ETmYb/+9D8qF2agvslwqYNjjBj6wAknSLo=;
 b=a24a/oiVLjbYwsz+m8aM4t5WFeMIYZwXL59pyldLPUXwQWUuuEipJsvb8I57O+A6MYbkI7wHjCGN/t3JmCbhKJSN7l0VeSM8iHMfDLIVP96sCnne6ZD9XdLUN9NmshObd6Ef0mWs0UkNcY4uW7CzPS/MUCWwHCnm3W9mpUwndbSO5r2uzp+UtR0NWENC4dt7ejSNSaYNa9QBRPQ9/ZR3ziwzfGMQ7DPauJ2mkYQSGgG7DQNHZFJ5QMqpK46qVcedhsEdVLJ7dO0KS+1NW14MT4qpW3nKuG8YbgY/IN+HybcinxJS8UXRT4jp/E1Vh1T27NWUR1O0nnssZ/OdmdWEpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QLbfPQHS/ETmYb/+9D8qF2agvslwqYNjjBj6wAknSLo=;
 b=Kpbqrf7dhQeuBdLvhydvVUcfIcpzSU7Ao6nmREv+NrNOcYH1x+oLviqyjjVauHch5xXuIEGZ82cgyjD4HI1J8WogitAUIr6sP296x8mDUDKUtMoVAkKeUj4GYufMGY+FYX0VbSVcm/frgQhRBu0utyjy7XASDEOICkTFIybm7qc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5112.namprd12.prod.outlook.com (2603:10b6:208:316::16)
 by BN6PR12MB1236.namprd12.prod.outlook.com (2603:10b6:404:1f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Wed, 9 Feb
 2022 21:36:28 +0000
Received: from BL1PR12MB5112.namprd12.prod.outlook.com
 ([fe80::f071:728c:3813:3376]) by BL1PR12MB5112.namprd12.prod.outlook.com
 ([fe80::f071:728c:3813:3376%9]) with mapi id 15.20.4975.011; Wed, 9 Feb 2022
 21:36:28 +0000
Message-ID: <14f30ae6-addc-bd8a-001a-a005042047d7@amd.com>
Date: Wed, 9 Feb 2022 16:36:25 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 5/9] drm/amdgpu: remove GTT accounting
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 ray.huang@amd.com, daniel@ffwll.ch, thomas.hellstrom@linux.intel.com
References: <20220209084059.1042345-1-christian.koenig@amd.com>
 <20220209084059.1042345-6-christian.koenig@amd.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Organization: AMD Inc.
In-Reply-To: <20220209084059.1042345-6-christian.koenig@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CH0PR04CA0054.namprd04.prod.outlook.com
 (2603:10b6:610:77::29) To BL1PR12MB5112.namprd12.prod.outlook.com
 (2603:10b6:208:316::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c6b95f1c-c356-4952-cee4-08d9ec143ac1
X-MS-TrafficTypeDiagnostic: BN6PR12MB1236:EE_
X-Microsoft-Antispam-PRVS: <BN6PR12MB123676CD50CEC2CCB76D4E9D922E9@BN6PR12MB1236.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9JJHw7J1T/KVuG1cDcdv3tD6SMM0TryH0nP3ldGL8Rh0BKdn4hDvw/+UyQGtC1hj2W0EsYvNOJWSO0s0/IR9HsgMyGNqCzfo8MdK6wdx/71Z5Es28SQIAMotDHeUX0d24UxHol60HEfk1jJYL3XWvQa1uNwwobuWcVtskwkmecgtuXZ97orXsY8p3fABCen5BcTkDC51gK9Yxc54whAsemRWzwvv7l0AttKuP8D6wczXmyfd4Blt82ejrSztzFpKlTKWRJdpcMmrRRKOWj77zDxpN5bnUZtkLCtVlx8iqnIWDa6GDhfSHu0mkPGytTK3X9Pc17Xn/ScV27gsH9k/ePhdsVv5J40235rONTmy7pveKG/CBxfBiUMW0aol/Ub3Y/YoETQjejKBNOz0GKAjbpdRxdNUHv4Sy14J3+AB4puS03rv22NFznM1aOU+4ts4cO+migZtBafNWvQBaVYbECS3QLvp9OL3GDRSLjz/CX4GslDko+pKbhmf9YJmgVfMnBDM01mAX9xeEBDH21P543qCUjEWmhg8X8s+q5GBrJNbae8WuGwNRMb5zw1z/pRDKVx0hrpON0EyHbTlo3OAmXu14iqRFC8p17Gu95s9C5SytvOSmCK1e7RMSGd0DjfDPRW7CVfhJZvGvvWMSX9PyceVJGvQkkvKqBu0V9AUWjyVMfy35tTWbob1XSL8ARjk3UZurwR7ZKJePO/2Rqlo0ah8VY9O67rYZw3ScL3TCT/2LjvJWfRCbJ2Uq4mzrbTG
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5112.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(15650500001)(508600001)(31686004)(66946007)(36756003)(6666004)(4326008)(8676002)(66476007)(66556008)(5660300002)(8936002)(6486002)(44832011)(2906002)(316002)(6506007)(38100700002)(31696002)(26005)(53546011)(36916002)(2616005)(86362001)(6512007)(66574015)(186003)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eEU2MTNDNG82M2tPVGpHU1JLYTdOVmpxbnQvOGd0ZFZGMHNzWENmWTJKZkg5?=
 =?utf-8?B?cnkxT2RyVE1XNndhUGNkeFVFWlBLYjBjZ1IvWm1NZGFCQnNtdS9XcVczTnM0?=
 =?utf-8?B?NHpsakZQdUtHRy9ySWFIdkRrOVFxRm5hcG9WRURmbmJuRFl2dFJOZTgyNWJs?=
 =?utf-8?B?TlFBd1kzSEpIczR6YWZzMk8vMDJ5c1JtUkwvK2xneEJweHRMT3orSmRDdlFC?=
 =?utf-8?B?RXJqUnI0RWQxZ0xYV0xGblRtMmpuaGVkVng2MmtWZFpUdkoyRVY0SjBrOXY3?=
 =?utf-8?B?ZWttMi81VzJGWXhYZHYyc2NXaUJ5UDFPeUpMcWxCeXg3b0FHYk0rZnI3UXZT?=
 =?utf-8?B?RG5QdE1tdTdvbFRVc3lZbjhvdVNRTnJLazhUVlJRZUpxak53d3c0aS9QYjBR?=
 =?utf-8?B?b0lhQUJvbjQ5Y0tQTFVlUE1veXlST3ZnNlRLQ1ZUWk9VSndhVmRrclY4VlJO?=
 =?utf-8?B?c3o0K2hJMkZKQnhzVjRkNFhQaStjV24wdStIVWVJSzNaVnViTTJ5dWsyemww?=
 =?utf-8?B?UEo2UTQramE4dVA2akN6cXB2akRCYkdPOXZIM0lyaUljVlJCekN1RnAxMGhm?=
 =?utf-8?B?Umx4Y29NbDRKb1lZZ0NldDlaVW5QbFhrdVh0T3QxdTJ4RFlnRHhHTUxHbFB2?=
 =?utf-8?B?TUUzcVp6c0g2MGdTZ00wQVZWNnlReVkyaU1ycTA1dDJJcWY5cS9RRXVoN3ZV?=
 =?utf-8?B?SStHNW15Zk1kWWozd3VNQnZSTHJwTGhlaUc5emRaYWl3NlBpR25adjdqRmI1?=
 =?utf-8?B?bDFXa1JCdGlpN3I1VU44cTZ5L1F0VGZjUXpnblM4d3czWWtITUtFME5wNEZQ?=
 =?utf-8?B?cFNiSnBWTnh2UTFLVlFsbGtNZ0hFUE9iTVZIOTlTaUxheENDaXdQeEVqZndF?=
 =?utf-8?B?WjlyRE5qeHpzTUZJdGRLVnhoY0h1M0FFNXl0SlJQaitnaHNnaWoxcHI4b3Zl?=
 =?utf-8?B?L013ZXFjWWRTVFZZWmlDbjVDcldwYUxEZzl0VFMzVmdoV0EzeEtiZGZJU2lL?=
 =?utf-8?B?Lzl2c3F3MzVXT0VZMy9RYlhOR0pEc2RPUDdsWHA1MExOTmRhc2dmWDVTYklw?=
 =?utf-8?B?dVpJcnpPaUxrMEhpb1ZWV2tKVXNkeitKNEdkTjF2VHpBeFUrZy9lK21FTU1O?=
 =?utf-8?B?Nkp3Z2ZXZ3ZXdjZXMVZ1ZVRTUENEaXBES09IeVpITHhhSlNibVhsQVJPWU9P?=
 =?utf-8?B?a0cxMEZtZTN0S3hRdEVydXRDSXpaOXdyZVdERS9NRVg2V2Z4dk9EdVdtdVhN?=
 =?utf-8?B?Y3JiMUcyM2FLR3VhV1VoUTUwcElPVy9EZXVMRzEwbDNPcHdHdVhrZldjMzQ1?=
 =?utf-8?B?QUJLd0ZzRXFybjhYc0RhcDVVMnYxUHduN3B0M2NPS1hwRGgyc2VKaW03UmVB?=
 =?utf-8?B?aHEzTFhoRUNUVThMeDlEMVpsb3k0YURGYmFWYkZRU01hR204YkdyZzVUa2FT?=
 =?utf-8?B?MjE4SkF1eGNKUXhhdFhRWVhha01SMDJaRzFZMVpqSlR4cjFmbTg4THBnS3Fm?=
 =?utf-8?B?QWkwK1FxWVIrSFZWaS9Sd2FET0kxQVlOWGtISW1xb3RVUHNvYjVQM2pEOThW?=
 =?utf-8?B?RWtsK1prRGVSRGRqYmx0SE85QlNuY3djNHczbE5UanNLamZkelEyLzcvUncx?=
 =?utf-8?B?SmoyUTNobFZ1K21xaU5kWllaRVJGT0QyZVRrNGdidjR6cHVCWUQxdTcxNVNl?=
 =?utf-8?B?aFRHd0Ivekl5MnZCanVzNmpWVldPdXpYdkxvV3VCVjN2ZE4vcktqanZ3U3hn?=
 =?utf-8?B?ZFAzQVhJN1lTdUFraUJqa2ZVU0hmUEZkbTBPNlgzQWdUR3JhQk9jbFF4aTgy?=
 =?utf-8?B?T2ptRUdwa1lsOXppREtMeC9PSXZiaWI3eE9VWEZXY1h0eHMxVFY1OE9vTlFt?=
 =?utf-8?B?K2YzSVhTdWwyNDgvNWNLTWM0bm5GM3JPMHJ5ZTZQV0dCNFdZSlpkeHEyeUJD?=
 =?utf-8?B?THp1RXZ2WXNlMUhWQVBrUXY4aTNLaDRzV2RzeUxpY0taendxTWs5Yzh4bWpR?=
 =?utf-8?B?WjQ5dnBTTkRYaWdJdXJiNllEZG90Z25iQkxKMWdVdE1ySDVSeXN5ZEpCV3NX?=
 =?utf-8?B?UEV3ell4d1QxNDhFZEJHSkxkNGl6WXlsL041UEdSd01aRWRkeHFrRWQ2dFpo?=
 =?utf-8?B?dWRYK0VoMWxnWVNlZW9rNjBoRGFnMk5TVCtQQ1dCTkVNaEtxdG5XZmViRWNm?=
 =?utf-8?Q?6POXikQfKj5U+D5RuRrZYEI=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6b95f1c-c356-4952-cee4-08d9ec143ac1
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5112.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2022 21:36:28.1728 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: idXu0DIeUDNd+GjoD6DP6m9BQZOfo14i8o9uIxjA2Kc6sfJ4WZAgTghaWPl15231iRBltQPJ8vh2tglxOB6iJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1236
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2022-02-09 03:40, Christian König wrote:
> This is provided by TTM now.
>
> Also switch man->size to bytes instead of pages and fix the double
> printing of size and usage in debugfs.
>
> Signed-off-by: Christian König <christian.koenig@amd.com>
> Tested-by: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c | 49 +++++----------------
Should amdgpu_preempt_mgr also be updated?

Regards,
   Felix


>   drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c     |  8 ++--
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h     |  2 -
>   3 files changed, 15 insertions(+), 44 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
> index e0c7fbe01d93..3bcd27ae379d 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
> @@ -60,7 +60,7 @@ static ssize_t amdgpu_mem_info_gtt_total_show(struct device *dev,
>   	struct ttm_resource_manager *man;
>   
>   	man = ttm_manager_type(&adev->mman.bdev, TTM_PL_TT);
> -	return sysfs_emit(buf, "%llu\n", man->size * PAGE_SIZE);
> +	return sysfs_emit(buf, "%llu\n", man->size);
>   }
>   
>   /**
> @@ -77,8 +77,9 @@ static ssize_t amdgpu_mem_info_gtt_used_show(struct device *dev,
>   {
>   	struct drm_device *ddev = dev_get_drvdata(dev);
>   	struct amdgpu_device *adev = drm_to_adev(ddev);
> +	struct ttm_resource_manager *man = &adev->mman.gtt_mgr.manager;
>   
> -	return sysfs_emit(buf, "%llu\n", amdgpu_gtt_mgr_usage(&adev->mman.gtt_mgr));
> +	return sysfs_emit(buf, "%llu\n", ttm_resource_manager_usage(man));
>   }
>   
>   static DEVICE_ATTR(mem_info_gtt_total, S_IRUGO,
> @@ -130,20 +131,17 @@ static int amdgpu_gtt_mgr_new(struct ttm_resource_manager *man,
>   	struct amdgpu_gtt_node *node;
>   	int r;
>   
> -	if (!(place->flags & TTM_PL_FLAG_TEMPORARY) &&
> -	    atomic64_add_return(num_pages, &mgr->used) >  man->size) {
> -		atomic64_sub(num_pages, &mgr->used);
> -		return -ENOSPC;
> -	}
> -
>   	node = kzalloc(struct_size(node, base.mm_nodes, 1), GFP_KERNEL);
> -	if (!node) {
> -		r = -ENOMEM;
> -		goto err_out;
> -	}
> +	if (!node)
> +		return -ENOMEM;
>   
>   	node->tbo = tbo;
>   	ttm_resource_init(tbo, place, &node->base.base);
> +	if (!(place->flags & TTM_PL_FLAG_TEMPORARY) &&
> +	    ttm_resource_manager_usage(man) > man->size) {
> +		r = -ENOSPC;
> +		goto err_free;
> +	}
>   
>   	if (place->lpfn) {
>   		spin_lock(&mgr->lock);
> @@ -169,11 +167,6 @@ static int amdgpu_gtt_mgr_new(struct ttm_resource_manager *man,
>   err_free:
>   	ttm_resource_fini(man, &node->base.base);
>   	kfree(node);
> -
> -err_out:
> -	if (!(place->flags & TTM_PL_FLAG_TEMPORARY))
> -		atomic64_sub(num_pages, &mgr->used);
> -
>   	return r;
>   }
>   
> @@ -196,25 +189,10 @@ static void amdgpu_gtt_mgr_del(struct ttm_resource_manager *man,
>   		drm_mm_remove_node(&node->base.mm_nodes[0]);
>   	spin_unlock(&mgr->lock);
>   
> -	if (!(res->placement & TTM_PL_FLAG_TEMPORARY))
> -		atomic64_sub(res->num_pages, &mgr->used);
> -
>   	ttm_resource_fini(man, res);
>   	kfree(node);
>   }
>   
> -/**
> - * amdgpu_gtt_mgr_usage - return usage of GTT domain
> - *
> - * @mgr: amdgpu_gtt_mgr pointer
> - *
> - * Return how many bytes are used in the GTT domain
> - */
> -uint64_t amdgpu_gtt_mgr_usage(struct amdgpu_gtt_mgr *mgr)
> -{
> -	return atomic64_read(&mgr->used) * PAGE_SIZE;
> -}
> -
>   /**
>    * amdgpu_gtt_mgr_recover - re-init gart
>    *
> @@ -260,9 +238,6 @@ static void amdgpu_gtt_mgr_debug(struct ttm_resource_manager *man,
>   	spin_lock(&mgr->lock);
>   	drm_mm_print(&mgr->mm, printer);
>   	spin_unlock(&mgr->lock);
> -
> -	drm_printf(printer, "man size:%llu pages,  gtt used:%llu pages\n",
> -		   man->size, atomic64_read(&mgr->used));
>   }
>   
>   static const struct ttm_resource_manager_func amdgpu_gtt_mgr_func = {
> @@ -288,14 +263,12 @@ int amdgpu_gtt_mgr_init(struct amdgpu_device *adev, uint64_t gtt_size)
>   	man->use_tt = true;
>   	man->func = &amdgpu_gtt_mgr_func;
>   
> -	ttm_resource_manager_init(man, &adev->mman.bdev,
> -				  gtt_size >> PAGE_SHIFT);
> +	ttm_resource_manager_init(man, &adev->mman.bdev, gtt_size);
>   
>   	start = AMDGPU_GTT_MAX_TRANSFER_SIZE * AMDGPU_GTT_NUM_TRANSFER_WINDOWS;
>   	size = (adev->gmc.gart_size >> PAGE_SHIFT) - start;
>   	drm_mm_init(&mgr->mm, start, size);
>   	spin_lock_init(&mgr->lock);
> -	atomic64_set(&mgr->used, 0);
>   
>   	ttm_set_driver_manager(&adev->mman.bdev, TTM_PL_TT, &mgr->manager);
>   	ttm_resource_manager_set_used(man, true);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
> index 1ebb91db2274..9ff4aced5da7 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
> @@ -684,7 +684,7 @@ int amdgpu_info_ioctl(struct drm_device *dev, void *data, struct drm_file *filp)
>   		ui64 = amdgpu_vram_mgr_vis_usage(&adev->mman.vram_mgr);
>   		return copy_to_user(out, &ui64, min(size, 8u)) ? -EFAULT : 0;
>   	case AMDGPU_INFO_GTT_USAGE:
> -		ui64 = amdgpu_gtt_mgr_usage(&adev->mman.gtt_mgr);
> +		ui64 = ttm_resource_manager_usage(&adev->mman.gtt_mgr.manager);
>   		return copy_to_user(out, &ui64, min(size, 8u)) ? -EFAULT : 0;
>   	case AMDGPU_INFO_GDS_CONFIG: {
>   		struct drm_amdgpu_info_gds gds_info;
> @@ -716,7 +716,8 @@ int amdgpu_info_ioctl(struct drm_device *dev, void *data, struct drm_file *filp)
>   	case AMDGPU_INFO_MEMORY: {
>   		struct drm_amdgpu_memory_info mem;
>   		struct ttm_resource_manager *gtt_man =
> -			ttm_manager_type(&adev->mman.bdev, TTM_PL_TT);
> +			&adev->mman.gtt_mgr.manager;
> +
>   		memset(&mem, 0, sizeof(mem));
>   		mem.vram.total_heap_size = adev->gmc.real_vram_size;
>   		mem.vram.usable_heap_size = adev->gmc.real_vram_size -
> @@ -741,8 +742,7 @@ int amdgpu_info_ioctl(struct drm_device *dev, void *data, struct drm_file *filp)
>   		mem.gtt.total_heap_size *= PAGE_SIZE;
>   		mem.gtt.usable_heap_size = mem.gtt.total_heap_size -
>   			atomic64_read(&adev->gart_pin_size);
> -		mem.gtt.heap_usage =
> -			amdgpu_gtt_mgr_usage(&adev->mman.gtt_mgr);
> +		mem.gtt.heap_usage = ttm_resource_manager_usage(gtt_man);
>   		mem.gtt.max_allocation = mem.gtt.usable_heap_size * 3 / 4;
>   
>   		return copy_to_user(out, &mem,
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> index f8f48be16d80..120b69ec9885 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> @@ -52,7 +52,6 @@ struct amdgpu_gtt_mgr {
>   	struct ttm_resource_manager manager;
>   	struct drm_mm mm;
>   	spinlock_t lock;
> -	atomic64_t used;
>   };
>   
>   struct amdgpu_preempt_mgr {
> @@ -114,7 +113,6 @@ int amdgpu_vram_mgr_init(struct amdgpu_device *adev);
>   void amdgpu_vram_mgr_fini(struct amdgpu_device *adev);
>   
>   bool amdgpu_gtt_mgr_has_gart_addr(struct ttm_resource *mem);
> -uint64_t amdgpu_gtt_mgr_usage(struct amdgpu_gtt_mgr *mgr);
>   int amdgpu_gtt_mgr_recover(struct amdgpu_gtt_mgr *mgr);
>   
>   uint64_t amdgpu_preempt_mgr_usage(struct ttm_resource_manager *man);
