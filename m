Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A43545F5AC1
	for <lists+dri-devel@lfdr.de>; Wed,  5 Oct 2022 21:49:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73F3A10E769;
	Wed,  5 Oct 2022 19:49:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from na01-obe.outbound.protection.outlook.com
 (mail-eastusazon11010011.outbound.protection.outlook.com [52.101.51.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4097D10E769
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Oct 2022 19:49:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hV9p7XRIFEbvL8sOFVfKm+QnrJ1eb1gr4upU26Pcwjehlhrl0FnHkWnmODPDdYnyVhmsdZq0QkhyI3s/0yryVv1ePJoJJYLgIZCZLacVo2shUC0CShG5IpRvC2o1B9cPhRtlwW1guvtwxYz9q3jz8Y0/xvrXzdHCIp0MQ9kGe/yNxjgO22bZ08ENBYnrdbZlSTDdwWpuk+cV1UDcLPK5BCw9/D+0OkkhmrhuFxkZLDDVMAcg+EeF2X3UYWWRGS67MuecJ3EwYCf7hbwCIf+8I8lTUHyfMdIE4Zjf5v1slFDWaA9cAod1PbmuK9G6jIlZfwZ0a4+8XuO4JVPqKo5DUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kEdI77TPR0on31BBcMd+R+HhXKMOJJyl7AOGZzkLMKo=;
 b=EvpOOmkxB3plMPAKQN1KYGcEumd+q7edR1c98P/kVzMhz/Iy7xjzf27Y04eWgCPsJHyWj4dMJgJK+PF8zVufDIRgqPJY1CJI1m+lMqvej6Si0/alHLGm3yAsjbjl06X5Q++YkO3UxakDd4CeZoYD3oPuDmZ4OxvvaRhQMP9zlq7Wy/es3S+4I+IopCf3i7+jIy/3XKeONrOESqNeTHDL2USyaslcBpzCQgUUmyo57WksE5Erd9VQs3JYKf0XHZLTjrp91mKa/DKsTiTiNR6ju6OXIgpTSnVrTQxGkomvxip8VhxlmZjy4PwOAU0iPHr/HS07YfDygYlnXtuDnoU0iA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kEdI77TPR0on31BBcMd+R+HhXKMOJJyl7AOGZzkLMKo=;
 b=2Inv8y1TiOY7YrGkJBiJclhyOvGSUT/fWL9utdZlS7/kW6VG//e8j9LKLbuq90ZbBhYYIBeQeV1Uw8ezeaclbZsRuiWGAchhAG4l/12XPre+C04UFjdlByxCHaYg47gCDbf8rZSzxEAuDQymjqQihP72QMzIp5udfyKuXkPgAR4=
Received: from CY4PR05MB3047.namprd05.prod.outlook.com (2603:10b6:903:f4::7)
 by DM5PR0501MB3832.namprd05.prod.outlook.com (2603:10b6:4:7b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.7; Wed, 5 Oct
 2022 19:49:17 +0000
Received: from CY4PR05MB3047.namprd05.prod.outlook.com
 ([fe80::d893:b27e:529:35ae]) by CY4PR05MB3047.namprd05.prod.outlook.com
 ([fe80::d893:b27e:529:35ae%7]) with mapi id 15.20.5709.009; Wed, 5 Oct 2022
 19:49:17 +0000
From: Zack Rusin <zackr@vmware.com>
To: "tzimmermann@suse.de" <tzimmermann@suse.de>
Subject: drm fb helpers hotplug/resize
Thread-Topic: drm fb helpers hotplug/resize
Thread-Index: AQHY2PONgaPiyFyXo0CBzirg/4P2Zw==
Date: Wed, 5 Oct 2022 19:49:17 +0000
Message-ID: <9884c2f0daeccbaeaa9995bd8bdb25b98838b980.camel@vmware.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vmware.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY4PR05MB3047:EE_|DM5PR0501MB3832:EE_
x-ms-office365-filtering-correlation-id: 77756ec3-7002-4916-a03e-08daa70ab059
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LOp+9EL2f0G2ILsVksFGITRg5PG88nf0W7rLiRQGHBwrNXSbpFAKNvzBnJbHCveLLyjmtlb/IcQlIY96nqXQH3JpBA0BkOzow4HtvcEPckXHVeGlvxB9Liqk3ih1j4+WvI9E5Lklcl5PaVk4pHesNg6uBUuyUoPbRPK/E98Ku3fQrC2Z5Uhmj3jafg5aDVXscESCsf6Ai8KYFr0WKBa5J3adBVptLp5oYWhGGVGd4o9g/kr/xvT/Ok/1I0Y4SmuGN3yAxXVw27FpWWeVIhfUyY5r8BCJybOCA//ouq9CSYYtdLCDO6snC3VQcCWIvKA+IARrLUala4IUZjY/0LamnEHca/APvZVg4qomkWvelyiDCbf22EYhvjtKo0k+WeqEwbfrrzK1enNVrcAggS+WmoZXWPVWuyJ1+8THv+XzKnVeLtrO16Vgy+RQWUGUnnm6SLx0WBvAq9axwtReomKAxXYWAF6ulKCkByWcwsNWO8r1jueXWIvNWeJx9pM4g1As8l8fil/RKEEpRLwKpjkFYPTBGrFuuBV4d0rWi+qD+s1kqWui1uEWt0u3GCePlKkgUkMjqJ/tz4IGjeD2fChg3dAX+G6XSeiZWKk4ycRIJQBk12bMf5meA8MNHa7sKvp537vqJEoJB9xFcycbAjnWxKz7L8KJjIE9b9s3ZQv+7/eCaLbKVOs8KLR0kC5yh0X4SLRy7jvaPgl5gawpYb5xzncs8IvYQoejP5BHtYgih2NOqVJwLb+TxK5Zwkgh+/uGQ4b7BahJtKfvOUKlE6RG0HyHFqzmGaJjcYDlWhoiE/hq0JungKUxftwjJIQFvvSrtIvfHoPjPdg6hj0BbsvtCuOb/tYgwV3Ids6fcmA+dd037AKSH5iAMqvkT4dPIH2d/sDd7ImLnHCkgzi7FwhI1I72tbyinCwy41yL3qxzNbHiuN3GhS6PZtJIryGbQhOA
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR05MB3047.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(366004)(39860400002)(396003)(136003)(346002)(451199015)(2906002)(8676002)(38070700005)(26005)(6506007)(86362001)(38100700002)(122000001)(6512007)(6916009)(2616005)(71200400001)(54906003)(316002)(966005)(66946007)(6486002)(76116006)(66446008)(5660300002)(8936002)(41300700001)(64756008)(91956017)(66556008)(4326008)(66476007)(478600001)(186003)(66899015)(36756003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cFZEMXQyMlVmUDFjYmNCOWY5YmNnb21ZS0lQTDAxOGEycVkyV3Y2a09tdEZT?=
 =?utf-8?B?aERrU0pqOEdNZkx5dWN5bXkxR2hYa1RhcS9iTWtaV2NpWEhjYWxWdERGWk9l?=
 =?utf-8?B?M1FxelNNZUF0c0RnN3hUallPS0hJMWJ0bjJITVJlOSsvUENGbnBsVlpmeEkv?=
 =?utf-8?B?RnROZ0dIOEFZWG83WHlhVjBoYWVMcy9SbVNRV0NIOTdKRkxFVmhFN0RieVZx?=
 =?utf-8?B?em1pblNWTjRVNzhqZXpRL0F6Q3NuMlI4WHUyam5JeVpqZGszTnhxYStBM0JO?=
 =?utf-8?B?c2N3S1ZNeHdRdTI2WVhpZHM1bnczS2dTVjVzc2JBVnAxcnRNQ2lPVDM4QktG?=
 =?utf-8?B?Qmk0UVpJZ3dpUFNDcXFFVTBiRlc3TXpFck1PNFU5UStYc0lSbnB1QklmQTdt?=
 =?utf-8?B?bmtBZnd4cElkQitZRHFrQmJQNytxemNtWitjTEN3N2dvTVRzL3MzdGtvL3Rk?=
 =?utf-8?B?cWxUMVlKN1N6Z1pvY2tKWnVCdHRzVHA3cGorbXdKcGhHL1pwSEE0c1NOMzlK?=
 =?utf-8?B?ZC9pMXl5b3p4MnFVb3h2ZTZuWGNUOW1scVFjWkFMekk1MExadzNqSFRUcHNF?=
 =?utf-8?B?ckFzb3lTSTRTTVlIQStXNE9SdFZBRld0anVhd2ZZbFBZZFM4VWo1elZCUjg0?=
 =?utf-8?B?UkVia2ZGMnE3Zlh6NU53K3FJMm9yQnlsa1p5Zy9Wd25aWFlDallndXVqeGcy?=
 =?utf-8?B?Vi9obEJTU2xkV1NidkFqL1dVdk1TNUcvTHFwNmVJbUtJSUFkZVE4dHRBblVR?=
 =?utf-8?B?K3cwMTZvbjNkTSt2cllVc1h5OFpUNHR0WnY1TlRoa012dml0OEU3eUwyQi9F?=
 =?utf-8?B?ejFqdEI1SnkwR09SMTR2TGhGVDBoQldGcS9Td1gyNGZ2bzhKODl4N01qQVY4?=
 =?utf-8?B?TnI0cFp1MWI4WGhIYTlIZ3pxVWRBOXh2UUpHbkxlZDgvTDBsVkJ1b0h0b29L?=
 =?utf-8?B?ckdSRW10SUdvamxmamNsTFc3cDhsNWE2Z3pwVHNWVDNkdjhKeDhFWTZ6cGpS?=
 =?utf-8?B?Z3B0Y24yZ29UbmQxN1F4ZERMQUJYcFlXOVN5VUFyS3FGNDhNUzJ2ZXJsalY0?=
 =?utf-8?B?SDRKaWpiRisxYld1dFJ0bnJTNjNxblJsTlA3a3hTMmVhYjhBVmNUUUZHdlhy?=
 =?utf-8?B?YzV2Ulk2dk4yS3I5V0JNaThNNHExREl3SlJ6b3JJTFJxckZUQkxJMy83R3VC?=
 =?utf-8?B?QVBPRGt3YURtSDZkQ1RxdjlmU1NUZ3ZUWW90ZXVhMFowSmFmTmhZTGx1SWs1?=
 =?utf-8?B?cktSV2pjN2RqdzRnbjlGeGtwUEprUWRjS0NDZVZ2M3laQnhkYldKZUFmWG9S?=
 =?utf-8?B?QW9PcTNTYUFPNVY4Q2Y0TEd6QmVKdkRGOUlDbldJOFllaFNjV0dEcXRiSkdS?=
 =?utf-8?B?ZnBTcGhvT1VmR2tuZmYwbU1oL1ZhVWJRbTVWMUVZeXNXMmJMcTFxRlR5N1dC?=
 =?utf-8?B?OXRtKzJzRlpBMkVpb1V5V3hiTTVnSkdEQXE1T0JBc2NVMXRCa2FYN1c2dDFK?=
 =?utf-8?B?aDd1U1lPT3NoL0pheVBNSXc0YjBqanVMU0xoYXpEUGdWNk1DcUVZR3JpdVp4?=
 =?utf-8?B?TCtTTDdTMXAzY1hwUVlYa2g4bElkRXhSd2l0a3UwSndkTkxidGJKdnltTm9J?=
 =?utf-8?B?bWRJNkVmdDZkeGhYZFZTWTh1ZEd1TDBBVm5kdC9VTzJEelJuNzV5VXdoMjVR?=
 =?utf-8?B?ejMraTl0NEFoelRmVHdLZ08xR3pVSlVIcXJUZVBkeHlrREU5WHFIUGpzUWdp?=
 =?utf-8?B?dTRST0NoRE1wOTZQNXo4M1NQVzNuYXhPVWlCZFBseXJUb1A3ajhzMVpjUkwy?=
 =?utf-8?B?bGNPNnZnVFAxZktQSWRIblZINzNac1FYK2J6WDBNMWZzRk5ERDJSUEMrLzdh?=
 =?utf-8?B?TkZLWjE2MEQ4NFgzNFJ0bWgyUzRpbkNnenV4YnczRHMxNGYrcTdDcTEyemxF?=
 =?utf-8?B?N0tEZ3RrZ0syeU5VV3I0S08zWUhOUklUMGdhNEFuZ3l4ZDVEVytNelVaN3Uz?=
 =?utf-8?B?dWdtUlhuakpIeGZOSy9WSEJCNFRlcW1aUy9KNXkxdTZrUzlMRk80ejdScmxR?=
 =?utf-8?B?aUo2V1lMaUVuVmdlTmRnanlnZFljNG1xekU0MlRJMWl5TmhYb1hEUlhVZFI0?=
 =?utf-8?Q?Ru0bdjipIEyM92ZExNdnEClp2?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8C18FBC1A58CC942BD23DFCC8F348FE9@namprd05.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR05MB3047.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77756ec3-7002-4916-a03e-08daa70ab059
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Oct 2022 19:49:17.5896 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oLHI12wZf9iOQH1d8ndSPSRGyrnW8XE6iVVrdpUJS+ij8YsqT9XToBPiyR/AaUiNjFpGodRYN8ZMT0xpo/mZ+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR0501MB3832
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

SGksIFRob21hcy4NCg0KQmVjYXVzZSB5b3UndmUgYmVlbiB0aGUgb25lIHdobydzIGJlZW4gd29y
a2luZyBvbiBkcm1fZmJfaGVscGVyLmMgdGhlIG1vc3QgdGhlIGxhc3QNCmZldyB5ZWFycyBJIHdh
bnRlZCB0byBwaWNrIHlvdXIgYnJhaW4gYSBiaXQuDQoNCkkgd2FzIHBvcnRpbmcgdm13Z2Z4IHRv
IGRybV9mYl9oZWxwZXIgY29kZSB3aGljaCBpcyBsYXJnZWx5IHRyaXZpYWwsIGp1c3QgcmVtb3Zp
bmcNCmFsbCBvZiB2bXdnZnhfZmIuYyBhbmQgcmVwbGFjaW5nIGl0IHdpdGggYSBjYWxsIHRvIGRy
bV9mYmRldl9nZW5lcmljX3NldHVwLiBCdXQNCmRybV9mYl9oZWxwZXIuYyBjb2RlIG5ldmVyIGRl
YWxzIHdpdGggcmVzaXplcyB3aGljaCBpcyBhIGJpdCBvZiBhIHByb2JsZW0uDQoNCmUuZy4gcmVw
bGFjaW5nIHRoZSBkcm1fc3lzZnNfaG90cGx1Z19ldmVudCgpIGNhbGwgZnJvbQ0KaHR0cHM6Ly9l
bGl4aXIuYm9vdGxpbi5jb20vbGludXgvbGF0ZXN0L3NvdXJjZS9kcml2ZXJzL2dwdS9kcm0vdm13
Z2Z4L3Ztd2dmeF9rbXMuYyNMMjI1NQ0Kd2l0aCBkcm1fa21zX2hlbHBlcl9ob3RwbHVnX2V2ZW50
IHdpbGwgY2FsbCBkcm1fZmJkZXZfY2xpZW50X2hvdHBsdWcgYW5kIGVuZCB1cCBpbiANCmRybV9m
Yl9oZWxwZXJfaG90cGx1Z19ldmVudDoNCmh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4
L2xhdGVzdC9zb3VyY2UvZHJpdmVycy9ncHUvZHJtL2RybV9mYl9oZWxwZXIuYyNMMjAwMw0KDQpO
b3cgZHJtX2ZiX2hlbHBlcl9ob3RwbHVnX2V2ZW50IGRvZXMgZHJtX2NsaWVudF9tb2Rlc2V0X3By
b2JlIGJ1dCBpdCBuZXZlciByZXNpemVzDQpkcm1fZmJfaGVscGVyOjpidWZmZXIgYW5kIGRybV9m
Yl9oZWxwZXI6OmZiIHNvIHRoZXkncmUgYm90aCBpbmNvcnJlY3RseSBzaXplZC4gDQoNCkluIGdl
bmVyYWwgSSBkb24ndCBzZWUgZHJtX2ZiX2hlbHBlciBjb2RlIGV2ZXIgYmVpbmcgYWJsZSB0byBk
ZWFsIHdpdGggcmVzaXplcy4gSW4NCnBhcnRpY3VsYXIgYmVjYXVzZSB0aGUgZmJkZXYncyB4cmVz
X3ZpcnR1YWwveXJlc192aXJ0dWFsIGFyZSBzaXplZCBleGFjdGx5IHRvIHRoZQ0KaW5pdGlhbCB4
cmVzL3lyZXMuIA0KDQpJdCdzIGRlZmluaXRlbHkgYSBsb3QgYmlnZ2VyIGlzc3VlIG9uIHZpcnR1
YWxpemVkIGVudmlyb25tZW50cyB3aGVyZSBhdCBib290IHdlJ2xsDQpoYXZlIHNvbWUgdmVyeSBj
b25zZXJ2YXRpdmUgc2l6ZSAoODAweDYwMCkgb24gdm13Z2Z4IHdoaWNoIGlzIHRoZW4gdXN1YWxs
eSByZXNpemVkDQp0byB0aGUgc2l6ZSBvZiB0aGUgd2luZG93LiBkcm1fZmJfaGVscGVyIGJyZWFr
cyBwcmV0dHkgYmFkIGluIHRoYXQgY2FzZSBiZWNhdXNlIGl0DQpjYW4ndCBkZWFsIHdpdGggdGhv
c2UgcmVzaXplcyBhdCBhbGwuIA0KDQpJcyB0aGlzIHNjZW5hcmlvIHNvbWV0aGluZyB0aGF0IGRy
bV9mYl9oZWxwZXIgc2hvdWxkIGJlIGFibGUgdG8gaGFuZGxlIG9yIGlzIGl0IG5vdA0Kd29ydGgg
cHVyc3VpbmcgaXQ/IEkgZG9uJ3QgdGhpbmsgdGhlcmUncyBhIHRyaXZpYWwgd2F5IG9mIGhhbmRs
aW5nIGl0IHNvIG15IGd1ZXNzIGlzDQp0aGF0IGl0IHdvdWxkIG1ha2UgZHJtX2ZiX2hlbHBlciBx
dWl0ZSBhIGJpdCBtb3JlIGNvbXBsaWNhdGVkLg0KDQp6DQo=
