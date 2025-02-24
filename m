Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC6C3A4218D
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2025 14:44:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EDBD10E54D;
	Mon, 24 Feb 2025 13:42:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="hIvmKHUv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MA0PR01CU009.outbound.protection.outlook.com
 (mail-southindiaazolkn19010009.outbound.protection.outlook.com [52.103.67.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F013C10E1FC
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2025 10:32:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sdhpVT26S7HpZBWBwbdqm6JldCNOyd3yPDJd7ZAPKaJeHCzDp/hl6moPZUeVSQVMp/+ZIcRbjLkPl2Cf30BayLR/mMOgzpweMcJhLmgnjSmQgOayeohvM8J2NxCw1aosuJQkIT9upNjejK7V++F8rwhwCZpzS0+ajATJJrDxE4B9xsGXYTNaF7JFFEYejnBev3rrGzCp8dsWPGZcn2qYul2YUj3cCNqnxnfn+qTTwPpI6pd4prBHOk8kXjfNNr9c0VNPzt83oI0lBmPFC1oVIF6//G42tTNfdp6Qd9ppXVImTzAGbHdU4eUu4O/1gQdZtzodPhYKstIzicBm8LFDsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4pYnDMXDVJhP1JsGg02VfDMRqDhsQfKf6OpwSotOXvk=;
 b=cSCVW8fMpTRVsinFg9WqmdpEJxfEd6I17CqFWNO2MjIiBoFO85OzLXoOYkrSzlyV9X9+Z6U76RIippQc66YHiUA2e+GiAh+Km8u+o6M3kAcsXuOCPbbODvtny55joyh7kwfTNwtAGkwt0jmK4uKmN1UsHEL8s7Srs8M52OTBBpqpUhMN0xAaDxFZhUUxNX+OP5lbeQkJEU/JkRErfF0g5sUkgNTYzzEVUvWv1UlPh02eHFiNHxmz/7QBL6kHatSZ/5jtKRffl2IZ8otrmFW9bH3kLk+OSrg9ExzJa22mPu58WkEhI9HuM7eHudpN5CS4UO0X2KlQkcyabOdH2pJi8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4pYnDMXDVJhP1JsGg02VfDMRqDhsQfKf6OpwSotOXvk=;
 b=hIvmKHUvochkOJiY2Y+DydEExXWLj5LoqM165Nbg+3Ymzmd0lztuOdqiYDqgttFTtnGJPVWf7AY3gIRTINf3qu1mStyLOn9YWnU+SfiFLREc4AxAN02U7m4j7t4dDWTz+onaZzm0pBnhSLts9QSatRtfMYSPIv5DoYVPoEmn5TEXGcuIa3IbLNpVbEP8+4VIIkSqRCNbWpm9r8POpZrlZF59nnFrHMXjb1uhNq03zGnN0Ui7Lq15OhNUOtx1OjKWL+ngD3UoXV4ei2m6vusPnegwfspKqnNFiw3FoqMwcr8qRb8FwkpqM5J2FZIA+RHj2RHcXse0buJg6bwlFJ6FQA==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by MA0PR01MB7145.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:31::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Mon, 24 Feb
 2025 10:32:27 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%7]) with mapi id 15.20.8466.016; Mon, 24 Feb 2025
 10:32:27 +0000
From: Aditya Garg <gargaditya08@live.com>
To: "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>
CC: "pmladek@suse.com" <pmladek@suse.com>, "rostedt@goodmis.org"
 <rostedt@goodmis.org>, "linux@rasmusvillemoes.dk" <linux@rasmusvillemoes.dk>, 
 "senozhatsky@chromium.org" <senozhatsky@chromium.org>, "corbet@lwn.net"
 <corbet@lwn.net>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "mripard@kernel.org"
 <mripard@kernel.org>, "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "airlied@gmail.com" <airlied@gmail.com>, "simona@ffwll.ch" <simona@ffwll.ch>, 
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "apw@canonical.com"
 <apw@canonical.com>, "joe@perches.com" <joe@perches.com>,
 "dwaipayanray1@gmail.com" <dwaipayanray1@gmail.com>,
 "lukas.bulwahn@gmail.com" <lukas.bulwahn@gmail.com>,
 "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>, "kekrby@gmail.com"
 <kekrby@gmail.com>, "admin@kodeit.net" <admin@kodeit.net>, Orlando
 Chamberlain <orlandoch.dev@gmail.com>, "evepolonium@gmail.com"
 <evepolonium@gmail.com>, "linux-doc@vger.kernel.org"
 <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-media@vger.kernel.org"
 <linux-media@vger.kernel.org>, "linaro-mm-sig@lists.linaro.org"
 <linaro-mm-sig@lists.linaro.org>, Hector Martin <marcan@marcan.st>,
 "linux@armlinux.org.uk" <linux@armlinux.org.uk>, "asahi@lists.linux.dev"
 <asahi@lists.linux.dev>, Sven Peter <sven@svenpeter.dev>, Janne Grunau
 <j@jannau.net>
Subject: Re: [PATCH v2 2/3] lib/vsprintf: Add support for generic FOURCCs by
 extending %p4cc
Thread-Topic: [PATCH v2 2/3] lib/vsprintf: Add support for generic FOURCCs by
 extending %p4cc
Thread-Index: AQHbg7X/VQv9Od0O+UavMLVdMg72b7NTekUAgALDg4CAAAXIWoAAAXgAgAACWAU=
Date: Mon, 24 Feb 2025 10:32:27 +0000
Message-ID: <PN3PR01MB9597FA2077E6FD498E8CDDD9B8C02@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
References: <716BCB0A-785B-463A-86C2-94BD66D5D22E@live.com>
 <C66F35BB-2ECC-4DB8-8154-DEC5177967ED@live.com>
 <6CB20172-906F-4D13-B5E4-100A9CF74F02@live.com>
 <Z7xCr4iPmIkPoWGC@smile.fi.intel.com>
 <PN3PR01MB9597CF2907CBBD6ED43D5E62B8C02@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <Z7xIxFT-eB_OTGzm@smile.fi.intel.com>
In-Reply-To: <Z7xIxFT-eB_OTGzm@smile.fi.intel.com>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3PR01MB9597:EE_|MA0PR01MB7145:EE_
x-ms-office365-filtering-correlation-id: f1cb9f84-da28-4955-f489-08dd54be88f9
x-microsoft-antispam: BCL:0;
 ARA:14566002|15080799006|6072599003|7092599003|461199028|19110799003|8062599003|8060799006|102099032|1602099012|3412199025|440099028|10035399004|4302099013;
x-microsoft-antispam-message-info: =?utf-8?B?MVBxTk9nMGc4MGcwN2FoU2NxWFFIbnVzTlpWNWF3NVBMSnBUR1VKQ2l4WFFM?=
 =?utf-8?B?TFBiQjQvNHZlWFFnNEl6S0ttbWpCMG9KK2lma201T3FTSmlxbkYrdDVodWgv?=
 =?utf-8?B?NXBRUjFOVko4djZMNDd5SnlWckFHUVljNTc1dUV5RTJvZ3hmblBleWJBTWpS?=
 =?utf-8?B?QWticS9ma090Rm5sTE9oWFliSnFvcVRRK2FhUDBhVk5nV0M4TUNzbXhkallp?=
 =?utf-8?B?R0c5MlJuS2Iya2ZQUldsaGdpcldyR3R5SjdCTXFlbE01R0xLbEF6YldzRnpC?=
 =?utf-8?B?a1FGNUo4Y1lFTU1OWlQ4azZRNzhaRkluZFlvYlpyam1qZkp5QlRnNU9TYmFV?=
 =?utf-8?B?bXN0WnllQjNmdUdjTmhJZnFGNER2UzBjeFppRFZMVGVxQ3FraW9rbXhod2Na?=
 =?utf-8?B?dnhCNyt2Y05KeWNmdWZ6T0hPa0dxVkRRUXg3cC9JMlpQNGZpQ09SL1FwYkpW?=
 =?utf-8?B?N1Q5Y0RrYlROYTNMUnNFOWwxRzh3ZGZ4V3RMMTdCc215VWV2eUcvVU5GcXZ5?=
 =?utf-8?B?MEhyckEvbkNIQmtrWWU0MldTN1JtbXlYcXFteWhGdTNiNlkvSysxZisrQXBa?=
 =?utf-8?B?c0JkT0NEeGFkTEU4d280cjJqcEpBSENCL2lvWGlyeE5JS0VOTEZXMmRvTW9p?=
 =?utf-8?B?ZUNhbnJ3Rk9oNkkrbVJRSk9DOHhwVTMzVmc1TnVJRjE1N0dOUzZnaGUvb1hw?=
 =?utf-8?B?ZkhZYzNWSVpsZkgxWTJsTzNLYThxU1R0Vm5FWFVnSHZ4RXEwb0R1VlhDa0ZD?=
 =?utf-8?B?Y0NGRmRLYTh1WmtCbXE1ajkrbVdQNFV5bWNQaTZHZGowVHVwVHBXTHhaRi9Q?=
 =?utf-8?B?U1AxT1NucEdyNEpPb29ralBpWjB5WkMzTUQ2TTIrWkw0QkRYSWw5eGhDa28z?=
 =?utf-8?B?RXlGM0Q4dkpCUkRCS3V4MW9JdTFRUWpRVTNzOVIyVjU3am1QeTdlTG5paXFr?=
 =?utf-8?B?Z0N3VkVnMnlIclVHMnFieWU4djU0Y2lkbXlXdVoyWnVUcFlWb1NRWHU1VTdO?=
 =?utf-8?B?N3FzZEI0YVJGaHkyVWNFcUk5OVp3NFA1SlhJbVVndDVUaXVpaEliaUNHbUNP?=
 =?utf-8?B?aFZkWDVIQjYzbHZoVXUwdkQrcTVNN3dWaFllQWFmWGVYNmFKNDZvVkR2OTVS?=
 =?utf-8?B?b2NiSTNLQ2tMUzZaRzc4WW1Wc3B5N0pWWGd3bHgrejB5cjQvcmt2VXlsaWRr?=
 =?utf-8?B?NjlQNlpXdGxrSE1tbjJGUW03SUYxU0RyNnh0SzE4UTB2V2ZWcWZJL3F6S0JU?=
 =?utf-8?B?TFZGTFFNRVd0U2RsVFRlQmlOV2pKVVZ3V1liUHpsQitDcllXajBWNjd4ZlVz?=
 =?utf-8?B?YjMzZzVNTndUWWsvVFYxeXh6WE9YcnFEQ2FXSUpNeVRjaFd4N2NVVDdhM01Y?=
 =?utf-8?B?Z2hEemtZTkVpMHk4alA3SXh3VjlDbDU2U1NGendyMnhyTVYxT21DRkpibEhW?=
 =?utf-8?B?SUZNSlFCQ1hicVFNS01DaGFKNWRYSGJmSG0zQUIzVzA5VTNnUTZRcEE1SlVu?=
 =?utf-8?B?cnVCSzhtL2hSZlVOdmg4YWVvVVVxeFlLMGhsR1NLZTBwb21QOGp6UENST0hK?=
 =?utf-8?B?ZVBmWUdERlFjbDdzVWZzWUQzOXZvNjNEWEMwcHArdVd0b0t6b0lxeGxLb0No?=
 =?utf-8?B?NDZuQXV5WmlDOERNZnJzMXBReDV6NG52MHY4eHkxdDhLbGowMWhzOFVPZFhI?=
 =?utf-8?B?Rk9IZGlDSmw3RU53QVlNYUlxZXBnQk9hdmljZ2hkcWtweDhxVEUwNHV3PT0=?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WVhBRU1JTWRrR3laVzNiY1QwSjdyNnYwY0xCRFdiTVpNQVIzVG5ubjBpV2V6?=
 =?utf-8?B?UzRTcmJoNFFPc09pbElHbTFOTjdySkEyKzd3SnF4YUFnWnFpNjdEdXV4ZENi?=
 =?utf-8?B?QUZuU2Y0TkVGUWhlTGNRZmE5YldyREV1bm9SRkMxbzJ5cktSNndMYjJuRmxt?=
 =?utf-8?B?VmNiMk9zZEY5R0dJWFZRMUJpYTNiaWdKaUFTY2lsZXk2ZWhOZzl6RDVYSkEz?=
 =?utf-8?B?cnhlTzBOVVBoQlB2bGJuRFAyQ3loR0x1a0pPR0k2VmRYWUpOU1duUzQ4YzI2?=
 =?utf-8?B?OFlMOHBrbU1hNHRIZHNhcVZ1S3k3TW1kSkhrTHZFSm1CVjVTVzUrSU1zNGRl?=
 =?utf-8?B?dU1jUzJ5UGQxeE9mY0g2NGM1MVQzelYxVlNTTXE4S3BBdVBJbHpiQUQyQU1F?=
 =?utf-8?B?ZTRvMXdSckt0SXNUQlRPT3J5RzNyWVF4ZkQvK1I3ai9nVHhheHdxdEJ4dEpp?=
 =?utf-8?B?ayswTDVOUUxvYmo3blFUdDh5ajZkZ1BiR2xpNjZQZUdLSm9NQWFoVVdtNnlE?=
 =?utf-8?B?elR2NEVVR1ArYnAxZm9IUEtleDJCWmVycmRxYnhpdHJPeUJobS8ydWZCd3FU?=
 =?utf-8?B?UFN2R1pmaHNkOENpbHFZcXZrcTB5UldyWGNpOG9TTlpvWFAvMWFTV0pDTCtk?=
 =?utf-8?B?S0V0RngrMlRJU1p4aVNENnRHdmUwN1llcHpLK3laZmg5TkdYSzR2WUxMRllY?=
 =?utf-8?B?Nmxmd2g1bnJOMnZTVllFMXI2M0k4YStYcldrVldhNitrVlNZNkZ2T1hPYWRN?=
 =?utf-8?B?V2E2TEtVby92Qy9VMUE2cDNOdGVGcGNMSjlFTVVoU1o5bjJsSlNWU2hucU52?=
 =?utf-8?B?NDBDbzh3Y0ZaUEUwR2ZqT1d5bzBpaVFIWnB4MnVyZEVYT3REdHR3aWE5aUlu?=
 =?utf-8?B?VnV1c1J0M29YNFc4SEFFYlhzU201WlQ3ZFcrd21GTmtnOUIzRTJUSGhraVFW?=
 =?utf-8?B?ZGszTk15NXUxd1p0S0Z0WUhkRFBWN1VXUlJDcjIwZk5xQVBpWFkvS1ZJZVI3?=
 =?utf-8?B?eTBtRmtDYkZ2MlpIbFkxdkU2bGUwa0ZFbTk1dldCUHJaNVpRVjBoemdnMGhQ?=
 =?utf-8?B?b056NklMNE5nemZvZkExRjRWcG9RN2xoUko1LzdIcVYvT1pPcE5NdUR2dU50?=
 =?utf-8?B?cXhvNEtsS2tTaStmTVJyNEM1UWZaUWd6M0U4bkFFTFJ3NUgwVDJLOEZlWlV2?=
 =?utf-8?B?blU0Y0lDNkNsck9vUURQMnEzYjFJM3J6TDE3ZWJ3SDNUeDRNQmEydUh2YjFG?=
 =?utf-8?B?WSs1dlNCcDhEUXhNdnJqZnFSM0R1dkVreitrRU4vZHdGbGd6czhrUExQR3lI?=
 =?utf-8?B?RDkyZTN2aTBCaWZGWUVLYXUxOWV4NnB1MXdOZ2ZSN2ZOWFZaWGVhNTJtcmVX?=
 =?utf-8?B?UkpkTHpFQ1l4MUVWSVh2WHp0c2VuSVU1MzBGVTNkWDhtcE82bjZ4NXFEM2gw?=
 =?utf-8?B?dko3ODBGdjBvcWp3Q3NTbHY5VFYvYzRvZDkxZ1BPUGxFaDVmNk84NkRZbXFu?=
 =?utf-8?B?MXBaKzlHQ0xtaXB2N0xqMmwyS3phVWxlYWM0bXA4RFZXN3I0dzZZalNKT2RJ?=
 =?utf-8?B?Wkx2R1J1MGViUjFJbDdHRFFnazdYOWlOaXhuRnNVRHpTTDNoMjZLRTQybWVx?=
 =?utf-8?B?djFZWnNwelhnYTZiTE9JMFdFT0dzTVBjZ0o2YlJKN1NFcVVQaHpGbG03VUsw?=
 =?utf-8?B?YUZSb3MvQXQweEY4VDR5R3hiQkdHSlNKbnVsRW4xYlhYL0VYTld4V3Z6Sm90?=
 =?utf-8?Q?bcFoCrviTQI5zTGivw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: f1cb9f84-da28-4955-f489-08dd54be88f9
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2025 10:32:27.4969 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0PR01MB7145
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

DQoNCj4gT24gMjQgRmViIDIwMjUsIGF0IDM6NTTigK9QTSwgYW5kcml5LnNoZXZjaGVua29AbGlu
dXguaW50ZWwuY29tIHdyb3RlOg0KPiANCj4g77u/T24gTW9uLCBGZWIgMjQsIDIwMjUgYXQgMTA6
MTg6NDhBTSArMDAwMCwgQWRpdHlhIEdhcmcgd3JvdGU6DQo+PiANCj4+IA0KPj4+PiBPbiAyNCBG
ZWIgMjAyNSwgYXQgMzoyOOKAr1BNLCBhbmRyaXkuc2hldmNoZW5rb0BsaW51eC5pbnRlbC5jb20g
d3JvdGU6DQo+Pj4gDQo+Pj4g77u/T24gU2F0LCBGZWIgMjIsIDIwMjUgYXQgMDM6NDY6MDNQTSAr
MDAwMCwgQWRpdHlhIEdhcmcgd3JvdGU6DQo+Pj4+Pj4gT24gMjAgRmViIDIwMjUsIGF0IDEwOjA5
4oCvUE0sIEFkaXR5YSBHYXJnIDxnYXJnYWRpdHlhMDhAbGl2ZS5jb20+IHdyb3RlOg0KPj4+Pj4g
DQo+Pj4+PiAlcDRjYyBpcyBkZXNpZ25lZCBmb3IgRFJNL1Y0TDIgRk9VUkNDcyB3aXRoIHRoZWly
IHNwZWNpZmljIHF1aXJrcywgYnV0DQo+Pj4+PiBpdCdzIHVzZWZ1bCB0byBiZSBhYmxlIHRvIHBy
aW50IGdlbmVyaWMgNC1jaGFyYWN0ZXIgY29kZXMgZm9ybWF0dGVkIGFzDQo+Pj4+PiBhbiBpbnRl
Z2VyLiBFeHRlbmQgaXQgdG8gYWRkIGZvcm1hdCBzcGVjaWZpZXJzIGZvciBwcmludGluZyBnZW5l
cmljDQo+Pj4+PiAzMi1iaXQgRk9VUkNDcyB3aXRoIHZhcmlvdXMgZW5kaWFuIHNlbWFudGljczoN
Cj4+Pj4+IA0KPj4+Pj4gJXA0Y2ggICBIb3N0LWVuZGlhbg0KPj4+Pj4gJXA0Y2wgTGl0dGxlLWVu
ZGlhbg0KPj4+Pj4gJXA0Y2IgQmlnLWVuZGlhbg0KPj4+Pj4gJXA0Y3IgUmV2ZXJzZS1lbmRpYW4N
Cj4+Pj4+IA0KPj4+Pj4gVGhlIGVuZGlhbm5lc3MgZGV0ZXJtaW5lcyBob3cgYnl0ZXMgYXJlIGlu
dGVycHJldGVkIGFzIGEgdTMyLCBhbmQgdGhlDQo+Pj4+PiBGT1VSQ0MgaXMgdGhlbiBhbHdheXMg
cHJpbnRlZCBNU0J5dGUtZmlyc3QgKHRoaXMgaXMgdGhlIG9wcG9zaXRlIG9mDQo+Pj4+PiBWNEwv
RFJNIEZPVVJDQ3MpLiBUaGlzIGNvdmVycyBtb3N0IHByYWN0aWNhbCBjYXNlcywgZS5nLiAlcDRj
ciB3b3VsZA0KPj4+Pj4gYWxsb3cgcHJpbnRpbmcgTFNCeXRlLWZpcnN0IEZPVVJDQ3Mgc3RvcmVk
IGluIGhvc3QgZW5kaWFuIG9yZGVyDQo+Pj4+PiAob3RoZXIgdGhhbiB0aGUgaGV4IGZvcm0gYmVp
bmcgaW4gY2hhcmFjdGVyIG9yZGVyLCBub3QgdGhlIGludGVnZXINCj4+Pj4+IHZhbHVlKS4NCj4+
PiANCj4+PiAuLi4NCj4+PiANCj4+Pj4gQlRXLCBhZnRlciBsb29raW5nIGF0IHRoZSBjb21tZW50
cyBieSBNYXJ0aW4gWzFdLCBpdHMgYWN0dWFsbHkgYmV0dGVyIHRvIHVzZQ0KPj4+PiBleGlzdGlu
ZyBzcGVjaWZpZXJzIGZvciB0aGUgYXBwbGV0YmRybSBkcml2ZXIuICBUaGUgZHJpdmVyIG5lZWRz
IHRoZSBob3N0DQo+Pj4+IGVuZGlhbiBhcyBwcm9wb3NlZCBieSB0aGlzIHBhdGNoLCBzbyBpbnN0
ZWFkIG9mIHRoYXQsIHdlIGNhbiB1c2UgJS40cw0KPj4+IA0KPj4+IERvIHlvdSBtZWFuIHRoaXMg
cGF0Y2ggd2lsbCBub3QgYmUgbmVlZGVkPyBJZiB0aGlzIGEgY2FzZSwgdGhhdCB3b3VsZCBiZSB0
aGUNCj4+PiBiZXN0IHNvbHV0aW9uLg0KPj4gDQo+PiBJIHRlc3RlZCB3aXRoICU0cEUsIGFuZCB0
aGUgcmVzdWx0cyBhcmUgZGlmZmVyZW50IGZyb20gZXhwZWN0ZWQuIFNvIHRoaXMNCj4+IHdvdWxk
IGJlIHByZWZlcnJlZC4gS2luZGx5IHNlZSBteSBsYXRlc3QgZW1haWwgd2l0aCBhIHByb3Bvc2Vk
IHdvcmthcm91bmQgZm9yDQo+PiB0aGUgc3BhcnNlIHdhcm5pbmdzLg0KPiANCj4gJS40cyBzb3Vu
ZGVkIG9rYXksIGJ1dCAlNHBFIGlzIGFsd2F5cyBhYm91dCBlc2NhcGluZyBhbmQgdGhlIHJlc3Vs
dCBtYXkgb2NjdXB5DQo+ICU0eCBtZW1vcnkgKG9jdGFsIGVzY2FwaW5nIG9mIG5vbi1wcmludGFi
bGUgY2hhcmFjdGVycykuIE9mIGNvdXJzZSwgeW91IG1heSB2YXJ5DQo+IHRoZSBlc2NhcGluZyBj
bGFzc2VzLCBidXQgSUlSQyB0aGUgb2N0YWwgb3IgaGV4IGVzY2FwaW5nIGlzIHVuY29uZGl0aW9u
YWwuDQoNCiUuNHMgaXMgdXNlZCBmb3IgdW5zaWduZWQgaW50IGlpcmMsIGhlcmUgaXQncyBfX2xl
MzIuDQo+IA0KPj4+PiBbMV06IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FzYWhpL0U3NTNCMzkx
LUQyQ0ItNDIxMy1BRjgyLTY3OEFERDVBNzY0NEBjdXRlYml0Lm9yZy8NCj4+Pj4gDQo+Pj4+IEFs
dGVybmF0aXZlbHkgd2UgY291bGQgYWRkIGEgaG9zdCBlbmRpYW4gb25seS4gT3RoZXIgZW5kaWFu
cyBhcmUgbm90IHJlYWxseQ0KPj4+PiB1c2VkIGJ5IGFueSBkcml2ZXIgQUZBSUsuIFRoZSBob3N0
IGVuZGlhbiBpcyBiZWluZyB1c2VkIGJ5IGFwcGxldGJkcm0gYW5kDQo+Pj4+IEFzYWhpIExpbnV4
4oCZIFNNQyBkcml2ZXIgb25seS4NCj4gDQo+IC0tDQo+IFdpdGggQmVzdCBSZWdhcmRzLA0KPiBB
bmR5IFNoZXZjaGVua28NCj4gDQo+IA0K
