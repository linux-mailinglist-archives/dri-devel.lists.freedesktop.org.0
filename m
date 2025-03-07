Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EC15A56384
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 10:20:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 926B810EB17;
	Fri,  7 Mar 2025 09:20:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="Utay9hWK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MA0PR01CU012.outbound.protection.outlook.com
 (mail-southindiaazolkn19011024.outbound.protection.outlook.com
 [52.103.67.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6191A10EB17
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Mar 2025 09:19:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sIUhjlkVYzwrwTljoGnnJMZz1D0kBNrXypIGWLwkzEvNeTOLxQXlSQ8JAw+SuJ154eb9h7tDUKMEvW1ptwskrPn4Q093xLwEEL355mSNmcg5gQdIg7MXkne/NXQ+OkfwAsBTJHVeYWd1dfsWcqt0TvVZ5HUfalxsefgGR0AEPaqhU7m69glLYfeq+R6kIzUS7YDXLk5BGbPj14isA0xYdDEm6TmXwUpSWWQQkEOVJaUuWFa+z2z7xqY0hGk+Ezefq1A/TUP3P0sIb+HcXw9noeLYWWzfiOlrkdhVhRdWX3Nr86L/tGQ7oVGCrontEwfLNSZhtaU54Nq5dKbE5u9WFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7+gf5XIPqIYnVWq38GhBtTsGXhm7V6bVKrXUUnuUQ/M=;
 b=B3bghMTGEaX54Mri9QGGfyITlpfPtgHhqQ9/JvEiPk+UTybJ+UhqJkV0pjo170RVeNdTq0VQfwyBCLtuIIJJd+Sc41+TARXrCx5KcZuQrXNZKEXrFjqQLLBTFFCXo75qyfrA4yT1GAyBaXY2d6V1b2lGk3xZK0hPe9H/w9EXsYd4T0c2A+pEFmE2TFq5CGxsTAHTZW79eaZWwnGpb3zeCQSNLMfchjAfMmZx9erX6vtGzSQcJxwZHtCdPI7gv/tNOrQbfygcCjrAxuwr9k8abfKnSS8d6oIBj6lo3PuDtjitvgr6c6eU+Mvxa2DGjmd7Ripl6vQGopi3s73W0Aq4pA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7+gf5XIPqIYnVWq38GhBtTsGXhm7V6bVKrXUUnuUQ/M=;
 b=Utay9hWKcrt2zJy1moxuSYnx6qnR7jxeXREhkiUfWjvt8iX0r7u5ZfHm+6T/YpKgceCL+0710M2RhPQ6FCodIKDKEaI5i2SZ+Uo84DXEL4qlfN1liJ+Xq8CSz8BujhkI8/igWDiENIgXueY2bzdYDc/d4h/tjGLjduf4F7GWAKsQTs4pSk9UKHSJDAJmKyK7m4rezLtZXoIV+YtMQMdYgf3QFpnL2/zsMbUSIn9WQAE8LPvdsgNSd0DQW1lATwNnaEs/mjxmDT+yYDUY6WQtt7I5LhzyKoJe+RCQDwB3qkxtP5l2JBqD49HJnOUMMT6WOgFAUysuuP9rj/NqZTEr9A==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by PN0PR01MB9512.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:109::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.22; Fri, 7 Mar
 2025 09:19:53 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%7]) with mapi id 15.20.8511.019; Fri, 7 Mar 2025
 09:19:53 +0000
From: Aditya Garg <gargaditya08@live.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
CC: "admin@kodeit.net" <admin@kodeit.net>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH] drm/appletbdrm: Fix ref-counting on dmadev
Thread-Topic: [PATCH] drm/appletbdrm: Fix ref-counting on dmadev
Thread-Index: AQHbjzycBjhi2DDmUkSWQmlMoWMhfLNnZKMAgAAAo4CAAABeAA==
Date: Fri, 7 Mar 2025 09:19:53 +0000
Message-ID: <F3864956-8202-415D-A0BA-6295DC485EB1@live.com>
References: <20250307083702.142675-1-tzimmermann@suse.de>
 <7BE9C1E3-5580-4267-8EF9-2A66D6D85641@live.com>
 <5269d2b2-5ca8-45b9-bc23-3714c60e1a82@suse.de>
In-Reply-To: <5269d2b2-5ca8-45b9-bc23-3714c60e1a82@suse.de>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3PR01MB9597:EE_|PN0PR01MB9512:EE_
x-ms-office365-filtering-correlation-id: f144321d-5185-4424-aa4e-08dd5d59387f
x-ms-exchange-slblob-mailprops: laRBL560oLQowKaVx7aWRf9b2EXVRKJlJu++dwYyIBgCeyksfKW1bjZDiWQRyJZ7M2rckSObNrWWHdsFWBEbbRsMinCWgSlvD0Zkhe4PIqCaq5hxVUdszWPl2t9BG1DP6nlsfSka2Fom+btroD5Mo4poH4ERh7B9FEco4ZTQxYYcg5rexBacNEXDHglzjlge2kkk1h16XIyZ5mCQtEZKqlH3GiWNooUt7oMfY98DbW5y++XEBGQ30+9+0/34LbNn8eqLtYduTcmwLEuvvnjowtFEHf/81q+zoUZES6IkFIJMvsHHVWYUyUqsnyOlF/3CRRpIpiWTpx4z68RHma8uG00pGT5HpFj1MgM/bYgGJH0lnq88y1NCh6s7ZdJcio7qf6CclOviXUjTOVDizTPcluy6bzjUNBjwJ28pEj2gTewb9CiFx4VegmvEY77ogteWiAPBgsvBxrM57bPJzL9DLoReOvrDPNQAOkKfDy+CUk0iutbkkqBjquLLIU9HF2ZdzZRFs9prkF2tvnfHsmhIezHDgqYBAKxbx40FJT83UjQHXcQFcScDEVOVTQ3nY8r39BUHGLKcSl+jljzKvQg7Y9Ix05PbcDL1kwusal2yiyF4EZvYHQRd57Q0wLX48LoZK25kybCMkmyUNDXYv6LDD++/mxVZ1mwaOQWsSOfwA27+DxIDt3IVqtA5LDKGadqoixV1Fbd51S1B6W/A9NlJXCy0bXzhpH+gNlqNkGJd1m/g+neH4XIl+scp9seXDWInEzsGQiv8ECw+r1LgSU1jLtbpQBuZxJD0
x-microsoft-antispam: BCL:0;
 ARA:14566002|461199028|19110799003|15080799006|7092599003|8062599003|8060799006|1602099012|3412199025|440099028|4302099013|10035399004|102099032;
x-microsoft-antispam-message-info: =?utf-8?B?TklPTktuODJKMlRGUXRBWk5YcU0zSlU3RGl4Sk9KNVI3U2tXU2d2QTh2U0pO?=
 =?utf-8?B?OEVYNlVlUzhuZk9EWlV2aFVINDFaTlZHb0gvZmYwSGUvdWdNUGN6SmpNaHBV?=
 =?utf-8?B?SlZycVJ0NVBwNWt6YmdacXh6OFBZaThUODY0eHF6L2RYUzBwNWRNc0FoZ21H?=
 =?utf-8?B?cCtyYzJOZmQrSEFIdXJOUEYyaVJGRWFzUUtVclVQaXdZVUdxeHdBTXFHWmNy?=
 =?utf-8?B?SW83Vm9CODkwSmxpakZTbkZLWC9hYUtMdU1POE9UREZkS2dzUWoyQUZlZTJo?=
 =?utf-8?B?SmFlalBuNEF6cHFOc2s0NVlITU5HbTJhK0NUanY2TUFFUU5rb05SVFFyWVRx?=
 =?utf-8?B?TU5vTElIcUNyT1VOVHNaaW1NeFErem1BSld2L1EwSktseEtualVrZDd0SlRy?=
 =?utf-8?B?QVN4UUxlRUpRSU8zVjBMd0xlVkp0WkllSkpsNTVnelVIU01NeWdGVkkycDdK?=
 =?utf-8?B?dG9nT04rd0JUcDNDMEJvUzYwMjgycWswODdLVENDU083bmFaUUdzTTVFK1da?=
 =?utf-8?B?RUpPQmUwNFo3c1h4VXg5SllpV201YzJvV3h2RXA2Y0FHRUhndEdub3p2dUJx?=
 =?utf-8?B?L2hmdjdZN2Z2SnBKVkVlWFdxY3NWdWpJYURXTk83QVE2bEEyY1FtWStRcVhC?=
 =?utf-8?B?N3pzVHZtRm1iV3Fva0pNOXBpaVgyc0lKUmhRS1ZZSElmUUcwOGlUSHRhUWlC?=
 =?utf-8?B?bTNKOERrVGg1empuUjd6UGdLek9FdlhQeWxrOTgyMi9zajdpUkY0MkJpd0p0?=
 =?utf-8?B?S0RPbktncW1QRWppUC9XbXJEZnFFYzBOVytjeHQrdTZhOVFTTW1Rb3BFaXk5?=
 =?utf-8?B?Z0ViM3hHVWJzNmhQV2tBdExqUzdoUEhRQld6dzgvSGQ3bjFUZTl1T0lCY3Zj?=
 =?utf-8?B?VGRXVnMrWE41WWdHT1FCaUhtUUx6ZGw4YlRKdUVDNXpqQVZvM2M2dlFxeFdD?=
 =?utf-8?B?QkREcXZZQ3dEa1A3WG96YlFRUVpJVFNOQzRzMWZHUFl3bWx1QW4zMmJDZnBF?=
 =?utf-8?B?b1pmcEZvY29IM3BVdjgyY3grOUtZN3V0Q1Roc25ISmdwM1BXYTBZUkdkdjBj?=
 =?utf-8?B?OVZ1T0ZscFdnTGZQTnBmU3hKTnNrRlpDVGg0NENHZFBOYXZCSWttQ282cVZ6?=
 =?utf-8?B?TkJSNGk3Mzl5NmJjMFUwNlA0VGZUeVREVmNiR0VIRFdJWVR5dVFVc3pZNE5w?=
 =?utf-8?B?YjdINElJMEFxWHZ0VGRhbjNUcHFRbmVsKzdFN3RFZnR3RGZCaTZvcExEQkNk?=
 =?utf-8?B?S3Bsb0oxUVBrdVJBbllyT1FjcUpxNmgwTWxZR1A3WmtxbEtoWDV5TWFCUDNY?=
 =?utf-8?B?bS9HdnlISjRIN3M1dVF6SmVkRTRxM2tqLzdWZG1xckRYc2NHdVNvdWw4ZVRo?=
 =?utf-8?B?U0dKbFYwMlVORTdEb2VHUkZXeE1Td2prdGlHdkdlSjFsTXhmWHJzTGNxS1ZV?=
 =?utf-8?B?ejZuK20zYTV4ODg4bGFPZW1RWk4vQnNGRUVzSCtPVmtQb3pIZ2MxMjFGRndp?=
 =?utf-8?B?MkI1VEhMUlVJSzhCRE1QTURWUjN4UGduWDRMTmNOMjJZTWZzSFRKVHloWjZU?=
 =?utf-8?Q?jMYEbYYwZZdR8ZoDJJryFypwanBIrbObeNWG6FitGX8A3u?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cHJobDRuY2Q1S0xjdUZPSUhXQlNITzVEbEk1TngvRHVrRitvOTFncEY3b2s0?=
 =?utf-8?B?Um0xQ3RnOFJLdHc4K0ZRWG11dzh0VzNZRTRPUjIxL3crQ1pkVjJmY0ZFdTZt?=
 =?utf-8?B?OU1YNllxSU9yMlpTZXd1aUhSRVRLRSttaDQ1SnArbTd3WE9yM2NVakpNbXhG?=
 =?utf-8?B?eWxhRnA4N3FSbjJxa3B0bm03QWQrVjBZQ29rZjJFWGxsbmU4ME9Xa1l1V2xu?=
 =?utf-8?B?SnJZU1I5TDJPTjg3elRFNGJ2NTBnNzlvYUlxNjRDc1dEYm1qRHJvdEhsZFJD?=
 =?utf-8?B?cUh4S1JvV0JrMXZMZ2ROMVpJdkx1MnNtUVFSRDR4UGtuTmZpZllDN1Z2cGVS?=
 =?utf-8?B?WjFHNTN1RitZaGo5dTVOQUtDT3o4QVVpb0s4dWF3bVhudVlvcWlVUC8wTjFX?=
 =?utf-8?B?R2I3QVJrTVl5cjRlYzI1QVM5MWtWZlFncjRZVUdUK1p4Y3Nmb0hFMDJQRE1r?=
 =?utf-8?B?ZWdjbDVvclFqL0kxdFB6MENvVnZ4TmxkK2pNV2NYMDZxRlg3cFU4dmVNS0Qy?=
 =?utf-8?B?RVFRZzZlNUgxSXFzVlA5NDYwb04yKzBtbmJzQUxldHZRRzJEVVg2Q0dUdWRR?=
 =?utf-8?B?Q0c4NVVnSXpITWZwUzFxMm9waHJkMXk0cjVGVVJTem5XU0src2RlMENUa3Fw?=
 =?utf-8?B?TkJ5OE5ZOEE1SUlyNkJZcnpTVlJYTUJTdFVLOElYOStXZDl4aVJVcjdTd09C?=
 =?utf-8?B?Vys0OTZGQUo4QXRYOG9aL3poMDJwbnl2eVdENEpDakhac0ZjRHU1M29TME1F?=
 =?utf-8?B?T280OExZRGJkZkNGMnYwdndyZ0Q2R1NCSWlCa3dRcmFBc2NSaENBTWhYRFhu?=
 =?utf-8?B?Y1BhQ1hYYUcrT2g1MlpoRGZFWDduUXZCR3JMSFNqaCsyNUplaVljTGYvdVRv?=
 =?utf-8?B?YnBqa2c2bms1N3B6a1FFQmpLZGlueXZ4bTB1QVJFajJVSmllVGJTZ01vR244?=
 =?utf-8?B?WlBnUmdRbXVtblpPNGdsaU9oMGZNQVNoTDVrbnZJQWJLN1pQZ2ppOThNZjJB?=
 =?utf-8?B?d1NWV2VRNUhhU2d6b2E3dkNnZS9OYTB1bGNNc2xST3NGNjB0Nmp0WmFGdDFK?=
 =?utf-8?B?d2JKQWdJbUNlbFF5WWZFLzMzVUFReCtLSTdydjVGM3d0TWtXT3MyWDVEblVq?=
 =?utf-8?B?dWtGRXk3RG5KbnMyMmhidlpNMzBqQVZQR3BuOVJTSGd2eGtvOXhXQ1JnR3J5?=
 =?utf-8?B?Ujl5VGZ2cTNVK29wQitGMElQUFhXUUdqWDdqcWxSVnBheGZkZVcxMVg2S0x2?=
 =?utf-8?B?R0U1Qzl1ZnAxZUdQSUxWamp2aUFxQ1I2dXFQbHh0WFQzZys3U2h6cERhaXFv?=
 =?utf-8?B?cWRReUxoSm5PaWpUa3A2R3R6VmFqTHVnMXVlaG40ME80Vk14NU1RbDBkdUFW?=
 =?utf-8?B?dWx2dDR6WGRFd2ZUeDY3Q0tKUFhmNEtna1VBbmlyeC95SW92OVpsWWxpSFJt?=
 =?utf-8?B?YVE3QzRDMHFxUmx3RiszcVd4Z1cyQ3JTVHFJdDExUXdHVmh6WXdWZVUyWW42?=
 =?utf-8?B?cGs1SVVjMExoakRhNERCZTBPMkFsZkd2V3dTSGVLbnN4dG5KZC9sNXEzSGVZ?=
 =?utf-8?B?cUJKWnJBb1VKUHRWNGVBcitsamc2dnhuR3lsdzZtb0tBM2p2MkZQVFppTU1z?=
 =?utf-8?B?RnFGTDlabUZOOWV6bFJHUDh2aGJ2RVhJWmNjT0hWbXdmNE1CbktYOVNzSU1x?=
 =?utf-8?B?UXZSVmQyaHovd09wdi9EeG1IdTQvSkduaGlseUJ2MExFdkM3ZGEzNkRMQ3Iv?=
 =?utf-8?Q?JYqbUIkxqkkbF/lni3YeXwSIUymMrm7Nl06qHG6?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <74777C792AC72B4C9A1A573DB399E71F@INDPRD01.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: f144321d-5185-4424-aa4e-08dd5d59387f
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Mar 2025 09:19:53.7654 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0PR01MB9512
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

DQoNCj4gT24gNyBNYXIgMjAyNSwgYXQgMjo0OOKAr1BNLCBUaG9tYXMgWmltbWVybWFubiA8dHpp
bW1lcm1hbm5Ac3VzZS5kZT4gd3JvdGU6DQo+IA0KPiBIaQ0KPiANCj4gQW0gMDcuMDMuMjUgdW0g
MTA6MTYgc2NocmllYiBBZGl0eWEgR2FyZzoNCj4+IEhpIFRob21hcw0KPj4gDQo+Pj4gT24gNyBN
YXIgMjAyNSwgYXQgMjowNuKAr1BNLCBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3Vz
ZS5kZT4gd3JvdGU6DQo+Pj4gDQo+Pj4gUmVtb3ZlIHRoZSBwdXRfZGV2aWNlKCkgY2FsbCBvbiBk
bWFkZXYuIFRoZSBkcml2ZXIgc2V0cyB0aGUgZmllbGQNCj4+PiB3aXRob3V0IGdldHRpbmcgYSBy
ZWZlcmVuY2UsIHNvIGl0IHNob3VsZG4ndCBwdXQgYSByZWZlcmVuY2UgZWl0aGVyLg0KPj4+IFRo
ZSBkbWFkZXYgZmllbGQgcG9pbnRzIHRvIHRoZSByZWd1bGFyIFVTQiBkZXZpY2UgZm9yIHdoaWNo
IERSTQ0KPj4+IG1haW50YWlucyBhIHJlZmVyZW5jZSBpbnRlcm5hbGx5LiBIZW5jZSBkbWFkZXYg
d2lsbCBub3QgYmVjb21lIGRhbmdsaW5nDQo+Pj4gZHVyaW5nIHRoZSBEUk0gZGV2aWNlJ3MgbGlm
ZXRpbWUuDQo+Pj4gDQo+Pj4gU2lnbmVkLW9mZi1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1t
ZXJtYW5uQHN1c2UuZGU+DQo+Pj4gRml4ZXM6IDA2NzBjMmY1NmU0NSAoImRybS90aW55OiBhZGQg
ZHJpdmVyIGZvciBBcHBsZSBUb3VjaCBCYXJzIGluIHg4NiBNYWNzIikNCj4+PiBDYzogQWRpdHlh
IEdhcmcgPGdhcmdhZGl0eWEwOEBsaXZlLmNvbT4NCj4+PiBDYzogQXVuLUFsaSBaYWlkaSA8YWRt
aW5Aa29kZWl0Lm5ldD4NCj4+PiBDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0K
Pj4+IC0tLQ0KPj4+IGRyaXZlcnMvZ3B1L2RybS90aW55L2FwcGxldGJkcm0uYyB8IDEgLQ0KPj4+
IDEgZmlsZSBjaGFuZ2VkLCAxIGRlbGV0aW9uKC0pDQo+Pj4gDQo+PiBBcmVu4oCZdCB3ZSBkb2lu
ZyB0aGUgc2FtZSBvdmVyIGhlcmU6DQo+PiANCj4+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2Ry
aS1kZXZlbC8yMDI1MDMwNzA4MDgzNi40Mjg0OC0zLXR6aW1tZXJtYW5uQHN1c2UuZGUvVC8jdQ0K
PiANCj4gWWVhaC4gVGhhdCBzZXJpZXMgaXMgYSBmdWxsIHJld29yayBvZiB0aGUgZG1hX2RldiBo
YW5kbGluZyBmb3IgYWxsIGRyaXZlcnMuIFRoYXQgd29uJ3QgbWFrZSBpdCBpbnRvIHY2LjE1LiBU
aGUgcGF0Y2ggaGVyZSBpcyBhIHF1aWNrIGZpeCB0aGF0IHdlIGNhbiBsYW5kIGltbWVkaWF0ZWx5
Lg0KDQpJIHNlZS4NCg0KQWNrZWQtYnk6IEFkaXR5YSBHYXJnIDxnYXJnYWRpdHlhMDhAbGl2ZS5j
b20+DQoNCj4gDQo+IEJlc3QgcmVnYXJkcw0KPiBUaG9tYXMNCj4gDQo+PiANCj4gDQo+IC0tIA0K
PiAtLQ0KPiBUaG9tYXMgWmltbWVybWFubg0KPiBHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQo+
IFNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KPiBGcmFua2Vuc3RyYXNzZSAx
NDYsIDkwNDYxIE51ZXJuYmVyZywgR2VybWFueQ0KPiBHRjogSXZvIFRvdGV2LCBBbmRyZXcgTXll
cnMsIEFuZHJldyBNY0RvbmFsZCwgQm91ZGllbiBNb2VybWFuDQo+IEhSQiAzNjgwOSAoQUcgTnVl
cm5iZXJnKQ0KPiANCg0K
