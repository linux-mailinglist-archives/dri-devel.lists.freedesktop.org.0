Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 38455B7ADD
	for <lists+dri-devel@lfdr.de>; Thu, 19 Sep 2019 15:52:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10AC16F76C;
	Thu, 19 Sep 2019 13:52:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E60956F74D;
 Thu, 19 Sep 2019 13:52:09 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Sep 2019 06:52:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,523,1559545200"; d="scan'208";a="217304378"
Received: from fmsmsx103.amr.corp.intel.com ([10.18.124.201])
 by fmsmga002.fm.intel.com with ESMTP; 19 Sep 2019 06:52:09 -0700
Received: from fmsmsx122.amr.corp.intel.com (10.18.125.37) by
 FMSMSX103.amr.corp.intel.com (10.18.124.201) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 19 Sep 2019 06:52:08 -0700
Received: from bgsmsx155.gar.corp.intel.com (10.224.48.102) by
 fmsmsx122.amr.corp.intel.com (10.18.125.37) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 19 Sep 2019 06:52:08 -0700
Received: from bgsmsx110.gar.corp.intel.com ([169.254.11.62]) by
 BGSMSX155.gar.corp.intel.com ([169.254.12.61]) with mapi id 14.03.0439.000;
 Thu, 19 Sep 2019 19:22:05 +0530
From: "S, Srinivasan" <srinivasan.s@intel.com>
To: =?iso-8859-1?Q?Ville_Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Subject: RE: [PATCH] drm/i915/dp: Fix DP MST error after unplugging TypeC cable
Thread-Topic: [PATCH] drm/i915/dp: Fix DP MST error after unplugging TypeC
 cable
Thread-Index: AQHVbcLYoWnzB/UohEOqpJcMyAe3x6cxW3GAgAAF2gCAAAPgAIABMznw///0ZICAAHl2wA==
Date: Thu, 19 Sep 2019 13:52:05 +0000
Message-ID: <BFA53C78450B204BBCED0B0A62E9EAE73254CBBD@BGSMSX110.gar.corp.intel.com>
References: <1568770783-169735-1-git-send-email-srinivasan.s@intel.com>
 <20190918175038.GA31062@intel.com> <20190918181136.GQ1208@intel.com>
 <20190918182528.GB31062@intel.com>
 <BFA53C78450B204BBCED0B0A62E9EAE73254C690@BGSMSX110.gar.corp.intel.com>
 <20190919120331.GR1208@intel.com>
In-Reply-To: <20190919120331.GR1208@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiMTJmMTkxZTMtOTJmMS00NGI2LTliNGYtNWI4MDBkNWM3OGI2IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoibmJBVXcrR0dyWXd1Y3ErWXBTYnJuQVM4XC9wcUlqTzQwSmVGVkJsZjQ4cmFkTzlsSTA4WkNcL1p1STQ4NVlSbVZ1In0=
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.223.10.10]
MIME-Version: 1.0
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
Cc: "Navare, Manasi D" <manasi.d.navare@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlbiBpdCdzIGJldHRlciB0aGF0LCBjb3VsZCB3ZSBjaGFuZ2UgaXQgdG8gRFJNX0RFQlVHX0tN
UygiZmFpbGVkIHRvIHVwZGF0ZSBwYXlsb2FkICVkXG4iLCByZXQpOyBpbnN0ZWFkIG9mIERSTV9F
UlJPUigiZmFpbGVkIHRvIHVwZGF0ZSBwYXlsb2FkICVkXG4iLCByZXQpOywgd2l0aG91dCBhbnkg
Y29ubmVjdG9yIHN0YXR1cyBjaGVjaywgd291bGQgdGhhdCBiZSBmaW5lPwoKUmVnYXJkcywKLS0t
LS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KRnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJq
YWxhQGxpbnV4LmludGVsLmNvbT4gClNlbnQ6IFRodXJzZGF5LCBTZXB0ZW1iZXIgMTksIDIwMTkg
NTozNCBQTQpUbzogUywgU3Jpbml2YXNhbiA8c3Jpbml2YXNhbi5zQGludGVsLmNvbT4KQ2M6IE5h
dmFyZSwgTWFuYXNpIEQgPG1hbmFzaS5kLm5hdmFyZUBpbnRlbC5jb20+OyBpbnRlbC1nZnhAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnOyBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnClN1Ympl
Y3Q6IFJlOiBbUEFUQ0hdIGRybS9pOTE1L2RwOiBGaXggRFAgTVNUIGVycm9yIGFmdGVyIHVucGx1
Z2dpbmcgVHlwZUMgY2FibGUKCk9uIFRodSwgU2VwIDE5LCAyMDE5IGF0IDA3OjIzOjMwQU0gKzAw
MDAsIFMsIFNyaW5pdmFzYW4gd3JvdGU6Cj4gV291bGQgdGhlIGZvbGxvd2luZyBiZSBhcHByb3By
aWF0ZSBmaXg/Cj4gCj4gICAgICAgICBpZiAoY29ubmVjdG9yIHx8IGNvbm5lY3Rvci0+YmFzZS5z
dGF0dXMgPT0gY29ubmVjdG9yX3N0YXR1c19jb25uZWN0ZWQpIHsKPiAgICAgICAgICAgICAgICAg
cmV0ID0gZHJtX2RwX3VwZGF0ZV9wYXlsb2FkX3BhcnQxKCZpbnRlbF9kcC0+bXN0X21ncik7Cj4g
ICAgICAgICAgICAgICAgIGlmIChyZXQpIHsKPiAgICAgICAgICAgICAgICAgICAgICAgICBEUk1f
RVJST1IoImZhaWxlZCB0byB1cGRhdGUgcGF5bG9hZCAlZFxuIiwgcmV0KTsKPiAgICAgICAgICAg
ICAgICAgfQo+ICAgICAgICAgfQoKVGhlIHdob2xlIGNvbm5lY3Rvci0+c3RhdHVzIGNoZWNrIGlz
IHJhY3kuIElNTyBkb24ndCBkbyBpdC4KCj4gCj4gUmVnYXJkcywKPiAtLS0tLU9yaWdpbmFsIE1l
c3NhZ2UtLS0tLQo+IEZyb206IGRyaS1kZXZlbCA8ZHJpLWRldmVsLWJvdW5jZXNAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgCj4gTWFuYXNpIE5hdmFyZQo+IFNlbnQ6IFdlZG5l
c2RheSwgU2VwdGVtYmVyIDE4LCAyMDE5IDExOjU1IFBNCj4gVG86IFZpbGxlIFN5cmrDpGzDpCA8
dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+Cj4gQ2M6IFMsIFNyaW5pdmFzYW4gPHNyaW5p
dmFzYW4uc0BpbnRlbC5jb20+OyAKPiBpbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gU3ViamVjdDogUmU6IFtQQVRDSF0gZHJt
L2k5MTUvZHA6IEZpeCBEUCBNU1QgZXJyb3IgYWZ0ZXIgdW5wbHVnZ2luZyAKPiBUeXBlQyBjYWJs
ZQo+IAo+IE9uIFdlZCwgU2VwIDE4LCAyMDE5IGF0IDA5OjExOjM2UE0gKzAzMDAsIFZpbGxlIFN5
cmrDpGzDpCB3cm90ZToKPiA+IE9uIFdlZCwgU2VwIDE4LCAyMDE5IGF0IDEwOjUwOjM5QU0gLTA3
MDAsIE1hbmFzaSBOYXZhcmUgd3JvdGU6Cj4gPiA+IE9uIFdlZCwgU2VwIDE4LCAyMDE5IGF0IDA3
OjA5OjQzQU0gKzA1MzAsIHNyaW5pdmFzYW4uc0BpbnRlbC5jb20gd3JvdGU6Cj4gPiA+ID4gRnJv
bTogU3Jpbml2YXNhbiBTIDxzcmluaXZhc2FuLnNAaW50ZWwuY29tPgo+ID4gPiA+IAo+ID4gPiA+
IFRoaXMgcGF0Y2ggYXZvaWRzIERQIE1TVCBwYXlsb2FkIGVycm9yIG1lc3NhZ2UgaW4gZG1lc2cs
IGFzIGl0IAo+ID4gPiA+IGlzIHRyeWluZyB0byByZWFkIHRoZSBwYXlsb2FkIGZyb20gdGhlIGRp
c2Nvbm5lY3RlZCBEUCBNU1QgZGV2aWNlLgo+ID4gPiA+IEFmdGVyIHRoZSB1bnBsdWcgdGhlIGNv
bm5lY3RvciBzdGF0dXMgaXMgZGlzY29ubmVjdGVkIGFuZCB3ZSAKPiA+ID4gPiBzaG91bGQgbm90
IGJlIGxvb2tpbmcgZm9yIHRoZSBwYXlsb2FkIGFuZCBoZW5jZSByZW1vdmUgdGhlIGVycm9yIGFu
ZCB0aHJvdyB0aGUgd2FybmluZy4KPiA+ID4gPiAKPiA+ID4gPiBUaGlzIGRldGFpbHMgY2FuIGJl
IGZvdW5kIGluOgo+ID4gPiA+IGh0dHBzOi8vYnVncy5mcmVlZGVza3RvcC5vcmcvc2hvd19idWcu
Y2dpP2lkPTExMTYzMgo+ID4gPiAKPiA+ID4gUGxlYXNlIGFkZCB0aGlzIGxpbmsgYXMgQnVnemls
bGE6IAo+ID4gPiBodHRwczovL2J1Z3MuZnJlZWRlc2t0b3Aub3JnL3Nob3dfYnVnLmNnaT9pZD0x
MTE2MzIgYWZ0ZXIgdGhlIFNpZ24gCj4gPiA+IG9mZiBzdGF0ZW1lbnQKPiA+ID4gCj4gPiA+ID4g
Cj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogU3Jpbml2YXNhbiBTIDxzcmluaXZhc2FuLnNAaW50ZWwu
Y29tPgo+ID4gPiA+IC0tLQo+ID4gPiA+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2lu
dGVsX2RwX21zdC5jIHwgNyArKysrKystCj4gPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2Vy
dGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiA+ID4gPiAKPiA+ID4gPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kcF9tc3QuYwo+ID4gPiA+IGIvZHJpdmVy
cy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kcF9tc3QuYwo+ID4gPiA+IGluZGV4IGVlZWIz
ZjkzM2FhNC4uNWIyMjc4ZmRmNjc1IDEwMDY0NAo+ID4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHBfbXN0LmMKPiA+ID4gPiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwX21zdC5jCj4gPiA+ID4gQEAgLTIxNSw3ICsyMTUsMTIg
QEAgc3RhdGljIHZvaWQgaW50ZWxfbXN0X2Rpc2FibGVfZHAoc3RydWN0IAo+ID4gPiA+IGludGVs
X2VuY29kZXIgKmVuY29kZXIsCj4gPiA+ID4gIAo+ID4gPiA+ICAJcmV0ID0gZHJtX2RwX3VwZGF0
ZV9wYXlsb2FkX3BhcnQxKCZpbnRlbF9kcC0+bXN0X21ncik7Cj4gPiA+ID4gIAlpZiAocmV0KSB7
Cj4gPiA+ID4gLQkJRFJNX0VSUk9SKCJmYWlsZWQgdG8gdXBkYXRlIHBheWxvYWQgJWRcbiIsIHJl
dCk7Cj4gPiA+ID4gKwkJaWYgKCFjb25uZWN0b3IgfHwKPiA+ID4gPiArCQkgICAgY29ubmVjdG9y
LT5iYXNlLnN0YXR1cyAhPSBjb25uZWN0b3Jfc3RhdHVzX2Nvbm5lY3RlZCkgewo+ID4gPiA+ICsJ
CQlEUk1fV0FSTigiRFAgTVNUIGRpc2Nvbm5lY3RcbiIpOwo+ID4gPiAKPiA+ID4gTWF5IGJlIGFk
ZGluZyB0aGlzIGNoZWNrIGJlZm9yZSBjYWxsaW5nIGRybV9kcF91cGRhdGVfcGF5bG9hZF9wYXJ0
MSgpIGlzIGEgYmV0dGVyIGlkZWE/Cj4gPiA+IElmIHRoZSBjb25uZWN0b3IgaXMgZGlzY29ubmVj
dGVkLCB3aHkgdXBkYXRlIHBheWxvYWQ/Cj4gPiA+IAo+ID4gPiBKYW5pLCBWaWxsZSwgdGhvdWdo
dHM/Cj4gPiAKPiA+IE9yIGp1c3QgY29udmVydCBpdCB0byBhIGRlYnVnPwo+IAo+IFN1cmUgdGhh
dCB3aWxsIHdvcmssIGJ1dCBkbyB3ZSByZWFsbHkgd2FudCB0byB1cGRhdGUgdGhlIHBheWxvYWQg
aWYgdGhlIGNvbm5lY3RvciBzdGF0dXMgaXMgZGlzY29ubmVjdGVkLgo+IFNvIHNob3VsZG50IGNo
ZWNraW5nIHRoYXQgYmVmb3JlIGNhbGxpbmcgdGhlIGZ1bmN0aW9uIGJlIGEgYmV0dGVyIGZpeD8K
PiAKPiBNYW5hc2kKPiAKPiA+IAo+ID4gPiAKPiA+ID4gUmVnYXJkcwo+ID4gPiBNYW5hc2kKPiA+
ID4gCj4gPiA+ID4gKwkJfSBlbHNlIHsKPiA+ID4gPiArCQkJRFJNX0VSUk9SKCJmYWlsZWQgdG8g
dXBkYXRlIHBheWxvYWQgJWRcbiIsIHJldCk7Cj4gPiA+ID4gKwkJfQo+ID4gPiA+ICAJfQo+ID4g
PiA+ICAJaWYgKG9sZF9jcnRjX3N0YXRlLT5oYXNfYXVkaW8pCj4gPiA+ID4gIAkJaW50ZWxfYXVk
aW9fY29kZWNfZGlzYWJsZShlbmNvZGVyLAo+ID4gPiA+IC0tCj4gPiA+ID4gMi43LjQKPiA+ID4g
PiAKPiA+IAo+ID4gLS0KPiA+IFZpbGxlIFN5cmrDpGzDpAo+ID4gSW50ZWwKPiA+IF9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gPiBkcmktZGV2ZWwgbWFp
bGluZyBsaXN0Cj4gPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gPiBodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo+IF9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gZHJpLWRldmVsIG1h
aWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAoKLS0KVmlsbGUg
U3lyasOkbMOkCkludGVsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
