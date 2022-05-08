Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 522E751ED3F
	for <lists+dri-devel@lfdr.de>; Sun,  8 May 2022 13:53:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AC1E10E96C;
	Sun,  8 May 2022 11:53:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam07olkn2082.outbound.protection.outlook.com [40.92.43.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68AC710E715
 for <dri-devel@lists.freedesktop.org>; Sun,  8 May 2022 11:53:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DL//L44WcERATFWL6Zy3UpiUoT4pI/kdPkBYWuXkCSGQyy+zhcgOavUl82fbKJ2pbqJWi/tHKSqDSb5xcJofxkpKuFI6E1ninmktiWMmGeOeCuDENpxdIcER8nXVYUav0iH0P6a1mMmlsLZ0AWAyq6n31JhFQf2pLM18+iD9bSS+NeAHfpPW4Lx7CybTirIJKd8KyeoEofEN4LFE7Bc7SPrnKbcYTy3LLI1RaFrUUaOwZFUGjOuJnQ0Gjyy2muhvBW81Pgnf2rGXXCYdQ7GO2k4AF4E+t9xWb/NTpZ9zKwwMZKXs8ufsNJ2qjwiY10wW9TKwGCb6dw4yCgw+tlZ8lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5xyF+7hSPW8RsyFbukfzJkekAbgPvLkzkgBxvvajf1Q=;
 b=k34J8/R5GRT0emjLKkxPOxglS3t1cJD5ZjAX6iWZ5JUyeNaZxpl+quwc0hGjTpGTGfc+rZ52kcs0YrYCa16ZN8AHX74QiRqx5VZS6PXWcuMimP3GOnLLMrUUyicxWw90wzuVvklYeFdTZp25nmZy3zy46CBDVhbRy9vR9M2szr9+fKn5xSHktfLLT1W5gTxxWf+28iffhvhUevhM9gy/jYZg1kYA3iAEuiQhin3vPrAUc7yDg0a1qPdUlLhlLbcN0guD0gca8A1FfWcSsKzVZAb/c6vv8fEmEUUdanN7+Lk8T9WoA4WYKxwwrdnPdPgTpKHKypIXOV+TKkDlxksRgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from BY5PR02MB7009.namprd02.prod.outlook.com (2603:10b6:a03:236::13)
 by DM5PR0201MB3461.namprd02.prod.outlook.com (2603:10b6:4:7b::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.23; Sun, 8 May
 2022 11:53:20 +0000
Received: from BY5PR02MB7009.namprd02.prod.outlook.com
 ([fe80::303a:ab1:17c1:2d16]) by BY5PR02MB7009.namprd02.prod.outlook.com
 ([fe80::303a:ab1:17c1:2d16%9]) with mapi id 15.20.5227.023; Sun, 8 May 2022
 11:53:19 +0000
Message-ID: <BY5PR02MB70098447E93301C5658DBABBD9C79@BY5PR02MB7009.namprd02.prod.outlook.com>
Date: Sun, 8 May 2022 17:23:05 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
To: krzysztof.kozlowski@linaro.org
References: <2ab35af2-b067-4243-35ed-a592a7046374@linaro.org>
Subject: Re: [PATCH 2/3] dt-bindings: display: Add bindings for EBBG FT8719
Content-Language: en-US
From: Joel Selvaraj <jo@jsfamily.in>
In-Reply-To: <2ab35af2-b067-4243-35ed-a592a7046374@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TMN: [yLq2wuDRCli6jZ3nuKsF4eog37f6w3Hh/+fyx5HH2KjzhXk/tduLk/zn1yVViMuf]
X-ClientProxiedBy: PN2PR01CA0110.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:27::25) To BY5PR02MB7009.namprd02.prod.outlook.com
 (2603:10b6:a03:236::13)
X-Microsoft-Original-Message-ID: <ac50c4fb-cdb2-260c-c4c6-b5be51eeebc9@jsfamily.in>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dd641cf5-42f6-4c17-18a3-08da30e95762
X-MS-TrafficTypeDiagnostic: DM5PR0201MB3461:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OiHz2504lBhYDMyGP7wPUeV81i0cOZMwlzBWGQo4EtSHtvCjKJ9Tg4X9ab9kgNxVF4o/yIgrP01qaXO2bXbMRG0HeXdhJzggzIjbfbZOaw7YPAPdAvEevXmorDYpYaIS9lj9kP/5PWYAa5Eh9AKy8kWjMADu5iDiexDKP2xMPtOrqegPVP0QmezJjQKe3Q5rP3d/Mm0ye+1oegIb/y4Mp/IBzMfZ5nhdjpoF+kXMT8FSfaUZKJ60aQ7nsceDv+WesdsOXzXT1pBmCxxvUJUH8WZt5Dem1jYnUowVhdb94YvclJhpQ0AAwdCxRnFU+KIqug4FswgnMe3crjGFwwAegm04gkxCqp2/cMPLMmTMAp61n7sDAYFhY5r/1UndO1MEswbhvFW+EOqIuAA8nRbmWDiIfCYo7PEa+MuSRm2d7qH0azEbBF82s7Z29gFrR+iKGFuzr6KfPT/RPy5JuOpyF+064A+20WlSKHNmMXRblchYekmq+PIf0CIE4qlZ2wXEGdLgZn6gzBZ/o9Ym9XQwh7Utq3I3VuUmMjEiJANbn3lTNNCm92/2VCu2VNd/l02Eth9qQF3U6ktNV5Q2zZn8qfFuN93tGp2k1+UFzlXBVOZfmofdFP5h356FMOqXaQJY
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V2l4TzVYV0pzMytOQ1MwaEZPaG1HZTZ2S214bXJPdDIyR2hyTnQvallieFc1?=
 =?utf-8?B?dFJ6MXlrRC9YWEdZNkNqb2MxQ3MvQ2NTTEd4T1pxNzdub3RDQ2YrZVErbGt2?=
 =?utf-8?B?M3EwQzArNWNrczRRT0s1U1lWcHRpR0kzeXVSQjZOekJWR09KdUlyaVk3VXlV?=
 =?utf-8?B?VXhhN0VQZzdwaVJWdG5sNElZRUNqTkNSYmppWG1zcmI0Z3NhU3ZiTFViNWNH?=
 =?utf-8?B?enJ5Z3lHbUhZNkhDaHlQRHBaS2Z2NnRnVWFWdjM1MGdRSjVDZ1NnQjBmRjRz?=
 =?utf-8?B?N3djdDRROUhlcHBTd1BhZUx5bFNFbU0zWE0vbHRDeUtnaDRxWlU0RmJEcTRH?=
 =?utf-8?B?VzU4bjFKVm9KOGhtZkNuYVBGOVVJZ1NqQnlzdlBxT1NqV2tUeE5WUXdvS3N4?=
 =?utf-8?B?bEYxQjhaWWw2Z1g1TVRJa0l0Sm84UzZxOGV3VXlpdUVWYjV6SmlTWis1bHdD?=
 =?utf-8?B?RDdHZFZiZ2tMMmNIUU5ybXpxS0hMQjFpTWl3MHh5ZGM2b0ErNWJSa0owWjhQ?=
 =?utf-8?B?L3JIYXZhVWl4dU1LN2w5TjZmaGtYQUNjUVRLd3lTdUVjN00xWTdMT1E1T2sz?=
 =?utf-8?B?STBGcFdReFlOTjNNOEsvMTFGUExtL3hFMUtxNU5uVi9PS1NSbjZTWFlPOUZC?=
 =?utf-8?B?dEhyM2FQVXAyY1BwQWJnRXRKQU1VSmhhQTR1ZjVjWmNFb2FuVHpwQnF6QmQ3?=
 =?utf-8?B?SGxyVlVxSkh6U25CNk5tdmhVckxQbXlnMUpGQTRDRk9TR3lzNW5HdGNPTGl0?=
 =?utf-8?B?NUwxcVhVTGhMcjhFbkdOMjhpM0UyV1pPTlZxbWlMb3RRd1BXTHJ3blZNOUND?=
 =?utf-8?B?Mkt0VGY3NU12amRyKytoSThUVEJ0cFYrQXhCbmZGbEZxTTB0cGowWVNRTksr?=
 =?utf-8?B?dGNnWVRxZEduclowclFCdnpPYnR1aWRNd3pwMFVqckRRY1ZpdWE5alFuZzMz?=
 =?utf-8?B?TWxMTUVGR1pYL3RNMnYvN2NUbVRUT1RBS0hFOGhzaEZzNXBzcGNBcjZBSnlJ?=
 =?utf-8?B?Z2FwTjNGbG5nRjdva1NTQTRDaXlxTEJ4bmErdFVhVWxkc3hKK1R4Mk8xWWRw?=
 =?utf-8?B?bFI4c3NIYlFJMnVKdDBjOGp5YzdZaW9pY1dJSEppMHQ0bHNieURSSDJDaFhL?=
 =?utf-8?B?THhaVU1LTVJiRS9LTmFnMlp5bWgybEJLV2JUd0ZNWEhZb3NEQ2ViUEtlUTU1?=
 =?utf-8?B?RWUwSXhwVlVtdHp1MXQ5RnBPZWFDS1hBSmZINzlaOU5VV0sxOGQrUFpZcGVw?=
 =?utf-8?B?NndVbTlYL2FmL3NOUTB2WlB6ZFRMVXlmU2xRQi9hY1FzdWw2dXAxaldZV3g2?=
 =?utf-8?B?UmpMK3ExekI1dzFja3V6MU05MW96NW8xeFdQTXkraVc2akprRklXSWg2YmRv?=
 =?utf-8?B?SlhKT0ZUd0g1ZVFZdFM2RjNTVnFMZEJTczk5eStHaEc1T0R5eGNranJUMGJt?=
 =?utf-8?B?OCtwejdoQVh5OE5JSVJxampYRGJpaDhjM2NOaEdmV2U3MFkzSWM1TFdlaGFU?=
 =?utf-8?B?aDgzek1GalBPakUrNlZFSUZYSU5tRlc4Wjdja3FVbTQxZFFmQlBMOUhTNkky?=
 =?utf-8?B?dkhBbXJaM3Y2SERhenQxRHFYamRpRXM5bWFlWC9lL0dEOGFaUVFKanN4cXgr?=
 =?utf-8?B?ZkwzSVc5RFU0UzBnRmFWaG9WK1hsVkthKzhEOXZZZ1Z0ZExYdmI3UW9uNFN1?=
 =?utf-8?B?WmdxQ2ZBWTBZVmViVGdsR0RoOHZmLzBvWXRYM2NUaUJqUTVFVjRMakNieDhU?=
 =?utf-8?B?TklYbVU0MVlibFhCOUEvQXFtSllpRDBKTEVYU3JIZkFHbWRrd2VhT3pYQmFX?=
 =?utf-8?B?SkdBU1BQc2xLOGxuakhDSldja0FkNzZCWmQyUUI4a05KZFdMMlhyallSelpV?=
 =?utf-8?B?UW00YU1kUFF2aXlJYU9raEkvc2pTU3pzTEJhU1JjQkRaZFpHTkg0SVJmenE0?=
 =?utf-8?B?a3hoY0FlUmU4aXdlRllHSjM4K0dVeGlIL0tobmEvcjBqeEN1VU9qVnRXN0Nq?=
 =?utf-8?B?YUVYdXd4RXpnPT0=?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-99c3d.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: dd641cf5-42f6-4c17-18a3-08da30e95762
X-MS-Exchange-CrossTenant-AuthSource: BY5PR02MB7009.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2022 11:53:19.3687 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR0201MB3461
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
Cc: devicetree@vger.kernel.org, fanghao11@huawei.com, airlied@linux.ie,
 shawnguo@kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux@rempel-privat.de, robh+dt@kernel.org, thierry.reding@gmail.com,
 clabbe@baylibre.com, phone-devel@vger.kernel.org, sam@ravnborg.org,
 stano.jakubek@gmail.com, jo@jsfamily.in
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Krzysztof Kozlowski,

Thank you for your review. Will fix them in v2.

Regards
Joel Selvaraj
