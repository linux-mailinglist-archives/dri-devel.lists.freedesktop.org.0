Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0324AAF645
	for <lists+dri-devel@lfdr.de>; Wed, 11 Sep 2019 09:01:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 560D26EA20;
	Wed, 11 Sep 2019 07:01:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 085946E8AB;
 Tue, 10 Sep 2019 10:08:40 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 8C257AE84;
 Tue, 10 Sep 2019 10:08:39 +0000 (UTC)
Date: Tue, 10 Sep 2019 12:08:49 +0200
From: Jean Delvare <jdelvare@suse.de>
To: Ville =?UTF-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH 2/2] drm/edid: Have cea_db_offsets() zero start/end when
 the data block collection isn't found
Message-ID: <20190910120849.5c55b3ae@endymion>
In-Reply-To: <20190910094842.GE7482@intel.com>
References: <20190902131546.4691-1-ville.syrjala@linux.intel.com>
 <20190902131546.4691-2-ville.syrjala@linux.intel.com>
 <20190910114620.78a774a1@endymion>
 <20190910094842.GE7482@intel.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 11 Sep 2019 07:01:13 +0000
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAxMCBTZXAgMjAxOSAxMjo0ODo0MiArMDMwMCwgVmlsbGUgU3lyasOkbMOkIHdyb3Rl
Ogo+IE9uIFR1ZSwgU2VwIDEwLCAyMDE5IGF0IDExOjQ2OjIwQU0gKzAyMDAsIEplYW4gRGVsdmFy
ZSB3cm90ZToKPiA+IEhpIFZpbGxlLAo+ID4gCj4gPiBPbiBNb24sICAyIFNlcCAyMDE5IDE2OjE1
OjQ2ICswMzAwLCBWaWxsZSBTeXJqYWxhIHdyb3RlOiAgCj4gPiA+IEZyb206IFZpbGxlIFN5cmrD
pGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+Cj4gPiA+IAo+ID4gPiBMZXQncyBt
YWtlIGNlYV9kYl9vZmZzZXRzKCkgYSBiaXQgbW9yZSBjb252ZW5pZW50IHRvIHVzZSBieQo+ID4g
PiBzZXR0aW5nIHRoZSBzdGFydC9lbmQgb2Zmc2V0cyB0byB6ZXJvIHdoZW5ldmVyIHRoZSBkYXRh
IGJsb2NrCj4gPiA+IGNvbGxlY3Rpb24gaXNuJ3QgcHJlc2VudC4gVGhpcyBtYWtlcyBpdCBzYWZl
IGZvciB0aGUgY2FsbGVyCj4gPiA+IHRvIGJsaW5kbHkgaXRlcmF0ZSB0aGUgZGF0YSBibG9ja3Mg
ZXZlbiBpZiB0aGVyZSBhcmUgbm9uZS4KPiA+ID4gCj4gPiA+IENjOiBKZWFuIERlbHZhcmUgPGpk
ZWx2YXJlQHN1c2UuZGU+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IFZpbGxlIFN5cmrDpGzDpCA8dmls
bGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+Cj4gPiA+IC0tLQo+ID4gPiAgZHJpdmVycy9ncHUv
ZHJtL2RybV9lZGlkLmMgfCA4ICsrKystLS0tCj4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNl
cnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+ID4gPiAKPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9kcm1fZWRpZC5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9lZGlkLmMKPiA+ID4g
aW5kZXggN2IzMDcyZmM1NTBiLi5lNTkwNWRjNzY0YzEgMTAwNjQ0Cj4gPiA+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9kcm1fZWRpZC5jCj4gPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZWRp
ZC5jCj4gPiA+IEBAIC0zNjkwLDYgKzM2OTAsOSBAQCBjZWFfcmV2aXNpb24oY29uc3QgdTggKmNl
YSkKPiA+ID4gIHN0YXRpYyBpbnQKPiA+ID4gIGNlYV9kYl9vZmZzZXRzKGNvbnN0IHU4ICpjZWEs
IGludCAqc3RhcnQsIGludCAqZW5kKQo+ID4gPiAgewo+ID4gPiArCSpzdGFydCA9IDA7Cj4gPiA+
ICsJKmVuZCA9IDA7Cj4gPiA+ICsKPiA+ID4gIAlpZiAoY2VhX3JldmlzaW9uKGNlYSkgPCAzKQo+
ID4gPiAgCQlyZXR1cm4gLUVOT1RTVVBQOwo+ID4gPiAgCj4gPiA+IEBAIC00MTE2LDEwICs0MTE5
LDcgQEAgc3RhdGljIHZvaWQgZHJtX2VkaWRfdG9fZWxkKHN0cnVjdCBkcm1fY29ubmVjdG9yICpj
b25uZWN0b3IsIHN0cnVjdCBlZGlkICplZGlkKQo+ID4gPiAgCWlmIChjZWFfcmV2aXNpb24oY2Vh
KSA+PSAzKSB7Cj4gPiA+ICAJCWludCBpLCBzdGFydCwgZW5kOwo+ID4gPiAgCj4gPiA+IC0JCWlm
IChjZWFfZGJfb2Zmc2V0cyhjZWEsICZzdGFydCwgJmVuZCkpIHsKPiA+ID4gLQkJCXN0YXJ0ID0g
MDsKPiA+ID4gLQkJCWVuZCA9IDA7Cj4gPiA+IC0JCX0KPiA+ID4gKwkJY2VhX2RiX29mZnNldHMo
Y2VhLCAmc3RhcnQsICZlbmQpOwo+ID4gPiAgCj4gPiA+ICAJCWZvcl9lYWNoX2NlYV9kYihjZWEs
IGksIHN0YXJ0LCBlbmQpIHsKPiA+ID4gIAkJCWRiID0gJmNlYVtpXTsgIAo+ID4gCj4gPiBOb3Qg
c3VyZSBpZiB0aGF0J3MgcmVhbGx5IG5lZWRlZC4gQXMgaXQgc3RhbmRzIHRoZXJlJ3Mgb25seSBv
bmUKPiA+IGZ1bmN0aW9uIHdoaWNoIHdhbnRzIHRvIGNvbnRpbnVlIGFmdGVyIGNlYV9kYl9vZmZz
ZXRzKCkgZmFpbHMsIGFsbAo+ID4gb3RoZXJzIGp1c3QgYmFpbCBvdXQgYXQgdGhhdCBwb2ludC4g
Tm93IHRoYXQgY2VhX2RiX29mZnNldHMoKSBjaGVja3MKPiA+IGZvciByZXZpc2lvbiA+PSAzLCB0
aGUgY29uc3RydWN0IGFib3ZlIGNvdWxkIHNpbXBseSBiZWNvbWU6Cj4gPiAKPiA+IAlpbnQgaSwg
c3RhcnQsIGVuZDsKPiA+IAo+ID4gCWlmIChjZWFfZGJfb2Zmc2V0cyhjZWEsICZzdGFydCwgJmVu
ZCkgPT0gMCkgewo+ID4gCQlmb3JfZWFjaF9jZWFfZGIoY2VhLCBpLCBzdGFydCwgZW5kKSB7Cj4g
PiAJCQlkYiA9ICZjZWFbaV07Cj4gPiAKPiA+IHdoaWNoIGlzIElNSE8gbW9yZSBlbGVnYW50IGFu
ZCBkb2VzIG5vdCByZXF1aXJlIHplcm9pbmcgc3RhcnQgYW5kIGVuZAo+ID4gaW4gY2VhX2RiX29m
ZnNldHMoKS4gIAo+IAo+IEkgZGlzbGlrZSBpbmRlbnRhdGlvbi4KCkl0IHdvdWxkIGJlIHRoZSBz
YW1lIGFzIGN1cnJlbnRseSwgc28gaXQncyBub3QgdGhhdCBiYWQuIEJ1dCB3ZWxsIEknbQpub3Qg
bWFpbnRhaW5pbmcgdGhhdCBwaWVjZSBvZiBjb2RlIHNvIGl0J3Mgbm90IG15IGNhbGwgYW55d2F5
LgoKPiBBbHNvIGNvdWxkIHBlcmhhcHMgZXZlbiBtb3ZlIHRoZSBjZWFfZGJfb2Zmc2V0cygpCj4g
aW50byB0aGUgZm9yX2VhY2hfY2VhX2RiKCkgbWFjcm8gc28gdGhhdCB0aGUgY2FsbGVyIGRvZXNu
J3QgaGF2ZSB0byBjYXJlCj4gYWJvdXQgdGhlc2UgbXVuZGFuZSBkZXRhaWxzIGF0IGFsbC4KCklm
IHRoZSBtYWNybyBzdGF5cyByZWFkYWJsZSwgd2h5IG5vdC4KCi0tIApKZWFuIERlbHZhcmUKU1VT
RSBMMyBTdXBwb3J0Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
