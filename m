Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B8732662E91
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jan 2023 19:19:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A255410E45D;
	Mon,  9 Jan 2023 18:19:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2097.outbound.protection.outlook.com [40.107.20.97])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E7DE10E440
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jan 2023 15:07:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TXtc6N6ZdGMARHsCxNbYvNZzPV8wA1/dSIrxrAH3hdoRtPdbdTjpqx897oQcHBNySK4Tjx6wIaiWtNv9WU32RS4aL1M+f5QYG36wowGN3IA0vAeB1WtCM5o+0nU6V9/H31Yq3fYdXu+jmJ5ObsTm436fh8cU/VZqdwlhpnKOmkMUs4YCZo6p+CTORWswX3Vl6E8g7B1ik3gpyKw92nBPqb1PPduzdNHrLhRbM8OoipP/sTQzekuFcT/01AtGeOZj7vqG1XVyje4LBc/7qoeuwMVF+hHIDJvTz2UhE1s4542qD8vvD7XUwIxJEOrSdFGQYddfEms+yMsbG2o5TnO/xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=et02DEyfFI4kIUsmD9f0LolTMSIFCzg3B7/HPEqFjik=;
 b=adXNgj0qJCxGCLPEN1XkEFnaJPkAnQY8FKXmTcZX8pCh/SysfAxkYiyk31V1odAbVkDJcCPJ6h0CIUEKCcsuHGBSRCZSj9EreOIcbq1M0sFpnfI0xXU3yFsJDkrKhYMXdnJIVAr53/KoRU6bxNNr9+Y0p1e4d+fGnhc3dMUGAZHqANahCqU9F/CEFvixapI97BXGeN6FzGdvBprE4qwAAEXSWsgBFJkviYXGbFbIR4RI+DUQUlX9isjR5XSWwQyJQNDvmcJfPMjrOXR6Z36eu04WoYam/BVzM+D6hP3Ry8yJyqXGXKq2mbJ5Q2y/FqmpbAfsYxlZ+ePqiEqS2Xm1UQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=habana.ai; dmarc=pass action=none header.from=habana.ai;
 dkim=pass header.d=habana.ai; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=habana.ai; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=et02DEyfFI4kIUsmD9f0LolTMSIFCzg3B7/HPEqFjik=;
 b=bgb9bu6jPFMlS3JZnjD0WZhGKbDVZZIQNakHN8m5My1uazlgSzEd/VTnOoGNC2+yjBI2qXBRdBVWBrWo7M4q5wCWmqxCE1GTtc/vJCWecExTkdtP/sEvlwh/b2w3GYGcPsSC3El8Tix7/T0xEGibndDojPiIvZpJ49grFxPz+vYLkSA8+c/YZwIB76aFq1+bvjYZgP1QkRitf5npzBkpMbsZ3PwBgoz2W4fCBk/RSy9hg86ZvgDDB/NjklYsPKsder723zLJ1YsQl0GTTf6lNIvAgOpUgXmJIH/+xG89w5SVvjxqzjsvcHKrH4WF7SmT0uCDb+6V1RZOob1l/Tj8Ww==
Received: from AM0PR02MB5235.eurprd02.prod.outlook.com (2603:10a6:208:fe::20)
 by DU0PR02MB9466.eurprd02.prod.outlook.com (2603:10a6:10:41a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Mon, 9 Jan
 2023 15:07:34 +0000
Received: from AM0PR02MB5235.eurprd02.prod.outlook.com
 ([fe80::176e:6024:3af6:c22d]) by AM0PR02MB5235.eurprd02.prod.outlook.com
 ([fe80::176e:6024:3af6:c22d%3]) with mapi id 15.20.5986.018; Mon, 9 Jan 2023
 15:07:33 +0000
From: Farah Kassabri <fkassabri@habana.ai>
To: Dan Carpenter <error27@gmail.com>
Subject: RE: [bug report] habanalabs: Timestamps buffers registration
Thread-Topic: [bug report] habanalabs: Timestamps buffers registration
Thread-Index: AQHZIamD3ZT86bzR+0qVeRdiMgMV366V+d/w
Date: Mon, 9 Jan 2023 15:07:33 +0000
Message-ID: <AM0PR02MB52357E1350CD36360D2E91F8ADFE9@AM0PR02MB5235.eurprd02.prod.outlook.com>
References: <Y7fctbXR9oPd7K3J@kili>
In-Reply-To: <Y7fctbXR9oPd7K3J@kili>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=habana.ai;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0PR02MB5235:EE_|DU0PR02MB9466:EE_
x-ms-office365-filtering-correlation-id: 60f89660-efb3-4e4c-6190-08daf2533c81
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zq0tosRhMlQ2ANTAzl9D9ZKnk/HbGqH2qhxOD6ku8AQFNXay8xOvMvwwV4Z3KG2jkcRHeZBOZklBvAG38CKkzQn88MEF+HtpyK2zQqrPO7vgrS47cOq4EpbqWCBf6+BoEOoo18feLIWOd+nERufTilWQOAh+5ddvBnDG/kq7cjT2GiflM/UmYVISpny7E3a0HkOI9c1Ld5G6a1Ce8aLJHjbuPgtYIWagtPkI+GVFpDk374N35/jqxJOz5/wEOZNkRZt5RLZGYi9zw+wGbEziix41a+bCJcwdnnepyufYZ/ZYbMttwVFFjrX/sioQSDoSHCwD+EYh0FUjEQ/ucRMwzIVAiSaxj0IqoX7UuGuTqFJhl5gv9T2GsBrW//q4WRy+YDaE5OSDw1mwm4SsChXKuBeX4gq8Vx+VdbLGHbqTibJBez5fLA/GgFx1gKF7AjHbwDJ/tXugZxQN5IW9SFzzMdnEuNgaEVo1BrMwPuv9elPWJ02N9zv48GhbrK1mILUkKOd2hpPX8a6gNQqM98cyO6CjZIepNp8Q0obqMuu3WBl2PgcgZMi/WMt7oDuTU4vCyHt+EiA1H5pdnzft7TWjgNzEe2EwNAq+6pXm7gX12rN2ZtjLB9mr4Rp+OYMgqHxHKPM8ZiHgtmyWrYvwL1SjNpu/F8fzceLxkjcjAEntYPQWOcXvl5JoLcqOi+2q+kq1p2XRtC82Qz5I1SM0Dgot4gOdxFyABuzH39Zcxp/26to=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR02MB5235.eurprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(366004)(39850400004)(396003)(136003)(376002)(451199015)(41300700001)(316002)(64756008)(6916009)(76116006)(8676002)(4326008)(66556008)(66476007)(66446008)(66946007)(86362001)(38070700005)(38100700002)(122000001)(5660300002)(83380400001)(82960400001)(52536014)(33656002)(55016003)(8936002)(2906002)(6506007)(71200400001)(9686003)(186003)(7696005)(26005)(478600001)(21314003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aVF0MFFBOEc5eWZNcXVHZ1NIVHFRQm90OUNtS3RIcFdlMFpBZGhEd3ZKeVcz?=
 =?utf-8?B?VmdzZGVXMXJ0SUNKVUpaaEc3UlZPVHF6WVVuQ1pQUEtvRytIUEI2eVlRc2JK?=
 =?utf-8?B?OFNtNGJPV3lBdHlhamI5THNHeWt1YmVBT05mbHZOallHd1VvQnZxdHZjYUZL?=
 =?utf-8?B?OHVwMjNMRXY1QzlXeUhqa05sTit0L0NweVZxVXRiRFBtZkxMcy90dElzY0NU?=
 =?utf-8?B?N0ZIa3VPaUtCanBraXRia0tjanM2blNBSEN2QVFQSkNMNmJQdXV6NDBDWmRM?=
 =?utf-8?B?Sy90RmdJM1hGclJBMlRNMlAyTW5TbnZiN0NWMzJ3SnU4Z1lEZkw3UTRZOTVq?=
 =?utf-8?B?TVN5ZVhQejVtbC9wNm1BaCszUzAyb0FmSFFIZDhITHB0bi9nVXhxVVltWFJn?=
 =?utf-8?B?TVEyZXh3ZGcwL0pFMGtqMG1JQmtiWTlSYWNCTDBqUWlCT25abXNpRWhwT3F4?=
 =?utf-8?B?UW1SV1JzTS9rNGxsbHNxczJwSzdkUzlBMUhrMTJDVlE3b0U0djZaQ1hFZVhX?=
 =?utf-8?B?OFZJbi9LRlFkWHFnZ294ZWlNSGw0Z0FtWDA3aUtBQVoxTEVGejNUV1R4YWlJ?=
 =?utf-8?B?bmFrb3FJc3VJbmwrRi92OEFWVUh3eWEzbVBBNkY3M25QR1pLemYwWnVkNlhn?=
 =?utf-8?B?M3YwNDVRaXkrREtuTzV4V1JHdHVCMmJtaWFPQW9NODRwSWtCYXJvNVhvVEk5?=
 =?utf-8?B?OGhYNlR4Y1pUSUJ5MkNxWGtLditHN0NPQ05KKzQwbUlRUUdYdCswVlp2U1A1?=
 =?utf-8?B?YnkwSmpIRVJuQXljN3ZSY2RTMDdEMmRGalpQSE5ER0NJbTU0Q1VvdWZ0Ny9i?=
 =?utf-8?B?eWF4RWNRY2cwN0xKaGo3c0hSeFcvWXZpTjJsWCtINnNSOWgrT0Z1UDlZWUQv?=
 =?utf-8?B?dkpvQWtsenFtR1dLY2h3R3JwMzQ2NHorblVETHF4Tzg4N1BBMmhkbWY4Um8r?=
 =?utf-8?B?RVBaTEJBMEtiNkdLWkV0Q2ZWTWFxS3NBMU9Fb3Vjd3J0Y2ZnY0JyOEpGNUVs?=
 =?utf-8?B?bGloWHF5L0laekt0RTErTy9MWTFMRk9rbURsc2VxMWlXS2dKcmpQclY0VGs1?=
 =?utf-8?B?UmZZdnJGNHlJNVpRV0cwekJDZ1R4SEVZYzlrZVI0bHJJdkU2ZEM5VEQzc3Yz?=
 =?utf-8?B?eUkrQXI5ZGx4Mlg5TFg2Q3UyT3lsWnJyNStvTHdOckxjdk5EbGZ4M2lpeHZC?=
 =?utf-8?B?L3N5c2RTdW85NkdBRVlHczJjVHQzRmFDbjQwOXd1Ny85ZWdHdDJIL0ZIRTU3?=
 =?utf-8?B?ajNucmtiMWMrOFdBcVoyVU1sNHc0WWRpcmpXWkZXUlhDdU5TQkNSMVFJTGtE?=
 =?utf-8?B?SmxUaFY2YmQwU0F1aktmM24wY2tNSHJYbUhhWUdnSkxBT29oVndybGEwTDlN?=
 =?utf-8?B?dTdYSGRwVklDOXBvYTNwcUdEU0p6WGMzcEZtaGxBcHdrL3ZGQVFpQmMrSXA0?=
 =?utf-8?B?THZ5b2V2YmdWY3hKK2NwZmliNkppNHhXZWw1L2paSlc5d0c0RDJEekRXU0Vn?=
 =?utf-8?B?ZnV0SS9jK1hmY042dkVSaDlZR0ZUajFzYVdoSk82OE10NklacEE2dmR2aDd2?=
 =?utf-8?B?dVZSNWpYaVZzV3JGVEphYXE2Q0t5b3A4UDkxQVo4cGdMY3dtaHVkdGJXN2hn?=
 =?utf-8?B?NzY2T21zQnFhR3dManBVS3U1NTRYZFFLQnVGMDFRYURoSzRMZnM4UzdzRU5n?=
 =?utf-8?B?WFBPb2ZJcWU0Yjd3Unl6ak1Uc1hsK3NQc3JraHNTallVNUdWd0ovSm5DcUJR?=
 =?utf-8?B?YzBNR0Q1bEJscitOK2VNbVZQT0dGVkNRblBSRk5CNVlyYTFJQm5ZTkRZamRv?=
 =?utf-8?B?anRQQzN6L3EwZGZ3ckVxNUg0cmVqOVAxVEs5MGYyQnRYT2Zkb2Z4M0NCeFN1?=
 =?utf-8?B?NUFMblRpeGkwU0xKanNpdXFFTk10cmxNdVFJSFNXc3AwU1pzcDZpMXlrQ1lI?=
 =?utf-8?B?dUhOTWYzUlZidDFFQlR5REgzUVZ3TlZHbTNYU3RmVVE4cU1yeE1oRERKS3RN?=
 =?utf-8?B?bkx2N2o1QzVUN052aXRwdnJnNkJwazFlRVlTdElWNlBqN3NkL3kydG50NXpZ?=
 =?utf-8?B?cWRkc2tuVTZJSkI0RlpjNW1SdEFSRmUrQXhZUHd2bVVhTXNubjVrWEliVE9X?=
 =?utf-8?Q?X6PM7lDAKXe54H4BZ2vo4x/vJ?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: habana.ai
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR02MB5235.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60f89660-efb3-4e4c-6190-08daf2533c81
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jan 2023 15:07:33.7353 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d4d4539-213c-4ed8-a251-dc9766ba127a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XrVXUo3qvvz7SkKNrm07TGsqduZFvWll/L8k6U7y44GZNzj4aYXOXhS+llrXwisfpNKN5DaSsjWN2DxZ5yTFmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR02MB9466
X-Mailman-Approved-At: Mon, 09 Jan 2023 18:19:25 +0000
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKYW4gMDksIDIwMjMgYXQgMjowMDo0OFBNICswMDAwLCBEYW4gQ2FycGVudGVyIHdy
b3RlOg0KDQo+IA0KPiBIZWxsbyBmYXJhaCBrYXNzYWJyaSwNCj4gDQo+IFRoZSBwYXRjaCA5MTU4
YmY2OWU3NGY6ICJoYWJhbmFsYWJzOiBUaW1lc3RhbXBzIGJ1ZmZlcnMgcmVnaXN0cmF0aW9uIg0K
PiBmcm9tIERlYyAyMywgMjAyMSwgbGVhZHMgdG8gdGhlIGZvbGxvd2luZyBTbWF0Y2ggc3RhdGlj
IGNoZWNrZXINCj4gd2FybmluZzoNCj4gDQo+ICAgICAgICAgZHJpdmVycy9hY2NlbC9oYWJhbmFs
YWJzL2NvbW1vbi9tZW1vcnkuYzoyMTc4IGhsX3RzX2FsbG9jX2J1ZigpDQo+ICAgICAgICAgd2Fy
bjogdXNlICdnZnAnIGhlcmUgaW5zdGVhZCBvZiBHRlBfWFhYPw0KPiANCj4gZHJpdmVycy9hY2Nl
bC9oYWJhbmFsYWJzL2NvbW1vbi9tZW1vcnkuYw0KPiAgICAgMjE3MCBzdGF0aWMgaW50IGhsX3Rz
X2FsbG9jX2J1ZihzdHJ1Y3QgaGxfbW1hcF9tZW1fYnVmICpidWYsIGdmcF90IGdmcCwNCj4gdm9p
ZCAqYXJncykNCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBeXl4gImdmcCIgaXMgbmV2ZXIgdXNlZC4NCg0KQ29y
cmVjdCwgSSdsbCBmaXggaXQuDQoNCj4gDQo+ICAgICAyMTcxIHsNCj4gICAgIDIxNzIgICAgICAg
ICBzdHJ1Y3QgaGxfdHNfYnVmZiAqdHNfYnVmZiA9IE5VTEw7DQo+ICAgICAyMTczICAgICAgICAg
dTMyIHNpemUsIG51bV9lbGVtZW50czsNCj4gICAgIDIxNzQgICAgICAgICB2b2lkICpwOw0KPiAg
ICAgMjE3NQ0KPiAgICAgMjE3NiAgICAgICAgIG51bV9lbGVtZW50cyA9ICoodTMyICopYXJnczsN
Cj4gDQo+IFRoaXMgYnVzaW5lc3Mgb2YgcGFzc2luZyB2b2lkIHBvaW50ZXJzIGFuZCBwcmV0ZW5k
aW5nIHRoYXQNCj4gaGxfY2JfbW1hcF9tZW1fYWxsb2MoKSBhbmQgaGxfdHNfYWxsb2NfYnVmKCkg
YXJlIHRoZSBzYW1lIGZ1bmN0aW9uIGlzIGENCj4gbmlnaHRtYXJlLg0KPiANCj4gQ3JlYXRlIHR3
byAtPmFsbG9jIGZ1bmN0aW9ucy4gIFNwbGl0IGhsX21tYXBfbWVtX2J1Zl9hbGxvYygpIGludG8g
b25lDQo+IGZ1bmN0aW9uIHRoYXQgYWxsb2NhdGVzIGlkciBzdHVmZi4gIENyZWF0ZSBhIGZ1bmN0
aW9uIHRvIGZyZWUvcmVtb3ZlIHRoZSBpZHINCj4gc3R1ZmYuICBDcmVhdGUgdHdvIG5ldyBoZWxw
ZXIgZnVuY3Rpb24gdGhhdCBjYWxsIHRoZSBpZHIgZnVuY3Rpb24gYW5kIHRoZW4gdGhlDQo+IGFw
cHJvcHJpYXRlIGFsbG9jKCkgZnVuY3Rpb24uDQo+IA0KPiBJdCB3aWxsIGJlIG11Y2ggY2xlYW5l
ciB0aGFuIHVzaW5nIGEgdm9pZCBwb2ludGVyLg0KDQpJJ20gbm90IHN1cmUgSSB1bmRlcnN0b29k
IHlvdXIgaW50ZW50aW9uLg0KV2hhdCB2b2lkIHBvaW50ZXJzIGFyZSB5b3UgcmVmZXJyaW5nIHRv
ID8gdGhlIGFyZ3MgaW4gdGhpcyBsaW5lIHJjID0gYnVmLT5iZWhhdmlvci0+YWxsb2MoYnVmLCBn
ZnAsIGFyZ3MpOyA/DQpJZiB5ZXMgd2hhdCdzIHNvIGJhZCBhYm91dCBpdCwgaXQgbXVjaCBzaW1w
bGVyIHRvIGhhdmUgb25lIGNvbW1vbiBmdW5jdGlvbiAgYW5kIGNhbGwgc3BlY2lmaWMgaW1wbGVt
ZW50YXRpb24gdGhyb3VnaCBwb2ludGVycy4NCkJUVyBzYW1lIGdvZXMgdG8gdGhlIG1hcCBmdW5j
dGlvbiBhbHNvLCBub3QganVzdCB0aGUgYWxsb2MgKGVhY2ggYmVoYXZpb3IgaGFzIGFsbG9jIGFu
ZCBtYXAgbWV0aG9kKQ0KDQo+IA0KPiAgICAgMjE3Nw0KPiAtLT4gMjE3OCAgICAgICAgIHRzX2J1
ZmYgPSBremFsbG9jKHNpemVvZigqdHNfYnVmZiksIEdGUF9LRVJORUwpOw0KPiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5eXl5eXl5eXl4gU21h
dGNoIGlzIGNvcnJlY3QgdGhhdCBpdCBzaG91bGQgYmUNCj4gdXNlZCBoZXJlLg0KDQpTdXJlIHdp
bGwgYmUgZml4ZWQuDQoNCj4gDQo+ICAgICAyMTc5ICAgICAgICAgaWYgKCF0c19idWZmKQ0KPiAg
ICAgMjE4MCAgICAgICAgICAgICAgICAgcmV0dXJuIC1FTk9NRU07DQo+ICAgICAyMTgxDQo+ICAg
ICAyMTgyICAgICAgICAgLyogQWxsb2NhdGUgdGhlIHVzZXIgYnVmZmVyICovDQo+ICAgICAyMTgz
ICAgICAgICAgc2l6ZSA9IG51bV9lbGVtZW50cyAqIHNpemVvZih1NjQpOw0KPiANCj4gQ2FuIHRo
aXMgaGF2ZSBhbiBpbnRlZ2VyIG92ZXJmbG93IG9uIDMyYml0IHN5c3RlbXM/DQoNCkknbGwgZGVm
aW5lICJzaXplIiBhcyBzaXplX3QgaW5zdGVhZCBvZiB1MzIuDQoNCj4gDQo+ICAgICAyMTg0ICAg
ICAgICAgcCA9IHZtYWxsb2NfdXNlcihzaXplKTsNCj4gICAgIDIxODUgICAgICAgICBpZiAoIXAp
DQo+ICAgICAyMTg2ICAgICAgICAgICAgICAgICBnb3RvIGZyZWVfbWVtOw0KPiAgICAgMjE4Nw0K
PiAgICAgMjE4OCAgICAgICAgIHRzX2J1ZmYtPnVzZXJfYnVmZl9hZGRyZXNzID0gcDsNCj4gICAg
IDIxODkgICAgICAgICBidWYtPm1hcHBhYmxlX3NpemUgPSBzaXplOw0KPiAgICAgMjE5MA0KPiAg
ICAgMjE5MSAgICAgICAgIC8qIEFsbG9jYXRlIHRoZSBpbnRlcm5hbCBrZXJuZWwgYnVmZmVyICov
DQo+ICAgICAyMTkyICAgICAgICAgc2l6ZSA9IG51bV9lbGVtZW50cyAqIHNpemVvZihzdHJ1Y3Qg
aGxfdXNlcl9wZW5kaW5nX2ludGVycnVwdCk7DQo+ICAgICAyMTkzICAgICAgICAgcCA9IHZ6YWxs
b2Moc2l6ZSk7DQo+ICAgICAyMTk0ICAgICAgICAgaWYgKCFwKQ0KPiAgICAgMjE5NSAgICAgICAg
ICAgICAgICAgZ290byBmcmVlX3VzZXJfYnVmZjsNCj4gICAgIDIxOTYNCj4gICAgIDIxOTcgICAg
ICAgICB0c19idWZmLT5rZXJuZWxfYnVmZl9hZGRyZXNzID0gcDsNCj4gICAgIDIxOTggICAgICAg
ICB0c19idWZmLT5rZXJuZWxfYnVmZl9zaXplID0gc2l6ZTsNCj4gICAgIDIxOTkNCj4gICAgIDIy
MDAgICAgICAgICBidWYtPnByaXZhdGUgPSB0c19idWZmOw0KPiAgICAgMjIwMQ0KPiAgICAgMjIw
MiAgICAgICAgIHJldHVybiAwOw0KPiAgICAgMjIwMw0KPiAgICAgMjIwNCBmcmVlX3VzZXJfYnVm
ZjoNCj4gICAgIDIyMDUgICAgICAgICB2ZnJlZSh0c19idWZmLT51c2VyX2J1ZmZfYWRkcmVzcyk7
DQo+ICAgICAyMjA2IGZyZWVfbWVtOg0KPiAgICAgMjIwNyAgICAgICAgIGtmcmVlKHRzX2J1ZmYp
Ow0KPiAgICAgMjIwOCAgICAgICAgIHJldHVybiAtRU5PTUVNOw0KPiAgICAgMjIwOSB9DQo+IA0K
PiByZWdhcmRzLA0KPiBkYW4gY2FycGVudGVyDQo=
