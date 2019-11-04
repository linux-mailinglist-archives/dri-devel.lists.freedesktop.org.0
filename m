Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C71B1EE785
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2019 19:42:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89F646E811;
	Mon,  4 Nov 2019 18:42:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 498626E811
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Nov 2019 18:42:01 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Nov 2019 10:42:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,267,1569308400"; d="scan'208";a="212367018"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga001.fm.intel.com with SMTP; 04 Nov 2019 10:41:57 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 04 Nov 2019 20:41:56 +0200
Date: Mon, 4 Nov 2019 20:41:56 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH 2/2] drm/atomic: clear new_state pointers at hw_done
Message-ID: <20191104184156.GL1208@intel.com>
References: <20191101180713.5470-1-robdclark@gmail.com>
 <20191101180713.5470-2-robdclark@gmail.com>
 <20191101192458.GI1208@intel.com>
 <CAJs_Fx7u6VNDarYqUuUSMSsWK0jpS5ybse0h1X4AmtXO9Mia_w@mail.gmail.com>
 <20191101214431.GJ1208@intel.com>
 <CAF6AEGsHQ-V9aVvxLE6VeV2Ld+1_QOh7LS6GBsd6Lsr4qPZNMw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAF6AEGsHQ-V9aVvxLE6VeV2Ld+1_QOh7LS6GBsd6Lsr4qPZNMw@mail.gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Sean Paul <seanpaul@chromium.org>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBOb3YgMDEsIDIwMTkgYXQgMDM6MTQ6MDlQTSAtMDcwMCwgUm9iIENsYXJrIHdyb3Rl
Ogo+IE9uIEZyaSwgTm92IDEsIDIwMTkgYXQgMjo0NCBQTSBWaWxsZSBTeXJqw6Rsw6QKPiA8dmls
bGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+IHdyb3RlOgo+ID4KPiA+IE9uIEZyaSwgTm92IDAx
LCAyMDE5IGF0IDEyOjQ5OjAyUE0gLTA3MDAsIFJvYiBDbGFyayB3cm90ZToKPiA+ID4gT24gRnJp
LCBOb3YgMSwgMjAxOSBhdCAxMjoyNSBQTSBWaWxsZSBTeXJqw6Rsw6QKPiA+ID4gPHZpbGxlLnN5
cmphbGFAbGludXguaW50ZWwuY29tPiB3cm90ZToKPiA+ID4gPgo+ID4gPiA+IE9uIEZyaSwgTm92
IDAxLCAyMDE5IGF0IDExOjA3OjEzQU0gLTA3MDAsIFJvYiBDbGFyayB3cm90ZToKPiA+ID4gPiA+
IEZyb206IFJvYiBDbGFyayA8cm9iZGNsYXJrQGNocm9taXVtLm9yZz4KPiA+ID4gPiA+Cj4gPiA+
ID4gPiBUaGUgbmV3IHN0YXRlIHNob3VsZCBub3QgYmUgYWNjZXNzZWQgYWZ0ZXIgdGhpcyBwb2lu
dC4gIENsZWFyIHRoZQo+ID4gPiA+ID4gcG9pbnRlcnMgdG8gbWFrZSB0aGF0IGV4cGxpY2l0Lgo+
ID4gPiA+ID4KPiA+ID4gPiA+IFRoaXMgbWFrZXMgdGhlIGVycm9yIGNvcnJlY3RlZCBpbiB0aGUg
cHJldmlvdXMgcGF0Y2ggbW9yZSBvYnZpb3VzLgo+ID4gPiA+ID4KPiA+ID4gPiA+IFNpZ25lZC1v
ZmYtYnk6IFJvYiBDbGFyayA8cm9iZGNsYXJrQGNocm9taXVtLm9yZz4KPiA+ID4gPiA+IC0tLQo+
ID4gPiA+ID4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fYXRvbWljX2hlbHBlci5jIHwgMjkgKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysKPiA+ID4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgMjkgaW5z
ZXJ0aW9ucygrKQo+ID4gPiA+ID4KPiA+ID4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vZHJtX2F0b21pY19oZWxwZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fYXRvbWljX2hlbHBl
ci5jCj4gPiA+ID4gPiBpbmRleCA3MzJiZDBjZTkyNDEuLjE3NjgzMWRmODE2MyAxMDA2NDQKPiA+
ID4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fYXRvbWljX2hlbHBlci5jCj4gPiA+ID4g
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2F0b21pY19oZWxwZXIuYwo+ID4gPiA+ID4gQEAg
LTIyMzQsMTMgKzIyMzQsNDIgQEAgRVhQT1JUX1NZTUJPTChkcm1fYXRvbWljX2hlbHBlcl9mYWtl
X3ZibGFuayk7Cj4gPiA+ID4gPiAgICovCj4gPiA+ID4gPiAgdm9pZCBkcm1fYXRvbWljX2hlbHBl
cl9jb21taXRfaHdfZG9uZShzdHJ1Y3QgZHJtX2F0b21pY19zdGF0ZSAqb2xkX3N0YXRlKQo+ID4g
PiA+ID4gIHsKPiA+ID4gPiA+ICsgICAgIHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3I7
Cj4gPiA+ID4gPiArICAgICBzdHJ1Y3QgZHJtX2Nvbm5lY3Rvcl9zdGF0ZSAqb2xkX2Nvbm5fc3Rh
dGUsICpuZXdfY29ubl9zdGF0ZTsKPiA+ID4gPiA+ICAgICAgIHN0cnVjdCBkcm1fY3J0YyAqY3J0
YzsKPiA+ID4gPiA+ICAgICAgIHN0cnVjdCBkcm1fY3J0Y19zdGF0ZSAqb2xkX2NydGNfc3RhdGUs
ICpuZXdfY3J0Y19zdGF0ZTsKPiA+ID4gPiA+ICsgICAgIHN0cnVjdCBkcm1fcGxhbmUgKnBsYW5l
Owo+ID4gPiA+ID4gKyAgICAgc3RydWN0IGRybV9wbGFuZV9zdGF0ZSAqb2xkX3BsYW5lX3N0YXRl
LCAqbmV3X3BsYW5lX3N0YXRlOwo+ID4gPiA+ID4gICAgICAgc3RydWN0IGRybV9jcnRjX2NvbW1p
dCAqY29tbWl0Owo+ID4gPiA+ID4gKyAgICAgc3RydWN0IGRybV9wcml2YXRlX29iaiAqb2JqOwo+
ID4gPiA+ID4gKyAgICAgc3RydWN0IGRybV9wcml2YXRlX3N0YXRlICpvbGRfb2JqX3N0YXRlLCAq
bmV3X29ial9zdGF0ZTsKPiA+ID4gPiA+ICAgICAgIGludCBpOwo+ID4gPiA+ID4KPiA+ID4gPiA+
ICsgICAgIC8qCj4gPiA+ID4gPiArICAgICAgKiBBZnRlciB0aGlzIHBvaW50LCBkcml2ZXJzIHNo
b3VsZCBub3QgYWNjZXNzIHRoZSBwZXJtYW5lbnQgbW9kZXNldAo+ID4gPiA+ID4gKyAgICAgICog
c3RhdGUsIHNvIHdlIGFsc28gY2xlYXIgdGhlIG5ld19zdGF0ZSBwb2ludGVycyB0byBtYWtlIHRo
aXMKPiA+ID4gPiA+ICsgICAgICAqIHJlc3RyaWN0aW9uIGV4cGxpY2l0Lgo+ID4gPiA+ID4gKyAg
ICAgICoKPiA+ID4gPiA+ICsgICAgICAqIEZvciB0aGUgQ1JUQyBzdGF0ZSwgd2UgZG8gdGhpcyBp
biB0aGUgc2FtZSBsb29wIHdoZXJlIHdlIHNpZ25hbAo+ID4gPiA+ID4gKyAgICAgICogaHdfZG9u
ZSwgc2luY2Ugd2Ugc3RpbGwgbmVlZCB0byBuZXdfY3J0Y19zdGF0ZSB0byBmaXNoIG91dCB0aGUK
PiA+ID4gPiA+ICsgICAgICAqIGNvbW1pdC4KPiA+ID4gPiA+ICsgICAgICAqLwo+ID4gPiA+ID4g
Kwo+ID4gPiA+ID4gKyAgICAgZm9yX2VhY2hfb2xkbmV3X2Nvbm5lY3Rvcl9pbl9zdGF0ZShvbGRf
c3RhdGUsIGNvbm5lY3Rvciwgb2xkX2Nvbm5fc3RhdGUsIG5ld19jb25uX3N0YXRlLCBpKSB7Cj4g
PiA+ID4gPiArICAgICAgICAgICAgIG9sZF9zdGF0ZS0+Y29ubmVjdG9yc1tpXS5uZXdfc3RhdGUg
PSBOVUxMOwo+ID4gPiA+ID4gKyAgICAgfQo+ID4gPiA+ID4gKwo+ID4gPiA+ID4gKyAgICAgZm9y
X2VhY2hfb2xkbmV3X3BsYW5lX2luX3N0YXRlKG9sZF9zdGF0ZSwgcGxhbmUsIG9sZF9wbGFuZV9z
dGF0ZSwgbmV3X3BsYW5lX3N0YXRlLCBpKSB7Cj4gPiA+ID4gPiArICAgICAgICAgICAgIG9sZF9z
dGF0ZS0+cGxhbmVzW2ldLm5ld19zdGF0ZSA9IE5VTEw7Cj4gPiA+ID4gPiArICAgICB9Cj4gPiA+
ID4gPiArCj4gPiA+ID4gPiArICAgICBmb3JfZWFjaF9vbGRuZXdfcHJpdmF0ZV9vYmpfaW5fc3Rh
dGUob2xkX3N0YXRlLCBvYmosIG9sZF9vYmpfc3RhdGUsIG5ld19vYmpfc3RhdGUsIGkpIHsKPiA+
ID4gPiA+ICsgICAgICAgICAgICAgb2xkX3N0YXRlLT5wcml2YXRlX29ianNbaV0ubmV3X3N0YXRl
ID0gTlVMTDsKPiA+ID4gPiA+ICsgICAgIH0KPiA+ID4gPiA+ICsKPiA+ID4gPiA+ICAgICAgIGZv
cl9lYWNoX29sZG5ld19jcnRjX2luX3N0YXRlKG9sZF9zdGF0ZSwgY3J0Yywgb2xkX2NydGNfc3Rh
dGUsIG5ld19jcnRjX3N0YXRlLCBpKSB7Cj4gPiA+ID4gPiAgICAgICAgICAgICAgIG9sZF9zdGF0
ZS0+Y3J0Y3NbaV0ubmV3X3NlbGZfcmVmcmVzaF9hY3RpdmUgPSBuZXdfY3J0Y19zdGF0ZS0+c2Vs
Zl9yZWZyZXNoX2FjdGl2ZTsKPiA+ID4gPiA+ICsgICAgICAgICAgICAgb2xkX3N0YXRlLT5jcnRj
c1tpXS5uZXdfc3RhdGUgPSBOVUxMOwo+ID4gPiA+Cj4gPiA+ID4gVGhhdCdzIGdvaW5nIHRvIGJl
IGEgcmVhbCBQSVRBIHdoZW4gZG9pbmcgcHJvZ3JhbW1pbmcgYWZ0ZXIgdGhlIGZhY3QgZnJvbQo+
ID4gPiA+IGEgdmJsYW5rIHdvcmtlci4gSXQncyBhbHJlYWR5IGEgcGFpbiB0aGF0IHRoZSBuZXdf
Y3J0Y19zdGF0ZS0+c3RhdGUgaXMKPiA+ID4gPiBnZXR0aW5nIE5VTExlZCBzb21ld2hlcmUuCj4g
PiA+ID4KPiA+ID4KPiA+ID4gSSB0aGluayB5b3UgYWxyZWFkeSBoYXZlIHRoYXQgcHJvYmxlbSwg
dGhpcyBqdXN0IG1ha2VzIGl0IGV4cGxpY2l0Lgo+ID4KPiA+IEkgZG9uJ3QgeWV0LiBFeGNlcHQg
b24gYSBicmFuY2ggd2hlcmUgSSBoYXZlIG15IHZibGFuayB3b3JrZXJzLgo+ID4gQW5kIEkgdGhp
bmsgdGhlIG9ubHkgcHJvYmxlbSBpcyBoYXZpbmcgdGhlIGhlbHBlcnMvY29yZSBjbG9iYmVyCj4g
PiB0aGUgcG9pbnRlcnMgd2hlbiBpdCBzaG91bGQgbm90LiBJIGRvbid0IHNlZSB3aHkgaXQgY2Fu
J3QganVzdAo+ID4gbGVhdmUgdGhlbSBiZSBhbmQgbGV0IG1lIHVzZSB0aGVtLgo+ID4KPiAKPiBJ
IGd1ZXNzIGl0IGNvbWVzIGRvd24gdG8gd2hhdCBhc3N1bXB0aW9ucyB5b3UgY2FuIG1ha2UgaW4g
ZHJpdmVyCj4gYmFja2VuZC4gIEJ1dCBpZiB5b3UgY2FuLCBmb3IgZXhhbXBsZSwgbW92ZSBwbGFu
ZXMgYmV0d2VlbiBjcnRjcywgSQo+IHRoaW5rIHlvdSBjYW4ndCBtYWtlIGFzc3VtcHRpb25zIGFi
b3V0IHRoZSBvcmRlciBpbiB3aGljaCB0aGluZ3MKPiBjb21wbGV0ZSBldmVuIGlmIHlvdSBkb24n
dCBoYXZlIGNvbW1pdHMgb3ZlcnRha2luZyBlYWNoIG90aGVyIG9uIGEKPiBzaW5nbGUgY3J0Yy4u
CgpJTU8gdGhpcyB3aG9sZSBub3Rpb24gb2YgYWNjZXNzaW5nIG5ld19jcnRjX3N0YXRlICYgY28u
IGJlaW5nIHVuc2FmZQpmb3Igc29tZSByZWFzb24gaXMgd3JvbmcuIEkgdGhpbmsgYXMgbG9uZyBh
cyBJIGhhdmUgdGhlIGRybV9hdG9taWNfc3RhdGUKSSBzaG91bGQgYmUgYWJsZSB0byBsb29rIGF0
IHRoZSBuZXcvb2xkIHN0YXRlcyB3aXRoaW4uCgotLSAKVmlsbGUgU3lyasOkbMOkCkludGVsCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
