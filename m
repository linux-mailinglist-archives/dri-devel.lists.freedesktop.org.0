Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 551BD41D46A
	for <lists+dri-devel@lfdr.de>; Thu, 30 Sep 2021 09:19:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC4246E323;
	Thu, 30 Sep 2021 07:19:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-PU1-obe.outbound.protection.outlook.com
 (mail-eopbgr1320130.outbound.protection.outlook.com [40.107.132.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 604F16E323
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Sep 2021 07:19:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A1lgxgvERqQOnlB5w96FeKcfFEchOhlQRkgCeMyDILY6bUowhEUPTXcEHMwUE3NwpZz26Cu5XI7DbKsTsYllQKIIChyfqGNbu3ysgiDDSpMkPov2u50t0ru1DV2Kb2SfzlVTwGGGSfmztuG31R5YNu00lPvKroCxdisNDi87tllHaJ+d0YMLWJUb7S43cLpazZwfKH0C9pncgny8fiVV34a8KvBEHypOjHGY2VH4QNZBdOdI6NgdpjmWrvkrpL6Kc/4068lJo8uw34sYiYKSDIGzYQjjd/co0Q46NDIvrFGS2Zele5AUk9bfe4oH99MOuWNROomAafAciKVE9BAJSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=If6c8oJMB+6VS4BjOegRGsR7sIbYADmAaSRtTM6C3PQ=;
 b=d+TyvNDFsVcvHrVUcv3h+mwCdsQxjEJayE7uLLKsMowvbMuG2KipDy40CKfwnBx9zqrjMtjQ87ajehVtenGGYGWQ2HQwIi0qLPZQv5PBotPnKChEUX60QxkdAqMiLe+wrWgmMcTOoOUmhwWjR4kRkG99a3oigkI109eXpMlAcUHByFOm4cgR+tViwaZ8Teuv5DemTuBZwGGIpi9stmx+4s7znkKxhKvf8PSKZOrtO/KzTqurEmtm2XsPztExyvbKwWQJVZTYdLuRnhD+QYYFJdIzJWCJkSG6d01cSbYADa5/1DbqVhmiymMgNpPwngoX2oNJpV5dFDlNzt0XulBQHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=If6c8oJMB+6VS4BjOegRGsR7sIbYADmAaSRtTM6C3PQ=;
 b=aQdtNpKrF3qGPFALzbXAHsczAO/JmodtZBYNZ6epYkP3e1mF94zEeu/zjvmlX5C6x9X6hUbJfS/u4xDlo6+RjVSsWIDjEsh0KqpmyhiY4QHN+yzit/EQVV1C3F67dTnhtl714QLIHnsjtAA9aDdkGcqeQkH4iR+V8V6Uy1S7gH2axiYac7luMjFhenwc/xNYVhuttxSj00SzfTj7eKhZ6SeD9aCBpl9wmrNfG7dPjvVrgwylG9IZYMDynDAqd9jip4YBTq0Zg4PbUG3Qg3V7kzUxOxjFHb4AhClYjoUKOk7kXdbRrfhvU+HGpPtBenlcVuJqx3FVNh44pX0QSO1phQ==
Received: from HK2PR06MB3300.apcprd06.prod.outlook.com (2603:1096:202:34::18)
 by HK0PR06MB2754.apcprd06.prod.outlook.com (2603:1096:203:55::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.15; Thu, 30 Sep
 2021 07:19:26 +0000
Received: from HK2PR06MB3300.apcprd06.prod.outlook.com
 ([fe80::1833:487c:198c:eb3]) by HK2PR06MB3300.apcprd06.prod.outlook.com
 ([fe80::1833:487c:198c:eb3%6]) with mapi id 15.20.4544.023; Thu, 30 Sep 2021
 07:19:26 +0000
From: Kuo-Hsiang Chou <kuohsiang_chou@aspeedtech.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
CC: "airlied@redhat.com" <airlied@redhat.com>, "airlied@linux.ie"
 <airlied@linux.ie>, "daniel@ffwll.ch" <daniel@ffwll.ch>, Jenmin Yuan
 <jenmin_yuan@aspeedtech.com>, Arc Sung <arc_sung@aspeedtech.com>, Luke Chen
 <luke_chen@aspeedtech.com>,
 =?utf-8?B?5riF5rC05L+uKG8tc2hpbWl6dSkt5Y+w54GjTkVD?= <o-shimizu@nec.com.tw>
Subject: RE: [PATCH] drm/ast: Atomic CR/SR reg R/W
Thread-Topic: [PATCH] drm/ast: Atomic CR/SR reg R/W
Thread-Index: AQHXq5TM0RiIoM3rJkSmAmQ7phtcuqusmKiAgA+eivA=
Date: Thu, 30 Sep 2021 07:19:26 +0000
Message-ID: <HK2PR06MB3300C768B6A3C390A7D1BBC28CAA9@HK2PR06MB3300.apcprd06.prod.outlook.com>
References: <20210917072226.17357-1-kuohsiang_chou@aspeedtech.com>
 <7c128e03-842a-57b3-0c11-24fed9d4d126@suse.de>
In-Reply-To: <7c128e03-842a-57b3-0c11-24fed9d4d126@suse.de>
Accept-Language: en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.de; dkim=none (message not signed)
 header.d=none;suse.de; dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 27bc39e8-e6ba-4f39-c821-08d983e2a287
x-ms-traffictypediagnostic: HK0PR06MB2754:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HK0PR06MB2754218B96D690A6326721E58CAA9@HK0PR06MB2754.apcprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DAnXfKvw75vv/UozM7QVDpqrnJIa+JMBNhqVJYywX0ef4iRSVQUfJYkeUtroh+GYnjxFNDT5XQ1ajcOUL4UudTdWlxBRuhb729A0ECdNYwb9nmHl4nnRgdwYhrj4q8yPIE3xEyUXWoAQTP6mlBsPu895hPeneRk/hwJQ6wbevQLPtzf6SoDXnffui+isvS0DsxET0Pk/eYxF/LhoVKIWx5GaC9TKdsfRVnNBpQzZVkY20sDbUFPzQLFlZYhnlNGF186uW7qJ6W7s859ZezV+gpwDCtRJFx5bkfpctNc7ILdm3GwpEfSY4MM1z2pMt7lbJKkDYsVyH3XuGXDT8MBLfArW2Jtjdz2pc52IHxhHZOCziVLMzA0LhKnotg0MYWpdn9+7Wcbcb41xX1H9XGuYqqc7oR6BMzV+WBIC3gYFFK5ACNAnC4euJI5yIFK757zbJnpBbK5wHs2mXqA1P4vhvuRQ3WyuAweElUIDRsKAbvet78a6cq8Y3fz11Elh2vsNlVUS58cBNbNOOe6yvhG94e4svLHlvA+bpy2DbJADYf2fzan9Hxxo+HCsTdL4ECJCJEAM5TvBjxpokR3plzXMkFqNEzCh/P8Mn913tJ+dxL/EWa0Q4fzRLsnnP1il1z+/x1+3EGAQC5tr0AOV7GYYgSyymLZZapgzsQ6qKaiqUb+ylEoEUoAzVt2Rlswp8E5z+gK7Pc2l1ADsCFGaVoSZSA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK2PR06MB3300.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(508600001)(33656002)(76116006)(2906002)(55016002)(71200400001)(9686003)(26005)(66574015)(86362001)(186003)(83380400001)(38070700005)(52536014)(66556008)(7696005)(8936002)(53546011)(6506007)(66476007)(4326008)(8676002)(122000001)(66446008)(54906003)(5660300002)(38100700002)(110136005)(316002)(66946007)(64756008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ejZ1cFJjMklSS0ozejJ4TVlMeDczODc2UWJNNmtKaDZhYTNBcXdWYTlqQmFP?=
 =?utf-8?B?R3JZdkVkQ2FpS0cvTXZJczJxRy9ueVJmdm1QVEpYT25jYjNCY01HOHc2ZFlJ?=
 =?utf-8?B?Q05XdGRtWFVVYytqQng1MHQrb2hZL29HQTZjOUx3TDA1TGxheU91ajVZTW1E?=
 =?utf-8?B?VytuL0RseExlRUlJMVU3M01kU1lmRVNIZTdEWWFmSU8yU0tHcmhxQWVNS3U2?=
 =?utf-8?B?aVFqRVN4YzhyRE5sYkVNUENGSkxHWjY4NUQ3a2FuTFdLeWxwYXdkVndYWWk4?=
 =?utf-8?B?dnZ1VUNxd1R3K001M2U3K1l4TThRRTFxbUxYM09aL09KT2xpeEwvWjJXL2F0?=
 =?utf-8?B?OXdrUFlCS25xdnYrSUJQS1FwcTRhczVmRjhNTDFTYXh4Q3NRMGJDUW11QnpL?=
 =?utf-8?B?enQyYU44VWc5UUZrbGJ6cWhhRlVMSU9hWi9IQ2R0RUxVVFd5OWZ4dUFFZjUx?=
 =?utf-8?B?TEVhQ3JhYjhKTlE3enhnRmowOE80MStZQk9CbjlpYllhWUZpV1d4K1Qvc1lV?=
 =?utf-8?B?V3NnREVOWUtPaXlDMGlyYzZmNS8zR3hMd3Q0OVdJeTdzRnVwNXRCL3lTSDhN?=
 =?utf-8?B?SlR1ZVg4SFhUTDFqVHRLejhCdDRyUUlSRVkvYi9ZZTM0QldSdzJ1emU1cEdE?=
 =?utf-8?B?aUVVdXhTUDNXVVpSSHpzd3ZEZmZzb3RsanhXb3Z2QlF4MU5lb0wrNnVsQXkw?=
 =?utf-8?B?a0ZRemxuNnBqa3VIT3V4T2FnblNLeWpBaHFYVjdmbGxQaHh4d09YTTdxdUZk?=
 =?utf-8?B?ZUpNdWc2MzlWKzFJMkt2bjYxekNWK25PajlNeXowd0hkbE04L2Q4WndlNUpF?=
 =?utf-8?B?N3VLUmhGbzlVRWVSbFlyVDJOSS9yeUFaNmUrK280QTFDL3ZZTWQ2d1huUHBV?=
 =?utf-8?B?MEpKbzQyWHllY1NqT1VQS2s2dDVUdVhzNFk5VWMrWDBkRnN1cG1SK0dsQVg5?=
 =?utf-8?B?K0NGTVZVczkxWmZmVXMvcU92OHlVZ2hWcXJock9sV3plWGV5M2FNV0ozWGNV?=
 =?utf-8?B?elJFOEZUdlgyUklMK01heWJvZEpRMXZKVHpBa1dnMFR1aXBpYTNieEsvUE4y?=
 =?utf-8?B?T3ZBb1dpd3Z5amJZd1pKN3NUZ25DOG9DdGt4ekpQQlZHNTdIRUUvNUMvVmxs?=
 =?utf-8?B?bFg0TzdjaVFTUE9JSlVtU0NGUFUwa05sdlpiUlBBQmUvVW1hT0ZTT0xCNFY5?=
 =?utf-8?B?RkhMbDhIUHBzNlNwUys1MG5IUEVWNnRtQk42VE50SUtvTno4T0cyRmVRbVlp?=
 =?utf-8?B?UFBZZWl6VUtrMmd6YjA3RHduTHd0VGdpeUplekhBTHZtc0RYblI3M0JzaXJ6?=
 =?utf-8?B?K1VtUWtuTStoNVp1L0pVdW0rQVhlUkFDSHU3TVhlMVZxU2RmcnpiUVFqTnRB?=
 =?utf-8?B?RTdFbjc3OWw5Z0FjVEhMUmtLTVF4WUd0a2VTWUJ2dy9NNU96SEYwUk1idVZJ?=
 =?utf-8?B?dnpHbFVHQjRwMzl6L2l3ME1kaFNIeGhtcXhUQzNuL2xvR0pDUm9oQ1lpS2N6?=
 =?utf-8?B?QmFSQm56OE9uc25IUFZKSzRkZkE2azlxUlZ3a3R3Smw4TWRYd0c1QjI2OERT?=
 =?utf-8?B?dGsyeEdIenBtWTBZUUVUZ2Exdk42c3hRbWxOSUVCSVJLM0tBL1B3Q043NFFp?=
 =?utf-8?B?Z25sQ3pLc3AxUW9xSDB2T01jRUJUa0xIMkducFlaUlZoaDh6OE1tNTN3aWRq?=
 =?utf-8?B?Kytad05uMDBmd3FUUVdmQUhKaFNUNE5DMmtSQjFZL3lDT3d0NzVYcDJkNmN2?=
 =?utf-8?Q?y3PatL4x1QgqhgluR6GICPje771vNyuxPbeuFEZ?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK2PR06MB3300.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27bc39e8-e6ba-4f39-c821-08d983e2a287
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2021 07:19:26.1011 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: a/nIrPmIN0IoCau2JgG+E1qetUTHwAih5gI14/i9S3D7W6FaXdyWyCcqJd4O9f9Jg68tWnmXfk+8mUWIOOb0NgJ74irl6Y/AMWIHEiSk94k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR06MB2754
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

DQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBUaG9tYXMgWmltbWVybWFubiBb
bWFpbHRvOnR6aW1tZXJtYW5uQHN1c2UuZGVdIA0KU2VudDogTW9uZGF5LCBTZXB0ZW1iZXIgMjAs
IDIwMjEgNDoxNyBQTQ0KVG86IEt1by1Ic2lhbmcgQ2hvdSA8a3VvaHNpYW5nX2Nob3VAYXNwZWVk
dGVjaC5jb20+OyBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBsaW51eC1rZXJuZWxA
dmdlci5rZXJuZWwub3JnDQpTdWJqZWN0OiBSZTogW1BBVENIXSBkcm0vYXN0OiBBdG9taWMgQ1Iv
U1IgcmVnIFIvVw0KDQpIaQ0KDQpBbSAxNy4wOS4yMSB1bSAwOToyMiBzY2hyaWViIEt1b0hzaWFu
ZyBDaG91Og0KPiAxLiBBdm9pZCBJTy1pbmRleCByYWNpbmcNCj4gMi4gSU8taW5kZXggcmFjaW5n
IGhhcHBlbmVkIG9uIHJlc29sdXN0aW9uIHN3aXRjaGluZw0KPiAgICAgYW5kIG1vdXNlIG1vdmlu
ZyBhdCB0aGUgc2FtZSB0aW1lDQo+IDMuIFN5c3RlbSBodW5nIHdoaWxlIElPLWluZGV4IHJhY2lu
ZyBvY2N1cnJlZC4NCg0KSSdkIHNheSB0aGF0IHRoZXJlJ3Mgc29tZXRoaW5nIGVsc2UgZ29pbmcg
b25lIGhlcmUuIE1vZGUgc2V0dGluZyBhbmQgY3Vyc29yIG1vdmVtZW50IHNob3VsZCBiZSBwcm90
ZWN0ZWQgYWdhaW5zdCBlYWNoIG90aGVyIGJ5IERSTSBsb2NraW5nLiANCkNoYW5naW5nIHRoZXNl
IGxvdy1sZXZlbCBmdW5jdGlvbnMgd291bGQgbm90IHNvbHZlIHRoZSBpc3N1ZXMuIEknbGwgdHJ5
IHRvIHJlcHJvZHVjZSB0aGUgcHJvYmxlbSBBU0FQLg0KDQpIaSBUaG9tYXMsDQoNClNvcnJ5IHRv
IGludGVycnVwdCB5b3UgYWdhaW4hDQpNYXkgSSB1bmRlcnN0YW5kIHRoZSByZXZpZXcncyBzaXR1
YXRpb24/IFRoYW5rcyENCg0KQmVzdCBSZWdhcmRzLA0KIAlLdW8tSHNpYW5nIENob3UNCg0KQmVz
dCByZWdhcmRzDQpUaG9tYXMNCg0KPiANCj4gU2lnbmVkLW9mZi1ieTogS3VvSHNpYW5nIENob3Ug
PGt1b2hzaWFuZ19jaG91QGFzcGVlZHRlY2guY29tPg0KPiAtLS0NCj4gICBkcml2ZXJzL2dwdS9k
cm0vYXN0L2FzdF9tYWluLmMgfCA0OCArKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0t
DQo+ICAgMSBmaWxlIGNoYW5nZWQsIDM2IGluc2VydGlvbnMoKyksIDEyIGRlbGV0aW9ucygtKQ0K
PiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X21haW4uYyANCj4gYi9k
cml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9tYWluLmMgaW5kZXggNzlhMzYxODY3Li4xZDhmYTcwYzUg
MTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X21haW4uYw0KPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9tYWluLmMNCj4gQEAgLTQxLDI4ICs0MSw1MiBAQCB2b2lk
IGFzdF9zZXRfaW5kZXhfcmVnX21hc2soc3RydWN0IGFzdF9wcml2YXRlICphc3QsDQo+ICAgCQkJ
ICAgIHVpbnQzMl90IGJhc2UsIHVpbnQ4X3QgaW5kZXgsDQo+ICAgCQkJICAgIHVpbnQ4X3QgbWFz
aywgdWludDhfdCB2YWwpDQo+ICAgew0KPiAtCXU4IHRtcDsNCj4gLQlhc3RfaW9fd3JpdGU4KGFz
dCwgYmFzZSwgaW5kZXgpOw0KPiAtCXRtcCA9IChhc3RfaW9fcmVhZDgoYXN0LCBiYXNlICsgMSkg
JiBtYXNrKSB8IHZhbDsNCj4gLQlhc3Rfc2V0X2luZGV4X3JlZyhhc3QsIGJhc2UsIGluZGV4LCB0
bXApOw0KPiArCXVpbnQxNl90IHZvbGF0aWxlIHVzRGF0YTsNCj4gKwl1aW50OF90ICB2b2xhdGls
ZSBqRGF0YTsNCj4gKw0KPiArCWRvIHsNCj4gKwkJYXN0X2lvX3dyaXRlOChhc3QsIGJhc2UsIGlu
ZGV4KTsNCj4gKwkJdXNEYXRhID0gYXN0X2lvX3JlYWQxNihhc3QsIGJhc2UpOw0KPiArCX0gd2hp
bGUgKCh1aW50OF90KSh1c0RhdGEpICE9IGluZGV4KTsNCj4gKw0KPiArCWpEYXRhICA9ICh1aW50
OF90KSh1c0RhdGEgPj4gOCk7DQo+ICsJakRhdGEgJj0gbWFzazsNCj4gKwlqRGF0YSB8PSB2YWw7
DQo+ICsJdXNEYXRhID0gKCh1aW50MTZfdCkgakRhdGEgPDwgOCkgfCAodWludDE2X3QpIGluZGV4
Ow0KPiArCWFzdF9pb193cml0ZTE2KGFzdCwgYmFzZSwgdXNEYXRhKTsNCj4gICB9DQo+IA0KPiAg
IHVpbnQ4X3QgYXN0X2dldF9pbmRleF9yZWcoc3RydWN0IGFzdF9wcml2YXRlICphc3QsDQo+ICAg
CQkJICB1aW50MzJfdCBiYXNlLCB1aW50OF90IGluZGV4KQ0KPiAgIHsNCj4gLQl1aW50OF90IHJl
dDsNCj4gLQlhc3RfaW9fd3JpdGU4KGFzdCwgYmFzZSwgaW5kZXgpOw0KPiAtCXJldCA9IGFzdF9p
b19yZWFkOChhc3QsIGJhc2UgKyAxKTsNCj4gLQlyZXR1cm4gcmV0Ow0KPiArCXVpbnQxNl90IHZv
bGF0aWxlIHVzRGF0YTsNCj4gKwl1aW50OF90ICB2b2xhdGlsZSBqRGF0YTsNCj4gKw0KPiArCWRv
IHsNCj4gKwkJYXN0X2lvX3dyaXRlOChhc3QsIGJhc2UsIGluZGV4KTsNCj4gKwkJdXNEYXRhID0g
YXN0X2lvX3JlYWQxNihhc3QsIGJhc2UpOw0KPiArCX0gd2hpbGUgKCh1aW50OF90KSh1c0RhdGEp
ICE9IGluZGV4KTsNCj4gKw0KPiArCWpEYXRhICA9ICh1aW50OF90KSh1c0RhdGEgPj4gOCk7DQo+
ICsNCj4gKwlyZXR1cm4gakRhdGE7DQo+ICAgfQ0KPiANCj4gICB1aW50OF90IGFzdF9nZXRfaW5k
ZXhfcmVnX21hc2soc3RydWN0IGFzdF9wcml2YXRlICphc3QsDQo+ICAgCQkJICAgICAgIHVpbnQz
Ml90IGJhc2UsIHVpbnQ4X3QgaW5kZXgsIHVpbnQ4X3QgbWFzaykNCj4gICB7DQo+IC0JdWludDhf
dCByZXQ7DQo+IC0JYXN0X2lvX3dyaXRlOChhc3QsIGJhc2UsIGluZGV4KTsNCj4gLQlyZXQgPSBh
c3RfaW9fcmVhZDgoYXN0LCBiYXNlICsgMSkgJiBtYXNrOw0KPiAtCXJldHVybiByZXQ7DQo+ICsJ
dWludDE2X3Qgdm9sYXRpbGUgdXNEYXRhOw0KPiArCXVpbnQ4X3QgIHZvbGF0aWxlIGpEYXRhOw0K
PiArDQo+ICsJZG8gew0KPiArCQlhc3RfaW9fd3JpdGU4KGFzdCwgYmFzZSwgaW5kZXgpOw0KPiAr
CQl1c0RhdGEgPSBhc3RfaW9fcmVhZDE2KGFzdCwgYmFzZSk7DQo+ICsJfSB3aGlsZSAoKHVpbnQ4
X3QpKHVzRGF0YSkgIT0gaW5kZXgpOw0KPiArDQo+ICsJakRhdGEgID0gKHVpbnQ4X3QpKHVzRGF0
YSA+PiA4KTsNCj4gKwlqRGF0YSAmPSBtYXNrOw0KPiArDQo+ICsJcmV0dXJuIGpEYXRhOw0KPiAg
IH0NCj4gDQo+ICAgc3RhdGljIHZvaWQgYXN0X2RldGVjdF9jb25maWdfbW9kZShzdHJ1Y3QgZHJt
X2RldmljZSAqZGV2LCB1MzIgDQo+ICpzY3VfcmV2KQ0KPiAtLQ0KPiAyLjE4LjQNCj4gDQoNCi0t
DQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0
d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJl
cmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVy
OiBGZWxpeCBJbWVuZMO2cmZmZXINCg==
