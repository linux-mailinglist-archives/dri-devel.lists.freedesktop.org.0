Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 306FF47A05
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2019 08:26:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 297CD890B3;
	Mon, 17 Jun 2019 06:26:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140050.outbound.protection.outlook.com [40.107.14.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F67B89067;
 Mon, 17 Jun 2019 06:26:13 +0000 (UTC)
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB4973.eurprd08.prod.outlook.com (10.255.158.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.12; Mon, 17 Jun 2019 06:26:09 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::206b:5cf6:97e:1358]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::206b:5cf6:97e:1358%7]) with mapi id 15.20.1987.014; Mon, 17 Jun 2019
 06:26:09 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 07/59] drm/arm/komeda: Remove DRIVER_HAVE_IRQ
Thread-Topic: [PATCH 07/59] drm/arm/komeda: Remove DRIVER_HAVE_IRQ
Thread-Index: AQHVJNWMDOvXPj85WEO9gWrcTOKR7A==
Date: Mon, 17 Jun 2019 06:26:08 +0000
Message-ID: <20190617062602.GA23827@james-ThinkStation-P300>
References: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
 <20190614203615.12639-8-daniel.vetter@ffwll.ch>
In-Reply-To: <20190614203615.12639-8-daniel.vetter@ffwll.ch>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.9.4 (2018-02-28)
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK2PR0401CA0018.apcprd04.prod.outlook.com
 (2603:1096:202:2::28) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5286bf6e-e0df-4d75-224b-08d6f2ecaf26
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VE1PR08MB4973; 
x-ms-traffictypediagnostic: VE1PR08MB4973:
x-ms-exchange-purlcount: 2
nodisclaimer: True
x-microsoft-antispam-prvs: <VE1PR08MB497331B790B69C5A1C7B4DD1B3EB0@VE1PR08MB4973.eurprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0071BFA85B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(7916004)(396003)(346002)(39850400004)(136003)(366004)(376002)(199004)(189003)(966005)(4326008)(6116002)(3846002)(25786009)(66066001)(86362001)(6486002)(53936002)(6306002)(1076003)(186003)(2906002)(6436002)(6246003)(6512007)(9686003)(256004)(14444005)(26005)(68736007)(55236004)(81166006)(316002)(76176011)(66946007)(102836004)(229853002)(73956011)(305945005)(66556008)(66446008)(7736002)(64756008)(33716001)(5660300002)(52116002)(71200400001)(478600001)(8936002)(33656002)(486006)(446003)(11346002)(6916009)(81156014)(54906003)(66476007)(99286004)(71190400001)(14454004)(6506007)(386003)(8676002)(58126008)(476003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB4973;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: a9zSpWD5ohLajJH9TVkD4x1zMpW5eTu8QgM4b7Dbf161y5pL1W5MVlU4IsufBbgl2KmBQiv246Z7BEDmn5FpDsHsJuXpCidOqUw7gvR+17VcUVyRjjw8UwXN4LDa4emQNY6sH8Ut9DoY5+7WgR9g9pZzuFB8HcJXFwHvwMDPu6ixNJyMIDgWIpiJQnCS8MligvS0RK93lLAPmMygRye4aubY2As8Ix5fbJFYIPLCWuTBUgzZgQPrRnAejnAaGFso8ULvO5glF1uitc9K6WjrmUeEpTp/DlOeuILF8KSWmIRuPag2ssDmqFSh/dy2NM0z6C8bhFTPETDbGFFxYR5XKSCbLBoRTFMeFKJC921HavRrPQV8NWpTXo8X+yqNjPASf60NUHSSGHkk8ZiLENcp90JgtJ+tZVLui9tkcusWMx8=
Content-ID: <EC68FB5B546A5048BAA9BC8659D820EF@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5286bf6e-e0df-4d75-224b-08d6f2ecaf26
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jun 2019 06:26:09.0615 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: james.qian.wang@arm.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4973
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M4onRTZ/zSPlkywEGxeVpy1ydqK+/AAUVsCOLK9H5iU=;
 b=eSuqL1KvyQCYdENUUK5pxB1ErpFuFn6ibsMthE6FZ23utFbjljVm0YsYHFzsp98iG9H317wAfY+MpW80Eft3yVjPSQUF3P5YbJA2JPwl9Rb7jehyytOTNgPFv20501Yn7iPCKw5IIDhrtR+PLl9k02zYbT5kN8A8Ajkcbbry+44=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
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
Cc: Ayan Halder <Ayan.Halder@arm.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Liviu Dudau <Liviu.Dudau@arm.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>, nd <nd@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdW4gMTQsIDIwMTkgYXQgMTA6MzU6MjNQTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBSZWFkIHRoZSBkb2NzLCBrb21lZGEgaXMgbm90IGFuIG9sZCBlbm91Z2ggZHJpdmVy
IGZvciB0aGlzIDotKQo+IAo+IFNpZ25lZC1vZmYtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52
ZXR0ZXJAaW50ZWwuY29tPgo+IENjOiAiSmFtZXMgKFFpYW4pIFdhbmciIDxqYW1lcy5xaWFuLndh
bmdAYXJtLmNvbT4KPiBDYzogTGl2aXUgRHVkYXUgPGxpdml1LmR1ZGF1QGFybS5jb20+Cj4gLS0t
Cj4gIGRyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2ttcy5jIHwgMyAr
LS0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9r
bXMuYyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2ttcy5jCj4g
aW5kZXggMGM2Mzk2ZGMzMjNmLi5iOWQ2OTljYzdiYmYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfa21zLmMKPiArKysgYi9kcml2ZXJzL2dw
dS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9rbXMuYwo+IEBAIC01NSw4ICs1NSw3IEBA
IHN0YXRpYyBpcnFyZXR1cm5fdCBrb21lZGFfa21zX2lycV9oYW5kbGVyKGludCBpcnEsIHZvaWQg
KmRhdGEpCj4gIH0KPiAgCj4gIHN0YXRpYyBzdHJ1Y3QgZHJtX2RyaXZlciBrb21lZGFfa21zX2Ry
aXZlciA9IHsKPiAtCS5kcml2ZXJfZmVhdHVyZXMgPSBEUklWRVJfR0VNIHwgRFJJVkVSX01PREVT
RVQgfCBEUklWRVJfQVRPTUlDIHwKPiAtCQkJICAgRFJJVkVSX0hBVkVfSVJRLAo+ICsJLmRyaXZl
cl9mZWF0dXJlcyA9IERSSVZFUl9HRU0gfCBEUklWRVJfTU9ERVNFVCB8IERSSVZFUl9BVE9NSUMs
Cj4gIAkubGFzdGNsb3NlCQkJPSBkcm1fZmJfaGVscGVyX2xhc3RjbG9zZSwKPiAgCS5pcnFfaGFu
ZGxlcgkJCT0ga29tZWRhX2ttc19pcnFfaGFuZGxlciwKCkhpIERhbmllbDoKClRoYW5rIHlvdSBm
b3IgdGhlIHBhdGNoLgoKQW5kIEF5YW4gYWxzbyBzZW50IHR3byBwYXRjaGVzIGZvciB0aGlzIHRv
cGljLiBsaWtlOgoKRm9yIGRyb3AgZHJtX2lycV9pbnN0YWxsOgpodHRwczovL3BhdGNod29yay5m
cmVlZGVza3RvcC5vcmcvc2VyaWVzLzYxNzYzLwpGb3IgbWFudWFsbHkgc2V0IGRybS0+aXJxX2Vu
YWJsZWQ6Cmh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvNjE3NzYvCgpG
b3IgY2xlYXIsIHNlZW1zIHdlJ2QgYmV0dGVyIHNxdWFzaCBhbGwgdGhlc2UgdGhyZWUgcGF0Y2hl
cyBpbnRvIG9uZQpzaW5nbGUgcGF0Y2guCgpIaSBBeWFuOgpDb3VsZCB5b3UgaGVscCB0aGUgc3F1
YXNoIGFsbCB0aGVzZSBwYXRjaGVzIHRvIGEgc2luZ2xlIG9uZS4KClRoYW5rcwpKYW1lcwoKPiAg
CS5nZW1fZnJlZV9vYmplY3RfdW5sb2NrZWQJPSBkcm1fZ2VtX2NtYV9mcmVlX29iamVjdCwKPiAt
LSAKPiAyLjIwLjEKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
