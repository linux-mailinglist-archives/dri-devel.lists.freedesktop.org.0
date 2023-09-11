Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D1CEC79AA17
	for <lists+dri-devel@lfdr.de>; Mon, 11 Sep 2023 18:20:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AB9410E331;
	Mon, 11 Sep 2023 16:20:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2061d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8a::61d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 905BC10E32F;
 Mon, 11 Sep 2023 16:20:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JIZvU9SCOd9DnNN1vtU4XOJEv7uWBi8HSXqWbWYNaNGjL8P8YBMGTADEyLH5A7yS0dU2DSIGPn+3LOF5reAIHsYYFVcghNo14Sr1XQHA338ntT7nPa7Wl3v89uZ7iwKAIpsR5w7lwjsqcFlW3WHdvwTaEbCSZaPDdKUgatu3s5jL4vu1obkiqOsz7h18I/GLuqm9wobXQkl1HeYBjFyL525+gF4SUy1vGvVsht9lCYagjIhlvCKVKcQafoW2aFRnLQj8hZcMtP7Z5ePIZdT+8riBqauh1fwTXAG2qv+mJAQs2bebohaN8M3iJEwm9aFfEzKs3G99gbbmjjrzihm3/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lxERdPSVThzWB6/uLAsv0/jjpQIPHdCnB8pBxXoW8TU=;
 b=FyDTLoIJmhuzh4LKrEnmbkIv1tSOLajqPEKXdtZfqnVmrLkr42J6LCmoXgvoAuWQkpNfuZmGZeBjiygTiAkH4Qph09nkMbZqZ3yrFZfxdt7aDvi2WOvI3mJ500zkT71TklUPad6CFypC172+IY+QzQ90oJ1BgdBTR2J6gbPGc2rrj8pi6AYMZsP+ZhbBGRYt4O3FdrklfRO2HrjUZ78ry0aTYOk6XvNH6o+FLgX7sUkLRllS0oogWstHT09mIppPIKXjtgbg2WghgXlmjzOR8jx1+KtPgwMPOxQpv+6g4o7Uq6+Y8fICi/OaI9lS1awDfcPw6t8L6z4QLq27+EHNvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lxERdPSVThzWB6/uLAsv0/jjpQIPHdCnB8pBxXoW8TU=;
 b=JoBvOAz2B2D/kuigf8piflk5SXd3OP+eAZIcRRp/0ylwLTBUZ59HFh5OMvwl5M+yQ7QsXEFxf+9tLG/TXlnhhFeHhVXYw9YJvfFLzYJd2V1vqPDXa0/qB11zBRcLv9R+UjM0vSzdpHd2eILSZ70fI6+8u/+xkvJw4ceLorSvGOM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6280.namprd12.prod.outlook.com (2603:10b6:8:a2::11) by
 SA0PR12MB7090.namprd12.prod.outlook.com (2603:10b6:806:2d5::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.35; Mon, 11 Sep
 2023 16:20:21 +0000
Received: from DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::4196:c9c9:dfe9:8079]) by DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::4196:c9c9:dfe9:8079%3]) with mapi id 15.20.6768.029; Mon, 11 Sep 2023
 16:20:21 +0000
Message-ID: <af648d2e-0b0d-4b8a-921d-7873f78b1c97@amd.com>
Date: Mon, 11 Sep 2023 12:20:17 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amd/display: clean up some inconsistent indenting
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, alexander.deucher@amd.com
References: <20230908075445.63410-1-jiapeng.chong@linux.alibaba.com>
Content-Language: en-US
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
In-Reply-To: <20230908075445.63410-1-jiapeng.chong@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQZPR01CA0034.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:86::18) To DM4PR12MB6280.namprd12.prod.outlook.com
 (2603:10b6:8:a2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6280:EE_|SA0PR12MB7090:EE_
X-MS-Office365-Filtering-Correlation-Id: 50dd97d6-e342-47c9-12ee-08dbb2e2fe9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wajm1grSKkn7zF/HS2uUWEu8gO0pSAzmEoI9BrSuGu5z6cy7OCQ17A5wYFx2Iqt2IUzCfI00OBr3DOML8IE7CjGOmJ7oM0wnvI1kYWmHQBIHypR7f1/MjLEK7C3EthnUN7RgTOS0JVHz3NBgdUTJNt1C6roJ3pf8Trp0LVPT0IXJT2vFQ+fckDo8AuWLT9Wlua6O0dQ9Y3bwSODZFS3VYN4dDskrN+q0H77OIRusatfQ5mehQRke0MqzdhiXSPY8VVFZKGtksCWPsm3K855AL0n0Re2HMW8N6SAgvXr9et0RReWayk8imjPqCF6RKlOMiYL6cGERJeqr9R12JkS/31VWWCju0DExnPlBIMNo6VWmEG4/afd7PVbq4wgOqgiVS2WqKStpBJUh6W7l4ZmOVEHjf0DEmSEWod5SffMBsi+2RhVa4AFGMA6ZUtZ5MMvt1HolhlbLTdAOxSKb9OCnz0qzCw7XrW9lkVhyXTHp9e+88jd9R2Za/opUG65BLvzVgnvEBpb0xBSQnvGpfslElQmZ9jEqthlaX2W00/L+k8TIL6YYdMSG6KR3++r8ApQP+3WX4bLkPW3/IvFo1Lc7eSinRiwbyE8ccFgv5M1Uog9hGzGby0HwDkUXEIdVMr10/1iEAvyLIQFBVDyVk/waJg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6280.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(346002)(376002)(136003)(396003)(366004)(1800799009)(186009)(451199024)(6506007)(6486002)(53546011)(6666004)(966005)(6512007)(478600001)(83380400001)(2616005)(2906002)(44832011)(66476007)(66556008)(66946007)(26005)(6636002)(316002)(4326008)(5660300002)(8676002)(8936002)(36756003)(31696002)(86362001)(38100700002)(31686004)(41300700001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SFB1Z3BRT2QvZnhDV2ErSjlVV2srNzZMeGdMRGNxWUxKR2FJTGtSYUsrdmlZ?=
 =?utf-8?B?c0JNMllIbWw4aDhvbU5CR0JEbmJyMEJ3VWlHNG5SV1p3RkRBVVZWdEJib0dk?=
 =?utf-8?B?bmRzSE02OTc3WnpFakFTckdqKzZPTDh0cUsvRDdxWEc2UmZVSlN2cHJqMGtV?=
 =?utf-8?B?Z01pNkZ3ZmM2VG9NZHJoOXNFYS9xL1p2ZVNrNHVySlhqc2tEMWNXNUlPbEZM?=
 =?utf-8?B?eVc3U2RJM1JKaG9haEpNcmtMNnFvNFRJNm5FN1JuZWRQSmVIRllCU0RubG9X?=
 =?utf-8?B?M1dVWUhXYkZyUldpWW1jT2hTQ3FwRTJ1SVFWZ1pZK3FMdkRlc0k2N0VDejBz?=
 =?utf-8?B?Ykl1cERjdk9MQm1XSk83TjlQSERvRVZvQldERHFDcWRFWklXai9Ma3BxSHFk?=
 =?utf-8?B?dU1Fc0ovTk04Um95cEZ0RDV2WkpKWktKSFU0ZCs3MVNUdW9FY2hmOEhWdllZ?=
 =?utf-8?B?RWl5ekhnK1l0czE2VWhkQmx3eWh5NEJ0K1hmNlk0eG91eE9Id0FuZHFwcGFp?=
 =?utf-8?B?WEMrblRUdXVNM0lET0ZrM1Y0OVVmN3pmQWh3aGwvUXpGTGZ5QjNDQ3h5MXI2?=
 =?utf-8?B?UXVVOThwYjljbzNyNXl5Zy9NbG51TzdxSnBNUS9LT2hOWHp6aE16dHp2Z2hK?=
 =?utf-8?B?eHNvdVpQSG43WklqQm9sS1BnYndrWW9tNFoxT2pTcjVleGx6MzlWWENYL0Ev?=
 =?utf-8?B?ZVkrL1JRWlNOOTVETkNhZGZDeGh3QlBTWnh4cWFnN052ZTdWenN3WC9Ld08w?=
 =?utf-8?B?UTkzSGxwQzZEdkZTNFNvWTlQTVI4NkhxQUluOGdsaXhidFNZeWJURWpNTElo?=
 =?utf-8?B?SWI0NzFocGU4TkpCWSs3YWtFWGI5RFlHeWMyUnNCMmtIdmVSQklGNGdhenZV?=
 =?utf-8?B?MFN2SGNDejVFdkN0QU9Ja09vOXZQeVRRTHI0RlpXa1c0bUpRaFg4MUZWOXFT?=
 =?utf-8?B?enhRalVuRjU3YnVqSjJSOHM5Z0F5eEpFQ0tjYzFaV0ozcFVNNDNzYllTT1Rt?=
 =?utf-8?B?eDF3YjFqR3hpQktnSjNKY0Y5TmNLaUxTcVdSZmo4VEZiWEZOblJ4WFJpam9k?=
 =?utf-8?B?WkE0UEEyeUZsWmVvRXo1R1p1Y0VmVUg1elp3M0c2djlkOFBwT0hETktVOHgv?=
 =?utf-8?B?RXFDTzZQWFhwU202dE45bmRXL3I2MzZ4RGNvQWNDeHVRSUVuT2VXdHh0QVFj?=
 =?utf-8?B?MXhmYUp0aldJYitOY0tIRW1BMHJIL1dqc2FEbjZ0eHJFUktWWFdURGNZWkFr?=
 =?utf-8?B?MS9XNDR0ZGRoUUtpUTZjKzBqR3BtTTREdXBWVFQ5WDEvUUZWQ2grZ0ZWSTgr?=
 =?utf-8?B?bG9tNkdjd0tuYWkyTEdTdTY1dzVZY1JsbkNqVWR4TFJodWRPb2grODRJLzhv?=
 =?utf-8?B?OTA3VVNZaUhJbExSSStKdjMvMFBhQStnZFdZWnU5K2NuOXB4QkpLVTdtNjl0?=
 =?utf-8?B?b3hHY2syWVhEVHJkNWhEcTJ5ZmREb0M3LzJ4UXAwblRTeWlWa2ttaHowV1Z3?=
 =?utf-8?B?T1FzYmZmTjZGNVlvQm1rakMxcDlQWU5tRHNLaTJzR09Qc2tOa1paSUM5Smpu?=
 =?utf-8?B?VUc1TG15cjZuUk1OUE1NMkhOWGFiMUw4SnhlVmZNYW1NQXcyeWlpVXFadFQr?=
 =?utf-8?B?QlNEK1U0TzV4ZlJtLzRwWXA1dytnN2wrdlJvZm1Rd29GUzZhbnhLMTcwc3Jp?=
 =?utf-8?B?dHNvK21lYWdyc2FWUEthRHRNcFdzd2VRT0VOd1Qxa0VYMHdtZUhPMW1WUUZt?=
 =?utf-8?B?d0FJbkNBSjEzNXJEU3hyV2huQnpPWmp2NStZenEvK2FibFF5MUI1RUw4T2hq?=
 =?utf-8?B?RS9nM2JkdFlpekNlNDJmc0VIWUo1RlRRcEE0OEFBZWVEWVFWTVdEOVUyZnBa?=
 =?utf-8?B?Mi93OWxPektSYkhKcjhxZmt5cThmMjlBYVZqcFpFeXhKaGtxOEtXUlNpSDRP?=
 =?utf-8?B?V1NIdm45NUt3dEwzVzQ0MGZydHFBUmNEeTNYQkIwaitaVWxjVVZnTVlUeFlT?=
 =?utf-8?B?YWlUVWZMYjlZYmhuU240cjA4SDhQbmZCdzkvN3JNQXN0eHM1L0x2eXF3aStw?=
 =?utf-8?B?Q0s1Z3pZT3Qza1BmZHZPUkZiVkhUSy9uVEhNV0NJa052c0pKZDBkcTM3ck8x?=
 =?utf-8?Q?Pt/28xnoQgaQgoPBIjdu7WynE?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50dd97d6-e342-47c9-12ee-08dbb2e2fe9c
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6280.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2023 16:20:20.9436 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MvSwHodj/C96mjFNmKCOQjwE8rFqQN+KrnEpBpJ2QTMLVMb/7G8fWSWARu+ni28RkGtxN0D9FdFAOWJL7mSW+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB7090
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

On 9/8/23 03:54, Jiapeng Chong wrote:
> No functional modification involved.
> 
> drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_dpms.c:2476 link_set_dpms_on() warn: if statement not indented.
> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=6502
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>

Applied, thanks!

> ---
>   drivers/gpu/drm/amd/display/dc/link/link_dpms.c | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/link/link_dpms.c b/drivers/gpu/drm/amd/display/dc/link/link_dpms.c
> index cd9dd270b05f..e7e528c68cb6 100644
> --- a/drivers/gpu/drm/amd/display/dc/link/link_dpms.c
> +++ b/drivers/gpu/drm/amd/display/dc/link/link_dpms.c
> @@ -2474,9 +2474,8 @@ void link_set_dpms_on(
>   	 */
>   	if (pipe_ctx->stream->timing.flags.DSC) {
>   		if (dc_is_dp_signal(pipe_ctx->stream->signal) ||
> -			dc_is_virtual_signal(pipe_ctx->stream->signal))
> -		link_set_dsc_enable(pipe_ctx, true);
> -
> +		    dc_is_virtual_signal(pipe_ctx->stream->signal))
> +			link_set_dsc_enable(pipe_ctx, true);
>   	}
>   
>   	status = enable_link(state, pipe_ctx);
-- 
Hamza

