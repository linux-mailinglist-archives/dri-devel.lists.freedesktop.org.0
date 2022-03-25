Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 18B1D4E7A26
	for <lists+dri-devel@lfdr.de>; Fri, 25 Mar 2022 19:01:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD27710E766;
	Fri, 25 Mar 2022 18:01:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2064.outbound.protection.outlook.com [40.107.21.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0404110E766
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Mar 2022 18:01:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hhgkUEDLFT0JwjjxlopEAqvxNjj1d1GTOc0aS+DkH+pYS3H6sCIbESX84bFf8blA4WGWupQFkCc0tgmGxZMJsQX8Af6TgpNXT1PoeLDvX5WkC+ZNUi/pgkG9CxN2Ig5rZbdnZSLT0wQQoSA5DXGHzY4/FSkv6LJo5bGFYq/P20gAgeQllRiMze9UYJeGnZP0Th/pxyR0MbrCqKEIDIFYirrxSBLLgonv+I3qD2rfcdKIUm0X4zd6iZ69zZmgKQH+WIErHyG9SChdkfVU4SMtOeZnlCnEkoI3nYGZ7e3rpNKnA1VJ2aWTY0gkjHQcaV91BBj2Mz0/m1s1kgAbv69ULg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uuo1zVcLO6qnNvqnWO2cJrfH7oiZRRdbkWDItyuumt4=;
 b=k/ZB+leWb7bXjs5m+9u8Aru5DCIlTgpYGDDMhU3S0b8nZqdLshZCBRE0Mp9EgcF810lGmugDPbpn1YnFjJIx0CDgAW41SHyftZMa/CWCrF2C0qNG02/3V8Nd2UfYLway3HrqoUk1bjpzEyw6vThcG53Vp5UONewG3ThEmP64SgjAHSGhJcbK29RS5Rjk1GTaFg/cVvNM+1cEKEQXNLbXB/X56UbtbzFASuN7Jh3mu4EUd35MaFebDdIpVLjBDhzbUh6jIwkfPUrpSDGinsn2PDKm1l+OIJ/bhBqvYhbETMNAjHPIJvqzThM7ypoNVPoS2RU0Pd+7+LRK0Uc2XgqnnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=de.bosch.com; dmarc=pass action=none header.from=de.bosch.com;
 dkim=pass header.d=de.bosch.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uuo1zVcLO6qnNvqnWO2cJrfH7oiZRRdbkWDItyuumt4=;
 b=CHsz9+Gs/txaxrd6AgSwb2vB+yLtrr1tJ/eqNu5suAX7J4i9e5ANpA7+7z26J9Cx14WSuiwC3Gr+OZvxkup/EDp/xkXkAHLLNlGH+vFtXz3Mfn/5W6KgnA11tQkv65BVPrW1WVb4bzQsA5Qcfwc4bMzV9lUKlLjS0s4IU01srQo=
Received: from PAXPR10MB5405.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:28b::9)
 by VI1PR10MB2511.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:803:87::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.18; Fri, 25 Mar
 2022 18:01:50 +0000
Received: from PAXPR10MB5405.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::c0cf:c5:42b:c61]) by PAXPR10MB5405.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::c0cf:c5:42b:c61%9]) with mapi id 15.20.5102.017; Fri, 25 Mar 2022
 18:01:50 +0000
From: "Jonas Mark (BT-FIR/ENG1-Grb)" <Mark.Jonas@de.bosch.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: AW: [PATCH] gpu: ipu-v3: Fix dev_dbg frequency output
Thread-Topic: [PATCH] gpu: ipu-v3: Fix dev_dbg frequency output
Thread-Index: AQHYHDV1Q6HWKEJY1UC+dT9O++/HWqyWZr8AgDpEOTA=
Date: Fri, 25 Mar 2022 18:01:50 +0000
Message-ID: <PAXPR10MB54052ECFB1CDADEDD073CF0AAD1A9@PAXPR10MB5405.EURPRD10.PROD.OUTLOOK.COM>
References: <20220207151411.5009-1-mark.jonas@de.bosch.com>
 <89a08ce1cdb1cf0b4d46b916e7107eca0796ca9d.camel@pengutronix.de>
In-Reply-To: <89a08ce1cdb1cf0b4d46b916e7107eca0796ca9d.camel@pengutronix.de>
Accept-Language: en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=de.bosch.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 695b8c8a-ed84-4864-a1dd-08da0e898930
x-ms-traffictypediagnostic: VI1PR10MB2511:EE_
x-microsoft-antispam-prvs: <VI1PR10MB2511BA503D29420285279576AD1A9@VI1PR10MB2511.EURPRD10.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ufeZQ/0SZ0OTbhD0wh0kY2Td5if5U8zoElm3xyKAGHSSjqCk9gwtzLleyhOsjjXNDp3KsAs6khaRVWfCZAm4u+euEcUVeDoJlCYMorrH57Nyw0dhTN2uwR75IskDiS7b/GCIkDN8G5CkkPYqXMB6GOFw6i94UxYL8oY10+KMdjvleuSZloBmVG9U/oKNdE/GMSZXs2wlpgNxqNNFKveDSZ5a3QUNNVb78IdRX3kf1We0qXK60FFs9Ah/o9S4QcGIDlXZlwvVPvHXn0Wcr5QOlNwla6vpyt6zctcSf40TFSNeeE5epZJVPWXOvbaqQNQZoYso1UPT6frC9QpLL+9jSoy0qnnogYNZS8wsF9Ewfldv4DmAg0+yo1yzO298+jLu7930V9NdiPUaOrku12vlfy/UdflKC8NS3S8eupIcj7u2vOIauLS7ld1r2q/MNKUYwWmhDiNK2/yp4PV15t8j4I7txlHZDP7S7Tam4RreffqNVprslP6hvZ317qipVom5gsJh9DkbKZ91rl14iiLuUcyAAdrRvPMQqQrewNJzfQBMgtTUoGwYQlkpH7tINbb5RCUFJHIO+Og7U/wmOLD8eF61rRgmiJ8zNE1ebxGHAty62Ayby3vblS/q9CI4d6cpc0uqUj0CkW2jCyn6JPePIMLNGgztlEYheucpgXPM7/lczWJ84ItsnSkxXX9kLzyRhUfGZLzThYOle6ArUGB3vg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR10MB5405.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(66476007)(66946007)(83380400001)(66556008)(8936002)(8676002)(52536014)(4326008)(76116006)(316002)(64756008)(55016003)(186003)(26005)(9686003)(6506007)(82960400001)(508600001)(7696005)(71200400001)(2906002)(107886003)(66446008)(33656002)(38070700005)(122000001)(86362001)(110136005)(5660300002)(54906003)(38100700002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bWdqUTRHSnZyalVIVUNnMUxwT0RYYzloMnJENktiSTdGTHhKVHpkTEJnZEhO?=
 =?utf-8?B?Zlh4a1U0bENTUGlzQXlhejZRMno4WTJtUWtydlpnK3prL3RtUGpsMU0xdElZ?=
 =?utf-8?B?QkhvZFB6VjdnREpFb3NCTmJKMzRaMWxsU0tzSDRxemJXVnVCN1cvbjQza204?=
 =?utf-8?B?ejBqUG90S2xZbUorb2E3WjNwbmkxOG5ZRVNsZHptZXFkbVZWSWxCOEtqY3lG?=
 =?utf-8?B?NzNTc21XZk1iNHorMFFOQVorMjJmZ3l4T2RaM1VFVGpNd2J4M2c5UjViNUNI?=
 =?utf-8?B?N2hvWktvWCtDaVBXZ2huRDF5WSt0UENxbkNXcDlvS252Y2JITG9ZQjd2NjBI?=
 =?utf-8?B?aGpqaXQrdVA2VkZVTWlxZjVyMjdmZXRUZDFPMkxpc29IcVRXOVMzOEx4RTlU?=
 =?utf-8?B?eHR3UW41cGRMNHduQnplOTlod2JJN2p3ZkVtQVpKQ0hNVTRuaDA0VFRDVERs?=
 =?utf-8?B?NEx1b0hWa05UL0l1YWpOei9iVW5jQUJ4TkFaSlN5TGkxWjJSdy9zZHVNUFRZ?=
 =?utf-8?B?WnVHalpCUmk2WlBYbElhSEp6eG5GWlAwVzlJdzZ4Ty9scE9ZVVRTS2tKZDc1?=
 =?utf-8?B?UkQ5LzZJWkVqUWRqeHJWbzVLZXVKY1pvc0hlZGVUMCtVWWpCei95TXBnY2J5?=
 =?utf-8?B?azE3Vi9ZTzc5R0tLRVNHWDJwNEc4V1dObUxrUGEwN1RCL3hvL0xuZ0htdm1C?=
 =?utf-8?B?UXJFRHE4aUVFb01KRm9Od3hUM1FPMkR4a2xucXYrb3gwWG50eDc0SEUvNkRM?=
 =?utf-8?B?NVFOVWszMnc1Z2g5dXh2VEEzanhzY2dpL09hK000SDh2YzNrOTVQdTQ2ekZl?=
 =?utf-8?B?MU40SEcrNy9HY3JmTnc0WDFmLzVJOWV3L1hjanV4aTY4TVFZSDQvM3hHd2Rs?=
 =?utf-8?B?SEJIL1Y3UDFOY1E5VU00NnJrN1dZY3dDbkVudjNsZkV6NVdUdmhNNm90R0pO?=
 =?utf-8?B?K1hoODJ4aDVKdHFjZU5nU2MwbEI1QUQwWVNxd0pNYm1ZdThoWXY1ZzU2My9j?=
 =?utf-8?B?dHFraWxhbFJOL2g5dUhZc2hrWWRDSFEvNEI4bWZaMzFFbWluaDJaYmMzTkQ2?=
 =?utf-8?B?blltNzdxZjZ6REdqdHVWcitmV3hUZ216VDc5L2Q1VFlyRjBlL0hqcHY4L1VP?=
 =?utf-8?B?cm5vaWNBSFI4bldBdDdId3ZEUzlwZ0F0dFNCOFlyRyt3WUJNdWtQUmp6M01K?=
 =?utf-8?B?RklzblVxTGpkRGE1RHF2MGhXeU5VTDliL3pPQ2R2R3docFd0N2w3VjJjZmMz?=
 =?utf-8?B?dFBNYmxEeVhSeE9kNHRsdjVrcnh2LzB1YXYzUnhjUFNwYjRjMzVpMWxQdFlS?=
 =?utf-8?B?OXlwU3ZpYzRRVDk3dGRjQXBLdVI3RGxtT00wK0wvc1RacmZkYUMvYjYwT2pP?=
 =?utf-8?B?dVpIVG1DbGViUkI3ckJWVFVyVWJXaUlCRm5ySjdwQUZzVjhPVFJvdHl0amtU?=
 =?utf-8?B?eWdVZk1IbWhTZGVsaTl3R3hSQXVGSHhWTVRocmlrQXk5dmMzYnFxTVdiTFRR?=
 =?utf-8?B?UDlnODB3aDJMREljb3N3UGp5bjdXZ0JYL0pUbkt0UTBrb29rb0lXc3BjaVpm?=
 =?utf-8?B?VEYxZEo4QytIRFgrZzV6ZlRzOThyMVNVZzJKWDYrRFl5QjVjSzRSd0Y2ek96?=
 =?utf-8?B?N1VMN1o5a1J2a1NjbVRNZWdRTm9jV1NjdGZVYnRXOW9GVmJ0VzNzWmVjampK?=
 =?utf-8?B?SElMRXpRVW9XRVFjYyt4WUsrU3l2U05WaUQvSUpKZ1MremRqNnloR01CU0Qy?=
 =?utf-8?B?K1dyZHIrdzl3R0pBRlpxbkVGb1E2RlVYMHBVL1N6SWEvU2dhc0t4SGlUYWJR?=
 =?utf-8?B?QlA2T0hnTDF5Y0UycXRwWnNpZlc3enQ1TU5lMjdEemZDSkdEazdvRm00N2ls?=
 =?utf-8?B?ZUVaUWVjeDJlcm5WWHpNUzR3cUthOGJsSnV3eWZEVGtXYkJSRWR5RVpjODU1?=
 =?utf-8?Q?J+zIHuArak0kgWN0Vh/xJA6jZmIojvTi?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR10MB5405.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 695b8c8a-ed84-4864-a1dd-08da0e898930
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2022 18:01:50.0707 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zbuxcir3zMNDhOl2kaLEQkcxuJeYuElTQ1hhgzZthRLi9ZxZ0Mbk8/qIkuVeYROaK4lTiefXJzk+C/VXwclCTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB2511
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
Cc: "Jonas Mark \(BT-FIR/ENG1-Grb\)" <Mark.Jonas@de.bosch.com>, "RUAN Tingquan
 \(BT-FIR/ENG1-Zhu\)" <Tingquan.Ruan@cn.bosch.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksDQoNCj4gPiBUaGlzIGNvbW1pdCBjb3JyZWN0cyB0aGUgcHJpbnRpbmcgb2YgdGhlIElQVSBj
bG9jayBlcnJvciBwZXJjZW50YWdlIGlmDQo+ID4gaXQgaXMgYmV0d2VlbiAtMC4xJSB0byAtMC45
JS4gRm9yIGV4YW1wbGUsIGlmIHRoZSBwaXhlbCBjbG9jaw0KPiA+IHJlcXVlc3RlZCBpcyAyNy4y
IE1IeiBidXQgb25seSAyNy4wIE1IeiBjYW4gYmUgYWNoaWV2ZWQgdGhlIGRldmlhdGlvbiBpcyAt
DQo+IDAuOCUuDQo+ID4gQnV0IHRoZSBmaXhlZCBwb2ludCBtYXRoIGhhZCBhIGZsYXcgYW5kIGNh
bGN1bGF0ZWQgZXJyb3Igb2YgMC4yJS4NCj4gPg0KPiA+IEJlZm9yZToNCj4gPiDCoCBDbG9ja3M6
IElQVSAyNzAwMDAwMDBIeiBESSAyNDcxNjY2N0h6IE5lZWRlZCAyNzIwMDAwMEh6DQo+ID4gwqAg
SVBVIGNsb2NrIGNhbiBnaXZlIDI3MDAwMDAwIHdpdGggZGl2aWRlciAxMCwgZXJyb3IgMC4yJQ0K
PiA+IMKgIFdhbnQgMjcyMDAwMDBIeiBJUFUgMjcwMDAwMDAwSHogREkgMjQ3MTY2NjdIeiB1c2lu
ZyBJUFUsDQo+IDI3MDAwMDAwSHoNCj4gPg0KPiA+IEFmdGVyOg0KPiA+IMKgIENsb2NrczogSVBV
IDI3MDAwMDAwMEh6IERJIDI0NzE2NjY3SHogTmVlZGVkIDI3MjAwMDAwSHoNCj4gPiDCoCBJUFUg
Y2xvY2sgY2FuIGdpdmUgMjcwMDAwMDAgd2l0aCBkaXZpZGVyIDEwLCBlcnJvciAtMC44JQ0KPiA+
IMKgIFdhbnQgMjcyMDAwMDBIeiBJUFUgMjcwMDAwMDAwSHogREkgMjQ3MTY2NjdIeiB1c2luZyBJ
UFUsDQo+IDI3MDAwMDAwSHoNCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IExlbyBSdWFuIDx0aW5n
cXVhbi5ydWFuQGNuLmJvc2NoLmNvbT4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBNYXJrIEpvbmFzIDxt
YXJrLmpvbmFzQGRlLmJvc2NoLmNvbT4NCj4gPiAtLS0NCj4gPiDCoGRyaXZlcnMvZ3B1L2lwdS12
My9pcHUtZGkuYyB8IDUgKysrLS0NCj4gPiDCoDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMo
KyksIDIgZGVsZXRpb25zKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvaXB1
LXYzL2lwdS1kaS5jIGIvZHJpdmVycy9ncHUvaXB1LXYzL2lwdS1kaS5jDQo+ID4gaW5kZXggYjRh
MzFkNTA2ZmNjLi43NGVjYTY4ODkxYWQgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvaXB1
LXYzL2lwdS1kaS5jDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvaXB1LXYzL2lwdS1kaS5jDQo+ID4g
QEAgLTQ1MSw4ICs0NTEsOSBAQCBzdGF0aWMgdm9pZCBpcHVfZGlfY29uZmlnX2Nsb2NrKHN0cnVj
dCBpcHVfZGkgKmRpLA0KPiA+DQo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBl
cnJvciA9IHJhdGUgLyAoc2lnLT5tb2RlLnBpeGVsY2xvY2sgLyAxMDAwKTsNCj4gPg0KPiA+IC3C
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBkZXZfZGJnKGRpLT5pcHUtPmRldiwgIsKgIElQ
VSBjbG9jayBjYW4gZ2l2ZSAlbHUgd2l0aA0KPiA+IGRpdmlkZXIgJXUsIGVycm9yICVkLiV1JSVc
biIsDQo+ID4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBy
YXRlLCBkaXYsIChzaWduZWQpKGVycm9yIC0gMTAwMCkgLyAxMCwgZXJyb3INCj4gPiAlIDEwKTsN
Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZGV2X2RiZyhkaS0+aXB1LT5kZXYs
ICLCoCBJUFUgY2xvY2sgY2FuIGdpdmUgJWx1IHdpdGgNCj4gPiArZGl2aWRlciAldSwgZXJyb3Ig
JWMlZC4lZCUlXG4iLA0KPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgcmF0ZSwgZGl2LCBlcnJvciA8IDEwMDAgPyAnLScgOiAnKycsDQo+ID4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBhYnMoZXJyb3IgLSAxMDAw
KSAvIDEwLCBhYnMoZXJyb3IgLSAxMDAwKSAlDQo+ID4gKzEwKTsNCj4gPg0KPiA+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgLyogQWxsb3cgYSAxJSBlcnJvciAqLw0KPiA+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaWYgKGVycm9yIDwgMTAxMCAmJiBlcnJvciA+PSA5
OTApIHsNCj4gDQo+IFJvdW5kaW5nIChhbHdheXMgZG93bikgaXMgc3RpbGwgYSBiaXQgdW5pbnR1
aXRpdmUsIGJ1dCB0aGlzIGNlcnRhaW5seSBpbXByb3Zlcw0KPiB0aGluZ3MuDQo+IA0KPiBSZXZp
ZXdlZC1ieTogUGhpbGlwcCBaYWJlbCA8cC56YWJlbEBwZW5ndXRyb25peC5kZT4NCg0KV2hhdCBh
cmUgdGhlIGNoYW5jZXMgb2YgZ2V0dGluZyB0aGlzIHBhdGNoIGludG8gNS4xOD8NCg0KQ2FuIEkg
ZG8gc29tZXRoaW5nIHRvIHN1cHBvcnQgdGhlIHByb2Nlc3M/DQoNCkNoZWVycywNCk1hcmsNCg==
