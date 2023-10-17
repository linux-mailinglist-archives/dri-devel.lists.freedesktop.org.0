Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 652947CCA33
	for <lists+dri-devel@lfdr.de>; Tue, 17 Oct 2023 19:54:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3268610E189;
	Tue, 17 Oct 2023 17:54:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2075.outbound.protection.outlook.com [40.107.93.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA5B910E189;
 Tue, 17 Oct 2023 17:54:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RKfFWVFvZ3ryT7MvJrmCiTttbB9Gmm/0yqwrcb5uJpSU+Q1fS/2pQHLEv2YmyMdIp7Y+uAA/riVSh4BQQBRqQ/miRV6/5LVEWlnL18izsTBHaVNSOCfddWy38dInqG4bWJXi05Cy77VvOmldQ7jNJcrVjlfjFQ3y/zy1C02vWB6DDXs68qkTn0WeFQtfKjDGLJMboJoZL3xd5qJ8F6BaPa+XmQW2cz4ASmdtjprosIvR+tMCZAztPyfnGqlYlXR3p/YvUIMSJHSCV83VfGnrD8k4Nc/bt+YTQiG4K0uSz8jWaIF/yv6CA1M0qZ1Jh0gxYHU1w9WirxB+IiM+NKpUBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dd36NJmPeJdJ+oQn7SaPNX+NhfRrJ3Z5xnAAtkAB9ps=;
 b=GoDOCU9fd52h4jBOEEOldqu2o++5wYA/3RgS9T7RBZESu7QOGbxDjX0pjv25u0IfRq/LBKk1Q0xtpyz1N0g065CFz96tLybglLoBcDvKQ3tI8U2EzqoQNtwV2dzKQMSG8ccHfzksOX5V/MJlO6M5XI5EUE/i2Ee4bNkCdFfVTlBddjMFTdev8xaclgKAid5mWJwil/z6e03ikHslG4JlHp1TOhOihV6+dnGEBb59nckkth2Lsmm42AXucOoJqb/B9Zkq2gJWmlvvKXYBo9vlpU+M04kKUYUjZK4jD3i+ZdwsPfl5noHPvNcd42jRUk3IMxB2Tnje+nNXIDgMCHmjVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dd36NJmPeJdJ+oQn7SaPNX+NhfRrJ3Z5xnAAtkAB9ps=;
 b=AqUqptoyABM86kXTS3J05/eZlMY7DYInNZPPRU17MANbTDaaQGUOr6oYdEs56xKBUAo0V8HGoIFev3UFO9KGMtpISVrn6rMTMx4ePUljAi/iLpfDRkbOYN4KqnxlQec6lacuAs8acT1FPTJEfvv3faRAz4Gi/wPI+tkmoapwWmA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by IA1PR12MB8466.namprd12.prod.outlook.com (2603:10b6:208:44b::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.47; Tue, 17 Oct
 2023 17:54:28 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::2e40:ffd7:e752:644f]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::2e40:ffd7:e752:644f%6]) with mapi id 15.20.6907.021; Tue, 17 Oct 2023
 17:54:28 +0000
Message-ID: <54dfc01b-bd6b-4cf1-887a-749b45ede088@amd.com>
Date: Tue, 17 Oct 2023 13:54:25 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amdkfd: clean up some inconsistent indenting
Content-Language: en-US
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, alexander.deucher@amd.com
References: <20231013032129.55504-1-jiapeng.chong@linux.alibaba.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Organization: AMD Inc.
In-Reply-To: <20231013032129.55504-1-jiapeng.chong@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR01CA0144.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:1::44) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|IA1PR12MB8466:EE_
X-MS-Office365-Filtering-Correlation-Id: 25ba13f6-093a-49ac-8ca1-08dbcf3a1bc5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: o07t05xZuspgsHAWziIgihCQeFdh088e13Jbhsk34GeFEqqUt5KOdXxt2SARmv4oj0Zc8SqFXbsrbcg/yaL8AyB+xQ0BPJ8A1CUiEXPGSgiNhkssuGnLRqwoyRpWUZjsutVx97cn+unD54MoCk0rbKJI+sr8xU7byLwrojXk4UkbVIYUx/BJdyzJbsMK3kDH2cYk2oUtDyuKI4tcW2eh+Wk+GpRUQzl9mJz3nhlpjVL7Gt8jWg8MQVkJKRUNJ8vH2Xn8EJ1LGqmLlS3RODqtQVJpGWporwkxj0KFbLkg8JUvTVjgKZ6vANjdst5Izn90vSPxwAsmtXnQTUvDGO4Zy4WUZJGuyl253HoT2Ly4v4DJLamXCAW6V1NWuCQ4UGktod6HNmSJtqc1C+y/PtGoim34yqJo1klUA5dC0D9aYAmvysOMHkJKsdjYBuwC7XyumrIEVO0Ugq7mz6zI3Ke7aBBW/KNd1tes1uDoO7UCzNi7WYoB3fxd2+m8t83qzzsl6PVMoSfyeKkJs+aGv28snbQjMx2qEPbWQh3fDUijStlmAbMpnAxldDSQNNVuY9BR6efk21JdOweVfoGm9fOqwbi9N0fb2Lrw2ZyUPNnaiLlfG3n8xUnlfkT112l/3RySUJoTl2fLsSi9xGg9UJPzzQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(376002)(136003)(396003)(366004)(346002)(230922051799003)(1800799009)(451199024)(64100799003)(186009)(4326008)(8676002)(8936002)(38100700002)(4001150100001)(41300700001)(44832011)(5660300002)(86362001)(31696002)(2906002)(6506007)(36916002)(53546011)(6512007)(478600001)(6486002)(966005)(6666004)(36756003)(31686004)(83380400001)(26005)(66556008)(316002)(6636002)(66946007)(66476007)(2616005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eDhSdXNhem93LzlCZXBxeE1BanNpaGs5eE93cFpxbC8xZ0Nrb2UrOXNQVHc3?=
 =?utf-8?B?dUU0MGg4ekxTZ1Jjblkrc2hnOWFQTnRUSHVteTJ4SDJQU1phYjJib2JYd2ha?=
 =?utf-8?B?WnEzRndxeW1lSHlVTHQ0UlAwQWg5d1QzQ2dMOW1oR0JtYUtabERNc2NhanN5?=
 =?utf-8?B?WXU4dDBzVlJnbmp0cEJRZmdpSFcybndmeXdiY3U1WCtYSWhIM1V2R0F5cHZK?=
 =?utf-8?B?QTNtLzlUY1VYU1l4a1VyVCs3enBnREVEUkNaQ2NodWM0aGJFZ0dNVzFHMXVz?=
 =?utf-8?B?UEE5ZG5ka1JIRnhvYk1EdWhxN3BZTGE0M2tLSjV5VFB4V0dscGNVOE45c3Vt?=
 =?utf-8?B?VG5jSUZWcG1mbTVjMHVtVndxclpDbVpBMldrZkVudzY1dG5Ca3NNM3MwMU0w?=
 =?utf-8?B?c2ZZakhqUDZHQXQxNEVaMUpPWVlhRmYyYWl0MWpsT3NCU0RmRlppWTV0ZVZT?=
 =?utf-8?B?OGUyZmVkYm9lVThidUpiMXlTa2ZGQldlZG55dVlYQ242YnNsbG9aY2J1RTJE?=
 =?utf-8?B?aUZkTVJqZlNtRHFQTnNmM0RSNit1ZzB2UkxGbWNzVEk4c2VXL3FiVC8xdzNI?=
 =?utf-8?B?Z3gvdWJNNVplK2ZzQThOeHZjdmo1ZjEwV0Mrb0g3UVBMMlpZWlYwVHRSa3Fu?=
 =?utf-8?B?dXkySEJKWkFVcUd1cWpzMDVXd3VZdGljNThNSyt4dTlEdXJKZFJlL0E0S1pR?=
 =?utf-8?B?TWV6L25mZENuRDJxWndwQjZnN3RNaUpHUURtQk9QZkszUzhhYkRnLy9TNC9R?=
 =?utf-8?B?ZXFuWVlPa2xjb2k1eWYvWGhqNTJMeWVCa1poS2QyczdTdFhES2NqTmtZczE3?=
 =?utf-8?B?T2YzMTQwVDNsY01HdW5rSngzdDBpTHFQN2xOaWkwS2crOVYyMzhjeXM3Q216?=
 =?utf-8?B?TGx5UHBUQXMvZjBDSjVUNHdPWnBFblZFdXNTZ0MxSzE0TjkrS3k3ZVY4dm0y?=
 =?utf-8?B?OGZ0L2tvaGJwTzJwT3Z3VjFCK2h0c2EzZUtsT01HbEpSN1FkY0FONEtEZUZX?=
 =?utf-8?B?VWd2Zkx6ZmtxaWVjYTEvRXo0a212SUJJOXBiemNndUQ3SnRxZDE1RGp2d0lq?=
 =?utf-8?B?SDE3ZGw1ckh5amh0bjQ2b2JuamI5RytNWHRIc2Nsc09UZmorK3ZMVXNieUlU?=
 =?utf-8?B?WHFsS0VmVlRTMmJKSVhMNXNPWjVua0xUWXd4KzNRYS9nUUxId1gramwvTDlC?=
 =?utf-8?B?UVZyUUo5b3VNL09PVzlnakFORlBBZkJuWWk4Y3JDQVJVVW53eXBCckg2aWxs?=
 =?utf-8?B?NGVJQWRZOFpnRVNXNTJOSFlMRlh6KzJnQ1dJMm5oZFA1M2lXKzJDcjdyVHcv?=
 =?utf-8?B?Ly85T2ZLL0ZGYjk1bWh1NWFONGF0MDJ2bmkrTHlmQ3VOckZyNjgvRmZMQ0Vj?=
 =?utf-8?B?RFFCazFyYnlWbkY1UFZyNjVtM0RuVjlGekhnNkpkVWxPcE0yd1hEdkcwMm8x?=
 =?utf-8?B?Y2wwbzl1Ti9JNHBQNUJxQjYyVUlYRmZQYnNoVjhGNFliRy9COUhReGgxSUt6?=
 =?utf-8?B?RXBDYzdDL1J0S3pqZDRVKzRnYzI1YkRjQnI4am9BZ3NGWTJ0NDB2dlFRREps?=
 =?utf-8?B?ZWU0R0I4aDN1L3RGSGpaZFhaTzRiRU1sQUQ0VTRBTExteU9OYW5CYVN1ZUZM?=
 =?utf-8?B?SUF4UmpoczVDaDRCZG1DTy8vbmp5ZG8xWlNvT05SSkU1UzlMcVRiSE9kNk1r?=
 =?utf-8?B?VVhtWDFqYldtdm9va1BtOUtsK2NNNnNZSnNqeU51OHpML3NNNXZpRWxPS056?=
 =?utf-8?B?dVFldHAwTGRzRDhycTJtbDgxdG5FZGV5eDU0azZQcFVHOEdyTSt2UTJySk9Z?=
 =?utf-8?B?UXdyZGdFZDFqcjRQck1leXpyUVAwL2VtQnZ2WC95b0ZUZys5YmREc2xxYmk1?=
 =?utf-8?B?YTM5ZmRLeWF6Z3JHUkh3MFloTlA3OWZMaWxwZUtGSkVhZlJsZ04xOGpvU0ph?=
 =?utf-8?B?R3RuNDRsWUVESGlkcG1aTTFLNU5LeDU5VGo1RkZBa1BsZ1VTVDBJSVU5dE5p?=
 =?utf-8?B?eDdVN0ZwV0UvUkw5ZytieUdUa0VVZXJmdDNtZ3VYeVRibldzTklsNXArQVRn?=
 =?utf-8?B?QXF5Y3RrUER5VWNYdFBuWmdjQ3JaMy9OUVdCR0U5aDVzeU8xSm9GSGJjUHVV?=
 =?utf-8?Q?0KePIYfG7KnOI241j8pBvR7ZM?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25ba13f6-093a-49ac-8ca1-08dbcf3a1bc5
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2023 17:54:28.5426 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 28sAib4cUdduX6/kD6tu4K0UmAFiHNqMTe3My+sd2RlbtzWReiNLBlAGiI8pAT3URAxbVaXCbuPshU8GGSiYgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8466
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
Cc: Xinhui.Pan@amd.com, Abaci Robot <abaci@linux.alibaba.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2023-10-12 23:21, Jiapeng Chong wrote:
> No functional modification involved.
>
> drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_svm.c:305 svm_range_free() warn: inconsistent indenting.
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=6804
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>

The patch is

Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>

Applied to amd-staging-drm-next.

Thanks,
   Felix


> ---
>   drivers/gpu/drm/amd/amdkfd/kfd_svm.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
> index f4038b33c404..eef76190800c 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
> @@ -302,7 +302,7 @@ static void svm_range_free(struct svm_range *prange, bool do_unmap)
>   	for (gpuidx = 0; gpuidx < MAX_GPU_INSTANCE; gpuidx++) {
>   		if (prange->dma_addr[gpuidx]) {
>   			kvfree(prange->dma_addr[gpuidx]);
> -				prange->dma_addr[gpuidx] = NULL;
> +			prange->dma_addr[gpuidx] = NULL;
>   		}
>   	}
>   
