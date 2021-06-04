Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB12439B9E4
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jun 2021 15:32:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52A3B6E488;
	Fri,  4 Jun 2021 13:32:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2061.outbound.protection.outlook.com [40.107.93.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6EFE6E4AD;
 Fri,  4 Jun 2021 13:32:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JWMKseTwruhvHprikyQmy20sSzBkqitXH7BYEAP/yXbj7f4KCU32wpRbSzMTUVftPJlxmU0c0hDoRibEz/sxWAC2B+iOVKWg+EI7S60wgD2zNl7Hcx9WUxDd2Kbo5Pv5eKINr30wLDaLYaZ47gggDo0sd/AecDdiFdFmdLTs2+BGFADIerMGYKa6LYwzAjl9BUltD5mqG1vsGAYto5sHgDriIICYMMIAPzdLUowgI+K2/3Yts4iRLbPni5aJqL3FdjG7dEJDIgxPQ/EMFEMgMj3j1N8wTa/Sxc2knKbXPNozdO0/7VBelcRN2s/v5A04CSilXEydiqxVIfi/sudZRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WofWlUcEto8pOE/CR66dhhLMc7DuoP3pa7qVDx4oMWw=;
 b=m4BlzJhmNEcXPuUIPpnIiY2ESXYbSyFKQcGKZC1eCMWB/xTcm09efT1KcbsiGJNUW3lZMhySoMxbfs7cqu5kzw2maPwcpM+JYXfa5gzP3UXir21OCMmWzIXm2sTnAFRXzZ/F0HZY2ghmqVPpvjPBQc9p1kJmVAgI+b/GQFA+iWdBUmvW0tBH/x8PDFwrQHsUeicgWPA14BIu4ODJEKWIpbi1PRWk6mGPqdvlRCQ08ejbaW2Kss/J3iOxP3WjRDYUVERnE+CuYWp06LNfp/W5TodnBpfnkxprz6kQSljYZEgw1/6n+uZQ4/MJV/hv4JRSSTOmM3ck0ckj3EBG8YY8bA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WofWlUcEto8pOE/CR66dhhLMc7DuoP3pa7qVDx4oMWw=;
 b=Gj4s87icniJRimd5avkZqox3CebZ07NhQTWzjaEFJQXpv0jkKFJeYRisuuz3UrdqGjQPuVfiysD3KKMk88CtIIbQsl/+BG75XhstfD0DqUZK0whkrQMNeZgmQhwbCys9Qe/wjTeVIbKmBnxtOrIW6Hwh1RiCwnsIHGYngyzuG8Q=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by CO6PR12MB5476.namprd12.prod.outlook.com (2603:10b6:303:138::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.21; Fri, 4 Jun
 2021 13:32:24 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::f455:b0b4:439:2753]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::f455:b0b4:439:2753%3]) with mapi id 15.20.4195.025; Fri, 4 Jun 2021
 13:32:24 +0000
Subject: Re: [PATCH 1/1] drm/amd/display: Add missing cases
 convert_dc_color_depth_into_bpc
To: Werner Sembach <wse@tuxedocomputers.com>, sunpeng.li@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, airlied@linux.ie,
 daniel@ffwll.ch, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20210604131634.6703-1-wse@tuxedocomputers.com>
 <20210604131634.6703-2-wse@tuxedocomputers.com>
From: Harry Wentland <harry.wentland@amd.com>
Message-ID: <1550e7a3-8769-b260-0f88-55ca0e8aa64a@amd.com>
Date: Fri, 4 Jun 2021 09:32:20 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
In-Reply-To: <20210604131634.6703-2-wse@tuxedocomputers.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [198.200.67.154]
X-ClientProxiedBy: YQBPR0101CA0105.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:5::8) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.50.3] (198.200.67.154) by
 YQBPR0101CA0105.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01:5::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.27 via Frontend Transport; Fri, 4 Jun 2021 13:32:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8ad331ea-4437-404d-0153-08d9275d2fd3
X-MS-TrafficTypeDiagnostic: CO6PR12MB5476:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR12MB5476048740DD9B138F9C64588C3B9@CO6PR12MB5476.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nfFCW4kG9v8P8ZR4osZh8fkOKMuE7Xue0yU2xVaVHJpYCSFa/LpA7VKj6cw7HcERUVoILhv+kF4Hj0QBNfHaotOei8krtNvPvjobry5AV4g1u4MwddYpY3KcVaCW6QXGDWJnA+fcU4KISAeiRTxbReHbA4ejEhMEZJcyNxgZGIMEd0Oi2UgnkVqcWOLKjHS5Tx3vuFCT0GDIEj3ykpzuzjELPm58A8Dfd3U1nEBMFXolBTEgG/dlXX9IkRTzcIqnweCcDqjVfxSWqBYnVFCiMryo1My84eiMuNmhCdhNL4lDea0/SBnhNy5cN8CIEA5dbhKpABPol39WbaQhLQZO0WHNOD17+sDDWWpAMrhfXl/oxU/cA2gOU+dqywz8xceJ5u/7kIRTDSt1efJrMRDakg9Ky53t6BEaQ+et7REGJvNXY+lWk+d0aHYHfSIFRZSRRehkVTmd+seSK2s7fGEyQcu1Uf+KwUG/uBfu9/UW4yiY+vQMNr6RJWlldPKCNuI1Hy6Eg4tE///y7aOQj1TjXe3nSqZn58GfIVYJGFZpSv6F6cdssnuEXE9Gy+lPa1tzWWgrPByf1fyq4HNwBNEnmTuF/IVsfcvrBRfdEDWN/xUkHf0ImQG9Drq2JstEfzJ4fwJihKe6vxM+5BHYinOuI+R/y3IICCjV4cI9kfGxzIphIMUI+17DIl+EBZtLYa7G
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39860400002)(366004)(376002)(346002)(136003)(26005)(2906002)(16526019)(186003)(44832011)(8676002)(2616005)(956004)(53546011)(8936002)(66476007)(66556008)(66946007)(316002)(478600001)(36756003)(38100700002)(16576012)(5660300002)(31686004)(31696002)(6486002)(86362001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?U2ZySWJnbUkwUHZCQ25QbEx4eFoxZU9hT0xuTi9SQlZLTUtpQnB3S0ZoOXkv?=
 =?utf-8?B?ZlNuNmtBN1JkbjRFc2JvUU1ZZUJQdEpEc090Y1E2YmdTNTZBR2sxbzJEUGww?=
 =?utf-8?B?M2xUQUZ6a2lhYit1UWRjdmw4WmZkTGZiT1VvRHp2RCt1TmwwL1BYWEZVWk04?=
 =?utf-8?B?d2xMODNVMHVydTRNbXoxMTRmbTVYVTFPazNUYjFCU2NBUUs1SklQS0J3bldI?=
 =?utf-8?B?TjQ4UkFjem9SNGlBRTZtSy9hRHRMRlRDOHl1MlIrY2lsR0k3WmZpSUxUN2dV?=
 =?utf-8?B?OHhkWGxEYUN4UEdIeHY1bEcvUHNKWk1KOHJpSHNYZ05JL2liZWhXcWRVRkw0?=
 =?utf-8?B?UHZ2bGhyVTdNY3RyMU00dW9MV3gzQllrVDdKSE9wbnJNZC9pTkhDWnFXYWU0?=
 =?utf-8?B?cVE2TWFaV1QzVmM2MmpYL0tEUmlnMno2OHRJR1FGUWFsNnRmN3lJWTl3dzRV?=
 =?utf-8?B?YVlVc3NHNjlFM0crOUoxRkM0bXlyVUpjYW8vV3F4YnlPeVZrTXppTlA4VTA2?=
 =?utf-8?B?OGoxZnpCQXN3SU5yNE9zSXhVQ3EvWGZGRCtwQ01SSEQwZHZnWmgzcExwSVFG?=
 =?utf-8?B?WHljQTIzc05RaUpnUTgreEtjc0VIVmVramdUTlQvMmxWMndrLy9nM0xvMnZq?=
 =?utf-8?B?OFZyRVhQb3RuZHRFR3JzOU5teEJyTitPMlpQNkpzbGd2MG0wam1mb2JsWTVn?=
 =?utf-8?B?OElvSjNRNzNFMkQydzkyZDlpeFFsZnFCdTNyRytrQjF1bFdnVW5NVDNyVTg4?=
 =?utf-8?B?ejdUMVJUK2orQjRNRFhaZUtJYnpvWWNZUjNuVmkwbkFCVFg0ZmZvd3hNdHY5?=
 =?utf-8?B?cUJjY2tXSFM3a1k5cmxNL3Q2bDRmMFRmeFdGMHFMZ1YvZWNudVpBOEtNUmFF?=
 =?utf-8?B?WXR3S1BxQ1BuYlF2WGRMdXVvMmJnRjlGUHpBN09tWWMxS3QzbEI1K0lNYjlX?=
 =?utf-8?B?QlU2OGZKR2ZyNTljT2J5WmFqS0htWHdKUGMzdTdSdW9aTFZnUGZXaCtSQUcz?=
 =?utf-8?B?S3pLd2N6VC9RcEdBTVJIVFFwc3BVSDNvYlFFNjJDWTE5SW1PU2xKNDdmUzJx?=
 =?utf-8?B?WnJDV2dUYU0rSnFWVTZvaWlnRVVKUGtkQXdXZHkzbUpvcXd4bXYxeXpZOEFo?=
 =?utf-8?B?dUdHaUpMZEdtMkJ6YTlWSlViSGdNRHJiL0FWOW4xcVpPTjlYeW1aKzNCS1Fi?=
 =?utf-8?B?Y2ZWdUlkT0lLdWdKc3JMYndRYURLWWdYVXZ3VkpQL244am10cnc5ckMxQzc3?=
 =?utf-8?B?ZWc4bWpCK1JVdEYreGJFTmdzcnBPRFdUdkhIWFptZ2Z5WFI1V29vWWViWWd1?=
 =?utf-8?B?a2E4MXJZWEtudWlRZ0UwN1VLRkF2NHdXOXVwbDJ2Q2crYlE4LzNXcUo4d1Fi?=
 =?utf-8?B?Y3BUKy9kWEhEVHM1TGZQTEozZ3cwMVBNeUYxSU5qZmxHRVZCYUhPcXViSlg3?=
 =?utf-8?B?TUtVdnVpVGtXZHp1WFpnc3RvV0k0TG5LWWNvbm1pczRxYmNvakRhaDhMb1Zs?=
 =?utf-8?B?dmFDSkp5RDR3UUUrUkJPZ25TUG9iNXl3UnF0Zk1RZ3Z5SWZVaFFmQWRITVZQ?=
 =?utf-8?B?UjBwYlJZSjNtZ1JqYlhPOHplSmI1T0IxeE5WakZTek9NM1hJYWJwWGQwcWY4?=
 =?utf-8?B?WkpJOUZ5Q3ZyY3NNV1RueHZqUEROYnMzWDJzV3ltOUZGWTRzeUVodm9vcGMr?=
 =?utf-8?B?N0k3cUlYMGtHV1NtanY2UHE5R0Jvb1hIRUZ3ZU5jcGR1eWwwOFV2aEE1K29H?=
 =?utf-8?Q?KDj6pE2NjXmRIZ+OfivvFfydvwTk86TgZmpBCsG?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ad331ea-4437-404d-0153-08d9275d2fd3
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2021 13:32:23.9735 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ljhpKgE4FP7YhDhfvymFvtMeQo8b8jVV6Tc0ZamnCQu5CsWIhd8csVLQBQB59bzuosWlqidrNGs27qQECMispg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5476
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

On 2021-06-04 9:16 a.m., Werner Sembach wrote:
> convert_dc_color_depth_into_bpc() that converts the enum dc_color_depth to an
> integer had the cases for COLOR_DEPTH_999 and COLOR_DEPTH_111111 missing.
> 
> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 389eff96fcf6..6e82889271d5 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -6515,6 +6515,10 @@ static int convert_dc_color_depth_into_bpc (enum dc_color_depth display_color_de
>  			return 14;
>  		case COLOR_DEPTH_161616:
>  			return 16;
> +		case COLOR_DEPTH_999:
> +			return 9;
> +		case COLOR_DEPTH_111111:
> +			return 11;

The color_depth returned by convert_color_depth_from_display_info will never return
9 or 11 bpc color depth. If we add these we should add them in all places where
they're needed and test the whole sequence.

I'm a bit surprised to find DC has support for 9 bpc and 11 bpc color depth but am
not sure how well tested that is.

Harry

>  		default:
>  			break;
>  		}
> 

