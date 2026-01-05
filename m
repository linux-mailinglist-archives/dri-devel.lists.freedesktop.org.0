Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24539CF21D3
	for <lists+dri-devel@lfdr.de>; Mon, 05 Jan 2026 08:06:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9381210E2CB;
	Mon,  5 Jan 2026 07:06:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="bL3UqJJ/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011052.outbound.protection.outlook.com [40.107.208.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5928110E2CB
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jan 2026 07:06:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ilZRr4otqmOvbGWTKCesu5+tGvrYjHRQexrkK4xrpYiVGDITqTywrJ3m2HAkouskqmIB0zhTHa596AEkbpdoZcLD6kghriKmSYeHz2VyZWm62tGyFJXXU3W9QjSXpf3o963RTpA0fbmZQ5smjCTOI6s1VpecaFyY3DxrcTP6FLE2EogsoYBbWXXk0y5BpfFUYPC5KBqg6OF30Xml8sw6vPbHjd4pT55qmJQkMYQPBsf7IPQte83Aq61kp/WFRSewBHpRe5vEkwUzpuBdMxmD0QYr+64Fs9oel3qcuKHii4ZKPyVQt4lMgLxK16eymse7pMEmibXb3pvYWNijLRU5CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9aURQxZcTzqGUe16X2drXSOKUZvHA+rRaoQnLe23Eb0=;
 b=MjSGMfvqmCYKXK4kNlZaUrw//whV3vyFfkFODq0Nm17g3ALrvlR3cIHVzPJGAUAGay86jCjJvwllFG3MzrcNFSLUQI4gV70BDzm2U2prcPoAxlGL/4dtGHYShlzgoip3B0L/LC3QXVa1/2+O8yiAje3H6ZRgk+i+7+Ance0KFmL7ESgQGCyrfKUB26Ep/GH6VbOSbpnawiQ3N5zIp4IRa0LGwf/07e7Oy5/INuFLjUANaIaZvNKHPNc3vjtfFppJ+pF94mQaEdbkUFWHax5aJ5uSQeZU8JhCfXlmwWVkufo3H2gMti/84uF2LCvSSiyzd8yrHuQ9ElbC9EjapnG8nQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9aURQxZcTzqGUe16X2drXSOKUZvHA+rRaoQnLe23Eb0=;
 b=bL3UqJJ/C2IUikk3zw6ePVR/j+wjM0Kj8rJ3g3WdVlZNzscQI5MqsfnacdIIt+sS+vlYtM4dJhmDnT1412clF553y4BM4qVwAds424toSMSEqkmsHR3EKoqf6gHytPJ5PrCN5XdQI51JPAmgu37QufQMmK/zC86Fdwn8mx4v+ja4g2T79VcqzyzYgaqGUe6vqhicfVCJy0cPDa3OqklbWLOc0p0uZloMeAIJ6d+nfahvkhjyvEItlLlj/zSzG0vwgAgbrGQQFkXDBax6RNwg8noxolWu0LUueOpUqhGenuCaQeyCoko1Bdet7TPUfFHKRxHDftjQVZc8XihWKyVHvQ==
Received: from DM3PPF9623118BD.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f3a) by MW4PR11MB5891.namprd11.prod.outlook.com
 (2603:10b6:303:169::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Mon, 5 Jan
 2026 07:06:46 +0000
Received: from DM3PPF9623118BD.namprd11.prod.outlook.com
 ([fe80::253c:c449:c087:43b1]) by DM3PPF9623118BD.namprd11.prod.outlook.com
 ([fe80::253c:c449:c087:43b1%2]) with mapi id 15.20.9456.008; Mon, 5 Jan 2026
 07:06:46 +0000
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
Thread-Index: AQHcfhHampJA4R7aL0S0mLwhXSuZnQ==
Date: Mon, 5 Jan 2026 07:06:46 +0000
Message-ID: <43c48e38-021e-4e3a-b872-b89c90108b54@microchip.com>
References: <20251120-lcd_scaling_fix-v1-1-5ffc98557923@microchip.com>
In-Reply-To: <20251120-lcd_scaling_fix-v1-1-5ffc98557923@microchip.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF9623118BD:EE_|MW4PR11MB5891:EE_
x-ms-office365-filtering-correlation-id: 89013e6e-accc-498a-ed30-08de4c28fd42
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|921020|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?aUpvRHphQmxWaGRaa29QS3hwODRCQk9DVThpT1VhbnBGUXVUVVl2YmQ1dnl6?=
 =?utf-8?B?UjVGNzUvcDc3Ymc5emtMVHJzcjhuVDNsOFlMU3RBYzZrL09NUWlLNDFyOEJB?=
 =?utf-8?B?M2p6b0RibGdram55eDhKTVFHS2xzN1l4bC9hbXVWajlKckxqVm0vanVQcnE5?=
 =?utf-8?B?Mm1ldWtONURVeVRISGFtMHdMdlJHNHlndXdQQXJjL1BKd3hja2REeEpjT2p0?=
 =?utf-8?B?alFQNW5qdHdxUXZobHZxVCtRV3l4eUFOU0hESGkyTmU1N2gycmJLaWYwYmpt?=
 =?utf-8?B?aUJXck8zOFBGOTVpenhXc3Z1QzA3bkE1a3dlSEc0RUxoMVhwenY2TWlBWTIr?=
 =?utf-8?B?NzBnRXNTMGtNeEJGa2ZaMzdId0xwem94bCt5WUoyVXFybXhFYTRpQ3hwcXZt?=
 =?utf-8?B?WEZFUUZ6QVlNY29MbllLeGtLNEUzenY0SDcxS3lpUzk5SGdaT21nTlYzRTJ3?=
 =?utf-8?B?YXZJTUcycjdsOUUvN0pMWi9Zc1VSYWlkSEpVc2pRcU1nL05WcXh1SUt1emtU?=
 =?utf-8?B?RGFkU2xxb1FGRUV2YU9sVDdDM21HT0tEKzhxcUg3V3FocUxHRkR0MENYR3hx?=
 =?utf-8?B?RG8yRGllNi9qblZJa3BFd0pZUHdQcEtvcXY2VDU4WnZUV0V2Y2FBMmdxOEov?=
 =?utf-8?B?UkE1d29HWkNWT0ZPMTZhMmFCRi9wZXJMbTcycUVIYXhBTGlPRk13UWxHaFdT?=
 =?utf-8?B?Y0lOYkpCS2ZDclBrOGwyT1ZGaU95N01iWCtOeEZleU1zYVBhbUZzQ2ZyVXVH?=
 =?utf-8?B?TWI2Tm9TQ3Q2cktwdDRneGJSMUlHR2VneVhsRVRCTldUMlpLU1BiV2NrWEUz?=
 =?utf-8?B?UzloM042NElwNnY5NWwvREtUZjFBdi9jQ3dSaitQbTFsd3g3a0N1STJtbVdO?=
 =?utf-8?B?NjRsZU8rWW81RjdXNmNUaDh1MWVIL0dGNXRhelZDcEI1cGZ1Nmt6OEZQZ2M4?=
 =?utf-8?B?aHFEU28zdDVWT1pvWEJ5NFNRZDNYNlRtR0hMeGVoQWc4cGpvUkdLYVlVVklo?=
 =?utf-8?B?c2dRUHlFMHBFTmgrTm1MUEp1MjVWc21oK1pCbllWTlhFbnYzM25wb29zWHFo?=
 =?utf-8?B?QW0yOVRjZS9NTzBHdEc3NG5YelNlRTlZVForRUVEbGZyZGpNYnBwRVB1ZDlK?=
 =?utf-8?B?emhXeTc5aGtUWHBKSEJEMzZ6SFZucUUwK1ZJQTBqTWd0STFETTNOeHJtVVNs?=
 =?utf-8?B?ZEQ5QWkzeCs5WFlDN0c2ZVlQS3U2eVBsQ01ybEo4M2QzSFVyY09DemxDTDEz?=
 =?utf-8?B?THJxV0VFL3pXc2RqWEJCNXlVM3pzWjltMURPazZTWlFjWFZKZTBVVkQ4Y2Q4?=
 =?utf-8?B?THEzM2ZWbXg0dHRkaEZLSzd1aHk4K1ZLTHd1OVNYWktFUjhvaGRpQkR1SFFt?=
 =?utf-8?B?YnpZRG9BZUJxQ0JpVUorRDJOTXhyRkxNSnE5SzQrQ05BclByL0dOVVFML0Q1?=
 =?utf-8?B?a3NBNEdmQjdGZS91NFpTTmM2dlE0UHRXN3Q0cCtDbmV0VWhLb2NPeGdMa0FN?=
 =?utf-8?B?ZGtzc3pPbWhERCtGMlNLMnlwc1VZUkhncDFQU043NGdPRlh2T05xUXN4bk96?=
 =?utf-8?B?elBmRStYcEc3Y2hiZUR2UEMvbjN1dTMvdFpYRVNJQjdtRkgrTk1MajBhL3ll?=
 =?utf-8?B?OUtXUCs5RmVUV1FRa1B4Rkt4elY2SmZ3QmVCbXRPa2syVzZ4eHVTZ3lidGZt?=
 =?utf-8?B?UGU2aERWbVh0WDBvQU0rRlpOU3ErcXpuTE5jbXJWM1lROERRK0tDNFdTWXdT?=
 =?utf-8?B?T1N6MzUzUlB6STV0RWw0dmlXT0FpV1R1MDhFNDhjUkoybEJ5QmZUSmdPSzJY?=
 =?utf-8?B?ZnNFSjFDYUUzUzc0VEZwS2h3dTBoaElOeExSZThOQnR3QmtMOUxvck94NEly?=
 =?utf-8?B?MEQxZWtLcm5IcEhFcTFUbzFzTERLY3FOSENjV2pRckhDcnlld0VoV1JaQXJR?=
 =?utf-8?B?ZFd1R2VjeUpKODV4OVcwRWplRGxKak10VnM0b0ZFd1lERmhudWx3bGtQa0pG?=
 =?utf-8?B?NTJrQlJzWVVtbnpudk5yRzJXK0FZQWhUWS9ua2c4TXI0UlNwdm10K1lhdHNQ?=
 =?utf-8?B?SHZHZ0ZEcWZ5WlZDVUVUSEd3bjkwZHRlR3BkUT09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF9623118BD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(921020)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NjBvdjRTSDFJQmV1VDN3bFcrVTIyRTBaNG1CeGVkODl6VHcvRUlybnZndjZx?=
 =?utf-8?B?RHozWi83aW1oRC9TN0xtbFRqV0Y0dmxwT0dWM1FjaERXczFRWWlUMDEvNlhy?=
 =?utf-8?B?LzFuSTg2M0VlMWtFd1lFYyt5amJTKzNWenRxNmxHUnNBVnFBRkFKUm5Sc2lk?=
 =?utf-8?B?ZkNGOXhWcmdFWEpPU1k4cW9QRlQ4U00wZFdMdDBxU29mRUM1T3VXM0VoWVFT?=
 =?utf-8?B?MENrRnlEUi8xYldqZzV5QUZDN3k5YmFqY1Zkd29GQXVyMDBtVitFWUtpZjZZ?=
 =?utf-8?B?ZjF3Sm41eGZkVk5vbGtYejBYdVBnZ1pmbDhrNSszSHJMSndQNUhrQ2dZR0JJ?=
 =?utf-8?B?MG50VGVUZWFzZllzR0xPYWlkb3NMblRrUVlKUklwT2duK3BtQzByd0RFanJo?=
 =?utf-8?B?WTVCTVZta2d3RWZFZ1FZamwzZEJ3dkZCOU5UV3NkcUdIdjI4ZTFTZ3RlaDBF?=
 =?utf-8?B?LzZyTW9RcjJ1Z1M4cFgxTndqZThYbWFiRFg2eXo4L29nUGxVWmVhNjdqSGpE?=
 =?utf-8?B?QW1RNkZqU0JnNXVBaEdFakw1aVVRWjY1Wjk4VVY3bjlUQmVIbkFuSVIyczBh?=
 =?utf-8?B?Z2dvdUwzWngvV3ExeGpPREhVMzFMYXlvL1ZxN2xPNzc3bkZLclo0SkF2YU4z?=
 =?utf-8?B?YkFSazlXaDFrQklOQUxwWWlsV1ptcEpOOUtraVdUdjl3Tm94Q0hHdmhjb1hr?=
 =?utf-8?B?TWJBVjF6Qk1ESU1ReFdObkVUZnNINGE2aG5HV01NaEZWQzAzcFV5STYwWTQ1?=
 =?utf-8?B?dXllZ1Y1ZXdsd2pDN1liR3BCamJLaFlFWmVCbkI3anpsWnZlM0J5ekJuWEpr?=
 =?utf-8?B?dVRLMU9LT1pkNTExNlVvWWFNM3p2ejFaS1pzdnJzanRVSmcwZFoxdG9jNmxP?=
 =?utf-8?B?TzUyMGFSYk52Z2lMaVdUYk9rL3lPQ002T2VGaStCdWxIbFRWZ0xqbThkdERz?=
 =?utf-8?B?czJsOUdFVDBJbDlIRFUyU0taNWh2cUlXYUhWM1pQT2IzTkVNZVlyWi84WEg5?=
 =?utf-8?B?V3VVTExOZDNQMFJGSVM4NU5GNFQxSDF1bUdHWFRKYnpQMkFkbVNoRWFYK2lL?=
 =?utf-8?B?eGZQN0ViSjdyRTZHeW9kWDFIejNmazQ5RGdCQmJqRWtBTWVzdlZ6bXV6S2hM?=
 =?utf-8?B?RzBIMHFlMVhDNTNZYkM4OTA2ZDVkUGtwNnUwUkxqOHdFRnA1eWU4WTdpTExs?=
 =?utf-8?B?T1hndnFpQzNaR0htVGRkRGJ4eTE3b1JKbHVMTWZhNTFOM0JzdGx5L3hMc2wy?=
 =?utf-8?B?b2RKZi90NzRJL3NLNE0veHRuTHlUU2dQMDJRSEZSOGQ0YVVDQ01Cd3phZUVp?=
 =?utf-8?B?NFUwUkF1ZzhWa0p3Uk9kT2NUTVJjcTMxL3B1QjhFMldtKzdHZisxcDE0N05y?=
 =?utf-8?B?QXZDaml0MjY3eVpIWDRpSHhOK3hBL2prOG1LelduVVcxbjlyT29yN05ja1hs?=
 =?utf-8?B?aXZGVDBsMC9MY2UyTDZRUEczRVlPaENUT2lOUXF0dUpsUVlrd2lWb0pueDBH?=
 =?utf-8?B?NU0wQm0wVjR5VG1KN1dQWlBiL2N3dkFVWHhvQlkxN05wcFpONFl6RWdRcVdt?=
 =?utf-8?B?a0hJWkpsVTRSeTVxNFVpU1hpVCt5Y0RESDZGb3poT3ovVVlhWEQ3Z2NOSHdE?=
 =?utf-8?B?NUNBdHRxK1Nwa0hDTG8yRk9od0E5L0R5NGJScWJGQTBWUHUvendMZ2tGSHlm?=
 =?utf-8?B?ZkZ3U2lkK0dQd0VkNHRKQjQ4NG9FRXJBdk5iSlBEMnArMHFqYUNUWkdlVGE5?=
 =?utf-8?B?aG8vMklwRXNjQ3hGaG9iQkdlRHp5eHdtRFluK0NJcU9LOEt6T2taYi9EZVow?=
 =?utf-8?B?ZmdOaFlRSmJuM3BXbGEzcGk0eHRjLzU5MVREU1dDSDJnUk5jQlhuMGl2S05V?=
 =?utf-8?B?TUM5bnB2K3hscHY1QzUzUUMwMnIwb1VrdllXUmh0Zm9YR280d2RtYk11RDMw?=
 =?utf-8?B?MmJiS0RJbWlJcnNmTU5yZ1FOUUJOOE9sSGdReEUwa1QvRW0vd2x0VU9KQjhS?=
 =?utf-8?B?N20zVGpYSDd6Q1Fjck9IbzJ0NVNuVXAvN0VVSTRtN1Y5N2NqUVJldWlidFZY?=
 =?utf-8?B?NEpHVEFMb21keHhsVmZKZFF1TjczZ290MmtWYytBY25jbFNzN24veTB4bDBT?=
 =?utf-8?B?K0NBbmk4Nzdtb2hidzV6cHgrenZlbllPaENteTdpY3ZlL2szWm1NYkR3WlM0?=
 =?utf-8?B?a1ZQVHhteDlSZmFqZEo0ZnYrbTZXVEpyTjVQMHNiVWdwb0YxVnYzbFBxQ01r?=
 =?utf-8?B?WTlwK20yRysrOWJmNmVtcVViYTNpampCSlRTc0xkUmRVYUJXWmFlT1JqTkhX?=
 =?utf-8?B?aHAxalBjcFhZTHJUWkorL3ExdmQ3NDd6d29rcFF2Ri9oTXJCOWtlUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0AC6CBF6501D4143950559279420558D@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: microchip.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF9623118BD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89013e6e-accc-498a-ed30-08de4c28fd42
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jan 2026 07:06:46.4591 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YbpwDThHKUxoG5va8anpOyRfajyf5tNsr79tL3uFX7sVjwk0e1KkrRMmG37ZWjYNRNsPJ7fOI7saeuvIs/0DNHkf9Hyhmz81iEzAhh+oXUs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5891
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

T24gMjAvMTEvMjUgNDowOCBwbSwgTHVkb3ZpYyBEZXNyb2NoZXMgd3JvdGU6DQo+IERvbuKAmXQg
cmVqZWN0IHRoZSBjb21taXQgd2hlbiB0aGUgc291cmNlIHJlY3RhbmdsZSBoYXMgZnJhY3Rpb25h
bCBwYXJ0cy4NCj4gVGhpcyBjYW4gb2NjdXIgZHVlIHRvIHNjYWxpbmc6IGRybV9hdG9taWNfaGVs
cGVyX2NoZWNrX3BsYW5lX3N0YXRlKCkgY2FsbHMNCj4gZHJtX3JlY3RfY2xpcF9zY2FsZWQoKSwg
d2hpY2ggbWF5IGludHJvZHVjZSBmcmFjdGlvbmFsIHBhcnRzIHdoaWxlDQo+IGNvbXB1dGluZyB0
aGUgY2xpcHBlZCBzb3VyY2UgcmVjdGFuZ2xlLiBUaGlzIGRvZXMgbm90IGltcGx5IHRoZSBjb21t
aXQgaXMNCj4gaW52YWxpZCwgc28gd2Ugc2hvdWxkIGFjY2VwdCBpdCBpbnN0ZWFkIG9mIGRpc2Nh
cmRpbmcgaXQuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBMdWRvdmljIERlc3JvY2hlcyA8bHVkb3Zp
Yy5kZXNyb2NoZXNAbWljcm9jaGlwLmNvbT4NCg0KUmV2aWV3ZWQtYnk6IE1hbmlrYW5kYW4gTXVy
YWxpZGhhcmFuIDxtYW5pa2FuZGFuLm1AbWljcm9jaGlwLmNvbT4NCg0KVGhhbmtzIEx1ZG92aWMu
DQo+IC0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9hdG1lbC1obGNkYy9hdG1lbF9obGNkY19wbGFu
ZS5jIHwgMTkgKysrKy0tLS0tLS0tLS0tLS0tLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2Vy
dGlvbnMoKyksIDE1IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9hdG1lbC1obGNkYy9hdG1lbF9obGNkY19wbGFuZS5jIGIvZHJpdmVycy9ncHUvZHJtL2F0
bWVsLWhsY2RjL2F0bWVsX2hsY2RjX3BsYW5lLmMNCj4gaW5kZXggOTIxMzJiZTk4MjNmMWU3MDVk
MjY2Zjk1NDc3MDJlYTk1MzBiZDA0My4uYmNjZmUwNTVjMDg3ZTU2MzJkNjA1MDNlOGU0YmNiM2Q5
ZTE4Y2U1MCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2F0bWVsLWhsY2RjL2F0bWVs
X2hsY2RjX3BsYW5lLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2F0bWVsLWhsY2RjL2F0bWVs
X2hsY2RjX3BsYW5lLmMNCj4gQEAgLTc5LDggKzc5LDYgQEAgZHJtX3BsYW5lX3N0YXRlX3RvX2F0
bWVsX2hsY2RjX3BsYW5lX3N0YXRlKHN0cnVjdCBkcm1fcGxhbmVfc3RhdGUgKnMpDQo+ICAgCXJl
dHVybiBjb250YWluZXJfb2Yocywgc3RydWN0IGF0bWVsX2hsY2RjX3BsYW5lX3N0YXRlLCBiYXNl
KTsNCj4gICB9DQo+ICAgDQo+IC0jZGVmaW5lIFNVQlBJWEVMX01BU0sJCQkweGZmZmYNCj4gLQ0K
PiAgIHN0YXRpYyB1aW50MzJfdCByZ2JfZm9ybWF0c1tdID0gew0KPiAgIAlEUk1fRk9STUFUX0M4
LA0KPiAgIAlEUk1fRk9STUFUX1hSR0I0NDQ0LA0KPiBAQCAtNzQ1LDI0ICs3NDMsMTUgQEAgc3Rh
dGljIGludCBhdG1lbF9obGNkY19wbGFuZV9hdG9taWNfY2hlY2soc3RydWN0IGRybV9wbGFuZSAq
cCwNCj4gICAJaWYgKHJldCB8fCAhcy0+dmlzaWJsZSkNCj4gICAJCXJldHVybiByZXQ7DQo+ICAg
DQo+IC0JaHN0YXRlLT5zcmNfeCA9IHMtPnNyYy54MTsNCj4gLQloc3RhdGUtPnNyY195ID0gcy0+
c3JjLnkxOw0KPiAtCWhzdGF0ZS0+c3JjX3cgPSBkcm1fcmVjdF93aWR0aCgmcy0+c3JjKTsNCj4g
LQloc3RhdGUtPnNyY19oID0gZHJtX3JlY3RfaGVpZ2h0KCZzLT5zcmMpOw0KPiArCWhzdGF0ZS0+
c3JjX3ggPSBzLT5zcmMueDEgPj4gMTY7DQo+ICsJaHN0YXRlLT5zcmNfeSA9IHMtPnNyYy55MSA+
PiAxNjsNCj4gKwloc3RhdGUtPnNyY193ID0gZHJtX3JlY3Rfd2lkdGgoJnMtPnNyYykgPj4gMTY7
DQo+ICsJaHN0YXRlLT5zcmNfaCA9IGRybV9yZWN0X2hlaWdodCgmcy0+c3JjKSA+PiAxNjsNCj4g
ICAJaHN0YXRlLT5jcnRjX3ggPSBzLT5kc3QueDE7DQo+ICAgCWhzdGF0ZS0+Y3J0Y195ID0gcy0+
ZHN0LnkxOw0KPiAgIAloc3RhdGUtPmNydGNfdyA9IGRybV9yZWN0X3dpZHRoKCZzLT5kc3QpOw0K
PiAgIAloc3RhdGUtPmNydGNfaCA9IGRybV9yZWN0X2hlaWdodCgmcy0+ZHN0KTsNCj4gICANCj4g
LQlpZiAoKGhzdGF0ZS0+c3JjX3ggfCBoc3RhdGUtPnNyY195IHwgaHN0YXRlLT5zcmNfdyB8IGhz
dGF0ZS0+c3JjX2gpICYNCj4gLQkgICAgU1VCUElYRUxfTUFTSykNCj4gLQkJcmV0dXJuIC1FSU5W
QUw7DQo+IC0NCj4gLQloc3RhdGUtPnNyY194ID4+PSAxNjsNCj4gLQloc3RhdGUtPnNyY195ID4+
PSAxNjsNCj4gLQloc3RhdGUtPnNyY193ID4+PSAxNjsNCj4gLQloc3RhdGUtPnNyY19oID4+PSAx
NjsNCj4gLQ0KPiAgIAloc3RhdGUtPm5wbGFuZXMgPSBmYi0+Zm9ybWF0LT5udW1fcGxhbmVzOw0K
PiAgIAlpZiAoaHN0YXRlLT5ucGxhbmVzID4gQVRNRUxfSExDRENfTEFZRVJfTUFYX1BMQU5FUykN
Cj4gICAJCXJldHVybiAtRUlOVkFMOw0KPiANCj4gLS0tDQo+IGJhc2UtY29tbWl0OiBmZTRkMGRl
YTAzOWYyYmVmYjkzZjI3NTY5NTkzZWMyMDk4NDNiMGY1DQo+IGNoYW5nZS1pZDogMjAyNTExMTkt
bGNkX3NjYWxpbmdfZml4LWE0ODQyZDg2MzA3Yw0KPiANCj4gQmVzdCByZWdhcmRzLA0KDQotLSAN
ClRoYW5rcyBhbmQgUmVnYXJkcywNCk1hbmlrYW5kYW4gTS4NCg0K
