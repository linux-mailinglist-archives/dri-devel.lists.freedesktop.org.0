Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AAB0570DF6B
	for <lists+dri-devel@lfdr.de>; Tue, 23 May 2023 16:36:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99FCE10E444;
	Tue, 23 May 2023 14:36:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2082.outbound.protection.outlook.com [40.107.93.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DDCB10E09F;
 Tue, 23 May 2023 14:36:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RZQJEbrQLzsxomB8Vv74XCfidS/5zhW18+1l0DlO1sPOriCVvZ2OfvgigLB3eiKkXv5h7eEdaeaGlSWouHKzDn0YumCYeInvLrKdrReAJidJteX40IPRENo6kPxTp/GbEsif8+cGXIC25qpOfdoCTLDi9/orrnDf/izm7gJdIoXC6/FJQn+pUkdQDDn2fhhCk8CQFinzxDDpq9B0DXYFAhXsUThnkJTbUf6Cc+5ikhnn2gtX9cEbsuxmO32G8moLs1i65f2Ta0xrbrCsodokkAUhfJuu7KUXbf/KlnS0XVOvDrOJsAVTMjS+78LdQbVK8V1r4di2GRqMQxg9eaTEGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FRBXrDPnExFzNFtiFrF5d/kagU00kAvj1SvIkoNHsXo=;
 b=bi2Ng20v5j8I2f57qSY2GXXTN8ia/H2fA3Jkt/1DiPe6JMGcsbRQbBMk06ucryYwuHJC7/diYgd5WSl4q6Ptcx9CUp+HWrAkdmZFIIjlGW50IOMVwko1Ta1dhFzxAwYN6iRW6jFNgX4E1uNX9OcAFTzoTG1F7xPr8kqOCk7ugkRwPGdrJPFY++t/mJyzdSeGm7hJB4t+7LAFGDHFcMPVrDlX6JPl8g+nVwP++yn1Bg1RdZ8Ad7P7V9zBoyyKE/2IvyfuZoDkluZjDbcqJGgzwf7uD/rRx57k645+VIwGpoi/SrqqezNIWu5M098o4QbQUC0R3x1BMBD1cUSAHtgm8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FRBXrDPnExFzNFtiFrF5d/kagU00kAvj1SvIkoNHsXo=;
 b=dIA5Xzsamtm68p+CTYKtCTVakaJnAJC6AEjkZmNxPyhNMjv7uznXeex8xfvhU1FSm6Sa5ylIPzQDPNKsKueDXhvZplkPDtNtq5VPqF/YEyg9TpDuKJ+1EqObL/wU0eskYBZ3fDFoxtM/uCYByfeGETPC/EWoSjIMHSm2BF2MAd8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6280.namprd12.prod.outlook.com (2603:10b6:8:a2::11) by
 SN7PR12MB7370.namprd12.prod.outlook.com (2603:10b6:806:299::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.27; Tue, 23 May
 2023 14:36:40 +0000
Received: from DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::fe53:2742:10f9:b8f1]) by DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::fe53:2742:10f9:b8f1%7]) with mapi id 15.20.6411.028; Tue, 23 May 2023
 14:36:39 +0000
Message-ID: <461a4c29-b60f-a2fc-390b-7a39c9cec451@amd.com>
Date: Tue, 23 May 2023 10:36:34 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] drm/amd/display: remove unused variables
 res_create_maximus_funcs and debug_defaults_diags
To: Tom Rix <trix@redhat.com>, harry.wentland@amd.com, sunpeng.li@amd.com,
 Rodrigo.Siqueira@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, qingqing.zhuo@amd.com, wenjing.liu@amd.com,
 aurabindo.pillai@amd.com, Samson.Tam@amd.com, gpiccoli@igalia.com
References: <20230523114937.1080767-1-trix@redhat.com>
Content-Language: en-US
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
In-Reply-To: <20230523114937.1080767-1-trix@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQZPR01CA0073.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:84::28) To DM4PR12MB6280.namprd12.prod.outlook.com
 (2603:10b6:8:a2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6280:EE_|SN7PR12MB7370:EE_
X-MS-Office365-Filtering-Correlation-Id: c5ac19e4-53d0-4850-e54f-08db5b9b1e77
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: I1KomlQSqO4K31Zk7LNxVLSkJ6EJcpy7tNzvKl9hSMDIRWL2B+wuvsViE+3qO6d794aGWSx0gc/AHi6XUnzMTHXNSC9aaEv2Uuw42uY0sXoTlPoxj8z8E1/NLySKIK6GBpZ1eVS/D37/yeFSfesiCxmiZgBtj+DUB3u3MSja23NqWdeJq1v4mR417wbI0lF/3+D9PQtbig+e1nQa70H1LQUUp7CLgVrRM2GwHu4px/4lz/nBcs0zZC3Ir9/SMaYDwbjc3OfYZtXwWIagDsoKN2u1VPLWCQ4NC0nyo4bIVfpclReX4WOo4YV3hPgij6d/dRC7SIFg1IssVcUuVhWvovEq+aBvcfhkKlAgBcKZUuZTGT3wPtHyuiwi508nXv9/XaiC71xfHbqxwfSYs3nywzOiUOYmU8K4oX2WRwwU21ynUxqj81r87clIxmPqCdac/ovN+8wM7bdlugMWwIWZMtxuvd+F7fmWVvV+vPrMhfY0XsgpVPDJjgKh5TQwBEDWssPeWZYF/fSZBRrlu7P7IXRy0GSS4mVu1VLrQUlnvkPkH/ta6Qt0QKXu8FVYNuy06wYsiaBMb1Awe0lBt93dnYJ6LvwhIQz2j3LipUfEildVIq7O2PVdTpcXIcUi10BooLYdWFxeaw1JRgykOcDlx3lUjxvUwqDFHGQc1Qz9fb0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6280.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(136003)(366004)(376002)(346002)(39860400002)(451199021)(6486002)(41300700001)(86362001)(31696002)(316002)(6666004)(2616005)(8936002)(8676002)(36756003)(186003)(53546011)(44832011)(26005)(6506007)(6512007)(5660300002)(2906002)(478600001)(31686004)(921005)(38100700002)(83380400001)(4326008)(66946007)(66476007)(66556008)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UXZ5UjFCV240N1cwNE80ek9KWlAreFRmU2hYOFBYc1M4aGhKVUlWTHRrZFpx?=
 =?utf-8?B?bFlNcS93aWhkanZBdDAzS3NiQ2dHbWt2Tmo3Q2c0VGdlY2NEZGZWRmYxN3Vh?=
 =?utf-8?B?UFdCYXh3enhNcW5wdTVwRHh2a3ZmTHJHT1ZOak0yN0x2bjZKY2VkbVRyb2hY?=
 =?utf-8?B?T201TE01NUZKbnlzanNIR2luSmd0eFRhR1NDNjExWmtOYnR3amhsNUkvSmll?=
 =?utf-8?B?RjRBV2NqSlJDc1ZLMkVWcTBnWHNPRTVUcytaeWV4aHZQUEw3ejBKUUl2ZUNR?=
 =?utf-8?B?MldSYzYzdUhKQ1BrejkrQUJ3dFN1Y25yQ2JZYXFTYnJ5TEIxODJ1OHNpVkNo?=
 =?utf-8?B?N2RJNTVueDdXL1FseTdPNDZHVmRuZ2ZnM3JPMnduSFN0SmdaYUFTeStUVmVU?=
 =?utf-8?B?MjJRSnlNeEtDbzdHWEF2eFNmZnZNRlNsRVFkTDlVUXgxKzJSc1hVYVVmZC9L?=
 =?utf-8?B?WDFObjNjU2ZSYTVXcWZBR3R3VVdMbUd5YlVsWG9rZ1dDYzdtQllORHRRazMx?=
 =?utf-8?B?SXA0dVlISXR3Mnd1UjBIYnVjd3dhZGFucE5zR3QzK0hWWm14NFN1ay8zSFdB?=
 =?utf-8?B?TVF2ZksvSHVaSk5EK2JPZXdhaU1VMGpyMXpKVnJ2d3R3N01PRkpSMy9Ga09T?=
 =?utf-8?B?eWlEYjlpTmFyOUhHQ2dwVm1iTFVUSXVHYndoSk9zVHd5UzcyTy9PYjJYRFZ0?=
 =?utf-8?B?NjEzZ2Fnc1Nmc2t1VmZlZHlBL1RtUy9uM3daMzZiTmc3Qzg4VlBQVDhiY21p?=
 =?utf-8?B?R2R0cGZVdWxMWUVNZ21obFdWTkJMdC9xc1NRSGhvTlc3VW11Rmd3RWFxNndQ?=
 =?utf-8?B?SG1aOTNYWVROR1BKSjlaNGNiY0Jadnl0VWpvMFBkTzBWclNOZDBBenM0OWt6?=
 =?utf-8?B?d2tGMjgxU1BhRlJvTkI0czk3bTRuVjdMU3l2WTFoNGdGekhZd1BkeWx3OS9C?=
 =?utf-8?B?SVdXVU1hWWtESVgrWGJza0FZUDFNNFdHdzFnQ0hnZVNlNWN0YWJBcTJIOWRz?=
 =?utf-8?B?SmVDSU0rVm1XeXVZMHFIMjJDZ2J1OU1Qdkh5TFhIT094UHh0NUNkNG9EcXdy?=
 =?utf-8?B?QjNJc1F6cFdncmpRSmF4ZWVON0s2RUl2VDJJRjVCYkJnYW8xQVhiM1NYTXl6?=
 =?utf-8?B?Mjc2NWVrSXFLdU8rcjUvY0VGWndFSWxvNEFKSXZqVFFUSnZrbm9sZjNVQnJL?=
 =?utf-8?B?S1NRZFNCSlQvcngxYWtLOXZ0UXNmTFZiZSszTGsvb0MwZW9FUENvbWRDS1RD?=
 =?utf-8?B?bmZ1dmE1UWhLMzVoQ3VkN0Fzc0xPbUtKZHhGdzhNK3ZGQkw5dXJDUlk4bVpU?=
 =?utf-8?B?VXRnWXUwQkNnUzNnV2cvTUpJcnNvbUlRMGRlSjY3clNwVmt1dkc4NDg1Nmtj?=
 =?utf-8?B?UndXQ0JPcCtTM09PeXVObTdES1pHK3FVNDZIMTBHekF1aFNiOCs4RWV6cFFX?=
 =?utf-8?B?Ui9Ca0JhbE80MDJnSVFmSlpWcVN4S1lxWVBtN0lCb29EWGJsbHpXTWN0SnIz?=
 =?utf-8?B?bzhPMVNkdi80MTVMZ3Y0ZzJoUktmL0RpSk1PS2VtZzZPY3gwM0ZuY0RVaXZU?=
 =?utf-8?B?djZnRWc0Zy9KZzJhZEJPNStMWlJSMnNmaVBaMExaaEd3cnZHbmhWVk9lWEpu?=
 =?utf-8?B?N0dwWUY4ZnJoRmY0a0lWRUdiaDRvbGExa1dKbzFBTzBiUjdDaSt1bFpSQzNT?=
 =?utf-8?B?TmdvaklpaWJhZmhtMmdoTWMrLytLWEVQeWhFM1VlUXN0UktGaHdpK2RiR0dN?=
 =?utf-8?B?L0o2ZzRicGFqdW9LbUV0QUlXMllMSDllUEdmYmJ1RnByQXZISVVFRytrbHlC?=
 =?utf-8?B?QXBza0ZwRFpiM2U5eE9MMkZ6REN2cC9tYUtoeElZNWpLdzkxbUZtYzUvS25Z?=
 =?utf-8?B?dWs5cDdEZndLREV1eElyMlluaXNoNXhwZ1FBUUtYZ1ZBTXV6U09ob3owM0Q0?=
 =?utf-8?B?YzNNQlZLYW1KTEVISWdtWHgxTUN6RFBiWWF1ZEdQdUR1VklmK3RMemVSOWxh?=
 =?utf-8?B?VnEvaHFTVWUxajJzd1R5dWlhQ0VwUEsvM25QZjdKMWdFSHR2alJLLzdvZ1Y1?=
 =?utf-8?B?SGFLOUNrM0VGV3pTQWVCZkVnTGJoeDBQSkdqZjV4aHpGdm96WExXZkdVamNB?=
 =?utf-8?Q?zKkAygrYDUFCAg3L9Brp9YmGE?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5ac19e4-53d0-4850-e54f-08db5b9b1e77
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6280.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2023 14:36:39.5873 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tTKu7IS/WSWfqo8j0ym+2Ym8Ym/qriZ1SAg2HfaXDEt88V3kKdgWnl5YUakFuVq8jfNJxqjG2qy4WeKc44KLdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7370
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
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/23/23 07:49, Tom Rix wrote:
> gcc with W=1 reports
> drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:1069:43: error:
>    ‘res_create_maximus_funcs’ defined but not used [-Werror=unused-const-variable=]
>   1069 | static const struct resource_create_funcs res_create_maximus_funcs = {
>        |                                           ^~~~~~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:727:38: error:
>    ‘debug_defaults_diags’ defined but not used [-Werror=unused-const-variable=]
>    727 | static const struct dc_debug_options debug_defaults_diags = {
>        |                                      ^~~~~~~~~~~~~~~~~~~~
> 
> These variables are not used so remove them.
> 
> Signed-off-by: Tom Rix <trix@redhat.com>

Fixes: 00df97e1df57 ("drm/amd/display: Clean FPGA code in dc")

Applied, thanks!

> ---
>   .../drm/amd/display/dc/dcn20/dcn20_resource.c | 23 -------------------
>   1 file changed, 23 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
> index 7dcae3183e07..6ef7e2634991 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
> @@ -724,22 +724,6 @@ static const struct dc_debug_options debug_defaults_drv = {
>   		.underflow_assert_delay_us = 0xFFFFFFFF,
>   };
>   
> -static const struct dc_debug_options debug_defaults_diags = {
> -		.disable_dmcu = false,
> -		.force_abm_enable = false,
> -		.timing_trace = true,
> -		.clock_trace = true,
> -		.disable_dpp_power_gate = true,
> -		.disable_hubp_power_gate = true,
> -		.disable_clock_gate = true,
> -		.disable_pplib_clock_request = true,
> -		.disable_pplib_wm_range = true,
> -		.disable_stutter = true,
> -		.scl_reset_length10 = true,
> -		.underflow_assert_delay_us = 0xFFFFFFFF,
> -		.enable_tri_buf = true,
> -};
> -
>   void dcn20_dpp_destroy(struct dpp **dpp)
>   {
>   	kfree(TO_DCN20_DPP(*dpp));
> @@ -1066,13 +1050,6 @@ static const struct resource_create_funcs res_create_funcs = {
>   	.create_hwseq = dcn20_hwseq_create,
>   };
>   
> -static const struct resource_create_funcs res_create_maximus_funcs = {
> -	.read_dce_straps = NULL,
> -	.create_audio = NULL,
> -	.create_stream_encoder = NULL,
> -	.create_hwseq = dcn20_hwseq_create,
> -};
> -
>   static void dcn20_pp_smu_destroy(struct pp_smu_funcs **pp_smu);
>   
>   void dcn20_clock_source_destroy(struct clock_source **clk_src)
-- 
Hamza

