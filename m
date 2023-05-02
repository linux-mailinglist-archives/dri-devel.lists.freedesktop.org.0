Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81FE16F4091
	for <lists+dri-devel@lfdr.de>; Tue,  2 May 2023 12:01:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85F7E10E4E0;
	Tue,  2 May 2023 10:01:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2094.outbound.protection.outlook.com [40.107.114.94])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40F2610E4E0
 for <dri-devel@lists.freedesktop.org>; Tue,  2 May 2023 10:01:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wz7ettnlXuK5txyivN0k78vksRZSJS//m01uxHYfnBZ2x6cx63XQRJQd3twnFF6DT0qoIYk/oe1BEf9R7ejiZQ9VAKUVWDIXbxGHuhO5WfNakgMzfaFXi0wKa/9YNUsy1Wo0sFAn3S+K+Rrra0l36BCPrmUKc2oV6/zDeBxgBj98K9tR3Qt5QFJnz7VQpB2SAsg8/IAzsmelN7VOUxhkwUTj3PgkmyiuvNJqyMKECy0XkGGUL6/1hKu8Ms/op1fJlldSTLXPw+EIvz/rpLdg0jPTjwS/zgP2mj5NChAhxsj5uk11/KaW4WqVQlTJDc6sjsVOZMUVJhFua995zOEJLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MIuwefyLsqHTdFR96mQtL5p8Wy/h708g3CjRRnMvlio=;
 b=cpI8SVU3K2Fj6jVylYpIYR9fXQePT/9V7R7DTq8pWpxo2maSbqhjKFmWBxSSwrnWzeq7ZCQPpfQIc1jKmX35JqgquZbKrXVqPRMsC3AaR0aX1zAyj+k0e5qH1BMlCOmt6sccI10fQ4I6NyhnxlUbCM9UvusWQrXcmf2y9Z8dcsgGtt0M0xbMy60saQ4LC/vQpog+l32W6guh5Yjtz8H3pE8DiUOj/tKcF2NSF5awrdEXxFXDGq/4C2uvL2ak8PprZeryej2cpf68yDouAg6Dl7tJmW80/djT1/1eeRUXB5BSWqQey2DRaOXmB7zGP2x72R3jndbOMpynD3pbgbhwJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MIuwefyLsqHTdFR96mQtL5p8Wy/h708g3CjRRnMvlio=;
 b=ruz2bJ4WfkIx90rd7x6iVjdGviSDhDtWylHcys0D3/5ciyEvKYwg0eK7OJqKCjVLcClx2Wel7pjeGWdNrvqISs7OiumxkIiU2aoYeoO0L2g5DTIFpWy4mvSYNCrtRG3khnyvAu2DpsTjz33lt9x8twUxhaIO0aYJVYYBXu4kfUE=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OS0PR01MB5747.jpnprd01.prod.outlook.com (2603:1096:604:b9::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.31; Tue, 2 May
 2023 10:01:05 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2%6]) with mapi id 15.20.6340.031; Tue, 2 May 2023
 10:01:05 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Laurent Pinchart
 <laurent.pinchart+renesas@ideasonboard.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>
Subject: RE: [PATCH v9 5/5] MAINTAINERS: Add maintainer for RZ DU drivers
Thread-Topic: [PATCH v9 5/5] MAINTAINERS: Add maintainer for RZ DU drivers
Thread-Index: AQHZfNxyj/oX6SWnTEi05i/AKryGN69GwCew
Date: Tue, 2 May 2023 10:01:05 +0000
Message-ID: <OS0PR01MB592267FB4211A1C9EBD02178866F9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230502095628.141313-1-biju.das.jz@bp.renesas.com>
 <20230502095628.141313-6-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230502095628.141313-6-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|OS0PR01MB5747:EE_
x-ms-office365-filtering-correlation-id: 4cd3ef13-67b7-4e8b-cddd-08db4af424b3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /s6dIsX53v0Bk/ayZJHQZy7FSATIGPpGZJaJ+mxl0jKSKwcod2zpjNkQRu3HFs65z4RY8hztD3SDZECJL5VLNRXjuW1Xjf/ugCy2SrFCUuNz4yQzjexYCBbexlZkDm6tMwWQVnS/tJ6pP7lex1dYjmzEmeSlpkNW64JggE6tnuIVWY0kf+Ul7HbRhP3uE9jwtxRXm+e+I8cCPHIn3TZ9er6di7CK0cP2xbuPPJ6JXhPKWXZ2glaEuKIZwPDFRfJkSCamriv1kmWha/vYGj8uxH4s8QM2DbOHl6ZCLgaNtUZLmseA6sKckNj8VmZGoostbaJsM1ehIsV3AZErVr3U5QU8a1QHJ2D+WjqLcDqgM+y6ibAiJmHwDz9uU19gn3dKdJNgaBkHPuSTsUAA/emPDXKDYyFBPUvVYVZzKsuLc4QPYP/ydLlWVC4CfGoaop4tgpFQ8p4V+MCji0tZscpIT5GnZxby7NYyHvaa+KNacKQejlCfARLQ/HohphHJGsuNmqEoaAo4HL46wsINwTyuD1id+zqAiWmPTluV4hk2Jrd2TTamg40MPSmeqU2MQWxQKYJGqjgEeYzMKs7pWf/921fmbgMdy/mGwaxLmCIxFjw5BiZIxQLasHopky2Jr5c8LaTnm4oN1VtdGCKr1JYfMA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS0PR01MB5922.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(346002)(136003)(376002)(39860400002)(396003)(451199021)(66476007)(76116006)(66446008)(66556008)(64756008)(2906002)(86362001)(52536014)(66946007)(5660300002)(8936002)(8676002)(71200400001)(41300700001)(316002)(4326008)(110136005)(33656002)(54906003)(7696005)(478600001)(55016003)(186003)(6506007)(26005)(122000001)(53546011)(9686003)(83380400001)(66574015)(38070700005)(38100700002)(357404004);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WEhmMXZ0dUg5VjhJSnVHcm1SMHluMzZ3dCtyeDc1ZzNaNFA3Z24wZjFSUDRn?=
 =?utf-8?B?bHdmVzhDVWM1QTdRTHhzTEVWM0hoY2xXVzUxOHFVT09YUmlWdXRPVzR0K3Zi?=
 =?utf-8?B?RTdFcHB2SWpTcnY2UjNsOTRQVW5Ma3NRRi96RDN6SDFwZmRqZWpudDU4dGxT?=
 =?utf-8?B?ZEdxUkZISmdHbC9lS3grK2d6Sm9DdzducDNqM09RSFJuQ09GQ3dCNlo0SzZF?=
 =?utf-8?B?djB1TlhRckpKaTEvM01CZmpnWHNJckpRV1k1N1dqVEtLaytYS21Vb2tERFQ0?=
 =?utf-8?B?RXpPSFhCN3Z5N3JxVFZoV2hzVWIzTFIydHU0dm4wNkRyNXQ2YStmT1hSQUVa?=
 =?utf-8?B?Q0MvdmZyR0FkQ2UxVlg1TmtEZlhvQmxHaGs5KzB4bW9BQVBYanA5NlpvSVFv?=
 =?utf-8?B?aU9xV0pKNWJmaEw3OURvNVBoa2hwZDVBWmNCdkV2UnpmbVRQZTZ3aU5QUlZQ?=
 =?utf-8?B?eklEYmJCUWNOM21xdkVxaUUyeFFCTnFVWExVcCtIOWJkQ1UzaUNKaE1IRmZL?=
 =?utf-8?B?ZjJPdjNHVmJramdQYS9uaDc1Q1NLdS80NDFJQTZFcngrR0pFcnN0eVAvcTM5?=
 =?utf-8?B?NjVvV3lRNzFybzVvVnZRbFJWNUVxNWl2TTlkYVdWb1d2dUNObTRuczhtVHgz?=
 =?utf-8?B?R2xsMkwyZ0NBcmtMdFpJeVBhUFdoNGdUSVlHK2JvMFEzVS8xZXBiS3JodmUx?=
 =?utf-8?B?UDEyTFJZK2crTldaakhDaEhWMHE2QkZUVzM2OXVxc2V5b0w5MlVvV3RRSWRN?=
 =?utf-8?B?MmhTV1BKQ3E5SzdNYW9hWkNvTmJNSWhZNWlncU1PS2NuekNjVEVEcWFxb1FD?=
 =?utf-8?B?Y1JncXduMnJVa211Rm52b2RJWXQveHZ5VFNZcEpEcjhpZGZVYVVubnh2czhW?=
 =?utf-8?B?eUtwVmFNeXlSQkhOU2Rha0VZcVEvYitEWUFsRnFyV0l5dm9kUDhnOS9zZS9i?=
 =?utf-8?B?SnZEd1VVVThJQktFMjVMcFdFYkNCVnhidmNmTlFEYTZRK3dsTUhYZ211Q2Ju?=
 =?utf-8?B?cDZCUFJKdTEwUWtzcmxFQlAyeXpKdTNaZWxKalBBTVhvTEYrKzZKK1dyQnd6?=
 =?utf-8?B?V1V5eDNMZkYwS1lzRWhNQ0J6S2NTSGJkb0hIZmo4YWxaaFJLSTUrZFNlaHJy?=
 =?utf-8?B?Nm1xK1FKQyt2VlgwTWF6QXAyaU1VZjVmUXdPUUk5M2MwNllNMkR1cHFXemJo?=
 =?utf-8?B?U3pKKzdYTm9HczkwVEFDOTZ5dGdCbEtTd1BQNU5MUjU1bUo0N2lyUmtRdDhQ?=
 =?utf-8?B?b0ZwalNCVE8zaFNtZTNyYWg2bG05b1RSeWplUlZ0VjhyVThHMExDVVU2eEUx?=
 =?utf-8?B?VHkya0lBTDJNcWgrRnQ2YWhWSCtDbUFrcDV6YkRHMDlTSCtZREIyMzlQd2hR?=
 =?utf-8?B?SDJCb2Nua20zajEzYXBNV1hUUEZzT011aG5Ta05aOHkvTWNjQ3lhNmRVMVVK?=
 =?utf-8?B?OWc4OXJzeEFDeWs4WnVUdDNRS2hJYys1OWRwMmswdkl2MTQ2VGk2WHpXL2xx?=
 =?utf-8?B?QXdsdVlHL21wQ2s3ekRGQnpqY21VdkQ1U0F5SVNsVG1BSnkxU3JwaTV5L0xU?=
 =?utf-8?B?SGF5ZEJGWFIvdEpzYWErTVFZQ1lJL3krQk5OZVU5anRiZjZQMnVUUVNMZFNC?=
 =?utf-8?B?a2hhdjc0cnE0UTB3UUdVVTBTd3ZSQXBtdWRBZ09sU2JveUxEL0dGSVl2dVdK?=
 =?utf-8?B?L0w3N05kS3NPUmNlUHBOUm5mdTdqNzAwRFQ1b0w4VjYzS2R4d3JNbFhqRmlF?=
 =?utf-8?B?eFBwWWIzRlJwcG9uSXJodDVic0ZrSkVhTFZZK3VRemd2S3MrY2ZiK0pneDJX?=
 =?utf-8?B?bXU5RWdsYWY1MDR2UWF6WUdKQXhxbURzTmI5cm1uelYxdU5xeHF4aWVRMGFR?=
 =?utf-8?B?dVhQYi9BQ1ZKSDYvUlFGenZJUFJxQ1g4SzF3eFdOWlMxcXNZRDE3QUJIbGFM?=
 =?utf-8?B?TlJxak44V2ZtS2R2L1EzTTBLd1BzcHdZWUt6bFpYdzVwYTIybFhkZS9vYkly?=
 =?utf-8?B?V28wV3hDQkJLa3p1UVkzUHcydU00cVFubkZoczRtNThwQ0tpWWRKK1AzSXZn?=
 =?utf-8?B?dWFZTUMreGFwUXNrOGc0dVhHLzZPUzRGYXY4UGdLR0kxSHZTUFdKQ3EvSDVD?=
 =?utf-8?B?SVpVTmJNMXM5UHRqNUhRWEZGMXpORE5mT2hMWllMZVdCRHJuRWs1cmFUcTFB?=
 =?utf-8?B?bWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cd3ef13-67b7-4e8b-cddd-08db4af424b3
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 May 2023 10:01:05.1020 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TQCOUgLIC6rCZI6q282EkHIZAu7FgF/w59S6u5AbWWyHYLlu9qndpYsascAWtP6xAiEwTLP3Xl0A9z0QOMSwEhjlA25fbIK+hsWQUUq4Mds=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB5747
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
Cc: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQmlqdSBEYXMgPGJpanUu
ZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiBTZW50OiBUdWVzZGF5LCBNYXkgMiwgMjAyMyAxMDo1
NiBBTQ0KPiBUbzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGdtYWlsLmNvbT47IERhbmllbCBWZXR0
ZXIgPGRhbmllbEBmZndsbC5jaD47IEdlZXJ0DQo+IFV5dHRlcmhvZXZlbiA8Z2VlcnQrcmVuZXNh
c0BnbGlkZXIuYmU+OyBMYXVyZW50IFBpbmNoYXJ0DQo+IDxsYXVyZW50LnBpbmNoYXJ0K3JlbmVz
YXNAaWRlYXNvbmJvYXJkLmNvbT47IEtyenlzenRvZiBLb3psb3dza2kNCj4gPGtyenlzenRvZi5r
b3psb3dza2krZHRAbGluYXJvLm9yZz4NCj4gQ2M6IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5y
ZW5lc2FzLmNvbT47IEZhYnJpemlvIENhc3Rybw0KPiA8ZmFicml6aW8uY2FzdHJvLmp6QHJlbmVz
YXMuY29tPjsgUHJhYmhha2FyIE1haGFkZXYgTGFkIDxwcmFiaGFrYXIubWFoYWRldi0NCj4gbGFk
LnJqQGJwLnJlbmVzYXMuY29tPjsgZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgbGlu
dXgtcmVuZXNhcy0NCj4gc29jQHZnZXIua2VybmVsLm9yZw0KPiBTdWJqZWN0OiBbUEFUQ0ggdjkg
NS81XSBNQUlOVEFJTkVSUzogQWRkIG1haW50YWluZXIgZm9yIFJaIERVIGRyaXZlcnMNCj4gDQo+
IEFkZCBteSBzZWxmIGFzIG1haW50YWluZXIgZm9yIFJaIERVIGRyaXZlcnMuDQo+IFdoaWxlIGF0
IGl0LCB1cGRhdGUgdGhlIGVudHJpZXMgZm9yIGNvbW1vbiBwYXJ0cywgcmNhci1kdSBhbmQgc2ht
b2JpbGUuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVu
ZXNhcy5jb20+DQo+IFJldmlld2VkLWJ5OiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNo
YXJ0K3JlbmVzYXNAaWRlYXNvbmJvYXJkLmNvbT4NCj4gLS0tDQo+IHY4LT52OToNCj4gICogQWRk
ZWQgUmIgdGFnIGZyb20gTGF1cmVudC4NCj4gICogVXBkYXRlZCBlbnRyaWVzIGZvciBjb21tb24g
cGFydHMoTWFrZWZpbGUgYW5kIEtjb25maWcpLg0KPiB2ODoNCj4gICogTmV3IHBhdGNoDQo+IC0t
LQ0KPiAgTUFJTlRBSU5FUlMgfCAxNCArKysrKysrKysrKystLQ0KPiAgMSBmaWxlIGNoYW5nZWQs
IDEyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvTUFJ
TlRBSU5FUlMgYi9NQUlOVEFJTkVSUw0KPiBpbmRleCAxMjE4YTJlYzZkOTcuLmNiZjllZmM3Mjkz
YSAxMDA2NDQNCj4gLS0tIGEvTUFJTlRBSU5FUlMNCj4gKysrIGIvTUFJTlRBSU5FUlMNCj4gQEAg
LTY5NDgsNyArNjk0OCw3IEBAIEY6CWRyaXZlcnMvZ3B1L2hvc3QxeC8NCj4gIEY6CWluY2x1ZGUv
bGludXgvaG9zdDF4LmgNCj4gIEY6CWluY2x1ZGUvdWFwaS9kcm0vdGVncmFfZHJtLmgNCj4gDQo+
IC1EUk0gRFJJVkVSUyBGT1IgUkVORVNBUw0KPiArRFJNIERSSVZFUlMgRk9SIFJFTkVTQVMgUkNB
UiBBTkQgU0hNT0JJTEUNCj4gIE06CUxhdXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRA
aWRlYXNvbmJvYXJkLmNvbT4NCj4gIE06CUtpZXJhbiBCaW5naGFtIDxraWVyYW4uYmluZ2hhbSty
ZW5lc2FzQGlkZWFzb25ib2FyZC5jb20+DQo+ICBMOglkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnDQo+IEBAIC02OTU5LDkgKzY5NTksMTkgQEAgRjoNCj4gCURvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9yZW5lc2FzLGRzaS1jc2kyLQ0KPiB0eC55
YW1sDQo+ICBGOglEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlk
Z2UvcmVuZXNhcyxkdy1oZG1pLnlhbWwNCj4gIEY6CURvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9yZW5lc2FzLGx2ZHMueWFtbA0KPiAgRjoJRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcmVuZXNhcyxkdS55YW1sDQo+IC1GOglk
cml2ZXJzL2dwdS9kcm0vcmVuZXNhcy8NCj4gK0Y6CWRyaXZlcnMvZ3B1L2RybS9yZW5lc2FzL3Jj
YXItZHUvS2NvbmZpZw0KPiArRjoJZHJpdmVycy9ncHUvZHJtL3JlbmVzYXMvcmNhci1kdS9NYWtl
ZmlsZQ0KDQpPb3BzLCBUeXBvIG1pc3Rha2UuDQoNCldpbGwgcmVzZW5kLg0KDQpDaGVlcnMsDQpC
aWp1DQoNCj4gK0Y6CWRyaXZlcnMvZ3B1L2RybS9yZW5lc2FzL3NobW9iaWxlLw0KPiAgRjoJaW5j
bHVkZS9saW51eC9wbGF0Zm9ybV9kYXRhL3NobW9iX2RybS5oDQo+IA0KPiArRFJNIERSSVZFUlMg
Rk9SIFJFTkVTQVMgUloNCj4gK006CUJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNv
bT4NCj4gK0w6CWRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gK0w6CWxpbnV4LXJl
bmVzYXMtc29jQHZnZXIua2VybmVsLm9yZw0KPiArUzoJTWFpbnRhaW5lZA0KPiArRjoJRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcmVuZXNhcyxyemcybC1kdS55YW1s
DQo+ICtGOglkcml2ZXJzL2dwdS9kcm0vcmVuZXNhcy9yei1kdS8NCj4gKw0KPiAgRFJNIERSSVZF
UlMgRk9SIFJPQ0tDSElQDQo+ICBNOglTYW5keSBIdWFuZyA8aGpjQHJvY2stY2hpcHMuY29tPg0K
PiAgTToJSGVpa28gU3TDvGJuZXIgPGhlaWtvQHNudGVjaC5kZT4NCj4gLS0NCj4gMi4yNS4xDQoN
Cg==
