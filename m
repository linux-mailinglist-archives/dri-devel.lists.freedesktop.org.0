Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E0AF34CE371
	for <lists+dri-devel@lfdr.de>; Sat,  5 Mar 2022 08:38:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B90D11A87A;
	Sat,  5 Mar 2022 07:38:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from FRA01-PR2-obe.outbound.protection.outlook.com
 (mail-eopbgr120051.outbound.protection.outlook.com [40.107.12.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEAE711A878;
 Sat,  5 Mar 2022 07:38:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TzzHfhyGJUeFBpnYloi3FUMZfinX7m927jXwakqyLUWjR7Zjp45aR8keBOVTLYzWi2ufWdAGzmlRC5Zfxxflp+QpTfsw2ZCZViakikXqNrdErZuH0iUxoKTDaX37zmB2z4QFT240eG/tp5XiszjAwV0L702pChu+zRpN1iMXiq7ClBG0Je9/TDZfNOlInzhZrXmFncSWJ/T/s007pZwY2q0cl59HowAeI0vChS0bggv0HfV1BBSRf0mXSSjpYukXfW2GhqJZJukybuMyiKaGxLMfZeKBW1EGgLhTVH71d7zm47rtaUNPz1FnAHeBtgOd+sU44dvjTPjsKCPwRVsYbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BIHoCpE2Q1xWpmwxfGDqxSB6rcUfj7MlACGfZnsFAjY=;
 b=IRdSYMa9j4D9bokex3BF71so5ZZGyiKVNMNpssd57fiBvgeQmA/bqR1McnALx0ybxki6OS5VS1Bl1Gb15FHUzfFppNodhTbe1s1wGUeNOTSLjDdLF4vVrpm8BjUlkd52lmfyyqnB4rtUkLEh+hT91V0H8eAaeJLLXrAe5BMcUX2GEAC9d6NdtL1DNSNguWGsQar8O7Q/tnkh+tEQttpqDzJczoZ0NJeTgyhZH8Ljq4XIwkul2OjCgdYoF4d+iJPz6FeyrtL+Ug2X1xOq/GIjyVdPOOc765P8Ad6Z7fWz8um4E+Bz+XETVnT653T1KlyNMLOAwsDWkBIBVHHUtlMYvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB2256.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:15::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Sat, 5 Mar
 2022 07:38:43 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::cd2f:d05d:9aa3:400d]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::cd2f:d05d:9aa3:400d%4]) with mapi id 15.20.5038.019; Sat, 5 Mar 2022
 07:38:43 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Lyude Paul <lyude@redhat.com>, Ben Skeggs <bskeggs@redhat.com>, Karol
 Herbst <kherbst@redhat.com>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>
Subject: Re: [PATCH] drm/nouveau/bios: Rename prom_init() and friends functions
Thread-Topic: [PATCH] drm/nouveau/bios: Rename prom_init() and friends
 functions
Thread-Index: AQHYL+w0cqx8XUQTF0SmnJmJ5+J/4Kyvq+SAgAC8V4A=
Date: Sat, 5 Mar 2022 07:38:43 +0000
Message-ID: <edb9aabd-09af-ae0c-348d-f0500e3405d7@csgroup.eu>
References: <2d97ae92b9c06214be0e088a72cf303eb591bf01.1646414295.git.christophe.leroy@csgroup.eu>
 <47e09d6010852db928c0de29b89450ea7eee74d8.camel@redhat.com>
In-Reply-To: <47e09d6010852db928c0de29b89450ea7eee74d8.camel@redhat.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 44c1ae05-5bfa-4196-2451-08d9fe7b2cd8
x-ms-traffictypediagnostic: MR1P264MB2256:EE_
x-microsoft-antispam-prvs: <MR1P264MB2256EE08598A8BFC5D6FA730ED069@MR1P264MB2256.FRAP264.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BKQYudpde9+gxmnHkvVFJ6FNOiPvS3ZMfnJeACBOV4/emQbs2DWhfa9zW9qPU4Rn4XQluoThANn4FcERZ6W0pB5NaZGhCX6VKxuJPHUI1v08IIU5w1NJHJvPqY1t6+/lJM43vAaaS331DmHuljADDw+lPQgA15n/NCpRZ9golkhx6MLO55UOtoOv2elWmPv6vrdGr80lrBdYnAjt50EDIwF262vL9BFeP4eHkw/idtAvvgCaiA7aBwcqLYzRYNqELAdRPWlOD1k8kx7sjEbynq/6/82vCCrWznLBGI0Rw5fIJsD41ZmoiNYw1AvefxoV/AI6hvobS38RCtaNZsJn/os6MiM3UslEJrO+4k8Oosk3zWZtiM6O4seTg8bZROAWFSFYGTiQPJrLO7Tj+EEEEbNDc+M0XEdbUEwFDSxcoowobSlSwCJJ3yzYtjEqvGZkdGtwqVyqLUZ5fFbggqxo0Rw1DhFuodsbURz4CMDMZYVvYUFyGdJpky7P0wi+RpKrRv6K2drlO3TYrY+LaJiazj/vD93g2RPSgaESY72g1FBbbC1FzUE+1nzl/gQRMW6NRbI+w7V147dK2nkWOeM6Pg01XQwK2B81wh0yJzhxO1OfViEk/3hpk6YX0b1C4KPffr/bGFsVKkzTQl2WZbwI8NPI4Z/YMP201jX/Eg1BOR8taKEf+Ds0jKCnXd/KiZWnsB4hBuyBzkcXk4xakEQcixMwofp3gVvtYCbukcJcFTQALEZj4vE4uks8KkQ67BiDOrJtufbHA3Y8R6SBX+2UdJO+WmCgbVfGatzCEGNIoUB1zU/eMAcuFjBibyIFv8QuV4VwLb/m8XQPgv6/QGkxP6dihCXB9liF8StBBgYVG2w=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(508600001)(122000001)(6512007)(6506007)(110136005)(71200400001)(36756003)(26005)(66574015)(186003)(2616005)(8936002)(316002)(66446008)(66476007)(66556008)(86362001)(66946007)(64756008)(76116006)(38100700002)(8676002)(4326008)(5660300002)(44832011)(91956017)(31696002)(38070700005)(54906003)(31686004)(966005)(6486002)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Qjhhc296MU51aGdPWFQ3UlNWWDVjcXZMWHdDdklkZUJpT0pONVRsVWZDWjhI?=
 =?utf-8?B?TGYwOG0yWEpuR09ZV3JnWDBscmY2UzJHczZTWFVtRUVHV0pwWlZsazhGOC9h?=
 =?utf-8?B?RC96TllPTTliVXlLRVg5cG1YNGtYK2swZDY0NmFkMmMyZmh2czdvMmV3SEZK?=
 =?utf-8?B?a2pUYnVJRnB3QWxGZlg5c0pIUllHWXlhcGRGMlVUcFVkZGdjWUNsaHNkZHhn?=
 =?utf-8?B?djdSd3RXTjU5L2JqVUFmVkp0WTdxTHEvMnloY2szUnM4WG0wVHZaTDFBV3dR?=
 =?utf-8?B?L0FhbnFKZU8xRC9Wdm9nd1FxL1VSSGx3QkVkaENhWXczNDREYTJHNHNEdGMv?=
 =?utf-8?B?WVJmRHZNY1krSVNUNm85YWp4dndHSmhwNzZ1UGJBUTI3Wkthd0E3d0Y4V2hT?=
 =?utf-8?B?K2ZGUHE1TlBqTzl2ODRhSDRRRVZTbm5FcjQ3eUJvMVZuNXd0QWxSYi9lMnd0?=
 =?utf-8?B?OVdFdVBSVGtscG5KMDU1R1J4MHlJdlh5WlF5NFo4bkM2dXB0L2NjRkVUNWpj?=
 =?utf-8?B?SVVINTFpMTM4T01IdWtScTJ6UmJBR093cE5BbkpZa1pLVUxsWUtjL0lITjdr?=
 =?utf-8?B?bHJWdy9BYy9PbXRmZDZzam5IM3p5TVZqdEUxaHBJWGE2eGhxSWp5MnBjSVhD?=
 =?utf-8?B?Z2Rtb2dIQmFNQnpxQXUvTjk0eTRObVo2U3IyUHZNWFNkaGVtbGVQQUk2NmRo?=
 =?utf-8?B?WTJOYk53bVNCZEJvSjB6Ym1lNmJKbFhLczFJYTQybUlHcmZzWVFvaU1FZVF0?=
 =?utf-8?B?WnBGTUJBTExLZXJuSlZraGprUFJWdHFrM1NLbkFUVnl3S0tTRFVzb2tlSGZQ?=
 =?utf-8?B?T08ycmtLL3YzcVpGUWVhWXMybHpSOVdySnljcmlKTi9UelVxOWUrWnczVTB1?=
 =?utf-8?B?N2E2S3N0b0NWVGtIOUhkYzFWenFGbHhoZnRpcnF5ZGhqYmZKOUUyTzRJU3VB?=
 =?utf-8?B?NjFxMDdWM0FUVGpIY3NnRVdxLzdRandqT1R5WWNnUW53K2RXUjM2UEhpR29W?=
 =?utf-8?B?REltWSsweTZaTjhpL3paT0Y1b1BVYlNLOGt1VkxHOFNhZE1ZaGgyb3pyakNS?=
 =?utf-8?B?b3VVSHZiWnJ2bjhCdGdQQUhQaTFQNGhMNlAwd2s0Vll3dGw1eXpQOUxLNmUx?=
 =?utf-8?B?Ylg3d3l1alRFK29BVXVUY01IRE93UnpiSFNNenF5TVVyRkI5M2FNai9CV0FW?=
 =?utf-8?B?ejNQNGd6Umk5cFZyR3JhMjJnWnJrRUVkQk1IV3B4NGVTampFaEJQM09oQkJU?=
 =?utf-8?B?MW0xdXVqTjUzWHpnOEhXay9pQkJhcVdHaDJDQzN6ZHo3cmVaeEpxSFJxZnVq?=
 =?utf-8?B?UjdnK2lQbENpdS9XR1ZkaEQzYVhiOHk3WXZxL2k1S01hb1M3WnhMVzFoWTI5?=
 =?utf-8?B?ZjZTckxxUDY0N2pkVEFhVFR1S3JrVmtOdFBCY3NSMmZpWjNUQnZGT3YwUUpn?=
 =?utf-8?B?dXU2NmhVN1hLT0ZiZjFveTZXYXZrVmxTR3pySmlNYjBta3RWRlhQb0xKODVR?=
 =?utf-8?B?Wnk3UndwNFd5V2lvN3lYcXJXTE5FSjc1cTRCMDQ2OHFGOFRYajJGcW9nYm5O?=
 =?utf-8?B?U3VhQis1d3lEUnRTNWtZM05ya1k0THh5Z1RUU2EwcjVoYlhZaVRLcXRBcnhB?=
 =?utf-8?B?VlpBOWFoeWt5ZFRhQWg2OWpDUWJLOGtENmZsS25xQ2hhajVmME0reS9TMEhZ?=
 =?utf-8?B?L1lwdU51cnlpUzVCRXk3VThHd21mZkhXVENkbVQ4Uk1rZDlPZXdiUWd6WGFk?=
 =?utf-8?B?Y21sQ3NDTjZTdGJLMmlNNEhLZEJPdi9ReVdpMGdxR0tPZ2ZnMUlNa3g5d2w2?=
 =?utf-8?B?VkpNVDhaNk5yWU1aOTNteHE2dER4WkFDQW10Q0pjMFIxQitQMXlObVhJWmZy?=
 =?utf-8?B?OFNOOFdKTGtrdFVMemljTUtMZGttREpKaDhkdkZCTTJXNUV2TlAxUkNFWnRV?=
 =?utf-8?B?MG9HVG9sUzlOT3RkdER4aktZN3lPZTB2YUhZdFN6NGFSRWhLZ1pBTDU2R1RG?=
 =?utf-8?B?V2ZoYnFBVEo4Y3NSSjBuZS9VbUFWNEZRQjZqSWdGdEVRUE42WjIwNFpOckNT?=
 =?utf-8?B?Q2FzNnJnT0ZPYTNCajNzMFM2UEVFMEdYV2ttMDl6ejRoRFQ4bEdyOTBDYVpO?=
 =?utf-8?B?VVZ4VGM2K01PZDhQSUVoNVFZeWhFNU8ycEc2Vlo5cVJZZDUxZzV2Ui9BRWJ5?=
 =?utf-8?B?Vy9XZE53R2FqcWtPR3dxQy95aHZEUlpkallQbkdVdjVMQ3VGRFo1dWorSEdG?=
 =?utf-8?Q?Wqs9LWQyEngD4ylXM7htiEGJirad2arz8KAKWDaLyY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6D0156ADC48BE54EABF8600BA391162B@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 44c1ae05-5bfa-4196-2451-08d9fe7b2cd8
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Mar 2022 07:38:43.4567 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hn5/WzcQ04BCCacYY7XEA1nLmdfqtUhnQzQQdNvDCK5JYyUHjTxE9uOq0Tvl45RIJnYn2Aef0UxcEpqbtfdbL5Kbr2lZasBIg5OFQTqb/Wk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB2256
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
Cc: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNCkxlIDA0LzAzLzIwMjIgw6AgMjE6MjQsIEx5dWRlIFBhdWwgYSDDqWNyaXTCoDoNCj4gVGhp
cyBtb3N0bHkgbG9va3MgZ29vZCB0byBtZS4gSnVzdCBvbmUgcXVlc3Rpb24gKGFuZCBvbmUgY29t
bWVudCBkb3duIGJlbG93DQo+IHRoYXQgbmVlZHMgYWRkcmVzc2luZykuIElzIHRoaXMgd2l0aCBw
cGMzMj8gKEkgYXNrIGJlY2F1c2UgcHBjNjRsZSBkb2Vzbid0DQo+IHNlZW0gdG8gaGl0IHRoaXMg
Y29tcGlsYXRpb24gZXJyb3IpLg0KDQpUaGF0J3Mgd2l0aCBQUEM2NCwgc2VlIA0KaHR0cDovL2tp
c3NrYi5lbGxlcm1hbi5pZC5hdS9raXNza2IvYnJhbmNoL2NobGVyb3kvaGVhZC8yNTJiYTYwOWJl
YTgzMjM0ZDJlMzU4NDFjMTlhZTg0YzY3YjQzZWM3Lw0KDQpCdXQgdGhhdCdzIG5vdCAoeWV0KSB3
aXRoIHRoZSBtYWlubGluZSB0cmVlLiBUaGF0J3Mgd29yayBJJ20gZG9pbmcgdG8gDQpjbGVhbnVw
IG91ciBhc20vYXNtLXByb3RveXBlcy5oIGhlYWRlci4NCg0KU2luY2UgY29tbWl0IDRlZmNhNGVk
MDVjYiAoImtidWlsZDogbW9kdmVyc2lvbnMgZm9yIEVYUE9SVF9TWU1CT0woKSBmb3IgDQphc20i
KSB0aGF0IGZpbGUgaXMgZGVkaWNhdGVkIHRvIHByb3RvdHlwZXMgb2YgZnVuY3Rpb25zIGRlZmlu
ZWQgaW4gDQphc3NlbWJseS4gVGhlcmVmb3JlIEknbSB0cnlpbmcgdG8gZGlzcGF0Y2ggQyBmdW5j
dGlvbnMgcHJvdG90eXBlcyBpbiANCm90aGVyIGhlYWRlcnMuIEkgd2FudGVkIHRvIG1vdmUgcHJv
bV9pbml0KCkgcHJvdG90eXBlIGludG8gYXNtL3Byb20uaCANCmFuZCB0aGVuIEkgaGl0IHRoZSBw
cm9ibGVtLg0KDQpJbiB0aGUgYmVnaW5uaW5nIEkgd2FzIHRoaW5raW5nIGFib3V0IGp1c3QgY2hh
bmdpbmcgdGhlIG5hbWUgb2YgdGhlIA0KZnVuY3Rpb24gaW4gcG93ZXJwYywgYnV0IGFzIEkgc2Vl
IHRoYXQgTTY4SywgTUlQUyBhbmQgU1BBUkMgYWxzbyBoYXZlIGEgDQpwcm9tX2luaXQoKSBmdW5j
dGlvbiwgSSB0aG91Z2h0IGl0IHdvdWxkIGJlIGJldHRlciB0byBjaGFuZ2UgdGhlIG5hbWUgaW4g
DQpzaGFkb3dyb20uYyB0byBhdm9pZCBhbnkgZnV0dXJlIGNvbmZsaWN0IGxpa2UgdGhlIG9uZSBJ
IGdvdCB3aGlsZSANCnJld29ya2luZyB0aGUgaGVhZGVycy4NCg0KDQo+PiBAQCAtNTcsOCArNTcs
OCBAQCBwcm9tX2luaXQoc3RydWN0IG52a21fYmlvcyAqYmlvcywgY29uc3QgY2hhciAqbmFtZSkN
Cj4+ICDCoGNvbnN0IHN0cnVjdCBudmJpb3Nfc291cmNlDQo+PiAgwqBudmJpb3Nfcm9tID0gew0K
Pj4gIMKgwqDCoMKgwqDCoMKgwqAubmFtZSA9ICJQUk9NIiwNCj4+IC3CoMKgwqDCoMKgwqDCoC5p
bml0ID0gcHJvbV9pbml0LA0KPj4gLcKgwqDCoMKgwqDCoMKgLmZpbmkgPSBwcm9tX2ZpbmksDQo+
PiAtwqDCoMKgwqDCoMKgwqAucmVhZCA9IHByb21fcmVhZCwNCj4+ICvCoMKgwqDCoMKgwqDCoC5p
bml0ID0gbnZiaW9zX3JvbV9pbml0LA0KPj4gK8KgwqDCoMKgwqDCoMKgLmZpbmkgPSBudmJpb3Nf
cm9tX2ZpbmksDQo+PiArwqDCoMKgwqDCoMKgwqAucmVhZCA9IG52Ymlvc19yb21fcmVhZCwNCj4g
DQo+IFNlZWluZyBhcyB0aGUgc291cmNlIG5hbWUgaXMgcHJvbSwgSSB0aGluayB1c2luZyB0aGUg
bmFtaW5nIGNvbnZlbnRpb24NCj4gbnZiaW9zX3Byb21fKiB3b3VsZCBiZSBiZXR0ZXIgdGhlbiBu
dmJpb3Nfcm9tXyouDQo+IA0KDQpZZXMgSSB3YXNuJ3Qgc3VyZSBhYm91dCB0aGUgYmVzdCBuYW1p
bmcgYXMgdGhlIGZpbGUgbmFtZSBpcyBzaGFkb3dyb20uYyANCmFuZCBub3Qgc2hhZG93cHJvbS5j
Lg0KDQpJIHdpbGwgc2VuZCB2MiB1c2luZyBudmJpb3NfcHJvbV8qIGFzIGEgbmFtZS4NCg0KQ2hy
aXN0b3BoZQ==
