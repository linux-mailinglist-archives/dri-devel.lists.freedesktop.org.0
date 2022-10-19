Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F41E560470E
	for <lists+dri-devel@lfdr.de>; Wed, 19 Oct 2022 15:27:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8042910F236;
	Wed, 19 Oct 2022 13:27:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2042.outbound.protection.outlook.com [40.107.92.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAEF610F240;
 Wed, 19 Oct 2022 13:27:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QYc24oQXy1bs3McN9gLW43xM8HYaz5PX6HRC5HUEm/rHX3YH7xtN4aCTyhPXESH4OwROSHh4PncfEE6TWoMuS2io9YPwTRbpL3IoKIBOxeZtCsLErUzxODJRRL7XaZISUR69dBVOJ7WJNDFYX1YXw9rGYxuxs1rMJZNxTQkcvdoQ2DNY48pOhfZqCBbpO1Td43AW3V/MZdQzxOWtW95GVZIYg3WTrPuhHM9Nr1GZwNKpnVt1f7ctHq+njWHx/jmlxbI8QhzJXSyEJz1eJSP9ZrQlbPqrk2nGmBl0ZEMl/UUrFk6/UxKSAGwK7eNenFX1J9INJ6vzBFfCUCivPxIxsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OoqTYRPcgXkgJgHefT+YMxUJ7bzZxO8lnRSa8eDWmWo=;
 b=HAT8QtPB5S0UmtUxOkNljpN4Z6qISPhFUy9IG2vsY8GDLiqTJYJgPCWLf/chTOl0MdW/j9OeMc0wQMR9jSemSC5fW9vTRe1uIvGtMlYdwRtPZ8W/Xw+0qO31s0dam7PuDbHZH6egHIvrpmk1x0dNrQSHYi6WNvdkZfrZcWXyR68kVwrh8oP//xurvb9mniMuQvrefhYgR8bhJ9dkm4aBka26q0Q7MZbAWBna6DWHx+fST/4tT4sVJPG0I1+e4TrZKiKpmoP1omkWjOOzPyrwCWIGDhnGz+cKNNXVHfiDLJj6i6CDW4a8qdkSa6DSh63OUHDn84+z0LWmBUQ6mLB9/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OoqTYRPcgXkgJgHefT+YMxUJ7bzZxO8lnRSa8eDWmWo=;
 b=H7RrFKWFYTh3vQaMwaCH/XFhMaavg5XIanEikOFJgxYaX6Mga+g63VwKyaEIKGNCDYzYNI3XbfkrrlxyS047mcljZKF8ZBLBcL9ZRz7IyXYNPf9d2N6aLamiv31RJxr0+Vqm+aWbyyaNEpGkM59YwVGhn2PULr4vrp5Da+nDIfs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by IA1PR12MB6140.namprd12.prod.outlook.com (2603:10b6:208:3e8::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.32; Wed, 19 Oct
 2022 13:27:22 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::aef3:6aae:b904:e395]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::aef3:6aae:b904:e395%7]) with mapi id 15.20.5723.034; Wed, 19 Oct 2022
 13:27:22 +0000
Message-ID: <faaae681-65b7-0cc5-d413-b8995978d2c5@amd.com>
Date: Wed, 19 Oct 2022 09:27:18 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH -next] drm/amd/display: make dcn32_mmhubbub_funcs static
Content-Language: en-US
To: ruanjinjie <ruanjinjie@huawei.com>, sunpeng.li@amd.com,
 Rodrigo.Siqueira@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, jiapeng.chong@linux.alibaba.com, aurabindo.pillai@amd.com,
 isabbasso@riseup.net, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20221019063115.3757510-1-ruanjinjie@huawei.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20221019063115.3757510-1-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT3PR01CA0022.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:86::26) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|IA1PR12MB6140:EE_
X-MS-Office365-Filtering-Correlation-Id: 63d85d61-7fdf-4efc-6cbe-08dab1d5a704
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NWKyTqA6d5dhj5Lu2dDMWIBuT30caJ+sibmybFT4rEAZxeahWJ0Vjbhu3kDYkY1AplS1L77Wt3zczK6sftdpjfk0altiQOQgxVrxwz/+RsqucP/lCy/N8Z5gVubyT66wn44tUDH7gRNQpVx1lIBnYarFHKKGPKVL9mlzdh2T1h4JNyDxMaQq6pXZ0mjBXxLbp6llK5jjO7WugCDi2UXZ4HSxB9FBnHzSL7+G1XBCshbpK/n/08N/LmJyeerIrDhTARW7K9Jn/dfYUKAQ6KLmQtWm5ORh0Ae8LQeSrEEF3yCVAhmxeIOyRAE8TX8MtC3Pk/JF9Ez2x7XrXuFH57ktnzgQ73hJTYMNf31aCZcKjwTMbtGKH8Nvx1uy7EBcIVCqjJ0bKbvy7AJLRM5hClb/gjSDjvdwRplmjCxFFEt1ziRKLQlyfDiD60xLLV+YlvqVNR+/RnAkkLtHdyf5KLsVYXMMB73Fp7jw2LiWqZac+YhFNnQPRTc6rpwDS0mN+GWw/v7hUFbQ1pvCK8WXoOQLcvbfxHpS8T7J8QRBxTA5c+0ktGHby8B/Ex815TFIK8U0jT/GIGoH5HEeqXxPLWCiFR8GkbTY3dT7dW2tCziDsUvfS+tOnixH2ZZVXCvcyfq65C5MrUZhahwo94mGP+sj83HuzSCCqtjnxJqD8EY3P2Veoj3y/fRxMIROl8Lz8P7t9f3ZG0zDqiAaAAooquIXwy+NynEIRrxcCaUBOiiOdIThtdffS4mXIgeHL575ACT1/gOidPdy772GucauuuLeUhRxp/K6pw7GbMF7BWAXYv+eNd24Kh4e7hQBRpdn2HC+
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(346002)(136003)(39860400002)(396003)(366004)(451199015)(31696002)(2906002)(5660300002)(66476007)(8936002)(83380400001)(41300700001)(8676002)(6506007)(66946007)(44832011)(66556008)(4001150100001)(921005)(36756003)(2616005)(186003)(478600001)(26005)(6512007)(6666004)(316002)(6486002)(53546011)(38100700002)(86362001)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TUhOTWsyYVRkQm8yMDFxQ1p0dFFnV0RZTkk3WU5EOUNqaXVsd2NlVGF2V1VN?=
 =?utf-8?B?RW9zaTF2MFJXZXd4QWhoQnRCb21VeHlDQmxjQkM0WXNwcnIyMUdkSGcvaXda?=
 =?utf-8?B?YzlzaFZRV0laU2F2U1RyV05reWxCMXhOVmdpWXhyTUZoT3ZyMUNURUQ0QjZz?=
 =?utf-8?B?VzM5VjhuUmk3NTZaYWhNV3BUTCtNdkMvVU9sZ1JaV1JQT2kwa2hQS3cxUXVY?=
 =?utf-8?B?VmdneU9nU3hXT1VqUlpGMy9KM2FPcmtFYXRnUS9BRFV0dmJrSjZkWHlZd1hy?=
 =?utf-8?B?Ym5SUENKQ1dtM3JvSDdiR2d0clJ6Y09PdmttbTNqMm1XaFVHMm9RazBHdXJX?=
 =?utf-8?B?ZWhZK2lEZkwvTmlvZXJ0eUdOWHo4b1pCeTR2SVh0NlpwaFMzdnNBU3FIdkZq?=
 =?utf-8?B?ekRibkdlZVZZWHVjbTRLVGVSeUh3NHdRdWY4c1NTdmRpclkvczVwR1RIbFVO?=
 =?utf-8?B?RFJ5MEtrdUVSUUFFRjFUTU5kNGMydUVYMjZoWlpBa1dSMGs2YzRYaFJ5Rkhl?=
 =?utf-8?B?cm9DOTA1eHg5VWNpNlA4VlNoWHU4Z3ZXWGpCNmtuVnhMWUsyUzkwNmpEL3R4?=
 =?utf-8?B?MDdmbUFtQkNhb3N5NzMrVkhZMEJxS2hDQ0kzRXpyWkhTbFM0eVVKRmNIMENm?=
 =?utf-8?B?VUJVRkY5NStUVDM1eUhkTUx3WVMranRtd1U3NlZDQUU1dG4xVExUVFlVOVUy?=
 =?utf-8?B?Ry80TGlMY1pQUkloWG4yd2w3MlZUR0ttMks0VUNNOEZNT08xVlRTYWU1aGtB?=
 =?utf-8?B?T2dCaVNOWmRKRWYzbVc0Wjh2bTRZUExxVk9YTzhOcnN5NG5PVzZmaVJtckwy?=
 =?utf-8?B?OW42NzNLNnFHdUNFemlLc1c1T3lxbS9CL1JCVklGNVJNMzRZeDFhcXYweGIx?=
 =?utf-8?B?cVZZLzJ6KzN5Wkk2aVlCTFdwUUh6OWpwQkhOQngvSFF1L0NVN2dBVnBUbHY3?=
 =?utf-8?B?emhTZSttVFV5a085RHo2SkdndUcrSW9QcGdsT3IrbkE5NGJUL045R1JKL2Yw?=
 =?utf-8?B?MDBhTjhoeDhaRXlQRTNHQmh2dHVMQ2VTd0JFajNJVGhnSkpyMjdDa2I5RCtE?=
 =?utf-8?B?RmFrb0EvR2tUSW4zSW5pd3hiNXZXYitzeHlwZDB0d2xCT2JqVnJYeExNa3Jz?=
 =?utf-8?B?V1RuU3YzY2hXOUFMdkNmVFJYVzNuZ0R1blNPN2JhUktWNFlqcXhoN1Rjbkxj?=
 =?utf-8?B?WU93ZUtFYkR6ajZpTkhvQ2c5OGJjZGN5bEh1ZHZSMnlicUswKzdabnB5NmdZ?=
 =?utf-8?B?alVtYks5bzFpQTRMN1BlMmRIc3dMTmhHQTZRS2NHODVMdEovRE9pR1NvRlEz?=
 =?utf-8?B?UjJqNUpaVklZanBmc01WMmxVcVR3NG15MzhvSU0zQU50enF4OVBBNXVuYmVO?=
 =?utf-8?B?OUNlMmhjUG16NFV4ZzdQNk4rV0owcUw1dFRySjlYclErb1VwUm45dzMrS1NM?=
 =?utf-8?B?TkpRcmtMQldiNzYrSGVXZWYzelFqeGFXN1JvNkpsVnBNcE0xOXczK1N2TkRw?=
 =?utf-8?B?N095UnkyRDNNR2wxcWxIR1hqNUhsOWNubW53VUMzM2RHTE1GRG5NV3dkaVYz?=
 =?utf-8?B?US8xQ3dmamk1K0tCaEhrN0swK3NyQi94RExuemEwRzlqK3pFbmJTTDluTnhP?=
 =?utf-8?B?alFpSm1uL2lWR2lkU0s0ZDNtekhWcGM2b1RkOU0xWDBPMUVpcWZEUi9FU0xa?=
 =?utf-8?B?YVd0d09mWHVXQXZzT2hoYnhDOS9hb0RIZmhNYzgySUc1V2JhdzdleWpVdGlQ?=
 =?utf-8?B?RUNkbXMxTmlTYXhJU1VLaG16UHJ4NS9Ib3NId04wcVR0VjR1THZHaUI5R1k1?=
 =?utf-8?B?aE40aXFPaVh3MWgwNW8xRCtWdzBLUWFySUwyZWZMQ3lxUFVzVi9oYkpRcU5i?=
 =?utf-8?B?NW9jaExHZFdXbnZWVkJ5TmIzcS9qT1JmL3lIMlR5amM1RmQ4ZG9HaTNGejJS?=
 =?utf-8?B?bkRHZU9ablFVQkl1K0dGKzJ1bG1hUUJmKzNTeXpPNTZzd0NYVGJXcm4xTk9E?=
 =?utf-8?B?b281clpxaDI4Sk8xblp0VXVIT3p3MmJpNTcyY3JiSHZ6YmZTcGhtSU5mU3Vn?=
 =?utf-8?B?TjZHbU1UMG4zV2tqTXNDeTltdGxZUDNoSTFnc1JCa1hULzJWR3hFdThXWlRs?=
 =?utf-8?Q?xPKHcZQ3UhhB5Ya2MTHVba5aG?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63d85d61-7fdf-4efc-6cbe-08dab1d5a704
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2022 13:27:21.8644 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uBD/qpRa49MJIF6jRtZLt45vTRF1fyYIfsCyEZPQwwFILIWL32w9Z2S5C7WoP/wO3HubRuvLy+j5N063u9GRGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6140
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2022-10-19 02:31, ruanjinjie wrote:
> The symbol is not used outside of the file, so mark it static.
> 
> Fixes the following warning:
> 
> drivers/gpu/drm/amd/amdgpu/../display/dc/dcn32/dcn32_mmhubbub.c:214:28:
> warning: symbol 'dcn32_mmhubbub_funcs' was
> not declared. Should it be static?
> 
> Signed-off-by: ruanjinjie <ruanjinjie@huawei.com>

Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

> ---
>  drivers/gpu/drm/amd/display/dc/dcn32/dcn32_mmhubbub.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_mmhubbub.c b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_mmhubbub.c
> index 41b0baf8e183..c3b089ba511a 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_mmhubbub.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_mmhubbub.c
> @@ -211,7 +211,7 @@ static void mmhubbub32_config_mcif_arb(struct mcif_wb *mcif_wb,
>  	REG_UPDATE(MCIF_WB_ARBITRATION_CONTROL, MCIF_WB_CLIENT_ARBITRATION_SLICE,  params->arbitration_slice);
>  }
>  
> -const struct mcif_wb_funcs dcn32_mmhubbub_funcs = {
> +static const struct mcif_wb_funcs dcn32_mmhubbub_funcs = {
>  	.warmup_mcif		= mmhubbub32_warmup_mcif,
>  	.enable_mcif		= mmhubbub2_enable_mcif,
>  	.disable_mcif		= mmhubbub2_disable_mcif,

