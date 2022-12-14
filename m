Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1893D64C54A
	for <lists+dri-devel@lfdr.de>; Wed, 14 Dec 2022 09:49:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58BDD10E22C;
	Wed, 14 Dec 2022 08:48:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on2094.outbound.protection.outlook.com [40.107.8.94])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8838B10E22C
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Dec 2022 08:48:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dcPduTur6VNMZ8BxcZ0geT2+zgok7aCUE2XY+rod4uxDpyz16lC+J+aXK3Hnb/+zS+7A5j9XPQ1zqD9TW5VECI3zkkJ8sx6CKTcZotp1FZT4d/cS5MvNFKMyIxKjoDTNf+JbrJr1DTB0F+K2crDiTPUd5gn2c2Ny6QnjBlRBve4mt3LYbbOQv49dmugnQebNuXSwrip9kSd5dH94YnkqBjxy7CYbsWJ2RCVk2SE75IYrBm3TPRzx6wHP9B1n1VekUzLPzocHUfekSlXmVEcFiuFzyTof34viMvGntVOCc6t1rM3a71AJm2gJSJrrWHGLLT3MLBfw05khGPHxl0dmOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OfzUolH9l8/nmJ6YvG5DE3c8WnKK7p3cmb+MA0G1Rk0=;
 b=dVcRHsgFyHcsVDjt3QQ3WPyqIfof6xHh7gEM8hBQ/6V0LSKuTjlSZjhmsFE5EARF3uM/8adshwnnU0p6cx6vLdLqrDPp/tO//WmEOw8oGKOrdFJrBy8iWYPwImNcBRYxvEEAPWJglY4VWBDGbHIuoCEDh84/9qWej3Kj9JWeb1IvLRcIBcizpjN9Sddm9qef3pPFTjK8OsWnGIB+Ofp6qYoFMtUkO3VoVsCCdppHXOqEtg85+QIFoITFV33MoYqSH3+U2ca3W9ivFOOBhaJ8eiQKugt15noF2mLGmoY1tgn0rwflzTE4LX/9OGf3YNNPKGuT2wwmS5WEvdFRIqyrFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com; 
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OfzUolH9l8/nmJ6YvG5DE3c8WnKK7p3cmb+MA0G1Rk0=;
 b=MN5aION81qRW0s/KRl4tX0daOU7HL5rNhSDc2qFYQkogGa1UuhVZlEWQ3SJcpj0SuGxydT9prGsw9cJiG3iJiPIDZGrxMN8zQmHM7fIuRIB+E+qkut6/UdcTUKLeg9K1g8D0OriQZHYfx97L6DF+J4pSU38teuQi2dJEPtSdqU4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:263::10)
 by DU0PR10MB7333.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:447::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Wed, 14 Dec
 2022 08:48:44 +0000
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::f209:bc86:3574:2ae6]) by PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::f209:bc86:3574:2ae6%5]) with mapi id 15.20.5880.019; Wed, 14 Dec 2022
 08:48:44 +0000
Message-ID: <d75b09e4-6ec9-3e7e-8742-48900913f314@kontron.de>
Date: Wed, 14 Dec 2022 09:48:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v11 2/3] drm/bridge: tc358764: Enable
 pre_enable_prev_first flag
Content-Language: en-US
To: Jagan Teki <jagan@amarulasolutions.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Inki Dae
 <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Neil Armstrong <narmstrong@linaro.org>, Robert Foss
 <robert.foss@linaro.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Sam Ravnborg <sam@ravnborg.org>
References: <20221212182923.29155-1-jagan@amarulasolutions.com>
 <20221212182923.29155-3-jagan@amarulasolutions.com>
From: Frieder Schrempf <frieder.schrempf@kontron.de>
In-Reply-To: <20221212182923.29155-3-jagan@amarulasolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE1P281CA0082.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:78::15) To PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:263::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR10MB5681:EE_|DU0PR10MB7333:EE_
X-MS-Office365-Filtering-Correlation-Id: da18fc52-3754-49ff-ee47-08daddb00212
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TMF5df1u2dGLuHUOsy9kMLSNQcX84j/yhf1rAGkcCiHF/xEKh7qdYe+nQyGAO1FkLYm8slpvlRN/W2cUmtR42nJ+S+cq1Do47xYEugqKGgzlsWTqzEq1ApKxvfE73zj6KQYt/r8XtGvNwr1VrG/vd/1TlVW+PbpckkAAnFUVHTiLEXOTn6CraWXbeTjiEySblHtW5pI+i5U55igG34xT8J1c+Eam0SvHcRQ8kReyvUN9d4Upp1+0iQ49KyEJV2T1Zd/mP7xBGamRNpEJLMPVZMPPjhixh/f4ITsgETCtgIr31fwjstaeznIqi57Paz6iKZCY3Ra5lp5annReeycmWI162iqgK2wCsjN9sf+fM4g1cRy4zVb1e3P8J3ax3fovmWKXh8cit94Wir1SMSmcq8OXaaPq4GNZ3Ii6m0anrkhHDDYj8F6gwlkMQn3QUfp9BapBd4HpEBGRY+EplA3bAL1Sfa3KpiuXUE1tSXQxyXywVbSxeVDGpGlU7/tgg1pFWv5+5HrLUz4q9CoNSeTw9/QTCt/DoaP+SrXZ3ZDkTlTeITeGe9Lnz7ZhdsngHa6qlQHI1hECXcX2nTB9I9BfZV1yYA8cObG81ZQJ1S2Yhob1jw/PpT+PLzPTB6t9TsKlF1M6If+MzYZJlRDoPaYRjRmG8H9jYV6z9Yr6QmdKVQT8JggMs/RpwUP4cupBvYjK69qF7HP154ASA8CZGn7FVXHusKtqtqgmUbNYUa2EPXw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(396003)(136003)(346002)(376002)(366004)(451199015)(31686004)(6512007)(6506007)(316002)(186003)(53546011)(110136005)(2906002)(2616005)(8676002)(54906003)(36756003)(66476007)(66946007)(66556008)(41300700001)(4326008)(38100700002)(44832011)(4744005)(7416002)(5660300002)(478600001)(8936002)(6486002)(86362001)(31696002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U0I0UkRUVTZxc25Eek1GZHZpek5LTUpiaEdBcmRCWXhCa2NLVVUxSXRHMm5l?=
 =?utf-8?B?YVVzR0VkdDJzcEVTM0FXOVJ4YitTL1UvdUV0RDc1alljd1crOG9LRmlNNWlm?=
 =?utf-8?B?MUluQXF0dWtUMVRxUk9WdnRQM2ZHMVNrNllXNzBEb3pSSmVaQ09SbUZrQzZs?=
 =?utf-8?B?TkRKVnlvY0tEc05KeGljZDNXdU1QSmJWaC9pSkpDVDFxRjZjZXFNdHQrUG9G?=
 =?utf-8?B?RDFyOUZRb3BwS296anJwUlMrcEppcDh5WTZ4ZjQ4cnJYU1hYaHl1NXNnOWZ0?=
 =?utf-8?B?Q3JGMnpwU3lCYjBCaGZZN3NtK1pLTEdFUm9tTk45Vnh6Z1R4YlluQ0FrUE4v?=
 =?utf-8?B?MmFGWWVEVHFlUDhIUlc1MmViTmJXZGQrVUZhU0JwZDBaSVN3V25PKzNPdHZs?=
 =?utf-8?B?WDI0cmVKNG5VZXRzd2JmSVlINDV2N21UeFNlK3JKczRBZHc5UXlnTzBJMGxu?=
 =?utf-8?B?RlNxRXpFUkZqSmM4QnNNT0pzY0NkdG5nV0tqYi8reFJxZU8rdnhUemZITER0?=
 =?utf-8?B?aUp1RFN5UDdLNCtxNVpraHFIVUUwekJmWG9RR21tQ09nNXpsZHFGcjN0UkIx?=
 =?utf-8?B?R0dza3ZrMWs5ZzhSYlFTVmZzRktuQ2dJLzEwVzVBMUlJMVNCQWRlOVpJVEs5?=
 =?utf-8?B?SnVrb284TWt1eHQrQWtHVmZLS3RTckZFeTB0UFh5cDJVUmJRWXhyZVhZNmJp?=
 =?utf-8?B?b0FBeW5UakUvcXFHdW5BNGxmSWwxRzZWVmtVQlVLZ09MZmltSFhyZjkzYTQy?=
 =?utf-8?B?TVlucFNsMSt3MlUzTTZYMkxITmdaSEZSU2JkWHBGa0N0U0phZzBOTVhDc3o1?=
 =?utf-8?B?cG00dlhaSlhWV3FZcy9Tc002dnVRTllyY3JxREVsNWxKSDVSMEZNZjZYc3hq?=
 =?utf-8?B?c29VL1FmdHgrSVlSejFhTU4rM0hDeE5Vb1VaU2tKMU53eURkam1QcXN2VlNz?=
 =?utf-8?B?S2tLUWpwZUl2ZEZlZFArM0cvT2oxVjdFR1YzNE9aSm1RK09xMjBqTEpneFVj?=
 =?utf-8?B?bmd2RGIzanVpUXpFUmlsVFpRUjZGTWIweUxrS25qN1pVdmlXdXdjYnBaZ2RG?=
 =?utf-8?B?Mm95a245M1NtMmZjY3VYRTJ1c3Q2WGNHL0I5V3hmZFczelZvaHNSQnRsdjdz?=
 =?utf-8?B?cWllbGZuZDdDaitYZ1VoK3paNGFOc3BJTzA3dzlGYXVQOVIrYVlsd2Vidmxu?=
 =?utf-8?B?QnhvL0Y5cXFqYTAvS2V4L3E0WGxqT0V4NzBvcERRL3BRYTdqU1JEMzlVNmdu?=
 =?utf-8?B?RjBYMVJncUdwYmx0VTZ0RHB6d2Rpb051RnlHRFcyTTViN2lxWDFxRThoek5S?=
 =?utf-8?B?SW5ocGIweEFycjdzZk0xRXNCRzUyc3Nrd0Z6VEh6UGkwb2E0Wld0Y0M2dGtl?=
 =?utf-8?B?Ykl5YzkvL2tYbDlOai9JejlJb2MyMnBJbXFrYXgrZHZLY082cXhGN0pXNktx?=
 =?utf-8?B?M1F5cUpxWmNrS0xCa1IyMVY4L2hlcXVpRGZicVNja0dRT2UvWE5CMGx2WFJk?=
 =?utf-8?B?VXJBd1VTR2dLeGRsVjM4NWY3RHdTcnVKd0NjcWJzSnNMQWVlTXo5M0U2eVcx?=
 =?utf-8?B?S0k4TVNObVBTMEl5NmRzcnV6NTF0aUh4ZzREK3dqbUtxSm02TldoaHNxSnFL?=
 =?utf-8?B?ZzlETlJFNDdIQmRYc1VhMUd2ZFgxQVA2QkhZVDZaUjZNWE1Da1dRdGF6eWtP?=
 =?utf-8?B?SGZBK1N1YXNEbG5KV2JXSXZNSHNockNlSlN6Smk0MGpkM0g1NjVLeHlGcGk1?=
 =?utf-8?B?eTRXRG04Y3poKzhmRE1mUHZ0dURTZXBvVDU3b205VGRWbzhHODJ5QkhnNjNM?=
 =?utf-8?B?ZGtTeDlVMHBQeGZDcFNQRHdabXo4cmJlUDA4SlE0M2pTM28vZTRHQUdMaFcw?=
 =?utf-8?B?ZmlBTU56dDRZdVgvQ083OGNtUWI1SzRlWnRGNUVobHJUMUFFMndZY0N6WEFZ?=
 =?utf-8?B?RDdyRXVuci92OGxMUm5wMzFUNDFmOGdPeEE2aWQremZEblRYZFFhblY3WmxQ?=
 =?utf-8?B?YjV2dWt6TGVZeGhRbnFDUEFsRWlwS2ovdk1lQng5NEdYb29qanovQkd5NVJO?=
 =?utf-8?B?Q3I3NjZ4TkN1YS9ZeER6aFRCamlFNS9MYjNnUlViNlVpa1BJUW9jY2NzeEEr?=
 =?utf-8?B?VnBVZVBKblFYcHJJUzM4bDM2bWQvdEwrQjd0cENVcGNEdHBPTVY4aUJSU1Iv?=
 =?utf-8?Q?xBO1GaHJ4HErzJUJNDQdELfs37lGWGqdbZcUwZA9nU7Q?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: da18fc52-3754-49ff-ee47-08daddb00212
X-MS-Exchange-CrossTenant-AuthSource: PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2022 08:48:44.6217 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +WhMartT3Q/QqkNAwl7fRU21W7LghuIKotCLfoeEy4KutI/iJZU8u0oW44/yLxAKvzYQ0M4bIl4Kf/H3kvrN8+CaUBMOsSL3veWQfg01VZA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB7333
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
Cc: Marek Vasut <marex@denx.de>, linux-samsung-soc@vger.kernel.org,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12.12.22 19:29, Jagan Teki wrote:
> From: Marek Szyprowski <m.szyprowski@samsung.com>
> 
> Enable the drm bridge pre_enable_prev_first flag so that the
> previous bridge pre_enable should be called first before the
> pre_enable for the tc358764 bridge is called.
> 
> This makes sure that the previous bridge should be initialized
> properly before the tc358764 bridge is powered up.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>

Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>
