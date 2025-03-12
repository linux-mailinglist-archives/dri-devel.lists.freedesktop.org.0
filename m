Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A524EA5E488
	for <lists+dri-devel@lfdr.de>; Wed, 12 Mar 2025 20:36:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D939610E234;
	Wed, 12 Mar 2025 19:36:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="UyNI9KfO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MA0PR01CU012.outbound.protection.outlook.com
 (mail-southindiaazolkn19011039.outbound.protection.outlook.com
 [52.103.67.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C77CD10E234
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Mar 2025 19:36:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N3n8qf6jRX7QlsLuNmrsjdx9lJowd2tgJN0Y6tfENnsDwIPzTcBSNMbwfylMKVf0cwopzNXCAB6pxKpB4mIqMe0ZhIJjMfXxu2AN3Em3akHxI1ydFIYZxGHCBCe8yMoISHBkIylGGTbhYiBngOKaf5CpK/lJIjJorZboiCphH0TRfx7BNV8ydPErrS+S4oyN4khvdAVUg0iwD6pVvlaqU+o1h18fGuPNrRIk8zfqaUn94QBT8VfKKqygz7nD5LR0n3PBXmzL/gH1xRpeFGXku56Hrv50I8nPDqzkJqhxUufZIcvzkhgpUhp4DG/MHodErw4PSQx3WJtQAEUdvpFmWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zNEx6Ei7wxWhFyq/tZ2Cq4JqttISZvuZAWqviOZrOKg=;
 b=y3pPljj+AjJgUlssA9N2eDXZWMo83Iwl7H8zIz1q6ntqV+cLy7LRvkqudSWteM8FnkqqTQmF4K+ve7Sov180ICoPmRu3ZQ0amBqOeGNO0NfYwNiZ0gOVGuE7lakdKooy/FMKpTEt4e2jfrp+IE4KjLu+qVxCPR9CLqZpPWjn6erZY3W0fKG41ij0Vn3c5g+QND105Sk7zbrq5LI8/lqgsmKYf/Ryly1qtxwpL3WaI7g4cJpd45xWmpTHdfiWkXi9ozOoZ6rWrXrVbQne81DQvF8doDhpjlkw9rnmCHzoIuqfoObA515ZTWqnhFBelAGuYwNmcxld7u9yT8MpC7DInQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zNEx6Ei7wxWhFyq/tZ2Cq4JqttISZvuZAWqviOZrOKg=;
 b=UyNI9KfOB5TioXlNUTfyvYej/jtS+8KlMOom8eAvh5/rdml8EjhusQ2Na5N2Ixl7+4PsvY5uUFz/ky+A4vXGLRmQOaJsvEcgnzkgWb9jcp1qRiz0TcOsD//ZaoRlfpMfu4dlQv0rknCKUpytPxrkWyMYGv7ieupByNFNEfGt+Wly5kphY0+ko0UYeP82r9//6LMTyx6QGPyboXed4KonTDhq+HpKzmVvHG/i6ChddJCtqhunM3V/SO1rTCMqoLsuPgniKyGYuhfg7axtu5ZV3XRxZjmPcb1cHILE+c2cyljBiLG7EuUQtyBRlpTL4hdDwns+UQ/l7XipAyVnx0/UsQ==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by PN0PR01MB10206.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:1ea::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Wed, 12 Mar
 2025 19:35:54 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%7]) with mapi id 15.20.8511.026; Wed, 12 Mar 2025
 19:35:54 +0000
From: Aditya Garg <gargaditya08@live.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: Sven Peter <sven@svenpeter.dev>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Aun-Ali Zaidi <admin@kodeit.net>, Maxime Ripard <mripard@kernel.org>,
 "airlied@redhat.com" <airlied@redhat.com>, Simona Vetter <simona@ffwll.ch>,
 Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>, Rasmus
 Villemoes <linux@rasmusvillemoes.dk>, Sergey Senozhatsky
 <senozhatsky@chromium.org>, Jonathan Corbet <corbet@lwn.net>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "apw@canonical.com"
 <apw@canonical.com>, "joe@perches.com" <joe@perches.com>,
 "dwaipayanray1@gmail.com" <dwaipayanray1@gmail.com>,
 "lukas.bulwahn@gmail.com" <lukas.bulwahn@gmail.com>, Linux Kernel Mailing
 List <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-doc@vger.kernel.org"
 <linux-doc@vger.kernel.org>, Hector Martin <marcan@marcan.st>,
 "asahi@lists.linux.dev" <asahi@lists.linux.dev>
Subject: Re: [PATCH 1/2] lib/vsprintf: Add support for generic FourCCs by
 extending %p4cc
Thread-Topic: [PATCH 1/2] lib/vsprintf: Add support for generic FourCCs by
 extending %p4cc
Thread-Index: AQHbky3sGKkFjHx1MkmFN9rVUAvYHLNvYl0AgAAA5jqAAAKdAIAAAT1vgAA66ACAAD2b+IAAA9kAgAACGTE=
Date: Wed, 12 Mar 2025 19:35:54 +0000
Message-ID: <PN3PR01MB959786A68923B2D471C129E6B8D02@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
References: <ABAEA9D0-97CB-4ADD-9606-A12D5815335A@live.com>
 <376C9BD3-2F41-4511-BE52-1B8468FE2CB3@live.com>
 <b74df4b5-ecda-45ba-a98a-c84b0a29e380@suse.de>
 <PN3PR01MB9597AC6A02B0BF873920D94CB8D02@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <9092a9ed-aecf-40bd-9d15-b53d60d035b5@suse.de>
 <PN3PR01MB959715C19BCEA54426D24934B8D02@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <ff3a9c58-5c7a-4c48-8a9e-cc828a43baed@app.fastmail.com>
 <PN3PR01MB9597E5C609290DB1A967263CB8D02@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <Z9HgVn-XELC065w0@smile.fi.intel.com>
In-Reply-To: <Z9HgVn-XELC065w0@smile.fi.intel.com>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3PR01MB9597:EE_|PN0PR01MB10206:EE_
x-ms-office365-filtering-correlation-id: 32284111-6112-4c87-537b-08dd619d1a99
x-microsoft-antispam: BCL:0;
 ARA:14566002|461199028|8062599003|15080799006|6072599003|7092599003|19110799003|8060799006|102099032|440099028|3412199025;
x-microsoft-antispam-message-info: =?utf-8?B?V2o3dUpYREpPVDBFUWFxNDlEc09Hd0dXZS9SYVg0cU9MbkYvd240TzNSZXNo?=
 =?utf-8?B?dlcxd0I1RHJveDdJZmZaZjhlM3dsbTRSbTA5S0lieHJIdXdVaE1nM00wTXdG?=
 =?utf-8?B?SWdmTXdSREV3aEdwQnVQMWxHSW9nTG01ZG1FSU5GOGNTQVJpVTBaSk5HSjM0?=
 =?utf-8?B?bSs5QnBsOTQxdUovVTNJWEw3cDBDc1E4Zitxa1Z5ZG1vUTVoMFZ2blk3eTdT?=
 =?utf-8?B?LzFTK1FxcitrNnNKNGNoRDdGalJZenN3NWZoSCsvSmdpeFUwTFlKcTFLV0ho?=
 =?utf-8?B?dzZPYldyQ1Y0c2FKUDMxSm0xWllLcmJFRFltaU82YnpXRGNDWEpTakJPRUsw?=
 =?utf-8?B?L0lkVkxheThEalZaWHk3eWFIVmVxZEJta2FoVXNHTVVFeWJJR1pMSEZ3NHR3?=
 =?utf-8?B?Y0syUVRWVERuRHVrV1VlNUVBd0MrY1AycUM2UHkvSENZakFvVUlCdWh0ZWVS?=
 =?utf-8?B?bjlpVnM3NHVuWXVWNjdzVjBtY2J5cDZIY1dKV1BnQUZOUTRuc0ZMdVJoblZX?=
 =?utf-8?B?V244VEppRHRYQUJtUmFsNzBNY0FUTSs5ekVPNGxDU0ZIOElSTWJCUzB1VFVX?=
 =?utf-8?B?L1NLZGRZdUk5KzZYRmhpR2VrdVFVdG9lQ3dmZmxYSkV4MURBNjg2QloyL05P?=
 =?utf-8?B?Sk9Ib1B6SVk0NUwvVHUvUVpoQXl5U2lyajQ0bWRLR2pScTcxTUFoNzdvakQr?=
 =?utf-8?B?UitHYVFqdVA3Wk1RS2pxMzJHNUNEalJBSWI5RkhwcFBmZ1EzWnhKMDdaaEpJ?=
 =?utf-8?B?aVhUR3FtQ2diNDJiL3JzSkU1bTNhR281UTlxdUV1RDVMQk82NGUrcEFkdmEv?=
 =?utf-8?B?THlIOEZxejlOTi84cXdmQVlDZlR0cmNoMVJmSXppeW9vTTlPWTZzc1ZMdWFx?=
 =?utf-8?B?TjJGbkl2NTJEcVROcm9vRlRwL28wOXhjV202THNpQlhvNlV2aXNIcmdSbDJO?=
 =?utf-8?B?L3FNSFJRelJlSDF2U0ZJbVlqc0lJY3BqcU9UblR5QkR4ODJRblRkYVBId1cw?=
 =?utf-8?B?b3hYQmtRZFUyWnFVajFDU2w5a3hMMnhPK1VTaFd5UnB2QmtaR0YrU0FHQTR5?=
 =?utf-8?B?b3owaHM1N25tMDZ5RUY3SVlQTEYySXF0N1JtdWc2ejZSWlZyYVZFZXhuZ3R5?=
 =?utf-8?B?T3V6QzBHaXREU0E4OUprZ2w3elNVUnVqM0VwYkpTOUQvMVdDL3RNNEthM016?=
 =?utf-8?B?K2hyZWI4UHZaa3A2Tm1CRU1FN2xDRDV4RUpacFZSZGdNelhGT0lFcXJYKzFp?=
 =?utf-8?B?ak53eldSeVRHTWxFTjJGQXorOGtEZUk0ZlF4MTI4RVpRWTVNbE1OVzBFbHdx?=
 =?utf-8?B?aGpObEVMSUt3VGFTdXdzbDVVcjJ1d2QwQ3VEZnRkWjhUeFhGUjVlbStHazRD?=
 =?utf-8?B?cmFvN1piMkduYlNXZ1FLUmhDWFZGU1p5ODVRa3JxZ3J6c3JzbHFiZE1HMGky?=
 =?utf-8?B?MVVPdGlna0d4L0VlanpmdVdZK3hCNUZBNjRrMVZvcnRUbHV3LzdwKzMxSVJs?=
 =?utf-8?Q?aobjOQ=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?L3RvT0szbXNyMzNRVmFjYWQyTXIybE1tTHVaYzkxc0lFV1d0NkY3cGZLUGxG?=
 =?utf-8?B?bDRUR1laUEcyOE9BTThxN0FYUFpjRDhPNDcvMlFKdmFxU0d2MEU5SnN6TEM5?=
 =?utf-8?B?T2pZT0RyVVRoMDBUUGh4RTZiUFNmY1VQWWtGd3I4cmd0TzkrZVp3YVlDSmRo?=
 =?utf-8?B?TGZkTzdvaytnL0podlpXMjZPWnVpNHdmN002bUNHbGtGelBMYWZUTWRJaGQ3?=
 =?utf-8?B?Zi9JSFhPMnoybDRRbWcvMDE0Y1lOcnVTejA4WEI1dUtxc0xSTGo4clFpK0NK?=
 =?utf-8?B?SHlwSFZrZUhCcy9FS1V6b0VpY25RRHBlb3UrOWpHRXBSZHNyZzVhQ0E5bElQ?=
 =?utf-8?B?M3dlQnBsc3MzTnV3ZFkzY2NmTThnSHE5WWR0bnBaVHp4UDU1VmhLN3JVcGVr?=
 =?utf-8?B?OU5Id1V5bkZtSlJNRkVpR0U2dkZlQ2szWEI1YVpobHI0c3plb0JQRmJCN1lT?=
 =?utf-8?B?a2owWWFFZ3hvK2FrS3dKR2pvL05CY01FeVZyVHlHUk8yQkd6MDJ2dzQrNGJw?=
 =?utf-8?B?UnVoRDNRamo3M25JS1JuZWhHWHNJNElUeEMwZ3RIRnBtSnpVVTk0MWlwQXZy?=
 =?utf-8?B?cGphTmZ2c2piMFJWQTJIdjYxb2wrR0NOSGdhMGo5amcrcEVucGVGdWlHSDB2?=
 =?utf-8?B?RFp5b0UzUmw3L0orSmV0QnRNeDlXeGNGbkJuNmpRem15QlNSVVh0RFhMUEU3?=
 =?utf-8?B?V2tkUEc5N3ZWTWtFNDd5dHIxSUlyQ3VISXF6Q3REdGxkS20xOW5ucjgyOW1O?=
 =?utf-8?B?bEVLVW11UjhaTzdPZjJ2cVg0b214TU9kcVpMV3QrU3RILzJRUGhiN3NTdDN4?=
 =?utf-8?B?YzhiNkI3L3JwQ0oyRVBHSkhCQVl5Umk2a1lVaDhhTTlNTWdnZVVXS1lmOGZR?=
 =?utf-8?B?RUQwZEJKOEluRDhMQ2NzVHRQazRuM1BBRDAxeDlNL3ZEb3ZQTDFZcjdnWWlh?=
 =?utf-8?B?bW0zU2N6eWtNWkFtQkl0dFpkT2dvbzljVFc5RGFUVk5EM3BZUjRPZmFtRVRh?=
 =?utf-8?B?TTJmMGNYY1FIZ09LU0tVZThab3cwd1IrN3NSME1idVFUVlg4TlVJMUdOaVcy?=
 =?utf-8?B?WE9USXllbEN4Q095b3JNM2RpYlFoL3J6VmpxNnJxMHJ5eHZPc1FOUTN0SytH?=
 =?utf-8?B?VStYVTh3Q1pSMlBGclBWREh4dHdNMjFQL1VHREduK1FLNnNrT1lWSE0xZnRo?=
 =?utf-8?B?cnl4cFQ4a2xDbkY2OUJTZWhsYWMvT0h4OXQvdWxSMWl4YU1ld2l1NG5zdFV4?=
 =?utf-8?B?Z0FqclMzNDgxUjB6RDJ0WG9UVEJBYVVqRS9pVWhHbUVGN2x6ZDl3SEp1b1Fu?=
 =?utf-8?B?ZzNPakNMUG1yK1dTTmw4VzlRM05vcjRSdHZVTGtsQmVaa2QzdlNtSGx2bDFz?=
 =?utf-8?B?ZEx3ZU4wNXdLWmhkaFVRRjZnaUp2STFHWENXQnVTQ0FtZFZGMU01czlJWWtO?=
 =?utf-8?B?K3lRYythQ3BCRSsvRG8rR0xOTExjc0FtckFFeW5mQi9hUHpuSVdEQzRvbHhH?=
 =?utf-8?B?WUNpVEdEcjhuQnVLaUtESXl5RWVxc0VTVDhkK1dkYitQdzNPSmgwNXpZZ21h?=
 =?utf-8?B?MEhUVnZzQWgySVhvL1NUUkx5dThQbXFsamhGT3QvSjVXV3U2NnZXS3dDdFhD?=
 =?utf-8?Q?Gr/KCVky+qyxTTFRTKpJmTm5MfFd6JIkw1Aw6mloXsmI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 32284111-6112-4c87-537b-08dd619d1a99
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Mar 2025 19:35:54.0474 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0PR01MB10206
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

DQoNCj4gT24gMTMgTWFyIDIwMjUsIGF0IDEyOjU44oCvQU0sIEFuZHkgU2hldmNoZW5rbyA8YW5k
cml5LnNoZXZjaGVua29AbGludXguaW50ZWwuY29tPiB3cm90ZToNCj4gDQo+IO+7v09uIFdlZCwg
TWFyIDEyLCAyMDI1IGF0IDA3OjE0OjM2UE0gKzAwMDAsIEFkaXR5YSBHYXJnIHdyb3RlOg0KPj4+
PiBPbiAxMiBNYXIgMjAyNSwgYXQgOTowNeKAr1BNLCBTdmVuIFBldGVyIDxzdmVuQHN2ZW5wZXRl
ci5kZXY+IHdyb3RlOg0KPj4+IE9uIFdlZCwgTWFyIDEyLCAyMDI1LCBhdCAxMzowMywgQWRpdHlh
IEdhcmcgd3JvdGU6DQo+IA0KPiAuLi4NCj4gDQo+Pj4gSSBkb24ndCBoYXZlIGEgc3Ryb25nIG9w
aW5pb24gZWl0aGVyIHdheTogZm9yIFNNQyBJIGp1c3QgbmVlZCB0byBwcmludA0KPj4+IEZvdXJD
QyBrZXlzIGZvciBkZWJ1Z2dpbmcgLyBpbmZvcm1hdGlvbiBpbiBhIGZldyBwbGFjZXMuDQo+Pj4g
DQo+Pj4gSSdtIHByZXBhcmluZyB0aGUgU01DIGRyaXZlciBmb3IgdXBzdHJlYW1pbmcgYWdhaW4g
KGFmdGVyIGEgdHdvIHllYXIgZGVsYXkgOi0oKQ0KPj4+IGFuZCB3YXMganVzdCBnb2luZyB0byB1
c2UgbWFjcm9zIHRvIHByaW50IHRoZSBTTUMgRm91ckNDIGtleXMgc2ltaWxhciB0bw0KPj4+IERS
TV9NT0RFX0ZNVC9EUk1fTU9ERV9BUkcgZm9yIG5vdyB0byBrZWVwIHRoZSBzZXJpZXMgc21hbGxl
ciBhbmQgcmV2aXNpdA0KPj4+IHRoZSB0b3BpYyBsYXRlci4NCj4+PiANCj4+PiBSaWdodCBub3cg
SSBoYXZlIHRoZXNlIGluIG15IGxvY2FsIHRyZWUgKG9ubHkgY29tcGlsZSB0ZXN0ZWQgc28gZmFy
KToNCj4+PiANCj4+PiAjZGVmaW5lIFNNQ19LRVlfRk1UICIlYyVjJWMlYyAoMHglMDh4KSINCj4+
PiAjZGVmaW5lIFNNQ19LRVlfQVJHKGspIChrKT4+MjQsIChrKT4+MTYsIChrKT4+OCwgKGspLCAo
aykNCj4+IA0KPj4gVGhhdCBzZWVtcyB0byBiZSBhIG5pY2UgYWx0ZXJuYXRpdmUsIHdoaWNoIEkg
Z3Vlc3MgVGhvbWFzIHdhcyBhbHNvIHN1Z2dlc3RpbmcuDQo+IA0KPiBJIGRvbid0IHRoaW5rIGl0
J3MgIm5pY2UiLiBFYWNoIG9mIHRoZSBhcHByb2FjaGVzIGhhcyBwcm9zIGFuZCBjb25zLg0KDQpJ
IHdvdWxkIHByZWZlciB2c3ByaW50ZiwgYnV0IGlmIGl0J3Mgbm90IHRoZXJlLCB0aGF0IHJlbWFp
bnMgYXMgbmljZSByaWdodD8NCg0KPiBZb3UgY2FuIHN0YXJ0IGZyb20gYmxvYXQtby1tZXRlciBo
ZXJlIGFuZCBjb21wYXJlIGl0IHdpdGggeW91ciAlcCBleHRlbnNpb24uDQo+IA0KPiBBbHNvLCBj
YW4geW91IHNob3cgdGhlIGJsb2F0LW8tbWV0ZXIgb3V0cHV0IGZvciB0aGUgdnNwcmludGYuYz8N
Cg0KdnNwcmludGYgaXNuJ3QgYSBrZXJuZWwgbW9kdWxlLCBpcyBpdD8gSSdsbCBoYXZlIHRvIGNv
bXBpbGUgYSBuZXcga2VybmVsIEkgZ3Vlc3MuDQo+IA0KPj4+IHdoaWNoIGFyZSB0aGVuIHVzZWQg
bGlrZSB0aGlzOg0KPj4+IA0KPj4+ICAgZGV2X2luZm8oZGV2LA0KPj4+ICAgICAgICJJbml0aWFs
aXplZCAoJWQga2V5cyAiIFNNQ19LRVlfRk1UICIgLi4gIiBTTUNfS0VZX0ZNVCAiKVxuIiwNCj4+
PiAgICAgICAgc21jLT5rZXlfY291bnQsIFNNQ19LRVlfQVJHKHNtYy0+Zmlyc3Rfa2V5KSwNCj4+
PiAgICAgICAgU01DX0tFWV9BUkcoc21jLT5sYXN0X2tleSkpOw0KPiANCj4gLS0NCj4gV2l0aCBC
ZXN0IFJlZ2FyZHMsDQo+IEFuZHkgU2hldmNoZW5rbw0KPiANCj4gDQo=
