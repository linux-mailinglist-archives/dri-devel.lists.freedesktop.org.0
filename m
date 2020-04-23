Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2839F1B63EF
	for <lists+dri-devel@lfdr.de>; Thu, 23 Apr 2020 20:43:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7D7C89B69;
	Thu, 23 Apr 2020 18:43:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B86C989B69;
 Thu, 23 Apr 2020 18:43:50 +0000 (UTC)
IronPort-SDR: jp7WE8HumXYuUqCuDluGOuN7LYvBLVFQFdfr7AjWDkKWH4xr9rWynxz/xFgies/5TvzxLxKMUp
 +UVGKGowAY/g==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2020 11:43:50 -0700
IronPort-SDR: r3VcBlY1YZ6yROw9g3qjdqBgL4ReksCCyx/SDb2A9lP/FAOUo0Dasvh52GBfXqwgRhMf0eTuy4
 Sbi6dqqlV0ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,307,1583222400"; d="scan'208";a="457013796"
Received: from unknown (HELO intel.com) ([10.165.21.211])
 by fmsmga005.fm.intel.com with ESMTP; 23 Apr 2020 11:43:50 -0700
Date: Thu, 23 Apr 2020 11:45:11 -0700
From: Manasi Navare <manasi.d.navare@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/edid: Fix off-by-one in DispID DTD pixel
 clock
Message-ID: <20200423184510.GA12177@intel.com>
References: <20200423151743.18767-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200423151743.18767-1-ville.syrjala@linux.intel.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: intel-gfx@lists.freedesktop.org, stable@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBBcHIgMjMsIDIwMjAgYXQgMDY6MTc6NDNQTSArMDMwMCwgVmlsbGUgU3lyamFsYSB3
cm90ZToKPiBGcm9tOiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwu
Y29tPgo+IAo+IFRoZSBEaXNwSUQgRFREIHBpeGVsIGNsb2NrIGlzIGRvY3VtZW50ZWQgYXM6Cj4g
IjAwIDAwIDAwIGgg4oaSIEZGIEZGIEZGIGggfCBQaXhlbCBjbG9jayDDtyAxMCwwMDAgMC4wMSDi
hpIgMTY3LDc3Mi4xNiBNZWdhIFBpeGVscyBwZXIgU2VjIgo+IFdoaWNoIHNlZW1zIHRvIGltcGx5
IHRoYXQgd2UgdG8gYWRkIG9uZSB0byB0aGUgcmF3IHZhbHVlLgo+IAo+IFJlYWxpdHkgc2VlbXMg
dG8gYWdyZWUgYXMgdGhlcmUgYXJlIHRpbGVkIGRpc3BsYXlzIGluIHRoZSB3aWxkCj4gd2hpY2gg
Y3VycmVudGx5IHNob3cgYSAxMGtIeiBkaWZmZXJlbmNlIGluIHRoZSBwaXhlbCBjbG9jawo+IGJl
dHdlZW4gdGhlIHRpbGVzIChvbmUgdGlsZSBnZXRzIGl0cyBtb2RlIGZyb20gdGhlIGJhc2UgRURJ
RCwKPiB0aGUgb3RoZXIgZnJvbSB0aGUgRGlzcElEIGJsb2NrKS4KPiAKPiBDYzogc3RhYmxlQHZn
ZXIua2VybmVsLm9yZwo+IFJlZmVyZW5jZXM6IGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9y
Zy9kcm0vaW50ZWwvLS9pc3N1ZXMvMjcKPiBTaWduZWQtb2ZmLWJ5OiBWaWxsZSBTeXJqw6Rsw6Qg
PHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPgoKTWFrZXMgdG90YWwgc2Vuc2UsCgpSZXZp
ZXdlZC1ieTogTWFuYXNpIE5hdmFyZSA8bWFuYXNpLmQubmF2YXJlQGludGVsLmNvbT4KCk1hbmFz
aQoKPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2RybV9lZGlkLmMgfCAyICstCj4gIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vZHJtX2VkaWQuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZWRpZC5jCj4g
aW5kZXggNDNiNmNhMzY0ZGFhLi41NDRkMjYwM2Y1ZmMgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2RybV9lZGlkLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2VkaWQuYwo+IEBA
IC01MTIwLDcgKzUxMjAsNyBAQCBzdGF0aWMgc3RydWN0IGRybV9kaXNwbGF5X21vZGUgKmRybV9t
b2RlX2Rpc3BsYXlpZF9kZXRhaWxlZChzdHJ1Y3QgZHJtX2RldmljZSAqZAo+ICAJc3RydWN0IGRy
bV9kaXNwbGF5X21vZGUgKm1vZGU7Cj4gIAl1bnNpZ25lZCBwaXhlbF9jbG9jayA9ICh0aW1pbmdz
LT5waXhlbF9jbG9ja1swXSB8Cj4gIAkJCQkodGltaW5ncy0+cGl4ZWxfY2xvY2tbMV0gPDwgOCkg
fAo+IC0JCQkJKHRpbWluZ3MtPnBpeGVsX2Nsb2NrWzJdIDw8IDE2KSk7Cj4gKwkJCQkodGltaW5n
cy0+cGl4ZWxfY2xvY2tbMl0gPDwgMTYpKSArIDE7Cj4gIAl1bnNpZ25lZCBoYWN0aXZlID0gKHRp
bWluZ3MtPmhhY3RpdmVbMF0gfCB0aW1pbmdzLT5oYWN0aXZlWzFdIDw8IDgpICsgMTsKPiAgCXVu
c2lnbmVkIGhibGFuayA9ICh0aW1pbmdzLT5oYmxhbmtbMF0gfCB0aW1pbmdzLT5oYmxhbmtbMV0g
PDwgOCkgKyAxOwo+ICAJdW5zaWduZWQgaHN5bmMgPSAodGltaW5ncy0+aHN5bmNbMF0gfCAodGlt
aW5ncy0+aHN5bmNbMV0gJiAweDdmKSA8PCA4KSArIDE7Cj4gLS0gCj4gMi4yNC4xCj4gCj4gX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBJbnRlbC1nZngg
bWFpbGluZyBsaXN0Cj4gSW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ2Z4Cl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
