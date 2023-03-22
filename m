Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8037B6C4F3C
	for <lists+dri-devel@lfdr.de>; Wed, 22 Mar 2023 16:17:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54F7910E983;
	Wed, 22 Mar 2023 15:17:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2075.outbound.protection.outlook.com [40.107.223.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9470210E3BE;
 Wed, 22 Mar 2023 15:17:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KFe7wHwyiRgJLpT+NrFBbKgzg79c/rTdNYqzf8RlTKezERGZSL+BfwlX7CX/mqUfyHGTC5JqmqSCgQCM6quAhMYwfW60/vte/XSlK05Hsucpa11xyI6m/S+RAQEmEzu+7eeV9wF9KqBNhYDsuryej5q4+dO8cPYAZGH5scmCjbbl+0h9e4K6gR2DV/38zQM26Pjll+cLWGyFOh+EjqR2fV9XMdBHLyN8NbSp0T4hZ+O2rJEspr7H1jT4eqGloxeqKz0ou26/jyXYB0EVk2EbhJAMc8M6K19Fx1iWnNG9x//2gTmG3Zn2+XeSk9RZs9MPrMAIvJjQiogCgV6HX9Fc5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JYtE764gNXS17PYxr3cv0fP9L1IcRqe9bL9kCkdBuDs=;
 b=ltbhNm7IRZymtYllLnZ0NJe0FUqYaSRhDVQYjMw785Ru0BCAxK3WW1Q3WtPhoDSmhagVrumrOkJzAKO0ELxWA6l1OyDDFwGEO8Xn7tMPFgL0Ikiam8OmL17a5GImsiyNKrqDt2y/V0A0WlHfFDGWwJACwoIZYFy2sqooIxlgSNjLZESZcvApR5O70NXTblBMXULdutXW73oWP1OybKiitsrI3HUmGBoUVw3UVz4HoDu/vnRId/EeS7VT4rLVbPuEAqXaFQsIW1VhkA8dI+ag/1vUKbGSb3NZnotTskOBfOAoUX1LmRJCmRrI4J0hU3JoLFIZgQAmREEeUTQC2csb+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JYtE764gNXS17PYxr3cv0fP9L1IcRqe9bL9kCkdBuDs=;
 b=JBtErXAYSOtTwKAnSYJpg6B1m9RdW4GRl3oxKKJKMJEc/3g5BgsFptnvwXTD4BakpWjIrqJyfJr+e01cjzsbasZOIOSEWQceV7Bcb5Wnzyypna8avrEGEZ6+lZRPHocw1EbKRfYecg8ENZdYWLSCJZxVi7kZUzRuIQ9oB4jrFBs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6280.namprd12.prod.outlook.com (2603:10b6:8:a2::11) by
 DS7PR12MB5861.namprd12.prod.outlook.com (2603:10b6:8:78::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6178.37; Wed, 22 Mar 2023 15:17:37 +0000
Received: from DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::cdcb:a816:4bc3:a83f]) by DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::cdcb:a816:4bc3:a83f%9]) with mapi id 15.20.6178.037; Wed, 22 Mar 2023
 15:17:37 +0000
Message-ID: <f9505055-7e5d-e217-d81f-eae0de5afdcf@amd.com>
Date: Wed, 22 Mar 2023 11:18:55 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] drm/amd/display: Clean up some inconsistent indenting
Content-Language: en-US
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, alexander.deucher@amd.com
References: <20230322031419.98509-1-jiapeng.chong@linux.alibaba.com>
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
In-Reply-To: <20230322031419.98509-1-jiapeng.chong@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0222.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:eb::8) To DM4PR12MB6280.namprd12.prod.outlook.com
 (2603:10b6:8:a2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6280:EE_|DS7PR12MB5861:EE_
X-MS-Office365-Filtering-Correlation-Id: fa3b9215-941e-40fc-030b-08db2ae891d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dpHqO/wf2pRyPKhOpWNJapHqH9d6RwqtJsjJXYe18GTiUvhrYw7FCUjDnp+Kmk0uZ3G952c6Ojt4jo6T2cDRRrrkreX8o9b9GAQcjL8NhpzFMYzZsOJE+4YYUoqHlqu2e20MstLRipDG/L00XbICMSLjTPiSdz8AW1+3VTniaXBymg0yGc6xGkWF/4nyetY+u7f5bx9RB17Va8OYUxgo5wshp4PcOUCKx+LgISUVPAucEZCSdijjneEHyJRH3Zpe9tucK3WfXOIbOvP9xQ/2VohqIfexFOpDfhytX/jP9hQOHFK9cg95H7zM9FAoVAUdTaWXGkPrMk4siYQ/uIBTOw/KJPkLAaPTN0cl73nXDdoS9nH02HPZd+4q64BBckWM72Kq4IvNIQHB0mh1kGaRoskEeJ3X7wQ5GuaA8RGMAapcmGkuNiVCAPl5N69Jws+ZbKOLBSh1V2bYQWBSN9ps63I/2w8PQQ1mW3OSf62U5wExcwA8/78Krbe31THYjqSU+pHmpPIvFy9TIefwPDOb8bxo44FXHPhQItE7oH3e8WRl+0I8vt4rWGc8N2qq8F6EJSqIMgX2BuVKH6Ql1obdtxZFBjs8tdHNlBp72AKXx1VTgPYlm/+8rC2sybnahBFe0ap7CzHUAja9CzVtnIqA0SRK+BIDr0aKPSvEIvgN2xdXwyinh+CfgxlXKMA0uNE73lGrtBbkKrbjf8d1RZHE65Re7TfaCOzT4iZp41OxOOs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6280.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(366004)(136003)(376002)(346002)(396003)(39860400002)(451199018)(316002)(478600001)(31686004)(36756003)(6506007)(6512007)(26005)(6636002)(53546011)(8676002)(6486002)(4326008)(44832011)(66946007)(66476007)(966005)(66556008)(86362001)(31696002)(83380400001)(2906002)(2616005)(41300700001)(6666004)(38100700002)(5660300002)(186003)(8936002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UXBWWWlyS0MzcjNOLzJZSFNrdytVR1o3QmUzOVE0M3hHYjdwaUV2cXNjSDNi?=
 =?utf-8?B?UkZ0SHg1OFhjU2RiRFpSSlVueDRDcU45NEhCSVpkQzNRT3o3aFoxaWVZd3pm?=
 =?utf-8?B?emhvcmpML1RGb2VpaWt0c3c5eTd6TmxFUExBRXFJNlczWWJ1TGNBNnFSWXdn?=
 =?utf-8?B?M2FuVVVQUStKemlvRlJnTjQxSGFOZ2hjYjVTS1FpS05FOS9qdWVRQ1JERnVx?=
 =?utf-8?B?QWN0V2JuaXFCN05OcVB4TmVtUzM0bkwwb0k0NUd5YWhqZTZHZGZJNFhSMUw2?=
 =?utf-8?B?OXpyT3BqOE5MY0c5S3d0em9SUFdPeTRMUGxpRzZaRFU2TVBWV1FrUEFFYUt0?=
 =?utf-8?B?clFWdFQzTTBqcHZkbnN4L3RHVEdUazA1cVR2K1A4Z0hMdklUWk9ZQWg0QW0z?=
 =?utf-8?B?SDhvVFRaWFlVWXZlb09GNk1JZjBGYXpsTEhDZC9PYTIxZGRzVm5zUGxBTnN6?=
 =?utf-8?B?bC9PRVlocG43U2Q2Vkw0YjcwbzdmMSt2TktLaUlwaldldTR5QVBSTUpWNnlx?=
 =?utf-8?B?ZGRXUlI4THhTWFh5NGF3WUZMTkc4c2dqK0xrZ3Rha2JSQ3p3RTRSOXVhc2kr?=
 =?utf-8?B?RGZvNWJzYlFGb2JaemNBQnJ5Uy9VdkdESUF2YzhURUROQ1czdWxmekFtUjVk?=
 =?utf-8?B?RGcxQXFzdWVBVm5ENDFvY21nK2lhR2JkSUx0R1NoN3pINFVLMmpUYnFGOFNG?=
 =?utf-8?B?dHEveUxIT1o3M0pORHhkN3R2RnJqU3pDaEhaVG5iZlZMbE93ZmNJSHRENmJN?=
 =?utf-8?B?SklLOVZrZldTcTcxck0yWSs0a0I4QUQweFI3bXI2VktYZFdraHpZblNaNXNx?=
 =?utf-8?B?WXhpN0NXMGdQN0x4cXpzRWJGdG4wUjRvSkJiWDRTQXlBQXordC9LUFNYR294?=
 =?utf-8?B?ZGV4QjRFaXNiK2RMSzhkMlFLNHhsRkhhU1ZvMDY4T0p4a0tWYUMzZThaNW84?=
 =?utf-8?B?ZGcwUWlqUUJMQ3VtU3NtQlhwZDJrdnFSRDk5S2NWMDlRNk8rSDhEUjQ5dlBC?=
 =?utf-8?B?a2hJSlNCY05kNE5reGsvV1pleEdzNWpDT05yQkRTSlpRUkwrVm53SGtyWnZV?=
 =?utf-8?B?Y0dXZ1JXU1AvbXRDUE9INlVtbWlQMjlMb1FTdXpsa2hNN0o4MHl5b3JJOUI1?=
 =?utf-8?B?dkU0OEtpVU1McEFzSk15TUxrK0pSdkdwRjgyRE1WRmpMUGl5NnViRlNwZzFT?=
 =?utf-8?B?OHJRamNZaVFmTExzZU9Qa01jc0FoVUgvUmpSWUdoSENiaWFXYmhvbUlNN1VT?=
 =?utf-8?B?OTUyZHFqT1N4VTd0VTFtSjFXRStuaUViNFhLeU0yRm84aDllRURpTkNGUzRj?=
 =?utf-8?B?ZnF3bm93VWl0VDdWNmpOQXdXa3dDYzNSK0c1dlZFZVV2UzNTaU54dUlUQkF1?=
 =?utf-8?B?RGhtbG9jMmZYL0NFR2pnRTZrVi9KK3IyaFlLaDBNbExYVUUwZWs5V01TUHZL?=
 =?utf-8?B?aEdmMzUvRzhveFBWYjlNREVBVk9rNWtRTW14NlRPRm9KUWRZS0ViY2tyRy9u?=
 =?utf-8?B?OTVLQVA1SmVJYncvV215VVY5bVNrTm5VRnR1ekdkbUdnNXA0MmlXWW1od1Yz?=
 =?utf-8?B?RGVoUFg2SzNQOGF1YmhuNTV1U25iSEZHaWQ0MG5OdkZMbmREWkRheGVuT3Br?=
 =?utf-8?B?bHFhc3h3VjduUTJXVy9vU05CMWpuL1I0Vm5Nb1pmR1JpWE0wbU9lckpmRTc4?=
 =?utf-8?B?aFZzSDVPU3NUNnV5Y3lBS1ZrTUlobnkzSStVcEpQWEFlSSs3OG50SlNvT1hG?=
 =?utf-8?B?bHlXcGFkcmNDSGNYSmtFSXVRTDY5K21acXlkZmhkUk5YQUZhUUJGVTQzYnpR?=
 =?utf-8?B?REYyQmJmdGI0UVR6WUcvNGNpWDdqc0k2Wlc2R1RxbGRNV1dCcnBPQnhBOW9Z?=
 =?utf-8?B?QkF4UnBRYjY4NHdWVmRaU0x5VUVWbjl3a29GR3dGdzFORTVYOVA0OHBMdW1Z?=
 =?utf-8?B?VmU5SUJ5bHZlR2RGWGE5b1FiVnRpNGJSbmM1L2pGdy91NzhocVFzR0NWWW5Q?=
 =?utf-8?B?cXNybkNKOEVrMHE0MHQwZzk1bGl3Zk5XNlg1aDBWanRnSGtveUd3Z3oydm1Z?=
 =?utf-8?B?Y2laR3lneXdCM0VIKzRoVlJVM1lyNHlVME1KSWE0SXZpcXJOTDhjZGZIOTZ2?=
 =?utf-8?Q?DYezJ0jjJJmwVlzB1hSFcG59V?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa3b9215-941e-40fc-030b-08db2ae891d6
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6280.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2023 15:17:37.2120 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P7TUl1BFdxd2iR9eH+LxleGWAweQ1JdZ6sIUV3EiLTGzGswih+3N7cQ7ltiFZCa9Gjpy0/JsCW9WdGU14+l3bA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5861
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

On 3/21/23 23:14, Jiapeng Chong wrote:
> No functional modification involved.
> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=4585
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>

Applied, thanks!

> ---
>   drivers/gpu/drm/amd/display/modules/power/power_helpers.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/modules/power/power_helpers.c b/drivers/gpu/drm/amd/display/modules/power/power_helpers.c
> index fa469de3e935..0d3a983cb9ec 100644
> --- a/drivers/gpu/drm/amd/display/modules/power/power_helpers.c
> +++ b/drivers/gpu/drm/amd/display/modules/power/power_helpers.c
> @@ -758,8 +758,8 @@ bool dmcu_load_iram(struct dmcu *dmcu,
>   
>   	if (dmcu->dmcu_version.abm_version == 0x24) {
>   		fill_iram_v_2_3((struct iram_table_v_2_2 *)ram_table, params, true);
> -			result = dmcu->funcs->load_iram(
> -					dmcu, 0, (char *)(&ram_table), IRAM_RESERVE_AREA_START_V2_2);
> +		result = dmcu->funcs->load_iram(dmcu, 0, (char *)(&ram_table),
> +						IRAM_RESERVE_AREA_START_V2_2);
>   	} else if (dmcu->dmcu_version.abm_version == 0x23) {
>   		fill_iram_v_2_3((struct iram_table_v_2_2 *)ram_table, params, true);
>   

-- 
Hamza

