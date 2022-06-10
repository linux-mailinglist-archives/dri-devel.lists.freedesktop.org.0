Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C7E7F54683B
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jun 2022 16:24:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99969112C8D;
	Fri, 10 Jun 2022 14:24:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2059.outbound.protection.outlook.com [40.107.237.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECF23112C86;
 Fri, 10 Jun 2022 14:24:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cEv/J2RLyD48T7ShjLVzRwx2ceQBzUZVeXdU303vCUasn8EEWbiILorG1gQQHxvG+t8PF/jQ6JUUn6961Icuocea4bJ71FDqTLpYO8ZTnHxB28/XYvQgZfZj42izG3HN1zK+adGxAQ8rHWVHIbKREE3WL5+m7H8Hka3hPNXMht3sw9E0QT86p/o/r1vuJSmMiJk3fyC/YfE0+3w19+V6w8ukgWwEeatwhfBQSZQlbvnMSiTOi8377hYVhMn6VUnaCw/eIL3g64l3I6ZzcIC9xPCaczS0njDkX0O7I1EPggUBTo24A+D+3SNPn0beUNySu1KK5ieBgUPwvbiQZOSHEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UAB6NmdL5H+ZLB5SgyFLVny7dCdBXoy3ZRxLGqhJvL4=;
 b=d6fOleua1Cux+OVCfocZ4K7k3q/9EQmK2n1g4WSAFcsCc9uDPYgrSaPKfLRJeUaMWdHHrIx0eOGpi0k2Be9L/HybylQFJoFM/SDJc1Ik1tOPJKqZiNUnzleWkoqlj5QWN47N8tPqlMTQLvid4eyfJu449EtEmPi6GYF18YTO8aTi4+NdEbm1EVQDL73G8QdpH4erulZj3bJFs3awTYajGEiULlXIl4JC23T6Lof4q9A33OvtNt3u91+jJYC5n/rmj8g5nrt1fVryi69CEsf2JHwmT830I7ahP63lt8dXAPhn32Y/KU8GLzdEMDvhXsIZRQs10shFJgiVSilFJJEtJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UAB6NmdL5H+ZLB5SgyFLVny7dCdBXoy3ZRxLGqhJvL4=;
 b=yXh6il8He3szlazJTmYFLpDij6lQeq6tUEnkA03KcyW9CK2zNkgP4D3Wo9uDFVa8k2AvDycyCctvqLZh1mmRSAx8WNy94uU7wJhWIr3XC7fS47ZDACouyGLob1IXADCmZ3yFWml+zxgl+Bja45ibgPPb9VA5Ww3EvdKjhN2ZSi0=
Received: from CY4PR05MB3047.namprd05.prod.outlook.com (2603:10b6:903:f4::7)
 by BY5PR05MB6850.namprd05.prod.outlook.com (2603:10b6:a03:1c3::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.5; Fri, 10 Jun
 2022 14:24:01 +0000
Received: from CY4PR05MB3047.namprd05.prod.outlook.com
 ([fe80::14fc:26d8:a523:ce02]) by CY4PR05MB3047.namprd05.prod.outlook.com
 ([fe80::14fc:26d8:a523:ce02%3]) with mapi id 15.20.5353.005; Fri, 10 Jun 2022
 14:24:01 +0000
From: Zack Rusin <zackr@vmware.com>
To: "daniel@ffwll.ch" <daniel@ffwll.ch>, "contact@emersion.fr"
 <contact@emersion.fr>
Subject: Re: [PATCH 0/6] drm: Add mouse cursor hotspot support to atomic KMS
Thread-Topic: [PATCH 0/6] drm: Add mouse cursor hotspot support to atomic KMS
Thread-Index: AQHYdpeKjA+fIeSl9UGD1Oezsoj+Fa09u26AgAqjB4CAAAUFgIAAWsyA
Date: Fri, 10 Jun 2022 14:24:01 +0000
Message-ID: <efacab57ba2105c5b5faa49e85b9f582e0983332.camel@vmware.com>
References: <20220602154243.1015688-1-zack@kde.org>
 <wRnf-Lm5zz6v1e-NlnFPteyARuLl-R98mOZZVjePHD5ue7QQNR_TSU7RwYBssgUa7xM5hf7Fe59-gMEj81ESrHY3mu_H7yE0dtGhFHFPTnc=@emersion.fr>
 <YqMDoSMOL2rsfJj/@phenom.ffwll.local> <YqMH14MEqGZtujfk@phenom.ffwll.local>
In-Reply-To: <YqMH14MEqGZtujfk@phenom.ffwll.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vmware.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7d2a0b31-fe19-4c06-587b-08da4aecddb1
x-ms-traffictypediagnostic: BY5PR05MB6850:EE_
x-microsoft-antispam-prvs: <BY5PR05MB685032071E27CD911539670BCEA69@BY5PR05MB6850.namprd05.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QxCtY6U3eSfuz4XZzZJYx/LJQSOWDyz+cmRXrYE7zfqRcGTzQ4fVy5OZGtJ8CRGQ5m1K9lQfHL2m5daPG9zIG73+knQ1zoS5d/Nh4UUvw6VFF24lUHZY0fJhk4gkk0wMTV9m6QspPAtNR9FjpCr4lNJzNrWzCf88GaGkVUBlV09ZcWVqkXOqOAJyiuVLzrQ0cOWCnO2WqwO6SQSG/wlN4S83UfSw+lGFtjyyS3TPAfdzhDtV/V4MngM+yQ/hQ2CTMm5F4O93gTWO1TMYE96lcSj2ZE5eVvpydvRXvQQKpB1UGoZGbCIbDkY5X1Ct7FHiOd3MZ3dLP6FLexZzEFhJNaKk2RBHmamI7nRlOlNhUcI8MUs+5Fo/hHon6nXOQBiXkrsZ8fQ9RXYPEL/pN2AzEmjR+Nwfo9mvoTlQEihJHXzg7W3W6wVjRkVkfGjcUfnrbd/a+MpXuEkPkoX8/xmzjeDPM1VJGnYLKbl83N0vsg8o1nqfYt+5gEHI4BUcxl6AUF7XSBQVmHxnMDuZKyqTR/OwICOmXF1ML7ekxQE5yLOotj6yKfXbQgmc3thiAXRMLNDS2Wxvh81Ic24yL9tDkxZe/8kF8a4g0Pz5tUXQC3aBJfEB6oz9Re1fhQdDCOroE0b1j+jAYEuc3WRmgzho2vSW7d+aJCx3x6Sl5y6IiIGTdq7wDrKFTdexfKX8F6k3iLEOfdbV2iT0drqLZtArXg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR05MB3047.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(83380400001)(316002)(71200400001)(38070700005)(6486002)(76116006)(91956017)(2906002)(66556008)(66476007)(66446008)(64756008)(8676002)(66946007)(7416002)(5660300002)(4326008)(36756003)(26005)(122000001)(6512007)(86362001)(6506007)(186003)(2616005)(508600001)(110136005)(54906003)(38100700002)(8936002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?K1pubnNoaHg3QlUyY1ZFQ2lGMXd5Ky84R0prT0k0d3FzVTVleVNDYnRRY01Q?=
 =?utf-8?B?WUJHMlFFclUrdjl1dXVjN0VXT3psTnc3emh5aVhvWXY4Y25IOXY5bFFqT2tK?=
 =?utf-8?B?ODBwdjVDVEpCd3VKMHppOVo0MEEzY2swc2huZWhJSGxDdjk0SWZVNS9vM0Jl?=
 =?utf-8?B?c2t2SUZadTJhQVY0bU91aktWUUxjUHNGdGtMQnV4b3U3SzVnUDZWN1dBR2V6?=
 =?utf-8?B?YjNQVk9BT0ZDaldIeVUxM0k3THJ3MGRVeFF4bHFLSk1CZi9RNFUxcUhES1J4?=
 =?utf-8?B?d2lKTHJGa1ZOc1daeXc1ODFxU0dWOXVXVU1UVitFTFg5cWd0a0thVjFrdHBF?=
 =?utf-8?B?OUoxYURzOWU3c0FmODJ5SWxzbC9ibVFXK3VRNGorQmEwekhWRE1PRXlrTjlM?=
 =?utf-8?B?bVF2cmVyd21KU3owRFZFaklEV1pHeFlhTFQrU2lmZGRqajVML0cxVkVhMkZu?=
 =?utf-8?B?WWY4ZVJSbk1MUVVrbXR3eWxWSC9KWHYweDF6TTd6RldHTzREczc1Q3hGNEVw?=
 =?utf-8?B?TTBVRWE3K3pab1J4U3dubHVSanRPbFpJRDQ1czQ2MVVsSENETlZMUTdMZFRk?=
 =?utf-8?B?V2MvdVI2UTE5d3pucUxzcWVHNkNKcHpyelJPOWwzZ2R6NDVydkRod0N3RmMz?=
 =?utf-8?B?QXRUTDZQV0grVk85ZWc3UE9Lb3hRNlpxKytXNHlZM2pGbjA3QjBDQ25zd0l0?=
 =?utf-8?B?R2V0a041U2dJNjNmS1NNSkhqQlZVQWNBQVZPaXpTczl0dngrV0dhRnhHNzFm?=
 =?utf-8?B?YnRBU2czd2kzS3lDYUZYZGdDQjZ1U3dQTHhLcE9rQktlUnliOXl5K1hHMDdO?=
 =?utf-8?B?eDdhOEhEK010eGpvcmJBOHpVR3drc200anhudlk2QkYwR3JuRExwdzRqNjVo?=
 =?utf-8?B?VnczUkY4QjBlMlI5akk0QWQwdi9ZaEhUaXUwVVZjeDRMb1o0dWZjR25zNHYv?=
 =?utf-8?B?eWFObllhNzNmVW9BamgvZk1QTUtJNkdNSUpVWWk4TG10Mkx4M3MwTmE2UHh1?=
 =?utf-8?B?aVh3UWV1ZFRhTEkrcngzNnV3N2F3OVpYWkg5OGI3NUwrb3pzQ0FVNE1IK1lJ?=
 =?utf-8?B?M3hMRldZSlpUQmkwbGVEUW5mS0FTUTZTNDEraXhyVFhQb0VldFU3Mi9kL3FD?=
 =?utf-8?B?RzN1NXpyTlh3eGxSNUx4cnhKTzUxb1RnNWFoMDEvQ2pjT3VtRmphWXhiYWZK?=
 =?utf-8?B?SUdVK2ZhTVZlK3JIekV0L3RYMmJDeGpnUGJlVFNLeTF4anBKUi9sbk14Skps?=
 =?utf-8?B?MEFDWUVLZjJBWjU2YnBPR1RCVE9pYVlDVzA2dmUxaDB3eGY4VFQ1SkY0cGFp?=
 =?utf-8?B?VERYeHNDc1RESWpENVU1TWM2Y3Y5RHdERUZoS3ZvSFpjVkhiMEpqQXhTbnA0?=
 =?utf-8?B?cWpzTVY1TEIwZTdyTkUySUpidjhyN09RdTg2NXYxYW9YVVhZcldSRTVtdDFP?=
 =?utf-8?B?RDVnbWdPbmIyQmNQa2M0Rm5SeUgvSW1qc09kQzR6TGd5ZzhTVHd4WHF1eFY3?=
 =?utf-8?B?Ujc2d0xCNDlWYWdtVndBYTYzckxNNVdRUEdTeWpYdlpUVmxKV2t1WWFBZVU1?=
 =?utf-8?B?UmtpaEIrVFlrM0crTVdkTm1md1pWbHhraVhDeXlRR2dMVDBTN3pPMnE2dUVw?=
 =?utf-8?B?VTdpeVVPU3RnbUxraUFlM3ZxTE5GOUhsTWRwQXY2TUx2YlZHSHB6Yk5pVGRI?=
 =?utf-8?B?VnR3RDMvQnUwYWFWa1h6MWRPT2RnbXJNYVA0ektRdEpZVVlJRkpZcnZWMkVl?=
 =?utf-8?B?eXRLU1liRzc2dmxpaVdLZnVpNHhiTFVWQzArWDkvREY3VEpXN1FnUjZwUW9F?=
 =?utf-8?B?b2kxN0R4VDVnM3N0Vmd0WFh1Tjl3SUUrVHR6ZDFnTTFhelI4NHF2YlF4Nnkw?=
 =?utf-8?B?bUJ0Smg3V1lObFlkRTE0V040SmNORWVlS1VESUxsNVBFcitoSnpuNjVuUUFV?=
 =?utf-8?B?ZnZjTXZnS3VEWkJBUkMxc1h0T0FkRUV2Z3hrcnZMSk5MTW5mTTVGYTFlekdI?=
 =?utf-8?B?MVMvbFhBcEphYUJjN090SlRFU1gxWTBING5IekdzVGsvQjVJUXVwOHhxVkov?=
 =?utf-8?B?dVdEeUV3U0pEUTNYYmk0dHdERGtLT1greGJieTlpVENZYXBMa0NZZkdRVWNR?=
 =?utf-8?B?SUZrWklBdGhNOEUwbUxoNUp0QTN3TzlGaWZRNjdTZHBYNzhiNTM0eGJWd1NN?=
 =?utf-8?B?a1ZJRlE1OEhUMnd6c0Rzd21aOTBBak92V3VyN1I5NXp2WGNWMm1mdzd3RHht?=
 =?utf-8?B?SXh3Y05LSVNWSDRUSGh6T3Y1VFZRVzdUNGRhVnM0eUQzVkppS0IxVUxHYjVt?=
 =?utf-8?B?U01Oa1hSRExkTU9EeTJYb2tyZ3pTSWRUQmMyeG16UVRQcGJZQVRPZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4DAC7387385C5842B82780D4AB4B23B7@namprd05.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR05MB3047.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d2a0b31-fe19-4c06-587b-08da4aecddb1
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jun 2022 14:24:01.8002 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: n1Mtu21opf8fIxg28vY01ywN41owSB5ri9NnNiPP6aRlQIEf3Xc8J0c4+dbr+8vxx2Sds4+S6K6utPo68s32ew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR05MB6850
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
Cc: "hdegoede@redhat.com" <hdegoede@redhat.com>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "gurchetansingh@chromium.org" <gurchetansingh@chromium.org>,
 Martin Krastev <krastevm@vmware.com>,
 "ppaalanen@gmail.com" <ppaalanen@gmail.com>,
 "kraxel@redhat.com" <kraxel@redhat.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "wayland-devel@lists.freedesktop.org" <wayland-devel@lists.freedesktop.org>,
 Maaz Mombasawala <mombasawalam@vmware.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAyMDIyLTA2LTEwIGF0IDEwOjU5ICswMjAwLCBEYW5pZWwgVmV0dGVyIHdyb3RlOg0K
PiDimqAgRXh0ZXJuYWwgRW1haWwNCj4gDQo+IE9uIEZyaSwgSnVuIDEwLCAyMDIyIGF0IDEwOjQx
OjA1QU0gKzAyMDAsIERhbmllbCBWZXR0ZXIgd3JvdGU6DQo+ID4gSGkgYWxsLA0KPiA+IA0KPiA+
IEtpbmRhIHRvcCBwb3N0IGJlY2F1c2UgdGhlIHRocmVhZCBpcyBzcHJhd2xpbmcgYW5kIEkgdGhp
bmsgd2UgbmVlZCBhDQo+ID4gc3VtbWFyeS9yZXN0YXJ0LiBJIHRoaW5rIHRoZXJlJ3MgYXQgbGVh
c3QgMyBpc3N1ZXMgaGVyZToNCj4gPiANCj4gPiAtIGxhY2sgb2YgaG90c3BvdCBwcm9wZXJ0eSBz
dXBwb3J0LCB3aGljaCBtZWFucyBjb21wb3NpdG9ycyBjYW4ndCByZWFsbHkNCj4gPiAgIHN1cHBv
cnQgaG90c3BvdCB3aXRoIGF0b21pYy4gV2hpY2ggaXNuJ3QgZW50aXJlbHkgdHJ1ZSwgYmVjYXVz
ZSB5b3UNCj4gPiAgIHRvdGFsbHkgY2FuIHVzZSBhdG9taWMgZm9yIHRoZSBwcmltYXJ5IHBsYW5l
cy9jcnRjcyBhbmQgdGhlIGxlZ2FjeQ0KPiA+ICAgY3Vyc29yIGlvY3RscywgYnV0IEkgdW5kZXJz
dGFuZCB0aGF0IHBlb3BsZSBtaWdodCBmaW5kIHRoYXQgYSBiaXQgc2lsbHkgOi0pDQo+ID4gDQo+
ID4gICBBbnl3YXkgdGhpcyBwcm9ibG1lIGlzIHNvbHZlZCBieSB0aGUgcGF0Y2ggc2V0IGhlcmUs
IGFuZCBJIHRoaW5rIHJlc3VsdHMNCj4gPiAgIGluIHNvbWUgbmljZSBjbGVhbnVwcyB0byBib290
Lg0KPiA+IA0KPiA+IC0gdGhlIGZhY3QgdGhhdCBjdXJzb3JzIGZvciB2aXJ0dWFsIGRyaXZlcnMg
YXJlIG5vdCBwbGFuZXMsIGJ1dCByZWFsbHkNCj4gPiAgIHNwZWNpYWwgdGhpbmdzLiBXaGljaCBq
dXN0IGJyZWFrcyB0aGUgdW5pdmVyc2FsIHBsYW5lIGttcyB1YXBpLiBUaGF0DQo+ID4gICBwYXJ0
IGlzbid0IHNvbHZlZCwgYW5kIEkgZG8gYWdyZWUgd2l0aCBTaW1vbiBhbmQgUGVra2EgdGhhdCB3
ZSByZWFsbHkNCj4gPiAgIHNob3VsZCBzb2x2ZSB0aGlzIGJlZm9yZSB3ZSB1bmxlYXNoIGV2ZW4g
bW9yZSBjb21wb3NpdG9ycyBvbnRvIHRoZQ0KPiA+ICAgYXRvbWljIHBhdGhzIG9mIHZpcnR1YWwg
ZHJpdmVycy4NCj4gPiANCj4gPiAgIEkgdGhpbmsgdGhlIHNpbXBsZXN0IHNvbHV0aW9uIGZvciB0
aGlzIGlzOg0KPiA+ICAgMS4gYWRkIGEgbmV3IERSTV9QTEFORV9UWVBFX1ZJUlRVQUxfQ1VSU09S
LCBhbmQgc2V0IHRoYXQgZm9yIHRoZXNlDQo+ID4gICBzcGVjaWFsIGN1cnNvciBwbGFuZXMgb24g
YWxsIHZpcnR1YWwgZHJpdmVycw0KPiA+ICAgMi4gYWRkIHRoZSBuZXcgIkkgdW5kZXJzdGFuZCB2
aXJ0dWFsIGN1cnNvcnMgcGxhbmVzIiBzZXRwYXJhbSwgZmlsdGVyDQo+ID4gICB2aXJ0dWFsIGN1
cnNvciBwbGFuZXMgZm9yIHVzZXJzcGFjZSB3aGljaCBkb2Vzbid0IHNldCB0aGlzIChsaWtlIHdl
IGRvDQo+ID4gICByaWdodCBub3cgaWYgdXNlcnNwYWNlIGRvZXNuJ3Qgc2V0IHRoZSB1bml2ZXJz
YWwgcGxhbmUgbW9kZSkNCj4gPiAgIDMuIGJhY2twb3J0IHRoZSBhYm92ZSBwYXRjaGVzIHRvIGFs
bCBzdGFibGUga2VybmVscw0KPiA+ICAgNC4gbWFrZSBzdXJlIHRoZSBob3RzcG90IHByb3BlcnR5
IGlzIG9ubHkgc2V0IG9uIFZJUlRVQUxfQ1VSU09SIHBsYW5lcw0KPiA+ICAgYW5kIG5vdGhpbmcg
ZWxzZSBpbiB0aGUgcmViYXNlZCBwYXRjaCBzZXJpZXMNCj4gDQo+IFNpbW9uIGFsc28gbWVudGlv
bmVkIG9uIGlyYyB0aGF0IHRoZXNlIHNwZWNpYWwgcGxhbmVzIG11c3Qgbm90IGV4cG9zZSB0aGUN
Cj4gQ1JUQ19YL1kgcHJvcGVydHksIHNpbmNlIHRoYXQgZG9lc24ndCByZWFsbHkgZG8gbXVjaCBh
dCBhbGwuIE9yIGlzIG91cg0KPiB1bmRlcnN0YW5kaW5nIG9mIGhvdyB0aGlzIGFsbCB3b3JrcyBm
b3IgY29tbWFuZGVlcmVkIGN1cnNvcnMgd3Jvbmc/DQoNClllcywgdGhhdCdzIHRoZSBwYXJ0IEkg
ZG9uJ3QgdW5kZXJzdGFuZC4gSSBkb24ndCB0aGluayBJIHNlZSBob3cgdGhlIENSVENfWHxZDQpw
cm9wZXJ0aWVzIGFyZW4ndCB1c2VkLg0KDQpJIHRoaW5rIHRoZSBjb25mdXNpb24gbWlnaHQgc3Rl
bSBmcm9tIHRoZSBmYWN0IHRoYXQgaXQgYXBwZWFycyB0aGF0IHRoZQ0KaHlwZXJ2aXNvcnMvaG9z
dHMgYXJlIG1vdmluZyB0aGF0IHBsYW5lLCB3aGljaCBpcyBub3QgdGhlIGNhc2UuIFdlIG5ldmVy
IG1vdmUgdGhlDQpwbGFuZSBpdHNlbGYsIHdlIHJlZGlyZWN0IHRoZSBtb3VzZSBmb2N1cy9tb3Zl
bWVudCwgdGhhdCdzIHdoYXQncyByZWR1Y2luZyB0aGUNCmxhdGVuY3kgYnV0IGRvbid0IHRvdWNo
IGRybSBpbnRlcm5hbHMuIEkgY2FuJ3Qgc3BlYWsgZm9yIGV2ZXJ5IHZpcnR1YWxpemVkIHN0YWNr
LA0KYnV0IHdoYXQgaXMgaGFwcGVuaW5nIG9uIG91cnMgaXMgdGhhdCB3ZSBzZXQgdGhlIGltYWdl
IHRoYXQncyBvbiB0aGUgY3Vyc29yIHBsYW5lIGFzDQp0aGUgY3Vyc29yIG9uIHRoZSBtYWNoaW5l
IHRoYXQncyBydW5uaW5nIHRoZSBndWVzdC4gU28gd2hlbiB5b3UgbW92ZSB0aGUgbW91c2UNCmFj
cm9zcyB0aGUgc2NyZWVuIGFzIHlvdSBlbnRlciB0aGUgVk0gd2luZG93IHRoZSBjdXJzb3IgcGxh
bmUgaXNuJ3QgdG91Y2hlZCwgYnV0IHRoZQ0KbG9jYWwgbWFjaGluZXMgY3Vyc29yIGNoYW5nZXMg
dG8gd2hhdCdzIGluc2lkZSB0aGUgY3Vyc29yIHBsYW5lLiBXaGVuIHRoZSBtb3VzZSBpcw0KY2xp
Y2tlZCB0aGUgbW91c2UgZGV2aWNlIGluIHRoZSBndWVzdCBnZW5lcmF0ZXMgdGhlIGV2ZW50IHdp
dGggdGhlIHByb3Blcg0KY29vcmRpbmF0ZXMgKGhlbmNlIHdlIG5lZWQgdGhlIGhvdHNwb3QgdG8g
cm91dGUgdGhhdCBldmVudCBjb3JyZWN0bHkpLiBUaGF0J3Mgd2hlbg0KdGhlIGd1ZXN0IHJlYWN0
cyBqdXN0IGxpa2UgaXQgd291bGQgbm9ybWFsbHkgb24gbmF0aXZlIGlmIGEgbW91c2UgZXZlbnQg
d2FzDQpyZWNlaXZlZC4NCg0KVGhlIGFjdHVhbCBjdXJzb3IgcGxhbmUgbWlnaHQgbm90IGJlIHZp
c2libGUgd2hpbGUgdGhpcyBpcyBoYXBwZW5pbmcgYnV0IGV2ZW4gd2hlbg0KaXQncyBub3Qgdmlz
aWJsZSBpdCdzIHN0aWxsIGF0IHdoYXRldmVyIGNydGNfeHx5IHRoZSBndWVzdCB0aGlua3MgaXQg
aXMuIGNydGNfeHx5DQphcmUgc3RpbGwgb25seSBkcml2ZW4gYnkgdGhlIGd1ZXN0cyBtb3VzZSBk
ZXZpY2UuDQoNCldlIGNvbnRyb2wgdGhlIG1vdXNlIGRldmljZSBhbmQgdmlzaWJpbGl0eSBvZiB0
aGUgY3Vyc29yIHBsYW5lIGl0c2VsZiBiYXNlZCBvbg0Kd2hhdCdzIGhhcHBlbmluZyBpbiB0aGUg
c3lzdGVtIGJ1dCBJIGRvbid0IHRoaW5rIHRoYXQncyB0aGF0IGRpZmZlcmVudCBmcm9tIGEgbmF0
aXZlDQpzeXN0ZW0uDQoNClRoaXMgaXMgZWFzeSB0byBzZWUgYnkgcnVubmluZyB0aGUgIndlc3Rv
bi1zaW1wbGUtZGFtYWdlIC0td2lkdGg9NjQgLS1oZWlnaHQ9NjQiIGlmDQp5b3UgY2xpY2sgb24g
dGhhdCB3aW5kb3cgYW5kIG1vdmUgdGhlIGN1cnNvciB0byB0aGUgdmVyeSBlZGdlIG9mIHRoZSB2
aXJ0dWFsaXplZA0Kd2luZG93IHlvdSdsbCBub3RpY2UgdGhhdCBpdCdzIGNvbWluZyBvdXQgb3V0
c2lkZSBvZiB0aGUgd2luZG93LCB0aGF0J3MgYmVjYXVzZSBpdCdzDQp0aGUgbG9jYWwgbWFjaGlu
ZXMgY3Vyc29yLCBidXQgaWYgeW91IHN0b3AgdGhlIHByZXNzIHRoZSB3aW5kb3cgd2lsbCBqdW1w
IHRvDQp3aGVyZXZlciBpdCB3YXMgYmVjYXVzZSB0aGUgcmVhbCBndWVzdCBwbGFuZSBpcyBzdGls
bCBhdCBjcnRjX3h8eSAoYW5kIGJlY2F1c2UgaW4NCndlc3RvbiB0aGF0IHdpbmRvdyBkb2Vzbid0
IHJlYWN0IHRvIG1vdXNlIG1vdmUgZXZlbnRzIGxpa2UgYSBjdXJzb3Igd291bGQgaXQgbmV2ZXIN
CnNldHMgY3J0Y194fHkgdG8gdGhlIG1vdXNlIGRpcmVjdGVkIGNvb3JkaW5hdGVzKS7CoA0KDQpU
aGUgcHJvYmxlbSBzdGVtcyBmcm9tIHRoZSBmYWN0IHRoYXQgdGhlIGN1cnNvciBwbGFuZSBoYXMg
c29tZXRoaW5nIHRoYXQncyBub3QgYQ0KY3Vyc29yIGFuZCBkb2Vzbid0IHJlYWN0IHRvIG1vdXNl
IGV2ZW50cyBsaWtlIGEgY3Vyc29yIHdvdWxkLiBTbyB0aGUgZmxhZyAob3IgbmV3DQpwbGFuZSkg
dGhhdCB3ZSdkIGJlIGFkZGluZyBpcyBzaW1wbHkgbWFraW5nIHVzZXItc3BhY2UgZ2l2ZSB0aGUg
Zm9sbG93aW5nIHByb21pc2U6DQoNCiJJIHVuZGVyc3RhbmQgdGhhdCB3aGF0J3MgaW5zaWRlIHRo
ZSBjdXJzb3IgcGxhbmUgbmVlZHMgdG8gcmVhY3QgYW5kIGRlYWwgd2l0aCBtb3VzZQ0KZXZlbnRz
IGxpa2UgYSBtb3VzZSBjdXJzb3Igd291bGQsIGkuZS4gaXQgc2hvdWxkIGJlIGEgbW91c2UgY3Vy
c29yIg0KDQoNCnoNCg==
