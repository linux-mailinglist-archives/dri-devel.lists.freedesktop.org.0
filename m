Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F0FF4A4A4C
	for <lists+dri-devel@lfdr.de>; Mon, 31 Jan 2022 16:17:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9004C10E32F;
	Mon, 31 Jan 2022 15:17:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2045.outbound.protection.outlook.com [40.107.237.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AEAB10E32D;
 Mon, 31 Jan 2022 15:17:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gQKEIXBKqS0yCIdCecHuIHPnOHL8CanTchmXM+y8sfSrFMXWxrjPdXALxHUmVOxwBuKzQzLzeYzJwb2xFIOZOx0cIdeSPbfzKyryeTJjgNKz2wSFluyI4YbYe8PXHY6pXQgBZViYL/fMWCtUe8XGesiVFOxHFNxnulk5dyYxtFZHcFVfK+1N6+FIHK08+SQ82aljjBOjhzYEQyU0Wi25yRNgvPflf0FobsqIrjFiSiY+pNARS7bnsBkH3RNB/q8hzMERutHypuUvTSVOSq1dK5lL4Oxpu1uX4/gWWGXAJ1l/yP3/hhzNiI7NhR32NrxqOlSM9pqm/V/oTsuDZ4McTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RjXgKb6HOItBcLLxPfgTTDQsrqK6vLoNqunbGK9j9r4=;
 b=kttuJ3YiMLbOOekchAscblKiZxVP2tAWVdQ+OnMcpPEi6vvR/4JQl6v/zmA7cou9A+RaVT7uey7clhBxqFCFhM/9Jv7GhOrtEvpUg29WCnEENysnkaqeiYRj0rOlSmRDIEr2KBIsTqqarh0416u65kAGjOpAQy+Y8zeO+H6+TslKZC1P11J1692LPyHuvNkBX3mpWpYE7ug/XCfXdbvrssjP0RoyHTgcJmtiJD8eJDFABjWllc82xpAMK1x18ymHMLD+hzbsRt0U9tF0SBOLqsu1TLc0s0scaW+eBiwB7CgBg9m2USNePJaMjVXw3FxFF1JKQJBYW7/9i1SyksurQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RjXgKb6HOItBcLLxPfgTTDQsrqK6vLoNqunbGK9j9r4=;
 b=IV0Ez11hYwvRby61KPRpf+dPAvplYcAN1cRb8NFSzWWE2C25bG3W6HcaOPQ3PHQHnmijOX6PKS7TaMD6DrQ5m7+DLcAwmffWL9a+pN0YlEmjGvzvtmQp9uCyOto2MDxqj6zJq9Y1I9w9KzSKhvmVkYt5EsiBzMUDKk7pkJwv0o4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by BYAPR12MB2646.namprd12.prod.outlook.com (2603:10b6:a03:65::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.20; Mon, 31 Jan
 2022 15:17:42 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::dd4b:b67b:1688:b52]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::dd4b:b67b:1688:b52%9]) with mapi id 15.20.4930.021; Mon, 31 Jan 2022
 15:17:42 +0000
Message-ID: <75ab0f37-a55e-8e81-8cbf-c0de3002c3e4@amd.com>
Date: Mon, 31 Jan 2022 10:17:37 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH -next] drm/amd/display: clean up some inconsistent
 indenting
Content-Language: en-US
To: Yang Li <yang.lee@linux.alibaba.com>, airlied@linux.ie
References: <20220129010413.97801-1-yang.lee@linux.alibaba.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20220129010413.97801-1-yang.lee@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0071.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:1::48) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a9bf9056-7f9d-40ff-4984-08d9e4ccd392
X-MS-TrafficTypeDiagnostic: BYAPR12MB2646:EE_
X-Microsoft-Antispam-PRVS: <BYAPR12MB26469E3257984C2551C967EC8C259@BYAPR12MB2646.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:813;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eX84xpMUYZvzw/DyUaCsFD5tncrfvUCzB7OO8uQZK2dU/3knSy209SK/x9NdnwhI/1bqskoF6jjTkEx4y8by7Kvwplg2gjsuE0UcEaOmMsH4h29VBjLri4sBpoFSatQCaB9HUeRMKagKnA9X6QUFNlkZ7a3oZDG7o6IEEFl53RoVVaqxrxQWwUsF9y+0Qme7piJBJkcO6zmiJqhzSRk2EJlxJmjVYoS296b694DiU8kQnZOgte3hWtMlSzLIpAiswsXbDT35krsNtPtqTOGjsISjA6oBpqJaXqDLgxNueot4D0zfk2yG2DrUDIRdtx7lTOGPjjXSUHtpQVrB5guE94V1DMOU1VRhi8IqLah8bHvBXs/usEIumn3wphNSHUlMEMivsc19NOkemGAYr6wYoXiC1ey/Jdbm0NNKBzUusi2Zwy/uqDNihymts6wDwEB8eiQ+UySsC2rPsD/DM0JQGVjwUmFWZj045tXmpZ3nZzJykOtXQ1YJYS7dl5rcvaIXaV7oJusiaQVwe/dw+SW9TooIemSgNveg1D1GHT8rEzehEG+faorzOuCzS6C2sf6jRj7FrSDDYDY2LRFTGMAcGYbKalOZ6a1il0UnEci+zmUP/kj2VPgx/V1OfFzhz4+m9BcruR9790SkuUmFYlOrRvoGOmIE2bpyCOxetDuYoulInCWJubBm5QUZKkffVnyWXMDHqihF27n2jamwDHOn0bpEWh2nPbp2bKaPC78hRa8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(86362001)(2906002)(38100700002)(316002)(44832011)(66946007)(8676002)(4326008)(8936002)(66476007)(66556008)(6486002)(31696002)(36756003)(83380400001)(5660300002)(2616005)(186003)(26005)(6506007)(31686004)(53546011)(508600001)(6512007)(6666004)(45980500001)(43740500002)(20210929001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TFVwQzFrV1hHYnZZZTEzaEQweXRJbUJJS0pVYWFDcy9DZWZZVjQ4b2tlcStN?=
 =?utf-8?B?bFhKNzJEL3lJQXpUNHNtS0puT3dCVmlGN29SUkFLWUVJQ0JUamgza1lmemkr?=
 =?utf-8?B?eDR6TkM4NzgzL1E1OXZ5cnQ3ejJrejAxS0doWFVTbFJkT1R6SHpqUGcyYlVQ?=
 =?utf-8?B?enFpU2MrVjFrWndzcEtQdTVaZUFvY1VlazNVOFc5b2lpVldnclhkUmQrM1Fx?=
 =?utf-8?B?OE11V3hFajRQUXpLS2pkT0EyRlZYTldwWnZCVDVmUUVnZ0psWDl5UkhYT2dI?=
 =?utf-8?B?UTNjTFFtSHFtRVpLZ0p1bktLQkpENFBldnJsZk05clg0aU9sK0hkeTRHT2pK?=
 =?utf-8?B?Y2hnU2F5dzExZnAxNlh6MGptQ2lmZWNGSEE4THRod3lnYlhCQTlEUWVZNU95?=
 =?utf-8?B?UHZLTWJzUTRXRmJ4NEZkR0ZWcldVNFZYcUk2d3VSL2lUM01HTTVmcmtYbFNZ?=
 =?utf-8?B?dzdNOURiTkJiWkJ0THlGeUhhS0pXQjRYaFpSTHM3Q1VQREdRUlo3aS9FVzhB?=
 =?utf-8?B?N0NBTzUvTS9ERXRLb29pS3lMVDU0dHBDb2x2Ujk3MklHaDUrcUVMZGNURUtl?=
 =?utf-8?B?MW0weE5xWldpY2VpQTlsN3puUlBCZHVwajdHY2RCMUthZkZtWUdSeEx3K2Z2?=
 =?utf-8?B?UkJzMFFPOGlzOENWR3F3cWlMdy9lSi9ZYTNVTlpHbk4wZ1NYRTRKc1V0cGM3?=
 =?utf-8?B?ZmlqMGgyMUg5VzZ3RThCczRIT3dlQWNZUXVxeE5oUWQycnRJUnpQUjlNc3Br?=
 =?utf-8?B?R3crWUtTWGQyRE80ejMrRlpabmJFS1JscWFVZTExeEFRd3NCT3pzOFRVNzdI?=
 =?utf-8?B?Z1JhVk5Wc2Nib2lSLzNFNlQ0MTN2VXVwTWRtaGpWVGlrYjdHN3F1RlpKOTI1?=
 =?utf-8?B?c1paZVdNVkEwRC9UZUo2aEpiTTdrSkVaejY5dWd4c3V5VmxMZ2tzbFEzUXhS?=
 =?utf-8?B?cVcrMk91Q0gzY2MyTldEN0E4ZFhlalY5ZDJNMTFONlV6WCtSMjBiZWYyN1NN?=
 =?utf-8?B?YlZaZXpLRlg1a2IvbVpqNlNuUHFJZTZOMmxJSjUzbWZIZVg2ZFZmZGZZRk43?=
 =?utf-8?B?N1lsOXczZlRaUFFLZW0vMUNCUFNHMHhTbzc1TkxUdVduSU5HcWtVaXVnd1Fk?=
 =?utf-8?B?YWhoSys3YzZVWGNuUTAvM29qWDVEYUMyb01KeVJRY0x4M1hZY0gyRVpRdGFN?=
 =?utf-8?B?K3F2Z3FzWXRxTmp6dUlnWEhBeG01blNFNkNtdkdBU1FNUk56WWNVNkthMEIv?=
 =?utf-8?B?VWhzd3Q0cHBOVGhZYW9XVnF2c3JhYk54d3JSYnhyRzFRQUZFRm5zWTlKTXE2?=
 =?utf-8?B?SVQrWXNrQUNEN2ZoSkNSYzVUbjNRQTh4Uk41SUx5T1I3Z2R5RWpZV2dFemJN?=
 =?utf-8?B?b2E5OXFpcVMvN0FRN09pQ2ttd3FrSlc5MzRDTm9PUmpWMHBVZGhVWmJxNHYx?=
 =?utf-8?B?T0hpalBGZm9ZaTdObU5zQ0NZQVNNQit0SGpyKy9IMDJIVzB0ZHEzajU4dW5q?=
 =?utf-8?B?eXJsZy80QlRINko3dU5IVVFlOWtMUFRwVHNHcFZzNnpOcG9YL0RESmNrUzFN?=
 =?utf-8?B?MUNzRzFZWGtFMVZVdEgyRzJ3TGl3dElmNWxKMjRjajhNTkVsZ1ZsYTM2Nzk0?=
 =?utf-8?B?d1VSVjlSdFpEbXNvUnZoWjZZcmxYZUVFNS9xNmh5cjV6bGJOS3cxSHAxVXpC?=
 =?utf-8?B?Zms1N3NrL0VlRW1rNXM5b0VyWUJjZ0FFQSt1Y2hhclpGMUh0anZSU1RHWUhV?=
 =?utf-8?B?L0RUTDZGM1A5a3BsS1hUc0JnUUNEMWtvZjZQNzNvY2xHOWRHMkRHVDdDOVBD?=
 =?utf-8?B?T1lDMHBPTUg4QkxHWnpJcXViQ3VpWUsyZEFGNFZqeTE1YmhQOTErMnBXS3N3?=
 =?utf-8?B?cndiZ0RaMWMyeFRpVDR4eUlZa3dqVVlPSDZHemJwQ2Z1R05zc3FVYWQ2NS9W?=
 =?utf-8?B?MkpQUWx6bHM0SG5DcHgyOVlRbGRwSG9iTTdUY2k3OEZLU2l0WElMNU5iQ3hV?=
 =?utf-8?B?Ujcrck9wTjFOLy9HekRTR3NSa3NqTnVKckFhbHFyOHdxUFA1NFVaa3BoM2kz?=
 =?utf-8?B?S09wemo1Snk3Smg3ZWhUZnFMdTFRMWQxQzhRSHNRSTVBOFA4WngyajREMWRp?=
 =?utf-8?B?cHlmelRxL2YxSW9yLy9yVGhmQlpuWDFOY05NazFhVHlaemtDMzd3NDNSallp?=
 =?utf-8?Q?2wrJrBZWKSFn2vMC67RPc7I=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9bf9056-7f9d-40ff-4984-08d9e4ccd392
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2022 15:17:42.7113 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8NYpcfaX377xLg1ggpaGHG0hePeixLPQ76GaehwcuRuKZUTJDlzYYMX4VKBQ5P7hSh1aAaEVdeQ8FlGzS+k49Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2646
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
Cc: sunpeng.li@amd.com, Abaci Robot <abaci@linux.alibaba.com>,
 Xinhui.Pan@amd.com, Rodrigo.Siqueira@amd.com, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-01-28 20:04, Yang Li wrote:
> Eliminate the follow smatch warning:
> drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c:2246
> dp_perform_8b_10b_link_training() warn: inconsistent indenting
> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>

Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

> ---
>  drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c b/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
> index daaec3164875..34ffcd5bb1d7 100644
> --- a/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
> +++ b/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
> @@ -2243,11 +2243,11 @@ static enum link_training_result dp_perform_8b_10b_link_training(
>  
>  	if (status == LINK_TRAINING_SUCCESS) {
>  		status = perform_clock_recovery_sequence(link, link_res, lt_settings, DPRX);
> -	if (status == LINK_TRAINING_SUCCESS) {
> -		status = perform_channel_equalization_sequence(link,
> -					link_res,
> -					lt_settings,
> -					DPRX);
> +		if (status == LINK_TRAINING_SUCCESS) {
> +			status = perform_channel_equalization_sequence(link,
> +								       link_res,
> +								       lt_settings,
> +								       DPRX);
>  		}
>  	}
>  

