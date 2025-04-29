Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C9B0AA1792
	for <lists+dri-devel@lfdr.de>; Tue, 29 Apr 2025 19:49:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EFFA10E452;
	Tue, 29 Apr 2025 17:48:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="YQGaXXl4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MA0PR01CU009.outbound.protection.outlook.com
 (mail-southindiaazolkn19010000.outbound.protection.outlook.com [52.103.67.0])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18C2D10E158
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Apr 2025 17:48:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KkuMhNJp3OoeY85AG/0azmuihPPHLC4XvG94mYVWt8EOD4Fo9FwhFJZKSMUE4EQ5SkUKMSs8vRHrXEejyBNqiSNZWqSYtFZO4qn2GrZFgp3v1e0KzO92UR+v4J0e6HZ7W4WBUT1QvL1nACFLecYTl6pSSRNBGJrKkZJWkEFfdrAtWueFFUTaPPqvCCfAsGRb3k2v2lZxN+dXCeGmQaVVVQAe9cfltheh78WxiMFDgn0Qrhfh5US8y9wg6DdmUZeUIMlhPo1dMDr8RiFGqG5BNn39loH660Tl/mqIKe3x+iplDKGC/r+zPO3J/AOWFaq5NUFFTBDRJrLdvSpFrKFJPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UFeu5dHkTl5Auo0ozfMonyutG7RLs8Ncw5zCpcUMSbo=;
 b=l/w4vwFykj5GwvqGLQ3siW7Es3e8lue4qLQ16PiUq8Tu8r2CQgYZiJtqLbckh3WtVclh0pfYLM0CUzWGBnqyy9znZXeVpUYU5yNOcxVQY0G4qEWzVdnCdvYE+LE93AdjpOrwoJUuo9MUE2O36wmhjumVagoFfJuAJ9mGQgstX0jQPJUK+Gb7GiulcHGntIra/SE9K9GPw8TxDxA9P4/UoV+OxaRAOR9EVblb9LE2EDZVIrzwVS/m6EEzj6LYTqFb4kF25IY5LGoTGKPIgUII9t/X2n7xgOgN2fKIkq3fLZaKCi20lTkD+G7WSTtoUyK1gneRtwpX6lwD137jHZ7M/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UFeu5dHkTl5Auo0ozfMonyutG7RLs8Ncw5zCpcUMSbo=;
 b=YQGaXXl42ny2zeM7MWURQzLujeeLdJYJLGx5QNbyyfCzwP+LLavy6SsTGkfuAsIx8oMjfNKn8iCtdpTTsKdjX4E5zPvgp6rSltuTlJhbmNJIu0GHGPULy3cpnNOqJ2OU50apzU2PkGnoOyJjy81ViV3kgDI9l5O9NpiFiEpqnGi+y20vTg73pKXXDL6EwlUgDiNqkrEZU3B2bHpMLTWmR+A6qlc5dGefMw+i+6YE7SFXX37+etZEVGTVFQgpZNOJLpb0PNCcy6mEEYrQfRzZiXYTaQaQRX6gBRaGy2clXZqIixQ9eEsOiXxfHnXgrYDa7nyKp7Ap8nGAD39GNY5sUw==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by PNZPR01MB4493.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:1d::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Tue, 29 Apr
 2025 17:48:36 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%5]) with mapi id 15.20.8678.028; Tue, 29 Apr 2025
 17:48:36 +0000
Message-ID: <PN3PR01MB959739C774BC0CFB20B9735FB8802@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Date: Tue, 29 Apr 2025 23:18:30 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] checkpatch: remove %p4cn
To: Joe Perches <joe@perches.com>, pmladek@suse.com
Cc: admin@kodeit.net, airlied@redhat.com, akpm@linux-foundation.org,
 alyssa@rosenzweig.io, andriy.shevchenko@linux.intel.com, apw@canonical.com,
 asahi@lists.linux.dev, corbet@lwn.net, dri-devel@lists.freedesktop.org,
 dwaipayanray1@gmail.com, geert@linux-m68k.org, kees@kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux@rasmusvillemoes.dk, lukas.bulwahn@gmail.com, marcan@marcan.st,
 mripard@kernel.org, rostedt@goodmis.org, senozhatsky@chromium.org,
 simona@ffwll.ch, sven@svenpeter.dev, tamird@gmail.com, tzimmermann@suse.de
References: <20250428123132.578771-1-pmladek@suse.com>
 <PN3PR01MB95971954FC5E026C59B6F8EDB8802@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <1490923bf0b7d5e32ded1393c1f7a3e4e640de5b.camel@perches.com>
Content-Language: en-US
From: Aditya Garg <gargaditya08@live.com>
In-Reply-To: <1490923bf0b7d5e32ded1393c1f7a3e4e640de5b.camel@perches.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0213.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:ea::7) To PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:f7::14)
X-Microsoft-Original-Message-ID: <27e6d281-550f-4c67-b3c7-9d77a3295619@live.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3PR01MB9597:EE_|PNZPR01MB4493:EE_
X-MS-Office365-Filtering-Correlation-Id: f6f47ea6-41c6-4081-f6fc-08dd87461139
X-MS-Exchange-SLBlob-MailProps: bHQ38DpbEWCos0A2Q6z4vr+EGiiqRFMXUBeIlvMDCh48xmDo0UZ+v9UZgfdveNJXBfg3jwf3juqnF848cW2p4BTOfvqEOob/sU4sVsVFqUAzqIm5idVarfg91Nh7Lu78GU2S4IZEtZVxE/Q+E9PZZrVZI02rWkk5uvDyXGA7T1ee47E2jc6ZhZ6OTNuJ4xMQSnm9Rg1I+2ykZB9++eQPoLMolhCq8oGH6u2z6XpAYRiyxaUixyI7lyZJlxtm80PW4ypD9bXMlKbUCh1VQ1JCsj0Ki9D+R6f6iWrWP4vm9b5bYXYx/O/F2JlQTDGKl4DwsevCo9iPzV7kl59lYNJfgpJ+q0ehgLPG+6D1OayxjOXcuSJUcqa37gZl+2RUrF7cUsIP5fg+lUf6eMeswfVUXUdpTSRsxLxEotF7zwqCdPpALDlBCL4PJ5taHDUTg8Gpj1ZNmmZ1FH6bW6J3f8Zm/9RS4hjj8o8HrRbOZeriMHEPRjm37w/2q6G8rLHDZ9Nl3VTPgVPFZOFmEhpOD3oELTLXRh/cqsaUyvqD5B6+bP2qFGV5EBNNQXbtGpeQm+rQ+dmZmb+PT4eYQ5CKR4rNuR9m1u9WVRkhMOeQGvo8un+Vg0Sl5ilrqCyFOlmwnR588pBqaWzAsDSTwz0g92VtwxzdoBCfnw+EpTMYFP1rPhSJrIBMJ+UOKA==
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|461199028|7092599003|8060799006|15080799006|19110799003|5072599009|6090799003|3412199025|440099028;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WTdRRS81YU9KQjRZRTJ1ZWM3b0dITXJ5bnE5aTVBYkJtOXdreE9kS3ZxRXh6?=
 =?utf-8?B?Vlh2K0cyd2FPdXo2c0lEbFV4SWlscngvbWpmODdWbTNuaUwyM0NBSnM0Wk5U?=
 =?utf-8?B?MkptSUJIeW5CeEgxbUV3Qk94Q1dXcXh5N2RBRnRhN1RwOWZNa0cyVGtsRlBF?=
 =?utf-8?B?UlpCUnZXNFBsVk1jdTZkaXlqZkViTm5EUGlKWXFha1RWQ2hEbm5uL291dW1W?=
 =?utf-8?B?aHJXMERTZnVLbGdabW1lQjQ2eWZjblo2b2x0MzBULzNQUzVlRGM4NVJzaDdq?=
 =?utf-8?B?bTRXa3JVT1VJRS9wcmRSZDJ4YWNiSENHbHBkRE91RnFtcU96TlpJR0NNbVl0?=
 =?utf-8?B?bUIvYmVKY3dXbXFDL25TSGN2OUFMcVlmOGVsTjJpVEhVQ3lHNlB0ZW9rWmVk?=
 =?utf-8?B?WmRmWEZxNG12RllGbVZMOE8yRkN4cUwycWNnYkdzWFFLV1E0NmpmRXRuT0F4?=
 =?utf-8?B?ZzlWRWlKN2lWRWtZWkt0YWNjM1VicjdKNGpvSmt1cDNrem5UQjRtYUdYbUg5?=
 =?utf-8?B?ZWFQUkRsQWlXS09rYXkzSlprSEMzUkpyZE5EVDdLZTN2amd0blJMOXkzaDQw?=
 =?utf-8?B?anByNWVyRVBscjhrbVJmdXVURXYyNjZuVlh4RURYYk4xVlFGdGlSZzA5RnJW?=
 =?utf-8?B?TTh3TzBLd1QvRm1lNFc3ak9JVC9LcWFWK0lacHRMeThOWFhUVmpsZjZyMEww?=
 =?utf-8?B?cWF3Z05WK3BPc2cwQ1MwbUZad1VRRjk1VWl0VWVJQkxNNzc3cXpjQjZGMkpG?=
 =?utf-8?B?MTcvLzk1RmtQSzM5OE1OU0pkOVc1QTFLM2tRTk50UGxNaDh3Z205TFZ5MC8w?=
 =?utf-8?B?aW5DalRyR1JGSTF6bW5jSGp4eFZaaFo1TjFwUEF0aXB6dDFidjlvVG80R1Ix?=
 =?utf-8?B?dERFM3hkL2UraU0xV2x2OTFjYzhhNHJFaS9yalFyamp2N1B1b0ZVNU9abisr?=
 =?utf-8?B?NzZwNXJuRGNhTTY3Y3hyUGFvajV6V0dvdk04eUkrb3YrTUVhRkp1VzVRN3Vx?=
 =?utf-8?B?QzIwVjhpZmZ0cnMweG1HWElEeDhsMFJXeHNMMVhYTlBwL2wxcWJOaXZDUVpz?=
 =?utf-8?B?ZC9mR25sbXFOanNOaVdKQWFQbGtHcXllYmxJTC9pamg5NmYyQk9iT0RVSkNn?=
 =?utf-8?B?OU1LcEcxa2FiQm9mNUlHeHRtM0ppYStUNVFVdDVnRzY4UUFMaHZDRTFEZndL?=
 =?utf-8?B?ZVlnZDdqWklIdCtRbTc1M2V1M3NiZWNJb3cxWFBJVXVKVEdXOG01LzdGekY5?=
 =?utf-8?B?cHd1UnRvbi9qMWticTVXczVpRnJ3akZlWHIxbno3N09wWWNPQWFqOTV3TUFF?=
 =?utf-8?B?bDVhb3V4cmpTb1FXVWdUdk1mRkRmNElLTmtMSHg1eVBaVEdqMzFMMHpHTFlQ?=
 =?utf-8?B?WEIrbGIvQ1FvSkwxT0V3d2NhaEVXOWNHV2llMXNTUlkydk5zVHRjMzBkdzV6?=
 =?utf-8?B?dGVBQnJ5RHJUbTdzMHdYTUZod1dzVU5QYWIvQmdrZmtlNkkwWjY5K3U3NzFZ?=
 =?utf-8?B?UXRXRmxIOEQyN2Y2V3AzNU5vUlRaakQyNU5hSi9aQ3VnM1EwZTdIbldNOFc4?=
 =?utf-8?B?WWdWZz09?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RGRhUnV1RGE1bGVoYTlxazRPS3Y3QndzUWoyaFA5S0JBK3ZOMWNNRnJhVmQ3?=
 =?utf-8?B?eFYzejBueldsd1QzQVpnZzZ4dS9RdEV5MFF0dWw2REtLeVR6QWFPeFd6VFo2?=
 =?utf-8?B?SXZDSUZoR2hqRTFmMFgwL3dOZW5ueHJFQ1RPakdOYlZTVlg0dThNd3dTNFRz?=
 =?utf-8?B?MUNzZ0JDTDE4enQyLzNyS1BMZDFOVk8wQUE2eFpHM2N5N0pSZ2FwWXczeXlv?=
 =?utf-8?B?aUIrdVpVTnpGc3lTOTJhUTQrUUhYUTVLb1E4NzBWTjYwNDlaa2dISlo2emtz?=
 =?utf-8?B?eG51bTQ5eDNjZXRKWHJXQUNPYmtKWjJEaGdGMjQ4SjdtdlBDQm44OHljRHQ4?=
 =?utf-8?B?Y0xIZXh2dE94MEtLZlZPK3RQOGsvQ3QzVWtmUHZ3dkpSanhlMzdPM2ZEcEFQ?=
 =?utf-8?B?ak1NemZFQmF4anh4NzYxemIvTWRXM0xUM0hCbWR3MEYyZXdnZnVSbUQ5MVRI?=
 =?utf-8?B?ZTJiSHJ5bDM0SUtoNkpPeXc2ZDUrZDRTd1Jza0dUMGd5SW5IaFptRmZKS3gx?=
 =?utf-8?B?Q0JDczZsMS83Q2tqVVNnNlNiRDhpSTZrRUEyME5TOTVqVVg3ZFRLbE8xMXcy?=
 =?utf-8?B?ZFRSajdaT0tXeGFXd0d0NlZnQ0xWUVdhRnpqN25KbUcxSllpMTc3d2hIYW5t?=
 =?utf-8?B?NTNvWURjSWZ6NzdxdURPdEQvb1o4RmVIVTcvb1dUL09kT0YrRWl3T3NkUmlB?=
 =?utf-8?B?cWcvZUxNSE9qZ05pME44emZ1d2d5NjdwTW1DZWZobUgvUDJPZis4aTlQckk1?=
 =?utf-8?B?UHdjZ0VmeWV4Lzkva0FQeDF0b3dsV3ZrZ1M3VlpTY2dSWFhKa3VucHFjQitF?=
 =?utf-8?B?bEV2ckZidUlwYitkbFZodWttbVpTaTZKcjRNUlVibTlPcEpyb3FXdnFXRXdF?=
 =?utf-8?B?WHVuWDNDbUdCNjN2ZXRkWHdGYkRId3FhN2xmS1FCZURZR2czR0lYdFpxR1RX?=
 =?utf-8?B?YlJZK0oyY2F0NkZoM1NsNWNpU0cvbnBxY2FwMFh1NjVSZDN1STUzREF6NmdU?=
 =?utf-8?B?N243SUZxcklFK2pTMGxIL1dKbzVlNlBiQTJLMVBJRlpnS0l4cVgxN2VndGZV?=
 =?utf-8?B?S2xWT1BOTmFmS2xiQ3VpUGhWOGRFKzE4bElGVDlQanhoZ2hQUkw3ZFNpZkpS?=
 =?utf-8?B?YWZUbnBSaWg0Q3V4aFNaS2IyN0FZY0xHQzkvYzNaWkRVNjVVMVFXUDN4RFBp?=
 =?utf-8?B?SDRZUFl0aFYwUEp5V0ZQN2lwMkxRUDE3OGRObVVOdUg3NWF1U1ZEMGZMcUpn?=
 =?utf-8?B?cW00MS9IVWtTdmYyalB0akphMm5LTEY5REhPU1hSTXRHeFI2ZjdCUng1Uk1w?=
 =?utf-8?B?NmtFTzQ4RU5ObnpiMnhRTlVmTzdwZ0Z1d1crLzgrMkJPU2l0Ny9lK3ZjTzd0?=
 =?utf-8?B?aldWdit5R0t0dXF2bTNJSXQxM0djcUJ1Nk9mdzQxVUg0TVl4R2tnN2dKU21V?=
 =?utf-8?B?M1BRSkZPbXVDRjVwZmpuRm9mWkM2dExDUFpFYUZJYTZaOVlIcXpMdmEzWUVQ?=
 =?utf-8?B?YnpnWGhIMXUzQzA5R2pyV3FkYTZTS2UvajQwbURiTkdla3MvYnhNODM2bXBH?=
 =?utf-8?B?YWhYSXhIZ3NwWGxLWUNFcnVRZkhnTTRWL09NVFk3U0lLTVZSSzBoeDUxMUpp?=
 =?utf-8?B?L3dyZFV1cFdlQWFLcGxjK1l2WDlBY2cwdzNSOWltZStRd2ZoS2NPZGRySzVX?=
 =?utf-8?B?R0lIbHV1VWNSSHAwM0JiS0Z5MlpadmllR3NpMGFISDhPbENqVGpxMkpndjI0?=
 =?utf-8?Q?2vM5MPWdUk1PsqCrc4=3D?=
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: f6f47ea6-41c6-4081-f6fc-08dd87461139
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 17:48:36.4970 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PNZPR01MB4493
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



On 29-04-2025 11:05 pm, Joe Perches wrote:
> On Tue, 2025-04-29 at 16:07 +0000, Aditya Garg wrote:
>> %p4cn was recently removed and replaced by %p4chR in vsprintf. So,
>> remove the check for %p4cn from checkpatch.pl.
>>
>> Fixes: 37eed892cc5f ("vsprintf: Use %p4chR instead of %p4cn for reading data in reversed host ordering")
>>
>> Signed-off-by: Aditya Garg <gargaditya08@live.com>
>> ---
>>  scripts/checkpatch.pl | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
>> index 44e233b6f..f79f0a085 100755
>> --- a/scripts/checkpatch.pl
>> +++ b/scripts/checkpatch.pl
>> @@ -6891,7 +6891,7 @@ sub process {
>>  					    ($extension eq "f" &&
>>  					     defined $qualifier && $qualifier !~ /^w/) ||
>>  					    ($extension eq "4" &&
>> -					     defined $qualifier && $qualifier !~ /^c[hnlbc]/)) {
>> +					     defined $qualifier && $qualifier !~ /^c[hlbc]/)) {
> 
> Probably needs to be something like:
> 
> 					$qualifier !~ /^c(?:[hlbc]|cR)$/

 					$qualifier !~ /^c(?:[hlbc]|hR)$/
I'll send a v2
> 
>>  						$bad_specifier = $specifier;
>>  						last;
>>  					}
> 

