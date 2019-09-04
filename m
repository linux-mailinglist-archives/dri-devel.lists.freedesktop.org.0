Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E4A6A8623
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2019 17:48:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC3D4894E7;
	Wed,  4 Sep 2019 15:48:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EF07894E7
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2019 15:48:05 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Sep 2019 08:48:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,467,1559545200"; d="scan'208";a="194775097"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga002.jf.intel.com with SMTP; 04 Sep 2019 08:48:01 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 04 Sep 2019 18:48:00 +0300
Date: Wed, 4 Sep 2019 18:48:00 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Sidong Yang <realwakka@gmail.com>
Subject: Re: [PATCH] drm/vkms: Use alpha value to blend values.
Message-ID: <20190904154800.GD7482@intel.com>
References: <20190831172546.GA1972@raspberrypi>
 <20190902122858.GU7482@intel.com>
 <20190904072707.GA29211@raspberrypi>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190904072707.GA29211@raspberrypi>
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
Cc: David Airlie <airlied@linux.ie>, Haneen Mohammed <hamohammed.sa@gmail.com>,
 dri-devel@lists.freedesktop.org,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBTZXAgMDQsIDIwMTkgYXQgMDg6Mjc6MDdBTSArMDEwMCwgU2lkb25nIFlhbmcgd3Jv
dGU6Cj4gT24gTW9uLCBTZXAgMDIsIDIwMTkgYXQgMDM6Mjg6NThQTSArMDMwMCwgVmlsbGUgU3ly
asOkbMOkIHdyb3RlOgo+ID4gT24gU2F0LCBBdWcgMzEsIDIwMTkgYXQgMDY6MjU6NDZQTSArMDEw
MCwgU2lkb25nIFlhbmcgd3JvdGU6Cj4gPiA+IFVzZSBhbHBoYSB2YWx1ZSB0byBibGVuZCBzb3Vy
Y2UgdmFsdWUgYW5kIGRlc3RpbmF0aW9uIHZhbHVlIEluc3RlYWQgb2YKPiA+ID4ganVzdCBvdmVy
d3JpdGUgd2l0aCBzb3VyY2UgdmFsdWUuCj4gPiA+IAo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBTaWRv
bmcgWWFuZyA8cmVhbHdha2thQGdtYWlsLmNvbT4KPiA+ID4gLS0tCj4gPiA+ICBkcml2ZXJzL2dw
dS9kcm0vdmttcy92a21zX2NvbXBvc2VyLmMgfCAxMyArKysrKysrKysrKy0tCj4gPiA+ICAxIGZp
bGUgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiA+ID4gCj4gPiA+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdmttcy92a21zX2NvbXBvc2VyLmMgYi9kcml2
ZXJzL2dwdS9kcm0vdmttcy92a21zX2NvbXBvc2VyLmMKPiA+ID4gaW5kZXggZDU1ODU2OTVjNjRk
Li5iNzc2MTg1ZTVjYjUgMTAwNjQ0Cj4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS92a21zL3Zr
bXNfY29tcG9zZXIuYwo+ID4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vdmttcy92a21zX2NvbXBv
c2VyLmMKPiA+ID4gQEAgLTc1LDYgKzc1LDkgQEAgc3RhdGljIHZvaWQgYmxlbmQodm9pZCAqdmFk
ZHJfZHN0LCB2b2lkICp2YWRkcl9zcmMsCj4gPiA+ICAJaW50IHlfbGltaXQgPSB5X3NyYyArIGhf
ZHN0Owo+ID4gPiAgCWludCB4X2xpbWl0ID0geF9zcmMgKyB3X2RzdDsKPiA+ID4gIAo+ID4gPiAr
CXU4ICpzcmMsICpkc3Q7Cj4gPiA+ICsJdTMyIGFscGhhLCBpbnZfYWxwaGE7Cj4gPiAKPiA+IFRo
ZXNlIGNvdWxkIGFsbCBsaXZlIGluIGEgdGlnaHRlciBzY29wZS4KPiAKPiBIaSwgVmlsbGUuCj4g
Cj4gVGhhbmsgeW91IGZvciByZXZpZXdpbmcgbXkgcGF0Y2guCj4gSSB0aGluayB0aGF0J3MgZ29v
ZCBpZGVhIGFuZCBJJ2xsIGRvIHRoYXQgaW4gbmV4dCB2ZXJzaW9uLgo+IEkgZm91bmQgc29tZSBw
YXRjaCBpbiBtYWlsaW5nIGxpc3QgdGhhdCBpcyBzaW1pbGFyIHdpdGggdGhpcyBwYXRjaC4KPiBT
byBzaG91bGQgSSBkcm9wIHRoaXMgcGF0Y2ggYW5kIGZpbmQgb3RoZXIgdGhpbmc/CgpQcm9iYWJs
eSBiZXN0IGlmIHlvdSBkaXNjdXNzIHRoYXQgd2l0aCB3aG9ldmVyIHNlbnQgdGhhdCBvdGhlciBw
YXRjaC4KCj4gCj4gU2lkb25nLgo+IAo+ID4gCj4gPiBBcGFydCBmcm9tIHRoYXQgbGd0bQo+ID4g
UmV2aWV3ZWQtYnk6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5j
b20+Cj4gPiAKPiA+ID4gKwo+ID4gPiAgCWZvciAoaSA9IHlfc3JjLCBpX2RzdCA9IHlfZHN0OyBp
IDwgeV9saW1pdDsgKytpKSB7Cj4gPiA+ICAJCWZvciAoaiA9IHhfc3JjLCBqX2RzdCA9IHhfZHN0
OyBqIDwgeF9saW1pdDsgKytqKSB7Cj4gPiA+ICAJCQlvZmZzZXRfZHN0ID0gZGVzdF9jb21wb3Nl
ci0+b2Zmc2V0Cj4gPiA+IEBAIC04NCw4ICs4NywxNCBAQCBzdGF0aWMgdm9pZCBibGVuZCh2b2lk
ICp2YWRkcl9kc3QsIHZvaWQgKnZhZGRyX3NyYywKPiA+ID4gIAkJCQkgICAgICsgKGkgKiBzcmNf
Y29tcG9zZXItPnBpdGNoKQo+ID4gPiAgCQkJCSAgICAgKyAoaiAqIHNyY19jb21wb3Nlci0+Y3Bw
KTsKPiA+ID4gIAo+ID4gPiAtCQkJbWVtY3B5KHZhZGRyX2RzdCArIG9mZnNldF9kc3QsCj4gPiA+
IC0JCQkgICAgICAgdmFkZHJfc3JjICsgb2Zmc2V0X3NyYywgc2l6ZW9mKHUzMikpOwo+ID4gPiAr
CQkJc3JjID0gdmFkZHJfc3JjICsgb2Zmc2V0X3NyYzsKPiA+ID4gKwkJCWRzdCA9IHZhZGRyX2Rz
dCArIG9mZnNldF9kc3Q7Cj4gPiA+ICsJCQlhbHBoYSA9IHNyY1szXSArIDE7Cj4gPiA+ICsJCQlp
bnZfYWxwaGEgPSAyNTYgLSBzcmNbM107Cj4gPiA+ICsJCQlkc3RbMF0gPSAoYWxwaGEgKiBzcmNb
MF0gKyBpbnZfYWxwaGEgKiBkc3RbMF0pID4+IDg7Cj4gPiA+ICsJCQlkc3RbMV0gPSAoYWxwaGEg
KiBzcmNbMV0gKyBpbnZfYWxwaGEgKiBkc3RbMV0pID4+IDg7Cj4gPiA+ICsJCQlkc3RbMl0gPSAo
YWxwaGEgKiBzcmNbMl0gKyBpbnZfYWxwaGEgKiBkc3RbMl0pID4+IDg7Cj4gPiA+ICsJCQlkc3Rb
M10gPSAweGZmOwo+ID4gPiAgCQl9Cj4gPiA+ICAJCWlfZHN0Kys7Cj4gPiA+ICAJfQo+ID4gPiAt
LSAKPiA+ID4gMi4yMC4xCj4gPiA+IAo+ID4gPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwo+ID4gPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gPiA+IGRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiA+ID4gaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKPiA+IAo+ID4gLS0gCj4gPiBWaWxs
ZSBTeXJqw6Rsw6QKPiA+IEludGVsCgotLSAKVmlsbGUgU3lyasOkbMOkCkludGVsCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
