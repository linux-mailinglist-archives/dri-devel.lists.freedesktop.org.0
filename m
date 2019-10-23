Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 24728E1AF3
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2019 14:42:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A4CB6EA81;
	Wed, 23 Oct 2019 12:42:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9CF56E123;
 Wed, 23 Oct 2019 12:41:58 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Oct 2019 05:41:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,220,1569308400"; d="scan'208";a="197415189"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga007.fm.intel.com with SMTP; 23 Oct 2019 05:41:55 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 23 Oct 2019 15:41:54 +0300
Date: Wed, 23 Oct 2019 15:41:54 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Pekka Paalanen <ppaalanen@gmail.com>
Subject: Re: [PATCH 1/3] drm: Introduce scaling filter mode property
Message-ID: <20191023124154.GU1208@intel.com>
References: <20191022095946.29354-1-shashank.sharma@intel.com>
 <20191022095946.29354-2-shashank.sharma@intel.com>
 <20191022122034.GJ1208@intel.com>
 <2f6668c0-ea32-2028-165c-a1b89893dc2a@intel.com>
 <20191023103405.3815a311@eldfell.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191023103405.3815a311@eldfell.localdomain>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBPY3QgMjMsIDIwMTkgYXQgMTA6MzQ6MDVBTSArMDMwMCwgUGVra2EgUGFhbGFuZW4g
d3JvdGU6Cj4gT24gVHVlLCAyMiBPY3QgMjAxOSAyMDo0ODowMiArMDUzMAo+ICJTaGFybWEsIFNo
YXNoYW5rIiA8c2hhc2hhbmsuc2hhcm1hQGludGVsLmNvbT4gd3JvdGU6Cj4gCj4gPiBIZWxsbyBW
aWxsZSwKPiA+IAo+ID4gVGhhbmtzIGZvciB0aGUgY29tbWVudHMsIG1pbmUgaW5saW5lLgo+ID4g
Cj4gPiAKPiA+IE9uIDEwLzIyLzIwMTkgNTo1MCBQTSwgVmlsbGUgU3lyasOkbMOkIHdyb3RlOgo+
ID4gPiBPbiBUdWUsIE9jdCAyMiwgMjAxOSBhdCAwMzoyOTo0NFBNICswNTMwLCBTaGFzaGFuayBT
aGFybWEgd3JvdGU6ICAKPiA+ID4+IFRoaXMgcGF0Y2ggYWRkcyBhIHNjYWxpbmcgZmlsdGVyIG1v
ZGUgcG9ycGVydHkKPiA+ID4+IHRvIGFsbG93Ogo+ID4gPj4gLSBBIGRyaXZlci9IVyB0byBzaG93
Y2FzZSBpdCdzIHNjYWxpbmcgZmlsdGVyIGNhcGFiaWxpdGllcy4KPiA+ID4+IC0gQSB1c2Vyc3Bh
Y2UgdG8gcGljayBhIGRlc2lyZWQgZWZmZWN0IHdoaWxlIHNjYWxpbmcuCj4gPiA+Pgo+ID4gPj4g
VGhpcyBvcHRpb24gd2lsbCBiZSBwYXJ0aWN1bGFybHkgdXNlZnVsIGluIHRoZSBzY2VuYXJpb3Mg
d2hlcmUKPiA+ID4+IEludGVnZXIgbW9kZSBzY2FsaW5nIGlzIHBvc3NpYmxlLCBhbmQgYSBVSSBj
bGllbnQgd2FudHMgdG8gcGljawo+ID4gPj4gZmlsdGVycyBsaWtlIE5lYXJlc3QtbmVpZ2hib3Ig
YXBwbGllZCBmb3Igbm9uLWJsdXJyeSBvdXRwdXRzLgo+ID4gPj4KPiA+ID4+IFRoZXJlIHdhcyBh
IFJGQyBwYXRjaCBzZXJpZXMgcHVibGlzaGVkLCB0byBkaXNjdXMgdGhlIHJlcXVlc3QgdG8gZW5h
YmxlCj4gPiA+PiBJbnRlZ2VyIG1vZGUgc2NhbGluZyBieSBzb21lIG9mIHRoZSBnYW1pbmcgY29t
bXVuaXRpZXMsIHdoaWNoIGNhbiBiZQo+ID4gPj4gZm91bmQgaGVyZToKPiA+ID4+IGh0dHBzOi8v
cGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvNjYxNzUvCj4gPiA+Pgo+ID4gPj4gU2ln
bmVkLW9mZi1ieTogU2hhc2hhbmsgU2hhcm1hIDxzaGFzaGFuay5zaGFybWFAaW50ZWwuY29tPgo+
ID4gPj4gLS0tCj4gPiA+PiAgIGRyaXZlcnMvZ3B1L2RybS9kcm1fYXRvbWljX3VhcGkuYyB8ICA0
ICsrKysKPiA+ID4+ICAgaW5jbHVkZS9kcm0vZHJtX2NydGMuaCAgICAgICAgICAgIHwgMjYgKysr
KysrKysrKysrKysrKysrKysrKysrKysKPiA+ID4+ICAgaW5jbHVkZS9kcm0vZHJtX21vZGVfY29u
ZmlnLmggICAgIHwgIDYgKysrKysrCj4gPiA+PiAgIDMgZmlsZXMgY2hhbmdlZCwgMzYgaW5zZXJ0
aW9ucygrKQo+IAo+IC4uLgo+IAo+ID4gPj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2RybV9j
cnRjLmggYi9pbmNsdWRlL2RybS9kcm1fY3J0Yy5oCj4gPiA+PiBpbmRleCA1ZTliMTVhMGU4YzUu
Ljk0YzU1MDk0NzRhOCAxMDA2NDQKPiA+ID4+IC0tLSBhL2luY2x1ZGUvZHJtL2RybV9jcnRjLmgK
PiA+ID4+ICsrKyBiL2luY2x1ZGUvZHJtL2RybV9jcnRjLmgKPiA+ID4+IEBAIC01OCw2ICs1OCwy
NSBAQCBzdHJ1Y3QgZGV2aWNlX25vZGU7Cj4gPiA+PiAgIHN0cnVjdCBkbWFfZmVuY2U7Cj4gPiA+
PiAgIHN0cnVjdCBlZGlkOwo+ID4gPj4gICAKPiA+ID4+ICtlbnVtIGRybV9zY2FsaW5nX2ZpbHRl
cnMgewo+ID4gPj4gKwlEUk1fU0NBTElOR19GSUxURVJfREVGQVVMVCwKPiA+ID4+ICsJRFJNX1ND
QUxJTkdfRklMVEVSX01FRElVTSwKPiA+ID4+ICsJRFJNX1NDQUxJTkdfRklMVEVSX0JJTElORUFS
LAo+ID4gPj4gKwlEUk1fU0NBTElOR19GSUxURVJfTk4sICAKPiA+ID4gUGxlYXNlIHVzZSByZWFs
IHdvcmRzLiAgCj4gPiBZZXMsIEkgc2F3IHRoYXQgY29taW5nLiBJdCB3YXMgZ2V0dGluZyBkaWZm
aWN1bHQgd2l0aCB0aGUgODAgY2hhciBzdHVmZiwgCj4gPiBpdCB3YXMgZXZlbiBtb3JlIGRpZmZp
Y3VsdCB3aGlsZSB1c2luZyBpdCA6KS4gQnV0IGxldCBtZSBzZWUgaG93IGJldHRlciAKPiA+IGNh
biBJIGRvIGhlcmUuCj4gPiA+PiArCURSTV9TQ0FMSU5HX0ZJTFRFUl9OTl9JU19PTkxZLCAgCj4g
PiA+IE5vdCBhIGJpZyBmYW4gb2YgdGhpcy4gSSdkIGp1c3QgYWRkIHRoZSBleHBsaWNpdCBuZWFy
ZXN0IGZpbHRlcgo+ID4gPiBhbmQgbGVhdmUgdGhlIGRlY2lzaW9uIHdoZXRoZXIgdG8gdXNlIGl0
IHRvIHVzZXJzcGFjZS4gIAo+ID4gQWdyZWUsIHRoYXQncyBhbHNvIG9uZSBvcHRpb24uIEkgd2Fz
IHRoaW5raW5nIHRvIG1ha2UgaXQgY29udmVuaWVudCBmb3IgCj4gPiB1c2Vyc3BhY2UswqAgRm9y
IGV4YW1wbGUgaWYgYSBjb21wb3NpdG9yIGp1c3Qgd2FudCB0byBjaGVja291dCBOTiBvbmx5IAo+
ID4gd2hlbiBpdHMgYmVuZWZpY2lhbCAobGlrZSBvbGQgZ2FtaW5nIHNjZW5hcmlvcykgYnV0IGRv
ZXNuJ3QgaGF2ZSBlbm91Z2ggCj4gPiBpbmZvcm1hdGlvbiAob3IgaW50ZW50KSwgaXQgY2FuIGxl
YXZlIGl0IHRvIGtlcm5lbCB0b28uIEJ1dCBJIGFncmVlLCAKPiA+IHRoaXMgY2FuIGNhdXNlIGNv
cm5lciBjYXNlcy4gTGV0J3MgZGlzY3VzcyBhbmQgc2VlIGlmIHdlIG5lZWQgaXQgYXQgYWxsLCAK
PiA+IGFzIHlvdSBtZW50aW9uZWQuCj4gCj4gSGksCj4gCj4gaG93IGNvdWxkIHRoZSBrZXJuZWwg
aGF2ZSBtb3JlIGluZm9ybWF0aW9uIG9yIGtub3dsZWRnZSBvZiBpbnRlbnQgdGhhbgo+IGEgZGlz
cGxheSBzZXJ2ZXI/IEkgY2Fubm90IHNlZSBob3csIGJlY2F1c2UgZXZlcnl0aGluZyB0aGUga2Vy
bmVsIGdldHMKPiBjb21lcyB0aHJvdWdoIHRoZSBkaXNwbGF5IHNlcnZlci4KClRoZSBvbmx5IGV4
Y2VwdGlvbiBpcyBkdWUgdG8gdGhhdCBhbm5veWluZyBzY2FsaW5nIG1vZGUgcHJvcGVydHkuCkN1
cnJlbnRseSB1c2Vyc3BhY2UganVzdCB0ZWxscyB0aGUga2VybmVsICJjZW50ZXIgdnMuIGZ1bGxz
Y3JlZW4gdnMuCmFzcGVjdCIgc28gaW4gdGhlb3J5IG9ubHkgdGhlIGtlcm5lbCBrbm93cyB0aGUg
YWN0dWFsIG91dHB1dCBzaXplCih0aG91Z2ggdXNlcnNwYWNlIHNob3VsZCBiZSBhYmxlIHRvIGNh
bGN1bGF0ZSBpdCBhcyB3ZWxsKS4gCgpCdXQgbWF5YmUgd2UgY2FuIGp1c3QgYXZvaWQgdGhhdCBs
aXR0bGUgaXNzdWUgYnkgYWxzbyBleHBvc2luZyB0aGUKIlRWIiBtYXJnaW4gcHJvcGVydGllcyBv
biBsb2NhbCBwYW5lbHMsIGF0IHdoaWNoIHBvaW50IHVzZXJzcGFjZQpjYW4gYmUgbW9yZSBleHBs
aWNpdCBhYm91dCB3aGF0IGl0IHdhbnRzLgoKLS0gClZpbGxlIFN5cmrDpGzDpApJbnRlbApfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
