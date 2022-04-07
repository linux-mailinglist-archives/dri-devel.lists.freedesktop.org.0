Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A13B84F8530
	for <lists+dri-devel@lfdr.de>; Thu,  7 Apr 2022 18:49:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15B3F10EBC4;
	Thu,  7 Apr 2022 16:49:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2082.outbound.protection.outlook.com [40.107.244.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD2CF10EBB0;
 Thu,  7 Apr 2022 16:49:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lDbQ3oc9f2hGidvGRAjV58Dmzebn1Sy2z8WQaJOdZSUZG2EtATMdYp1ImgYChvMy5ChsMteR2UQG3N/wY3UKzulP6s9quUEvJ48c/IG911isGbhS5iq/03rX+mzFPlCAPmkv2KSUiVZp4DQuA+L80MFQnzAsIA8jju7xsZkyp83H3ILgal7AXntbSmKXab9Vwt1b5kWvJi9fMtn1LCRXHUoD76WPyCka33ehlaRASaf3oASHL9Lic/fJJnG+heTgTGGYWTbVQ+NHT51mMzsvNL02IkHmU2D9xOKbEQnzs4+4xoi+S/Hht0hSoSuIHhro/3I6Y0vcXf6uAlONf305mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gcPaiQTZuV8D0gkHZh2y9ZO0eMDSka/2arvZfoXIPzw=;
 b=A3/NrQsoDJwZZ6malwRsU1YRIHg0qALvH5S4VJ1HCmNAQfWVcA1zg6Iu8Vfh2KwxZJ/qNij23RvHEzrkLW4bE1wkSPtsJtLxlb0rezt15Cn/wQMnavQaUw3+wtXdhuJteCpnh2W2ODoQZ3MjV7VEKl9AJyLvamjEeOfpVQLP4v84eommDdNwLNYBwLmHC08QkBpMhrc6o+R7sLXuh7OYg83plyd7nuLA70E0RWwacB1A7NJTnii6Pi+xYNUyp8p7U+Hv/Ju9kTER59tTUK3/Ji0n9DQT2UYFEcZCKzhy1VGmxhn2GkfBEe0fCNbDGAPzfvsBa5kD27doEQGujpm7JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gcPaiQTZuV8D0gkHZh2y9ZO0eMDSka/2arvZfoXIPzw=;
 b=T4ZVOZ95IxzTHyDP+ghJrCtrP6wgd22b56jabzV3VMrmSAW6tVA9LQmgdazKvn7oALelATjryeoyQ0VM6+8z1kw4OAeEE0MFYrAk6gxdWZE27YmsHPfF4MoRxxFJZTspSJkc2tr4Z0MRyDt35Khoxt5+lnsjEmzby02jqBGAr2Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM6PR12MB4942.namprd12.prod.outlook.com (2603:10b6:5:1be::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.22; Thu, 7 Apr
 2022 16:49:26 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a5fb:7137:5e64:cf8]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a5fb:7137:5e64:cf8%5]) with mapi id 15.20.5144.022; Thu, 7 Apr 2022
 16:49:26 +0000
Message-ID: <1a4ebf85-4447-8f1b-b8cb-2fe0ad0372a1@amd.com>
Date: Thu, 7 Apr 2022 18:49:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/2] drm/i915: fix broken build
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
References: <20220407164532.1242578-1-matthew.auld@intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220407164532.1242578-1-matthew.auld@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0070.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::20) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 76dd6674-2ebc-4656-485d-08da18b69319
X-MS-TrafficTypeDiagnostic: DM6PR12MB4942:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB49428FB8FFD06FB24D35DB3583E69@DM6PR12MB4942.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: T73NxcD95wbNWQoUfhznHYcaAbtSL3Vrmhy6wpL3+DIOtrlP29uV4hyZPGsudC3u3rSQK/MALf5RUr5qQxVwsOdIwxNiKr7sVJ0y+spm/C60XJlYH5SZET0HCfABOdDBUTonGdrLkxfO2P4voxhExKyrcSNtB319zzCaKwhMD5XHPEpm08O+v6tJYQz3W6QLn2BhZlswXrnz6zUfmZpM9AgCw8PnsbL7nwpVBB+o13K3IHu8A0KmsHdxz/14SHHFCJG0pkwq2Ls3WFtqovCsiEjxkLgHfC6Oy46POo84ewmPnMRKIfLPxzJbLuHvjUuxS+5UMQIKhV8jR70DDme7G/mQIFTvSP/WkGC8Eq6yMVN5kLHtZVeDRmA7UHWDphJQJyYv4gvT7OTb6r86Jv/nb7bRYc3Q6WQXnXXrZEJsCVtbs06a9K/ELurHNGj4s8WKWr46Onqtc25+gWB4rYFfqo3rY6UeT2m1k2WlC3/vMOiIbw0uJG0LuWi5sSq2zSiGrDNG+mwyEPEpb8Ruhk6AdSJkY7wBe5u0ceOesJ4lJtCOTTY5BlwBYafnkSPWwBQM4x4GomdKo2aMMV7uq0CLG46FMkmJO3IkVYza4OuO2MkakqGfP8kXHaewYIO9ie8QV46FQhswYfuGHrNQaqnrP9Otvoy20zBjCTMJo1MYCsRdNVfXG+6d9DxnBuQOwkoEhmaH4bItYI8hqcdpEfwqtQbYIwCkH+SgY1Mvfih4sBrN5xE9S+WO9OOHMBgBVXmu
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(36756003)(316002)(86362001)(66574015)(31686004)(38100700002)(6486002)(83380400001)(508600001)(6512007)(2906002)(66476007)(8936002)(6666004)(2616005)(6506007)(5660300002)(4326008)(66556008)(66946007)(8676002)(186003)(31696002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OXgrd3Vnc2hpeUZnbFdCdzVuRjM3cGFFRzQ4VFlwaHVSL2dyaVNtU1FXc29a?=
 =?utf-8?B?alVQdGgwTm5hYk9QZ3J6YXpWVS9SU2M0TDVPOE9KNnZUVnJlUlZBWHMxSXY4?=
 =?utf-8?B?VEJzTkRRZE41MmhNWjl3QkhBNmNUc0hxb0lwdTd1WDFERURGNHZSNkh1N3dw?=
 =?utf-8?B?RUNKcElIelNabzNLdWJQUkZPcGxRdUxWd3ZtRkFCYmd1WDJuSEh1dWF5RU9j?=
 =?utf-8?B?cnhYZWNlRkxNbmJTa0RLaUVlU2FPNE5tS3MwV2p4YXNvWHVFY0ZLVWYwanVj?=
 =?utf-8?B?RDMvVHpqZXNtSWwxQi9MK0d2RkhxM2x2SUZnTWZSV2NLQmpERnIrU255MkVn?=
 =?utf-8?B?R1VtSG5XbmsvVUcyb0FZYitUSVl1ckZnZmFSQ2tCYndLM3JWZFdEU1NRaURX?=
 =?utf-8?B?c3pjMHRYVWRHTXRXamxJUzhwaVU1N0tEb2dSd296UjVEVDJtYlFGaEVCRnRX?=
 =?utf-8?B?L2lXVXlPRitIUzdUSk5vRmJqblJGUmFENFhsMjJMSHhNOUtvbkE0ckh2UXA5?=
 =?utf-8?B?Wk5nNWlqbmlJdTlDTXhDWmpjS3F5cnh5bjAyTHprWk4vd2lUcGZ4bXNIRStV?=
 =?utf-8?B?Y2lQZEU1VGVvZkpwTkUvMHFrVEFsUkJxSURzTjI4cnZHWk5SSitWZm4vVXdR?=
 =?utf-8?B?Tk15RE9zeE5ta3hPU2IxOWdkRm4wYXVRbk91R1dMZkdXd09YenpNaEJlLzF4?=
 =?utf-8?B?WVdOMVpzcDhnajlLSGlvUTlHamJTQ2NTU1FnakhLZlc2aTFhNzNDK2JtaG5O?=
 =?utf-8?B?a2o1UFZVVDlWRUdsTzBnNFU0eGVQMzVzak9MSURUb2tFUGV0azQ2RXBwNUs4?=
 =?utf-8?B?SFZzaFd3QTFlSkVaSm9pTHRxYlFyMkhNczhMOUIrSGtLcnFiWEdJK0RrRmV5?=
 =?utf-8?B?K3VQT201a1ZkbkFpbEt5Vm1BcjRvbUVKc1BkbTFpc3g0RDdyejJTTzlubWZy?=
 =?utf-8?B?RU1zSlZsTDJJQ3VpS25ldVZYaCt5RkRrVnJiVVNtcGRNY3FDV0pwdGJYVHlr?=
 =?utf-8?B?KzNMS2twem1LcENQWEt2N1lPZUVZZTJBUjk1c2Z6alluMG10QjM0QzBGQ2Vt?=
 =?utf-8?B?Z3BibTY0VGY4YStRTXR6QXJYSTVvN3VLNTdxbC9YRHRjcjFlbHQ5Q3VHTVRM?=
 =?utf-8?B?SHBpczJMekd0TXhrQnBxQ1JEL3FOQmVVdlR6T3QxYlMwQ085amVsQXE4cjJX?=
 =?utf-8?B?SFIrZHV5Nm1IRTczcS9yektWMWovem1ibitiODFDWlhFNURvQjBybTNWZm1v?=
 =?utf-8?B?MVdSVHZ1ME4wbitpVE9CSTJybFZ5RjZWT2k1WXljcFgyWll4amtCalphWXdK?=
 =?utf-8?B?YW9aRkcxaGxoNFVQQlpOWW5LNGlUREtqSk0xMEFPOXdnOHJJWkVXV3VQcjcx?=
 =?utf-8?B?V0JQMTI4NkgwODQyUkI5aHhOdVpXby9RazRHWE5rNFBoUEhxQWJHRHBsY2s4?=
 =?utf-8?B?Z0Z6R3VnOVdJOWl6bThOQitYWnM5ZDNjQ3RKNndtMGIzRUlUSVYzMGVvZDJR?=
 =?utf-8?B?a1orTVpSZytGeXNUZnlhNnRTVG8xWkVMVDd0RTdKZXJKRkJCNVUwdnF3M1hU?=
 =?utf-8?B?b1I5Y0NlaXVrYjZXY1hTUTJ2OWlZMndQbGZ5L0xUbDJYNDA0MmgyU0JVQUdx?=
 =?utf-8?B?bU4zR2VsbHRJa2RmWUhJMStqcjYvVmk2bG1FL3RoN1U4R2U3bnJEZ0lzK1VC?=
 =?utf-8?B?alBlMlY5dzhNVDkyOGNFWXhQYSsxRDA2MjAwRENUemxIUTdMeGVGeUJWNWxy?=
 =?utf-8?B?d1RLWUlsVkZZbEdsZXk0NWlvUFFmR2s4dU5LaHQ3cXVRRG15dGpJMllNc2Yv?=
 =?utf-8?B?NDBnVFNMQVFWcUdJU0tIK1AvNU1wVytPL1lzd3pWZEF4KzRxdkY0OFU5Smxo?=
 =?utf-8?B?WitpV0JXYnduaHN4RFh2bEFjUE9Nbm11b0VyQ3ZXVEk1aVBPM2poQ2dGM2N5?=
 =?utf-8?B?bGtKRGJJQkF1L1RFRk55SXZoN1N3MWg3K0VEa24ybW1oRVFOUWhyR3kvRG9V?=
 =?utf-8?B?dTVwVmFBYWZNNDlOeTNRRDI5ZmEwTUhKaGpuUCtrYS9MUW1HQTE5dkxvb0s0?=
 =?utf-8?B?TlgrcWp0WCsxU0d2MkFSK1dXaTkwb2JZdThmSS9yY1htT1N6N1puQTlJZnpR?=
 =?utf-8?B?cDBMTzZUSjc0NCtMOE9udmFoZzVOTnNXdFpPMG0zQ3l3ZlZaUEZzQjJibTJt?=
 =?utf-8?B?cE55MHFUSGFvSGdINkljZkRDZ1N5Wkt4NEg4TVJUaFhiR0M2cFN2NVJtZ1ZH?=
 =?utf-8?B?YkRBSlFIWHJjRXVOVkN3ZGI4b2h1RUVaRzdySWxmNkFCUjFTUG9seWdQczhQ?=
 =?utf-8?B?YmwxV2R2U0FBM01sS1NvZEkrL3FYTGhRcUlxSzl6aUJkYkF0WTYydGpLcENX?=
 =?utf-8?Q?HVgfdQf5VQeRDlnT2D8yno7pIuKxfAUeK3QYt9ijK1xR0?=
X-MS-Exchange-AntiSpam-MessageData-1: 6aLnSVKUs5zFTQ==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76dd6674-2ebc-4656-485d-08da18b69319
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2022 16:49:25.9868 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RiyIONytVh86aMEtTLgsBWRN+8weKgHB+tYSWh9f7aYnmzcwKqpuMb7ZTC9GKiW1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4942
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 07.04.22 um 18:45 schrieb Matthew Auld:
> I guess this was missed in the conversion or something.
>
> Fixes: 7bc80a5462c3 ("dma-buf: add enum dma_resv_usage v4")
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>

My best guess is that this is a rebase/merge conflict. I'm 100% sure 
i915 was compiling fine before I pushed the patch.

Anyway Reviewed-by: Christian König <christian.koenig@amd.com> for the 
series.

Thanks,
Christian.

> ---
>   drivers/gpu/drm/i915/i915_deps.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/i915_deps.c b/drivers/gpu/drm/i915/i915_deps.c
> index 999210b37325..297b8e4e42ee 100644
> --- a/drivers/gpu/drm/i915/i915_deps.c
> +++ b/drivers/gpu/drm/i915/i915_deps.c
> @@ -226,7 +226,7 @@ int i915_deps_add_resv(struct i915_deps *deps, struct dma_resv *resv,
>   	struct dma_fence *fence;
>   
>   	dma_resv_assert_held(resv);
> -	dma_resv_for_each_fence(&iter, resv, true, fence) {
> +	dma_resv_for_each_fence(&iter, resv, dma_resv_usage_rw(true), fence) {
>   		int ret = i915_deps_add_dependency(deps, fence, ctx);
>   
>   		if (ret)

