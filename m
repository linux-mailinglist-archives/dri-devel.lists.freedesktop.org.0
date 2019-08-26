Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5E6E9D7C9
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2019 22:53:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE8936E303;
	Mon, 26 Aug 2019 20:53:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680089.outbound.protection.outlook.com [40.107.68.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63F076E303
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2019 20:53:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ONKbVZgBy4Dxx74Qv8kLB46qRzTYVEhu2VVKN9WW+PQT4lj/QsHMBh9CXM5vBhUHSr7x+3XpCX4NB6tQu1758BV+YI2xKLNjBwL8zfLaSYEpxgRen6SQW9o1U5HoBvdzFtP2DoaxCVdZx/iAqOeBahUK6eGzqLuDdePmGh0Z1sXUDbwHTGwg7Vl6BK3P0j8WW5AZwrMvAJ/vYm2BYri54v3JYl5gdVGRkUaLE9btr8UJaDyx9OZIIn0l5N0DAy8NVTdyPuqpzNyjzuXgdi+DktQ9Kw3ImSgHut90+ZWs8dlxg+9WTaP2f3w4lGMCwNrjI3PQ56xtFg0AMHY/N8bPKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZjLJy6JaWD5SfCngaYugtFibzovC8cu9MNEbWlhOj0A=;
 b=HJ6MBdl/EkroFaDmBFfOFnSFJOLdejbPpLDa0LK2UeDXJHH7KbiWhtaNIfyvKok5l3pzlDxaX2ZCGKGeO+JDBhevyW+So/LY5QjEDr+46Z6tytcqJdZ5diU7qTS8HuGVH3f3sHmrmaz/LKlQkXhIvOE5bz9JafzPLCvYLILZ7OgO1rF96j11+FdXfBm80L0ScP1iEuZQxOH0hfVtaZJ5llTgY/IUC1AGxXjmKKp+jmWIA41kDc0o1zh54ctKl8yJlOhLwKBYLj3fR4s5z2rXI1Wp6Dth80QVOghMkMr/LF5xQKyMWKOvexvPiQz06Kb67P80t1PqNKwpRa1lpDnpnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com (10.172.79.7) by
 CY4PR1201MB0152.namprd12.prod.outlook.com (10.172.77.136) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.16; Mon, 26 Aug 2019 20:52:59 +0000
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::540f:1eae:7e3a:c6b2]) by CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::540f:1eae:7e3a:c6b2%5]) with mapi id 15.20.2178.023; Mon, 26 Aug 2019
 20:52:59 +0000
From: Harry Wentland <hwentlan@amd.com>
To: "Francis, David" <David.Francis@amd.com>, "Wentland, Harry"
 <Harry.Wentland@amd.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v8 5/6] drm/dp_mst: Add new quirk for Synaptics MST hubs
Thread-Topic: [PATCH v8 5/6] drm/dp_mst: Add new quirk for Synaptics MST hubs
Thread-Index: AQHVXDjgnqsfprJEHECWkv7kxp6H1KcNyeYAgAACkYCAABuRgA==
Date: Mon, 26 Aug 2019 20:52:59 +0000
Message-ID: <e9c1d24c-fb2c-d083-c156-522151d23a6c@amd.com>
References: <20190826180507.17802-1-David.Francis@amd.com>
 <20190826180507.17802-6-David.Francis@amd.com>
 <19bb6ec0-61c7-ad3b-608f-85974586fcfc@amd.com>
 <BYAPR12MB3224CAE206357175878B70B5EFA10@BYAPR12MB3224.namprd12.prod.outlook.com>
In-Reply-To: <BYAPR12MB3224CAE206357175878B70B5EFA10@BYAPR12MB3224.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.250]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-clientproxiedby: YTBPR01CA0006.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::19) To CY4PR1201MB0230.namprd12.prod.outlook.com
 (2603:10b6:910:1e::7)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a6676259-1c53-435f-9786-08d72a6760aa
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:CY4PR1201MB0152; 
x-ms-traffictypediagnostic: CY4PR1201MB0152:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR1201MB015208F250943D6B2EDED99F8CA10@CY4PR1201MB0152.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 01415BB535
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(396003)(136003)(366004)(376002)(39860400002)(51914003)(189003)(199004)(66476007)(53546011)(6506007)(36756003)(6246003)(102836004)(66946007)(26005)(386003)(256004)(14444005)(6306002)(446003)(25786009)(486006)(71190400001)(71200400001)(2501003)(476003)(2616005)(6512007)(186003)(229853002)(31686004)(65806001)(65956001)(66066001)(6486002)(11346002)(6116002)(3846002)(31696002)(81156014)(81166006)(8676002)(8936002)(14454004)(305945005)(53936002)(478600001)(7736002)(2906002)(5660300002)(110136005)(58126008)(76176011)(66446008)(64756008)(66556008)(966005)(99286004)(6436002)(52116002)(316002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR1201MB0152;
 H:CY4PR1201MB0230.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: yxl1K/LBbnjjL1AficZgIpcCGiG/fUXqpdw2DfwFA8KmoXnKvlQbA2rHFd+yUCghXymqcuAaHI9j5cpNJ8SESx97n8PFafCAUdk86RNg5qaZBM8otQ+mkz0tcnRcDvysAJRWRl9ZV9PrOLib+AJIx81Fic8Wn2CPFC1p2Mf55djoDym9dyr4EikbnSuks5qFdQseTIseC+GFoh6J1KSraUv21ocGYjVDMn0xOZGeVhPN4aAMbOIx7yqhxRDkN5ORg5+90HJFi9ajzvDYl4MLE6prTXonAqXZPtATRdc3r2YRasrvtzidoMLuzYdDMSkiZamQbBB6mjWRbSshhsfQRbL1cfjgkyQ7HyKKb1KA9ruE/wunZ7ejtwZR+5GanSL0ySBHBOT3k53yxjx4HrsDJTDPxtFmuFklMS9DVxHtKtM=
Content-ID: <F07595F1BD033A4FAE664F4F2ACFADF3@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6676259-1c53-435f-9786-08d72a6760aa
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2019 20:52:59.0544 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zGy0TqKOTySxkOKrv7mZW2mL01wV/uDetRC97Z9OiD4sO+iMWtB1kYdJNbxCbnZtj0obCojjFCHNAYOK0WCH+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0152
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZjLJy6JaWD5SfCngaYugtFibzovC8cu9MNEbWlhOj0A=;
 b=G4l1fhdaflIWfBBkJuIeM47wwFmat5OhhrJDTIszYApT9M/1OoJ8E33/VCSgxD5QvAPfa8GE3YPGdxZbKNTsfmg94CxoTYtoRio1VK/0mW8xze/wu5pL+wT1p9ALLWPzzxbbULIJ58luC5ALK7Z0KPDdWUuv76rhr7StSjhnJRY=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Harry.Wentland@amd.com; 
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS0wOC0yNiAzOjE0IHAubS4sIEZyYW5jaXMsIERhdmlkIHdyb3RlOg0KPiBPbiAyMDE5
LTA4LTI2IDI6MDUgcC5tLiwgRGF2aWQgRnJhbmNpcyB3cm90ZToNCj4+PiBTeW5hcHRpY3MgRFAx
LjQgaHVicyAoQlJBTkNIX0lEIDB4OTBDQzI0KSBkbyBub3QNCj4+PiBzdXBwb3J0IHZpcnR1YWwg
RFBDRCByZWdpc3RlcnMsIGJ1dCBkbyBzdXBwb3J0IERTQy4NCj4+PiBUaGUgRFNDIGNhcHMgY2Fu
IGJlIHJlYWQgZnJvbSB0aGUgcGh5c2ljYWwgYXV4LA0KPj4+IGxpa2UgaW4gU1NUIERTQy4gVGhl
c2UgaHVicyBoYXZlIG1hbnkgZGlmZmVyZW50DQo+Pj4gREVWSUNFX0lEcy4gIEFkZCBhIG5ldyBx
dWlyayB0byBkZXRlY3QgdGhpcyBjYXNlLg0KPj4+DQo+Pj4gQ2M6IEx5dWRlIFBhdWwgPGx5dWRl
QHJlZGhhdC5jb20+DQo+Pj4gQ2M6IEphbmkgTmlrdWxhIDxqYW5pLm5pa3VsYUBsaW51eC5pbnRl
bC5jb20+DQo+Pj4gU2lnbmVkLW9mZi1ieTogRGF2aWQgRnJhbmNpcyA8RGF2aWQuRnJhbmNpc0Bh
bWQuY29tPg0KPj4+IC0tLQ0KPj4+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX2RwX2hlbHBlci5jIHwg
MiArKw0KPj4+ICBpbmNsdWRlL2RybS9kcm1fZHBfaGVscGVyLmggICAgIHwgNyArKysrKysrDQo+
Pj4gIDIgZmlsZXMgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspDQo+Pj4NCj4+PiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9oZWxwZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1f
ZHBfaGVscGVyLmMNCj4+PiBpbmRleCAyY2MyMWVmZjRjZjMuLmZjMzkzMjNlN2Q1MiAxMDA2NDQN
Cj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX2hlbHBlci5jDQo+Pj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL2RybV9kcF9oZWxwZXIuYw0KPj4+IEBAIC0xMjcwLDYgKzEyNzAsOCBAQCBz
dGF0aWMgY29uc3Qgc3RydWN0IGRwY2RfcXVpcmsgZHBjZF9xdWlya19saXN0W10gPSB7DQo+Pj4g
ICAgICAgIHsgT1VJKDB4MDAsIDB4MTAsIDB4ZmEpLCBERVZJQ0VfSURfQU5ZLCBmYWxzZSwgQklU
KERQX0RQQ0RfUVVJUktfTk9fUFNSKSB9LA0KPj4+ICAgICAgICAvKiBDSDc1MTEgc2VlbXMgdG8g
bGVhdmUgU0lOS19DT1VOVCB6ZXJvZWQgKi8NCj4+PiAgICAgICAgeyBPVUkoMHgwMCwgMHgwMCwg
MHgwMCksIERFVklDRV9JRCgnQycsICdIJywgJzcnLCAnNScsICcxJywgJzEnKSwgZmFsc2UsIEJJ
VChEUF9EUENEX1FVSVJLX05PX1NJTktfQ09VTlQpIH0sDQo+Pj4gKyAgICAgLyogU3luYXB0aWNz
IERQMS40IE1TVCBodWJzIGNhbiBzdXBwb3J0IERTQyB3aXRob3V0IHZpcnR1YWwgRFBDRCAqLw0K
Pj4+ICsgICAgIHsgT1VJKDB4OTAsIDB4Q0MsIDB4MjQpLCBERVZJQ0VfSURfQU5ZLCB0cnVlLCBC
SVQoRFBfRFBDRF9RVUlSS19EU0NfV0lUSE9VVF9WSVJUVUFMX0RQQ0QpIH0sDQo+Pg0KPj4gVGhp
cyBzZWVtcyB0byBiZSBnZW5lcmljIE9VSSBmb3IgU3luYXB0aWNzIFsxXS4gQ291bGQgdGhpcyBj
YXVzZSB1cyB0bw0KPj4gY2FzdCB0aGUgbmV0IHRvbyB3aWRlPw0KPj4NCj4+IEV2ZW4gaWYgd2Ug
Y2hlY2sgdGhhdCBpdCdzIERQX0RQQ0RfUkVWID49IDEuNCB0aGVyZSdzIGEgZ29vZCBjaGFuY2UN
Cj4+IFN5bmFwdGljcyBpcyBmaXhpbmcgdGhpcyBpbiB0aGUgZnV0dXJlIGFuZCB3b24ndCByZXF1
aXJlIHRoZSBxdWlyay4NCj4+DQo+PiBbMV0gaHR0cHM6Ly9hcnVsam9obi5jb20vbWFjL3ZlbmRv
ci9TeW5hcHRpY3MNCj4+DQo+Pg0KPj4gSGFycnkNCj4gDQo+IEl0J3Mgbm90IHByZXR0eSwgYnV0
DQo+IC0gQ3VycmVudGx5IHRoZSBuZXQgb2YgImFsbCBTeW5hcHRpY3MgZGV2aWNlcyB3aXRoIHJl
dj5EUDEuNCIgY2F0Y2hlcyBldmVyeSBkZXZpY2Ugd2UgY2FyZSBhYm91dCBhbmQgbm9uZSB3ZSBk
b24ndA0KPiAtIElmIGEgZnV0dXJlIFN5bmFwdGljcyBkZXZpY2Ugc3VwcG9ydHMgdmlydHVhbCBE
UENEIHByb3Blcmx5LCB3ZSB3aWxsIGNoZWNrIGZvciB0aGF0IGZpcnN0IGFuZCBuZXZlciByZXNv
cnQgdG8gdGhlIHdvcmthcm91bmQgKHNlZSBwYXRjaCA2LzYpDQo+IC0gV2UgZG9uJ3Qga25vdyBh
bnkgb2YgdGhlIHByb3BlcnRpZXMgb2YgYW55IGh5cG90aGV0aWNhbCBmdXR1cmUgU3luYXB0aWNz
IGhhcmR3YXJlLCBzbyB3ZSBjYW4ndCBjcmVhdGUgY2FzZXMgZm9yIHRoZW0gbm93DQo+IA0KDQpU
aGF0J3MgZmFpciBlbm91Z2guIFRoYW5rcyBmb3IgdGhlIGV4cGxhbmF0aW9uLg0KDQpSZXZpZXdl
ZC1ieTogSGFycnkgV2VudGxhbmQgPGhhcnJ5LndlbnRsYW5kQGFtZC5jb20+DQoNCkhhcnJ5DQoN
Cj4gQWxzbywgcmVjZWl2ZWQgb2ZmbGluZSByZXZpZXcgZnJvbSBBTUQgTVNUIERTQyAoTm9uLUxp
bnV4KSBleHBlcnQgV2VuamluZyBMaXUsIGdpdmluZyBtZSBwZXJtaXNzaW9uICBvIG1hcmsgdGhp
cyBwYXRjaA0KPiBSZXZpZXdlZC1ieTogV2VuamluZyBMaXUgPFdlbmppbmcuTGl1QGFtZC5jb20+
DQo+IA0KPj4NCj4+PiAgfTsNCj4+Pg0KPj4+ICAjdW5kZWYgT1VJDQo+Pj4gZGlmZiAtLWdpdCBh
L2luY2x1ZGUvZHJtL2RybV9kcF9oZWxwZXIuaCBiL2luY2x1ZGUvZHJtL2RybV9kcF9oZWxwZXIu
aA0KPj4+IGluZGV4IDgzNjQ1MDJmOTJjZi4uYTEzMzFiMDg3MDVmIDEwMDY0NA0KPj4+IC0tLSBh
L2luY2x1ZGUvZHJtL2RybV9kcF9oZWxwZXIuaA0KPj4+ICsrKyBiL2luY2x1ZGUvZHJtL2RybV9k
cF9oZWxwZXIuaA0KPj4+IEBAIC0xNDM0LDYgKzE0MzQsMTMgQEAgZW51bSBkcm1fZHBfcXVpcmsg
ew0KPj4+ICAgICAgICAgKiBUaGUgZHJpdmVyIHNob3VsZCBpZ25vcmUgU0lOS19DT1VOVCBkdXJp
bmcgZGV0ZWN0aW9uLg0KPj4+ICAgICAgICAgKi8NCj4+PiAgICAgICAgRFBfRFBDRF9RVUlSS19O
T19TSU5LX0NPVU5ULA0KPj4+ICsgICAgIC8qKg0KPj4+ICsgICAgICAqIEBEUF9EUENEX1FVSVJL
X0RTQ19XSVRIT1VUX1ZJUlRVQUxfRFBDRDoNCj4+PiArICAgICAgKg0KPj4+ICsgICAgICAqIFRo
ZSBkZXZpY2Ugc3VwcG9ydHMgTVNUIERTQyBkZXNwaXRlIG5vdCBzdXBwb3J0aW5nIFZpcnR1YWwg
RFBDRC4NCj4+PiArICAgICAgKiBUaGUgRFNDIGNhcHMgY2FuIGJlIHJlYWQgZnJvbSB0aGUgcGh5
c2ljYWwgYXV4IGluc3RlYWQuDQo+Pj4gKyAgICAgICovDQo+Pj4gKyAgICAgRFBfRFBDRF9RVUlS
S19EU0NfV0lUSE9VVF9WSVJUVUFMX0RQQ0QsDQo+Pj4gIH07DQo+Pj4NCj4+PiAgLyoqDQo+IA0K
PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQo+IEZyb206IFdlbnRs
YW5kLCBIYXJyeSA8SGFycnkuV2VudGxhbmRAYW1kLmNvbT4NCj4gU2VudDogQXVndXN0IDI2LCAy
MDE5IDM6MDUgUE0NCj4gVG86IEZyYW5jaXMsIERhdmlkOyBkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjggNS82XSBkcm0vZHBfbXN0OiBBZGQg
bmV3IHF1aXJrIGZvciBTeW5hcHRpY3MgTVNUIGh1YnMNCj4gDQo+IE9uIDIwMTktMDgtMjYgMjow
NSBwLm0uLCBEYXZpZCBGcmFuY2lzIHdyb3RlOg0KPj4gU3luYXB0aWNzIERQMS40IGh1YnMgKEJS
QU5DSF9JRCAweDkwQ0MyNCkgZG8gbm90DQo+PiBzdXBwb3J0IHZpcnR1YWwgRFBDRCByZWdpc3Rl
cnMsIGJ1dCBkbyBzdXBwb3J0IERTQy4NCj4+IFRoZSBEU0MgY2FwcyBjYW4gYmUgcmVhZCBmcm9t
IHRoZSBwaHlzaWNhbCBhdXgsDQo+PiBsaWtlIGluIFNTVCBEU0MuIFRoZXNlIGh1YnMgaGF2ZSBt
YW55IGRpZmZlcmVudA0KPj4gREVWSUNFX0lEcy4gIEFkZCBhIG5ldyBxdWlyayB0byBkZXRlY3Qg
dGhpcyBjYXNlLg0KPj4NCj4+IENjOiBMeXVkZSBQYXVsIDxseXVkZUByZWRoYXQuY29tPg0KPj4g
Q2M6IEphbmkgTmlrdWxhIDxqYW5pLm5pa3VsYUBsaW51eC5pbnRlbC5jb20+DQo+PiBTaWduZWQt
b2ZmLWJ5OiBEYXZpZCBGcmFuY2lzIDxEYXZpZC5GcmFuY2lzQGFtZC5jb20+DQo+PiAtLS0NCj4+
ICBkcml2ZXJzL2dwdS9kcm0vZHJtX2RwX2hlbHBlci5jIHwgMiArKw0KPj4gIGluY2x1ZGUvZHJt
L2RybV9kcF9oZWxwZXIuaCAgICAgfCA3ICsrKysrKysNCj4+ICAyIGZpbGVzIGNoYW5nZWQsIDkg
aW5zZXJ0aW9ucygrKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2Rw
X2hlbHBlci5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9oZWxwZXIuYw0KPj4gaW5kZXggMmNj
MjFlZmY0Y2YzLi5mYzM5MzIzZTdkNTIgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
ZHJtX2RwX2hlbHBlci5jDQo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX2hlbHBlci5j
DQo+PiBAQCAtMTI3MCw2ICsxMjcwLDggQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBkcGNkX3F1aXJr
IGRwY2RfcXVpcmtfbGlzdFtdID0gew0KPj4gICAgICAgeyBPVUkoMHgwMCwgMHgxMCwgMHhmYSks
IERFVklDRV9JRF9BTlksIGZhbHNlLCBCSVQoRFBfRFBDRF9RVUlSS19OT19QU1IpIH0sDQo+PiAg
ICAgICAvKiBDSDc1MTEgc2VlbXMgdG8gbGVhdmUgU0lOS19DT1VOVCB6ZXJvZWQgKi8NCj4+ICAg
ICAgIHsgT1VJKDB4MDAsIDB4MDAsIDB4MDApLCBERVZJQ0VfSUQoJ0MnLCAnSCcsICc3JywgJzUn
LCAnMScsICcxJyksIGZhbHNlLCBCSVQoRFBfRFBDRF9RVUlSS19OT19TSU5LX0NPVU5UKSB9LA0K
Pj4gKyAgICAgLyogU3luYXB0aWNzIERQMS40IE1TVCBodWJzIGNhbiBzdXBwb3J0IERTQyB3aXRo
b3V0IHZpcnR1YWwgRFBDRCAqLw0KPj4gKyAgICAgeyBPVUkoMHg5MCwgMHhDQywgMHgyNCksIERF
VklDRV9JRF9BTlksIHRydWUsIEJJVChEUF9EUENEX1FVSVJLX0RTQ19XSVRIT1VUX1ZJUlRVQUxf
RFBDRCkgfSwNCj4gDQo+IFRoaXMgc2VlbXMgdG8gYmUgZ2VuZXJpYyBPVUkgZm9yIFN5bmFwdGlj
cyBbMV0uIENvdWxkIHRoaXMgY2F1c2UgdXMgdG8NCj4gY2FzdCB0aGUgbmV0IHRvbyB3aWRlPw0K
PiANCj4gRXZlbiBpZiB3ZSBjaGVjayB0aGF0IGl0J3MgRFBfRFBDRF9SRVYgPj0gMS40IHRoZXJl
J3MgYSBnb29kIGNoYW5jZQ0KPiBTeW5hcHRpY3MgaXMgZml4aW5nIHRoaXMgaW4gdGhlIGZ1dHVy
ZSBhbmQgd29uJ3QgcmVxdWlyZSB0aGUgcXVpcmsuDQo+IA0KPiBbMV0gaHR0cHM6Ly9hcnVsam9o
bi5jb20vbWFjL3ZlbmRvci9TeW5hcHRpY3MNCj4gDQo+IEhhcnJ5DQo+IA0KPj4gIH07DQo+Pg0K
Pj4gICN1bmRlZiBPVUkNCj4+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9kcm1fZHBfaGVscGVy
LmggYi9pbmNsdWRlL2RybS9kcm1fZHBfaGVscGVyLmgNCj4+IGluZGV4IDgzNjQ1MDJmOTJjZi4u
YTEzMzFiMDg3MDVmIDEwMDY0NA0KPj4gLS0tIGEvaW5jbHVkZS9kcm0vZHJtX2RwX2hlbHBlci5o
DQo+PiArKysgYi9pbmNsdWRlL2RybS9kcm1fZHBfaGVscGVyLmgNCj4+IEBAIC0xNDM0LDYgKzE0
MzQsMTMgQEAgZW51bSBkcm1fZHBfcXVpcmsgew0KPj4gICAgICAgICogVGhlIGRyaXZlciBzaG91
bGQgaWdub3JlIFNJTktfQ09VTlQgZHVyaW5nIGRldGVjdGlvbi4NCj4+ICAgICAgICAqLw0KPj4g
ICAgICAgRFBfRFBDRF9RVUlSS19OT19TSU5LX0NPVU5ULA0KPj4gKyAgICAgLyoqDQo+PiArICAg
ICAgKiBARFBfRFBDRF9RVUlSS19EU0NfV0lUSE9VVF9WSVJUVUFMX0RQQ0Q6DQo+PiArICAgICAg
Kg0KPj4gKyAgICAgICogVGhlIGRldmljZSBzdXBwb3J0cyBNU1QgRFNDIGRlc3BpdGUgbm90IHN1
cHBvcnRpbmcgVmlydHVhbCBEUENELg0KPj4gKyAgICAgICogVGhlIERTQyBjYXBzIGNhbiBiZSBy
ZWFkIGZyb20gdGhlIHBoeXNpY2FsIGF1eCBpbnN0ZWFkLg0KPj4gKyAgICAgICovDQo+PiArICAg
ICBEUF9EUENEX1FVSVJLX0RTQ19XSVRIT1VUX1ZJUlRVQUxfRFBDRCwNCj4+ICB9Ow0KPj4NCj4+
ICAvKioNCj4+DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
