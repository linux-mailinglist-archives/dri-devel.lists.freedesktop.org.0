Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D42FE7E5B40
	for <lists+dri-devel@lfdr.de>; Wed,  8 Nov 2023 17:32:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F09110E174;
	Wed,  8 Nov 2023 16:32:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2048.outbound.protection.outlook.com [40.107.102.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3BE010E174;
 Wed,  8 Nov 2023 16:32:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OkyQ+fy4tpz//BaClcjI05jaoHdcSEAu/e/QjxxzWsVzH++npAzj/NfJoWZ8Dyf76X7jJcBtJOkdpeV2lBhRdOShKPfp1Ti/Yw4Ocu3z6wUOnd/QLP9uXuBKvvV2qjU0FNt+GOkvU80dkr2SZEBqqsQJ/W+zCLn3Tb9qkJuB9VCEwCkj+ArVhwe/mG0LBH6WqfqFNEBHD4yUbQOT2eEwN/l9tb/JRYzPXRMChUo1y68OvkccrURXcGuhR4ZuK2SUTC0Vsg+FjEjVX0l1hO3eXinp0bf4VHtRrGGSy777uUODYVgl+IqXsiytIdjSZRG7bTlBKiyKNfarWYWceLRcgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JeATjArhN3ueL2Vw4qSQ1U6kCHCLsBAk268kd+Ogumw=;
 b=NmrGfl2Ix9UETL9JSiOmpw6Ud36a6TdLz32Vi3stXoE++u/Hpi5GDiOYQ7e94qFkLeZe75DTdehL4fMr1hcPCRMhhIAvmjcsBdUJBYZ2gHC1spDnvCJu0rxX68OkRPX8zWK1yGyLE6sfAop+qfqE/FWiJEqWkmSzeM7P/UdMouORVd+ZnxTRkj6S4D4Tr6TuJONwftLBfkV7RRF9BBtbh795GVocwmSpCxBUruBHfzXhQztugmcg2dYx5bbyAtCIrvH2z6zoDY7yG0xCNyioKFb4yGFT9djqZWfW/51Ntt6lOG1THtNlkKYQzL3KQpVR+PB4F31V4rTYOJNKeVPUTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JeATjArhN3ueL2Vw4qSQ1U6kCHCLsBAk268kd+Ogumw=;
 b=Cx4S0vWizTxERcHYG07X/WYOowNDATn93Dbn+Sg3AMhR/4oIM3q1Vc50bg7o7s2hXGIBBienftTC0pBPdCLFMWnzpOMQlE15RbO5al+1J99oGEEUWFfqkoMriKizYvGkh8sOmvb0lVSYz/4t6DDmeRygLrJ/PrQmjMNWVojrv5E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH0PR12MB5284.namprd12.prod.outlook.com (2603:10b6:610:d7::13)
 by DM6PR12MB4514.namprd12.prod.outlook.com (2603:10b6:5:2a7::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.18; Wed, 8 Nov
 2023 16:32:27 +0000
Received: from CH0PR12MB5284.namprd12.prod.outlook.com
 ([fe80::194a:56d:a41d:3c79]) by CH0PR12MB5284.namprd12.prod.outlook.com
 ([fe80::194a:56d:a41d:3c79%5]) with mapi id 15.20.6977.018; Wed, 8 Nov 2023
 16:32:26 +0000
Message-ID: <8898fa73-8777-4fba-868c-7cd9d1d22b0f@amd.com>
Date: Wed, 8 Nov 2023 11:32:24 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amd/display: remove duplicated argument
To: =?UTF-8?Q?Jos=C3=A9_Pekkarinen?= <jose.pekkarinen@foxhound.fi>,
 harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 skhan@linuxfoundation.org
References: <20231029093926.137766-1-jose.pekkarinen@foxhound.fi>
Content-Language: en-US
From: Aurabindo Pillai <aurabindo.pillai@amd.com>
In-Reply-To: <20231029093926.137766-1-jose.pekkarinen@foxhound.fi>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBP288CA0016.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:c01:6a::15) To CH0PR12MB5284.namprd12.prod.outlook.com
 (2603:10b6:610:d7::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR12MB5284:EE_|DM6PR12MB4514:EE_
X-MS-Office365-Filtering-Correlation-Id: e5c0c973-b7e8-476f-4ac4-08dbe0784b08
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QlZ0ejtMUgO7Ejb+HT+QWrBIZ8xp9tvFjpgFrIvLzw/GY6DGeJf7rtFNcjt2Ixr8WFhpiJU/wkSaSi1NnGNPsmffBZIEgFdKKit8mJSwjCLfqob0stiispmmbhmosHbCrscPE8aXHJERuB+ID64Wh3E0pLgd7AprjWwOGOdVd9fxwmfE4DGFAye/wxh+96IsxVBoI8+AEycWAfQSQP4FpEPFPc6QJ+66PM7YOfYoTRNv0MWVbg5aA2Ojd5zMBQaxZBXePVS4Vq8gNrloV3k6wAvSBacrwUlumhTE24PYc/aGAe+ntA0MuOyR6rvXPP5wMgCpIAOK7niTbw9aZnpNoc99YCDPGtvJS4T8UrwC1w0GM6NpRIIEEqZNeAfFWXy/jDQKPLXxok9c5/K/pwi965F0mFLOc0IMaLGVDvTbASPys8VPXlSSliC6+nmq4CW9HQOvK3t/hi7roLsXXGyRnEWDsMX5BK0i1NrKgIhOewmgI+W64WOSgFK/Yro9MOeQmgMkr9l3fhRz3HKuQarwVPIAEgg3nS+ndbeJstybPAn4J5Z5N1LO+DOCinXlWpM/6FDKouHNISHleFABitq9xOZMVe/Z1JtRvkvu9a7Iw0mTX2g0uRQA4e9QTbn2V2DH0mVsGuhy6lgMBpwoKBZdMA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR12MB5284.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(396003)(346002)(366004)(376002)(39860400002)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(31686004)(8676002)(83380400001)(8936002)(4326008)(2616005)(6506007)(6512007)(6486002)(478600001)(53546011)(316002)(66476007)(66556008)(66946007)(5660300002)(31696002)(4001150100001)(2906002)(41300700001)(86362001)(36756003)(26005)(44832011)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V1RlWGlzUmVNL00wSlplTy9WaEk2eEc0bXZ6TU9uR0hmN1NHb1ZsL01xUWYw?=
 =?utf-8?B?cDRDSUo1WFpUNzY3Y0R1am9wbTRmdFJESkVUV08yNmdrM2pkdHUvejNyeHJ6?=
 =?utf-8?B?TEd4azY5R1YrZUI4VlMrYzdaUHIwMFVpTlpWVjE5UnlyRmpTMGJEeXNLL1o5?=
 =?utf-8?B?TmJyWjh2K1lmckRHbHpNcTN6OENYYUFBRnBnLyttcGllK2NpcUI3bXdNOS8v?=
 =?utf-8?B?REVRZGZnWFhlTnptd3MyT1FhclZRL0J4alZ0OVUxN0pBK01UR1FNN093SlNy?=
 =?utf-8?B?QlA5K2VhbXN2WmNiSVlQL25tUWxsMERpQk1RR0dqdi9veUc4SXpBcXJjVng0?=
 =?utf-8?B?dis3OWZtZFRaekZybXJmWkhpVzZ5cnVyL2NzYU5BQ2VxQzRGS3Q5em01T3Jn?=
 =?utf-8?B?TklyZVRXaXdTYmNKM1pOeVZLcTJqVWsxTG5CNEFoNVl1Ny9aMnFxWDN5d0l0?=
 =?utf-8?B?RlNxb25ZQ3l3bzRsS082aUtadUZtVjhyS3doUFEvWGc5azRnYWVJaVFRY0x3?=
 =?utf-8?B?K3JUTVZHRUpoUWhlTzZsZFRiWHkxTVV4UUp1N05KNlo0YmFnemM4UTFiZzRR?=
 =?utf-8?B?REJwdy9PWk5DRU9ubGU4bmlIRVBJR0tWQkJDZ0JKaEpZQzcxQjRPaGQ4TlBN?=
 =?utf-8?B?SWl5dG9JRXRzekcxY1VmcGp3TXd3R3RXV2xkcDVZR3oybnJNUE1PRnZOQTBv?=
 =?utf-8?B?Vm43eDJtMWozeHgrK3VMdFBtT2hnWFJuUFVUQkVQMXpNaTBxMkkrSVZBOHZj?=
 =?utf-8?B?UFRRd3lLYWFyU0VrbHp0b2F5a0YxbXpvRG9yeUtIaisvd2lRSVRTUjhRb2JH?=
 =?utf-8?B?SGNKMU9ZMnR5VWtEVjRBdDBHRWdNWTNpRmJBc3VxWlpuNFlxaTR5dGltUUtv?=
 =?utf-8?B?Vk1pMENFb2gzRTVWVXpoMWIzZG5ybVh2S1o2aFpwbVV2bU0ra1M4MFFEVi91?=
 =?utf-8?B?WXJjbm9wbkNFQlhzZUlpVUt5bkd0N2Zsck40aGJCQlRlTGM3TkgrRXFnNkJM?=
 =?utf-8?B?UE5kcTEwaDAvdXl6akxhRmFMYWhkQXI4R1lqeVk4RU5mNFdEV0hFWkVMY3RF?=
 =?utf-8?B?UGx6Q2VReUFNYi9nOXJOYkxsQzN0WHJuQWxqN01HUFFiU0RyRjFVWG45cERQ?=
 =?utf-8?B?VkpFYWQveGhjUUV5SEd0ZkxkYmxUWlF5WjlwODVpTHg3V01laEc3VlJaWXFD?=
 =?utf-8?B?UkJVSnBXM3lwMGZld2N0QlNPSFh6S2RSaE1BamNqUEZtdmUvWjcyWjVBendW?=
 =?utf-8?B?aUtIMHlhU0U5UUs5UmlUVWxFRkdmdUowVVgxbVdha1JpQlJoRzk1aUxGTGhG?=
 =?utf-8?B?dHZhQWJOUHFvM0pyM2RsMnZWa3E4ZC8yazJtVGdpOEdVVUNjRGhYVndVSVIw?=
 =?utf-8?B?U0dlK21iL1VkL2lvZmR1eFJlcXphQ3BqTXUwdHNUN1ErTnhxY0xKdnhJN1d2?=
 =?utf-8?B?R0JtODVLOGhOQzhjU05RTTZ5NW1KWFcyelJYb3o4WDJEc3o0Nk96VWtLYWE4?=
 =?utf-8?B?SThJZ0IvdVVFQy94UWtvcmc5ZnYycHRVVUpOaXRqZlFwL3E4cGtlSmxXTk5K?=
 =?utf-8?B?cGRRK285TXNoT0hDSHZhNHlDQ1JsL0drU3Blc05oQnBuc29nNGVKdEkrOHRG?=
 =?utf-8?B?d3ozNmRTN1VZeHJsSS8zU1Z6a2hNTHJqT1pYdkcySVBuaWNkNGM4cHVOZnI3?=
 =?utf-8?B?dFpZQmM2ZTFhaDBJVGpQODVQSVpCV0NKWkVhVU5WZDR0WU5oTHY3TWRVSzRS?=
 =?utf-8?B?MjFDcU5YZ2ZlRkd1cDB4RWoxM2JBcG5hbkpoZE5Yc3RFWmhpSExoeHJRQnVt?=
 =?utf-8?B?ZjF0QU1SZ3pUMVp5YVIzRGt4UmxkRS8rQ2c4MDAyblM3bnVmRVlrTDJNdnhX?=
 =?utf-8?B?NHQxUHRGRVdBajRWc3RyY3MwbWJhWG5nNnVxc3hTUE1GOEx6ZjNvZDJUYnVN?=
 =?utf-8?B?UVpiYUJGTXgydlhibEswaFZGVnlFVUtqK3Bxa0NzTCtqSHJhVHIvRFlCOTFk?=
 =?utf-8?B?bTBuTkUxdGttUHRhSFF6NWw3aUR6TlNHd1VjaXlUVlZlaFZYc2xrYjU3NHNV?=
 =?utf-8?B?RDFmUmk1dDBIK1A2ZzZadjMxd0YvK2ovSCtYVkh0VlJXVTFPd1NiMU5KdFRX?=
 =?utf-8?Q?vkWPdaZwMSwBDyfPVRcAsxsyC?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5c0c973-b7e8-476f-4ac4-08dbe0784b08
X-MS-Exchange-CrossTenant-AuthSource: CH0PR12MB5284.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2023 16:32:26.4647 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TA8z8XzOjooOTMhxp8YeA8gL8YzGXyRnAT6TJeRgxQFAlH6w0dzzkV241ThnmO/wIYqejgNRKh/ewnrxtHbIqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4514
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
Cc: sunran001@208suo.com, alex.hung@amd.com,
 linux-kernel-mentees@lists.linuxfoundation.org, qingqing.zhuo@amd.com,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Zhongwei.Zhang@amd.com, Yao.Wang1@amd.com, dri-devel@lists.freedesktop.org,
 Jun.Lei@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2023-10-29 05:39, José Pekkarinen wrote:
> Spotted by coccicheck, there is a redundant check for
> v->SourcePixelFormat[k] != dm_444_16. This patch will
> remove it. The corresponding output follows.
> 
> drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c:5130:86-122: duplicated argument to && or ||
> 
> Signed-off-by: José Pekkarinen <jose.pekkarinen@foxhound.fi>
> ---
>   drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c b/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c
> index ad741a723c0e..3686f1e7de3a 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c
> @@ -5128,7 +5128,7 @@ void dml30_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
>   			ViewportExceedsSurface = true;
>   
>   		if (v->SourcePixelFormat[k] != dm_444_64 && v->SourcePixelFormat[k] != dm_444_32 && v->SourcePixelFormat[k] != dm_444_16
> -				&& v->SourcePixelFormat[k] != dm_444_16 && v->SourcePixelFormat[k] != dm_444_8 && v->SourcePixelFormat[k] != dm_rgbe) {
> +				&& v->SourcePixelFormat[k] != dm_444_8 && v->SourcePixelFormat[k] != dm_rgbe) {
>   			if (v->ViewportWidthChroma[k] > v->SurfaceWidthC[k] || v->ViewportHeightChroma[k] > v->SurfaceHeightC[k]) {
>   				ViewportExceedsSurface = true;
>   			}

Hi José,

Sorry, I've just queued it. Should be merged to amd-staging-drm-next soon.
