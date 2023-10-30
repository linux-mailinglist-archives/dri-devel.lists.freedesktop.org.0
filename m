Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D7337DBB1B
	for <lists+dri-devel@lfdr.de>; Mon, 30 Oct 2023 14:52:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8014410E2C4;
	Mon, 30 Oct 2023 13:52:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on20629.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7ea9::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7ECE10E2DD;
 Mon, 30 Oct 2023 13:52:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F3oOkeF4wWNFVx4maxn5gFDyQznnXvHUQZyUqH9nRDlDxwGuWl7zZ4Qiy9bIOHrzDoXmhnh7Wz/dmfRlLUWcG1dHBrFMLd3d5Q7xW8Z3Ru48Z1MNL3GtrwU1RW9cPzBlqqL/XORkEAepKOJpUDcYi1VOMZUfGnHWLqFCIuXAkKro41OvGIPhni0WwEDgxQCYKkELk/7M3v5ed288qdeJdvYNEwWIHU2XXRPXYjsiCTQrToNbAfkktVjgCYPVVBmyVTVJQEdHD1wUTaRujNgHh6LHcuiijvMv/+JBOaC+13LC6ipSwcrwPgoDhVBMzpqUiQ3FUBuG0qzOdQrntRC5YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WAvYyCUfzFWpmUDh+wAyeZQqRi506s2q/sPelqImZr0=;
 b=dVgcJGN7ylLU9f0aZhwhwP3GpTUtK6uH7oCfNrqYSfEBxHWCNgLHjoC5P0tYidf5RF4U3b2B45451tWGOKNvGJaoCoGfECzamVXhygMfZVR9B8Vtlijh1hCBTv/NIegiuIHM983qTu3rY9sisARiznqI7yqvK2gIw5kCt0y9c4frMQ5otLwe9PgW8ey1QHZAEe5jqscwEbIShGFjRRKSG/fqDTgl2CMCyI359Rh9G0+21ZcT9HjtqnmuE7rzk+g05kLHCjs3MMZDVQGIK0mb5BoIWLq8L8JLrKRZZMiWyTNgv4IEIGO0+3dXZSp4XMAt+T0u391KCS3haQyeo1/JTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WAvYyCUfzFWpmUDh+wAyeZQqRi506s2q/sPelqImZr0=;
 b=No5OfcqTMXdcp0nlY1SuXBiD3NWNRh5zWnAbxnCUeVjakVkvUVjQl3+jxD+HE4F1Ot6Lok+zOACbAlM5uf1c3hub3sdnhnFllXvMCsubzvButAncrJsMsGVRE0Xv6j7rwVilF8oLSQP/KZ9J2aOKkU5cHrptvkgm/Jr5iifGrzM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH0PR12MB5284.namprd12.prod.outlook.com (2603:10b6:610:d7::13)
 by MN2PR12MB4533.namprd12.prod.outlook.com (2603:10b6:208:266::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.26; Mon, 30 Oct
 2023 13:52:05 +0000
Received: from CH0PR12MB5284.namprd12.prod.outlook.com
 ([fe80::33ed:3162:e4ed:3569]) by CH0PR12MB5284.namprd12.prod.outlook.com
 ([fe80::33ed:3162:e4ed:3569%6]) with mapi id 15.20.6933.028; Mon, 30 Oct 2023
 13:52:04 +0000
Message-ID: <ce1b69e1-fa38-2e12-1ad5-375ac244af42@amd.com>
Date: Mon, 30 Oct 2023 09:52:00 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amd/display: remove redundant check
Content-Language: en-CA
To: =?UTF-8?Q?Jos=C3=A9_Pekkarinen?= <jose.pekkarinen@foxhound.fi>,
 harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 skhan@linuxfoundation.org
References: <20231029124404.16159-1-jose.pekkarinen@foxhound.fi>
From: Aurabindo Pillai <aurabindo.pillai@amd.com>
In-Reply-To: <20231029124404.16159-1-jose.pekkarinen@foxhound.fi>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0276.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:68::30) To CH0PR12MB5284.namprd12.prod.outlook.com
 (2603:10b6:610:d7::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR12MB5284:EE_|MN2PR12MB4533:EE_
X-MS-Office365-Filtering-Correlation-Id: 2210fe1d-0435-4c48-0248-08dbd94f6653
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TUYzhs0CLnmwr23cS/36s4UeCIRaPBd0wKCFRMpnCEOOqVbnRwuIaZDkv8ftmVqT8yLwThR1HZlbTUE+zOD2oxmQDWAbw24rnmbBdonvTEyQhXzy+aojNuIpO5cu89T5iVKjoMkkaVnyd9dhDoAcJlMubiiEPn3G+GTDpYtWS/xC6+Oq47y4xjIemVbZJCLNTIUInqKu3lwok19Ke+Fq34rT7iY251mtTTznMqPuPUFe0VxSYLTSrjsMHY8G+/E0jfcgmnBy7iHiOTOsdRcSQOnGni/MgcZNEyAkd/bRtfGfR5r6R1g4DWzNLF9wHYmM8XO9OoQBJZRaEtO9YuY+Sqlnn8eIzZbyu6NF2nsDQllKORWPDkKfuleEqLhkl8fXUcda+aguptE3LRC26vD+iaukVoUKHkYiRBf8aOYjqgKCRa3iyh4XymwyRcjvATVQMA0/RjzOxMBmfvltEwerMGzXaMJRXXTjWGZ9kofVlpGVidGPmswLrGkmAmGqFDsfjjMtU97GEgQIo2rqnxVlEmGgWe734iUvtCrHQ5aCjf1ys8ldHMDAPUYubbvWiqYQI2QhvYynyzoK4AifDvNwuMV7pRAAYsp6cb6QUIXpH/9UeqHc7RRNhBtcBkt+R6rXu2x6ngidUN1UiMFT8idvKMyPTeoUsJWPKs1l+Z2LIs+mg2BjBfWHJzgOMC0YPKgf
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR12MB5284.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(366004)(376002)(346002)(39860400002)(136003)(230922051799003)(230273577357003)(230173577357003)(64100799003)(186009)(1800799009)(451199024)(6506007)(53546011)(6666004)(6512007)(6486002)(83380400001)(478600001)(26005)(2616005)(2906002)(5660300002)(66946007)(66476007)(66556008)(8936002)(44832011)(8676002)(4326008)(316002)(31696002)(86362001)(36756003)(38100700002)(41300700001)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TkphMldpTktnbS9La2pVMFFGbGkrcFlwTHZ0aWpaSTRKbHkvVkRwT0JPeUp3?=
 =?utf-8?B?WktuU1ZIOHZveTdHUWRUd29NU29jTEpISDhqNGg5YVBxRHVwY3hLb3hCRmU1?=
 =?utf-8?B?SXJBNW5rdXYrM25Ldm1hbmIyRzRjOXRUeG4wTGdwc21QK2lFWkhmNmhpNURl?=
 =?utf-8?B?ck9WdlA4K0NVcksrYzhESUQ2TnhaaGlrOThDQVJhbjNnL0crSGUrZE1pMkU4?=
 =?utf-8?B?R1RHaWpxNmhvcFJuRDhFV1JVRWs2dHN2Z2VTL01TSjV3R3BpZXovOEt0WjVQ?=
 =?utf-8?B?S0huRUNIWDdwM0hRZzlVMEg5dlhTZkk2eWh3bERrRHh3WTRTV3N3NUlSZDZL?=
 =?utf-8?B?SkhDOGpFMzVJS2NaWVM0MXVBOElMM2hQaFFYU1IyZzBVYmpaVlEwOWVWOUtp?=
 =?utf-8?B?cmw5NTBHRUU5akNFMTdZVTJUc0IvTk1WbkdZcjRDMCtoK0oxWmFrQ1RKdWZX?=
 =?utf-8?B?dzhDb0xzZndub05CekdKOHBYeFJNbXYrZkpBL0xTWk5LS25JS1RJcHZ4NWpZ?=
 =?utf-8?B?R2JRcHVTU1ZtWExPYzVDdWo3YXlsUFVqMDdPTXdpNUdYeVlmUlZ1NWdJZUto?=
 =?utf-8?B?U09HU0IyNC9mbFdsMmZuT2IzVUNzSDFBa0JGc2NoWEJXeFZicG5Pd1V4VWQ1?=
 =?utf-8?B?emJrSi9hcjJZVHN0dDFzZ29yK0lnQkg1WDNWaWRIWVArWURsSmNFMTJMQ3ht?=
 =?utf-8?B?WDB0eWN2bTNSQUpZeEhVMndvS0l0VWEvMWVBSmI1ajRZK09iUmRnY0JobDNq?=
 =?utf-8?B?eE5hMjB3OEFVT3hhWmxlRzdpaGkvSVJuTUhlQ2djbXA3M09jNVFmam4zQnpG?=
 =?utf-8?B?dGZZZlcxRkh0YnFidXFzT01PRXgxNzh4TE5GQk1YYUdxbys2aFo1ZDBxT0oy?=
 =?utf-8?B?RXBLWXFUY0NOMHZGZG01aVlYQU91SjNDR0lEbHRGbWtXQ2pUaXJubnJaUkF4?=
 =?utf-8?B?eXhRaDA4WjlSNUZLQnY1UnZDRE9rY3ZGL0VyaHR4STIwNjJRMDFsNzZXbjVE?=
 =?utf-8?B?RUxua1dGb0huZ2xENEIrY3lvQ0RNMHFVeHp6all0R1hJRE5EZUdlTklJV2Jl?=
 =?utf-8?B?TDZVWHFtWC9MbmlDS3QwSFkycjl2dVMrcTQvSGRSdjA0bG9qSnBFZG1rT2lp?=
 =?utf-8?B?bHdteTBma2dCQTN0MlFnelBIcCt6V0Z4TEpzZ3BqaWJSUXo1ckhvRVZVdTJL?=
 =?utf-8?B?Y1ZSVVBuUzBEK2hNMWxGU05MTzVpUnZORjJUb216cmNGQ1RNakNjaVN5R1RZ?=
 =?utf-8?B?a0tjZFN2Mk1IYXFRZ0tocE9Sd0NrT2xvM3pHQXNuTkFsb0dGMkpvZWZWekhO?=
 =?utf-8?B?TWVZWlhNaWVSeE83WXd6R1RnMUZKZzhEYktKUU53VWZ6MWlsQ0laMEl6K3NQ?=
 =?utf-8?B?NUZyOG05SElucUJoMXdXdzdMcnJRQ1BaWWlXNWtPU2paV2lFMnZIcWc4Y2Fy?=
 =?utf-8?B?R3dVbmpueXVCV1RtYnZPZkM4U3FveWFqS1IzK0RDUnF6SFVLOTh1YnJhL1lV?=
 =?utf-8?B?WDA1dXFTVEtCdXY0RmlzL3ZKV2hYSDBuMnBhdjR0R1Iwa2dhVHBOc2lmeUh4?=
 =?utf-8?B?eHN1ZXBaT3VpK0lvYlJvcEk4YWw1V2tFOFBZM0QyQ0JQTW5JSjdHRXJ1MGpC?=
 =?utf-8?B?QzZ1cUl4R3U2QUMyQ3J2eVlMNExxaTZMRktnMktza25jZVptV0ZMQVFVOFhN?=
 =?utf-8?B?NEZQL0x6VjZVc29VN09rcHMxbExZdXFHM0dBeVZZMFRyVU5vd0h0THhnY0pk?=
 =?utf-8?B?OGpHZlFJdE1oanVXOUV0RDhNMFVvQ1o5VW5aa1ZZWUZibEhkUHhacEgxM3RD?=
 =?utf-8?B?eVhTV3RjU0UvZitGZXBmQ0FmVENDcm9RNG5NdzBTeHVjd0p1d1Bmdmk5d0tI?=
 =?utf-8?B?UU1IelkrNmFEVmN2cE4weDhnSUNlZ0dkK0tsTDErUkVXSzkxQVEzYmpGVGpJ?=
 =?utf-8?B?K21kRWtSc3VWVWl6L05tR2Z0Q1RQNHFON1QvOVNtd3JEVk5YM1FLSUxKZVVm?=
 =?utf-8?B?NHQ3TS9aUms5RjhyS0swK2dNK3JaNnowcmFleDVTT3hrNFNLQlRkUlJzQkFq?=
 =?utf-8?B?NnI1cE1pMW1RRm9ia0RhV20yLzNhQlNMY1YveGpuMkNyQ3FLMWV5R3RVb2Y4?=
 =?utf-8?Q?yfvIuPAiD4UiN6/Dv5t3YAmVA?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2210fe1d-0435-4c48-0248-08dbd94f6653
X-MS-Exchange-CrossTenant-AuthSource: CH0PR12MB5284.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2023 13:52:04.7773 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: swi3s53oDuxj3i0pQTXhzRYMB20+xKi0Rx5i93JJgTEY2Rvia0WNuwiUAZ3ayQ7neWROSDrdr+3vmGZJKN9cBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4533
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
Cc: dillon.varone@amd.com, linux-kernel-mentees@lists.linuxfoundation.org,
 dri-devel@lists.freedesktop.org, Xinhui.Pan@amd.com,
 linux-kernel@vger.kernel.org, samson.tam@amd.com, SyedSaaem.Rizvi@amd.com,
 amd-gfx@lists.freedesktop.org, george.shen@amd.com, alexander.deucher@amd.com,
 Jun.Lei@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 10/29/2023 8:44 AM, José Pekkarinen wrote:
> This patch addresses the following warning spotted by
> using coccinelle where the case checked does the same
> than the else case.
> 
> drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_util_32.c:4664:8-10: WARNING: possible condition with no effect (if == else)
> 
> Signed-off-by: José Pekkarinen <jose.pekkarinen@foxhound.fi>
> ---
>   .../drm/amd/display/dc/dml/dcn32/display_mode_vba_util_32.c   | 4 ----
>   1 file changed, 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_util_32.c b/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_util_32.c
> index ecea008f19d3..d940dfa5ae43 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_util_32.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_util_32.c
> @@ -4661,10 +4661,6 @@ void dml32_CalculateMinAndMaxPrefetchMode(
>   	} else if (AllowForPStateChangeOrStutterInVBlankFinal == dm_prefetch_support_uclk_fclk_and_stutter) {
>   		*MinPrefetchMode = 0;
>   		*MaxPrefetchMode = 0;
> -	} else if (AllowForPStateChangeOrStutterInVBlankFinal ==
> -			dm_prefetch_support_uclk_fclk_and_stutter_if_possible) {
> -		*MinPrefetchMode = 0;
> -		*MaxPrefetchMode = 3;
>   	} else {
>   		*MinPrefetchMode = 0;
>   		*MaxPrefetchMode = 3;

What tree did you use to generate the patch? On amd-staging-drm-next, 
MaxPrefetchMode is 0 for the second last branch, which is the correct 
one, so this patch isnt needed.
