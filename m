Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C3C0E70FA37
	for <lists+dri-devel@lfdr.de>; Wed, 24 May 2023 17:34:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46D9310E348;
	Wed, 24 May 2023 15:34:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20626.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::626])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4977410E2D3;
 Wed, 24 May 2023 15:34:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K38843PU7hF/E57wwDZ/SDEyEiJvcQ37070U7vDfFbxis11qXyaAhdoXhk29W78yVH4L88BxM8z030N5UBeipMrpiL5yzayJnos3x6F7dXw7FgHVFOkm7rfUDDCb+ZrPpid+nFcyPOnD/GnxA8aAglx8UulzDxir3JFzgcbXo7hlgrho4cKgS0hUVQLEB1ufG4PVqsR8AvEZdjsCyun6uqlqMKKvX6nf3IHlph3WDeYg3xsEybGgUnHchMServUa+KN4v2kjwzXC9suKfshM/Sd524N72e6Uqc/WtS6NdcXEl+m3R5NfVoFFod0kHBsHOHeY9alVKW8GYfizvOjGTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KZ7AtjPTfuxcZ+HfFf7ZcmY27d3DAbV5pnWJfNZwqH0=;
 b=F939Rufb6ODS+U0wYJND4wPcv7AJcxGzMIwXmQ49QpWusya6rPNQchArunOsCVIB5xwfQB9LY6u1vtVrzcnrjy5oV7ckodpUa2zBHYcoy01JfkKgertY6/2adXrgHZlCBEGE0fHZgVGQwy8/vh7AoGlnUQXIvl673lCQvoy5vEOb9cD8AlV02TASeig21992wYijvcZoDCF3+0SP/MyPaMR9RzC+ZqgXDQf/xUgv6p7x8q78oSjYpGn08ZS27YpwKoqS06CuuPTMVl+jHRExds8bftQsIOGkS0jVbCyXdTZORWGPZbYcJ9gw08MI4xJC/jikYUsIt0homOEUidoVqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KZ7AtjPTfuxcZ+HfFf7ZcmY27d3DAbV5pnWJfNZwqH0=;
 b=eWLCPc63zohcuUO5QaEqKon1cwqD+TFKoVWsWXTjtbhDCQAEBLD6bCR0ZImnQ0oo9iQL2NOWekgTuZ34TUJGGBOMollxqpD2Xakzxqoyu7qZT7rJWfktCQHHvQRafFbEjLMhp+eQNNXizeb0eJ8cKNucCbiDX7YQp1gENmnalwc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6280.namprd12.prod.outlook.com (2603:10b6:8:a2::11) by
 SJ0PR12MB7476.namprd12.prod.outlook.com (2603:10b6:a03:48d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Wed, 24 May
 2023 15:34:02 +0000
Received: from DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::fe53:2742:10f9:b8f1]) by DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::fe53:2742:10f9:b8f1%7]) with mapi id 15.20.6411.028; Wed, 24 May 2023
 15:34:02 +0000
Message-ID: <74e9a16d-9cce-3232-b2f4-b806d2e9a8c8@amd.com>
Date: Wed, 24 May 2023 11:33:58 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 1/2] drm/amd/display: clean up some inconsistent indenting
Content-Language: en-US
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, alexander.deucher@amd.com
References: <20230524085709.59128-1-jiapeng.chong@linux.alibaba.com>
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
In-Reply-To: <20230524085709.59128-1-jiapeng.chong@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0191.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:f::34) To DM4PR12MB6280.namprd12.prod.outlook.com
 (2603:10b6:8:a2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6280:EE_|SJ0PR12MB7476:EE_
X-MS-Office365-Filtering-Correlation-Id: 29d93fa6-9f8f-4213-a7b1-08db5c6c4ce5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FdXMwR6c6JIbz7k/q1sYdqNIpi9NPLagfTHrnUCZKx3nmq/iYVhJJEcyu0MsBaPzUkN6ZP+1DrBeJAqVqpK6yimSm9axg4FRLHzZwSdEEdHOBL7nX817MsGX0gD5jpueJHN3lo0FoyHYw0ptBFDCsBODepa2liHT/AcZEUzflTdd3iLa7WOfLclRzreQbR7dnZXkOSsM4uRQYSP3AiA+pA9YvpgO4oNGosqVqQ8MImqw+lqVUR9+NrqSuut2o1HUDcwun8k8PVwIKnA9wc8q47F7b0DrhO7f7T+Sx9Bcki6ejEk8hgPoj/2u9eAjy385yCiCoAg/XVywFMxhHaqXqlrlcbaz6hOVqkSHKqQR4hdNtRp99ZKM8vxjatb3cdJeLwW+Hl59a/2OMCvWKCI+UFioyQE8Th6/p6bMLJDYjSzyVoWNGOQMRo9cqH34aD+OGCZjc2yBHs7dNgt0712jhBxZZQBMs7I3TiU0+Iw0Ag/bn011R1RESOB5HDwe9HvgePDaDJ3SYsrjohTo1rh+a5rAEnigEeQBYpll6BBBZ/c/3mdOf6oLWhHkQTxvAJHLUrlcWYIF79SmfOsULj064IjSJYJrvwcjGGpEt44G7FK8R5lrz0sem1Eo7djVFWlU7SyUysJdtnzDj6AOyDKlcw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6280.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(136003)(39860400002)(366004)(376002)(396003)(451199021)(6506007)(6512007)(26005)(186003)(53546011)(38100700002)(44832011)(2616005)(36756003)(83380400001)(2906002)(6486002)(41300700001)(316002)(6666004)(966005)(31696002)(31686004)(66476007)(66946007)(66556008)(6636002)(4326008)(86362001)(8936002)(8676002)(5660300002)(478600001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NnhrWjVLckVGMjg3dnlQVHpOWHJNVGVxSEViNERDbW5mL042cERIS2pibWZZ?=
 =?utf-8?B?VVJuRitVc1ZjYUgxZjVrNzRQRUh0ZmtLMW5NTmkvdGJKWkJ2bnRXSlpFa242?=
 =?utf-8?B?cEN0YnlnV2tjcFY5MjhiNlFEQjh4YnlOK3Vybk8zOVpncVQ3Rm5jRGNvUDNo?=
 =?utf-8?B?SnBQN05SbTBUbTRBVUMzQXpqYytGdys2TEhlKzlhQU0xWnF5emZrTW8wcjJC?=
 =?utf-8?B?YTN3dTdiQ1lNK1RCK0dwVHBmbWlqdWlEYTkrc1U0Sndwbm1vQ0hHQmVGaHJL?=
 =?utf-8?B?c3FtTWYwR0dOS0M1QnN6WXZvdThtTHlYTjNXdDdsMi80Nm5IVzZ6SksxVFha?=
 =?utf-8?B?a3BiQXF5NC9aL2h6eXZBM2Rhbjc1WWdJMmFOWHRKK1Q5OHNYV2lneW1yelor?=
 =?utf-8?B?ZUY1eWljQVorc1NaUXJ6cW5tWXRVV0crN1RBOVphRmtsNG53NE9NNHh5WkUz?=
 =?utf-8?B?VzUrTG5NWHhUNm5Id1RqdUJXNThsSWVabkpFbS85b1VHL0M3Vy9qMU5yblBo?=
 =?utf-8?B?UnB3eFJOZ3EwMS9CMTlGWSt3ZUUwc0JNazRPKzcwRGZvcTlEM3ZUejNlSDBD?=
 =?utf-8?B?U09YMzIvdXFGZWtSQXlBenBnNHc2ZUpMVTlieE1PTDRrQTdaUHkrYlhYckVN?=
 =?utf-8?B?SGZwRHdXUHFqelhDOWdHUm9lemdIOWorUXRNcjhidWRMNFY4T0tsQStRaW1i?=
 =?utf-8?B?d01NREtBT3dtZmhoUTNEUmNmV2VuTHVRS1QrNVZycmhrWEh1TnY2ZnM4YTFj?=
 =?utf-8?B?VG0xek1LSEpvTEFrdVN5aTk4djdCSzVZalF0OVoxV1YxVEtQVnMralJrYVR2?=
 =?utf-8?B?bUhMRTltTGVNR0g1K0JxaHRuV2FDcUVwS1NGczBSeUJFWnRYeU1xUmJMZ0pq?=
 =?utf-8?B?aGRPQnJ2dkRja1l4RkVIQ1YyQWYwMHRxTFZoS294STY0MVZqWUVuc24yNWh4?=
 =?utf-8?B?WG9ZbkV2WkNXOE56Z09kUmRQMjEvMnVJWVR2Z3NMUHlxYnRTZ2c5MWVDdHpi?=
 =?utf-8?B?Rm5Obm9uNVJBbnpVcVVRNXlnYlRDSkgwRVI2YjQ5L0Z1Zzg1ajIzMXlMa0Vx?=
 =?utf-8?B?ekxCc0VzUjRpWjc3VTFIeDE0ajB5SEJsRU5wZlU4L2J3Ylp5MGQ5WWtSTHZx?=
 =?utf-8?B?ZVJ0K3BTMExLS212UUF2Si93YVJCamYrZmNoSUVSZ0JCeHJ6TmFvdWk2RW4w?=
 =?utf-8?B?VGN6VVJRWGJWOVVkekljNzdidlp2SVhGa21XeFRPZld6VHJMdEZMYjJGMXo4?=
 =?utf-8?B?Ym5EcytaY3dFa2ZZVmJSUEFCQm92S3JITXJMUzhsN0NLWGE0dVRsRVVwOGlr?=
 =?utf-8?B?WEhyNnp6bWJCNmtJT1d5dUZ2cXBtS1c2S1RTYnVtVDF6b2dueVF1eURCNGR5?=
 =?utf-8?B?TVpPRSs2NUFhMnQ5ZWNpdXJuQjVDeTNVcDVzamZPZXdqWWdmaTNmZmxEMitW?=
 =?utf-8?B?UnltbCtJZUdDelpWRmhhL0JFM2FhbGJjTDRuZG1QMkRXQVZ3MWZsSEZ5S3Y5?=
 =?utf-8?B?RnFxMGQzazR6VElMZm5ielRJNVlzMjI0bjNmazkvZGhkR2pOY2lPREZuVUR0?=
 =?utf-8?B?R3lmT1FlT3NXM1JmaUlma0ZOT3QzMHNQOWYxancvRU53RU1mWTljUmNmcHhX?=
 =?utf-8?B?RHkrZTZqdEd4dUQ4bHpSeTJiZkRTR2VnK21sOEpEZmljeS9RYzlObW5IR0Js?=
 =?utf-8?B?ME5uQVRLK1lqaVpRVVF0MS8zSXZ5QVZVQ21DTGQ1dDBhaFZ5Z3ljMW4rOU95?=
 =?utf-8?B?OWpkRS9EU1lkOUpjRDY2TFd0dTZBOTZHNk1DbVVLNUwzZTZab1dOeUtKSk5B?=
 =?utf-8?B?UkcvMTVMT29hYUljR0U0WU5kK2J6OTJwRHV0QjBpRDkwWWJMcUtDU2tGY2pM?=
 =?utf-8?B?OUVLeXNCUUVjVzZjdm50OWVTZ0hkQjdVeitRaWtPS1k5UEEreUdYM0tuR2hk?=
 =?utf-8?B?Q2N3VTFWTXdva0R1aGdvVituODZpK2dNdnI1Y0drdVVXTnR5SXplVTRxMjJX?=
 =?utf-8?B?MUlIS0IwcDRFTUVic29zcFVGME4wZWpVd3NhcUlDNE5GQWlqRm9KNUJjQ3V5?=
 =?utf-8?B?SzJ1QUlNb09DcmNiNUNsTUh0WVhhUE43dWdtVTI1R3hVRUVwVnlBYTlicHND?=
 =?utf-8?Q?PqQ06u0ZTdZGl4IQD/6lfVgKq?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29d93fa6-9f8f-4213-a7b1-08db5c6c4ce5
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6280.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2023 15:34:02.1557 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 388brzktuv4vZvvUF4d6W15WQ0XmJeSuqSTGSe78U0QB75AUdrkhxAvUfQ9tRu2vTTCFlXbbdUYRYY1wARj0cA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7476
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

On 5/24/23 04:57, Jiapeng Chong wrote:
> No functional modification involved.
> 
> drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/dcn314_fpu.c:269 dcn314_update_bw_bounding_box_fpu() warn: inconsistent indenting.
> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=5305
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>

I have applied the series, thanks!

> ---
>   drivers/gpu/drm/amd/display/dc/dml/dcn314/dcn314_fpu.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn314/dcn314_fpu.c b/drivers/gpu/drm/amd/display/dc/dml/dcn314/dcn314_fpu.c
> index 318b9c2bc9be..c9afddd11589 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml/dcn314/dcn314_fpu.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml/dcn314/dcn314_fpu.c
> @@ -265,8 +265,7 @@ void dcn314_update_bw_bounding_box_fpu(struct dc *dc, struct clk_bw_params *bw_p
>   	}
>   
>   	dcn20_patch_bounding_box(dc, &dcn3_14_soc);
> -
> -		dml_init_instance(&dc->dml, &dcn3_14_soc, &dcn3_14_ip, DML_PROJECT_DCN314);
> +	dml_init_instance(&dc->dml, &dcn3_14_soc, &dcn3_14_ip, DML_PROJECT_DCN314);
>   }
>   
>   static bool is_dual_plane(enum surface_pixel_format format)
-- 
Hamza

