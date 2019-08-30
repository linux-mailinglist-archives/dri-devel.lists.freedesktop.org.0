Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C1B7A3674
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2019 14:13:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8A486E2DE;
	Fri, 30 Aug 2019 12:13:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1713A6E2DC;
 Fri, 30 Aug 2019 12:13:27 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 30 Aug 2019 05:13:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,447,1559545200"; d="scan'208";a="182637399"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga007.fm.intel.com with SMTP; 30 Aug 2019 05:13:23 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 30 Aug 2019 15:13:23 +0300
Date: Fri, 30 Aug 2019 15:13:23 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [PATCH v3 4/7] drm/i915: utilize subconnector property for DP
Message-ID: <20190830121323.GO7482@intel.com>
References: <20190826132216.2823-1-oleg.vasilev@intel.com>
 <20190826132216.2823-5-oleg.vasilev@intel.com>
 <20190828142725.GC7482@intel.com>
 <CADnq5_Omgu7J+3rZjqeQicPbVA0Zopx1mufOb5arLxDNtHnHrg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CADnq5_Omgu7J+3rZjqeQicPbVA0Zopx1mufOb5arLxDNtHnHrg@mail.gmail.com>
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Oleg Vasilev <oleg.vasilev@intel.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBBdWcgMjksIDIwMTkgYXQgMDk6MDk6MTRBTSAtMDQwMCwgQWxleCBEZXVjaGVyIHdy
b3RlOgo+IE9uIFdlZCwgQXVnIDI4LCAyMDE5IGF0IDEwOjI3IEFNIFZpbGxlIFN5cmrDpGzDpAo+
IDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4gd3JvdGU6Cj4gPgo+ID4gT24gTW9uLCBB
dWcgMjYsIDIwMTkgYXQgMDQ6MjI6MTNQTSArMDMwMCwgT2xlZyBWYXNpbGV2IHdyb3RlOgo+ID4g
PiBTaW5jZSBEUC1zcGVjaWZpYyBpbmZvcm1hdGlvbiBpcyBzdG9yZWQgaW4gZHJpdmVyJ3Mgc3Ry
dWN0dXJlcywgZXZlcnkKPiA+ID4gZHJpdmVyIG5lZWRzIHRvIGltcGxlbWVudCBzdWJjb25uZWN0
b3IgcHJvcGVydHkgYnkgaXRzZWxmLgo+ID4gPgo+ID4gPiB2MjogdXBkYXRlcyB0byBtYXRjaCBw
cmV2aW91cyBjb21taXQgY2hhbmdlcwo+ID4gPgo+ID4gPiBSZXZpZXdlZC1ieTogRW1pbCBWZWxp
a292IDxlbWlsLnZlbGlrb3ZAY29sbGFib3JhLmNvbT4KPiA+ID4gVGVzdGVkLWJ5OiBPbGVnIFZh
c2lsZXYgPG9sZWcudmFzaWxldkBpbnRlbC5jb20+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IE9sZWcg
VmFzaWxldiA8b2xlZy52YXNpbGV2QGludGVsLmNvbT4KPiA+ID4gQ2M6IFZpbGxlIFN5cmrDpGzD
pCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+Cj4gPiA+IENjOiBpbnRlbC1nZnhAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCj4gPiA+IC0tLQo+ID4gPiAgZHJpdmVycy9ncHUvZHJtL2k5MTUv
ZGlzcGxheS9pbnRlbF9kcC5jIHwgNiArKysrKysKPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCA2IGlu
c2VydGlvbnMoKykKPiA+ID4KPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1
L2Rpc3BsYXkvaW50ZWxfZHAuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxf
ZHAuYwo+ID4gPiBpbmRleCA2ZGE2YTQ4NTlmMDYuLjljOTdlY2U4MDNlYiAxMDA2NDQKPiA+ID4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kcC5jCj4gPiA+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHAuYwo+ID4gPiBAQCAtNTQzNCw2
ICs1NDM0LDEwIEBAIGludGVsX2RwX2RldGVjdChzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVj
dG9yLAo+ID4gPiAgICAgICBpZiAoc3RhdHVzICE9IGNvbm5lY3Rvcl9zdGF0dXNfY29ubmVjdGVk
ICYmICFpbnRlbF9kcC0+aXNfbXN0KQo+ID4gPiAgICAgICAgICAgICAgIGludGVsX2RwX3Vuc2V0
X2VkaWQoaW50ZWxfZHApOwo+ID4gPgo+ID4gPiArICAgICBkcm1fZHBfc2V0X3N1YmNvbm5lY3Rv
cl9wcm9wZXJ0eShjb25uZWN0b3IsCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHN0YXR1cywKPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgaW50ZWxfZHAtPmRwY2QsCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIGludGVsX2RwLT5kb3duc3RyZWFtX3BvcnRzKTsKPiA+ID4gICAgICAgcmV0dXJu
IHN0YXR1czsKPiA+ID4gIH0KPiA+ID4KPiA+ID4gQEAgLTYzMzIsNiArNjMzNiw4IEBAIGludGVs
X2RwX2FkZF9wcm9wZXJ0aWVzKHN0cnVjdCBpbnRlbF9kcCAqaW50ZWxfZHAsIHN0cnVjdCBkcm1f
Y29ubmVjdG9yICpjb25uZWN0Cj4gPiA+ICAgICAgIHN0cnVjdCBkcm1faTkxNV9wcml2YXRlICpk
ZXZfcHJpdiA9IHRvX2k5MTUoY29ubmVjdG9yLT5kZXYpOwo+ID4gPiAgICAgICBlbnVtIHBvcnQg
cG9ydCA9IGRwX3RvX2RpZ19wb3J0KGludGVsX2RwKS0+YmFzZS5wb3J0Owo+ID4gPgo+ID4gPiAr
ICAgICBkcm1fbW9kZV9hZGRfZHBfc3ViY29ubmVjdG9yX3Byb3BlcnR5KGNvbm5lY3Rvcik7Cj4g
Pgo+ID4gTWF5YmUgc2tpcCB0aGlzIGZvciBlRFA/Cj4gCj4gTm90IHN1cmUgaWYgeW91IGhhdmUg
c29tZXRoaW5nIHNpbWlsYXIsIGJ1dCB0aGVyZSBhcmUgQU1EIHBsYXRmb3Jtcwo+IHRoYXQgY29u
dGFpbiBlRFAgdG8gTFZEUyBicmlkZ2VzLiAgVGhlbiBhZ2FpbiwgcHJvYmFibHkgbm90IGEgYmln
IGRlYWwKPiBmb3IgdGhlIGxhcHRvcCBwYW5lbC4KCklJUkMgdGhvc2UgZG9uJ3QgZ2VuZXJhbGx5
IGV4cG9zZSB0aGUgTFZEUyBzaWRlIGFzIGEgREZQIGFueXdheS4KSWUuIHRoZXkganVzdCBsb29r
cyBsaWtlIGEgRFAgZGV2aWNlIHdpdGggYSBsb2NhbCBzaW5rLgoKLS0gClZpbGxlIFN5cmrDpGzD
pApJbnRlbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
