Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DF9DA9F19E
	for <lists+dri-devel@lfdr.de>; Mon, 28 Apr 2025 15:03:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C4F010E4C8;
	Mon, 28 Apr 2025 13:03:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="HahQqwvc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MA0PR01CU012.outbound.protection.outlook.com
 (mail-southindiaazolkn19011039.outbound.protection.outlook.com
 [52.103.67.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96A0810E4D7
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Apr 2025 13:03:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZMAnWuDUdNoB1VUanRKxSxMb1+spHww0JMdoEuIcUd9vXnWMgj072MvIf2gocd+sifYOQWKy+DwB9B2wThIxl8dfd/+l17y2LOocf/BgVhTuULj6NdWrTKy44EvsONGtJ9j2wtfkYUO2OXnW8E/yqLCLFY9Ik+YO+pch9fYrwWnFSkcDxziepcjnvgHsXZYAE25hay+0TOvi9Cvb63pe5xGdEqlobSGY/0IJ71T268aPs1fmpf7X0fu8bBf8xoudYCiXm+NpK7GlSuGDilVGU/JQwJtEx33OOlnCES342SM1gSKI1jnlhf1XUXsSZyXchQFcyq7wdgPpNlQAdG6O8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gv135DMHD8i6DMg5OXsDxvcEzloffMSIwhmTYUZtDcs=;
 b=QJiOgNbbXwrTIJzr0qOPc4S4oJllNAs0hBbXFrbGk23uUbeySoxoaN32H28r1UqtdfDZR5Qau4uaufwY9PJC1328L2zhmzz1fAi82fBKeluqmXokRmFQVgdI0v2sVn2oK8FDouL8vsNsbVRzkDnnFsr4kSoLK2g/8q8J8VKHOVzKeENT5XxFv0+azeQ98it8xgriiQa2lNEV1062NQqXodfdS6QyWMNEReWqdwyeZ/b2DSW+EY+Spe3Fn8ADlnOkYVoNYPqBe4WGSpufqsFPskvcEJkvGOKCfNI1HDbSHKwyRiQ0FMq+C5/lsh4rziKCH2qWieIhwxsbfS3esp2b0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gv135DMHD8i6DMg5OXsDxvcEzloffMSIwhmTYUZtDcs=;
 b=HahQqwvctVRQvUXv2JNja6OK1WWf+o0+r/uLSsyROp+ae+1VFa/k9mfYCyoGFxY39PPn7vYGDqTwD9HcdnR0VHkKk1Kwk6UEjW6kfnSjHXBHJ0kKktR6V1bc3CwZrOnY/bNRQr5I0r3EQIKp1v12MiB0At44/iOqD5j095nj0Ca0iAlDxaJThLst4EY5aZiG3qZ/i+78sRFT47QztoE71zGsFf2j8g0DZy0oyeyTTkLrCvUG/IUe/Rwl3pI10xyrlj7QMhmgg167hu1WcL0TkSXnQUIFHqJFDGey/1jEQ1W/reSx6ADLg2Jrn2cSorXOG1cNDE9lRd7X6yuKmgjwWg==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by PN3PR01MB7078.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:ad::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Mon, 28 Apr
 2025 13:02:53 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%5]) with mapi id 15.20.8678.028; Mon, 28 Apr 2025
 13:02:53 +0000
Message-ID: <PN3PR01MB959730DE0A0FF281A0DC12FCB8812@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Date: Mon, 28 Apr 2025 18:32:48 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] vsprintf: Use %p4chR instead of %p4cn for reading data in
 reversed host ordering
To: Petr Mladek <pmladek@suse.com>, alyssa@rosenzweig.io,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Sven Peter <sven@svenpeter.dev>, Thomas Zimmermann <tzimmermann@suse.de>,
 Aun-Ali Zaidi <admin@kodeit.net>, Maxime Ripard <mripard@kernel.org>,
 airlied@redhat.com, Simona Vetter <simona@ffwll.ch>,
 Steven Rostedt <rostedt@goodmis.org>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Jonathan Corbet <corbet@lwn.net>, Andrew Morton <akpm@linux-foundation.org>,
 apw@canonical.com, joe@perches.com, dwaipayanray1@gmail.com,
 lukas.bulwahn@gmail.com, Kees Cook <kees@kernel.org>, tamird@gmail.com
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 Hector Martin <marcan@marcan.st>,
 Asahi Linux Mailing List <asahi@lists.linux.dev>,
 Geert Uytterhoeven <geert@linux-m68k.org>
References: <20250428123132.578771-1-pmladek@suse.com>
Content-Language: en-US
From: Aditya Garg <gargaditya08@live.com>
In-Reply-To: <20250428123132.578771-1-pmladek@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0049.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:98::12) To PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:f7::14)
X-Microsoft-Original-Message-ID: <a93b8f18-e60e-4dfd-90dd-97a59584dc7e@live.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3PR01MB9597:EE_|PN3PR01MB7078:EE_
X-MS-Office365-Filtering-Correlation-Id: 0bb61416-e059-44c8-f231-08dd8654fcf9
X-MS-Exchange-SLBlob-MailProps: /UmSaZDmfYAf5TnZFQyEFYQ62+HWCaboeO3Oz2wqxcd0SvnbbjzbgGzZcpchEU/84xFkFsy2qicU6sK96xRa0QX5h2vRLKFqgt1aefA1OgfgIS0Y5L3fJTUFlSEUdfY9E+rpJJpdTTnt8aSH6v6wYaZrFQkEjVEEKgQDILLyIKGcGfBerizFFvYrkXepOB/5kship4X64bSzqlBjqa/s2bVRB2b6KKerz7eKF4blNzRt9whTiryRvGBhHdmtE4ICYwEBtAFBzIUoFq6B4d21wLU84N+kKYNaLe74KTqqZY8IOj8g3oLrM0vIs3/ZFpwjrZBafIVmUFfCXoIHbVtC2KqQeza6YSJNF4QzhwdR9EbKt3iKpK/Qcoy+b0BcuuTLYkBUbHFnsd5RcWKIifMddZL/suESbakCBeql62GVjO3Fo5sPyYGWJJcuwMibx3N+C5bVcwZv8OK7U2kgTrkUAZ52tMJFJAGYoGVC4DtGZJs3NzbXNRqezYIkjTE7dpMpD8Llsu+2AGJjOIkNsuaRUu1++zT794ovrD4K/g3oF7OHt5uM0gzHDkHyvrGIcGmN3hecKwms0PROGUBEScvQZnjpsob0wYCvN7mw6v3RQ1/4LRSv4NaDfYs54dq0eFlzDEL7DkltGQAPZI7dJ9xYyWU3OY1HGeFtu4n2SnAPnkYR0jdoBlFJjB4Jn6SfzW3MZOw/fHjZLDyM9hW9uIARZ+iNwWgix8qrYhezLXfZ3NiezxuKw2Z60PEZsOtq3rsykALFEH2eshe/zrROM+/65qyz71S7gbKw2Ue4KdqJn9DnQlSMLeLjMFiJLsGyjiv4cyk3/o+r9/XgvFn4vWhKKg==
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|461199028|19110799003|8060799006|6090799003|5072599009|15080799006|7092599003|10035399004|4302099013|440099028|3412199025|1602099012;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QzBkRCttRzJPYUNMQmpJdW15M09Tc1U3SWNTUUxWUXdQYWpLeFpvdmM4cWFX?=
 =?utf-8?B?ZG1ZY1pFOTdDRDY3UW8zc253cHNOUEpmSExFRXJJdVM5RzdVWmFZUmJTYUpN?=
 =?utf-8?B?blhJSElMVFNLS2JvR012ZVFrV3IzdVk2alV3UUtsTUNIOXB0WHJRTXBseTJY?=
 =?utf-8?B?aExCUm1ycVMvOCtOdFV4bDRUUE9mV2Q1ektkWXV6TGU2MW9RWkl6ZTNibEpk?=
 =?utf-8?B?RUI2VUI0SFo1UGp6TDRtNDhCb2d5Wll0eVh3ZkVtSzFtNy80QjMrcHV0QURO?=
 =?utf-8?B?OWc5R1J6d1dsRXYrcWl3RDh6RXdhNmkyWENEbGRFYUpUSWNlaDhERHBwcld4?=
 =?utf-8?B?a0cvUWhUa1hxNlhITThicFJUVExlVnluekhnRVFKZzBsb3RPdTlxV1UyU01h?=
 =?utf-8?B?RzE4WTFVNCtsSkNjUXNSbWZOdzRQMmovcHUzcU5ibHd3ZDNSU01sbUFHbEtk?=
 =?utf-8?B?by9XaCswekVVcFI2QklON05XVStLZDArRUd6dlVMNURVazVxTnNoakhZV3dz?=
 =?utf-8?B?Mmc5NzN4dW4vdVp0a09PbGFBZWpxMDZrVDhzcGNwMHR2dS9XUHZLL2xFRlV5?=
 =?utf-8?B?VWk0MmN6czdtdXgwTFNGVlZ2ZlYyc2puV0pvZFp4WU5OL3dhMnhCQlR3TWxw?=
 =?utf-8?B?ZGxUNVFKR3hSS1hZbStESmM4MkxmeXdBUjAxbWN0NnJvMTE5V1BWR0ZLZmJY?=
 =?utf-8?B?QWVtd0xwNE5DMEl3MWJlaEdoS0R5THNJTUtPM0VybFVHK2xpZVp3RkZFc1Jz?=
 =?utf-8?B?UU1YQ2cxWm1KUXRaNDVlaVBQL0VyTG12V0wwZUhvZkhvdC8xdmY3MW9kVVk1?=
 =?utf-8?B?UWN2dWdmcFdNRTdmc0pVbERoZWZIcE1LcXc2R1BVbi9PTlNUS3E0amZlMmlH?=
 =?utf-8?B?OG5FbjAyQXNyeTlxRkNGUjlJVHVoR3U2QlV0VDVvbjBCbHZxZjQyd1V6eXpK?=
 =?utf-8?B?N0pqdzMxSmd5TnU3WjN6WERmaW1CRU5WKzQwM1AwcmdmMXFBTTROTHRxUnRK?=
 =?utf-8?B?WFdPMTVpbGFKbkc3VUNXdEM3Ry90ZGpBZGpZV0Zka1JyMEJLTm9jWWdwK3Zo?=
 =?utf-8?B?aGYvV3U2aGQ2USt0ZUdpTnp6blRlZFMwRkpaUDQzMGswTDNLOVloU21OVE5x?=
 =?utf-8?B?ZmxMT05pQ1hOVXd4SnF5djVISWQ5VlMvRDd2ajJtczlpZGltT1RHWG1YUGhq?=
 =?utf-8?B?Q3Iyc3U4dG5yNUkxcHRtRUJwdnBHc3N2ZHc2QnJZcXVaTy8rZHl0ajNYMUJi?=
 =?utf-8?B?aGZQQkFZODFQUlFWOUlVc0FIekladDkraTNnM2ZyNnJ0TlJHZ1pyMmFoTEl4?=
 =?utf-8?B?ZU9NclpKZkluWkdxMk11VDJNa3MrdmltdElDNTFBdFZMTU1VOCt2QkcwWDVv?=
 =?utf-8?B?NWh1RWh3UXp6dnFXSnlCYlNxR2M5TVZzSlJhb0pLL25LVlFHRDV6T1R2ZzZL?=
 =?utf-8?B?eWphcGRIK3JkcXVCYXJ4YjRSWkpUSVliYkF5S3hYbXhSQkw0MVI5TUQ2NWRO?=
 =?utf-8?B?N3FRdjRiaXM2YitoL2Y3TGxkcHRGSEQyM2Jjb3RjVDRSTHRPeW9XT3V2VG1m?=
 =?utf-8?B?Sk1sUlNMUjd6ZjZDemIzMFNFU0VDL0xaako5U3dsNWVsTitPNjI5QlIxMGFT?=
 =?utf-8?B?eno1aG9sSWYwUlZYbnFoNGRTQjNxTlJGMkg4TTE4NDI2MmJ5MEcxa0pzNS9C?=
 =?utf-8?B?K0dUckQ3eEJrWGpKUWd3Wk16d3FWTzF3dGJJRVlNRUNscEhnVkJVUnBVVzRr?=
 =?utf-8?Q?wn6P0NkCkgfJN5iXB4=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UjRBYnlTTGVjTjRwekNkM3JDWjY0RThGNHJWcjQwdEFlNnlmbFVKL0RhNE5k?=
 =?utf-8?B?UjFRcUhkd1FnWFo3WmNFM2Rka1crbkt0UmY2aGdtK0V3NFpyNEI1VmYxYmx2?=
 =?utf-8?B?MDduQjRBcnNRM2ZXN214Y0Fqa0h4NmZLL2ZFa1JMNUROcEFQZXVrbVMraFZB?=
 =?utf-8?B?RktCMk84YXE2QUk1WXBPYkl2Nlk2bTA2VE1oSERGKzdHZFhMWEZPUDdiclhC?=
 =?utf-8?B?NzlUaEU1THVRQytVSkxGNnczK2hLQ0txVzd2YmNtY2thcVh4OU4rZkJwVG5j?=
 =?utf-8?B?QjB0Q0Q0ZVAvSDFSNHlxRkFGM1hmbElIUlB1ejliejlNcEZZSzI0Tk5KaThW?=
 =?utf-8?B?NHk1MWtKbDd5ZDRYeVdSTXNNemNVK2tyTUF4TXowOXYvUW80aGNvaVlqU3p0?=
 =?utf-8?B?aHFwNkJFNTJhY0JqK1hQWisrYzhhb0NpY21FYU5Dams0UmI1ZVJJVTdqckpx?=
 =?utf-8?B?RGJJQ1I5OXVabEJ4K2hrVlNZOUVzeG9hZnZPOUw1cXpOL2dEdk5ld0p2TmlQ?=
 =?utf-8?B?Y0lDOGp5UThQeEgycVNTT1ZMdnhLeGFmM2E1Z2NncVdRZ293Y3d2NEU0MlNi?=
 =?utf-8?B?V0M1ckFuaTd5Ykxha3VvcmN3Y2dqTVV4WUZGMnhXNkNndjQ5Sk5qSEJGRGVk?=
 =?utf-8?B?a3VPUlk4T0ZxakxzMUFPZkJlOXdMVmFmV2pzNXFKNU9YQVg5QXlZQjBEWmJy?=
 =?utf-8?B?ZVFOT3pMcXlPdEROQjhFVzlHT01nMXR3Sm9Fcm5EUnZ1dmJtRzBjQ0xMZUsz?=
 =?utf-8?B?dTNSZFNXOXFWcEQrY2xyQk5vQ0FTVnBwYkpIai9LNy82UloxVVl4OXNSQTZv?=
 =?utf-8?B?SDduai93RFpJWG41SWR5R1ZMRkl6VmF5UVZ3U0RyRGUzRHFMMVpoSjZJUHpD?=
 =?utf-8?B?REY4UERMK2o3WENaUTJicldjMkNta2VCdDdnd0VqYlRRWmdIVnNWeU5zZnJY?=
 =?utf-8?B?WWkyQnJtTlh4OGdMYW1wSlRjLzRKQi9xaDUyeEZHaFBlZ3RabitGMFNOckww?=
 =?utf-8?B?S3pzQlR4Z2pTUVFwSjBjT3F2a3pDdWYxWFVlcitnMmF4ZjFTWktqZVRhUUZD?=
 =?utf-8?B?WlM1dXR4cEpOY3Z3TGlqdE9qZTRBNzVGRXVWN0R1eXA3czBBbFJlQmZNWlJF?=
 =?utf-8?B?VGJGb2lIaTVMMGVubVU1d1YvUDBIR0ZGYUw2TlZHWWV5bVFaTWFSMlhnOC90?=
 =?utf-8?B?WSthNDFiZzdBOUNwdnhBSmhyRGdUbFZGK0JDTUV2Yy9TVkpKZDVOeUV6WWFW?=
 =?utf-8?B?U2NLbkx6c1lnZDBzM1BXRklxUEdhOVlXRXgxWG14Z2h3SjMrcUVKV1dJU09F?=
 =?utf-8?B?VWl1RUxwZGhxTWxoenhNc0ljSU5IMXJHdnM1RyttVExtVkluOTR5Um1FWFRN?=
 =?utf-8?B?ejJuZHB0amRZNmdSQ1FjaWIvUllHcnpGSVpGWlJFdWZpd1JlL2t6cHNvcy9m?=
 =?utf-8?B?VFNIUEpMVzRPdFNMbkxBbkJrREJMbnZzdEdHajFtRmI4WTlQNDFrVk9jQUoz?=
 =?utf-8?B?VCtTT2c3Z0NiMkdFaytSck1OZmdTVXk1VUVoREtwYmtQc0k2N1ZxVTY0NkZJ?=
 =?utf-8?B?cHdvc2tpZzlJNjQ3aFdnekJjcitNRmZkVkg1M2JqcnFwT2diNzFQcDEyMFRL?=
 =?utf-8?B?SmVpOGwzT2xKeTZCbzhVb3hnWUJKYjN3TU9OUFozN1hFWDE0UTlBcnVsdVYx?=
 =?utf-8?B?ZXVDckFEVVRBZ2l2bzVwaFBqUWFubllwYzVyZWdKVWtNaENWMEQ0RzdTakhx?=
 =?utf-8?Q?vj4y1FXGtvuqzGWVPdqh5ljRxcqecwpJH4Jhb/j?=
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bb61416-e059-44c8-f231-08dd8654fcf9
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2025 13:02:53.8399 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3PR01MB7078
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



On 28-04-2025 06:01 pm, Petr Mladek wrote:
> The generic FourCC format always prints the data using the big endian
> order. It is generic because it allows to read the data using a custom
> ordering.
> 
> The current code uses "n" for reading data in the reverse host ordering.
> It makes the 4 variants [hnbl] consistent with the generic printing
> of IPv4 addresses.
> 
> Unfortunately, it creates confusion on big endian systems. For example,
> it shows the data &(u32)0x67503030 as
> 
> 	%p4cn	00Pg (0x30305067)
> 
> But people expect that the ordering stays the same. The network ordering
> is a big-endian ordering.
> 
> The problem is that the semantic is not the same. The modifiers affect
> the output ordering of IPv4 addresses while they affect the reading order
> in case of FourCC code.
> 
> Avoid the confusion by replacing the "n" modifier with "hR", aka
> reverse host ordering. It is inspired by the existing %p[mM]R printf
> format.
> 
> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Closes: https://lore.kernel.org/r/CAMuHMdV9tX=TG7E_CrSF=2PY206tXf+_yYRuacG48EWEtJLo-Q@mail.gmail.com
> Signed-off-by: Petr Mladek <pmladek@suse.com>

Reviewed-by: Aditya Garg <gargaditya08@live.com>

> ---
> Hi,
> 
> I am sending this as a proper patch. It would be nice to queue it
> together with the other patches adding the generic printf modifiers.
