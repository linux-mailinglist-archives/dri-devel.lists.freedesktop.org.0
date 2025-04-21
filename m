Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AAC7A95163
	for <lists+dri-devel@lfdr.de>; Mon, 21 Apr 2025 15:10:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94F9E10E399;
	Mon, 21 Apr 2025 13:10:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="uy7PFNum";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PNZPR01CU001.outbound.protection.outlook.com
 (mail-centralindiaazolkn19011036.outbound.protection.outlook.com
 [52.103.68.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5037C10E395
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Apr 2025 13:10:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tOWm44Fxl81Pt8K1FTarfqWYFyNr9XMLpPje9f+ESN5DfXTgrLm1HnHelmL7YgcT9Trx2X5hC3+m2XjEyL0dg0y00mc/xNbMKhn/H+FX0z7P7+61i+tolsaLpXS0vhwONCxZIwbWT/03SbrmuOc8DSBYRVg14KkjUD0HDUWMsi0CRdn9xeJ7MPCGln8S9C0U61grc9PmNsE9aIettR2l5jk5lVgmVRkhLSFFoREOLgO+w9K+6mdLC19pCFwEjtLmgu6xv+yigSK/iKivgVwMQYR/sUfYJ6SzuT/uEZNdRWeb7JaR9mUJ9UXuSLgM/lxmuA6rDLRuh4Ggi/5N9HEm+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JSJrzvw80Jv4jthVp+0mKwDnuCili98nmI0s6MI3yyQ=;
 b=fy/QCjSlhWCWAbvwRc/dOMIzlxKrg6uHx+645iSTja8C6eV2lfa9bwq5qp7JEXD5Azds5B5mL1qat28N7LtirEuyVL4zlCeIuRHU+pRTlBOyYCmnlKJdHDLxWOk4Xn7UmTV7tRzBS+cY/s1w1yEfzh9ZLfRfhVO39aDL1DvKZNjq9UWehfpQtAL5PH0irNUXLYeEX2tglRB3YBBQ/qbQrqiFDJqNhtfRBgEzG2eAjUsZTMaZcWzM9/IAxcPer8KHWwDdBw7oz55/SJJaGgg/mYhNqGslm20ZYTIsFz0GJyCBl2VeZGHVxi5IW4YRj5x4pmLdZW2Yq9jySpaHdqfkmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JSJrzvw80Jv4jthVp+0mKwDnuCili98nmI0s6MI3yyQ=;
 b=uy7PFNumAPSy99qRuep6/z9PX//MQluBcX50fxC1IkmCw/ZtsRVKW13qh4fs6xa2/0iihF8OzvAPa1LsrEUUfBQbwqCgeWHT1j3nI/yAeGP3h6i2dNs5A1aTZEtrHalRBB5EcOUn2Xv4V8ZH/pSCtC9BNivn3StfHfh59A0HL+a4tw8WogeTMFuuaumuHnLSbwhTIVX4r15X+VLrbspWXcIXjxtMeF0P/RzQOJT3xqXFUWvVDc1uXDjvTmTA1a7E8XKOsQlRunSm9CIFWJ0GHZ1rLv3yyTr/mCmeT/2QbkjkaPAEhE8+VrE3dJn4szbxW8I1najBv1+bMyY6vzDWYQ==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by PN0PR01MB6492.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:75::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Mon, 21 Apr
 2025 13:10:27 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%5]) with mapi id 15.20.8655.031; Mon, 21 Apr 2025
 13:10:27 +0000
Message-ID: <PN3PR01MB95976BAC455F10F6D75B9C84B8B82@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Date: Mon, 21 Apr 2025 18:40:23 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/3] Use proper printk format in appletbdrm
From: Aditya Garg <gargaditya08@live.com>
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
 <PN3PR01MB95977FDD2F4DF6D9E198C516B8B82@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Content-Language: en-US
In-Reply-To: <PN3PR01MB95977FDD2F4DF6D9E198C516B8B82@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0181.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::19) To PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:f7::14)
X-Microsoft-Original-Message-ID: <8a89c154-d7c9-4d83-b780-f0728bd3a9dd@live.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3PR01MB9597:EE_|PN0PR01MB6492:EE_
X-MS-Office365-Filtering-Correlation-Id: 337303d7-58dc-43cb-5127-08dd80d5e280
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|15080799006|461199028|7092599003|5072599009|8060799006|19110799003|6090799003|3412199025|440099028;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dk5tY01DNmZDblhBSldRc1hjRmtJa0VjUXA4dnFzRkdkTWRNNVppWStRQVJ3?=
 =?utf-8?B?b0ZGMHorcjE1RlFQTTFMbWgvdEt2VmU0Tm9mcGRyTEd5TUYraGpqVHZvV0Jv?=
 =?utf-8?B?dmhrRVpHR0tqMEVWQU5NM3JsNHhKdWNBSFV5WGI4VEg1ODJmYXRmOThVeDE4?=
 =?utf-8?B?bS9sS0VwdThkTi8xL1Y4YmRmUnRuaVM1MjRuV2xZOHZaMm13c2FRZHBwZmJE?=
 =?utf-8?B?ZEFuZk1DQys1dlpKZVdNYW5SN1JYemE3OTdCN3N6VFNhQVJkRmpqSWU3Z0Vq?=
 =?utf-8?B?VE42NGIxcFQ3NmtSQ2pDc1F1Yk9lOWppVXpMd0NBbVBHMkNhV0RKU3E0cHFa?=
 =?utf-8?B?cmtPQStMVVVsYlN2cFp1ZXpFZjVlSEFMQ2RlRVBTdkcrZStFbmxYMGRacEJ3?=
 =?utf-8?B?ZkFsRS9qQittV01ZZFd3QURDeCtPekp0TFYwSzhUOGtDeEMzSTBCbFdnVjRX?=
 =?utf-8?B?R1VFcGVCK2Y1cTRqR1hsbEQzcFFlZlNtdGxWRUc2UmFKelFiVi9RWllLZlhv?=
 =?utf-8?B?aTZsRDhXeUJ6blZVOGROY3V6dmhKdjdFOHk2RmNzWTM1UG4vSFZmMXR0U2Ju?=
 =?utf-8?B?aHZ0emhHZWkvRUFUazBRZ2ZIYUduOXgwbVdBU1oxdmVGdkR3aTFHZlkrRldG?=
 =?utf-8?B?Q3IzRzFtMWNvY1NWSDhTdWk1Z1NIMVR1blBUeDNsMlpMWlJpWXpIOXozOUhZ?=
 =?utf-8?B?NUtoZGw1TGxRd2V6VGlOUnNabTBqbmIwMWdUN1RVMkFXVmtUSVN5ejJ1S09W?=
 =?utf-8?B?Sm1iNG5xQWxPNUFTZVIzaVIrREJ6cXBVYkFFL0ZNbURnc0cwQVIrT1FCRnJq?=
 =?utf-8?B?akFXQ1FScmdlUUVESGJEelJTWTBBdHJxRGFyemtRT3lHU1hKSk94QXpMZWJ4?=
 =?utf-8?B?ek9JVCtVSzlQN0JPbDQ4Y0RqQzQwZWlNazQ3TFNBNFVUV2Fxcm5STC8yQ0c4?=
 =?utf-8?B?R1hsVDFQTFd2RHpCU0EzMkd1STNmeXl6bjFVMHJYUkhZN0l3V3JOTlV5ZmxC?=
 =?utf-8?B?ME8vSGtqR0NPcEsxeXUybXB1K2ltNjIzMWp2M1V3T1VMYjF1WTRJZWt2Qm5H?=
 =?utf-8?B?OXBjdHVMWGxXZndaYUJycjdmSVBVbWtlcHVYNElUSERqR1Z1S1JDbXh2TjlY?=
 =?utf-8?B?M0I0UUxKNzUvVjBNVURkNU5tcDVEWjVmS0VPcXlzU20rNURURDNubGZuRHQw?=
 =?utf-8?B?ZFJxWnZkdFZudzlSSzU0dVVDUU5mU1drSTcxejJxTG9MOWZDVlpmVkxjaXow?=
 =?utf-8?B?ZldPc1dPSk1TaEMrdWdwUk1FVUJWRWM1QkQvcWhFcGxvZ3prNnBmNVI2clJL?=
 =?utf-8?B?WXBBMWEwejRjMmw1cFFjeXpWSE1nMFNtU1IrNW8rdEtWaHN6ajVzTy9JeTlB?=
 =?utf-8?B?Z1ozSVFaVllwY1o3WFR6K0syN3NvZUZYR0xqUER5UzA1QlNWdW9nSjRmRy9l?=
 =?utf-8?B?VzRTM2gveVV4THhXNU1zbStrbWo3amN5V2hzalVZa0lQKy8vbCtVQU9Ld1Qx?=
 =?utf-8?B?aGRiTlNJUTJUSk1FUDZyN3VrZS8zSTZHK1dUNXJkWFhmNVp6UXgzY3JSeHFh?=
 =?utf-8?B?eXVoQT09?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MDFEQ2lNbC82bEVnZmRwY3JNaVN2cUxHM2RYclM4RjQwNUxBSlUzZ3FzYXJt?=
 =?utf-8?B?aGxVczBWdm5rbnkxcHpLYTdqbG1IUDhOdEVLTjZaaElubDBWNUJ6NDR4OFZu?=
 =?utf-8?B?YkxQL1RDbGtaYjhHdVNkdy9OK1E1N0NxbXNsTm5EcS82T2lpUkdBTHI3Nm1O?=
 =?utf-8?B?R0x6SlR3SFc1NFNkM1MvZWxqaG0xdjV1V0dhc3cxdzUydTZmSmNKMmdHZUdm?=
 =?utf-8?B?U1lHdWxpdVpNeVExcGpBckh6YXEzN1BlNnJyL2d1MS85L1NnMGlGNHNEWkVk?=
 =?utf-8?B?bkkweE9zb0I2ZTIzV0VIckJWbEh6L1FadnJYb00wMWJCaEkzSjZXc3lNZVUy?=
 =?utf-8?B?UmZCL1ZCdk15NFpoSFg2ZVkxT2xyZzJQRUhNdHh3aTE5M0FyNjNBZ3ZBN3NQ?=
 =?utf-8?B?U2x0aUQvakdEQk9pZStTa0RNMXBQNDhncEhOK0wrOEh4TTF4bW83YUpHN0pz?=
 =?utf-8?B?bkxqT0thNCtXcWtua3VCcjdoK3lqakZsaDRicVJUVCttbGVzVGMremVielVm?=
 =?utf-8?B?bERqZkdIanZvbU5VY2ZCM2lHMjBaQ05reXZoL1NtTWp3WFVhZGZiZjExTVUr?=
 =?utf-8?B?L2VZNGMyRXhUSVc5WDRZR1pDYjBESllBZU9hNE9SdThFSE1raTNSZDlUSjBM?=
 =?utf-8?B?TFNXa3FQcnJPdmRER0ZreHZuRlduakE4Vmp5M2RJSUFNdXlrTGJ2STJ1SSta?=
 =?utf-8?B?K3EyOTBNN0l2RUd3L3R6NWJ1RG1qeSsxdjg3QW9QWXJ0bkhkMGhzR2VjYkVE?=
 =?utf-8?B?VCtPdzNrTk9pVkVwK3VOUm9XRUNhWmhuU24yRHAwc1hoNzFOVmZJNGxIRDQw?=
 =?utf-8?B?MWVpeVBia0d6S2h1cjF6UUZQUFJFRTlXRHZMWkwvS0NUbURoWHBHcXZYSGh2?=
 =?utf-8?B?SDNYY0hWRHkrdU1HQWVMZmgzeEs5Q1VwNUJFaVJpVDlYR3lIbnU5bkl0enV1?=
 =?utf-8?B?K3JOMDk5TzdVRDZLWGpRbE5MYzI1WWdmMHg4T3RWanR4QVZ5NEorc3FmN1NM?=
 =?utf-8?B?cmp0VnNIemwwaC9jZ2xUVjNLMUVwYVJJQ3Z6RmEvR202WlRETkFoMTlQNkRB?=
 =?utf-8?B?bVR0RmJPRFJ5Zlp5bE5XVnBwVkhWOS9xemcrRmRlbW5UY2JnQ1NZNW1kYk9V?=
 =?utf-8?B?c0lrQWdqeFRpdXAwWC9oWllnNlYvOTJWcXJFaUd5VGN6RHVlWWhXTmxCWnhY?=
 =?utf-8?B?Tis2ZzFJME53MDgwQ1B0amc2L1BQOFB5Y1lpWTJNbjVSTlZlTjM1UHpZakZN?=
 =?utf-8?B?ejdFRVR4SVJRNG0rRjA2TDJMUzEzdE4xdllCR2VwK2ZIWkJQTjNJZnQ0Mmtz?=
 =?utf-8?B?SHdyQUpVU2tpWEhIRDV6SnVTeFo2OWF5K1N6cnN5bmtNSzhnam1Nc0lzRVdQ?=
 =?utf-8?B?WVVJSytodTFvQnE4RlYxUW8wZzJ5eGJWVzdjUWFYTTRyUThZUmYxVnhXMnNX?=
 =?utf-8?B?M1BhZHBPUTJYbCs4QjB6N2dBRWlqZFVpRnhlUkk4bVZNc0phOGl3T0srQ2pS?=
 =?utf-8?B?ZzlvekdFd3gwSWpmN3VQY242b1hoWnlxbXB4SFh6aUtiaVZTcHEzQTBXRTJ6?=
 =?utf-8?B?a0JKcmJiVU9NUmVYT1krdERpTGRLc3lJRWZ1OC95bFBLdW1nRU5MbFlXMDlP?=
 =?utf-8?B?cnlOakRpNEFZQUZaTG9OV3lMcDRDSWI3MXFLeGtHQkNTbytQSjJ2dFhlOHdn?=
 =?utf-8?B?UXZGY3lzVnRaVi9JZUFMajRxR0VSVE9ONksybXlBVVF1b1RiTXBONnA3RXg2?=
 =?utf-8?Q?r6XABNRAj0Q2rqjnm5x3jFWhqm6tSfklzVrQ7PG?=
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 337303d7-58dc-43cb-5127-08dd80d5e280
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2025 13:10:27.4977 (UTC)
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



On 21-04-2025 06:38 pm, Aditya Garg wrote:
> 
> 
> On 21-04-2025 06:37 pm, Alyssa Rosenzweig wrote:
>>> On 21-04-2025 05:35 pm, Alyssa Rosenzweig wrote:
>>>>> Can I have a feedback from some DRM maintainer on this? AFAIK merge window is over for some time now. It's been more than a week and last time when I submitted, it just stayed in the mailing list without any feedback.
>>>>
>>>> DRM hides the merge window from committers so that's not super relevant.
>>>>
>>>> I am a DRM committer and can pick this up if necessary but it's not
>>>> clear to me what's going thru with DRM vs elsewhere.
>>>
>>> All the three patches are intended to go through DRM. IIRC Petr, the vsprintf maintainers had requested for that to be done.
>>>
>>> The relevant patches have been Reviewed-by Petr as well.
>>
>> OK, will queue this today.
> 
> Thanks!
> 
> Also, Petr has requested them to be backported for 6.15

To be more clear, he does not have objection for backporting to 6.15. Although its your call. 

