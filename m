Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YJo7Kamrb2mgEwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 17:22:01 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C60475B4
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 17:22:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9C0710E025;
	Tue, 20 Jan 2026 11:22:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="PWucnIRr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010051.outbound.protection.outlook.com [52.101.46.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA45710E025
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jan 2026 11:22:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k47lVC+PxRR0+hQHBWO5w4H2CMZMBsmBM++sppUCFoSRPwlsApNwg6N0KCSqK4DiquYSn9osZW+DgUQgTBEaIxZNOHOoWZoR5050GyUag/Tzq0BppG2j/3cDNh4lo+QB5GA3pqGfQxgNrPm8OE8bpY2L3wX3as93lzANZNe+1GMrPbByf9Zyl/8esDcuFn4wai9asU6fNu979SpBTp/jcyv59KLVXQHoNEORy5UY23lsME0JVevNgqYviD+X2Un/0WJBbKP3FgBq+a6R5fqm/2SypFw2RrKrsFy4KOOw54ZppuXyzahwiB9Row08O/mqoSsHBdWaTSUtZVnShm7Ang==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sKlc+Hgnghz7WT4PP/D+iSbOJKsAhhNpuETerqwWdHY=;
 b=XJO0kG7g0IMaFNEXOwbTE2z3boEOGQ/xINXOaAszR4I4ArFXPyRU0WbI/FtACPQb1PfLLGrCc/ymOh5iK/iTgqhua4ngnhbTSUZj9yN+7R78wtpVR5PHQt9S1P4TylOwy7/iR6/w4HlwtNEnEDnCSQL1u8/zQIF5/mflKT0yKh4Zx8BtC44kHLQ+7ZN5J5iOZP/fGXYC6N7zVLuRHgCAJaUobVkianX5CPubrwmXTo7k90tqr3ZvJ0jiKClOODHr1lJ3wC6sk3uZwyvuPzChu/AfqqhfO1NymtMlTwWIvNUTNbqmCA3fjc5kWVM8mw4uRHITnn155BEP6zj5DnEwMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sKlc+Hgnghz7WT4PP/D+iSbOJKsAhhNpuETerqwWdHY=;
 b=PWucnIRrbk5fDmP4kR6bEZEm67bLcKCmJwjokD1IsW/H2NFzC8Q79ci1KvUm+9ULoT7xxKCB6KJYVFuoSwN9tMMUSeHRLCapn53/PVkgtfIVEwbUwRNNWSwSUGiHm4YTJuvAL3v1X9dezcIFSdrJ+OWcd2hQNnAPWtI09HWVlknWSvO2ODrxzNy/P8Iu7P7KLSft7p07+++m0I3rmQiYR5zXvPEEU1YG0zvDMgYXRffaWdZoL5pyL84gjA/4UvTEKLxy1TAVr1xzu5dF+7hO/rAXcP39Vi3Lh7aXfJ/3zvaDejC4y1ibAnpNWhMl3RfZ/OCM/23ST/1+VdVxwMbxaA==
Received: from DM3PPF9623118BD.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f3a) by PH8PR11MB7968.namprd11.prod.outlook.com
 (2603:10b6:510:25f::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 11:22:14 +0000
Received: from DM3PPF9623118BD.namprd11.prod.outlook.com
 ([fe80::253c:c449:c087:43b1]) by DM3PPF9623118BD.namprd11.prod.outlook.com
 ([fe80::253c:c449:c087:43b1%2]) with mapi id 15.20.9456.008; Tue, 20 Jan 2026
 11:22:13 +0000
From: <Manikandan.M@microchip.com>
To: <Ludovic.Desroches@microchip.com>, <Dharma.B@microchip.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <Nicolas.Ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
 <claudiu.beznea@tuxon.dev>
CC: <dri-devel@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 0/8] drm/atmel-hlcdc: make more use of helpers
Thread-Topic: [PATCH v2 0/8] drm/atmel-hlcdc: make more use of helpers
Thread-Index: AQHccCHoYoWHh5irUE+gtexD3t/5yLVbHcaA
Date: Tue, 20 Jan 2026 11:22:13 +0000
Message-ID: <bc2e2acc-d019-4812-a195-92c8ec117e07@microchip.com>
References: <20251218-lcd_cleanup_mainline-v2-0-df837aba878f@microchip.com>
In-Reply-To: <20251218-lcd_cleanup_mainline-v2-0-df837aba878f@microchip.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF9623118BD:EE_|PH8PR11MB7968:EE_
x-ms-office365-filtering-correlation-id: 9bcb7cb2-77bc-4e5c-8a18-08de5816290f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|921020|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?VkpWTUVkWXdVdVRaa1ZrRDJMdk5oV0hlUXVTVDUreW8xMTBsQmJPSGxldUs0?=
 =?utf-8?B?czQzTS84ZERNS3JUYVZHb05sZXViMWVXQjExSi9qeWRlNERUVUpKbUR3bDNS?=
 =?utf-8?B?aFZ2TzBsTWwySzBQV1RMdU9yOXZCamJTMlA4RW1iN2pHd1kwLzdHcTU0ZVBk?=
 =?utf-8?B?aXhHNXIrb0JEcGJ1UGwrV2JkS2tpbmRCYzdMU211ckdjZlkrN3NUM0xyTW9k?=
 =?utf-8?B?VEtRNVpmejdFZldHQ09HQ1BmMlhXM1lKdGRwNlVoNjN4TnczQzI5NitZSXdk?=
 =?utf-8?B?UnZIRVFGR1U0N0Flak5DcG90VU1zVkRtZzNwMXp6MlZKd0RPVU5jeDJ6OHl5?=
 =?utf-8?B?TmcwaGdobWt0ZU9pbkcwaDlzcElrVTNiQjV3bVBtd0ZodXNrbmZFNlpZMnFt?=
 =?utf-8?B?YTY2czRqRDNodm40MFNzY2lwUEFxSjdCcVM0M2hnVXByN0YxNDE0RVBPNlp2?=
 =?utf-8?B?WmtrUnpjOXQ0alZyWVNmajZtYlF5UkplU0tCOFdKYWxMRGREYmw1TlhvMFhW?=
 =?utf-8?B?d1E0ckJaZTlWTHVRZ1hibEJkb1R6TFhGZVdTbHA0WGRhaXR6YTQxOHNuRHRj?=
 =?utf-8?B?c2xqUWxxcE5COUIyUmp1STgxdUVTNzZzUHVQMEMvMXBUcDkyQkZtdDZXK0hj?=
 =?utf-8?B?WnY5YVBDWEZOd09wQXhYQU52Q1U4bjB1MWkwMFI1WWYvRGpHenM1bmI2eFlG?=
 =?utf-8?B?UFRGRjBNeXpRaWFSRU0ybStVRVRHZUQ0ekFhOUFvU3ExVzNNQkNxaWlFM1Vk?=
 =?utf-8?B?Zm9yTjRiL1gzRm9ZdlpmYm5CdElWbGhmQ3VxNitqRW0wUTFYQVlyVnFUOHVu?=
 =?utf-8?B?YVdnZ3ZNWng5UGl5M1E3SUZIdmFDa1NMTGJIanhSOEg0cGRXOStNWElRYWNU?=
 =?utf-8?B?dW1leXliSldrNkNpcTYyMGI4WjVQLzlqc0RxUEh3T01MTUJlb1dKZ25PMVpF?=
 =?utf-8?B?cyt6d2IwUkZteUZCMVZhWlVQR1h5SE1GUmJ0c3ZQZStQamRPKzk0R2RoVitO?=
 =?utf-8?B?QXF2dmpJSmFMOHI2K0cwY1lJT3QxcTZYNkpGWmQ3ZWU2VUFaSm1zQWhVK3Rw?=
 =?utf-8?B?TFM2RDRZTTNQaUdkVHlMRXprbUwxZVh1YnovdkYydVQyL29yTGtIWE9uTmFX?=
 =?utf-8?B?azF4Q2RTMFlva2dFY1Y5cThmTnNuVEx1UGxJR0NVWWhZb3FCT1lpUFdxSG9K?=
 =?utf-8?B?enBxcHhScnV4bzFIcElGRnhPUG9YY1E2T1MxYUkvUTJUSVNCK3dpZjNheERn?=
 =?utf-8?B?V0pwMG4yY0pRREZSNmJic2sycEUrMDdnMW85dS9Dd20zdE9NYlNJMjUyRWNq?=
 =?utf-8?B?Q0QwOUd0R2UwV2d2MGx1cUFUYllsa2YxaXZKNEljRklKRWpqMlZ1ZUduZWt2?=
 =?utf-8?B?STdGQWk3Umd1VDNTNFhTZENLQUhJZzdRcXltL1dZb2I3Ykhxb2ErTTJNbXU4?=
 =?utf-8?B?MXJSL29MM1lkNzZHZ1FMSWpibURKNHZ5akNpUUxDSnVLc2FNVzJlSjIyaU9k?=
 =?utf-8?B?Zm9aM1NpTFdCM1h2RW14cnVUdXRlVDZmTWxETUhtYzBaUUFJM1Ivdnhkdjhk?=
 =?utf-8?B?eDdUTVI4YjlUQmNXVnJMWks4QTd6WWEyTTFYaGpzQ1FkbjU3ZnpjdklYK0ht?=
 =?utf-8?B?bGE0SUpDM0VEVnlpYU1rWjdIUWVxNzdjaWdHYzMzN09PcHNiTDlmTGh2Y1Fm?=
 =?utf-8?B?QkxrYmlEbDNyZm42Sit1dlVVNkZqQnYzemZIdUh5dk0xY050V1QyU1Mra0VZ?=
 =?utf-8?B?aGI3cEYwS05MeEZqbWc4bFlQTEtHbERRanpXeCtoTXRidzJKZ0pHTXBHNDB3?=
 =?utf-8?B?U3F0aHp2L2I0ZENzbmIrUjRGeWdlOFBsd3BpQVViK3JCTHZicXRaWFhVd1p6?=
 =?utf-8?B?MnV2T1VINkp2NXlKUndyOWptRzNLVVRBL0NZcGt0c1NIbndxeGlSUDR5aThG?=
 =?utf-8?B?VUdBWUZEd2JXNS82N3lYcm1Hc3NSYk8yeUFYckFtbDNvN3dId3hjS1ZlUDlN?=
 =?utf-8?B?cTg5WDRqNDBrWFZKcGpXc3c3QUgxUkExaUN0ZjlYdWZDMTFldmVwNk5CMGs5?=
 =?utf-8?B?am9EWldhRG1GZlY4VWN0aUp6ajJFdWpteGdiRFFFNGxpd3NGSkZ0SjlXdDhO?=
 =?utf-8?B?VGlDQnlTK3FvWW9kMjFRclBJL2RycXNqMW9WZlQzMTJYNUhVakVsNmxkQmhM?=
 =?utf-8?Q?Q6uBa5zHXMKJ7xnSKctJSn7wbg9vnc0VRH87c8O1fscd?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF9623118BD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(921020)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NFdHRmo2VmpoM2NucGowYXFhd09mZUlZUmRmN29GQkV2WTVnaVVQZXMxbmdL?=
 =?utf-8?B?UDduSWlnY3VsU3Vmek4zbEhXYXZWNmFOaXFmcEJBVHRuZWVSUFhEU0g1V2Rt?=
 =?utf-8?B?UHRpMlR3N0d3NVZmTnFWeWEzR055eE9vVUVrZWVYdEpQT2J3MXlrNDMvMUcz?=
 =?utf-8?B?ZXoxVEFSOXlhSWxWb2tnUVd0M05mdGQveGlYcGRFbkRpVFBSdndpU1JyOUFv?=
 =?utf-8?B?ZHVVS3pxRkdDL1k0YmZheTZVZlFKSUJLTEI0UUNGbytsek9Tbnd4MjJhSThS?=
 =?utf-8?B?KytQWlVjbHRDN3BxbGpvUVFrcVdHc3NvUE1zb2hTNkZuNk1VVi8yZEJhcTZk?=
 =?utf-8?B?UXFxc0hma05WMTFQdk50S2xleS9ZKzAycktGc3pFeDhUR2tHSWU5OWhtMnBy?=
 =?utf-8?B?Zm9CZG5xS0w4U1RtUzlodXkzTnVZZjNTL2N1c0pJcEJKNTNqQndNbWY3VHJV?=
 =?utf-8?B?WEJQUXFjTmYyZUs5K1pqYXoyWXZyTnAxZkk0elNySFJkYzRJZEtsNUh2SlRU?=
 =?utf-8?B?RkdTcElYOVlSSE5hend3eHV6U2Z5TW02RTNTSVFBWlZrbmFORTEzMEtRUzc5?=
 =?utf-8?B?RjJjOFFxMWFqbnNIN01sa0JCMnh6bnZINWl4bDJyVWgwYWxyT0RRTEIrZGdT?=
 =?utf-8?B?WVBsTWFHUTMzMlR6clFHemp6dEZQNFNnVitlVDN5S1M0U3hLL0VWWTdndHRL?=
 =?utf-8?B?MjNGZHU5blBwTE5MSU0zZWptZENDUzNKOWdzRjFhQUhvT05SWE9veFFMbGlO?=
 =?utf-8?B?aTkyRDdMUjlmY3orOUtkalBTaHloWHozYXN1RnZQUE1NeHR6Wlh5TFhmQ1lh?=
 =?utf-8?B?NmFpVURZOWw2cnB0dVlzZitPSW8vME9HQ2ZGclBrNEY2RnhOMlJlTFd5Sjll?=
 =?utf-8?B?Zml0NVBMNVZONGMxdU9nVTdJWTBjcHR3WjFiRDVEUXZtNklQcyt0aTQvUUoy?=
 =?utf-8?B?enZSUG9pcTNoNmxPUGZWK0wxdHZnT2NHTitBTlM0YnN4eXkwcThWek9LMDZi?=
 =?utf-8?B?QVU0elpVbThzZW55azNOY3dOaUsvQzdZSEtvQ0RaTW9jQVlNMzNQQVdHZCtU?=
 =?utf-8?B?cnlNcjRSSk1WTlRuanNGcnJqb3lHOWs2NjlQV3lDQW5VRXc3MXpBZlJHU1pk?=
 =?utf-8?B?aHJ6WkErVGUwY25GMkFoOWpUSWNpSVQ1dXRXY3JLS1oxaTBkbUhVVlVNQkJL?=
 =?utf-8?B?TldiR1V2WGRaZ0xzdkxmNytYMENNRUxRNjhkNThDcXI5emJnUURiWGNHNzdr?=
 =?utf-8?B?NWFCSEtxQys1b2t0RE4wUmRma20vUEFiT1cxc2VtRW5LcTNnbDNjbG5wRVZ0?=
 =?utf-8?B?Vjc3eCsxNXQzRTlxUUJ1Y1F6RHRJd3U3TVRCcjNwOFFIYzZqZjA1RU0wSXNS?=
 =?utf-8?B?eWY0WmxYWS8xTTBoL2R1eWlNNk1LcjdNaGdRVFo4TWZaUVNJRmJyZkdHdEI3?=
 =?utf-8?B?d2ZRbXpwN0NSTlRhNG95L0hmNUlSeHUrWTB0NnNTV1cvVEZpdkxwd0k0REtZ?=
 =?utf-8?B?MmNSOHZnV2c0YXNRTzFXaDQ3WC9HcENNcVJtN0tYNnhLdTZkZGUvNEV2V1Fa?=
 =?utf-8?B?Y1pIeXZ6RThEZXdvVzhYT2twcHVRdXJJdEVwWXRXc0h5R1IvTlpRU2VZdm5Y?=
 =?utf-8?B?dXpuWFkyRVo0Z2E3RGJUN3pUOFlDRWdtL2JrTFI1a00xb2ZtRTlkbHRxN0Ft?=
 =?utf-8?B?b1U1bXcvdU1HZU9ZbWY2QmtpK0c3bGtiRjhBZ1pQWkU1YzI3T3Blc3UzNnA3?=
 =?utf-8?B?SG0ySExFTCtFbVZlbGhXUGZheEhpSmJNdVFkdW5QcHh6dFVkN2YwWTF4NmV3?=
 =?utf-8?B?YjJiVCtOK0dLZnJNSDhyZ0k2dThwTlNZZjQzWTRxaDllZVI4SFF4UHJVdGQz?=
 =?utf-8?B?Qkw1enRtTE8vMGFIMm9rV3RIaXBwb1dtczAwa1pVYmFsc1luV1B1enpXdjk2?=
 =?utf-8?B?R2hXZDVndGx2K040SkV6ak9qellqZm9PdXJUVDJXM20wQzh0RExUalFUTFJv?=
 =?utf-8?B?TWUxYXFQMVc0RjJUZ0JXSTBXN2dJS3NKMkhDUkFlWFhrVXg1UEtVYWsvWGhC?=
 =?utf-8?B?QWdLYXphcEV1ZlhNeFRnbjNTUm5PUXozV1VhS1QzWGRLS3RSTUlvLzdidzhL?=
 =?utf-8?B?d1hOUGdFOGZVcEFWK0dJOTM4N2hJdUEzZFpwckkxVzBab2Q1Szdvai9kYzhk?=
 =?utf-8?B?NkVBZzRHSStyOWo3MUtiUDhoc3p4TVY5c0lzRWdaN0dTZFNKb25PVE4zSXAx?=
 =?utf-8?B?NjJ0WTBxdFpNRUtLWnpwV0kwMEt1dDN2R0gwNFg2bVBaTHlybVJZQzBYRHNo?=
 =?utf-8?B?L1RPT1hsM1RjczhhY013dEpYS1NUZFZvMVlWNFZzeFZWbVJsdTJRQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F764369970F8C34CA786F6B16E5E8962@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: microchip.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF9623118BD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bcb7cb2-77bc-4e5c-8a18-08de5816290f
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2026 11:22:13.4120 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: l2sr6K1TtqJnC/mSACh7u4GcXfIkS72vYqRChsTmuQDRjqDZ9CPyVAvcF8ql2LFf6fv9eNHBcX/YVSuWze72GrOih60ttS5I5ErICKmvXeM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7968
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
X-Spamd-Result: default: False [-1.21 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[microchip.com,reject];
	R_DKIM_ALLOW(-0.20)[microchip.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:Ludovic.Desroches@microchip.com,m:Dharma.B@microchip.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:Nicolas.Ferre@microchip.com,m:alexandre.belloni@bootlin.com,m:claudiu.beznea@tuxon.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_NEQ_ENVFROM(0.00)[Manikandan.M@microchip.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER(0.00)[Manikandan.M@microchip.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[microchip.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,bootlin.com,tuxon.dev];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Queue-Id: 23C60475B4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gMTgvMTIvMjUgNjo1NSBwbSwgTHVkb3ZpYyBEZXNyb2NoZXMgd3JvdGU6DQo+IEhpLA0KPiAN
Cj4gVGhpcyBzZXQgb2YgcGF0Y2hlcyBpcyBtb3N0bHkgYWJvdXQgdXNpbmcgYXZhaWxhYmxlIGhl
bHBlcnMgd2hlbg0KPiBwb3NzaWJsZSB0byBzaW1wbGlmeSB0aGUgY29kZSBhbmQgZWFzZSB0aGUg
bWFpbnRlbmFuY2UuDQo+IA0KPiBUaGVyZSBpcyBhIGRlcGVuZGVuY3kgb24gImRybS9wYW5lbDog
c2ltcGxlOiByZXN0b3JlIGNvbm5lY3Rvcl90eXBlDQo+IGZhbGxiYWNrIiwgb3RoZXJ3aXNlIHRo
ZSBhdG1lbC1obGNkYyBkcml2ZXIgbWF5IGZhaWwgZHVyaW5nIHRoZSBwcm9iZS4NCj4gDQo+IFNp
Z25lZC1vZmYtYnk6IEx1ZG92aWMgRGVzcm9jaGVzIDxsdWRvdmljLmRlc3JvY2hlc0BtaWNyb2No
aXAuY29tPg0KDQpBcHBsaWVkIHRvIGRybS1taXNjLW5leHQuDQoNClRoYW5rcyENCj4gLS0tDQo+
IENoYW5nZXMgaW4gdjI6DQo+IC0gRml4IHBhdGNoIDUgd2FybmluZyBhYm91dCB1bmluaXRpYWxp
emVkIHVzZSBvZiByZXQuDQo+IC0gTGluayB0byB2MTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcv
ci8yMDI1MTEyMS1sY2RfY2xlYW51cF9tYWlubGluZS12MS0wLTI1ODdlNmZlNGQ2N0BtaWNyb2No
aXAuY29tDQo+IA0KPiAtLS0NCj4gTHVkb3ZpYyBEZXNyb2NoZXMgKDgpOg0KPiAgICAgICAgZHJt
L2F0bWVsLWhsY2RjOiB1c2UgbWFuYWdlZCBkZXZpY2UgcmVzb3VyY2VzIGZvciB0aGUgZGlzcGxh
eSBjb250cm9sbGVyDQo+ICAgICAgICBkcm0vYXRtZWwtaGxjZGM6IGFkZCBzdXBwb3J0IGZvciB0
aGUgbm9tb2Rlc2V0IGtlcm5lbCBwYXJhbWV0ZXINCj4gICAgICAgIGRybS9hdG1lbC1obGNkYzog
dXNlIGRybW1fc2ltcGxlX2VuY29kZXJfYWxsb2MoKQ0KPiAgICAgICAgZHJtL2F0bWVsLWhsY2Rj
OiB1c2UgZHJtX2NydGNfbWFzaygpDQo+ICAgICAgICBkcm0vYXRtZWwtaGxjZGM6IHVzZSBkZXZt
X2RybV9vZl9nZXRfYnJpZGdlKCkNCj4gICAgICAgIGRybS9hdG1lbC1obGNkYzogdXNlIGRybW1f
Y3J0Y19hbGxvY193aXRoX3BsYW5lcygpDQo+ICAgICAgICBkcm0vYXRtZWwtaGxjZGM6IHVzZSBk
cm1tX3VuaXZlcnNhbF9wbGFuZV9hbGxvYygpDQo+ICAgICAgICBkcm0vYXRtZWwtaGxjZGM6IGRl
c3Ryb3kgcHJvcGVybHkgdGhlIHBsYW5lIHN0YXRlIGluIHRoZSByZXNldCBjYWxsYmFjaw0KPiAN
Cj4gICBkcml2ZXJzL2dwdS9kcm0vYXRtZWwtaGxjZGMvYXRtZWxfaGxjZGNfY3J0Yy5jICAgfCAz
MiArKy0tLS0tLS0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9hdG1lbC1obGNkYy9hdG1lbF9obGNk
Y19kYy5jICAgICB8IDQwICsrKysrKystLS0tLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vYXRtZWwt
aGxjZGMvYXRtZWxfaGxjZGNfZGMuaCAgICAgfCAgMSArDQo+ICAgZHJpdmVycy9ncHUvZHJtL2F0
bWVsLWhsY2RjL2F0bWVsX2hsY2RjX291dHB1dC5jIHwgNTAgKysrKystLS0tLS0tLS0tLQ0KPiAg
IGRyaXZlcnMvZ3B1L2RybS9hdG1lbC1obGNkYy9hdG1lbF9obGNkY19wbGFuZS5jICB8IDczICsr
KysrKysrKysrLS0tLS0tLS0tLS0tLQ0KPiAgIDUgZmlsZXMgY2hhbmdlZCwgNzUgaW5zZXJ0aW9u
cygrKSwgMTIxIGRlbGV0aW9ucygtKQ0KPiAtLS0NCj4gYmFzZS1jb21taXQ6IDg4Y2JkOGFjMzc5
Y2Y1Y2U2OGI3ZWZjZmQ0ZDE0ODRhNjg3MWVlMGINCj4gY2hhbmdlLWlkOiAyMDI1MTEyMS1sY2Rf
Y2xlYW51cF9tYWlubGluZS1iNmFjYzc1YjVhMDkNCj4gDQo+IEJlc3QgcmVnYXJkcywNCg0KLS0g
DQpUaGFua3MgYW5kIFJlZ2FyZHMsDQpNYW5pa2FuZGFuIE0uDQoNCg==
