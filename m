Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BECF85B2582
	for <lists+dri-devel@lfdr.de>; Thu,  8 Sep 2022 20:20:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50B7810EBAA;
	Thu,  8 Sep 2022 18:20:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F58310EBAB;
 Thu,  8 Sep 2022 18:20:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f1Dv+M3ciXG68srPPKPRIf6brB18HGorCAd/oElyNvkJb5Hb2sCDOxfhAGiZ5aUIRnIw5mDADQP9E74hsuzxwplIpKJzzTk2sbDCfuuT34qv1HX2u9IgqZZ+Rpl3Vzn9q7d1KCLhxVkyYebq6mZLbO1ty/z72JxMQMDPhF0c8txbFFITvbQSyKkEs8WeGYy/GIEqbE2uVrrLZIvG3ccrgcfeu4sxiszmcpPNUfn9anE4zFCa4YzNBVABmUxvQFXeChufZ1Td6IDCZWIFgMpLxbBM2ea0TfJl2eSfRcTZuJZg7OgmZQ+vvhNSh7ufPwge+v4GMMD2MEJIylX0R3qTCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B/aCdXwoMLf+FDe/xPBp84jHsqNDUMz9p9ide+QC/4k=;
 b=RfhLMjs+pIZ50UmkYsAGYFUAkmH98+MtY6C5ioxMQ8mNO4aRQh9VgH3nEQGdMZ7TnBcDUwS4fCyW1kdOhLYBdq9360/i/8akzrnZ9qw3dQt0CdurIPVWOX/0RY2KGza7VbasAw/Mem1NNcWfl9q20DT/e8MyQDd5WLt5UHr5Ipqn8/DfXYIHC8xIVRzMRhZDOY7dnK/ySjPY7PtpBNuRniJGauC/EVTL7zz76cemf0gUazG8tVc8FLEviUuhP/J29uunYtWuOcz+7v0oBhlMDsotKJALAb8NUWv3Rygk147TaJhTxXAHdM35Kfb1uwbKXTNsFJivulQR2jL6QVTNUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B/aCdXwoMLf+FDe/xPBp84jHsqNDUMz9p9ide+QC/4k=;
 b=2BMl+cpZUQpZlmb9VcKOvkhchUEHpbcPKvKW2OIzElhYqRbeqMhrWdYORqPSnBm9NyTg1d534u+5fZ2gJUx291IkxdUVwC3jkG2V3FOUscEVziAs8D0mHSxjP95uJ6+y8bngEocajr4TceHJjyqYKnK+eeIlVlHx0HVc2DUMJ6Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by CY8PR12MB7587.namprd12.prod.outlook.com (2603:10b6:930:9a::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Thu, 8 Sep
 2022 18:20:08 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::3de4:456f:800d:e013]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::3de4:456f:800d:e013%5]) with mapi id 15.20.5612.019; Thu, 8 Sep 2022
 18:20:08 +0000
Message-ID: <64540c0b-ddb2-704f-0150-6c9d85525036@amd.com>
Date: Thu, 8 Sep 2022 14:20:06 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] amd/amdkfd: fix repeated words in comments
Content-Language: en-US
To: wangjianli <wangjianli@cdjrlc.com>, airlied@linux.ie, daniel@ffwll.ch,
 Xinhui.Pan@amd.com, christian.koenig@amd.com, alexander.deucher@amd.com
References: <20220908131712.40442-1-wangjianli@cdjrlc.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Organization: AMD Inc.
In-Reply-To: <20220908131712.40442-1-wangjianli@cdjrlc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN2PR02CA0020.namprd02.prod.outlook.com
 (2603:10b6:208:fc::33) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|CY8PR12MB7587:EE_
X-MS-Office365-Filtering-Correlation-Id: c3470321-2a5a-4b1e-cd0d-08da91c6c2d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DYnTvHTso1ivEnyhn2AG9T8iGMF7JRfHGp/zgxtRINwZ/CoxQhpbl9fx0CJKFpT3FU39+QHTkTPygiciYOEBn9vrKLHU0u+Y0CnJIndym4GZ0FNBuHrpHCwk8bbFXpok8udWmJAlr4sFbCtO6HtukHRxfw9BljKcLhPfIPjN8FewPOcRWzFlbiRfXUiipaPx5IAFR+Cf+MD3EkRgNrSAwvtFPIKbyFw2d0iCXVjsGgPJKty+fMfu76CtOG8Fo+aB9pqMB7cvN0xI91QvodasArWGDfDWuLN8pSxZn+gvfDRlWOMLBrNfAf6DTYa/POv+Rc/dLnJyJwtyhs5VeMPMCbG1dKW/nuXKwi64o1NPcgzBuu0yZ6xZ5VjEdSYgiZg16nvfXEA11iPfuvWazcz6Piv4Jp6zfj6kAjdeWWHILdYJjzsacYvWv1W6T9IXZb0xS0r2/EY9+MXnnIgpsetGZ5tOCk+tqCPpmrJa5mkvtprM+5uqdVBnG9c/inrN7+d+jal9tnz3YnUBrvREC9oSha+ABkb2sRf12Ss4oRigVFkK3YU+EBZ7NzSPlBtLBBMY5Cvcy1oLizIoS4VGp4/tYD77c4ZtO9x7kQfbGeXKKRfJg2UyqZMMerc/BGxhP1H8rBijZ9SeyrjNNuWO7LLVjEme+8KNAF1b7ZNkZ24w3ggJLOa/4iFZJLJxOGjNxBcNgb5S9J1v2WtKtiZVcKasaNn2Eft4kEiBujKWmlv7anLihH5ZwMBSYtk7BPiDLEz3oi4uhVterijoHvpqjAOIAdYBw/Jm2Hmd1iIcKXEB/f0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(366004)(396003)(136003)(39860400002)(376002)(478600001)(6486002)(6506007)(86362001)(38100700002)(44832011)(316002)(2906002)(31696002)(41300700001)(4744005)(83380400001)(6636002)(66946007)(186003)(66476007)(66556008)(4326008)(8936002)(5660300002)(36916002)(53546011)(26005)(6512007)(31686004)(8676002)(2616005)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MDNxeURaS2tuRGF5aDBjb3RwWit2MXRydUtPRC9yQzhWbEVYMUZyVk45S09G?=
 =?utf-8?B?WFdYUzZoUjN6Q1lFaTV2bjN6WWMwenB1eGN5UWI2NkIzM1l0cnlBZmViQm1p?=
 =?utf-8?B?RmpocFVMc2NlUENFbmxnMFFwNENGUFQ3WGRsaVJhczhmMnRTREk0Uzg3eHRq?=
 =?utf-8?B?SGJZSlBlSytTMkxnNVBIcWRNenFWclpQZmVmbEg4clZzWkF6U3BILzFVNG9a?=
 =?utf-8?B?VWtwNC9lbFN4UGlDOVpYdldsRktGZzNnSlc2Mmg3Mzl0YlBPa0VYdDVFcUpV?=
 =?utf-8?B?NXBNZFJrZ3NYWFUxeGt6RU1STjRQcTY3LzZ2RzZJeStzTjBQWkxxemxQMjF0?=
 =?utf-8?B?dlNucldHVDZmdXR5QjJaR25CdWRsbUg1ZUpJMlFxejFTcmVKL0licUkwZTB1?=
 =?utf-8?B?UENKYlQ2TkFFWVhlQklIcFpvdWRLNWszMmRzM0t2TFlpMW5aR1ltRW1xRmZs?=
 =?utf-8?B?ZFVWN3ZIZGxoaVNCRW9RVlBPTWdhNVpWYmZkejNzdVl6a0Q4eFNMeExUTy9w?=
 =?utf-8?B?WGU5b09xcmJwMlFUL0dOZWdvc09EK21vSmYwSkZPMWRaU0Q1NFZFWWVxcmxn?=
 =?utf-8?B?eGxEMlN4eGZkU0x4ZEpiUzlPZmtRM1BXektWREdVZ3M2TkM2cVBka1V2cXZk?=
 =?utf-8?B?WFU1b1NDYjJja0U5UWZYS1lZT0EwbXJRY3ljN1d2ODVCK3ltVkEwVnBLOUJT?=
 =?utf-8?B?NFljQ3N2eGxIVURubkc0ZFYvUzljZXRpcFJjSFc1VXBvK0NVUTZpWkFsTkpG?=
 =?utf-8?B?OTl0Sm9OVkdmWGc5Z2ZEUjVVRk1CcWU1RDU4c2g4bEtkaGo1d0FwdCtvYTl1?=
 =?utf-8?B?cVNPOG51N1NyZC9neE52bjVvSmVsaGVZazdMMC9mSjRnMG5ZalR5SmNsRHh1?=
 =?utf-8?B?Nmx1RVQ4aUloRW1NbTl2bTdxSHhpUWpua2ZSaW5taDIyK3NndERuK2VnVVkz?=
 =?utf-8?B?ZzhENlJ4K3lDMEJiNDdlcHB5SkJRSXdUMjZjcWtGU3Y3RWhIVUNKOXhNeUVj?=
 =?utf-8?B?emVUOVZpbWVpRVd0OE9pTi9FbW5GVUZCQ1VHUFBiTS9salF4dU5XakVOVDRv?=
 =?utf-8?B?ZlNVeVk1blVOOStMVE0rQWo2RTYwOW5WZnBrMUlTMUU3eWJCTFBrOHRpb2xK?=
 =?utf-8?B?UytvWElnalFnNy91QkFVNVd2emRPd1diYWd3WVFMS21MWFEwTUFGbU5uY0JV?=
 =?utf-8?B?YnpwWnl6ZUVzeG0vMzRxSjVPRkNBaXlBNmlSVDdLS3EwSlJTVHVNMmFvMU1T?=
 =?utf-8?B?d2xlTkErUWVNd2ZlKzc0RzM1cGZOTnJaN1Qvb0l3ZXVQQVZPWDduMzI5Si9x?=
 =?utf-8?B?TENzbGNDOHJXekF5QUpWQXVMdGhlVmdMZmxudWV3bGVXWW5kMDg0ejk1ODRF?=
 =?utf-8?B?RnVLdVdJWSt5bkxYNWFKMVJydjR5OHNNdHZSNEpEUkV1RmRLRGY2Y2E3ZDRD?=
 =?utf-8?B?ZFdYOGY2TitaSFdDWmlGZFViRlNLM1dlYjNZK0FRbDJTWmRoRDJKZWZhdHdN?=
 =?utf-8?B?S3crQUtjR1dQcGtkSm4ranZicXREQnVkaDhYa0FjM09iRDhOclpDS0tuWUhq?=
 =?utf-8?B?YkVhUnBld0tZc0JCb1o3dGs2dlUweE40M0VERXJpcU1sRm9RV3FIbU9WVzBS?=
 =?utf-8?B?TDBTVGlpNkIzWmEyT3lxWEZwNVpBQk9RWlZ5Q2VWRHNUSHZnYkRIKzBaR1dt?=
 =?utf-8?B?K2Yyb2ZXNzB3T1plNzdWazZtcjUzbFJZWmh3TjBQSjBkVnR2a25LZStyMkti?=
 =?utf-8?B?VlVhZlFDdFFLS0NvMUNVREx4cTdyZndHbGorN1Y3dnFEWXlDMXY3dTNqYkc2?=
 =?utf-8?B?YmVlUE8xRk03TjFiM0xtblp5cFZUWEFWQWM1Zkx1eTlnUmc0SndGcy9jQ0cv?=
 =?utf-8?B?bDk3eDNCYndwWWl0WGhHbk45aW4zbEF1UUhQOFkybDBnRUM0a1hBRzZBNHU3?=
 =?utf-8?B?TE1DZmx6dzJhOTdoQXkvU1FNYVpvS2xKN3hsTG4xUy9weWd5NXgvbzZ2M0Nx?=
 =?utf-8?B?VnFSM216UUZydUVTcjdJNGJUTkhuRWZ0cWY4b3ZZR3IveHRQTGM3T0JNU1dM?=
 =?utf-8?B?VWg0ZWpkQTQrSUZsTjJDMUJKcEI4RU5YRzgyN25iS2NSUE9kRUFMYlJpVXI1?=
 =?utf-8?Q?gfrvgafBPMjP1FvJWGFO4uDtB?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3470321-2a5a-4b1e-cd0d-08da91c6c2d3
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2022 18:20:08.6433 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HqMqQuY91VWR3M+3KLuP0OAT2RuLmdoncKbVVoIWyWV1D4unDb4/sT9C+HI2wexfs6uikyzxeIszTdBvRm6OaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7587
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-09-08 09:17, wangjianli wrote:
> Delete the redundant word 'to'.
>
> Signed-off-by: wangjianli <wangjianli@cdjrlc.com>

Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>

I'll apply this to amd-staging-drm-next.

Thanks,
   Felix


> ---
>   drivers/gpu/drm/amd/amdkfd/kfd_crat.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_crat.c b/drivers/gpu/drm/amd/amdkfd/kfd_crat.c
> index 24b414cff3ec..cd5f8b219bf9 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_crat.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_crat.c
> @@ -2284,7 +2284,7 @@ static int kfd_create_vcrat_image_gpu(void *pcrat_image,
>   
>   	/* Fill in Subtype: IO_LINKS
>   	 *  Only direct links are added here which is Link from GPU to
> -	 *  to its NUMA node. Indirect links are added by userspace.
> +	 *  its NUMA node. Indirect links are added by userspace.
>   	 */
>   	sub_type_hdr = (typeof(sub_type_hdr))((char *)sub_type_hdr +
>   		cache_mem_filled);
