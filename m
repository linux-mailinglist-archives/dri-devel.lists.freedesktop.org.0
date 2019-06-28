Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E44F259905
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2019 13:12:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05B406E8DB;
	Fri, 28 Jun 2019 11:11:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA24F6E8D9;
 Fri, 28 Jun 2019 11:11:56 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Jun 2019 04:11:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,427,1557212400"; d="scan'208";a="361483938"
Received: from ramaling-i9x.iind.intel.com (HELO intel.com) ([10.99.66.154])
 by fmsmga006.fm.intel.com with ESMTP; 28 Jun 2019 04:11:52 -0700
Date: Fri, 28 Jun 2019 09:43:13 +0530
From: Ramalingam C <ramalingam.c@intel.com>
To: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
Subject: Re: [PATCH v2 1/3] drm: Add helper to compare edids.
Message-ID: <20190628041313.GB24852@intel.com>
References: <20190628082454.16345-1-stanislav.lisovskiy@intel.com>
 <20190628082454.16345-2-stanislav.lisovskiy@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190628082454.16345-2-stanislav.lisovskiy@intel.com>
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
Cc: simon.ser@intel.com, daniel.vetter@ffwll.ch,
 intel-gfx@lists.freedesktop.org, martin.peres@intel.com,
 dri-devel@lists.freedesktop.org, paul.kocialkowski@bootlin.com,
 jani.saarinen@intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS0wNi0yOCBhdCAxMToyNDo1MiArMDMwMCwgU3RhbmlzbGF2IExpc292c2tpeSB3cm90
ZToKPiBNYW55IGRyaXZlcnMgd291bGQgYmVuZWZpdCBmcm9tIHVzaW5nCj4gZHJtIGhlbHBlciB0
byBjb21wYXJlIGVkaWQsIHJhdGhlcgo+IHRoYW4gYm90aGVyaW5nIHdpdGggb3duIGltcGxlbWVu
dGF0aW9uLgo+IAo+IHYyOiBBZGRlZCBkb2N1bWVudGF0aW9uIGZvciB0aGlzIGZ1bmN0aW9uLgo+
IAo+IFNpZ25lZC1vZmYtYnk6IFN0YW5pc2xhdiBMaXNvdnNraXkgPHN0YW5pc2xhdi5saXNvdnNr
aXlAaW50ZWwuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX2VkaWQuYyB8IDMzICsr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ICBpbmNsdWRlL2RybS9kcm1fZWRpZC5o
ICAgICB8ICA5ICsrKysrKysrKwo+ICAyIGZpbGVzIGNoYW5nZWQsIDQyIGluc2VydGlvbnMoKykK
PiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9lZGlkLmMgYi9kcml2ZXJzL2dw
dS9kcm0vZHJtX2VkaWQuYwo+IGluZGV4IDlkOGYyYjk1MjAwNC4uZWFhZDUxNTVmYmRkIDEwMDY0
NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZWRpZC5jCj4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2RybV9lZGlkLmMKPiBAQCAtMTM2MSw2ICsxMzYxLDM5IEBAIHN0YXRpYyBib29sIGRybV9l
ZGlkX2lzX3plcm8oY29uc3QgdTggKmluX2VkaWQsIGludCBsZW5ndGgpCj4gIAlyZXR1cm4gdHJ1
ZTsKPiAgfQo+ICAKPiArLyoqCj4gKyAqIGRybV9lZGlkX2FyZV9lcXVhbCAtIGNvbXBhcmUgdHdv
IGVkaWQgYmxvYnMuCj4gKyAqIEBlZGlkMTogcG9pbnRlciB0byBmaXJzdCBibG9iCj4gKyAqIEBl
ZGlkMjogcG9pbnRlciB0byBzZWNvbmQgYmxvYgpleHRyYSBsaW5lIGhlcmUgaXMgcHJlZmVycmVk
Lgo+ICsgKiBUaGlzIGhlbHBlciBjYW4gYmUgdXNlZCBkdXJpbmcgcHJvYmluZyB0byBkZXRlcm1p
bmUgaWYKPiArICogZWRpZCBoYWQgY2hhbmdlZC4KYm9vbCBpcyBpbXBsaWNpdC4gaWYgeW91IHdh
bnQgeW91IGNhbiBleHBsYWluIHRoZSByZXR1cm4gdmFsdWUuCj4gKyAqLwo+ICtib29sIGRybV9l
ZGlkX2FyZV9lcXVhbChzdHJ1Y3QgZWRpZCAqZWRpZDEsIHN0cnVjdCBlZGlkICplZGlkMikKPiAr
ewo+ICsJaW50IGVkaWQxX2xlbiwgZWRpZDJfbGVuOwo+ICsJYm9vbCBlZGlkMV9wcmVzZW50ID0g
ZWRpZDEgIT0gTlVMTDsKPiArCWJvb2wgZWRpZDJfcHJlc2VudCA9IGVkaWQyICE9IE5VTEw7Cj4g
Kwo+ICsJaWYgKGVkaWQxX3ByZXNlbnQgIT0gZWRpZDJfcHJlc2VudCkKPiArCQlyZXR1cm4gZmFs
c2U7Cj4gKwo+ICsJaWYgKGVkaWQxKSB7Cj4gKwo+ICsJCWVkaWQxX2xlbiA9IEVESURfTEVOR1RI
ICogKDEgKyBlZGlkMS0+ZXh0ZW5zaW9ucyk7Cj4gKwkJZWRpZDJfbGVuID0gRURJRF9MRU5HVEgg
KiAoMSArIGVkaWQyLT5leHRlbnNpb25zKTsKPiArCj4gKwkJaWYgKGVkaWQxX2xlbiAhPSBlZGlk
Ml9sZW4pCj4gKwkJCXJldHVybiBmYWxzZTsKPiArCj4gKwkJaWYgKG1lbWNtcChlZGlkMSwgZWRp
ZDIsIGVkaWQxX2xlbikpCj4gKwkJCXJldHVybiBmYWxzZTsKPiArCX0KPiArCj4gKwlyZXR1cm4g
dHJ1ZTsKPiArfQo+ICtFWFBPUlRfU1lNQk9MKGRybV9lZGlkX2FyZV9lcXVhbCk7Cj4gKwo+ICsK
PiAgLyoqCj4gICAqIGRybV9lZGlkX2Jsb2NrX3ZhbGlkIC0gU2FuaXR5IGNoZWNrIHRoZSBFRElE
IGJsb2NrIChiYXNlIG9yIGV4dGVuc2lvbikKPiAgICogQHJhd19lZGlkOiBwb2ludGVyIHRvIHJh
dyBFRElEIGJsb2NrCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2RybV9lZGlkLmggYi9pbmNs
dWRlL2RybS9kcm1fZWRpZC5oCj4gaW5kZXggYjk3MTk0MThjM2QyLi43MTY5NjRmNjMzMTIgMTAw
NjQ0Cj4gLS0tIGEvaW5jbHVkZS9kcm0vZHJtX2VkaWQuaAo+ICsrKyBiL2luY2x1ZGUvZHJtL2Ry
bV9lZGlkLmgKPiBAQCAtMzU0LDYgKzM1NCwxNSBAQCBkcm1fbG9hZF9lZGlkX2Zpcm13YXJlKHN0
cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IpCj4gIH0KPiAgI2VuZGlmCj4gIAo+ICsvKioK
PiArICogZHJtX2VkaWRfYXJlX2VxdWFsIC0gY29tcGFyZSB0d28gZWRpZCBibG9icy4KPiArICog
QGVkaWQxOiBwb2ludGVyIHRvIGZpcnN0IGJsb2IKPiArICogQGVkaWQyOiBwb2ludGVyIHRvIHNl
Y29uZCBibG9iCj4gKyAqIFRoaXMgaGVscGVyIGNhbiBiZSB1c2VkIGR1cmluZyBwcm9iaW5nIHRv
IGRldGVybWluZSBpZgo+ICsgKiBlZGlkIGhhZCBjaGFuZ2VkLgo+ICsgKi8KRG8gd2UgbmVlZCBr
ZG9jIGZvciBmdW5jdGlvbiBkZWNsYXJhdGlvbiB0b28hPyBTaG91bGQgYmUgc3VmZmljaWVudCBm
b3IKZGVmaW5pdGlvbiBhbG9uZS4KCi1SYW0KPiArYm9vbCBkcm1fZWRpZF9hcmVfZXF1YWwoc3Ry
dWN0IGVkaWQgKmVkaWQxLCBzdHJ1Y3QgZWRpZCAqZWRpZDIpOwo+ICsKPiAgaW50Cj4gIGRybV9o
ZG1pX2F2aV9pbmZvZnJhbWVfZnJvbV9kaXNwbGF5X21vZGUoc3RydWN0IGhkbWlfYXZpX2luZm9m
cmFtZSAqZnJhbWUsCj4gIAkJCQkJIHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IsCj4g
LS0gCj4gMi4xNy4xCj4gCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
