Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1260956BBFC
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 17:02:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF19010E060;
	Fri,  8 Jul 2022 15:02:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2072.outbound.protection.outlook.com [40.107.93.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3580D10E119;
 Fri,  8 Jul 2022 15:02:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mzFEMYsGEBHWXpAWXcyeILJx017ApJ2+RMXv+5bVsrDk5hGQ0cNGdwAND9MhO7g4oZgLBM7CO1bX00w1Fqz7Sb8GC4oiffQZ0X00QEa5CE7Pn0Rfhmt0NXN1eR2VS5mkxpojxf0+gN1QmPb/N04ICoWqeH9cCNCnY/mBpSzJQMYRYmKkYg00Tj+87wOmXw6Cita17659wbLaWUOPcg2kwNTqPbZvtQkndQd6Viy3WRm1k8IohtLu/99x/MeJrLvrHaIopt//BmRVcBZaXPECC3dz34LxYu2Z5Q2UMNEB9NgPnVGlJ3SnJwYDKf2dBpyWLlEKcTya52yj5sBqRlAw7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yn/yCuoyV9CqI75YpIG3SYayE+X6VHRul8qPK0VMzo4=;
 b=Hv/FGBeCj8R0jBuXSmLWQM8JkFPQj9JD6KAe4pGe14v749LdRq0wrp1jQ6qgxOxNbtKc58nTzEb6N9suK76u1Usug5aq/vCtpfgDinuuv7MZQAi7zDimrlbshK0NMLWZdeN3CW4Ic+Q4c+52Y9hmMHhRrrH1VG9vHnWR7nwUs36aS7b93N2zj22HdrNHLUw1UAxcgEb4+5CzKhtIX0QsYAQTUkDqmjsp3a9MFNd9tL9hwkn6K502u1BtNvqd5XJM9jq5xlYVbI9AaMJM0H+1wQ21wvbHAldmA17M+on4EZKO9+DcUaBCVR7u3TBmagQ4C6O1CbU2HWi/kOSsafAqcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yn/yCuoyV9CqI75YpIG3SYayE+X6VHRul8qPK0VMzo4=;
 b=k42uShwxwmYgN9+CFVNV3vULrk8giH9C/vsFoiHmLO9tegiIZ6jUsEcQuzIBJsVeASJjAzMGeyZ54BGjT6/GgTdulsy0slFj+9KHsZ06DBf6nVuoTpvZM5IaVoTcBWW52z7bFxRDPycWGcMq2qKXdXWKzAU1x69GL6cVkRxylGA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by CH0PR12MB5219.namprd12.prod.outlook.com (2603:10b6:610:d2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16; Fri, 8 Jul
 2022 15:02:51 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::6999:13c9:d124:418a]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::6999:13c9:d124:418a%7]) with mapi id 15.20.5417.016; Fri, 8 Jul 2022
 15:02:51 +0000
Message-ID: <33277b4f-5147-2857-5d23-fe68674ab3b0@amd.com>
Date: Fri, 8 Jul 2022 11:02:17 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] drm/amd/display: Remove condition with no effect
Content-Language: en-US
To: Zhongjun Tan <hbut_tan@163.com>, sunpeng.li@amd.com,
 Rodrigo.Siqueira@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@linux.ie,
 daniel@ffwll.ch, chandan.vurdigerenataraj@amd.com, tanzhongjun@coolpad.com,
 aurabindo.pillai@amd.com
References: <20220708031048.43472-1-hbut_tan@163.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20220708031048.43472-1-hbut_tan@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0305.namprd03.prod.outlook.com
 (2603:10b6:303:dd::10) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d9c23038-e9ea-4288-5c16-08da60f2ed58
X-MS-TrafficTypeDiagnostic: CH0PR12MB5219:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uRMhJQqRCGQqOH0+Gbes4THrRQ7PhxttHdQUnWIO/2wE37dNAp/dv+tiJQepixkD8cQY6PzWeOu8xxG+oHZeRntV/WLu4nLFihfWY9i3nnXVDttEB6C6XzLj3PpOmtY9PI6xlPff/gyyQbqNgonQxll18Q909YuFRhk0Fu8MFVVFJoDMSW0e4kBZoj7N8xJsAjyY0LysN91P+mdnQ/sT05xIZGADXvXYFLkI8jawB/qmP3EAkDyCdrEEcIpPTDAfDcQhXtgxZbw9n6FZPxwpUlpfY0Su9iDwzYb/HBiCTMGg2ygACdp/pZ2bg/2EhYA7p77zbWNV8ij8M6eUHGsvo06G1FC/a3hwI+jl7vyDWBZmFkTMLhSnVwePE6RU/wnUKOzxFN89FvcNC8XwRrv/wltBk+hPbaHaP6nu9Zbb8MlQKizIJUgm8i6xk8f+CClNWtAVITTkTPdQmrVezfmOIQzVaQDkJKayj/JlsVYmTRH9wRzr6HEkY3fuGXTHF7sAfdOCu4FstGcFRvpXQDg3ngIDyAdPYuaTVMbETYzAHvnqDc+pwVelYRVKhHz1fc04FZGulAHUjdFI0xrANYPKoZBaPydq9exX1WCyGD4rS4nJPH0ww/jqhNsLJgz4reHuyiIqYObGF6+C+0RJ2yeURsaqJBFQjNvgCb4HDhP4FPlfMR4FkHzBCD3kmaPr/Wy7agtfiehW8CHZMxBeb8rmbIYTwqh7YJzDkmvODqMFM3zb5xINf9hWMJE532uEZUW8yQ0XeLhEZNtSTD9zpFFW6fAsB8wamIW2u+RbGlinVjDBV64akjfhtdbjE6dbIh6lb3Xk9vn04jVJsmuwgsXCwalkjUoa1MK/Bgu4slAeSuY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(376002)(136003)(396003)(39860400002)(346002)(26005)(6666004)(41300700001)(6512007)(36756003)(6506007)(38100700002)(31686004)(6486002)(2616005)(31696002)(53546011)(4326008)(86362001)(316002)(6636002)(478600001)(44832011)(83380400001)(8936002)(186003)(5660300002)(66946007)(2906002)(8676002)(921005)(66556008)(66476007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d3dZVE1NNTlnd2FNb2dpdVZCZGQvNFlxOU0ySEtudjBMeVZLUWIrUG40L09q?=
 =?utf-8?B?YUx6MUpGeUV6b1BSdFJUYjUrTjdJdTdjQi9uYityM2xUTjZ5L1Q0Z05tT25L?=
 =?utf-8?B?SldiQ2NPV3lVS1ZuVnZ1b3hQNUJpRDNBYmNvTktOWWZySE14Q283OTFBOE10?=
 =?utf-8?B?WjVKS091NHJMbWpaT3NIUDNCVlJBQ2lnZTFialluZGhvdXU4NDN4M1VCRzJ3?=
 =?utf-8?B?akhoMmNuWGdicWZ2ZnlVT0U3allqVmdFVFdwMzU1aDJUOGJGek1jN0hoOTdP?=
 =?utf-8?B?Q0VFOVU2MXltL0Q5enpEMnU4TXpoT1RJY2l2aEZ3akxmQ1Y5T2JTWGFzMWRv?=
 =?utf-8?B?NEFLS25ZYnpZcE9IUWozRmV2ZnNsb3diVWdTWTY0V3cxZmNWOGVmTVlwcFJD?=
 =?utf-8?B?cldjZGllVWt4dUpkQ25BNHdYZUZpd29MK0dPeUpJTGdmSGlxYXgwR2JOZmJQ?=
 =?utf-8?B?WnJTS0hZUXFjVldkVGovczQrSnFSemE0T0J4cWExcFZNVnR2U1RWd1E1U0Zs?=
 =?utf-8?B?RU9HUFhWSGlxcnhlUlVxSzBTVXhraTU5SjJ0VUVBMXpOT1lkdVdFY3RVd29F?=
 =?utf-8?B?MEtlaXFSYVFZUnhXU2pTN2pXVjljeFphYkRQN0tlSzFiS3llNk5KcENoRjhL?=
 =?utf-8?B?TVlpbzFNTENZWkVtUlRXalBlTHNKRjJiTEdEMEw0U2gva0ZJOFRFR3FnTHp0?=
 =?utf-8?B?WE0wMzFpT21RcWllQThWUU1rR0pydEdCRWVXWi9tMWEwcXRxbHFqZHdsYnlP?=
 =?utf-8?B?dExZOVFSSTF5RkUxejhDc01WK0l1Ym1qTHJ5Rk5YWXJkTVVUM0ZTZDRMNnY3?=
 =?utf-8?B?TmhWMVE1RU9ZalZjdXNrMDQwRjJjQUN5bW55ZXA5SUxIQWhITVZQWXN2VUYy?=
 =?utf-8?B?YVFicTcxVDlPS1ZZbnhUVlR0eFB0V05ESVlvcXBnMk5VL29wRTBEQXIweVNj?=
 =?utf-8?B?RFFUakxlaXptWktBZTV5N2huSzZjRGZyYnRRQXQ2bmdxSnpuQmhNeG5OdHpE?=
 =?utf-8?B?dEtHZllDVVhNVzBqbm1KRkpsVVc2YUdvckZja0lvSjRpTVhCYTBySWo5SlFB?=
 =?utf-8?B?VTM1VURTS3BuSnNLajVEYjJoUXh5N1lKTWlvRE8xaElXbWt0b2NQR1MyWHRh?=
 =?utf-8?B?Y3RBeHFaeW1WY0JZYzhRd0R0NUUzY2I5Q3UvaS83SGk2WXY1LzQ4ZXlveVVu?=
 =?utf-8?B?SDRjZXZCMHBtaWg4bWJSZzR6Q0FHais3ZE51bWJEZm1NY05EZDFwdCtZY2Fm?=
 =?utf-8?B?Y09NTTNDdlNNbVJLLzBIemZZMUw5YkxpL1BqWDEyb2VLM2VKeEtDclF3QUEx?=
 =?utf-8?B?WlFkRXRUWFh1emUyUU45RmlaT3dxMS8yWWpMbXNVUzVVRFdUUC9CdVpsaWw1?=
 =?utf-8?B?R2lyVkJENTNmcGdna3hIS29vaytzNDFxdUROOU1JRFVpSmhZQ2VHYmJIMVVn?=
 =?utf-8?B?ZUpxdGI1UFloaDh4elNteGxhVytVSXJNdGxUL2w1RGE0eklQVTMwYVI0VTBH?=
 =?utf-8?B?MnNMS29JekcvUG9PZk82T3dnQVVnLzR2ZlV4bDJSb2ltR1JCbUJQTjBBNXE5?=
 =?utf-8?B?OVg4MFRSeXVjTlFscjBXY2hzVWZYVHlyK2JCdTd5SVovbnh1QnhzU1d1dS9R?=
 =?utf-8?B?blB1R3ZGaWpvTkN0TG8yMWMvY2lZaDZxa25jRWhrYmQ2SWx1Qi9aZTVpdHNT?=
 =?utf-8?B?STcvd283QVdvSmxmaDlxOTA0aEVpU1VmbjRhNkRKaE1YcERFeVIrMWl0cjhk?=
 =?utf-8?B?eEtwZERENlVXQ1ZGdU5EZUlGejgyaHkwM2QySWp1K0JNMXFjTW1RS2lBM1Vq?=
 =?utf-8?B?azNISk9GelljUDVKNi9ScTJjaVZrL3VyTGFjRUZnZ0tsbmVRaWNzMzJjM3Fm?=
 =?utf-8?B?MldUS1NvUkRMU1Z4TGVNZlNmS3YrUjBBc0VwdkFJK1AxSm9haTZtWjB4MGIw?=
 =?utf-8?B?elY3NU41SzVHSmpPcDc2Sk42Q3NrN0c2NGozcGNNYkVIc01JNi9zUkQwQ3JE?=
 =?utf-8?B?WjZjb3dQZTR4QmhJZFp4YUVpd3BmVlQvbG1udlg4d2tvREdDc3krQWVJQ2ww?=
 =?utf-8?B?VVd2MFU4WUwwN0Z0YjdFaWE2YkRGNEVNNTkvUTNGanhoVmc2MDRMeEJlZDVS?=
 =?utf-8?Q?H3MD5tOXRhYpZt2sdw2xOAr9C?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9c23038-e9ea-4288-5c16-08da60f2ed58
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2022 15:02:51.4383 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2UjIu/GOs2fst+Jl0LYkGnoYb1Iohe/DOQzP1HripZWUJjABTufmD3/k5HFzB7IcG1QaXMKVb/hQzdkEbz/BVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5219
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

On 2022-07-07 23:10, Zhongjun Tan wrote:
> From: Zhongjun Tan <tanzhongjun@coolpad.com>
> 
> Remove condition with no effect

Please explain why you think this has no effect.

Harry

> 
> Signed-off-by: Zhongjun Tan <tanzhongjun@coolpad.com>
> ---
>  .../drm/amd/display/dc/dml/dcn32/display_mode_vba_util_32.c   | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_util_32.c b/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_util_32.c
> index 07f3a85f8edf..ec3ea94d3802 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_util_32.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_util_32.c
> @@ -4670,10 +4670,6 @@ void dml32_CalculateMinAndMaxPrefetchMode(
>  	} else if (AllowForPStateChangeOrStutterInVBlankFinal == dm_prefetch_support_uclk_fclk_and_stutter) {
>  		*MinPrefetchMode = 0;
>  		*MaxPrefetchMode = 0;
> -	} else if (AllowForPStateChangeOrStutterInVBlankFinal ==
> -			dm_prefetch_support_uclk_fclk_and_stutter_if_possible) {
> -		*MinPrefetchMode = 0;
> -		*MaxPrefetchMode = 3;
>  	} else {
>  		*MinPrefetchMode = 0;
>  		*MaxPrefetchMode = 3;

