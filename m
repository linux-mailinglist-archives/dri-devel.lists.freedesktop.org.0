Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B0EF450CE
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 02:41:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D02F892F2;
	Fri, 14 Jun 2019 00:41:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 879DE892EE;
 Fri, 14 Jun 2019 00:41:54 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Jun 2019 17:41:53 -0700
X-ExtLoop1: 1
Received: from iweiny-desk2.sc.intel.com ([10.3.52.157])
 by orsmga002.jf.intel.com with ESMTP; 13 Jun 2019 17:41:53 -0700
Date: Thu, 13 Jun 2019 17:43:15 -0700
From: Ira Weiny <ira.weiny@intel.com>
To: Jason Gunthorpe <jgg@mellanox.com>
Subject: Re: [PATCH 18/22] mm: mark DEVICE_PUBLIC as broken
Message-ID: <20190614004314.GD783@iweiny-DESK2.sc.intel.com>
References: <20190613094326.24093-1-hch@lst.de>
 <20190613094326.24093-19-hch@lst.de>
 <20190613194430.GY22062@mellanox.com>
 <a27251ad-a152-f84d-139d-e1a3bf01c153@nvidia.com>
 <20190613195819.GA22062@mellanox.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190613195819.GA22062@mellanox.com>
User-Agent: Mutt/1.11.1 (2018-12-01)
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
Cc: Ralph Campbell <rcampbell@nvidia.com>,
 "linux-nvdimm@lists.01.org" <linux-nvdimm@lists.01.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
 Ben Skeggs <bskeggs@redhat.com>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdW4gMTMsIDIwMTkgYXQgMDc6NTg6MjlQTSArMDAwMCwgSmFzb24gR3VudGhvcnBl
IHdyb3RlOgo+IE9uIFRodSwgSnVuIDEzLCAyMDE5IGF0IDEyOjUzOjAyUE0gLTA3MDAsIFJhbHBo
IENhbXBiZWxsIHdyb3RlOgo+ID4gCj4gPiBPbiA2LzEzLzE5IDEyOjQ0IFBNLCBKYXNvbiBHdW50
aG9ycGUgd3JvdGU6Cj4gPiA+IE9uIFRodSwgSnVuIDEzLCAyMDE5IGF0IDExOjQzOjIxQU0gKzAy
MDAsIENocmlzdG9waCBIZWxsd2lnIHdyb3RlOgo+ID4gPiA+IFRoZSBjb2RlIGhhc24ndCBiZWVu
IHVzZWQgc2luY2UgaXQgd2FzIGFkZGVkIHRvIHRoZSB0cmVlLCBhbmQgZG9lc24ndAo+ID4gPiA+
IGFwcGVhciB0byBhY3R1YWxseSBiZSB1c2FibGUuICBNYXJrIGl0IGFzIEJST0tFTiB1bnRpbCBl
aXRoZXIgYSB1c2VyCj4gPiA+ID4gY29tZXMgYWxvbmcgb3Igd2UgZmluYWxseSBnaXZlIHVwIG9u
IGl0Lgo+ID4gPiA+IAo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IENocmlzdG9waCBIZWxsd2lnIDxo
Y2hAbHN0LmRlPgo+ID4gPiA+ICAgbW0vS2NvbmZpZyB8IDEgKwo+ID4gPiA+ICAgMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4gPiA+ID4gCj4gPiA+ID4gZGlmZiAtLWdpdCBhL21tL0tj
b25maWcgYi9tbS9LY29uZmlnCj4gPiA+ID4gaW5kZXggMGQyYmE3ZTFmNDNlLi40MDZmYTQ1ZTll
Y2MgMTAwNjQ0Cj4gPiA+ID4gKysrIGIvbW0vS2NvbmZpZwo+ID4gPiA+IEBAIC03MjEsNiArNzIx
LDcgQEAgY29uZmlnIERFVklDRV9QUklWQVRFCj4gPiA+ID4gICBjb25maWcgREVWSUNFX1BVQkxJ
Qwo+ID4gPiA+ICAgCWJvb2wgIkFkZHJlc3NhYmxlIGRldmljZSBtZW1vcnkgKGxpa2UgR1BVIG1l
bW9yeSkiCj4gPiA+ID4gICAJZGVwZW5kcyBvbiBBUkNIX0hBU19ITU0KPiA+ID4gPiArCWRlcGVu
ZHMgb24gQlJPS0VOCj4gPiA+ID4gICAJc2VsZWN0IEhNTQo+ID4gPiA+ICAgCXNlbGVjdCBERVZf
UEFHRU1BUF9PUFMKPiA+ID4gCj4gPiA+IFRoaXMgc2VlbXMgYSBiaXQgaGFyc2gsIHdlIGRvIGhh
dmUgYW5vdGhlciBrY29uZmlnIHRoYXQgc2VsZWN0cyB0aGlzCj4gPiA+IG9uZSB0b2RheToKPiA+
ID4gCj4gPiA+IGNvbmZpZyBEUk1fTk9VVkVBVV9TVk0KPiA+ID4gICAgICAgICAgYm9vbCAiKEVY
UEVSSU1FTlRBTCkgRW5hYmxlIFNWTSAoU2hhcmVkIFZpcnR1YWwgTWVtb3J5KSBzdXBwb3J0Igo+
ID4gPiAgICAgICAgICBkZXBlbmRzIG9uIEFSQ0hfSEFTX0hNTQo+ID4gPiAgICAgICAgICBkZXBl
bmRzIG9uIERSTV9OT1VWRUFVCj4gPiA+ICAgICAgICAgIGRlcGVuZHMgb24gU1RBR0lORwo+ID4g
PiAgICAgICAgICBzZWxlY3QgSE1NX01JUlJPUgo+ID4gPiAgICAgICAgICBzZWxlY3QgREVWSUNF
X1BSSVZBVEUKPiA+ID4gICAgICAgICAgZGVmYXVsdCBuCj4gPiA+ICAgICAgICAgIGhlbHAKPiA+
ID4gICAgICAgICAgICBTYXkgWSBoZXJlIGlmIHlvdSB3YW50IHRvIGVuYWJsZSBleHBlcmltZW50
YWwgc3VwcG9ydCBmb3IKPiA+ID4gICAgICAgICAgICBTaGFyZWQgVmlydHVhbCBNZW1vcnkgKFNW
TSkuCj4gPiA+IAo+ID4gPiBNYXliZSBpdCBzaG91bGQgYmUgZGVwZW5kcyBvbiBTVEFHSU5HIG5v
dCBicm9rZW4/Cj4gPiA+IAo+ID4gPiBvciBtYXliZSBub3V2ZWF1X3N2bSBkb2Vzbid0IGFjdHVh
bGx5IG5lZWQgREVWSUNFX1BSSVZBVEU/Cj4gPiA+IAo+ID4gPiBKYXNvbgo+ID4gCj4gPiBJIHRo
aW5rIHlvdSBhcmUgY29uZnVzaW5nIERFVklDRV9QUklWQVRFIGZvciBERVZJQ0VfUFVCTElDLgo+
ID4gRFJNX05PVVZFQVVfU1ZNIGRvZXMgdXNlIERFVklDRV9QUklWQVRFIGJ1dCBub3QgREVWSUNF
X1BVQkxJQy4KPiAKPiBJbmRlZWQgeW91IGFyZSBjb3JyZWN0LCBuZXZlciBtaW5kCj4gCj4gSHVt
LCBzbyB0aGUgb25seSB0aGluZyB0aGlzIGNvbmZpZyBkb2VzIGlzIHNob3J0IGNpcmN1aXQgaGVy
ZToKPiAKPiBzdGF0aWMgaW5saW5lIGJvb2wgaXNfZGV2aWNlX3B1YmxpY19wYWdlKGNvbnN0IHN0
cnVjdCBwYWdlICpwYWdlKQo+IHsKPiAgICAgICAgIHJldHVybiBJU19FTkFCTEVEKENPTkZJR19E
RVZfUEFHRU1BUF9PUFMpICYmCj4gICAgICAgICAgICAgICAgIElTX0VOQUJMRUQoQ09ORklHX0RF
VklDRV9QVUJMSUMpICYmCj4gICAgICAgICAgICAgICAgIGlzX3pvbmVfZGV2aWNlX3BhZ2UocGFn
ZSkgJiYKPiAgICAgICAgICAgICAgICAgcGFnZS0+cGdtYXAtPnR5cGUgPT0gTUVNT1JZX0RFVklD
RV9QVUJMSUM7Cj4gfQo+IAo+IFdoaWNoIGlzIGNhbGxlZCBhbGwgb3ZlciB0aGUgcGxhY2UuLiAK
CjxzaWdoPiAgeWVzIGJ1dCB0aGUgZWFybGllciBwYXRjaDoKCltQQVRDSCAwMy8yMl0gbW06IHJl
bW92ZSBobW1fZGV2bWVtX2FkZF9yZXNvdXJjZQoKUmVtb3ZlcyB0aGUgb25seSBwbGFjZSB0eXBl
IGlzIHNldCB0byBNRU1PUllfREVWSUNFX1BVQkxJQy4KClNvIEkgdGhpbmsgaXQgaXMgb2suICBG
cmFua2x5IEkgd2FzIHdvbmRlcmluZyBpZiB3ZSBzaG91bGQgcmVtb3ZlIHRoZSBwdWJsaWMKdHlw
ZSBhbHRvZ2V0aGVyIGJ1dCBjb25jZXB0dWFsbHkgaXQgc2VlbXMgb2suICBCdXQgSSBkb24ndCBz
ZWUgYW55IHVzZXJzIG9mIGl0CnNvLi4uICBzaG91bGQgd2UgZ2V0IHJpZCBvZiBpdCBpbiB0aGUg
Y29kZSByYXRoZXIgdGhhbiB0dXJuaW5nIHRoZSBjb25maWcgb2ZmPwoKSXJhCgo+IAo+IFNvLCB5
ZXMsIHdlIHJlYWxseSBkb24ndCB3YW50IGFueSBkaXN0cm8gb3Igc29tZXRoaW5nIHRvIHR1cm4g
dGhpcyBvbgo+IHVudGlsIGl0IGhhcyBhIHVzZS4KPiAKPiBSZXZpZXdlZC1ieTogSmFzb24gR3Vu
dGhvcnBlIDxqZ2dAbWVsbGFub3guY29tPgo+IAo+IEphc29uCj4gX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBMaW51eC1udmRpbW0gbWFpbGluZyBsaXN0
Cj4gTGludXgtbnZkaW1tQGxpc3RzLjAxLm9yZwo+IGh0dHBzOi8vbGlzdHMuMDEub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbnZkaW1tCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
