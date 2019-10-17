Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 02B06DB340
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2019 19:26:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E641D6EA1B;
	Thu, 17 Oct 2019 17:26:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740087.outbound.protection.outlook.com [40.107.74.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A73526EA03;
 Thu, 17 Oct 2019 17:25:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eBqrhiYWibA/UmvAeWQKXyQn895TAdX/0u29Xe9mjNiyrt6x6txTNtrESw2WwjPDqhNXfNQbmkbeJSgnvFtrScbvaXg/Bp8MF4VTNk9qjlYZNlDAvNA3xj4BCzPVMas9Vsd3XbggV5hExFVcRo6+nR6KH2w4n/kPbFxVYUCHghjqsyAX99LMbTniXOrl0BZ6SoYspUpTMkw9wqYIraieVc04eUq9XmQ90qlEQAwAU8kNjyFUn4093TkkKycUMOaZYU1HzOk+enu3gwjbwenEeTu2wD8vRpftr+DMBncTUP4pnoGbwIGWgtWVqYWCJLEyeR78nO6ZiovkvdYjNBUB7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ipj1K7lazRPPXKwpCOHBzCewLAQqHt12fEgWOhj4SQU=;
 b=MLme7oICJYrhbDi0mQ80R8pDsoqJLTM3zKfz8aOrIM7/UCYJiviBr7zJBrQPazPZxDChSzhP+kTCkJm5uYODegABbkLsAJpvYsIoeeyPFtktK+Phro86WiJ7G1RTy3a/dIlD1iVIdGBXC0herPHyVNISHaCtMYQRuVVZxD8lFeDeQeLBGGtzfrgX08UopiPcswZPHLzpav1LNdyjt8QrZYoAflovERvLd6rGu0VYq9bcsrQ0tKsmqjV6Aq1f2Rqsdi2UdLPDkSFBid2ouS7qnzXWyffrvRF8zEUnlUyA6yZ48gbUR/P/15dyqxWuakD2D5agEqp4y7il9eIWP+hfoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BN7PR12MB2593.namprd12.prod.outlook.com (20.176.27.87) by
 BN7PR12MB2692.namprd12.prod.outlook.com (20.176.176.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.18; Thu, 17 Oct 2019 17:25:57 +0000
Received: from BN7PR12MB2593.namprd12.prod.outlook.com
 ([fe80::dd2e:828d:7e1e:7c66]) by BN7PR12MB2593.namprd12.prod.outlook.com
 ([fe80::dd2e:828d:7e1e:7c66%7]) with mapi id 15.20.2347.024; Thu, 17 Oct 2019
 17:25:57 +0000
From: "Li, Sun peng (Leo)" <Sunpeng.Li@amd.com>
To: =?utf-8?B?THVrw6HFoSBLcmVqxI3DrQ==?= <lskrejci@gmail.com>, "Wentland,
 Harry" <Harry.Wentland@amd.com>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>, "Koo, Anthony" <Anthony.Koo@amd.com>, "Cheng,
 Tony" <Tony.Cheng@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [RFC PATCH RESEND] drm/amd/display: Add back missing backlight
 level rounding
Thread-Topic: [RFC PATCH RESEND] drm/amd/display: Add back missing backlight
 level rounding
Thread-Index: AQHVg5OhHgDCjd19j069u2MouP0jWadfGLQA
Date: Thu, 17 Oct 2019 17:25:57 +0000
Message-ID: <d05d1e23-b32a-632c-4d89-33d4ba9df6ee@amd.com>
References: <20191015200304.30470-1-lskrejci@gmail.com>
In-Reply-To: <20191015200304.30470-1-lskrejci@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTXPR0101CA0053.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::30) To BN7PR12MB2593.namprd12.prod.outlook.com
 (2603:10b6:408:25::23)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ea43d6da-c89e-454c-05ba-08d753271218
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: BN7PR12MB2692:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN7PR12MB26925A9C1CEC7EF4895A1F1A826D0@BN7PR12MB2692.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 01930B2BA8
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(39860400002)(346002)(366004)(136003)(51914003)(199004)(189003)(64756008)(66446008)(2906002)(25786009)(71190400001)(71200400001)(4001150100001)(99286004)(478600001)(966005)(54906003)(66066001)(110136005)(14454004)(5660300002)(31686004)(52116002)(5024004)(305945005)(66476007)(6116002)(316002)(66556008)(3846002)(6306002)(7736002)(6506007)(66946007)(386003)(6486002)(36756003)(446003)(76176011)(2501003)(8676002)(11346002)(53546011)(6512007)(186003)(26005)(4326008)(102836004)(6246003)(2616005)(229853002)(6436002)(81156014)(8936002)(81166006)(476003)(86362001)(486006)(31696002)(256004)(14444005)(921003)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN7PR12MB2692;
 H:BN7PR12MB2593.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2++Fj+RO+7sxe4vUelA/uwB488TfdVLYdSb5CC0Wy+v8b19kkCy+l6Ax2cuKr31KAgO4BocbrsLaTno2HXQ5Ymyq0vbFu60mjmhndFLVhinIMbLtMr9yNgtHD/qZrlD4R3QNydI3Vh02e7b+eGpRrNYS7Iw2TUdhB+gG22iJwcwCZ0tR+Eyfy0c7LaLTw8i0xrGy2vAsP92nazxm4bgMY57a/IBN7EbMDthM+8DNFSzU2JcCYtI7y7l4tRj0IEybfkHH32elol1IybN3Kps47Zph54X7N8Z5IrNFL1nex6RrAITXyfNSbxhH41d4jSPD1apzrBeY6ADvngSDrgKTHV1OwFQyH4L8N0w7vpoJamjEPixZUVs1SuZdosJzbgCWcOOIbm6BtP6ZMMFnOCD9P/IsymgPJ+4e4o66jq6JnqN676JagrVaoxVDL2Cvuizf7kZ4m+a8QVpLgsS/aLP5GQ==
Content-ID: <5C41AB69C5C69244A25C1A624845305B@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea43d6da-c89e-454c-05ba-08d753271218
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Oct 2019 17:25:57.1497 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vjCxvRjDqUhn1/sP4Uc+vxNQxvXn1CB5VwALxZk8Pht0mdcjWcbkyoEHIGd/m9rQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR12MB2692
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ipj1K7lazRPPXKwpCOHBzCewLAQqHt12fEgWOhj4SQU=;
 b=FVYW31iNcArMGhFWpaCxwu6UkTey/DKXX68gqWjUnWlZC2qvWb9wSCkDgxzdTZ3VYFi0/Z1uzeQtwuO5JoMUd1+5/V/8X7/DZdWrDNr7QUFc1K5/tuFMItHTeJWe5dhojT2dlZrFe9xNHiF/Ne4LaEAoXEQh3cfeITjWzHkUFeA=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Sunpeng.Li@amd.com; 
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: David Airlie <airlied@linux.ie>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhhbmtzIGZvciB0aGUgZGV0YWlsZWQgbm90ZXMhIFNlZSByZXBseSBpbmxpbmUuDQoNCk9uIDIw
MTktMTAtMTUgNDowMyBwLm0uLCBMdWvDocWhIEtyZWrEjcOtIHdyb3RlOg0KPiBbV2h5XQ0KPiBI
YXZpbmcgdGhlIHJvdW5kaW5nIG9mIHRoZSBiYWNrbGlnaHQgdmFsdWUgcmVzdG9yZWQgdG8gdGhl
IHdheSBpdCB3YXMNCj4gc2VlbWluZ2x5IGdldHMgcmlkIG9mIGJhY2tsaWdodCBmbGlja2VyaW5n
IG9uIGNlcnRhaW4gU3RvbmV5IFJpZGdlDQo+IGxhcHRvcHMuDQo+IA0KPiBbSG93XQ0KPiBSZXNj
YWxlIHRoZSBiYWNrbGlnaHQgbGV2ZWwgYmV0d2VlbiBtaW4gYW5kIG1heCBpbnB1dCBzaWduYWwg
dmFsdWUgYW5kDQo+IHJvdW5kIGl0IHRvIGEgbnVtYmVyIGJldHdlZW4gMHgwIGFuZCAweEZGLiBU
aGVuLCB1c2UgdGhlIHJvdW5kaW5nIG1vZGUNCj4gdGhhdCB3YXMgcHJldmlvdXNseSBpbiBkcml2
ZXJfc2V0X2JhY2tsaWdodF9sZXZlbCgpIGFuZA0KPiBkbWN1X3NldF9iYWNrbGlnaHRfbGV2ZWwo
KSwgaS5lLiByZXNjYWxlIHRoZSBiYWNrbGlnaHQgbGV2ZWwgYmV0d2VlbiAweDANCj4gYW5kIDB4
MTAwMCBieSBtdWx0aXBseWluZyBpdCBieSAweDEwMSBhbmQgdXNlIHRoZSBtb3N0IHNpZ25pZmlj
YW50IGJpdA0KPiBvZiB0aGUgZnJhY3Rpb24gKG9yIGluIHRoaXMgY2FzZSB0aGUgOHRoIGJpdCBv
ZiB0aGUgdmFsdWUgYmVjYXVzZSBpdCdzDQo+IHRoZSBzYW1lIHRoaW5nLCBlLmcuIEMzICogMHgx
MDEgPSAweEMzQzMgYW5kIEMzICogMHgxMDEwMSA9IDB4QzNDM0MzKSB0bw0KPiByb3VuZCBpdC4N
Cj4gDQo+IEZpeGVzOiAyNjI0ODVhNTBmZDQgKCJkcm0vYW1kL2Rpc3BsYXk6IEV4cGFuZCBkYyB0
byB1c2UgMTYuMTYgYml0IGJhY2tsaWdodCIpDQo+IEJ1Z3ppbGxhOiBodHRwczovL2J1Z3ppbGxh
Lmtlcm5lbC5vcmcvc2hvd19idWcuY2dpP2lkPTIwNDk1Nw0KPiBTaWduZWQtb2ZmLWJ5OiBMdWvD
ocWhIEtyZWrEjcOtIDxsc2tyZWpjaUBnbWFpbC5jb20+DQo+IC0tLQ0KPiANCj4gTm90ZXM6DQo+
ICAgICBCdWc6DQo+ICAgICAtIENhbiBiZSByZXByb2R1Y2VkIG9uIEhQIDE1LXJiMDIwbmMgKFN0
b25leSBSaWRnZSBSMiBFMi05MDAwZSBBUFUpIGFuZA0KPiAgICAgICBBY2VyIEFzcGlyZSAzIEEz
MTUtMjFHLTkxSkwgKFN0b25leSBSaWRnZSBSMyBBNC05MTIwIEFQVSkuDQo+ICAgICANCj4gICAg
IC0gRm9yIG1lLCB0aGUgYnVnIGlzIGluY29uc2lzdGVudCAtIGl0IGRvZXMgbm90IGhhcHBlbiBv
biBldmVyeSBib290LA0KPiAgICAgICBidXQgaWYgaXQgZG9lcyBoYXBwZW4sIGl0J3MgdXN1YWxs
eSB3aXRoaW4gdGhyZWUgbWludXRlcyBhZnRlciBib290dXAuDQo+ICAgICANCj4gICAgIC0gSXQg
Y29uY2VybnMgdGhlIGJhY2tsaWdodC4gVGhhdCBtZWFucyBpdCBjYW4gYmUgcmVwcm9kdWNlZCBv
biB0aGUNCj4gICAgICAgZnJhbWVidWZmZXIgY29uc29sZS4NCj4gICAgIA0KPiAgICAgLSBSZXBy
b2R1Y2VzIG9uIEFyY2ggTGludXggKGN1c3RvbSBidWlsdCkgbGl2ZSBDRCwgbGludXgga2VybmVs
IHY1LjMuMg0KPiAgICAgICBhbmQgVWJ1bnR1IDE5LjA0LCBrZXJuZWwtcHBhL21haW5saW5lIHY1
LjAuMC1yYzEsIHY1LjAuMCwgdjUuMy4yLCB2NS4zLjQsDQo+ICAgICAgIHY1LjQtcmMyLg0KPiAg
ICAgDQo+ICAgICAtIENhbiBub3QgYmUgcmVwcm9kdWNlZCBvbiBrZXJuZWwgdjUuMy40IHdpdGgg
dGhpcyBwYXRjaCBhcHBsaWVkIG9yIG9uDQo+ICAgICAgIHY0LjIwLjAsIDQuMjAuMTcsIDQuMTku
NzUgKHRoaXMgYnVnIGlzIGEgcmVncmVzc2lvbikuDQo+ICAgICANCj4gICAgIC0gVGhlIG90aGVy
IHBlcnNvbiB0aGF0IHJlcHJvZHVjZWQgdGhlIGlzc3VlIChzZWUgdGhlIEJ1Z3ppbGxhIGxpbmsN
Cj4gICAgICAgYWJvdmUpIGNvbmZpcm1lZCB0aGF0IHRoZSBwYXRjaCB3b3JrcyBmb3IgdGhlbSB0
b28uDQo+ICAgICANCj4gICAgIFBhdGNoOg0KPiAgICAgLSBJcyB0aGUgY29tbWVudCBtb2RpZmll
ZCBieSB0aGlzIGNvbW1pdCBjb3JyZWN0PyBCb3RoDQo+ICAgICAgIGRyaXZlcl9zZXRfYmFja2xp
Z2h0X2xldmVsKCkgYW5kIGRtY3Vfc2V0X2JhY2tsaWdodF9sZXZlbCgpIGNoZWNrIHRoZQ0KPiAg
ICAgICAxN3RoIGJpdCBvZiBgYnJpZ2h0bmVzc2AgYWthIGBiYWNrbGlnaHRfcHdtX3UxNl8xNmAs
IGJ1dA0KPiAgICAgICAyNjI0ODVhNTBmZDQ1MzJhOGQ3MTE2NTE5MGFkYzdhMGExOWJjYzllICgi
ZHJtL2FtZC9kaXNwbGF5OiBFeHBhbmQgZGMNCj4gICAgICAgdG8gdXNlIDE2LjE2IGJpdCBiYWNr
bGlnaHQiKSBzcGVjaWZpY2FsbHkgbWVudGlvbnMgMHhGRkZGIGFzIHRoZSBtYXgNCj4gICAgICAg
YmFja2xpZ2h0IHZhbHVlPiAgICAgDQo+ICAgICAtIHVzZV9zbW9vdGhfYnJpZ2h0bmVzcyBpcyBm
YWxzZSAobm8gRE1DVSBmaXJtd2FyZSBhdmFpbGFibGUpIG9uIG15DQo+ICAgICAgIGxhcHRvcCwg
c28gdGhlIG90aGVyIGNvZGUgcGF0aCAoZG1jdV9zZXRfYmFja2xpZ2h0X2xldmVsKCkpIGlzDQo+
ICAgICAgIHVudGVzdGVkLg0KPiAgICAgDQo+ICAgICAtIEknbSBub3Qgc3VyZSB3aHkgdGhlIHJv
dW5kaW5nIGZpeGVzIHRoZSBpc3N1ZSBhbmQgd2hldGhlciB0aGlzDQo+ICAgICAgIGZ1bmN0aW9u
IGlzIHRoZSByaWdodCBwbGFjZSB0byBhZGQgYmFjayB0aGUgcm91bmRpbmcgKGFuZCB3aGV0aGVy
IGl0DQo+ICAgICAgIGV2ZW4gaXMgdGhlIHJpZ2h0IHdheSB0byBzb2x2ZSB0aGUgaXNzdWUpLCBz
byB0aGF0J3Mgd2h5IHRoaXMgcGF0Y2ggaXMNCj4gICAgICAgUkZDLg0KDQpXZSd2ZSBzZWVuIHNv
bWUgc2ltaWxhciBpc3N1ZXMgd2hlbiBmcmFjdGlvbmFsIGR1dHkgY3ljbGVzIGFyZSBlbmFibGVk
IGZvciBiYWNrbGlnaHQgcHdtLg0KSSBhdHRhY2hlZCBhIGhhY2sgdG8gdGhlIGJ1Z3ppbGxhIHRp
Y2tldCB0aGF0IGRpc2FibGVzIGl0LCBwbGVhc2UgZ2l2ZSB0aGF0IHBhdGNoIGEgc2hvdA0KZmly
c3QuIEknZCByYXRoZXIgbm90IGNoYW5nZSB0aGlzIGNhbGN1bGF0aW9uIGZvciBhbGwgcGFuZWxz
IGlmIHRoZSBmbGlja2VyaW5nIGlzc3VlIGlzDQpvbmx5IGEgcXVpcmsgZm9yIHNvbWUuDQoNClRo
YW5rcywNCkxlbw0KDQo+IA0KPiAgLi4uL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2Ft
ZGdwdV9kbS5jICAgfCAxNyArKysrKysrKysrKy0tLS0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDEx
IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMNCj4gaW5kZXggYTUyZjBiMTNh
MmM4Li5hZjlhNWY0NmI2NzEgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlz
cGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9k
aXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYw0KPiBAQCAtMjA4MywxNyArMjA4MywyMiBAQCBz
dGF0aWMgaW50IGFtZGdwdV9kbV9iYWNrbGlnaHRfdXBkYXRlX3N0YXR1cyhzdHJ1Y3QgYmFja2xp
Z2h0X2RldmljZSAqYmQpDQo+ICAJICogVGhlIGJyaWdodG5lc3MgaW5wdXQgaXMgaW4gdGhlIHJh
bmdlIDAtMjU1DQo+ICAJICogSXQgbmVlZHMgdG8gYmUgcmVzY2FsZWQgdG8gYmUgYmV0d2VlbiB0
aGUNCj4gIAkgKiByZXF1ZXN0ZWQgbWluIGFuZCBtYXggaW5wdXQgc2lnbmFsDQo+IC0JICoNCj4g
LQkgKiBJdCBhbHNvIG5lZWRzIHRvIGJlIHNjYWxlZCB1cCBieSAweDEwMSB0bw0KPiAtCSAqIG1h
dGNoIHRoZSBEQyBpbnRlcmZhY2Ugd2hpY2ggaGFzIGEgcmFuZ2Ugb2YNCj4gLQkgKiAwIHRvIDB4
ZmZmZg0KPiAgCSAqLw0KPiAgCWJyaWdodG5lc3MgPQ0KPiAgCQlicmlnaHRuZXNzDQo+IC0JCSog
MHgxMDENCj4gKwkJKiAweDEwMA0KPiAgCQkqIChjYXBzLm1heF9pbnB1dF9zaWduYWwgLSBjYXBz
Lm1pbl9pbnB1dF9zaWduYWwpDQo+ICAJCS8gQU1ER1BVX01BWF9CTF9MRVZFTA0KPiAtCQkrIGNh
cHMubWluX2lucHV0X3NpZ25hbCAqIDB4MTAxOw0KPiArCQkrIGNhcHMubWluX2lucHV0X3NpZ25h
bCAqIDB4MTAwOw0KPiArDQo+ICsJYnJpZ2h0bmVzcyA9IChicmlnaHRuZXNzID4+IDgpICsgKChi
cmlnaHRuZXNzID4+IDcpICYgMSk7DQo+ICsJLyoNCj4gKwkgKiBJdCBhbHNvIG5lZWRzIHRvIGJl
IHNjYWxlZCB1cCBieSAweDEwMSBhbmQNCj4gKwkgKiByb3VuZGVkIG9mZiB0byBtYXRjaCB0aGUg
REMgaW50ZXJmYWNlIHdoaWNoDQo+ICsJICogaGFzIGEgcmFuZ2Ugb2YgMCB0byAweDEwMDAwDQo+
ICsJICovDQo+ICsJYnJpZ2h0bmVzcyAqPSAweDEwMTsNCj4gKwlicmlnaHRuZXNzICs9IChicmln
aHRuZXNzID4+IDcpICYgMTsNCj4gIA0KPiAgCWlmIChkY19saW5rX3NldF9iYWNrbGlnaHRfbGV2
ZWwoZG0tPmJhY2tsaWdodF9saW5rLA0KPiAgCQkJYnJpZ2h0bmVzcywgMCkpDQo+IA0KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
