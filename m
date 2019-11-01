Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9A69ECA7C
	for <lists+dri-devel@lfdr.de>; Fri,  1 Nov 2019 22:44:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA70C6F881;
	Fri,  1 Nov 2019 21:44:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AF7C6F881
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Nov 2019 21:44:35 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 01 Nov 2019 14:44:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,257,1569308400"; d="scan'208";a="206513841"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by FMSMGA003.fm.intel.com with SMTP; 01 Nov 2019 14:44:31 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 01 Nov 2019 23:44:31 +0200
Date: Fri, 1 Nov 2019 23:44:31 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Rob Clark <robdclark@chromium.org>
Subject: Re: [PATCH 2/2] drm/atomic: clear new_state pointers at hw_done
Message-ID: <20191101214431.GJ1208@intel.com>
References: <20191101180713.5470-1-robdclark@gmail.com>
 <20191101180713.5470-2-robdclark@gmail.com>
 <20191101192458.GI1208@intel.com>
 <CAJs_Fx7u6VNDarYqUuUSMSsWK0jpS5ybse0h1X4AmtXO9Mia_w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJs_Fx7u6VNDarYqUuUSMSsWK0jpS5ybse0h1X4AmtXO9Mia_w@mail.gmail.com>
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Sean Paul <seanpaul@chromium.org>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBOb3YgMDEsIDIwMTkgYXQgMTI6NDk6MDJQTSAtMDcwMCwgUm9iIENsYXJrIHdyb3Rl
Ogo+IE9uIEZyaSwgTm92IDEsIDIwMTkgYXQgMTI6MjUgUE0gVmlsbGUgU3lyasOkbMOkCj4gPHZp
bGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPiB3cm90ZToKPiA+Cj4gPiBPbiBGcmksIE5vdiAw
MSwgMjAxOSBhdCAxMTowNzoxM0FNIC0wNzAwLCBSb2IgQ2xhcmsgd3JvdGU6Cj4gPiA+IEZyb206
IFJvYiBDbGFyayA8cm9iZGNsYXJrQGNocm9taXVtLm9yZz4KPiA+ID4KPiA+ID4gVGhlIG5ldyBz
dGF0ZSBzaG91bGQgbm90IGJlIGFjY2Vzc2VkIGFmdGVyIHRoaXMgcG9pbnQuICBDbGVhciB0aGUK
PiA+ID4gcG9pbnRlcnMgdG8gbWFrZSB0aGF0IGV4cGxpY2l0Lgo+ID4gPgo+ID4gPiBUaGlzIG1h
a2VzIHRoZSBlcnJvciBjb3JyZWN0ZWQgaW4gdGhlIHByZXZpb3VzIHBhdGNoIG1vcmUgb2J2aW91
cy4KPiA+ID4KPiA+ID4gU2lnbmVkLW9mZi1ieTogUm9iIENsYXJrIDxyb2JkY2xhcmtAY2hyb21p
dW0ub3JnPgo+ID4gPiAtLS0KPiA+ID4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fYXRvbWljX2hlbHBl
ci5jIHwgMjkgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPiA+ID4gIDEgZmlsZSBjaGFu
Z2VkLCAyOSBpbnNlcnRpb25zKCspCj4gPiA+Cj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vZHJtX2F0b21pY19oZWxwZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fYXRvbWljX2hl
bHBlci5jCj4gPiA+IGluZGV4IDczMmJkMGNlOTI0MS4uMTc2ODMxZGY4MTYzIDEwMDY0NAo+ID4g
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2F0b21pY19oZWxwZXIuYwo+ID4gPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vZHJtX2F0b21pY19oZWxwZXIuYwo+ID4gPiBAQCAtMjIzNCwxMyArMjIz
NCw0MiBAQCBFWFBPUlRfU1lNQk9MKGRybV9hdG9taWNfaGVscGVyX2Zha2VfdmJsYW5rKTsKPiA+
ID4gICAqLwo+ID4gPiAgdm9pZCBkcm1fYXRvbWljX2hlbHBlcl9jb21taXRfaHdfZG9uZShzdHJ1
Y3QgZHJtX2F0b21pY19zdGF0ZSAqb2xkX3N0YXRlKQo+ID4gPiAgewo+ID4gPiArICAgICBzdHJ1
Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yOwo+ID4gPiArICAgICBzdHJ1Y3QgZHJtX2Nvbm5l
Y3Rvcl9zdGF0ZSAqb2xkX2Nvbm5fc3RhdGUsICpuZXdfY29ubl9zdGF0ZTsKPiA+ID4gICAgICAg
c3RydWN0IGRybV9jcnRjICpjcnRjOwo+ID4gPiAgICAgICBzdHJ1Y3QgZHJtX2NydGNfc3RhdGUg
Km9sZF9jcnRjX3N0YXRlLCAqbmV3X2NydGNfc3RhdGU7Cj4gPiA+ICsgICAgIHN0cnVjdCBkcm1f
cGxhbmUgKnBsYW5lOwo+ID4gPiArICAgICBzdHJ1Y3QgZHJtX3BsYW5lX3N0YXRlICpvbGRfcGxh
bmVfc3RhdGUsICpuZXdfcGxhbmVfc3RhdGU7Cj4gPiA+ICAgICAgIHN0cnVjdCBkcm1fY3J0Y19j
b21taXQgKmNvbW1pdDsKPiA+ID4gKyAgICAgc3RydWN0IGRybV9wcml2YXRlX29iaiAqb2JqOwo+
ID4gPiArICAgICBzdHJ1Y3QgZHJtX3ByaXZhdGVfc3RhdGUgKm9sZF9vYmpfc3RhdGUsICpuZXdf
b2JqX3N0YXRlOwo+ID4gPiAgICAgICBpbnQgaTsKPiA+ID4KPiA+ID4gKyAgICAgLyoKPiA+ID4g
KyAgICAgICogQWZ0ZXIgdGhpcyBwb2ludCwgZHJpdmVycyBzaG91bGQgbm90IGFjY2VzcyB0aGUg
cGVybWFuZW50IG1vZGVzZXQKPiA+ID4gKyAgICAgICogc3RhdGUsIHNvIHdlIGFsc28gY2xlYXIg
dGhlIG5ld19zdGF0ZSBwb2ludGVycyB0byBtYWtlIHRoaXMKPiA+ID4gKyAgICAgICogcmVzdHJp
Y3Rpb24gZXhwbGljaXQuCj4gPiA+ICsgICAgICAqCj4gPiA+ICsgICAgICAqIEZvciB0aGUgQ1JU
QyBzdGF0ZSwgd2UgZG8gdGhpcyBpbiB0aGUgc2FtZSBsb29wIHdoZXJlIHdlIHNpZ25hbAo+ID4g
PiArICAgICAgKiBod19kb25lLCBzaW5jZSB3ZSBzdGlsbCBuZWVkIHRvIG5ld19jcnRjX3N0YXRl
IHRvIGZpc2ggb3V0IHRoZQo+ID4gPiArICAgICAgKiBjb21taXQuCj4gPiA+ICsgICAgICAqLwo+
ID4gPiArCj4gPiA+ICsgICAgIGZvcl9lYWNoX29sZG5ld19jb25uZWN0b3JfaW5fc3RhdGUob2xk
X3N0YXRlLCBjb25uZWN0b3IsIG9sZF9jb25uX3N0YXRlLCBuZXdfY29ubl9zdGF0ZSwgaSkgewo+
ID4gPiArICAgICAgICAgICAgIG9sZF9zdGF0ZS0+Y29ubmVjdG9yc1tpXS5uZXdfc3RhdGUgPSBO
VUxMOwo+ID4gPiArICAgICB9Cj4gPiA+ICsKPiA+ID4gKyAgICAgZm9yX2VhY2hfb2xkbmV3X3Bs
YW5lX2luX3N0YXRlKG9sZF9zdGF0ZSwgcGxhbmUsIG9sZF9wbGFuZV9zdGF0ZSwgbmV3X3BsYW5l
X3N0YXRlLCBpKSB7Cj4gPiA+ICsgICAgICAgICAgICAgb2xkX3N0YXRlLT5wbGFuZXNbaV0ubmV3
X3N0YXRlID0gTlVMTDsKPiA+ID4gKyAgICAgfQo+ID4gPiArCj4gPiA+ICsgICAgIGZvcl9lYWNo
X29sZG5ld19wcml2YXRlX29ial9pbl9zdGF0ZShvbGRfc3RhdGUsIG9iaiwgb2xkX29ial9zdGF0
ZSwgbmV3X29ial9zdGF0ZSwgaSkgewo+ID4gPiArICAgICAgICAgICAgIG9sZF9zdGF0ZS0+cHJp
dmF0ZV9vYmpzW2ldLm5ld19zdGF0ZSA9IE5VTEw7Cj4gPiA+ICsgICAgIH0KPiA+ID4gKwo+ID4g
PiAgICAgICBmb3JfZWFjaF9vbGRuZXdfY3J0Y19pbl9zdGF0ZShvbGRfc3RhdGUsIGNydGMsIG9s
ZF9jcnRjX3N0YXRlLCBuZXdfY3J0Y19zdGF0ZSwgaSkgewo+ID4gPiAgICAgICAgICAgICAgIG9s
ZF9zdGF0ZS0+Y3J0Y3NbaV0ubmV3X3NlbGZfcmVmcmVzaF9hY3RpdmUgPSBuZXdfY3J0Y19zdGF0
ZS0+c2VsZl9yZWZyZXNoX2FjdGl2ZTsKPiA+ID4gKyAgICAgICAgICAgICBvbGRfc3RhdGUtPmNy
dGNzW2ldLm5ld19zdGF0ZSA9IE5VTEw7Cj4gPgo+ID4gVGhhdCdzIGdvaW5nIHRvIGJlIGEgcmVh
bCBQSVRBIHdoZW4gZG9pbmcgcHJvZ3JhbW1pbmcgYWZ0ZXIgdGhlIGZhY3QgZnJvbQo+ID4gYSB2
Ymxhbmsgd29ya2VyLiBJdCdzIGFscmVhZHkgYSBwYWluIHRoYXQgdGhlIG5ld19jcnRjX3N0YXRl
LT5zdGF0ZSBpcwo+ID4gZ2V0dGluZyBOVUxMZWQgc29tZXdoZXJlLgo+ID4KPiAKPiBJIHRoaW5r
IHlvdSBhbHJlYWR5IGhhdmUgdGhhdCBwcm9ibGVtLCB0aGlzIGp1c3QgbWFrZXMgaXQgZXhwbGlj
aXQuCgpJIGRvbid0IHlldC4gRXhjZXB0IG9uIGEgYnJhbmNoIHdoZXJlIEkgaGF2ZSBteSB2Ymxh
bmsgd29ya2Vycy4KQW5kIEkgdGhpbmsgdGhlIG9ubHkgcHJvYmxlbSBpcyBoYXZpbmcgdGhlIGhl
bHBlcnMvY29yZSBjbG9iYmVyCnRoZSBwb2ludGVycyB3aGVuIGl0IHNob3VsZCBub3QuIEkgZG9u
J3Qgc2VlIHdoeSBpdCBjYW4ndCBqdXN0CmxlYXZlIHRoZW0gYmUgYW5kIGxldCBtZSB1c2UgdGhl
bS4KCi0tIApWaWxsZSBTeXJqw6Rsw6QKSW50ZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
