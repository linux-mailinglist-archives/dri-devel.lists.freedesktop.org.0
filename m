Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0120F75B7F6
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jul 2023 21:28:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC92C10E603;
	Thu, 20 Jul 2023 19:28:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY4PR02CU007.outbound.protection.outlook.com
 (mail-westcentralusazon11011012.outbound.protection.outlook.com
 [40.93.199.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 524D510E603
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jul 2023 19:28:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EuKnhV73dgq9HKyeWJ1aZ1BP/Pc9txRk+jZiC1k18patG1gsnVYvkS6cr04uuaI/A/oGXNJtj8ZvPTuJqG6TspCplu6sEtrdQ7kU705DVV4E7rO9cSB5xNwzOZW9he/rvMusnC4jOV6g6SLX+CYsF/NHKuKsrlpZnQ+31NELjYAtwi+XzIxiN3u6EdjuGwa2vknjfKm6pyBEo5tIhYQpihr7X5w5Gp180ApF2sfVtSZy8Iq6HfEH1pdS5GtW9w8wuw8WEmXC9Muka2b6eNqOVcZu9baF+eu+hVP2QSNW+Oz8gpxXAI408/Hq+qLfGtUAZDJ1ojEM+0XRAZXXO6/SxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V7ezV6YWtQiPzDQuaitLm1uLbOd3wtukAr5G6DX94KI=;
 b=WemQrObFEqb/eXeDKJlAS/ETv5RrCSFORJXRpMQ5dV3ELB1u2tp6KF6SRh/f7IE1MZ1oQv0K2qbUkVi5tivv3RHAKWgwMYlbEWkQMVOBiTEKhZ7ENKp/kzCrtvrfCpqWQKmA05GV2RpvGWgYqnhCvPhHxS5KjimngQvxedUVt7KLuEuH8OXLm94POfXaqMeMft2XNyF56OsFx6/Z56hY4hWQGL4m55do5ppdc1/ySHSOsEtPITiXChIUSmQiUTMUG5rP1Kwufq3dx91cDHEtsCJLEHbu/KFUZ1LELhoQ84OkEACqdx7bbZPjEaTBNCOjWUVJtb4vj9qVJv1YJQ6wuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V7ezV6YWtQiPzDQuaitLm1uLbOd3wtukAr5G6DX94KI=;
 b=P4bZOImGuYD7XH1X3UW5ZUx42R2pRusaUtqlzYV/U9NneIXX3q0lHENRKyHwU5Y04KOE2kVJ5Z7g3Mil1MEjDA36omxYZw9AU9uDC4T5/1D8extACfSJAucgeyMFe4i4r1sQL/6MU+jzd1Ex4rhiXhtpf+0B6Wsv2a/TRlurEsc=
Received: from IA0PR05MB9832.namprd05.prod.outlook.com (2603:10b6:208:404::6)
 by PH0PR05MB7993.namprd05.prod.outlook.com (2603:10b6:510:98::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.28; Thu, 20 Jul
 2023 19:28:31 +0000
Received: from IA0PR05MB9832.namprd05.prod.outlook.com
 ([fe80::1632:bf7f:fa17:dab5]) by IA0PR05MB9832.namprd05.prod.outlook.com
 ([fe80::1632:bf7f:fa17:dab5%7]) with mapi id 15.20.6609.024; Thu, 20 Jul 2023
 19:28:31 +0000
From: Zack Rusin <zackr@vmware.com>
To: "javierm@redhat.com" <javierm@redhat.com>, "contact@emersion.fr"
 <contact@emersion.fr>
Subject: Re: [PATCH v5 9/9] drm: Introduce documentation for hotspot properties
Thread-Topic: [PATCH v5 9/9] drm: Introduce documentation for hotspot
 properties
Thread-Index: AQHZueJPNKbyCKV+z0mctVhhpIOEEK/AvqWAgAFcvQCAABzSgIAAIo+AgAAEz4CAAK1jAA==
Date: Thu, 20 Jul 2023 19:28:31 +0000
Message-ID: <b4f00adeeaec35aacd008fe7a6ca9283760f6421.camel@vmware.com>
References: <20230719014218.1700057-1-zack@kde.org>
 <20230719014218.1700057-10-zack@kde.org> <20230719111541.33c05b14@eldfell>
 <41590ef35281fbc54be1ee58d9187ede8bc44698.camel@vmware.com>
 <xhJhUmlWt6a9ajOdF2Wodjm6IQBab4jqySRdBAPLaA4No87O7zfEX9v4d-ugWWAPgJBIWQeLV4RVuuRoZPK7aTYgNWp2YofiHra2GVLBfpY=@emersion.fr>
 <87sf9jhspo.fsf@minerva.mail-host-address-is-not-set>
 <YpGDUfd-_k9UGRn9xM-lwrWFXim3YiYG1wzgbk_lvSTQ2JL3zxxDuZef4ZTJe_NtOlwMMDy5OoDqK-Ia4VN3p-fibO_gaR7t6pH3oxyEI8Y=@emersion.fr>
In-Reply-To: <YpGDUfd-_k9UGRn9xM-lwrWFXim3YiYG1wzgbk_lvSTQ2JL3zxxDuZef4ZTJe_NtOlwMMDy5OoDqK-Ia4VN3p-fibO_gaR7t6pH3oxyEI8Y=@emersion.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.48.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vmware.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR05MB9832:EE_|PH0PR05MB7993:EE_
x-ms-office365-filtering-correlation-id: a5167e7a-07a0-4fba-bdea-08db895780a2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: St/FEG2BYve7Wd7aLin3pnwj8MQ2irXK8onMTJ7aPmtGjtT8fEh8P3W2ILilZ92nIgGOX4CfMNEz5kPbx3H/M/71LeimnugZ2Hq0vi0XE8+5tx+oVzOtCB09ukYhe1NmCDB192RahJYhM1s1kihM1G7cZ8pTvdPP63qI4hHMtTypbrai3mPtaRghvdTa9JfjlC790rfljE0nw5ZKqfNTdw7DJpk7zOypmp34yAj/7kBL6pDEsnX4AJejOUa1Q7gsYkqiqGhqZuCU6Fnyg6wUqO8S5tdIi8D5pdelqeOQ78VBnqf5VhXIKqCND6R+x9IigdKYzrQQdHANfrf+M5kUm1baMgx24Ah/o+/8Fo+wZX+wf8iFMyx4io8KFElQhe0iGq3DgL0jPOJoXit13vicZAwBNDJ/fiAQ7c6qPabB6vE/n8GsYhJjzTbLsqwJnQVjMDyYF1YuvKGHhKOdOxtJ7YBc0Z1jCIEzr9M68vU8/rj6IJN5RW9LIkpaNood6T62gppuq/wSQH5RVucYD5gNLTYWLGr2yc7pES7ny9vJC6LB/IT+G3EwAfGbLR5mQbTfBi09cq+D5GSxvyYqkfFYXPsml0Avi6V4iI23U6/kpJ/3YQCaOK+6WsfcUaDRL3mD4iKVbJeuQKKxwRoR69+e1Qs9YU2Qs6985IV0ymk46hLfWjgGf5LyeA9RJOIc4rTupgnKAlyB1VRF+YZjYfGo1g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR05MB9832.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(376002)(396003)(39860400002)(346002)(366004)(451199021)(36756003)(86362001)(71200400001)(110136005)(54906003)(66476007)(66946007)(76116006)(478600001)(45080400002)(4326008)(26005)(6506007)(66556008)(64756008)(66446008)(6486002)(966005)(6512007)(8936002)(316002)(8676002)(41300700001)(5660300002)(2906002)(122000001)(38070700005)(38100700002)(83380400001)(186003)(2616005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZEZ4TWN2L2RBT0pDRXVmK0tTYitXZ0ljbzdBRWpPY0k0UXI4aXgySVVFcDRT?=
 =?utf-8?B?YkZJcnJsQTBkc1JQVldVSjBOYnZKMVhIWlE1akhnVC8xdTZpZjZLOTUxallM?=
 =?utf-8?B?Zm1UeGlSYllBMjIvaktveEh2d1JoaHdyZHN3TEpvaGcyTGs0ZlFkVFZPTWlJ?=
 =?utf-8?B?N2pETEw3akJFMW9BTlhjY0hmaW9Sb0lGdFBINWVtM1cxanJqYi8xS2ptdG4x?=
 =?utf-8?B?Tm1iYTlvQjFDY0VoMjBJTWl5a204L2wxcVJlQjRlWkhpb2tna1c2eWgxV1V3?=
 =?utf-8?B?bGhNdUEwMWJSTytTdnd0QzM3NXNtWGs3TzdET1VHaUtpV24wcDU3Z0U2SHBt?=
 =?utf-8?B?M2phZ3NiNG5sWk1MUUw2ZW4ycWJsYXRINGU2K28wMDlwSVZrK2NFelpDMlV0?=
 =?utf-8?B?L3FHREQyUTQ3MXhlRXdaMXUrb3JydmdFZVB2dlZwZUhqM2grcERabVdkb3FO?=
 =?utf-8?B?Vm9MVlc0RFVhU0o0MUc3Yjk5YVZaTmZoTDNlYU9OQWdFZ2dHN2c0WFltVHgv?=
 =?utf-8?B?bzdsWUE1bCtFQXd1Wm9HVXhlOXNXdlk1eUMxVjI2NkFqcitvUzI2Wjg2ZkY5?=
 =?utf-8?B?MHpWUEsyaTJaTzl2MVpNNG1GUytaNXZFNDVJNDl4TGxlMkR4VU5zU2UzdXJE?=
 =?utf-8?B?cnpxcjY2b04xRnJDMktTQlFkUFJFM090UGxEbXFmM2RpSE9WczVvWnkyQ29I?=
 =?utf-8?B?R0VPSU1kRSsvcG5CS3lHbmEzalp1b0xuWTcwQi8wdEtualNKc0swVmNCdzNp?=
 =?utf-8?B?V3pqcnNIOFYxdTdtcnFxM1ZETHlqNVQwcTFYeU4wcFhiRC9kTkFxMTM3MzZ6?=
 =?utf-8?B?ZmhxVjdtaFcwZVNQTVU4MFAyU2ZaWktrbEdvTmJHbGcxL0hHWUMrcjdFNFZ3?=
 =?utf-8?B?dWxva0JsRnhyR3NRSmFrREFqSkJ5dEFxNGltdWd5Y1BtZkhnT1oySytBVFh1?=
 =?utf-8?B?ZjdGZG1lY2dGbkJwZ2xGYlFZRVdEUnVVSGRqMTRBTmJRYkRpSHdweEt1Y2w0?=
 =?utf-8?B?VXhXYVVzcUR0YTVoWVA1MDQxdm01R3ZzRFhvYUErazFaY01QbXlmK0V6K3dI?=
 =?utf-8?B?UDJ3d3BkZFlOM2dZSVVWdTRUU1huTitmVlJ2azd4U0lEelVzbnBBQjdoVXJ6?=
 =?utf-8?B?NjhXajUxbTZ5aS9TdklqREFReXdkdjlKYitibm1xZlkzTWwzTEE5Yncrb2t0?=
 =?utf-8?B?bEh0NUQ3Tml6bkQwSjM5SHRMOWc0Z1JybkdhOUJ3YjB4bHl0T2ZOYWNtMktk?=
 =?utf-8?B?bkNhV2Q4RVdKYUpncGFIYTYyMVpjSzJ4TnVwUFppUTBSeTBEM2FtQXgrOCtV?=
 =?utf-8?B?NGRacGNKalBjVHJkRS96cXpqRStRWmV6MEVESWZwYVJ6MWE5a1BoNVhPaWFV?=
 =?utf-8?B?L1ZCR2VxYmU5T3E5S1lWZUMzRUEwSzRBU24rc1hrdkQ3YzZVM2tlbzhFUk1N?=
 =?utf-8?B?WDl3T0Q0WEtjTDlndittbXQxQTZwdUgzL2tvVUtHdzhzcjdtR3ZTQTRKUGZ2?=
 =?utf-8?B?UmF5ZmVRVlByd0lUcitTcWgxNnNmd3JUK3lBR3BhWUswOUZ0OGNTMlU2UWRI?=
 =?utf-8?B?bDFZRHhFQjZPVkROcng0ZTRQekdRaVcxZ0IrZFR4Ny9ad1BpTkovWGxQNXdi?=
 =?utf-8?B?aWxRMk5PSmc0aVhreEQ2b1VlQmlPS3JkRWNkZHVTM09TdzBGK0FkeTdtUzZi?=
 =?utf-8?B?MWV4UTNmQXlZQUhhVXo0YjJLVHpocE4reGVCUjNwWW50L294R0JtY1ZNWnp0?=
 =?utf-8?B?dHFCMjVVUXRIaHZhZlF0R0F3RlJoUU50TTI5T2pJNHdCbzJwU3J0Y0NoNExN?=
 =?utf-8?B?T21UR1NXbng1Y2lwUXlMS0g1L3VEaEFPUHZ6emRTZjBYOWdoQS9mWVdvS0Q3?=
 =?utf-8?B?WnQ0MjVsT1R0NnMvbUtVb29vemJBVWF0clNTY21vWHpySVdTckNFUTJuYUo2?=
 =?utf-8?B?dnVPQVA0cFdYZFJEVy9UVlF2U3MvcXZzbDd0Z2pKekltYmk2dTUvMUlpa1JU?=
 =?utf-8?B?eUxiOGVVclNmQUdtYlVzTVZrN1R0MGZPLzlJYWY1d2pkb05FeitkUlZPcGRI?=
 =?utf-8?B?U3BaeWJpSEJNcVV1S0hnMktRUzNWZ0NOaTlwdW9YRWhDMmFSUnVNcGtLTHJZ?=
 =?utf-8?Q?XfgOGeBkiOSVf2cxPUZCJdwvZ?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E0BA57342A6AAF45A47739C377CA9ACF@namprd05.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR05MB9832.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5167e7a-07a0-4fba-bdea-08db895780a2
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jul 2023 19:28:31.5948 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xePoOUDSk5eePGzF8302WK4Pa42mR/zSaHpA6E3UX8IVRJpBe0lQQRFF5wtOg0LNsuJ2A/fnfJcrTefPQYr7ZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR05MB7993
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
Cc: "aesteve@redhat.com" <aesteve@redhat.com>,
 Michael Banack <banackm@vmware.com>, Martin Krastev <krastevm@vmware.com>,
 "ppaalanen@gmail.com" <ppaalanen@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Ian Forbes <iforbes@vmware.com>, Maaz Mombasawala <mombasawalam@vmware.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAyMDIzLTA3LTIwIGF0IDA5OjA3ICswMDAwLCBTaW1vbiBTZXIgd3JvdGU6DQo+ICEh
IEV4dGVybmFsIEVtYWlsDQo+DQo+IE9uIFRodXJzZGF5LCBKdWx5IDIwdGgsIDIwMjMgYXQgMTA6
NTAsIEphdmllciBNYXJ0aW5leiBDYW5pbGxhcw0KPiA8amF2aWVybUByZWRoYXQuY29tPiB3cm90
ZToNCj4NCj4gPiA+IE9uIFRodXJzZGF5LCBKdWx5IDIwdGgsIDIwMjMgYXQgMDc6MDMsIFphY2sg
UnVzaW4gemFja3JAdm13YXJlLmNvbSB3cm90ZToNCj4gPiA+DQo+ID4gPiA+IEknbGwgZ2l2ZSB0
aGlzIHNlcmllcyBhIGZldyBtb3JlIGhvdXJzIG9uIHRoZSBsaXN0IGFuZCBpZiBubyBvbmUgb2Jq
ZWN0cw0KPiA+ID4gPiBJJ2xsIHB1c2gNCj4gPiA+ID4gaXQgdG8gZHJtLW1pc2MgbGF0ZXIgdG9k
YXkuIFRoYW5rcyENCj4gPiA+DQo+ID4gPiBTb3JyeSwgYnV0IHRoaXMgZG9lc24ndCBzZWVtIHRv
IGJlIGVub3VnaCB0byBzYXRpc2Z5IHRoZSBEUk0gbWVyZ2UNCj4gPiA+IHJlcXVpcmVtZW50cy4g
VGhpcyBpbnRyb2R1Y2VzIGEgbmV3IHVBUEkgYnV0IGlzIG1pc3NpbmcgdXNlci1zcGFjZQ0KPiA+
ID4gcGF0Y2hlcyBhbmQgSUdULiBTZWUgMSBhbmQgMi4NCj4gPg0KPiA+DQo+ID4gQWxiZXJ0IChD
YydlZCkgd3JvdGUgSUdUIHRlc3RzIGZvciB0aGlzIG5ldyB1QVBJIGFuZCB3YXMgd2FpdGluZyBm
b3INCj4gPiBaYWNrJ3MgcGF0Y2hlcyB0byBsYW5kIHRvIHBvc3QgdGhlbS4gSSBiZWxpZXZlIGhp
cyBicmFuY2ggaXMgWzBdIGJ1dA0KPiA+IGhlIGNhbiBjb3JyZWN0IG1lIGlmIEknbSB3cm9uZyBv
biB0aGF0Lg0KPiA+DQo+ID4gWmFjayBhbHNvIGhhcyBtdXR0ZXIgcGF0Y2hlcyBhbmQgQWxiZXJ0
IGhhcyBiZWVuIHRlc3RpbmcgdGhvc2UgdG9vLg0KPiA+DQo+ID4gWzBdOg0KPiA+IGh0dHBzOi8v
Z2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9hZXN0ZXZlL2lndC1ncHUtdG9vbHMvLS9jb21taXRzL21v
ZGVzZXQtY3Vyc29yLWhvdHNwb3QtdGVzdC8NCj4NCj4gQWgsIG5pY2UuIFBsZWFzZSBkbyBwb3N0
IGFsbCBvZiB0aGVzZSAod2l0aG91dCBtZXJnaW5nIHRoZW0pIGFuZA0KPiBpbmNsdWRlIGxpbmtz
IHRvIHRoZW0gaW4gdGhlIGNvbW1pdCBtZXNzYWdlLiBQb3N0aW5nIGlzIGltcG9ydGFudA0KPiB0
byBtYWtlIHN1cmUgdGhlcmUgYXJlIG5vIGdhcHMvbWlzdGFrZXMgaW4gdGhlIHRlc3RzIGFuZCB1
c2VyLXNwYWNlDQo+IGltcGwuDQoNCldoYXQgc2hvdWxkIHRob3NlIGxpbmtzIHBvaW50IHRvPyBC
ZWNhdXNlIG15IHByaXZhdGUgbXV0dGVyIHJlcG9zaXRvcnkgaXMgZGVmaW5pdGVseQ0Kbm90IGdv
aW5nIHRvIGxhc3QgbG9uZyBzbyBJJ20gbm90IHN1cmUgaWYgdGhlcmUncyBhbnkgcG9pbnQgaW4g
cHV0dGluZyB0aGF0IGluIGENCmtlcm5lbCBjb21taXQgbG9nLiBPciB3b3VsZCB5b3UgbGlrZSB0
aGUgbGlua3MgdG8gdGhvc2UgaW4gdGhlIGNvdmVyIGxldHRlcj8NCg0Keg0K
