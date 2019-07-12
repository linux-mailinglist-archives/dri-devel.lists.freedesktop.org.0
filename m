Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 368C6673F8
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jul 2019 19:07:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D8986E2F2;
	Fri, 12 Jul 2019 17:07:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D643A6E2FD
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jul 2019 17:07:01 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Jul 2019 10:07:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,483,1557212400"; d="scan'208";a="171607073"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga006.jf.intel.com with SMTP; 12 Jul 2019 10:06:58 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 12 Jul 2019 20:06:57 +0300
Date: Fri, 12 Jul 2019 20:06:57 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Tony Camuso <tcamuso@redhat.com>
Subject: Re: [PATCH] drm: assure aux_dev is nonzero before using it
Message-ID: <20190712170657.GL5942@intel.com>
References: <20190523110905.22445-1-tcamuso@redhat.com>
 <87v9y0mept.fsf@intel.com>
 <5111581c-9d73-530d-d3ff-4f6950bf3f8c@redhat.com>
 <20190710135617.GE5942@intel.com>
 <374b7e4e-40a2-f3c0-ae14-c533bd42243f@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <374b7e4e-40a2-f3c0-ae14-c533bd42243f@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: airlied@linux.ie, dkwon@redhat.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdWwgMTIsIDIwMTkgYXQgMTI6MDc6NDZQTSAtMDQwMCwgVG9ueSBDYW11c28gd3Jv
dGU6Cj4gT24gNy8xMC8xOSA5OjU2IEFNLCBWaWxsZSBTeXJqw6Rsw6Qgd3JvdGU6Cj4gPiBPbiBX
ZWQsIEp1bCAxMCwgMjAxOSBhdCAwOTo0NzoxMUFNIC0wNDAwLCBUb255IENhbXVzbyB3cm90ZToK
PiA+PiBPbiA1LzI0LzE5IDQ6MzYgQU0sIEphbmkgTmlrdWxhIHdyb3RlOgo+ID4+PiBPbiBUaHUs
IDIzIE1heSAyMDE5LCB0Y2FtdXNvIDx0Y2FtdXNvQHJlZGhhdC5jb20+IHdyb3RlOgo+ID4+Pj4g
ICBGcm9tIERhbmllbCBLd29uIDxka3dvbkByZWRoYXQuY29tPgo+ID4+Pj4KPiA+Pj4+IFRoZSBz
eXN0ZW0gd2FzIGNyYXNoZWQgZHVlIHRvIGludmFsaWQgbWVtb3J5IGFjY2VzcyB3aGlsZSB0cnlp
bmcgdG8gYWNjZXNzCj4gPj4+PiBhdXhpbGlhcnkgZGV2aWNlLgo+ID4+Pj4KPiA+Pj4+IGNyYXNo
PiBidAo+ID4+Pj4gUElEOiA5ODYzICAgVEFTSzogZmZmZjg5ZDFiZGYxMTA0MCAgQ1BVOiAxICAg
Q09NTUFORDogImlwbWl0b29sIgo+ID4+Pj4gICAgIzAgW2ZmZmY4OWNlZGQ3ZjM4NjhdIG1hY2hp
bmVfa2V4ZWMgYXQgZmZmZmZmZmZiMDY2MzY3NAo+ID4+Pj4gICAgIzEgW2ZmZmY4OWNlZGQ3ZjM4
YzhdIF9fY3Jhc2hfa2V4ZWMgYXQgZmZmZmZmZmZiMDcxY2Y2Mgo+ID4+Pj4gICAgIzIgW2ZmZmY4
OWNlZGQ3ZjM5OThdIGNyYXNoX2tleGVjIGF0IGZmZmZmZmZmYjA3MWQwNTAKPiA+Pj4+ICAgICMz
IFtmZmZmODljZWRkN2YzOWIwXSBvb3BzX2VuZCBhdCBmZmZmZmZmZmIwZDZkNzU4Cj4gPj4+PiAg
ICAjNCBbZmZmZjg5Y2VkZDdmMzlkOF0gbm9fY29udGV4dCBhdCBmZmZmZmZmZmIwZDViY2RlCj4g
Pj4+PiAgICAjNSBbZmZmZjg5Y2VkZDdmM2EyOF0gX19iYWRfYXJlYV9ub3NlbWFwaG9yZSBhdCBm
ZmZmZmZmZmIwZDViZDc1Cj4gPj4+PiAgICAjNiBbZmZmZjg5Y2VkZDdmM2E3OF0gYmFkX2FyZWEg
YXQgZmZmZmZmZmZiMGQ1YzA4NQo+ID4+Pj4gICAgIzcgW2ZmZmY4OWNlZGQ3ZjNhYTBdIF9fZG9f
cGFnZV9mYXVsdCBhdCBmZmZmZmZmZmIwZDcwODBjCj4gPj4+PiAgICAjOCBbZmZmZjg5Y2VkZDdm
M2IxMF0gZG9fcGFnZV9mYXVsdCBhdCBmZmZmZmZmZmIwZDcwOTA1Cj4gPj4+PiAgICAjOSBbZmZm
Zjg5Y2VkZDdmM2I0MF0gcGFnZV9mYXVsdCBhdCBmZmZmZmZmZmIwZDZjNzU4Cj4gPj4+PiAgICAg
ICBbZXhjZXB0aW9uIFJJUDogZHJtX2RwX2F1eF9kZXZfZ2V0X2J5X21pbm9yKzB4M2RdCj4gPj4+
PiAgICAgICBSSVA6IGZmZmZmZmZmYzBhNTg5YmQgIFJTUDogZmZmZjg5Y2VkZDdmM2JmMCAgUkZM
QUdTOiAwMDAxMDI0Ngo+ID4+Pj4gICAgICAgUkFYOiAwMDAwMDAwMDAwMDAwMDAwICBSQlg6IDAw
MDAwMDAwMDAwMDAwMDAgIFJDWDogZmZmZjg5Y2VkZDdmM2ZkOAo+ID4+Pj4gICAgICAgUkRYOiAw
MDAwMDAwMDAwMDAwMDAwICBSU0k6IDAwMDAwMDAwMDAwMDAwMDAgIFJESTogZmZmZmZmZmZjMGE2
MTNlMAo+ID4+Pj4gICAgICAgUkJQOiBmZmZmODljZWRkN2YzYmY4ICAgUjg6IGZmZmY4OWYxYmNi
YWJiZDAgICBSOTogMDAwMDAwMDAwMDAwMDAwMAo+ID4+Pj4gICAgICAgUjEwOiBmZmZmODlmMWJl
N2ExY2MwICBSMTE6IDAwMDAwMDAwMDAwMDAwMDAgIFIxMjogMDAwMDAwMDAwMDAwMDAwMAo+ID4+
Pj4gICAgICAgUjEzOiBmZmZmODlmMWIzMmEyODMwICBSMTQ6IGZmZmY4OWQxOGZhZGZhMDAgIFIx
NTogMDAwMDAwMDAwMDAwMDAwMAo+ID4+Pj4gICAgICAgT1JJR19SQVg6IGZmZmZmZmZmZmZmZmZm
ZmYgIENTOiAwMDEwICBTUzogMDAxOAo+ID4+Pj4gICAgICAgUklQOiAwMDAwMmI0NWYwZDgwZDMw
ICBSU1A6IDAwMDA3ZmZjNDE2MDY2YTAgIFJGTEFHUzogMDAwMTAyNDYKPiA+Pj4+ICAgICAgIFJB
WDogMDAwMDAwMDAwMDAwMDAwMiAgUkJYOiAwMDAwNTYwNjJlMjEyZDgwICBSQ1g6IDAwMDA3ZmZj
NDE2MDY4MTAKPiA+Pj4+ICAgICAgIFJEWDogMDAwMDAwMDAwMDAwMDAwMCAgUlNJOiAwMDAwMDAw
MDAwMDAwMDAyICBSREk6IDAwMDA3ZmZjNDE2MDZlYzAKPiA+Pj4+ICAgICAgIFJCUDogMDAwMDAw
MDAwMDAwMDAwMCAgIFI4OiAwMDAwNTYwNjJkZmVkMjI5ICAgUjk6IDAwMDAyYjQ1ZjBjZGYxNGQK
PiA+Pj4+ICAgICAgIFIxMDogMDAwMDAwMDAwMDAwMDAwMiAgUjExOiAwMDAwMDAwMDAwMDAwMjQ2
ICBSMTI6IDAwMDA3ZmZjNDE2MDZlYzAKPiA+Pj4+ICAgICAgIFIxMzogMDAwMDdmZmM0MTYwNmVk
MCAgUjE0OiAwMDAwN2ZmYzQxNjA2ZWUwICBSMTU6IDAwMDAwMDAwMDAwMDAwMDAKPiA+Pj4+ICAg
ICAgIE9SSUdfUkFYOiAwMDAwMDAwMDAwMDAwMDAyICBDUzogMDAzMyAgU1M6IDAwMmIKPiA+Pj4+
Cj4gPj4+PiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gPj4+Pgo+ID4+Pj4gSXQgd2FzIHRyeWluZyB0
byBvcGVuICcvZGV2L2lwbWkwJywgYnV0IGFzIG5vIGVudHJ5IGluIGF1eF9kaXIsIGl0IHJldHVy
bmVkCj4gPj4+PiBOVUxMIGZyb20gJ2lkcl9maW5kKCknLiBUaGlzIGRybV9kcF9hdXhfZGV2X2dl
dF9ieV9taW5vcigpIHNob3VsZCBoYXZlIGRvbmUgYQo+ID4+Pj4gY2hlY2sgb24gdGhpcywgYnV0
IGhhZCBmYWlsZWQgdG8gZG8gaXQuCj4gPj4+Cj4gPj4+IEkgdGhpbmsgdGhlIGJldHRlciBxdWVz
dGlvbiBpcywgKndoeSogZG9lcyB0aGUgaWRyX2ZpbmQoKSByZXR1cm4gTlVMTD8gSQo+ID4+PiBk
b24ndCB0aGluayBpdCBzaG91bGQsIHVuZGVyIGFueSBjaXJjdW1zdGFuY2VzLiBJIGZlYXIgYWRk
aW5nIHRoZSBjaGVjawo+ID4+PiBoZXJlIHBhcGVycyBvdmVyIHNvbWUgb3RoZXIgcHJvYmxlbSwg
dGFraW5nIHVzIGZ1cnRoZXIgYXdheSBmcm9tIHRoZQo+ID4+PiByb290IGNhdXNlLgo+ID4+Pgo+
ID4+PiBBbHNvLCBjYW4geW91IHJlcHJvZHVjZSB0aGlzIG9uIGEgcmVjZW50IHVwc3RyZWFtIGtl
cm5lbD8gVGhlIGF1eCBkZXZpY2UKPiA+Pj4gbm9kZXMgd2VyZSBpbnRyb2R1Y2VkIGluIGtlcm5l
bCB2NC42LiBXaGF0ZXZlciB5b3UgcmVwcm9kdWNlZCBvbiB2My4xMAo+ID4+PiBpcyBwcmV0dHkg
bXVjaCBpcnJlbGV2YW50IGZvciB1cHN0cmVhbS4KPiA+Pj4KPiA+Pj4KPiA+Pj4gQlIsCj4gPj4+
IEphbmkuCj4gPj4KPiA+PiBJIGhhdmUgbm90IGJlZW4gYWJsZSB0byByZXByb2R1Y2UgdGhpcyBw
cm9ibGVtLgo+ID4gCj4gPiBta25vZCAvZGV2L2ZvbyBjIDxkcm1fZHBfYXV4IG1ham9yPiAyNTUK
PiA+IGNhdCAvZGV2L2Zvbwo+ID4gCj4gPiBzaG91bGQgZG8gaXQuCj4gCj4gSG93IGRvIEkgZGV0
ZXJtaW5lIDxkcm1fZHBfYXV4IG1ham9yPj8KCmxzLGZpbGUsc3RhdC4gVGFrZSB5b3VyIHBpY2su
CgotLSAKVmlsbGUgU3lyasOkbMOkCkludGVsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
