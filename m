Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6531482EB91
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jan 2024 10:32:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C82B10E3AA;
	Tue, 16 Jan 2024 09:32:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn
 (mail-sh0chn02on2050.outbound.protection.partner.outlook.cn [139.219.146.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9393210E3AA
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jan 2024 09:32:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mO7HAywSXd605NagAZNypwgJK2pt+QIl2lHkDu5iV8+sHi7HWFqg7/7YUm7hqEkKKh9/6+4swjbsYMC7nKYPzHEeJavnH3AMO9GJU2SW4xTqpL4yK/3SlRHIN9/FEuM7/U1pDG9jDUhLIuW8wKslBJ2CSCspjBUS0m1XJA9fqvXabDGtJSgUr5ZsIpRcgJr9MFRUZfQoyjy7uRmX21sPuWiuM16UQc2h3LMhWA/NVo8OvxRmeCXgpL7av6p3plU3RyEVftMF9kFbzEpC+EdMlvQpgjIdO3+HxYITwwp57X4ZOXJjR5BWuLGtzgS3c/4W9y/67Dh0iylnikK+P1DiPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J5/1UKi71VCvVtxR/dSh2sptwy1UW5m9U18eULcNfFw=;
 b=gwUEFhTnyyvzQ/gp4VrKG6WkQUJpFp1OT+1Tuaxr9qtLmoFsjt7agaf4khh8XbcNeK40MeBD5DEut8Q83soks8Z6TM5yeZM7PG7156czEBGZQXGTWpJUxZOfyBZwqKlAB0jvBb8cpIbu40/UV3vaXGDX+/T22BteRfvcwmWZIq5DIOTNtXWiAahgG23hRiLu8xoJzGJzuJ/irsts7DE7NGOcLuMkGwICbkG7Vx1o9qm8IaFLrcfal79CI9bcXLcltvJN2QO0Ldj5MFs93P7OLBiaEzya8ydtVrQaPmhNy43TFJ95KqzWg0IuyMv9YollAijn08OyJNcIGBd6vxPibw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ0PR01MB1062.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:d::7) by ZQ0PR01MB1270.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:18::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.30; Tue, 16 Jan
 2024 09:32:10 +0000
Received: from ZQ0PR01MB1062.CHNPR01.prod.partner.outlook.cn
 ([fe80::ac0a:d124:81b3:33fb]) by
 ZQ0PR01MB1062.CHNPR01.prod.partner.outlook.cn ([fe80::ac0a:d124:81b3:33fb%6])
 with mapi id 15.20.7181.026; Tue, 16 Jan 2024 09:32:09 +0000
From: Shengyang Chen <shengyang.chen@starfivetech.com>
To: "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH v2 0/2] Add waveshare 7inch touchscreen panel support
Thread-Topic: [PATCH v2 0/2] Add waveshare 7inch touchscreen panel support
Thread-Index: AQHaQsrahW9RVOc2vE6qAfS6BeiBCbDRVbeAgArV/mA=
Date: Tue, 16 Jan 2024 09:32:09 +0000
Message-ID: <ZQ0PR01MB10626BCA7ACA6CB9754BB70BEF73A@ZQ0PR01MB1062.CHNPR01.prod.partner.outlook.cn>
References: <20240109070949.23957-1-shengyang.chen@starfivetech.com>
 <99d7bb85-17b0-4b5e-a6cf-f5957ad92298@linaro.org>
In-Reply-To: <99d7bb85-17b0-4b5e-a6cf-f5957ad92298@linaro.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ0PR01MB1062:EE_|ZQ0PR01MB1270:EE_
x-ms-office365-filtering-correlation-id: 842f8379-fa2d-4076-3744-08dc16760365
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ruLbM5oEL5RzFxG3d7tTr/hmvu6em0N1qpU3fl4NFEIwzQ31WzsB7SMkDtV0GqPpTnWt8MquVNRYyzTarP4bcjgEoBWJ7aBiVtZ0xqxFeH/lChqUsODfw5gGsscgSU+ujLEGXPIIQAxbFrkoZOiHKPTujH4GpJnBSeKg9Cjz95OFVLKe4AdKd4XF4NY9xoGGLOzkEQSODvhQPZU34MMgx2gi0q/HjSWMdIZ1DRYcxGYMMs9kG481Vyb2tbSmV/4kDJ5uLAvzHUcSV2YRqkLs10c/SVPr9rX6kcXmhwjGsZb9QTqMtzKDnfq22k4kLqIuwvXXadT9TMrcPu3U1F5uDRHNM0aoMT5NMAWL6mnkWQxPkrk91sf7VLyxcPYtiWwcLc1fi3jlxNvtgmGwPjnbi+kwpEpAYbwFu3E45TKDFpklTCPmZ3J1toPQihnSvllNVc3dRVA58pnxwaQFZwgllk6GxvnPhQ2ueNtI1E7hMzLzvKYSdfPf97XwmkclDuobl65xIq4Pn++4nMZC371maSiWROWsM83eceT+LTy0836IPJu6R/KxOEjXR0TzZWci
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:ZQ0PR01MB1062.CHNPR01.prod.partner.outlook.cn; PTR:;
 CAT:NONE;
 SFS:(13230031)(346002)(136003)(39830400003)(366004)(396003)(230922051799003)(186009)(451199024)(1800799012)(64100799003)(38100700002)(41320700001)(33656002)(2906002)(5660300002)(7416002)(122000001)(40180700001)(8936002)(8676002)(86362001)(44832011)(4326008)(54906003)(41300700001)(38070700009)(64756008)(66446008)(83380400001)(26005)(40160700002)(966005)(508600001)(110136005)(76116006)(66946007)(66556008)(66476007)(9686003)(71200400001)(53546011)(7696005)(55016003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UWdtNzRpMjNzTlZKVmhjaElwUEQ2NzEycndIU1VvMHdjc0NPSkgrWjJqM2ZD?=
 =?utf-8?B?RUxzdzVjWkwzeFJPRWxkZHZBbENMM3hQS1FJcUoxb2M0aWhkR0VscCtuK0k5?=
 =?utf-8?B?aHZsUGpSajJrVjB2cmhzNDR5MW5yRHMreUZRRjdvN3Q5VDhtdWxzZWEwS2R0?=
 =?utf-8?B?UWxoYzhmYVdIcVNCbXVIdDVKdWRHZXJRN1AzRGRIRXRyUFhkbStFMm5KZENW?=
 =?utf-8?B?MDk5aSttcERUVjhGMzFJNU1SWXVrbHRLQWhRaVdXZWRnVUxsKzR5b2VaQ3BW?=
 =?utf-8?B?M0JKN3dFQ3BBc1RqcTZ2dzhNVVRTS3MvQktaekZxZit2T2RFQmZCNHU3TGVz?=
 =?utf-8?B?Z0JPMVlTTWFYV0VYcnN1ZDNRQmVkRWJsWCsyRWgveDdqNzhrZ1dGYVNJcndH?=
 =?utf-8?B?K0JPVmxXcUV6a0ZFbFBSSkJON3lKbW9wSHpHRHJScjBCZ3NKMlJ3ZzdkSTZN?=
 =?utf-8?B?bHFuN1ROd0VIbWgrRnBaTmtTUndtTDJlRHdHMHFkY0doaUVFMWIvdVB0SWZ6?=
 =?utf-8?B?Ni9pVVh1dGdNQWxQT3pjbHV4RGp0NTE2Ri9HU3VxdkNxd2dZNFo0S3NhSldk?=
 =?utf-8?B?WXFVYTJKRnVzSkJWa3dNaVZacHJiNndmc0hPVVN5a25SWEk3L0toSjdHbUt5?=
 =?utf-8?B?ZXFSWndDUFNnaUJSNjVxUHpkd0x6ZExjS1QzdDNtTFlCSjM3bmhBYkRVeVhs?=
 =?utf-8?B?UTNsT0NKL1JaS0tocS9GTUpFanRwL1hmRzAzSW5JWGRKUVljdEVBb3lYRWVT?=
 =?utf-8?B?Q0tjLzlINmIxM3l5THZndlNQcGhFQkVBazNrZm9VeUVvMW90NUczd2ZkMlFU?=
 =?utf-8?B?NHJiK3h0MVBFUEZ5dEFRMVpxME1Sek5kVVNzNzltUE1YNGNyTVhvdjROQnE1?=
 =?utf-8?B?eGcxczBKa3FCSWhsaDc4WFRYQXByUDFOWmRubGh0emU1VHFGUklYWTVINzg2?=
 =?utf-8?B?OFFNNGhHRlBWRDVTQ0xwQmVJUUxoNzREVnpIMkZKVEY2dVhLZnh2S1BNMmUv?=
 =?utf-8?B?bmdrYUJKcjNscjBrS3RWajJvR3A1SmttWEtBb1k4UmZ2OGk3aXk0ckl3NVZv?=
 =?utf-8?B?Tm5JZm9VY0tTY0lIc2FmSXJqUDRUK21QTEFTd0Y3eU9vKzI4R1A3c0ZqaDBN?=
 =?utf-8?B?NGJFMFgxSHV2WWpobko2UXRtQ0l3cERYVlBGUXJvNlRSbWhvUmd5d1pQaHNI?=
 =?utf-8?B?dGZKLzlxZWlMMzd0T3FmVmdXT29kWXo3ckZWUTZRd21OZU9LRjVPTVd2cU50?=
 =?utf-8?B?NmZUS2JNMnUwYitwTDQ5bEJwTHFtbXVrRGY3NXlMTnhnMXluaHF3dzQ0RVBP?=
 =?utf-8?B?THdxZUNsUkhoWFhyb0tFV2w4TTR3TERGdlk2WkczUVBBY0M3TU1XY2FneTlh?=
 =?utf-8?B?ZmVVQTNRNFNlaEh3a3pqMk1MSWxKc1FGRGRNcWQxUDZncXA2ZGxkaUpaa21i?=
 =?utf-8?B?akhMNkFiSHE2aUYwbmhTbEE4K0JCWnhZdUZzSGZHdjRWblBNVm5iVytwUnRD?=
 =?utf-8?B?Y1VGdFBWQW9NZU03N1FFRWM1K2hIbTNiRHk1QW1PNHhRQS9PUjkvbEZ4aGJS?=
 =?utf-8?B?ejdxYzdCUUdYMmhxekxOcGVnSFBLemVyeGVCblg3b3hNNElzODJBaTF6ay9W?=
 =?utf-8?B?TVlSRWVnWUlEZW5MeXl1QUtnZksxeS9sTURlSGl0NFNiVnBZaXgyMGtPa3JF?=
 =?utf-8?B?TGpjbkx6aEwxYkxHNXowdWZnNFFndkxLb1BPZFlpdlZVZXJGSG4yS2t6eWJx?=
 =?utf-8?B?WGt2aExKcTZ6ZkRhdEVReFlMR2RUZ2pkcVluY2s5NlRBbGs2MUxqNGN1dGgw?=
 =?utf-8?B?S1pzQnJsaTNIZVBBNytMUTBoV0pVbUNhRGoyOGlhT0cyRWhxSHZianMzT0pG?=
 =?utf-8?B?cW0wU1NVZ3Y5R3Jja0JsY1lPM1BiRDM1dmE2Q3Z2RUc5enRMVVJ6Y0RLeElw?=
 =?utf-8?B?S1phN2F6b3lGYWtpNFIzUHpiSG1JQXZFMUxITEdaR24zSVBsT1FhV3Jhc2hE?=
 =?utf-8?B?UHpnUVFoc1NNTzd3QXUrZVI3QXVYdlB6R29ONDYvN2hIYmN3ZllJQmlKODFQ?=
 =?utf-8?B?bHlDL2duNE10bDJ5eE1tYjQ0aDJLVE1WdFlkb3RpNHZXWGc2WGd1NHNwMWs4?=
 =?utf-8?B?dmFQU0kyWVh2RmRxS0pSY3VxRERWN1NKekVlNitsdTMrem41MExYSENLcjRO?=
 =?utf-8?B?Ymc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZQ0PR01MB1062.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: 842f8379-fa2d-4076-3744-08dc16760365
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jan 2024 09:32:09.8492 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jDvevVGYvwiSZzwtEMy/nhQx81rjzMzOY34O1LbDGLlr5HhWa1+2NilQgBMOI3mxMaaPa5bZShvAG03Ii0bl1wZbz0w8bmBe9Zvb6Pp5NhE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ0PR01MB1270
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
Cc: "conor+dt@kernel.org" <conor+dt@kernel.org>,
 Keith Zhao <keith.zhao@starfivetech.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "dave.stevenson@raspberrypi.com" <dave.stevenson@raspberrypi.com>,
 "sam@ravnborg.org" <sam@ravnborg.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "mripard@kernel.org" <mripard@kernel.org>,
 Jack Zhu <jack.zhu@starfivetech.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 "wahrenst@gmx.net" <wahrenst@gmx.net>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "quic_jesszhan@quicinc.com" <quic_jesszhan@quicinc.com>,
 "airlied@gmail.com" <airlied@gmail.com>,
 Changhuang Liang <changhuang.liang@starfivetech.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIE5laWwNCg0KVGhhbmtzIGZvciB5b3VyIGNvbW1lbnQuDQoNCj4gLS0tLS1PcmlnaW5hbCBN
ZXNzYWdlLS0tLS0NCj4gRnJvbTogbmVpbC5hcm1zdHJvbmdAbGluYXJvLm9yZyA8bmVpbC5hcm1z
dHJvbmdAbGluYXJvLm9yZz4NCj4gU2VudDogMjAyNOW5tDHmnIg55pelIDE5OjE5DQo+IFRvOiBT
aGVuZ3lhbmcgQ2hlbiA8c2hlbmd5YW5nLmNoZW5Ac3RhcmZpdmV0ZWNoLmNvbT47DQo+IGRldmlj
ZXRyZWVAdmdlci5rZXJuZWwub3JnOyBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+
IENjOiBxdWljX2plc3N6aGFuQHF1aWNpbmMuY29tOyBzYW1AcmF2bmJvcmcub3JnOyBhaXJsaWVk
QGdtYWlsLmNvbTsNCj4gZGFuaWVsQGZmd2xsLmNoOyBtYWFydGVuLmxhbmtob3JzdEBsaW51eC5p
bnRlbC5jb207IG1yaXBhcmRAa2VybmVsLm9yZzsNCj4gdHppbW1lcm1hbm5Ac3VzZS5kZTsgcm9i
aCtkdEBrZXJuZWwub3JnOw0KPiBrcnp5c3p0b2Yua296bG93c2tpK2R0QGxpbmFyby5vcmc7IGNv
bm9yK2R0QGtlcm5lbC5vcmc7IHdhaHJlbnN0QGdteC5uZXQ7DQo+IGRhdmUuc3RldmVuc29uQHJh
c3BiZXJyeXBpLmNvbTsgdGhpZXJyeS5yZWRpbmdAZ21haWwuY29tOyBDaGFuZ2h1YW5nDQo+IExp
YW5nIDxjaGFuZ2h1YW5nLmxpYW5nQHN0YXJmaXZldGVjaC5jb20+OyBLZWl0aCBaaGFvDQo+IDxr
ZWl0aC56aGFvQHN0YXJmaXZldGVjaC5jb20+OyBKYWNrIFpodSA8amFjay56aHVAc3RhcmZpdmV0
ZWNoLmNvbT47DQo+IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcNCj4gU3ViamVjdDogUmU6
IFtQQVRDSCB2MiAwLzJdIEFkZCB3YXZlc2hhcmUgN2luY2ggdG91Y2hzY3JlZW4gcGFuZWwgc3Vw
cG9ydA0KPiANCj4gSGksDQo+IA0KPiBPbiAwOS8wMS8yMDI0IDA4OjA5LCBTaGVuZ3lhbmcgQ2hl
biB3cm90ZToNCj4gPiBUaGlzIHBhdGNoc2V0IGFkZHMgd2F2ZXNoYXJlIDdpbmNoIHRvdWNoc2Ny
ZWVuIHBhbmVsIHN1cHBvcnQgZm9yIHRoZQ0KPiA+IFN0YXJGaXZlIEpINzExMCBTb0MuDQo+IA0K
PiBDb3VsZCB5b3UgcHJlY2lzZSB3aGljaCBTS1UgeW91J3JlIHJlZmVycmluZyB0byA/IGlzIGl0
IDE5ODg1ID0+DQo+IGh0dHBzOi8vd3d3LndhdmVzaGFyZS5jb20vN2luY2gtZHNpLWxjZC5odG0g
Pw0KPiANCg0KeWVzLCBpdCBpcw0Kc29ycnkgZm9yIGNvbmZ1c2luZyB5b3UuDQoNCj4gQXJlIHlv
dSBzdXJlIGl0IHJlcXVpcmVzIGRpZmZlcmVudCB0aW1pbmdzIGZyb20gdGhlIFJQaSBvbmUgPyBJ
biB0aGUgV2F2ZXNoYXJlDQo+IHdpa2kgaXQgZXhwbGljaXRseSB1c2VzIHRoZSBycGkgc2V0dXAg
KHZjNC1rbXMtZHNpLTdpbmNoKSB0byBkcml2ZSBpdDoNCj4gaHR0cHM6Ly93d3cud2F2ZXNoYXJl
LmNvbS93aWtpLzdpbmNoX0RTSV9MQ0QNCj4gDQoNClJlZmVycmluZyB0byBLZWl0aCdzIGFuc3dl
cg0KaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvYXJjaGl2ZXMvZHJpLWRldmVsLzIwMjMt
RGVjZW1iZXIvNDM0MjAwLmh0bWwNCnRoZSBwYW5lbCB0aW1pbmcgdmFsdWUgaXMgZ2VuZXJhdGVk
IHRvIGZpdCBwaHkncyBiaXRyYXRlIGFuZCBwcmV2ZW50IG92ZXJmbG93IGFuZCB1bmRlcmZsb3cu
DQoNClJlZmVycmluZyB0byB0aGUgc3VnZ2VzdGlvbiwgd2UgbWF5IHRyeSBvdGhlciB0aW1pbmcg
ZnJvbSBwYW5lbC1zaW1wbGUgdG8gZHJpdmUgdGhlIHBhbmVsLg0KDQo+IE5laWwNCj4gDQo+ID4N
Cj4gPg0KPiA+IGNoYW5nZXMgc2luY2UgdjE6DQo+ID4gLSBSZWJhc2VkIG9uIHRhZyB2Ni43Lg0K
PiA+DQo+ID4gcGF0Y2ggMToNCj4gPiAtIEdhdmUgdXAgb3JpZ2luYWwgY2hhbmdpbmcuDQo+ID4g
LSBDaGFuZ2VkIHRoZSBjb21taXQgbWVzc2FnZS4NCj4gPiAtIEFkZCBjb21wYXRpYmxlIGluIHBh
bmVsLXNpbXBsZS55YW1sDQo+ID4NCj4gPiBwYXRjaCAyOg0KPiA+IC0gR2F2ZSB1cCBvcmlnaW5h
bCBjaGFuZ2luZy4NCj4gPiAtIENoYW5nZWQgdGhlIGNvbW1pdCBtZXNzYWdlLg0KPiA+IC0gQWRk
IG5ldyBtb2RlIGZvciB0aGUgcGFuZWwgaW4gcGFuZWwtc2ltcGxlLmMNCj4gPg0KPiA+IHYxOg0K
PiA+IGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9kcmktZGV2ZWwvY292ZXIv
MjAyMzExMjQxMDQ0NTEuNDQNCj4gPiAyNzEtMS1zaGVuZ3lhbmcuY2hlbkBzdGFyZml2ZXRlY2gu
Y29tLw0KPiA+DQo+ID4gU2hlbmd5YW5nIENoZW4gKDIpOg0KPiA+ICAgIGR0LWJpbmRpbmdzOiBk
aXNwbGF5OiBwYW5lbDogcGFuZWwtc2ltcGxlOiBBZGQgY29tcGF0aWJsZSBwcm9wZXJ0eSBmb3IN
Cj4gPiAgICAgIHdhdmVzaGFyZSA3aW5jaCB0b3VjaHNjcmVlbiBwYW5lbA0KPiA+ICAgIGdwdTog
ZHJtOiBwYW5lbDogcGFuZWwtc2ltcGxlOiBhZGQgbmV3IGRpc3BsYXkgbW9kZSBmb3Igd2F2ZXNo
YXJlDQo+ID4gICAgICA3aW5jaCB0b3VjaHNjcmVlbiBwYW5lbA0KPiA+DQo+ID4gICAuLi4vYmlu
ZGluZ3MvZGlzcGxheS9wYW5lbC9wYW5lbC1zaW1wbGUueWFtbCAgfCAgMiArKw0KPiA+ICAgZHJp
dmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXNpbXBsZS5jICAgICAgICAgIHwgMjgNCj4gKysrKysr
KysrKysrKysrKysrKw0KPiA+ICAgMiBmaWxlcyBjaGFuZ2VkLCAzMCBpbnNlcnRpb25zKCspDQo+
ID4NCg0KDQpCZXN0IFJlZ2FyZHMsDQpTaGVuZ3lhbmcNCg==
