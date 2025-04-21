Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A01E0A9515F
	for <lists+dri-devel@lfdr.de>; Mon, 21 Apr 2025 15:08:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFF6010E02D;
	Mon, 21 Apr 2025 13:08:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="dm6KF0R7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PNZPR01CU001.outbound.protection.outlook.com
 (mail-centralindiaazolkn19011031.outbound.protection.outlook.com
 [52.103.68.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED1D710E02D
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Apr 2025 13:08:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a4PrDmWBgGRUOOr3iyn88alZEASE9NceeqxliS60GDq8nQqCJGJR4tAof68Gj3WF3WZQkf8OOhKEv6OFM9sxn4iUzWvz7gh9mUgQB8ZLQduReJ3frK+uvstLbgBm34r0p81hHeonM+ZyTFJ644c3aCi0kg+W1Pg3dBLD/4YzjwpFUW9KQsBifhiSaM0yLZV/0rugWr3EBQqBgjB3/9fxkBT1Al9nOC8RgJ0a34genuw1yY+B7NFq8hIxQcCOum0Es01iEGVxfJo+Ogke8Dkkq3iKZNRhNrL5y5SKBIS19Gt2vQBBvga5kjJmzQ8gNeGmEGWEmA26R1tXahPmqupa2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ACfoMmqx1siqXOBwf/1SZnThVfa19q1HKypTlnlKRQw=;
 b=vRN9U23L+NmVfgzpcSjtX40jhozmTVwxGhsWwYgO9uBtPHnZZhZTPm1nobJfjjTPThmHhM54jK1Nm6K6u96+8ycTLRqJt6+EHZac+hNBEBgmuQWJBhFJG/NzrdmaQTgV/yabKgPSiTnm2q5E/Lt+M8ob5WspGL1OnFgFoSweYHWwIGh4qP+DDwXnnuOqQfPESzlawO4sZ7y2eLz4yaalj49mc1dc8MsUGAL7XCnROKtsR9A6crxP7+ZvM/retk74xFvSqdSuAQRUpTapD1awcX7tcaxCx8dhfyr6EB+NOeZceNc6iYeN+lByESsWDn4rLUt0UsNikGNSdPmqmmEFFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ACfoMmqx1siqXOBwf/1SZnThVfa19q1HKypTlnlKRQw=;
 b=dm6KF0R7mg036ypvi8cSaEj1IJWGrME51nAms3fda71AD39qjx2DYG+Kr3c1xgM8EhhxkizjNYF3PJHmWQQx3dGW5UzuJfJjd9G7a7O5/82l3pKkKrAFhgbBavQf/BVW40EAGXSGCY0oJgLepf0YevRkeXvDP7zit9XZzg3ocUZ+mkC9p2P3cwaaIWyp4w1gkittjbaqfbtdUy0GlQPaVO+k8EqbVW5APQpZfrd7f0M4L5LnskAVEd0Y4NZM6sC0eTvmca1ZKBs4YRqADAIxYbG/WVL8vhn55wyztF12X14FaTofjkgf8tUqr/qcWrSe9W/isWPJ8jPYY6St7HlkXg==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by PN0PR01MB6492.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:75::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Mon, 21 Apr
 2025 13:08:42 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%5]) with mapi id 15.20.8655.031; Mon, 21 Apr 2025
 13:08:42 +0000
Message-ID: <PN3PR01MB95977FDD2F4DF6D9E198C516B8B82@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Date: Mon, 21 Apr 2025 18:38:37 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/3] Use proper printk format in appletbdrm
To: Alyssa Rosenzweig <alyssa@rosenzweig.io>
Cc: Petr Mladek <pmladek@suse.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Sven Peter <sven@svenpeter.dev>, Thomas Zimmermann <tzimmermann@suse.de>,
 Aun-Ali Zaidi <admin@kodeit.net>, Maxime Ripard <mripard@kernel.org>,
 airlied@redhat.com, Simona Vetter <simona@ffwll.ch>,
 Steven Rostedt <rostedt@goodmis.org>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Jonathan Corbet <corbet@lwn.net>, Andrew Morton <akpm@linux-foundation.org>,
 apw@canonical.com, joe@perches.com, dwaipayanray1@gmail.com,
 lukas.bulwahn@gmail.com, Kees Cook <kees@kernel.org>, tamird@gmail.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 Hector Martin <marcan@marcan.st>,
 Asahi Linux Mailing List <asahi@lists.linux.dev>
References: <PN3PR01MB9597382EFDE3452410A866AEB8B52@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <PN3PR01MB9597D506487C3133B0358CE5B8BC2@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <aAY0hRvNCi0y6rlt@blossom>
 <PN3PR01MB95978C5635B676286A9F0EB7B8B82@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <aAZDApE-Wm_NlbMx@blossom>
Content-Language: en-US
From: Aditya Garg <gargaditya08@live.com>
In-Reply-To: <aAZDApE-Wm_NlbMx@blossom>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0081.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::8) To PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:f7::14)
X-Microsoft-Original-Message-ID: <4aa98ad1-81c1-4e30-8adb-7c4d7c9f4190@live.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3PR01MB9597:EE_|PN0PR01MB6492:EE_
X-MS-Office365-Filtering-Correlation-Id: d5e744b0-2fe0-4cfe-d0d0-08dd80d5a383
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|15080799006|461199028|7092599003|5072599009|8060799006|19110799003|6090799003|3412199025|440099028;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T3gxVzNFT0YvY3hHVHhETmZ1ajNhclNmTnVjdXJWWXFsZVBhN0YrbUVvdkVE?=
 =?utf-8?B?Uk9jcnZVeEFTZzZKWHA4TldFTFJ6ZXVJU013ZWk2SXZuNERkeEp6eDczdExD?=
 =?utf-8?B?Yi9XTE8rSllBdEVhKyswOFFoODFRUUNKUk94T0tKc3lPQlhVKzloNG9QZ1Bo?=
 =?utf-8?B?WkNYUGdld0xrWkhsTy8rYmhaTnJsQVNxb01JeGRhZFdvTGVnZDZNRDRRMzhJ?=
 =?utf-8?B?TTQ2RmdXc0l4NlY4YnlyemxGYVpzQ1BPV1dXLzZjUGxRQk5VSjRaYWZkbUJ5?=
 =?utf-8?B?ZWlQZDZzOEFvSG5QU2oxQXdOQTdadkwyd2tuNVo5MkRLa2x4U3NRWDY5MkIr?=
 =?utf-8?B?Qi9QWG04aEhBV1haQ1pxYXUvVk1YbnlTUnF0ZFFSM25WRkR3UDVpcFBGVzhz?=
 =?utf-8?B?OEszMEFWRnpvT2h1L1MrelAwTFJXMGRzV1FlaU5idzRjYThwWHFVZ0JUaGtX?=
 =?utf-8?B?VFJ3R0lVNWdtaDQrSitMV3d2Sk9rQlNlbTB3ZzJhaWhWY1RWamlEeFo5VmVq?=
 =?utf-8?B?MjAzSnNDdXBhcE95L2JyVWRlanJuNFE0dmtlT0dmYngwNWtEOG5qaHpxTWtG?=
 =?utf-8?B?RVUvR2VGaEJULzZ5WUhhNCtGeUp1M2ErUmxTeGtqdmpJL2xmUE9MWE85RzI4?=
 =?utf-8?B?anh2a3dwSlR4Mm1kNk5UbTBFTmhCVmx1eGlUQXpEV1N2aTl6eDNJYW1lM1N2?=
 =?utf-8?B?VjV3bEUwR0xLRXFkZ3RwSGlpTFVnMldjZWZKTkoyblZmTEpxOXAyZEdQUVla?=
 =?utf-8?B?MDJ4MEhUamJadnQ1UDFiTnFtN3pkUEV5aDgybkhrVVN5N29VeitQNXppTWxO?=
 =?utf-8?B?RTVlZXNWeWtCNGJ2dnIyckJGU1ZrOUQxSTFYNmZNeEdRWlhidDl1cHQzSVln?=
 =?utf-8?B?WDVwZE1GQzFtekxzdExnSENEQ0Npa2lwa0lBd28vWC9ZYUNpRTFVUEoyUlh3?=
 =?utf-8?B?L2pVRXdZWTNISnUwU1V0S1FMcitwTlhSejJ0cDBGOWJkemhUd0c1dkVzWGg3?=
 =?utf-8?B?eVhSTUhpNlNQMXhreCtCVUhhSDAyZ2ErQVc1Tms4YXJDZllMdm93a1oydXFL?=
 =?utf-8?B?VWZzNURWekZCU3YyYmdGeHVFNkhmd3dvOVVlam5PQjlXNUxYb29ualpJakRU?=
 =?utf-8?B?QXU4bDlBVzEyQWNFdmFydmRwV0Vrb00xaU5Rd1NqR1VwMyt6Y1M0YlVLQlYy?=
 =?utf-8?B?c2ZNWnJJOVpCcm9pdmY0ZEYwMnVLQ1lnSXpZa3JpSVB2b01jMG1GUzluOFpm?=
 =?utf-8?B?WUF6NzNZOHNjVzdGMzZTQjMzR0cyRE5mNkVRK295R2JET3huOW80UVJXUVBM?=
 =?utf-8?B?eXZ5N0IrSVpwNElIbG9XbjhPUVgrSStIZmZZa3lkdVRlUHpoQVgrLzd6Sm5a?=
 =?utf-8?B?UmdPOUY2UklJTTRzOW42V2k4U0llRUhjOUhUb053dS8rYm15SlJiVWFGZTk4?=
 =?utf-8?B?S0hSdVpwOXBYcWs1cUdGR2JqdVNPVlYyUEtQN3IxejZwL21zQXR4UUl3b1gy?=
 =?utf-8?Q?dnyzIBQw/TSMwh64Wg8LXic+73o?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eWlJdVVKekJseHRHUEtPbXBJbjBhMVNGR0RyeFJXenNid0pvQ0x6VkRiVllR?=
 =?utf-8?B?R1dhR2NOQksySkhZTjZpR3A4MytGclA2N0RZZ0RIT3lTWXg0NzExWmpmQUwv?=
 =?utf-8?B?emdHNjkwVHA1VzNOVmlwYmlzelloWXZJSi9PaXQrUnZmeVVHZ25NOEVGMEFn?=
 =?utf-8?B?U0pGYk01azQ3UzBDbDVuQmFMb01TcHRsZVNOOEZMSGtkaUxLZklnNGVvd1RV?=
 =?utf-8?B?dC8ydW5TemRhQjZYS01rbXlxeWRzeVVCcjFlM0Q1UVMxTDRWZnhXbkJHa3FE?=
 =?utf-8?B?SjYvZERhSTdMRWE0K0VBM1Zha3Q2K2tSNGE1RjIxSUpkUDlscEc2NngveDNr?=
 =?utf-8?B?d3hVZlU3MHBjem5Rb1pwdEpEbXFUOFpYY0NpNUNFSmR1UGNtTlp1MHZSd1VB?=
 =?utf-8?B?V2NycjBucFMrYmlvbWFiSTVjNnZySVorYjJYbXdoS1NYTmM4bS9IdG4zK011?=
 =?utf-8?B?azVhY1JEaGx0STFYZnN1ZlU3ajhET1VjOVY3dlZZYUtnVTZhRmRlZVA5NFZN?=
 =?utf-8?B?TU55Q1p1Rk5zdHcyQ09WKzNhMzIvV1RYSzNCVWdLQVgvc1lodHI2OGU2Q1ZG?=
 =?utf-8?B?VnFBTTlqVm0xZUs0QlY2Kzg4YWJZRnpBbHRGSWpGVGk4S2hTZlJVWUQrdXN0?=
 =?utf-8?B?ejQ3ckZiN0ljLzc4dkE0YUtMRE51TWVoNTN2aDVQT080dWpadzhCdEdLUXZO?=
 =?utf-8?B?YUlaQ3dLZXZtaGJjMjlmeFovYk8rYnZVeTZ6TTY5d3VRR05uMldseEZuZXhQ?=
 =?utf-8?B?dzJ0Qm5kbk91UDByWm1TNVl5Y0hJVkpoMHp5U2owbnd5Q2NMQnc3MHFQL3pj?=
 =?utf-8?B?UVRreVhsbGtMZVBLdlFWaExFUTZyaHg4V2pzUmlma0w2UnZTQjNnK3ZYS0Uz?=
 =?utf-8?B?TmxxbGJqdU05TysybEkrSGV0WGtZNnc3a0JIcE0vQWE0UXpkb2UwaE1RNFR0?=
 =?utf-8?B?eC93VzQ0Y1VjWk1DVzhHaDFzSXZyN0NjMWhLbDBJMm9tRUJDcEhmQlluNVdR?=
 =?utf-8?B?TTdaaGNQN3FxL2lRcEhWUjc5enNidmRYUmF1eHBnQ2taWEdnNVQ2czZ5dWh0?=
 =?utf-8?B?Z3dxcFJNTHZMK2tLTmZ6QVl6d1NlY21WUXdCM2pDMHNDcEIyd0FLQi82R2hz?=
 =?utf-8?B?N3lTVDR6YjlRVXl6ckhGVVlVV0RsSjZrbERUeXNXUnlqQkNvOFhZQ1dIYyt6?=
 =?utf-8?B?Mk4zQnBmLzBzeUNnV2dSckRsVUpTSWx1S2cvYVhsNjBRT21UaHNUeVRjU0NE?=
 =?utf-8?B?N2d0ZkZXZllpaTRzdFZmeEdiSlhlaW5DVkhaa3U0enI3SmRDelJSOTdRcnBK?=
 =?utf-8?B?aFFSN3dLSDQ3STlkSlcwbzlCYm4wRnBlUWNzQjhLNmdBS29ia1VEb1JQN29w?=
 =?utf-8?B?RzE1THQ4K1JyWEhRSXFwVWtKbFRwTnhIcE9obm9pZCtIMkdzamFSMitsWnRy?=
 =?utf-8?B?aytuaEJjdml4SEJSQ0VmWEJYa0VMYXdwUmtjMTl3WjZ6L0FmRCtjZU44MDQ1?=
 =?utf-8?B?RngvLzdDRFNIaVROSWNGelhRZ3RKMm9uN0d4WU8wZ0xDWDAxZXJPblFIaGRH?=
 =?utf-8?B?a0l4djlqTmJsT3dBSER5ZnFEWGF2UlJzN3BBVzlUd3hHWUsrcW9PaXBNZTk3?=
 =?utf-8?B?eGlKOGI4SUM4QVFIWUZXdUtsSkdXVlRaQUFVNVFJandYOE1PYUt6SjJSMGVJ?=
 =?utf-8?B?TnpSN29xNzBFY0RLNXlKM2xSdm0vSHlFWU9hZ2UvcHYvNzBSMzB5a3pxZ1JB?=
 =?utf-8?Q?OZBu9uD1KxeFyKqGEOS+16NExSd6bchsanxFSnJ?=
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: d5e744b0-2fe0-4cfe-d0d0-08dd80d5a383
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2025 13:08:41.8766 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0PR01MB6492
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



On 21-04-2025 06:37 pm, Alyssa Rosenzweig wrote:
>> On 21-04-2025 05:35 pm, Alyssa Rosenzweig wrote:
>>>> Can I have a feedback from some DRM maintainer on this? AFAIK merge window is over for some time now. It's been more than a week and last time when I submitted, it just stayed in the mailing list without any feedback.
>>>
>>> DRM hides the merge window from committers so that's not super relevant.
>>>
>>> I am a DRM committer and can pick this up if necessary but it's not
>>> clear to me what's going thru with DRM vs elsewhere.
>>
>> All the three patches are intended to go through DRM. IIRC Petr, the vsprintf maintainers had requested for that to be done.
>>
>> The relevant patches have been Reviewed-by Petr as well.
> 
> OK, will queue this today.

Thanks!

Also, Petr has requested them to be backported for 6.15

