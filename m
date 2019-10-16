Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C0117D98B1
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2019 19:45:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D23A6E9C2;
	Wed, 16 Oct 2019 17:45:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com
 [IPv6:2607:f8b0:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D95D86E9C2
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2019 17:45:04 +0000 (UTC)
Received: by mail-oi1-x242.google.com with SMTP id a15so20807653oic.0
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2019 10:45:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=z/8Pjhr4Nf54oGisM02MkdmG++fDC7JWpnRqCZFl6sU=;
 b=Zv/a2qfVOn3ios2+hsyLJu9J2v3B5tjXSdmgqO+8dCdNe4pwk9JOdqt6ZktFeqpcQY
 pDzJRgX/9EmCjH24Qg2Ib6ge19WLb5XOgIuunphr96JxxAxdAzKgVV6pkqALVoGbCRDr
 ykvtDfX/LRxtUjKkdl49uoDfyZ3ZvEi4lbKi0kdcrENSqIa3HiWrozr6WZavZIvv4HGH
 yYF1cqZO+udAejYyQry3TwCimAnLDseiuKJvX7HfrPvK+z/r1KSTm7rIY9xMTndQrF/T
 ymWgmtqPlM2qeAyKfX4nS4tyM+TFibM+VC8CwoqTQHHIngnSSHFlx8+oN/G/jOfFcNQD
 ja7Q==
X-Gm-Message-State: APjAAAUIE2/kQMwRzoKl8qKWx4qzYXXTnDwzJBOxpLcyhMp9pmyoOzAz
 u7h+roeincIu3WPHoeaQMFWJFAsQPrxxE3W1/I/gAg==
X-Google-Smtp-Source: APXvYqxZYdmxgbdlybjRfz/Cf6CXvYTEylx4rUPP+us/XBo2REqUB1uhyGky3zzfreRwj5OYAQumALxRm2wZDMTiVTk=
X-Received: by 2002:aca:e046:: with SMTP id x67mr4218651oig.101.1571247903874; 
 Wed, 16 Oct 2019 10:45:03 -0700 (PDT)
MIME-Version: 1.0
References: <20190719155916.62465-1-noralf@tronnes.org>
 <20190719155916.62465-6-noralf@tronnes.org>
 <20191015143236.GA5363@smile.fi.intel.com>
 <253aec49-e51c-b35b-4e7d-53a8a948655d@tronnes.org>
 <20191015155720.GQ11828@phenom.ffwll.local>
 <20191016161300.GW32742@smile.fi.intel.com>
In-Reply-To: <20191016161300.GW32742@smile.fi.intel.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 16 Oct 2019 19:44:51 +0200
Message-ID: <CAKMK7uEp39uvLtgyTTj31u-GYVoPiVJDTVbUThtn7NU_EoKk3A@mail.gmail.com>
Subject: Re: [PATCH v2 05/11] drm/tinydrm: Remove
 tinydrm_spi_max_transfer_size()
To: Andy Shevchenko <andriy.shevchenko@intel.com>,
 Daniel Mack <daniel@zonque.org>, 
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=z/8Pjhr4Nf54oGisM02MkdmG++fDC7JWpnRqCZFl6sU=;
 b=QujAVNH6ta1gYwt38oJZD6idtx8FqAjjAk5FQsV0WeFfZc7o9s78inrpE6f1Qh9R3J
 kixlxJBedNzdBVrYt/fT/s+LlhOZkwmZFn5Ie/iw8Us18e2TbOFBbWgTsUvSAh4pAl5b
 hsy9Izjro29ySmUQhX/ev4gnzn04vJvJ82rNE=
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
Cc: David Lechner <david@lechnology.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, linux-spi@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Jarkko Nikula <jarkko.nikula@linux.intel.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBPY3QgMTYsIDIwMTkgYXQgNjoxMyBQTSBBbmR5IFNoZXZjaGVua28KPGFuZHJpeS5z
aGV2Y2hlbmtvQGludGVsLmNvbT4gd3JvdGU6Cj4KPiBPbiBUdWUsIE9jdCAxNSwgMjAxOSBhdCAw
NTo1NzoyMFBNICswMjAwLCBEYW5pZWwgVmV0dGVyIHdyb3RlOgo+ID4gT24gVHVlLCBPY3QgMTUs
IDIwMTkgYXQgMDU6NDE6NTNQTSArMDIwMCwgTm9yYWxmIFRyw7hubmVzIHdyb3RlOgo+ID4gPiBE
ZW4gMTUuMTAuMjAxOSAxNi4zMiwgc2tyZXYgQW5keSBTaGV2Y2hlbmtvOgo+ID4gPiA+IE9uIEZy
aSwgSnVsIDE5LCAyMDE5IGF0IDA1OjU5OjEwUE0gKzAyMDAsIE5vcmFsZiBUcsO4bm5lcyB3cm90
ZToKPiA+ID4gPj4gc3BpLWJjbTI4MzUgY2FuIGhhbmRsZSA+NjRrQiBidWZmZXJzIG5vdyBzbyB0
aGVyZSBpcyBubyBuZWVkIHRvIGNoZWNrCj4gPiA+ID4+IC0+bWF4X2RtYV9sZW4uIFRoZSB0aW55
ZHJtX3NwaV9tYXhfdHJhbnNmZXJfc2l6ZSgpIG1heF9sZW4gYXJndW1lbnQgaXMKPiA+ID4gPj4g
bm90IHVzZWQgYnkgYW55IGNhbGxlcnMsIHNvIG5vdCBuZWVkZWQuCj4gPiA+ID4+Cj4gPiA+ID4+
IFRoZW4gd2UgaGF2ZSB0aGUgc3BpX21heCBtb2R1bGUgcGFyYW1ldGVyLiBJdCB3YXMgYWRkZWQg
YmVjYXVzZQo+ID4gPiA+PiBzdGFnaW5nL2ZidGZ0IGhhcyBzdXBwb3J0IGZvciBpdCBhbmQgdGhl
cmUgd2FzIGEgcmVwb3J0IHRoYXQgc29tZW9uZSB1c2VkCj4gPiA+ID4+IGl0IHRvIHNldCBhIHNt
YWxsIGJ1ZmZlciBzaXplIHRvIGF2b2lkIHBvcHBpbmcgb24gYSBVU0Igc291bmRjYXJkIG9uIGEK
PiA+ID4gPj4gUmFzcGJlcnJ5IFBpLiBJbiBoaW5kc2lnaHQgaXQgc2hvdWxkbid0IGhhdmUgYmVl
biBhZGRlZCwgSSBzaG91bGQgaGF2ZQo+ID4gPiA+PiB3YWl0ZWQgZm9yIGl0IHRvIGJlY29tZSBh
IHByb2JsZW0gZmlyc3QuIEkgZG9uJ3Qga25vdyBpdCBhbnlvbmUgaXMKPiA+ID4gPj4gYWN0dWFs
bHkgdXNpbmcgaXQsIGJ1dCBzaW5jZSB0aW55ZHJtX3NwaV90cmFuc2ZlcigpIGlzIGJlaW5nIG1v
dmVkIHRvCj4gPiA+ID4+IG1pcGktZGJpLCBJJ20gdGFraW5nIHRoZSBvcHBvcnR1bml0eSB0byBy
ZW1vdmUgaXQuIEknbGwgYWRkIGl0IGJhY2sgdG8KPiA+ID4gPj4gbWlwaS1kYmkgaWYgc29tZW9u
ZSBjb21wbGFpbnMuCj4gPiA+ID4+Cj4gPiA+ID4+IFdpdGggdGhhdCBvdXQgb2YgdGhlIHdheSwg
c3BpX21heF90cmFuc2Zlcl9zaXplKCkgY2FuIGJlIHVzZWQgaW5zdGVhZC4KPiA+ID4gPj4KPiA+
ID4gPj4gVGhlIGNob3NlbiAxNmtCIGJ1ZmZlciBzaXplIGZvciBUeXBlIEMgT3B0aW9uIDEgKDkt
Yml0KSBpbnRlcmZhY2UgaXMKPiA+ID4gPj4gc29tZXdoYXQgYXJiaXRyYXJ5LCBidXQgYSBiaWdn
ZXIgYnVmZmVyIHdpbGwgaGF2ZSBhIG1pbmlzY3VsZSBpbXBhY3Qgb24KPiA+ID4gPj4gdHJhbnNm
ZXIgc3BlZWQsIHNvIGl0J3MgcHJvYmFibHkgZmluZS4KPiA+ID4gPgo+ID4gPiA+IFRoaXMgYnJl
YWtzIHRoZSBTUEkgUFhBMnh4IGNhc2UgSSdtIHVzaW5nLiBUaGUgd29ybGQgaXMgbm90IGEgUGk6
ZS4KPiA+ID4gPgo+ID4gPiA+IFsgIDM4OC40NDU3NTJdIG1pMDI4M3F0IHNwaS1QUlAwMDAxOjAx
OiBETUEgZGlzYWJsZWQgZm9yIHRyYW5zZmVyIGxlbmd0aCAxNTM2MDAgZ3JlYXRlciB0aGFuIDY1
NTM2Cj4gPiA+ID4gWyAgMzg4LjYzNDQzN10gbWkwMjgzcXQgc3BpLVBSUDAwMDE6MDE6IERNQSBk
aXNhYmxlZCBmb3IgdHJhbnNmZXIgbGVuZ3RoIDE1MzYwMCBncmVhdGVyIHRoYW4gNjU1MzYKPiA+
ID4gPiBbICAzODguODIyOTMzXSBtaTAyODNxdCBzcGktUFJQMDAwMTowMTogRE1BIGRpc2FibGVk
IGZvciB0cmFuc2ZlciBsZW5ndGggMTUzNjAwIGdyZWF0ZXIgdGhhbiA2NTUzNgo+ID4gPiA+Cj4g
PiA+ID4gVGhlIGNydWNpYWwgdGhpbmcgaXMgdG8gY2hlY2sgdGhlIHRyYW5zZmVyIHNpemUgYWdh
aW5zdCBtYXhpbXVtIERNQSBsZW5ndGgKPiA+ID4gPiBvZiB0aGUgbWFzdGVyLgo+ID4gPiA+Cj4g
PiA+Cj4gPiA+IElzbid0IHRoaXMgYSBzcGkgY29udHJvbGxlciBkcml2ZXIgcHJvYmxlbT8KPiA+
ID4gc3BpX21heF90cmFuc2Zlcl9zaXplKCkgdGVsbHMgdGhlIGNsaWVudCB3aGF0IHRoZSBtYXhp
bXVtIHRyYW5zZmVyCj4gPiA+IGxlbmd0aCBpcy4gVGhlIGNvbnRyb2xsZXIgZHJpdmVyIGNhbiB1
c2UgY3Rsci0+bWF4X3RyYW5zZmVyX3NpemUgaWYgaXQKPiA+ID4gaGFzIHJlc3RyaWN0aW9ucy4K
PiA+ID4gQUZBSVVJIG1heF9kbWFfbGVuIGlzIHVzZWQgd2hlbiBzcGxpdHRpbmcgdXAgdGhlIGJ1
ZmZlciBmb3IgdGhlIHNnIHRhYmxlCj4gPiA+IGluIHNwaV9tYXBfYnVmKCkuCj4gPgo+ID4gU29t
ZXRoaW5nIGxpa2UgdGhpcywgYXMgYSB0ZXN0IHBhdGNoLgo+Cj4gbWF4X3RyYW5zZmVyX3NpemUg
c2hvdWxkIGJlIGEgZnVuY3Rpb24uIEluIHRoYXQgY2FzZSBpdCB3b3Jrcy4KCldoeSBkbyB5b3Ug
d2FudCB0byBtYWtlIGl0IGEgZnVuY3Rpb24/IEF0IGxlYXN0IGZyb20gbXkgcmVhZGluZyBvZiB0
aGUKY29kZSwgdGhlIGRtYSB2cyBwaW8gZGVjaXNpb24gc2VlbXMgdG8gYmUgZG9uZSBvbmNlLiBT
byBubyBuZWVkIHRvCmNoYW5nZSB0aGlzIGF0IHJ1bnRpbWUuIENoYW5naW5nIGF0IHJ1bnRpbWUg
d291bGQgYWxzbyBiZSBhIHByZXR0eSBiaWcKc3VycHJpc2UgSSB0aGluayBmb3IgdXNlcnMgb2Yg
c3BpLgoKPiBIb3dldmVyIEknbSBub3Qgc3VyZSBpdCdzIHRoZSBiZXN0IGFwcHJvYWNoLCB0aHVz
LCBDYyB0byBTUEkgUFhBIHBlb3BsZS4KCkhtIGRpZG4ndCBzcG90IHRoZSBweGEgcGVvcGxlLCBh
ZGRlZCB0aGVtLiBNYXJrLCBzaG91bGQgSSBqdXN0IGdvCmFoZWFkIGFuZCBiYWtlIHRoaXMgaW50
byBhIHByb3BlciBwYXRjaCBmb3IgZGlzY3Vzc2lvbj8gT3IKZnVuZGFtZW50YWxseSB3cm9uZyBh
cHByb2FjaD8KLURhbmllbAoKPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3NwaS9zcGktcHhhMnh4
LmMgYi9kcml2ZXJzL3NwaS9zcGktcHhhMnh4LmMKPiA+IGluZGV4IGJiNmExNGQxYWIwZi4uZjc3
MjAxOTE1MDMzIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9zcGkvc3BpLXB4YTJ4eC5jCj4gPiAr
KysgYi9kcml2ZXJzL3NwaS9zcGktcHhhMnh4LmMKPiA+IEBAIC0xNzA3LDYgKzE3MDcsNyBAQCBz
dGF0aWMgaW50IHB4YTJ4eF9zcGlfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikK
PiA+ICAgICAgICAgICAgICAgfSBlbHNlIHsKPiA+ICAgICAgICAgICAgICAgICAgICAgICBjb250
cm9sbGVyLT5jYW5fZG1hID0gcHhhMnh4X3NwaV9jYW5fZG1hOwo+ID4gICAgICAgICAgICAgICAg
ICAgICAgIGNvbnRyb2xsZXItPm1heF9kbWFfbGVuID0gTUFYX0RNQV9MRU47Cj4gPiArICAgICAg
ICAgICAgICAgICAgICAgY29udHJvbGxlci0+bWF4X3RyYW5zZmVyX3NpemUgPSBNQVhfRE1BX0xF
TjsKPiA+ICAgICAgICAgICAgICAgfQo+ID4gICAgICAgfQo+ID4KPgo+IC0tCj4gV2l0aCBCZXN0
IFJlZ2FyZHMsCj4gQW5keSBTaGV2Y2hlbmtvCj4KPgoKCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3
YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgorNDEgKDApIDc5IDM2NSA1NyA0OCAtIGh0
dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
