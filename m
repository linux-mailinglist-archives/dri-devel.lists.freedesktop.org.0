Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A16064988A
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2019 07:04:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 780036E0D8;
	Tue, 18 Jun 2019 05:04:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20067.outbound.protection.outlook.com [40.107.2.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6348B6E0D5;
 Tue, 18 Jun 2019 05:04:53 +0000 (UTC)
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB4718.eurprd08.prod.outlook.com (10.255.115.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.11; Tue, 18 Jun 2019 05:04:50 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::206b:5cf6:97e:1358]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::206b:5cf6:97e:1358%7]) with mapi id 15.20.1987.014; Tue, 18 Jun 2019
 05:04:50 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 07/59] drm/arm/komeda: Remove DRIVER_HAVE_IRQ
Thread-Topic: [PATCH 07/59] drm/arm/komeda: Remove DRIVER_HAVE_IRQ
Thread-Index: AQHVJNWMDOvXPj85WEO9gWrcTOKR7A==
Date: Tue, 18 Jun 2019 05:04:50 +0000
Message-ID: <20190618050444.GA3199@james-ThinkStation-P300>
References: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
 <20190614203615.12639-8-daniel.vetter@ffwll.ch>
 <20190617062602.GA23827@james-ThinkStation-P300>
 <20190617134345.GA12905@phenom.ffwll.local>
 <20190618044132.GA2660@james-ThinkStation-P300>
In-Reply-To: <20190618044132.GA2660@james-ThinkStation-P300>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.9.4 (2018-02-28)
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK2PR0302CA0018.apcprd03.prod.outlook.com
 (2603:1096:202::28) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 985a0eeb-6ab7-4e76-d4c3-08d6f3aa7dd1
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VE1PR08MB4718; 
x-ms-traffictypediagnostic: VE1PR08MB4718:
x-ms-exchange-purlcount: 3
nodisclaimer: True
x-microsoft-antispam-prvs: <VE1PR08MB4718ADF52591005B855FBF95B3EA0@VE1PR08MB4718.eurprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 007271867D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(7916004)(346002)(376002)(136003)(39860400002)(396003)(366004)(189003)(199004)(66476007)(2906002)(305945005)(68736007)(486006)(6916009)(186003)(55236004)(6506007)(76176011)(102836004)(14444005)(6116002)(3846002)(26005)(14454004)(6436002)(6512007)(53936002)(256004)(86362001)(9686003)(386003)(71200400001)(6306002)(99286004)(66066001)(81156014)(1076003)(476003)(11346002)(446003)(7736002)(58126008)(8676002)(8936002)(966005)(52116002)(6246003)(66446008)(73956011)(54906003)(64756008)(6486002)(71190400001)(229853002)(66556008)(25786009)(5660300002)(81166006)(478600001)(33656002)(33716001)(4326008)(66946007)(316002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB4718;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ex0cNSnjgktHmusupJvZ6TegtqRjovLYAjOtiHve0l+b41JA+EvH0brDzikEBx/P+ywK1LR3BsaG08FvnNA81A5iWc+oD9eqNZjZBLXF80KAo8SzdYMrxsgnevILzJqz24Nzf6fFo/XSc7w1SP0J9Zh4rZY8B8j49nhaipRs/WOvLk6+6NWyFM8z+3fuBP94HmNiQFzsrzvwF7+Z0ZwDrrrr2hzFYBAawPPkECB7rSdm4Axo4GHmC7Q8pwl4ru8U9Uidsy+qNUfcCGPj5UkCqTlneG2O5JBVTrmiLOT6/8LUZZuYj+J0gzKlUO0xeQjZuvPBp4x3RFLzz8eg/F1MiYF9jAJFU8zcP1VPXbDag9ee9ht8PT5GTLd+3UCmd1Bf2tthARjLNZe6/+E592NUBUTU2qEGAmpdjGE6w0Yw1sQ=
Content-ID: <08EB673BCEB0B84396DCDAB4EE0DAFEC@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 985a0eeb-6ab7-4e76-d4c3-08d6f3aa7dd1
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2019 05:04:50.4864 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: james.qian.wang@arm.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4718
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o8eEWyHY5dH3yRfNsn2r1eKDdz34wVLUSpjx1HQeXhA=;
 b=wHbKuUhc4pMesjozswODJDmtn3Y8kHUajrcJUJVKAnAzvLCJ50ZR8Lu1rx4b9OnNbIqRDD8EWQL0Pckhltc1ShXQzEDzgEUPDRG7MRtjyqVzY2WFHLEU/gSvJREd6ZPuvdwVeCbrx5pgJk6TDtsqVqoYkW0Y++jL4OZlIOI6+Hg=
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
Cc: nd <nd@arm.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Liviu Dudau <Liviu.Dudau@arm.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>, Ayan Halder <Ayan.Halder@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdW4gMTgsIDIwMTkgYXQgMTI6NDE6MzJQTSArMDgwMCwgSmFtZXMgKFFpYW4pIFdh
bmcgd3JvdGU6Cj4gT24gTW9uLCBKdW4gMTcsIDIwMTkgYXQgMDM6NDM6NDVQTSArMDIwMCwgRGFu
aWVsIFZldHRlciB3cm90ZToKPiA+IE9uIE1vbiwgSnVuIDE3LCAyMDE5IGF0IDA2OjI2OjA4QU0g
KzAwMDAsIGphbWVzIHFpYW4gd2FuZyAoQXJtIFRlY2hub2xvZ3kgQ2hpbmEpIHdyb3RlOgo+ID4g
PiBPbiBGcmksIEp1biAxNCwgMjAxOSBhdCAxMDozNToyM1BNICswMjAwLCBEYW5pZWwgVmV0dGVy
IHdyb3RlOgo+ID4gPiA+IFJlYWQgdGhlIGRvY3MsIGtvbWVkYSBpcyBub3QgYW4gb2xkIGVub3Vn
aCBkcml2ZXIgZm9yIHRoaXMgOi0pCj4gPiA+ID4gCj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogRGFu
aWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+Cj4gPiA+ID4gQ2M6ICJKYW1lcyAo
UWlhbikgV2FuZyIgPGphbWVzLnFpYW4ud2FuZ0Bhcm0uY29tPgo+ID4gPiA+IENjOiBMaXZpdSBE
dWRhdSA8bGl2aXUuZHVkYXVAYXJtLmNvbT4KPiA+ID4gPiAtLS0KPiA+ID4gPiAgZHJpdmVycy9n
cHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfa21zLmMgfCAzICstLQo+ID4gPiA+ICAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDIgZGVsZXRpb25zKC0pCj4gPiA+ID4gCj4g
PiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29t
ZWRhX2ttcy5jIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfa21z
LmMKPiA+ID4gPiBpbmRleCAwYzYzOTZkYzMyM2YuLmI5ZDY5OWNjN2JiZiAxMDA2NDQKPiA+ID4g
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9rbXMuYwo+
ID4gPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2tt
cy5jCj4gPiA+ID4gQEAgLTU1LDggKzU1LDcgQEAgc3RhdGljIGlycXJldHVybl90IGtvbWVkYV9r
bXNfaXJxX2hhbmRsZXIoaW50IGlycSwgdm9pZCAqZGF0YSkKPiA+ID4gPiAgfQo+ID4gPiA+ICAK
PiA+ID4gPiAgc3RhdGljIHN0cnVjdCBkcm1fZHJpdmVyIGtvbWVkYV9rbXNfZHJpdmVyID0gewo+
ID4gPiA+IC0JLmRyaXZlcl9mZWF0dXJlcyA9IERSSVZFUl9HRU0gfCBEUklWRVJfTU9ERVNFVCB8
IERSSVZFUl9BVE9NSUMgfAo+ID4gPiA+IC0JCQkgICBEUklWRVJfSEFWRV9JUlEsCj4gPiA+ID4g
KwkuZHJpdmVyX2ZlYXR1cmVzID0gRFJJVkVSX0dFTSB8IERSSVZFUl9NT0RFU0VUIHwgRFJJVkVS
X0FUT01JQywKPiA+ID4gPiAgCS5sYXN0Y2xvc2UJCQk9IGRybV9mYl9oZWxwZXJfbGFzdGNsb3Nl
LAo+ID4gPiA+ICAJLmlycV9oYW5kbGVyCQkJPSBrb21lZGFfa21zX2lycV9oYW5kbGVyLAo+IAo+
IFNpbmNlIG9uY2Uga29tZWRhIGhhZCBkcm9wcGVkIGRybV9pcnFfaW5zdGFsbCwgd2UgZG9uJ3Qg
bmVlZCB0byBleHBvc2UKPiB0aGlzIGlycV9oYW5kbGVyIHRvIGRybSBhcyB3ZWxsLCBTbyBJIHdh
bnQgaXJxX2hhbmRsZXIgYW5kIERSSVZFUl9IQVZFX0lSUQo+IHRvIGJlIHJlbW92ZWQgdG9nZXRo
ZXIgd2l0aCB0aGUgZHJvcCBwYXRjaC4KPiAKPiBJIHRoaW5rIGJldHRlciBwdXQgdGhlIHJlcGxh
Y2VtZW50IGluIG9uZSBwYXRjaC4KPiAKPiBUaGFua3MKPiBKYW1lcwoKU29ycnksIHBsZWFzZSBp
Z25vcmUgbXkgbGFzdCByZXBseS4KCkkgdGhvdWdodCBEUklWRVJfSEFWRV9JUlEgaXMgYSBpbmRp
Y2F0b3IgZm9yIHRoZSBkcm1fZHJpdmVyLT5pcnFfaGFuZGxlci4KCkl0IGlzIE5PVC4KClRoYW5r
cyBmb3IgeW91ciBwYXRjaCBEYW5pZWw6CgpSZXZpZXdlZC1ieTogSmFtZXMgUWlhbiBXYW5nIChB
cm0gVGVjaG5vbG9neSBDaGluYSkgPGphbWVzLnFpYW4ud2FuZ0Bhcm0uY29tPgoKPiA+ID4gCj4g
PiA+IEhpIERhbmllbDoKPiA+ID4gCj4gPiA+IFRoYW5rIHlvdSBmb3IgdGhlIHBhdGNoLgo+ID4g
PiAKPiA+ID4gQW5kIEF5YW4gYWxzbyBzZW50IHR3byBwYXRjaGVzIGZvciB0aGlzIHRvcGljLiBs
aWtlOgo+ID4gPiAKPiA+ID4gRm9yIGRyb3AgZHJtX2lycV9pbnN0YWxsOgo+ID4gPiBodHRwczov
L3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvc2VyaWVzLzYxNzYzLwo+ID4gPiBGb3IgbWFudWFs
bHkgc2V0IGRybS0+aXJxX2VuYWJsZWQ6Cj4gPiA+IGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNr
dG9wLm9yZy9zZXJpZXMvNjE3NzYvCj4gPiA+IAo+ID4gPiBGb3IgY2xlYXIsIHNlZW1zIHdlJ2Qg
YmV0dGVyIHNxdWFzaCBhbGwgdGhlc2UgdGhyZWUgcGF0Y2hlcyBpbnRvIG9uZQo+ID4gPiBzaW5n
bGUgcGF0Y2guCj4gPiAKPiA+IE5vdCBzdXJlIGhvdyB0aGVzZSBvdGhlciBwYXRjaGVzIGFyZSBy
ZWxhdGVkIHRvIG1pbmUgZGlyZWN0bHkuIFRoaXMgaGVyZQo+ID4ganVzdCByZW1vdmVzIGEgZmxh
ZyB3aGljaCBkb2VzIG5vdGhpbmcsIGJlY2F1c2Uga29tZWRhIGlzIG5vdCBhIGxlZ2FjeQo+ID4g
ZHJpdmVyLiBBbmQgYWNrIGZvciBtZXJnaW5nIHJpZ2h0IGF3YXkgd291bGQgYmUgbmljZS4KPiA+
IAo+ID4gVGhhbmtzLCBEYW5pZWwKPiA+IAo+ID4gPiAKPiA+ID4gSGkgQXlhbjoKPiA+ID4gQ291
bGQgeW91IGhlbHAgdGhlIHNxdWFzaCBhbGwgdGhlc2UgcGF0Y2hlcyB0byBhIHNpbmdsZSBvbmUu
Cj4gPiA+IAo+ID4gPiBUaGFua3MKPiA+ID4gSmFtZXMKPiA+ID4gCj4gPiA+ID4gIAkuZ2VtX2Zy
ZWVfb2JqZWN0X3VubG9ja2VkCT0gZHJtX2dlbV9jbWFfZnJlZV9vYmplY3QsCj4gPiA+ID4gLS0g
Cj4gPiA+ID4gMi4yMC4xCj4gPiAKPiA+IC0tIAo+ID4gRGFuaWVsIFZldHRlcgo+ID4gU29mdHdh
cmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCj4gPiBodHRwOi8vYmxvZy5mZndsbC5jaApf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
