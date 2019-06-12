Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B24D41A5D
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2019 04:26:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E329891C0;
	Wed, 12 Jun 2019 02:26:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150089.outbound.protection.outlook.com [40.107.15.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3A41891C0
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 02:26:32 +0000 (UTC)
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB4863.eurprd08.prod.outlook.com (10.255.113.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.12; Wed, 12 Jun 2019 02:26:26 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::206b:5cf6:97e:1358]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::206b:5cf6:97e:1358%7]) with mapi id 15.20.1943.026; Wed, 12 Jun 2019
 02:26:26 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: "Lowry Li (Arm Technology China)" <Lowry.Li@arm.com>, Liviu Dudau
 <Liviu.Dudau@arm.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "seanpaul@chromium.org"
 <seanpaul@chromium.org>, "airlied@linux.ie" <airlied@linux.ie>, Brian Starkey
 <Brian.Starkey@arm.com>, Ayan Halder <Ayan.Halder@arm.com>, "Jonathan Chai
 (Arm Technology China)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Julien
 Yin (Arm Technology China)" <Julien.Yin@arm.com>, nd <nd@arm.com>
Subject: Re: [PATCH v2 2/2] drm/komeda: Adds komeda_kms_drop_master
Thread-Topic: [PATCH v2 2/2] drm/komeda: Adds komeda_kms_drop_master
Thread-Index: AQHVIEa9rsSYE44q6kqYpL+RGmPd3A==
Date: Wed, 12 Jun 2019 02:26:24 +0000
Message-ID: <20190612022617.GA8595@james-ThinkStation-P300>
References: <1560251589-31827-1-git-send-email-lowry.li@arm.com>
 <1560251589-31827-3-git-send-email-lowry.li@arm.com>
 <20190611123038.GC2458@phenom.ffwll.local>
In-Reply-To: <20190611123038.GC2458@phenom.ffwll.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.9.4 (2018-02-28)
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK2PR04CA0045.apcprd04.prod.outlook.com
 (2603:1096:202:14::13) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6852c4ff-562b-4285-933c-08d6eedd5d47
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VE1PR08MB4863; 
x-ms-traffictypediagnostic: VE1PR08MB4863:
x-ms-exchange-purlcount: 2
x-microsoft-antispam-prvs: <VE1PR08MB4863101E88BD1799B569DF52B3EC0@VE1PR08MB4863.eurprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:63;
x-forefront-prvs: 0066D63CE6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(7916004)(366004)(376002)(346002)(396003)(39860400002)(136003)(40434004)(199004)(189003)(53386004)(7736002)(14444005)(66066001)(68736007)(478600001)(6636002)(5024004)(8936002)(256004)(305945005)(33716001)(6246003)(64756008)(66946007)(33656002)(81156014)(229853002)(81166006)(8676002)(587094005)(25786009)(73956011)(1076003)(66556008)(66446008)(66476007)(11346002)(186003)(58126008)(26005)(316002)(99286004)(446003)(486006)(5660300002)(110136005)(2201001)(476003)(14454004)(76176011)(53936002)(6506007)(55236004)(386003)(6306002)(6436002)(2501003)(6486002)(2906002)(9686003)(6512007)(966005)(52116002)(3846002)(71190400001)(6116002)(102836004)(86362001)(71200400001)(921003)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB4863;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: kdlQt8CSxwdpEBxtzuKUwH3zZ6n8zcANwdjACxWgpAAvtOze6lLY0jrNse8oJfiiQVYI6Mz1JF8epvfzygaqwEUNSQ+By4VQ71OFtwA5RIGR/EY77PHarXx4hnxvPkW6oQiOteXTKznYrsEzcApebQLldpGjff0SaX3CkR/HakRisWYWwDi2eii26RLp2gfrdmheHi/q9WQz1O/bOiHgOskr0gahNKVOABIBTXLlBfAO1odiZnKpVHypHUM4716dpjqiudfMBSSq+z8qdrV07b1CiiqnBKDkibxrblOK6wjDFJaXXF+qjMdNljk1KKl+fnPY0UeiAUShc0t5I93vjGlxGi2BZh/wAoKmAN/rxng7efYiHgkgnZWQvvbyJVQLHVOClomdmsjvbz9hNK6jTS8l/gNuAhC/nwsQOULwAF0=
Content-ID: <FA39B6F5C45EBF4BA1044F4DE5F7C6EF@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6852c4ff-562b-4285-933c-08d6eedd5d47
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2019 02:26:26.0217 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: james.qian.wang@arm.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4863
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8NExc82WAxKU7syWnbhUDt3M9YAckfz/ZGNyCsX7spE=;
 b=G2qneKM2UXm4SRPRSVvez4Hfcogn3QjAB45jRY8EdixXw1JQTTlCjXMNBPpuf9H8Je5xEhLe8DxMUzrfPKucOEqnQ45RBEHx3J5/DvXgkLvtTMyhdV+ykyY0BKIGEiI46BIbwcmGttw/sOPtSWOHCQsoN3oxiPhpQfcQfPtayJY=
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdW4gMTEsIDIwMTkgYXQgMDI6MzA6MzhQTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBPbiBUdWUsIEp1biAxMSwgMjAxOSBhdCAxMToxMzo0NUFNICswMDAwLCBMb3dyeSBM
aSAoQXJtIFRlY2hub2xvZ3kgQ2hpbmEpIHdyb3RlOgo+ID4gRnJvbTogIkxvd3J5IExpIChBcm0g
VGVjaG5vbG9neSBDaGluYSkiIDxMb3dyeS5MaUBhcm0uY29tPgo+ID4KPiA+IFRoZSBrb21lZGEg
aW50ZXJuYWwgcmVzb3VyY2VzIChwaXBlbGluZXMpIGFyZSBzaGFyZWQgYmV0d2VlbiBjcnRjcywK
PiA+IGFuZCByZXNvdXJjZXMgcmVsZWFzZSBieSBkaXNhYmxlX2NydGMuIFRoaXMgY29tbWl0IGlz
IHdvcmtpbmcgZm9yIG9uY2UKPiA+IHVzZXIgZm9yZ290IGRpc2FibGluZyBjcnRjIGxpa2UgYXBw
IHF1aXQgYWJub21hbGx5LCBhbmQgdGhlbiB0aGUKPiA+IHJlc291cmNlcyBjYW4gbm90IGJlIHVz
ZWQgYnkgYW5vdGhlciBjcnRjLiBBZGRzIGRyb3BfbWFzdGVyIHRvCj4gPiBzaHV0ZG93biB0aGUg
ZGV2aWNlIGFuZCBtYWtlIHN1cmUgYWxsIHRoZSBrb21lZGEgcmVzb3VyY2VzIGhhdmUgYmVlbgo+
ID4gcmVsZWFzZWQgYW5kIGNhbiBiZSB1c2VkIGZvciB0aGUgbmV4dCB1c2FnZS4KPiA+Cj4gPiBT
aWduZWQtb2ZmLWJ5OiBMb3dyeSBMaSAoQXJtIFRlY2hub2xvZ3kgQ2hpbmEpIDxsb3dyeS5saUBh
cm0uY29tPgo+ID4gLS0tCj4gPiAgZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9r
b21lZGFfa21zLmMgfCAxMyArKysrKysrKysrKysrCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEzIGlu
c2VydGlvbnMoKykKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNw
bGF5L2tvbWVkYS9rb21lZGFfa21zLmMgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29t
ZWRhL2tvbWVkYV9rbXMuYwo+ID4gaW5kZXggODU0Mzg2MC4uNjQ3YmNlNSAxMDA2NDQKPiA+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2ttcy5jCj4gPiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9rbXMuYwo+ID4g
QEAgLTU0LDExICs1NCwyNCBAQCBzdGF0aWMgaXJxcmV0dXJuX3Qga29tZWRhX2ttc19pcnFfaGFu
ZGxlcihpbnQgaXJxLCB2b2lkICpkYXRhKQo+ID4gIHJldHVybiBzdGF0dXM7Cj4gPiAgfQo+ID4K
PiA+ICsvKiBLb21lZGEgaW50ZXJuYWwgcmVzb3VyY2VzIChwaXBlbGluZXMpIGFyZSBzaGFyZWQg
YmV0d2VlbiBjcnRjcywgYW5kIHJlc291cmNlcwo+ID4gKyAqIGFyZSByZWxlYXNlZCBieSBkaXNh
YmxlX2NydGMuIEJ1dCBpZiB1c2VyIGZvcmdldCBkaXNhYmxpbmcgY3J0YyBsaWtlIGFwcCBxdWl0
Cj4gPiArICogYWJub3JtYWxseSwgdGhlIHJlc291cmNlcyBjYW4gbm90IGJlIHVzZWQgYnkgYW5v
dGhlciBjcnRjLgo+ID4gKyAqIFVzZSBkcm9wX21hc3RlciB0byBzaHV0ZG93biB0aGUgZGV2aWNl
IGFuZCBtYWtlIHN1cmUgYWxsIHRoZSBrb21lZGEgcmVzb3VyY2VzCj4gPiArICogaGF2ZSBiZWVu
IHJlbGVhc2VkLCBhbmQgY2FuIGJlIHVzZWQgZm9yIHRoZSBuZXh0IHVzYWdlLgo+ID4gKyAqLwo+
Cj4gTm8uIElmIHdlIHdhbnQgdGhpcywgd2UgbmVlZCB0byBpbXBsZW1lbnQgdGhpcyBhY3Jvc3Mg
ZHJpdmVycywgbm90IHdpdGgKPiBwZXItdmVuZG9yIGhhY2tzLgo+Cj4gVGhlIGtlcm5lbGRvYyBz
aG91bGQgaGF2ZSBiZWVuIGEgc29saWQgaGludDogIk9ubHkgdXNlZCBieSB2bXdnZnguIgo+IC1E
YW5pZWwKCkhpIERhbmllbDoKVGhpcyBkcm9wX21hc3RlciBpcyByZWFsbHkgd2hhdCB3ZSB3YW50
LCBjYW4gd2UgdXBkYXRlIHRoZSBkb2MgYW5kCmFkZCBrb21lZGEgYXMgYSB1c2VyIG9mIHRoaXMg
aGFja3MgbGlrZSAidXNlZCBieSB2bXdmZ3ggYW5kIGtvbWVkYSIsCm9yIG1heWJlIGRpcmVjdGx5
IHByb21vdGUgdGhpcyBwZXItdmVuZG9yIGhhY2tzIGFzIGFuIG9wdGlvbmFsIGNoaXAKZnVuY3Rp
b24gPwoKSmFtZXMKCj4gPiArc3RhdGljIHZvaWQga29tZWRhX2ttc19kcm9wX21hc3RlcihzdHJ1
Y3QgZHJtX2RldmljZSAqZGV2LAo+ID4gKyAgIHN0cnVjdCBkcm1fZmlsZSAqZmlsZV9wcml2KQo+
ID4gK3sKPiA+ICtkcm1fYXRvbWljX2hlbHBlcl9zaHV0ZG93bihkZXYpOwo+ID4gK30KPiA+ICsK
PiA+ICBzdGF0aWMgc3RydWN0IGRybV9kcml2ZXIga29tZWRhX2ttc19kcml2ZXIgPSB7Cj4gPiAg
LmRyaXZlcl9mZWF0dXJlcyA9IERSSVZFUl9HRU0gfCBEUklWRVJfTU9ERVNFVCB8IERSSVZFUl9B
VE9NSUMgfAo+ID4gICAgIERSSVZFUl9QUklNRSB8IERSSVZFUl9IQVZFX0lSUSwKPiA+ICAubGFz
dGNsb3NlPSBkcm1fZmJfaGVscGVyX2xhc3RjbG9zZSwKPiA+ICAuaXJxX2hhbmRsZXI9IGtvbWVk
YV9rbXNfaXJxX2hhbmRsZXIsCj4gPiArLm1hc3Rlcl9kcm9wPSBrb21lZGFfa21zX2Ryb3BfbWFz
dGVyLAo+ID4gIC5nZW1fZnJlZV9vYmplY3RfdW5sb2NrZWQ9IGRybV9nZW1fY21hX2ZyZWVfb2Jq
ZWN0LAo+ID4gIC5nZW1fdm1fb3BzPSAmZHJtX2dlbV9jbWFfdm1fb3BzLAo+ID4gIC5kdW1iX2Ny
ZWF0ZT0ga29tZWRhX2dlbV9jbWFfZHVtYl9jcmVhdGUsCj4gPiAtLQo+ID4gMS45LjEKPiA+Cj4g
PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+ID4gZHJp
LWRldmVsIG1haWxpbmcgbGlzdAo+ID4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+
ID4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWwKPgo+IC0tCj4gRGFuaWVsIFZldHRlcgo+IFNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jw
b3JhdGlvbgo+IGh0dHA6Ly9ibG9nLmZmd2xsLmNoCklNUE9SVEFOVCBOT1RJQ0U6IFRoZSBjb250
ZW50cyBvZiB0aGlzIGVtYWlsIGFuZCBhbnkgYXR0YWNobWVudHMgYXJlIGNvbmZpZGVudGlhbCBh
bmQgbWF5IGFsc28gYmUgcHJpdmlsZWdlZC4gSWYgeW91IGFyZSBub3QgdGhlIGludGVuZGVkIHJl
Y2lwaWVudCwgcGxlYXNlIG5vdGlmeSB0aGUgc2VuZGVyIGltbWVkaWF0ZWx5IGFuZCBkbyBub3Qg
ZGlzY2xvc2UgdGhlIGNvbnRlbnRzIHRvIGFueSBvdGhlciBwZXJzb24sIHVzZSBpdCBmb3IgYW55
IHB1cnBvc2UsIG9yIHN0b3JlIG9yIGNvcHkgdGhlIGluZm9ybWF0aW9uIGluIGFueSBtZWRpdW0u
IFRoYW5rIHlvdS4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
