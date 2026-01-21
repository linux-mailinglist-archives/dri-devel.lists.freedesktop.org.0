Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +NS5FPBUcGlvXQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 05:24:16 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A995250FCE
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 05:24:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5B0A10E056;
	Wed, 21 Jan 2026 04:24:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="y71Fu6by";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011002.outbound.protection.outlook.com [52.101.62.2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E13410E056
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jan 2026 04:24:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qy/zs781lhhB6MqWwQWV2f2iLNGhdQTlfvjEl6+ZhkoXLAgypALDayTF0dLiaH5CVy2C/Xh8PkNQXnawRVs37epjABvDqN9GXTFwOZdFGypbiouMDatjSIN0RE7HhzwyfPiCqfD0xEvrYnC8oVXOkwGOU8FYjDYcs1AvOmccihJxQYioPHwOsZSvbd7DaJxhqPlZVnw9cvPClQS+uVVKGUJj+lfJdmERmr4oShXfg/iwB9N2k4QTYrdwuxiO5j0ieuBMTweZlTeX8eZuljXSbZ8mJsyWGvGJGxmEX701iTvdaNMBzO1mmdNRI89Uj2ISD3pTJcV9nVX4qTsXTqDj0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e6gblOFVQWj5JI9QCIvDaETEh10iQwqOGkgFjGODjGw=;
 b=NgrPuwY6XrktUJMez0EPIOy3WdNRNO/ROYsYz9Qprn4kve5PSFeN0r8vCudd4v11Wx7/9FJKuaoEStbjybzLYdviwdotxaGMYwWswdFnWWil1Xf+y+Kh+AJdh+5ecaPglymeUiZY9jxr092BnSOS1qRQnxEf2D8jhHXN/iXYKkZdgoyUzTYNsIsAklUkIlAQts7zMYB9N/TtSn2inE2CSnr5f1xyprswiPtTxgCJYoQ1Sji2qP9Ei2BW3ud+5hoJxorFN7RtHOxf2RkLaKKA0X7Dj4kUqT2iYvVXUxMQNt0oNci/MOcBVoFAHolBqhmovZseCCSMy4jCsk+Is6QLCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e6gblOFVQWj5JI9QCIvDaETEh10iQwqOGkgFjGODjGw=;
 b=y71Fu6byCw6L3SsUJbutGeW5oVjIHqNrNmtUTVev/FG+bA7pj/oLegS3LvxggC498nuC9zhBf3CeyYoyk2AtmAXeqVwxEMKFOj0NW9P79IXa4YgWSuw3cH1kjEOCu5A7DaFakQ9mzXFlN8hgrKpL1vSqTkwxOGxgFDxvHLse9b5JsMwv5dqyoRzBxTGE/JMBp9Y1wNJZmj3PrZTqo3PhJ+JtDE2LHPQYo5XA0jlA4Lwk1M19MvfEe0LQGPnj0MAI9aNbR5pTlF1OM/FMMJxchBLXZzsu7QiOGAhIWZi6yOBdFJvEPCYQ+FMsgNIDxS100t77zeW0s8DJQMCSyg5S5g==
Received: from DM3PPF9623118BD.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f3a) by IA3PR11MB9303.namprd11.prod.outlook.com
 (2603:10b6:208:574::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Wed, 21 Jan
 2026 04:24:07 +0000
Received: from DM3PPF9623118BD.namprd11.prod.outlook.com
 ([fe80::253c:c449:c087:43b1]) by DM3PPF9623118BD.namprd11.prod.outlook.com
 ([fe80::253c:c449:c087:43b1%2]) with mapi id 15.20.9456.008; Wed, 21 Jan 2026
 04:24:07 +0000
From: <Manikandan.M@microchip.com>
To: <Ludovic.Desroches@microchip.com>, <Dharma.B@microchip.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <Nicolas.Ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
 <claudiu.beznea@tuxon.dev>
CC: <dri-devel@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/atmel-hlcdc: don't reject the commit if the src rect
 has fractional parts
Thread-Topic: [PATCH] drm/atmel-hlcdc: don't reject the commit if the src rect
 has fractional parts
Thread-Index: AQHcio3HmpJA4R7aL0S0mLwhXSuZnQ==
Date: Wed, 21 Jan 2026 04:24:07 +0000
Message-ID: <09a41171-629d-4cb6-9ad6-f2f6b24587ed@microchip.com>
References: <20251120-lcd_scaling_fix-v1-1-5ffc98557923@microchip.com>
In-Reply-To: <20251120-lcd_scaling_fix-v1-1-5ffc98557923@microchip.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF9623118BD:EE_|IA3PR11MB9303:EE_
x-ms-office365-filtering-correlation-id: f35a5f4f-56e0-4672-6d40-08de58a4eb01
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|38070700021|921020; 
x-microsoft-antispam-message-info: =?utf-8?B?d21OeFliQ096UzV1czRkMHZyKzJFU3N4NFE0dU9TZXJ3Tmk5SWlEVnBsUG13?=
 =?utf-8?B?UzkyakkxSWtGVEhnTEJoTGtkR01QQ2tSVEdML1NJMmtCRC9sSzgvajZlTmlB?=
 =?utf-8?B?Vzl2d2t4ZU9ucjU0WnNaRE52NWovTkM0UjVqakNVQ2tnRTJpa2cwNG9WK1c2?=
 =?utf-8?B?UjlHN2ttWW5WWEMwYXlLalk2VGZWWUE0dUR1VDNaUnpvZGpXNnN4QTZrdFo5?=
 =?utf-8?B?cnlrZjNqMTZ3SEtobm1aUWxUVE9BdEgxRnRldnBUa0hmTUQvNEtLU0s0SnVs?=
 =?utf-8?B?dFVpVS9OMkMwTWhrZEFQaWhrNndscEhLWHZWNDdVQW95U0JZTXpzcFZ3U1Rr?=
 =?utf-8?B?Q0tLMmxER2xIUld5T3F3QTR6VkgrUXBRVWgzOGozeEdoLzlsQ0NOYWZMdmFk?=
 =?utf-8?B?YmJ2ei9VUStJNlpmWGp5N3NwZWoycnE5L29BOUYzYnJkN0xBM3RDekw4YWZo?=
 =?utf-8?B?SXU1cDhEaWdIUFRhMkcxcEhMMzVwdmxjQUJGaUNzaWtER2hoRHFMWUFsM1hy?=
 =?utf-8?B?N2pCRHBBaVd3NFFkekthN3MvR1JDNjRuUXhxYUwzMDJoVWw0SEI0aXFLSUhu?=
 =?utf-8?B?alozMXljYkFtRUhpWDVDaUdNRC9WNGxnSUcwWEpQd2RxbnNDSytvK240Nk5v?=
 =?utf-8?B?ZGtybC9scHFsTksxTHZNTjJrb1E2RHo3bjJQdkxNVGRjWXBKcklDMFR2M0lK?=
 =?utf-8?B?QnpYN2NpdUduUXJERWRySlBlWng3d0pPVkYwbGRCM2F5YTZGV2ppMkxpS1k1?=
 =?utf-8?B?Vm1OcGxhSFNWSmx1ZjhYdmlGK1ZRSWpKTDNacXlvTDM2NHpmQzlpVjNudlZu?=
 =?utf-8?B?YXdRUFFTOHNLVmRlTjAvSHIwbnd6ejc0K3JjVEgxOGhYYWFLSDFqSUp3NWwv?=
 =?utf-8?B?M3N5MWwxKzhqVkU1VzhzM3gvaHJIS0dYYXlkRjVYVjdISU0wT01xSFZnM0R3?=
 =?utf-8?B?d2lyMTlsZ0RIbnd3TS9HalFNNit1Tng5WVJnZ0NJVWthWVBGM2pMKzdGbm4z?=
 =?utf-8?B?T3lnc2EzaTRGa0NuN3EwYllhbkkyRml5UHlEK2xIczFhUHU0YkprbjVYYUtr?=
 =?utf-8?B?MXNTK3RycXZlcHdPQVRPemRGcVYzbVhvS1dHZzJURHYvTkZRWk0rKzlibFlh?=
 =?utf-8?B?ZENPdFJxTkhUMURkemNMb3ZYQ1lFU1VqMC9hNzY1SHg1NDBuWi9ha2tCUFJv?=
 =?utf-8?B?NXl6ZG5wRnM5aFd2OWQyY0x4WnM0ZVgxb2ZaWFJQWERCTWdUdVpUdVBrVS9U?=
 =?utf-8?B?UC9zaVNkWDFsNlNNNDJMUi9tWjl1QUhsYVZyN1FjcEJEb1pRSkdOd29aWURx?=
 =?utf-8?B?OUU1MTM2cFl2ZmRrMU1ZM2xSOVJqWFlrdnlTVzl1Rk10ekxtei9pZzZqa21B?=
 =?utf-8?B?Wm8xdU5GZlFwWTFTdmRaSWlZOUhuai9QSWdJbTk3Y3VjQUVXMXJTVW51RFpn?=
 =?utf-8?B?TlA3clNzNU1RMWhFbUtDZ2YvMUlVd0Z4YnByVFBlSytjOHNaaXBrU2hleUJj?=
 =?utf-8?B?WDVZRW1rRkc1aHdGQ0lkK25vYWtkbkJ6WVp4OURGU1ZpTlIvdmhzbVNvTHpk?=
 =?utf-8?B?RHlEdStLN2F4eFZRdS9XMDR4MXNXSG44aGlUSlRDalhKdk9rdDJkOGdJUVQ1?=
 =?utf-8?B?akhBVFAwODQ2QmFoOU92d1Q3blRxeW52RFFkdEY1a1NqUXNHeEZYMEd1bGlz?=
 =?utf-8?B?RnQ5dTJQNFNoK2NISzBTdlFyRUUxTElKZ3ZjRk9RcUpDV2lmU1lWb0dhVUNv?=
 =?utf-8?B?N3Y4eTFJMi9lQlZZaHR1NTAxNC9xa3lVbkExNDloSmxkMmg2aU90OFBxZzFs?=
 =?utf-8?B?dUFkQ3BKWHAvRXM1SlZmb09mY08rMUY0QjBtQWRpQlJYSDRnL05vVUZxSVp0?=
 =?utf-8?B?OGozTlhMNUxrdVB5MEZQZjhGZTdkSzcyUGI5TTM5Vm50K3VNTGIvSFB0VGox?=
 =?utf-8?B?V3FaRXNoY1lQK2FjaWEvbElqRW1mTUgzYVg2V0hXVTBET2padDZqZ29aWEVP?=
 =?utf-8?B?eTNtdm5NRGhxczYxVXdkYVNZS0FkV1g1L05vdUI4YWs3ekgvcndDaThTVVQ1?=
 =?utf-8?B?ZCs0N2Z2a0IyaXlWZFZ2T0JSbUkrQ25yMmJ2V2NRVm5ia2N0aE90YmJ4YjdN?=
 =?utf-8?B?RDhlK0k1TlU0TmJ4Y2o1cC85OTRRM1VTNkFIY3BFb3Q1MGh5ZzhoWXQxQThO?=
 =?utf-8?Q?Akv45Xcq6DU517Z/6utn7z63L2vmii2d/ZoMVAGFRQfq?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF9623118BD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700021)(921020);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VUp0RngrM1gyeGZwSXpIaVU1cTljUisrbHVjRm50MEdzK2pHNllMNmYzWFE2?=
 =?utf-8?B?TklSSzBwV3VYNmpTR3ZjS2lheWI5SEVhQlgvWmhXUGRjV3QrcmJJR1pFRmlN?=
 =?utf-8?B?d25INTF0dEtGK1BYWXpnRjY0U0E1SzVPZGFxN0NDSytTUFh2UXdlQlUwRmFI?=
 =?utf-8?B?VlFlVkRpa3lsNWJ2VzJsWVNqWU1KZGY3OFRXSm1TaUk5eDlzZnNNOHczd1pG?=
 =?utf-8?B?N2NRUU00dlRXK1lpdVNpR0h0OFpuVHdFaXhVcWRaV0M1b1NkZ1JZVk9lYllP?=
 =?utf-8?B?V2pNSXJkSkYraEdiN3JKMFlEYjl4N1hqeFdPdHdRK29yc1BVRENjeU9ReEFH?=
 =?utf-8?B?TWhpSmd0RXVCRnYyc2FVbGlUOHQ3V1k4WXNLR2RFR213Z29FdzJhVnMxQm80?=
 =?utf-8?B?WGRMLzNNU21RT2NDcm9ndVhQN3dLU0ZjdFBZVGtnS3l2bldIL3ZvaXJWVzdj?=
 =?utf-8?B?dWNtcytuNGd2UVJKeVc3a2h5L0ZRZFlkSERlWkFNRTNhM2lCdmp6VHowQlRi?=
 =?utf-8?B?WmVLMGwwaWJLc0pLSFo0TUwxTmhRd3V5bHF6ZWR1VWxFdTNCdG96c3YybUNa?=
 =?utf-8?B?Yk5uaU5PZWY3WkRsenIxUndoK3prTTBhWExaSjdSdW0yRTRueThlZjdONUxo?=
 =?utf-8?B?RXBnWjFBK1BZWVJ0RUtmdm41ajFaS3JxWC9GTG5rMm5sV3V3eWpWeGQ1bEt1?=
 =?utf-8?B?QVArY0s2dEYyZTdQMEFkZjhmcllWcjVMSll0VENhRWg4c3NIUjlBdFpsYlFC?=
 =?utf-8?B?TEt2Tk1DaE9zMHM1UEhtd1pyWXcrY2NralkvWGt4NCtzSUsvWWp4UlhQc3pi?=
 =?utf-8?B?bjhEVk9oUHk1Y0F5V2l1ZkVDSHc2Y3lTSmU3a2dqcDg0bFhvc0ovbk44aEhl?=
 =?utf-8?B?a2tCMHZkci9hak0xRm1XTUJ3VWNWTzdrY1BUUmRwakMrTUt1V0hNVnlMTHFr?=
 =?utf-8?B?SEcvRTFCQThESmNVQytvQkZnNThIcm9zamNUWXFPczFuYmptWjhzSmdpSkJD?=
 =?utf-8?B?aFMxRjhmb3ZtVS81M1JpUjJJZ29NK3JET2ZtV2ZTajdZZ08wSGRRUXpudGdI?=
 =?utf-8?B?WEdkUk1lQ1p6cUN4QkFtTkt6NXpmbHVHSEt5WUdjZW5tL1lzVjBmOHgvRGJS?=
 =?utf-8?B?KzhhU1Y1cVhiaG41cE9qOWJCaXQwVGp2bmNWWW1ITklIa05UOWRaRkpoS3BP?=
 =?utf-8?B?akRrb1pUeTBscm1BeCswWEhKenNQQXY1VGlxaVNCV1F2YnVOSSt0SGNyT2Vr?=
 =?utf-8?B?dVpFNm85VVpxVG9PN2RRQWtnVXAxSnpFZUdicUxkSFNHYk1IRVg2aUJrWlE4?=
 =?utf-8?B?Z1ZFWDlZY2tQOGVTa3VoTEM3M0p6dlZ0K0loQ2krem5ZaTUzQmpsOTlMMWF0?=
 =?utf-8?B?elNqWnRVZUkwVG9UUjI0enVOMFcxN2M2YmI3L0RHZ05PbkpmSW5Oay9HOTRM?=
 =?utf-8?B?eVAwY2Q4ZUYwekE1YzZERmxUaVJwZThtdE1NdHlocHFCeGUvbGk0anl2eldO?=
 =?utf-8?B?RGpDUW1YRkV5ek5tQS9WMWE4Y2pwUlRPWmYrVGNuREN4d2kzNXQzZGZHaTJX?=
 =?utf-8?B?dDBWMVBXRTJMd0N4bW8wZzNXZnZmMXBFcVR6NzA4NzkzaDlBODdGc0xHc1oz?=
 =?utf-8?B?YVpYQ1IrV3Q3ZW9MN1FPVStoZWNUWitTSzlmZk9XSU1CdHBXRmNKaTJsY2xv?=
 =?utf-8?B?REtFQlNPU0UyY0QxWmRjQ0h2T1VmMXlxSEU2L3lYVzlDK05pL1JIYjZSSUV3?=
 =?utf-8?B?TU1DeUtJZUFSNWFkN2NCQzFHY2lUN05vNHByRXlpWmlvc0QwRFhjSWQ3NTlW?=
 =?utf-8?B?Q1pKczU1RStlOFRsdytNc1JuWmNDUHR4Zm50M1ZTajNMYm1xV2M3Mm85MGRV?=
 =?utf-8?B?cUx0ZHdBb2NnMEpuMnN2NDl0bmhXdnRjSWNpSFJHb296a3ZkYnE0V09ZRjZj?=
 =?utf-8?B?T2tqTnZ4eUZyOUlmVHdvRGlFaGdpZU5RRElHY1BXTVZIdW5TbzBYWnQzeXV0?=
 =?utf-8?B?bThzZW1GQXZzeGNHdFd1ZFBMZTl2U1VnR1M2MGNXTzNMRnBvR1dmQVNMUkdK?=
 =?utf-8?B?MFgrTU5uYk1ZMzRHRHk3S3YrVGJxamZDcDRXMHBpREttbHRyUXFVdVBRU2U4?=
 =?utf-8?B?aFZPcytjVU1YU3pTZDdvTUNtR004ZjZ0dFBvQ280LzhFdWUzdm14WXQ4ekx0?=
 =?utf-8?B?R0pSL0gzZUlrcjNhWW5tTzYxdHJROHJrWEcyOWp4eEtBR1dTTU9hSWhVRlN1?=
 =?utf-8?B?dEdrRDMwSDNjV1RDZEljVTI4OG1WRWxiSWhRemxKOTFzbE5LMytocE5TM3BZ?=
 =?utf-8?B?QW5ta01NdTRVMi8wM29tTm9yVE0vMDB3MEgzYnMrcjVLa1BoTTllQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <00F2D250BAAF5940B3A392C636A5AD0D@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: microchip.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF9623118BD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f35a5f4f-56e0-4672-6d40-08de58a4eb01
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2026 04:24:07.3501 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: W0O0wg1zgOUA9TPehZ7hfQkIZjrvEidUssbK7xKvz+dcms5hJ/VHpxvDtyOl7GpFAJ7TJamBPePC1QujCMBg9LNZDMy4PHH4hwWtXJuQytI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9303
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
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[microchip.com,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	R_DKIM_ALLOW(-0.20)[microchip.com:s=selector1];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:Ludovic.Desroches@microchip.com,m:Dharma.B@microchip.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:Nicolas.Ferre@microchip.com,m:alexandre.belloni@bootlin.com,m:claudiu.beznea@tuxon.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[microchip.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,bootlin.com,tuxon.dev];
	FORGED_SENDER(0.00)[Manikandan.M@microchip.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Manikandan.M@microchip.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[microchip.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,microchip.com:email,microchip.com:dkim,microchip.com:mid]
X-Rspamd-Queue-Id: A995250FCE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gMjAvMTEvMjUgNDowOCBwbSwgTHVkb3ZpYyBEZXNyb2NoZXMgd3JvdGU6DQo+IERvbuKAmXQg
cmVqZWN0IHRoZSBjb21taXQgd2hlbiB0aGUgc291cmNlIHJlY3RhbmdsZSBoYXMgZnJhY3Rpb25h
bCBwYXJ0cy4NCj4gVGhpcyBjYW4gb2NjdXIgZHVlIHRvIHNjYWxpbmc6IGRybV9hdG9taWNfaGVs
cGVyX2NoZWNrX3BsYW5lX3N0YXRlKCkgY2FsbHMNCj4gZHJtX3JlY3RfY2xpcF9zY2FsZWQoKSwg
d2hpY2ggbWF5IGludHJvZHVjZSBmcmFjdGlvbmFsIHBhcnRzIHdoaWxlDQo+IGNvbXB1dGluZyB0
aGUgY2xpcHBlZCBzb3VyY2UgcmVjdGFuZ2xlLiBUaGlzIGRvZXMgbm90IGltcGx5IHRoZSBjb21t
aXQgaXMNCj4gaW52YWxpZCwgc28gd2Ugc2hvdWxkIGFjY2VwdCBpdCBpbnN0ZWFkIG9mIGRpc2Nh
cmRpbmcgaXQuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBMdWRvdmljIERlc3JvY2hlcyA8bHVkb3Zp
Yy5kZXNyb2NoZXNAbWljcm9jaGlwLmNvbT4NCg0KQXBwbGllZCB0byBkcm0tbWlzYy1uZXh0Lg0K
DQpUaGFua3MhDQoNCj4gLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL2F0bWVsLWhsY2RjL2F0bWVs
X2hsY2RjX3BsYW5lLmMgfCAxOSArKysrLS0tLS0tLS0tLS0tLS0tDQo+ICAgMSBmaWxlIGNoYW5n
ZWQsIDQgaW5zZXJ0aW9ucygrKSwgMTUgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2F0bWVsLWhsY2RjL2F0bWVsX2hsY2RjX3BsYW5lLmMgYi9kcml2ZXJz
L2dwdS9kcm0vYXRtZWwtaGxjZGMvYXRtZWxfaGxjZGNfcGxhbmUuYw0KPiBpbmRleCA5MjEzMmJl
OTgyM2YxZTcwNWQyNjZmOTU0NzcwMmVhOTUzMGJkMDQzLi5iY2NmZTA1NWMwODdlNTYzMmQ2MDUw
M2U4ZTRiY2IzZDllMThjZTUwIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXRtZWwt
aGxjZGMvYXRtZWxfaGxjZGNfcGxhbmUuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYXRtZWwt
aGxjZGMvYXRtZWxfaGxjZGNfcGxhbmUuYw0KPiBAQCAtNzksOCArNzksNiBAQCBkcm1fcGxhbmVf
c3RhdGVfdG9fYXRtZWxfaGxjZGNfcGxhbmVfc3RhdGUoc3RydWN0IGRybV9wbGFuZV9zdGF0ZSAq
cykNCj4gICAJcmV0dXJuIGNvbnRhaW5lcl9vZihzLCBzdHJ1Y3QgYXRtZWxfaGxjZGNfcGxhbmVf
c3RhdGUsIGJhc2UpOw0KPiAgIH0NCj4gICANCj4gLSNkZWZpbmUgU1VCUElYRUxfTUFTSwkJCTB4
ZmZmZg0KPiAtDQo+ICAgc3RhdGljIHVpbnQzMl90IHJnYl9mb3JtYXRzW10gPSB7DQo+ICAgCURS
TV9GT1JNQVRfQzgsDQo+ICAgCURSTV9GT1JNQVRfWFJHQjQ0NDQsDQo+IEBAIC03NDUsMjQgKzc0
MywxNSBAQCBzdGF0aWMgaW50IGF0bWVsX2hsY2RjX3BsYW5lX2F0b21pY19jaGVjayhzdHJ1Y3Qg
ZHJtX3BsYW5lICpwLA0KPiAgIAlpZiAocmV0IHx8ICFzLT52aXNpYmxlKQ0KPiAgIAkJcmV0dXJu
IHJldDsNCj4gICANCj4gLQloc3RhdGUtPnNyY194ID0gcy0+c3JjLngxOw0KPiAtCWhzdGF0ZS0+
c3JjX3kgPSBzLT5zcmMueTE7DQo+IC0JaHN0YXRlLT5zcmNfdyA9IGRybV9yZWN0X3dpZHRoKCZz
LT5zcmMpOw0KPiAtCWhzdGF0ZS0+c3JjX2ggPSBkcm1fcmVjdF9oZWlnaHQoJnMtPnNyYyk7DQo+
ICsJaHN0YXRlLT5zcmNfeCA9IHMtPnNyYy54MSA+PiAxNjsNCj4gKwloc3RhdGUtPnNyY195ID0g
cy0+c3JjLnkxID4+IDE2Ow0KPiArCWhzdGF0ZS0+c3JjX3cgPSBkcm1fcmVjdF93aWR0aCgmcy0+
c3JjKSA+PiAxNjsNCj4gKwloc3RhdGUtPnNyY19oID0gZHJtX3JlY3RfaGVpZ2h0KCZzLT5zcmMp
ID4+IDE2Ow0KPiAgIAloc3RhdGUtPmNydGNfeCA9IHMtPmRzdC54MTsNCj4gICAJaHN0YXRlLT5j
cnRjX3kgPSBzLT5kc3QueTE7DQo+ICAgCWhzdGF0ZS0+Y3J0Y193ID0gZHJtX3JlY3Rfd2lkdGgo
JnMtPmRzdCk7DQo+ICAgCWhzdGF0ZS0+Y3J0Y19oID0gZHJtX3JlY3RfaGVpZ2h0KCZzLT5kc3Qp
Ow0KPiAgIA0KPiAtCWlmICgoaHN0YXRlLT5zcmNfeCB8IGhzdGF0ZS0+c3JjX3kgfCBoc3RhdGUt
PnNyY193IHwgaHN0YXRlLT5zcmNfaCkgJg0KPiAtCSAgICBTVUJQSVhFTF9NQVNLKQ0KPiAtCQly
ZXR1cm4gLUVJTlZBTDsNCj4gLQ0KPiAtCWhzdGF0ZS0+c3JjX3ggPj49IDE2Ow0KPiAtCWhzdGF0
ZS0+c3JjX3kgPj49IDE2Ow0KPiAtCWhzdGF0ZS0+c3JjX3cgPj49IDE2Ow0KPiAtCWhzdGF0ZS0+
c3JjX2ggPj49IDE2Ow0KPiAtDQo+ICAgCWhzdGF0ZS0+bnBsYW5lcyA9IGZiLT5mb3JtYXQtPm51
bV9wbGFuZXM7DQo+ICAgCWlmIChoc3RhdGUtPm5wbGFuZXMgPiBBVE1FTF9ITENEQ19MQVlFUl9N
QVhfUExBTkVTKQ0KPiAgIAkJcmV0dXJuIC1FSU5WQUw7DQo+IA0KPiAtLS0NCj4gYmFzZS1jb21t
aXQ6IGZlNGQwZGVhMDM5ZjJiZWZiOTNmMjc1Njk1OTNlYzIwOTg0M2IwZjUNCj4gY2hhbmdlLWlk
OiAyMDI1MTExOS1sY2Rfc2NhbGluZ19maXgtYTQ4NDJkODYzMDdjDQo+IA0KPiBCZXN0IHJlZ2Fy
ZHMsDQoNCi0tIA0KVGhhbmtzIGFuZCBSZWdhcmRzLA0KTWFuaWthbmRhbiBNLg0KDQo=
