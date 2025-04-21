Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A804A9523B
	for <lists+dri-devel@lfdr.de>; Mon, 21 Apr 2025 15:59:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 604EF10E0B8;
	Mon, 21 Apr 2025 13:59:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="iVDVlI5h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PNZPR01CU001.outbound.protection.outlook.com
 (mail-centralindiaazolkn19011035.outbound.protection.outlook.com
 [52.103.68.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4BED10E0B8
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Apr 2025 13:59:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t4KjFIQ0yaevLevlroCgu/So2v/mxChMgHOcT7p5sGdW0EHbtSoC/celALmB6BeHTBe9YzkK7uWQfOjCBVLjR+EFPErfLaYIaUah16T8Cda+yJB8lkoX/T6jhHRlaPUSqvAkOGFwgqdaIXn//JvVWqs37GSKYDndoWBAMOJmvijL3VvzXAq9iESM46YSX0dmZyOodkVqiNwbtdl9g09KLuFysvbbCj/R17iYWgLyXizaSJzmkH6tTDExwqdpF5J4kEnVk0cO/xkb+aCTvkZ1J4Co47nA8aJPdHvaIl55sop+xltphKlq8xCf/0N/K6B4fp7RVM3g7wbRHdnWIrIxCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5edUkULIxDBGkxwPvPfNTJQzweslnoDBykoI0jgUB6A=;
 b=wbJ87LYTNKzvzmpp/dDSxyCvxgcY+Ua6CSs/xDjvMKYy7+tlQlfztbzCbdHZc0Js16op572alC9Q/QKdDx75UglzRGDgAN2ZwOAVhHjHl1UXOo5Yycx6cV5glqulnbnG7EkMTyKYU/DczjftVNZ5kG7Hw+cjBTD4Po77NMPaFaPeyt+NhjY/bA2lsEgDS8qDjP1f0M69VjrJ4Du8gVAIcYSEVAHdbbx6ZdGtYaxdVpqtGPeSjxY7xkX0B2uKwMIUdhUa7gtFppVMoy02590CYd95rrBendBJBT3rczWoCJx7ddc+QJQ/LaoC/ek+1v7wHafMUcjDRX4MpT8KxxhGGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5edUkULIxDBGkxwPvPfNTJQzweslnoDBykoI0jgUB6A=;
 b=iVDVlI5hKcbCjW1eJ2it09XE+fbzqJIytigAILvoXUjKrNsqSgm05KYdLuL6mA6IcPDvLXCHjKSD7rxMvuZMvBs13db2B/N2ztd8aUblwDBltbARn5k/xNW6bMZqfR74q4e7bTat0fRfIF+nC1SK83c2IqZ2G4P+yycmXIGP50uQCPo2k3TeE8E4bMScUD/0DD851EYCs0MfQ30wXuG/XdRE8qTxnQbU3g8tG7fYY0jEmyMoGwpXn7ZYP5xSpsap+89c4a2tP122Y3+4Md+wpsqoFYRr45y2ZwkgXSjxW13up5WD2Ofn0NYMeP5P4qKTkVIiRokC0RZj3o1aGAl+Tw==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by PN3PR01MB6998.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:a9::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Mon, 21 Apr
 2025 13:59:04 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%5]) with mapi id 15.20.8655.031; Mon, 21 Apr 2025
 13:59:04 +0000
Message-ID: <PN3PR01MB95976FC24DDF82A084079C37B8B82@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Date: Mon, 21 Apr 2025 19:28:57 +0530
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
 <PN3PR01MB95977FDD2F4DF6D9E198C516B8B82@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <PN3PR01MB95976BAC455F10F6D75B9C84B8B82@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <aAZM0svrO2MiNAdg@blossom>
 <PN3PR01MB95973648BB4FECBB2E24C5C7B8B82@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <aAZOpLeqBeeZ-4mG@blossom>
Content-Language: en-US
From: Aditya Garg <gargaditya08@live.com>
In-Reply-To: <aAZOpLeqBeeZ-4mG@blossom>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0092.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9b::10) To PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:f7::14)
X-Microsoft-Original-Message-ID: <51809c2e-736d-4546-858a-6078ce7ebf91@live.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3PR01MB9597:EE_|PN3PR01MB6998:EE_
X-MS-Office365-Filtering-Correlation-Id: 6bda6d46-05c7-4e6e-c4b6-08dd80dcacf7
X-MS-Exchange-SLBlob-MailProps: ZotS1sRCahcQE+ArvG0tWvnrRD+SDs45Lwz4YEhrXzrwhCcyc6C4psYFCUkYsRDvHKmMFnUQi6dVmRmq7Cd/5WzTCncqikzv+IHwWG7jp6v9MIW1h131Gsmqy+z7+aywjvmy0mtBqIfUA2SAEC3wFEf6PUvTMOhqZpj9vFKqSpmdXsmCKjaNFAs1HfoUhMShlg0wwE7GSkQYZkZ3CmJcK5bxwLj8PRMABopHeWAyc4uBtRi9Wtu9eE9XaBEP/OvDq0NwWiV/XXtmklH2z3SrIvG9OpmmwkFvpfg9dSg/8/PKlQN9xq9w9vRi+ikMzfpLSIP4UnbWQsHAh0aR2EXj3ZoBzfnNVRliMcRvlcYvL54ENa6DjSd1PAOL6TUiuN4ytTx+3k27VF1O7e+As5UTRbmjkPWxyZIN8hYasNGvMmfd4o3wC9ytlkBDnwot9RTAQ0VrT+98N/ILVV4bt8KUEDVmgar25MG8TmpL8cU00a1P28E+meJ08g+l8NXIDiG/l2mpdPZWTclq2feaWCmoPEu6anlrgLTpMqpROrzsuizIpOnNwKxN9eAs0Ru5Fx9k0VpMqCMOzyKx+d7mrWH++9oQAGY89+sTx0hpD2z+A5gUIZdfX+DQ6BzasfdVsCt8ojB3roQXZD6ei1RJOBDjje4L8YgKVbGh
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|6090799003|5072599009|19110799003|461199028|8060799006|15080799006|7092599003|440099028|3412199025|12091999003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cklTSWg2MGRYcmJTU1Q0eFowZkZYdnhTVVorQU1STU1zdlMxQmx5OThMaGkr?=
 =?utf-8?B?MnNLbHl4ZEtlTlIrTzNaWFE5Z2dXZ1VsNjU4S0g5Slh2MEcwdzRvTldtckRa?=
 =?utf-8?B?WWZDcU1RUG9TTUFLZmRMcnZhQ09FcjZFMHMwQWRLdTRtcFRWd09waEVTQkxF?=
 =?utf-8?B?dmN6cVpBVDl5ekJHWWxkekFUY2w3akZZTFoyeDMzYkd1ejRpb1htdWU1WFBM?=
 =?utf-8?B?SFZVOVE4Ukw0d1hlWmtpdklaZEdSNmNTQkNhOExuRVk3L09XWEZjemVmT1pl?=
 =?utf-8?B?YkNZNG5LRlNJZVVuc21wNWR5TDNqQnl5aTgxOUpON0VTN3FvVmtKOEljZWl4?=
 =?utf-8?B?UkNEZjFhbTZWSXFvWU9zU3JKMVAwNVBNNFprdk5WMTVBcURsd2NWOGlEdjhV?=
 =?utf-8?B?bnpCV2hNVFFQMEhoVURpLzRicUVSb0hpd3pDbmtDMkVHSCtmS2ZoRUZRNWxU?=
 =?utf-8?B?NkJRUGJSSEcrVlJVb2JiN2JMdjU5Mndud0hTTXFUcWxqeGVHTlpFUGRTY3kv?=
 =?utf-8?B?ZXNJaFI0eFMwb09yU3ljc21XeDdWMU85b2RpKzIxMStOUitCaWYrYXBURmFh?=
 =?utf-8?B?bElaM1lQcUJBanYwT2RnQUhITVorblZINjAxdGJKbFpUcTNXUERYa3BXOThw?=
 =?utf-8?B?U2dYWnlmSThyRnlSMTh4WlQ4WTZMUUM5VjFuVFN5U2NWWlVuUGZIUmlQaG1C?=
 =?utf-8?B?Rjl1c2pOc1hhZTdaUU4zMDh6L0ZiSzZTa0RtV1dYSDB1cm9UMjBNaG1ja1V5?=
 =?utf-8?B?RFpjbzZxSUF4ZDNmcWIyeVVDcDMyUUJWR25neGlycGxJY3lvb0ZNNWYycjNV?=
 =?utf-8?B?S2JENVJJek8vTjBVWS90dldnNEFoZFFYcGJ3SHY2MFptQXBTRThVMkhib2Jz?=
 =?utf-8?B?UCtzSmpST3NyZFlwRVBwbjREZzRjU2F2WFo0NFFWdERCV2RCbUhCUTNEM1di?=
 =?utf-8?B?S05kbldLeGluZ3VkY1VvWHJ4ak9xTTlFb1JYM2JuNFpudDhhMWNPRlJualdo?=
 =?utf-8?B?ZVlwSVpkQWtCcHlic000M3BxWTV2Z3BJai9tV3ppVy9LLzJLVGkxcmZpOXQ5?=
 =?utf-8?B?MUNXeWF5N25CNXRqQ3J5LzR2SVAwM0F6akNhMHBISjdNTktrelJNaW93aTZU?=
 =?utf-8?B?ajBVS2JYbDJUVTNzbUcxUm5aRmplelhRRFFkYjY4Rkl0eWVBV0wxS1BhQjBy?=
 =?utf-8?B?ajZKYzJtNHE2aGdLSGk4OUVhVXlKN1V3QTBsZFU5ZjROTUZubkxmVERyVHQ0?=
 =?utf-8?B?ak9kV0V6eTZ6NDVzWDUyN1dzczNkMTFRNHdVdDNmSHdJampCSnFabnErOVRB?=
 =?utf-8?B?Zi91NXAweklLT0U2TFplSGlpVCt5dWlWVXJ0OFk1eHFhRk1zYmtuZkpKdFRE?=
 =?utf-8?B?SEdIbVdHZVE1Uzh5em4waHQ1VFNFZUoxdW9ZU3FER0ZSY1lod1dROW1sY0pI?=
 =?utf-8?B?RytidVBaekZmbDNINExIV2tHaXlJS2dRMnRLdlZkV3dieXo1QjQ3Z2tEMXU4?=
 =?utf-8?B?Qkhwc3RkYVFNZHJRbExzYnlwVEZQTWE0RDVZR20yNUt0QTJFL2RPR2RoVkF1?=
 =?utf-8?Q?YlvIZ6q3YhaCKAfgNaY6Vaiys=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SitDTytodVVpOFFOTERiUWY4N2hWaFlTb0diVlhuTnJpSnJwb3F1S2ZmM0gw?=
 =?utf-8?B?azNDNmFQd3JOQks0eVRLc2NFcmxyemVDQ3o5WFIzKytRTitrY2ZINHRUQ0hT?=
 =?utf-8?B?MjRkV0k5dm9uOWdJbWxoT29JUTkrbVB3QzBaVUlMNVJ3c3oxTzQrRktQL1do?=
 =?utf-8?B?ZUJtSmZQTkVVUHFLdlh5enNDY3oxK3ZvWWkyNzloUG5BSUZ0bHIvSG5FbWFS?=
 =?utf-8?B?SlNsQlpsajdiTUxSc0dWRkpSZS9GTENjQjB0V3hWS3VvZ2RxV2RCWXZXc2Mz?=
 =?utf-8?B?S0doMG9QTDBvQWRKWmZUY1ozT0p0cEYyUVQ4dGpTeVViL3h3OFZwdk0wVE1H?=
 =?utf-8?B?OXU3RjVCRy9PbDJTN1hzNDRod1hsRU14d1g0UW1Dcko5K0FzYUxHdXc0TE8r?=
 =?utf-8?B?K3cydXc0bUtyZEVRU0xSRDJKR1hXVkFuTGZoTm1CbEFuQlhtUFJ1NDR2czJS?=
 =?utf-8?B?YmVNQmZxN1RCZjAwZGFaQjZtdlhYamJ3ZldSNkNqM0FCQitpaURXeGMvYWVF?=
 =?utf-8?B?OW9PanNKVW5laXR0Qm1FSm5UekI5SlYwZGxVTTVRdzhyVDlnc3FFYXBMbENO?=
 =?utf-8?B?a3Z0SlhqWDZaNnNTUnYvVDYwMFFKeWdqNDJNNkcrQVprREN6c29TRVBHck9u?=
 =?utf-8?B?WHVEcENIbk1VbURuSVp0dHQrOSszbWNhd254ZWhHUVFBUkMyMTRFR3QxaWxX?=
 =?utf-8?B?VVgxeGs5bVZsSUhrczROdFd5RG4vb3FzalBQdk9QOUNndmtGVU4zczgvbTZt?=
 =?utf-8?B?U2ZsNGFqbHhTaDhrU05YcnRVOWtnWnVqV0JuVy9QcUtGdllMNmJESzVScWQ3?=
 =?utf-8?B?ZG01eCtYMm5sZTRuNjg0aUtwZFhHU3JVSkN2L0p0SFFLUDl2dmFKMzd2dGJO?=
 =?utf-8?B?Vm5ScUF6MGN2TWU4UHJkTWlnWFI1YXJMUTJ6WDcxbElnaEFxbGpVakdTRS9M?=
 =?utf-8?B?ZnJlUmZPLzlyUHZkQ2JOSGVvcGZiaE45NFp2Q2FKSmVWTjdwek9JZGp2Rnpm?=
 =?utf-8?B?ZnZEMDFOOHdWV2pBWkg2K1VDRTJYb2FOSFZlV3VTa29pOC9TVXhTV1VVcnMz?=
 =?utf-8?B?UWtuUzQwWlBwZjFsWHJqWGFIWGNCWktNSDEwTzkrYWZQcitQbmN1RDBkWTNa?=
 =?utf-8?B?a3pQVlZwUEV4QjJ0OFBtc2k2M1F3VU1kUFNBcHY3S3VrQkk2Q2xNenQ3VmpW?=
 =?utf-8?B?VXFsK0tGZHZROFcwVHgrOXd5YUkvRW1xTkl6UnlCd085MGpRVjNVcm5yZGdW?=
 =?utf-8?B?aVhJNStaTG1MRCtKdGZBTU5WS0owR3V6SFo4ZUQ2a09sRDRONzhJK1ZLOUUx?=
 =?utf-8?B?T1R5VzJBNVZES1FCZEdiUkRWRXdJZDNhZjdVYndNUjcxdisyWkpaT2dGWXpN?=
 =?utf-8?B?Yi9ic3VBcjVaS21OM0phM2MvQjBSZHVXdmYvdmVNMXQvNzU5MkxzV0NKczdm?=
 =?utf-8?B?RmJ1SmJVc2dwZGwrV0xBOUhhcGlFVHpkOFRET3pwdHdPYmNJMi9sSWpKWlVH?=
 =?utf-8?B?UXVUOGVvZEw3aEhIUFdVci9LQkQxYmVRNFNRWHU2LzlDN3BxeVNLTEFuS3c5?=
 =?utf-8?B?MU1PcmltR1Z1OW1yM2RyMmdtTENtVFdDRW8xUWViU0xPT3pPR25INEIzWjVo?=
 =?utf-8?B?SDhoZmZ5UGNadDd6Vzl5aHVXaG9CYUJmQUpXcE9PQ3Y0M1hFcVB4VFpmK09E?=
 =?utf-8?B?clRXeHdCblJJdlI1SlkxcHEzWFliOXVCSnpJL0FGNXIrV1YvZkZzRWVrVmlK?=
 =?utf-8?Q?Es1QLO54JTbBvIe0ACNy4rkYclxWBpxvG9/ejSW?=
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bda6d46-05c7-4e6e-c4b6-08dd80dcacf7
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2025 13:59:04.1396 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3PR01MB6998
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



On 21-04-2025 07:26 pm, Alyssa Rosenzweig wrote:
>> Any change needed or just because some other maintainer manages this? Although Tbh, I really don't care about backporting since T2 Mac users are still using patched kernels provided by us. I'd rather free my mind in getting this done.
> 
> I'm just too new to kernel to do nontrivial merges. Either I can queue
> this series to drm-misc-next today (no backport no changes) or we can
> wait for someone more experienced. Let me know which one.

Merge it to drm-misc-next. I am totally ok with that.

