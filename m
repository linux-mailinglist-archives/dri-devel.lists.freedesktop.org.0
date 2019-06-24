Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 20F2F509A9
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2019 13:23:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16DB089B67;
	Mon, 24 Jun 2019 11:23:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02on0606.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe05::606])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CACA89B67
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 11:23:06 +0000 (UTC)
Received: from VI1PR08MB3696.eurprd08.prod.outlook.com (20.178.13.156) by
 VI1PR08MB5293.eurprd08.prod.outlook.com (20.178.126.208) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.16; Mon, 24 Jun 2019 11:23:03 +0000
Received: from VI1PR08MB3696.eurprd08.prod.outlook.com
 ([fe80::f00e:b5de:6aa:4a64]) by VI1PR08MB3696.eurprd08.prod.outlook.com
 ([fe80::f00e:b5de:6aa:4a64%6]) with mapi id 15.20.2008.014; Mon, 24 Jun 2019
 11:23:03 +0000
From: Brian Starkey <Brian.Starkey@arm.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm/fourcc: Add Arm 16x16 block modifier
Thread-Topic: [PATCH] drm/fourcc: Add Arm 16x16 block modifier
Thread-Index: AQHVKBsKBvRwqAaS30eXmbt21cTJQqamO1MAgART94CAAAdigIAAF3uA
Date: Mon, 24 Jun 2019 11:23:02 +0000
Message-ID: <20190624112301.dmczf2vofxnpzqqi@DESKTOP-E1NTVVP.localdomain>
References: <1561112433-5308-1-git-send-email-raymond.smith@arm.com>
 <CAKMK7uEjh+GrSy5AgbVLVQd1S5oJ8KFiWEUmxtMMVdcMSBtdCQ@mail.gmail.com>
 <20190624093233.73f3tcshewlbogli@DESKTOP-E1NTVVP.localdomain>
 <CAKMK7uG02qAqH8MMpE6kzRO99HTjnadTFDrY1vVr9RmAiFPvJA@mail.gmail.com>
In-Reply-To: <CAKMK7uG02qAqH8MMpE6kzRO99HTjnadTFDrY1vVr9RmAiFPvJA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: NeoMutt/20180716-849-147d51-dirty
x-originating-ip: [217.140.106.55]
x-clientproxiedby: LNXP265CA0064.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5d::28) To VI1PR08MB3696.eurprd08.prod.outlook.com
 (2603:10a6:803:b6::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e896d14c-d1c6-423e-c665-08d6f8965226
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR08MB5293; 
x-ms-traffictypediagnostic: VI1PR08MB5293:
x-ms-exchange-purlcount: 1
nodisclaimer: True
x-microsoft-antispam-prvs: <VI1PR08MB5293E22A088CA5422852CB99F0E00@VI1PR08MB5293.eurprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3826;
x-forefront-prvs: 007814487B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(376002)(366004)(396003)(136003)(39860400002)(199004)(189003)(229853002)(7736002)(305945005)(2906002)(1076003)(81166006)(8676002)(81156014)(8936002)(71190400001)(71200400001)(4326008)(68736007)(66556008)(66476007)(66066001)(73956011)(5660300002)(86362001)(64756008)(66446008)(66946007)(25786009)(478600001)(44832011)(6306002)(386003)(6506007)(99286004)(6512007)(76176011)(9686003)(53546011)(486006)(256004)(6916009)(6436002)(6246003)(53386004)(6486002)(11346002)(476003)(14444005)(52116002)(6116002)(3846002)(53936002)(58126008)(316002)(54906003)(102836004)(186003)(26005)(966005)(72206003)(14454004)(446003)(587094005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB5293;
 H:VI1PR08MB3696.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 8FW0NZ9y6DT6mP22xdeO1UwP5wZKwoHwrPzA3kIBrcYKLCUz9LAnWsYnRN1yIbIbyovBsdbfADjjbInMVU41y8zV6y/PPzEewTiojcJUtrWrZCmiEdFB99eR97iAG+AqUQnh9GEoebWYMQynca9XgKnNAD0cI3f1IRRgOYI/pwxLg1e6mtvP6Bk1AYMnqOQFs/2Lgt+5PUeZSJNG6hiLv0L919r8VVUiKd8ktDpGuJMa0gHgQ6L2Iy4hSQeQssbES1vnD1GpqREAeKJS3IOy4V2QcMWuxayZWNcudk4sGhWcDPhpbJSVmo8v5nCwiP54BN1Y9mYfElQO77CJnur9IFzobTll/f9xeZ1tAZDl/8T0JnMyt7rRKVmPYLaYbqmjBGGpau6bhjlf3BnM1cBZYZo37VyJc+ZmtOvXti3DtjQ=
Content-ID: <EE26A5E2E77051458B19FA94DBC13C81@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e896d14c-d1c6-423e-c665-08d6f8965226
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2019 11:23:02.9787 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Brian.Starkey@arm.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5293
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NU5RfhzATYnNtEbzdJMlg5nJO49fQr6OkPY21klfCjA=;
 b=ODw6DWkrXfKmQzJie9qkjHYISE1j07zlDFs45LObIu6PhdoWNBdp9d2X6urbGNDWZlG+xqAmY90HadbrqbD04LZPF5zDlqATIjcZnI2cpk5iUoDQBHB2H6hgXX3xbcpfLgO/rzOk2c/dFc1GJ0u8YRZ4csCgVFG9FVW0K8Es+jk=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Brian.Starkey@arm.com; 
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
Cc: nd <nd@arm.com>, "maxime.ripard@bootlin.com" <maxime.ripard@bootlin.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "malidp@foss.arm.com" <malidp@foss.arm.com>,
 "yuq825@gmail.com" <yuq825@gmail.com>, Ayan Halder <Ayan.Halder@arm.com>,
 "sean@poorly.run" <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKdW4gMjQsIDIwMTkgYXQgMTE6NTg6NTlBTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBPbiBNb24sIEp1biAyNCwgMjAxOSBhdCAxMTozMiBBTSBCcmlhbiBTdGFya2V5IDxC
cmlhbi5TdGFya2V5QGFybS5jb20+IHdyb3RlOgo+ID4KPiA+IEhpIERhbmllbCwKPiA+Cj4gPiBP
biBGcmksIEp1biAyMSwgMjAxOSBhdCAwNToyNzowMFBNICswMjAwLCBEYW5pZWwgVmV0dGVyIHdy
b3RlOgo+ID4gPiBPbiBGcmksIEp1biAyMSwgMjAxOSBhdCAxMjoyMSBQTSBSYXltb25kIFNtaXRo
IDxSYXltb25kLlNtaXRoQGFybS5jb20+IHdyb3RlOgo+ID4gPiA+Cj4gPiA+ID4gQWRkIHRoZSBE
Uk1fRk9STUFUX01PRF9BUk1fMTZYMTZfQkxPQ0tfVV9JTlRFUkxFQVZFRCBtb2RpZmllciB0bwo+
ID4gPiA+IGRlbm90ZSB0aGUgMTZ4MTYgYmxvY2sgdS1pbnRlcmxlYXZlZCBmb3JtYXQgdXNlZCBp
biBBcm0gVXRnYXJkIGFuZAo+ID4gPiA+IE1pZGdhcmQgR1BVcy4KPiA+ID4gPgo+ID4gPiA+IFNp
Z25lZC1vZmYtYnk6IFJheW1vbmQgU21pdGggPHJheW1vbmQuc21pdGhAYXJtLmNvbT4KPiA+ID4g
PiAtLS0KPiA+ID4gPiAgaW5jbHVkZS91YXBpL2RybS9kcm1fZm91cmNjLmggfCAxMCArKysrKysr
KysrCj4gPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspCj4gPiA+ID4KPiA+
ID4gPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS91YXBpL2RybS9kcm1fZm91cmNjLmggYi9pbmNsdWRl
L3VhcGkvZHJtL2RybV9mb3VyY2MuaAo+ID4gPiA+IGluZGV4IDNmZWVhYTMuLjhlZDdlY2YgMTAw
NjQ0Cj4gPiA+ID4gLS0tIGEvaW5jbHVkZS91YXBpL2RybS9kcm1fZm91cmNjLmgKPiA+ID4gPiAr
KysgYi9pbmNsdWRlL3VhcGkvZHJtL2RybV9mb3VyY2MuaAo+ID4gPiA+IEBAIC03NDMsNiArNzQz
LDE2IEBAIGV4dGVybiAiQyIgewo+ID4gPiA+ICAjZGVmaW5lIEFGQkNfRk9STUFUX01PRF9CQ0gg
ICAgICgxVUxMIDw8IDExKQo+ID4gPiA+Cj4gPiA+ID4gIC8qCj4gPiA+ID4gKyAqIEFybSAxNngx
NiBCbG9jayBVLUludGVybGVhdmVkIG1vZGlmaWVyCj4gPiA+ID4gKyAqCj4gPiA+ID4gKyAqIFRo
aXMgaXMgdXNlZCBieSBBcm0gTWFsaSBVdGdhcmQgYW5kIE1pZGdhcmQgR1BVcy4gSXQgZGl2aWRl
cyB0aGUgaW1hZ2UKPiA+ID4gPiArICogaW50byAxNngxNiBwaXhlbCBibG9ja3MuIEJsb2NrcyBh
cmUgc3RvcmVkIGxpbmVhcmx5IGluIG9yZGVyLCBidXQgcGl4ZWxzCj4gPiA+ID4gKyAqIGluIHRo
ZSBibG9jayBhcmUgcmVvcmRlcmVkLgo+ID4gPiA+ICsgKi8KPiA+ID4gPiArI2RlZmluZSBEUk1f
Rk9STUFUX01PRF9BUk1fMTZYMTZfQkxPQ0tfVV9JTlRFUkxFQVZFRCBcCj4gPiA+ID4gKyAgICAg
ICBmb3VyY2NfbW9kX2NvZGUoQVJNLCAoKDFVTEwgPDwgNTUpIHwgMSkpCj4gPiA+Cj4gPiA+IFRo
aXMgc2VlbXMgdG8gYmUgYW4gZXh0cmVtZWx5IHJhbmRvbSBwaWNrIGZvciBhIG5ldyBudW1iZXIu
IFdoYXQncyB0aGUKPiA+ID4gdGhpbmtpbmcgaGVyZT8gQXNpZGUgZnJvbSAiZG9lc250IG1hdGNo
IGFueSBvZiB0aGUgYWZiYyBjb21ib3MiIG9mYy4KPiA+ID4gSWYgeW91J3JlIGFscmVhZHkgdXAg
dG8gaGF2aW5nIHRocm93biBhd2F5IDU1Yml0cywgdGhlbiBpdCdzIG5vdCBnb2luZwo+ID4gPiB0
byBsYXN0IGxvbmcgcmVhbGx5IDotKQo+ID4gPgo+ID4gPiBJIHRoaW5rIGEgZ29vZCBpZGVhIHdv
dWxkIGJlIHRvIHJlc2VydmUgYSBidW5jaCBvZiB0aGUgaGlnaCBiaXRzIGFzCj4gPiA+IHNvbWUg
Zm9ybSBvZiBpbmRleCAoYWZiYyB3b3VsZCBnZXQgaW5kZXggMCBmb3IgYmFja3dhcmRzIGNvbXBh
dCkuIEFuZAo+ID4gPiB0aGVuIHRoZSBsb3dlciBiaXRzIHdvdWxkIGJlIGZvciBmcmVlIHVzZSBm
b3IgYSBnaXZlbiBpbmRleC9tb2RlLiBBbmQKPiA+ID4gdGhlIGZpcnN0IG1vZGUgaXMgcHJvYmFi
bHkgYW4gZW51bWVyYXRpb24sIHdoZXJlIHBvc3NpYmxlIG1vZGVzIHNpbXBsZQo+ID4gPiBnZXQg
ZW51bWVyYXRlZCB3aXRob3V0IGZ1cnRoZXIgZmxhZ3Mgb3IgYW55dGhpbmcuCj4gPgo+ID4gWXVw
LCB0aGF0J3MgdGhlIHBsYW46Cj4gPgo+ID4gICAgICAgICAoMCA8PCA1NSk6IEFGQkMKPiA+ICAg
ICAgICAgKDEgPDwgNTUpOiBUaGlzICJub24tY2F0ZWdvcnkiIGZvciBVLUludGVybGVhdmVkCj4g
PiAgICAgICAgICgxIDw8IDU0KTogV2hhdGV2ZXIgdGhlIG5leHQgY2F0ZWdvcnkgaXMKPiA+ICAg
ICAgICAgKDMgPDwgNTQpOiBXaGF0ZXZlciBjb21lcyBhZnRlciB0aGF0Cj4gPiAgICAgICAgICgx
IDw8IDUzKTogTWF5YmUgd2UnbGwgZ2V0IGhlcmUgc29tZWRheQo+IAo+IFVoLCBzbyB0aGUgaW5k
ZXggd291bGQgYmUgZW5jb2RlZCB3aXRoIGxlYXN0LXNpZ25pZmljYW50IGJpdCBmaXJzdCwKPiBz
dGFydGluZyBmcm9tIGJpdDU1IGRvd253YXJkcz8gCgpZZWFoLgoKPiBDbGV2ZXIgaWRlYSwgYnV0
IEkgdGhpbmsgdGhpcyBuZWVkcyBhCj4gbWFjcm8gKG9yIGF0IGxlYXN0IGEgY29tbWVudCkuIE5v
dCBzdXJlIHRoZXJlJ3MgYSByZWFkeS1tYWRlIGJpdG1hc2sKPiBtaXJyb3IgZnVuY3Rpb24gZm9y
IHRoaXMgc3R1ZmYsIHdvcmtzIGNhc2Ugd2UgY2FuIGhhbmQtY29kZSBpdCBhbmQKPiBleHRlbmQg
ZXZlcnkgdGltZSB3ZSBuZWVkIG9uZSBtb3JlIGJpdCBlbmNvZGVkLiBTb21ldGhpbmcgbGlrZToK
PiAKPiBNSVJST1JfVTMyKCh1ICYgKEJJVCgwKSkgPDwgMzEgfCAodSAmIEJJVCgxKSA8PCAzMCB8
IC4uLikKPiAKCklzIGl0IHJlYWxseSB3b3J0aCBpdD8gUGVvcGxlIGNhbiBqdXN0IHVzZSB0aGUg
ZGVmaW5pdGlvbnMgYXMgd3JpdHRlbgppbiBkcm1fZm91cmNjLmguIEkgYWdyZWUgdGhhdCB3ZSBz
aG91bGQgaGF2ZSB0aGUgaGlnaCBiaXRzIGRlc2NyaWJlZAppbiBhIGNvbW1lbnQgdGhvdWdoLgoK
PiBBbmQgdGhlbiBzaGlmdCB0aGF0IHRvIHRoZSBjb3JyZWN0IHBsYWNlLiBQcm9iYWJseSB3YW50
IGFuCj4gCj4gQVJNX01PRElGSUVSX0VOQ09ERShzcGFjZV9pZHgsIGZsYWdzKSBtYWNybyB3aGlj
aCBhc3NlbWJsZXMgZXZlcnl0aGluZy4KPiAKPiA+ICAgICAgICAgLi4uCj4gPgo+ID4gSSBkaWRu
J3Qgd2FudCB0byBleHBsaWNpdGx5IHJlc2VydmUgc29tZSBoaWdoIGJpdHMsIGJlY2F1c2Ugd2Un
dmUgbm8KPiA+IGlkZWEgaG93IG1hbnkgdG8gcmVzZXJ2ZS4gVGhpcyB3YXksIHdlIGNhbiBhc3Np
Z24gZXhhY3RseSBhcyBtYW55Cj4gPiBoaWdoIGJpdHMgYXMgd2UgbmVlZCwgd2hlbiB3ZSBuZWVk
IHRoZW0uIElmIGFueSBvZiB0aGUgIm1vZGVzIiBzdGFydAo+ID4gZW5jcm9hY2hpbmcgdG93YXJk
cyB0aGUgaGlnaCBiaXRzLCB3ZSdsbCBoYXZlIHRvIG1ha2UgYSBkZWNpc2lvbiBhdAo+ID4gdGhh
dCBwb2ludC4KPiA+Cj4gPiBBbHNvLCB0aGlzIGlzIHRoZSBvbmx5IFUtSW50ZXJsZWF2ZWQgZm9y
bWF0ICh0aGF0IEkga25vdyBvZiksIHNvIGl0J3MKPiA+IG5vdCB3b3J0aCBjYWxsaW5nIGJpdCA1
NSAiVGhlIFUtSW50ZXJsZWF2ZWQgYml0IiBiZWNhdXNlIHRoYXQgd291bGQgYmUKPiA+IGEgd2Fz
dGUgb2Ygc3BhY2UuIEl0J3MgbW9yZSBsaWtlIHRoZSAibWlzYyIgYml0LCBidXQgdGhhdCdzIG5v
dCBhCj4gPiB1c2VmdWwgbmFtZSB0byBlbnNocmluZSBpbiBVQVBJLgo+IAo+IFllYWggdGhhdCdz
IHdoYXQgSSBtZWFudC4gQWxzbyBiZXR0ZXIgdG8gZXhwbGljaXRseSByZXNlcnZlIHRoaXMsIGku
ZS4KPiAKPiAjZGVmaW5lIEFSTV9GQkNfTU9ESUZJRVJfU1BBQ0UgMAo+ICNkZWZpbmUgQVJNX01J
U0NfTU9ESUZJRVJfU1BBQ0UgMQo+IAo+IGFuZCB0aGVuIGVuY29kZSB3aXRoIHRoZSBtaXJyb3Ig
dHJpY2tlcnkuCj4gCgpJIGRvbid0IHJlYWxseSBzZWUgdGhlIHZhbHVlIGluIHRoYXQgZWl0aGVy
LCBpdCdzIGp1c3QgZ2l2aW5nCnVzZXJzcGFjZSB0aGUgb3Bwb3J0dW5pdHkgdG8gZGVwZW5kIG9u
IG1vcmUgc3R1ZmY6IG1vcmUgZnV0dXJlCmhlYWRhY2hlcy4gU28gbG9uZyBhcyB0aGUgNjQtYml0
IHZhbHVlcyBhcmUgc3RhYmxlLCB0aGF0IHNob3VsZCBiZQplbm91Z2guCgo+ID4gTm90ZSB0aGF0
IGlzbid0IHRoZSBzYW1lIGFzIHRoZSAibm90LUFGQkMgYml0IiwgYmVjYXVzZSB3ZSBtYXkgd2Vs
bAo+ID4gaGF2ZSBzb21ldGhpbmcgaW4gdGhlIGZ1dHVyZSB3aGljaCBpcyBuZWl0aGVyIEFGQkMg
bm9yICJtaXNjIi4KPiA+Cj4gPiBXZSd2ZSBiZWVuIHZlcnkgY2FyZWZ1bCBpbiBvdXIgY29kZSB0
byBlbmZvcmNlIGFsbAo+ID4gdW5kZWZpbmVkL3VucmVjb2duaXNlZCBiaXRzIHRvIGJlIHplcm8s
IHRvIGVuc3VyZSB0aGF0IHRoaXMgd29ya3MuCj4gPgo+ID4gPgo+ID4gPiBUaGUgb3RoZXIgYml0
OiBXb3VsZCBiZSByZWFsIGdvb2QgdG8gZGVmaW5lIHRoZSBmb3JtYXQgYSBiaXQgbW9yZQo+ID4g
PiBwcmVjaXNlbHksIGluY2x1ZGluZyB0aGUgbGF5b3V0IHdpdGhpbiB0aGUgdGlsZS4KPiA+Cj4g
PiBJdCdzIFUtSW50ZXJsZWF2ZWQsIG9idmlvdXNseSA7LSkKPiAKPiA6LSkgSSBtZWFuIGZ1bGwg
Y29kZSBleGlzdHMgaW4gcGFuZnJvc3QvbGltYSwgc28gdGhpcyB3b24ndCBjaGFuZ2UKPiBhbnl0
aGluZyByZWFsbHkgLi4uCgpZZWFoLCBzbyBmb3IgdXMgdG8gcHJvdmlkZSBhIG1vcmUgZGV0YWls
ZWQgZGVzY3JpcHRpb24gd291bGQgcmVxdWlyZQphbm90aGVyIGxlbmd0aHkgbG9vcCB0aHJvdWdo
IG91ciBsZWdhbCBhcHByb3ZhbCBwcm9jZXNzLCBhbmQgSSdtIG5vdApzdXJlIHdlIGNhbiBtYWtl
IGEgc3Ryb25nIGJ1c2luZXNzIGNhc2UgKHdoaWNoIGlzIHdoYXQgd2UgbmVlZCkgZm9yCndoeSB0
aGlzIGlzIG5lZWRlZC4KCk9mIGNvdXJzZSwgaWYgc29tZW9uZSBoYXBwZW5zIHRvIGtub3cgdGhl
IGxheW91dCBhbmQgd2FudHMgdG8KY29udHJpYnV0ZSB0byB0aGlzIGZpbGUuLi4gVGhlbiBJIGRv
bid0IGtub3cgaG93IGFjay9yLWIgd291bGQgd29yayBpbgp0aGF0IGNhc2UsIGJ1dCBJIGltYWdp
bmUgdGhlIHN1YnN5c3RlbSBtYWludGFpbmVyKHMpIG1pZ2h0IHRha2UgaXNzdWUKd2l0aCB1cyBh
dHRlbXB0aW5nIHRvIGJsb2NrIHRoYXQgY29udHJpYnV0aW9uLgoKVGhhbmtzLAotQnJpYW4KCj4g
Cj4gQ2hlZXJzLCBEYW5pZWwKPiAKPiA+Cj4gPiAtQnJpYW4KPiA+Cj4gPiA+Cj4gPiA+IEFsc28g
b2ZjIG5lZWRzIGFja3MgZnJvbSBsaW1hL3BhbmZyb3N0IHBlb3BsZSBzaW5jZSBJIGFzc3VtZSB0
aGV5J2xsCj4gPiA+IGJlIHVzaW5nIHRoaXMsIHRvby4KPiA+ID4KPiA+ID4gVGhhbmtzLCBEYW5p
ZWwKPiA+ID4KPiA+ID4gPiArCj4gPiA+ID4gKy8qCj4gPiA+ID4gICAqIEFsbHdpbm5lciB0aWxl
ZCBtb2RpZmllcgo+ID4gPiA+ICAgKgo+ID4gPiA+ICAgKiBUaGlzIHRpbGluZyBtb2RlIGlzIGlt
cGxlbWVudGVkIGJ5IHRoZSBWUFUgZm91bmQgb24gYWxsIEFsbHdpbm5lciBwbGF0Zm9ybXMsCj4g
PiA+ID4gLS0KPiA+ID4gPiAyLjcuNAo+ID4gPiA+Cj4gPiA+Cj4gPiA+Cj4gPiA+IC0tCj4gPiA+
IERhbmllbCBWZXR0ZXIKPiA+ID4gU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9u
Cj4gPiA+ICs0MSAoMCkgNzkgMzY1IDU3IDQ4IC0gaHR0cDovL2Jsb2cuZmZ3bGwuY2gKPiAKPiAK
PiAKPiAtLSAKPiBEYW5pZWwgVmV0dGVyCj4gU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBv
cmF0aW9uCj4gKzQxICgwKSA3OSAzNjUgNTcgNDggLSBodHRwOi8vYmxvZy5mZndsbC5jaApfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
