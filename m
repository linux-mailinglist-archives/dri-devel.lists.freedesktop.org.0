Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC0A67FB52
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2019 15:44:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FBEB6EE66;
	Fri,  2 Aug 2019 13:44:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E22EE6EE65;
 Fri,  2 Aug 2019 13:44:03 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 Aug 2019 06:44:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,338,1559545200"; d="scan'208";a="191853555"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.150])
 by fmsmga001.fm.intel.com with ESMTP; 02 Aug 2019 06:43:59 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Sam Ravnborg <sam@ravnborg.org>, "Koenig\,
 Christian" <Christian.Koenig@amd.com>
Subject: Re: [Intel-gfx] [PATCH v1 02/11] drm: drop uapi dependency from
 drm_print.h
In-Reply-To: <20190729175011.GA1753@ravnborg.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20190718161507.2047-1-sam@ravnborg.org>
 <20190718161507.2047-3-sam@ravnborg.org>
 <156346840026.24728.936589728458336617@skylake-alporthouse-com>
 <460bf1e1-a38b-5f79-26e5-93764067f4e1@amd.com> <87tvb5nh5c.fsf@intel.com>
 <20190729143555.GA16927@ravnborg.org>
 <67c2807f-582c-49a9-5699-a8baab3d3a0f@amd.com>
 <20190729175011.GA1753@ravnborg.org>
Date: Fri, 02 Aug 2019 16:48:19 +0300
Message-ID: <87o917lluk.fsf@intel.com>
MIME-Version: 1.0
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
Cc: Boris Brezillon <bbrezillon@kernel.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Paul <seanpaul@chromium.org>,
 Thierry Reding <treding@nvidia.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAyOSBKdWwgMjAxOSwgU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPiB3cm90
ZToKPiBIaSBDaHJpc3RpYW4uCj4KPiBPbiBNb24sIEp1bCAyOSwgMjAxOSBhdCAwMzoyODoxNVBN
ICswMDAwLCBLb2VuaWcsIENocmlzdGlhbiB3cm90ZToKPj4gQW0gMjkuMDcuMTkgdW0gMTY6MzUg
c2NocmllYiBTYW0gUmF2bmJvcmc6Cj4+ID4+Pj4gRXZlbiB0aGVuIGl0IHNvIHVzZWxlc3MgKHdo
aWNoIGRybSBkcml2ZXIgaXMgdGhpcyBtZXNzYWdlIGZvcj8/PykgdGhhdCBJCj4+ID4+Pj4gd2Fu
dCB0byByZW1vdmUgdGhlbSBhbGwgOigKPj4gPj4+IFllYWgsIGFncmVlLiBJIG1lYW4gaXQgaXMg
bmljZSBpZiB0aGUgY29yZSBkcm0gZnVuY3Rpb25zIHVzZSBhIHByZWZpeAo+PiA+Pj4gZm9yIGRl
YnVnIG91dHB1dC4KPj4gPj4+Cj4+ID4+PiBCdXQgSSBhY3R1YWxseSBkb24ndCBzZWUgdGhlIHBv
aW50IGZvciBpbmRpdmlkdWFsIGRyaXZlcnMuCj4+ID4+IFdlIHNob3VsZCBhbGwgbWlncmF0ZSB0
byB0aGUgdmVyc2lvbnMgd2l0aCBkZXZpY2UuLi4KPj4gPiBKdXN0IHRvIGRvIGFuIHhrZGMuY29t
LzkyNyBJIGhhdmUgY29uc2lkZXJlZDoKPj4gPgo+PiA+IGRybV9lcnIoY29uc3Qgc3RydWN0IGRy
bV9kZXZpY2UgKmRybSwgLi4uKQo+PiA+IGRybV9pbmZvKGNvbnN0IHN0cnVjdCBkcm1fZGV2aWNl
ICpkcm0sIC4uLikKPj4gPgo+PiA+IGRybV9rbXNfZXJyKGNvbnN0IHN0cnVjdCBkcm1fZGV2aWNl
ICpkcm0sIC4uLikKPj4gPiBkcm1fa21zX2luZm8oY29uc3Qgc3RydWN0IGRybV9kZXZpY2UgKmRy
bSwgLi4uKSkKPj4gCj4+IFdoeSBub3QgZ2V0IGNvbXBsZXRlbHkgcmlkIG9mIHRob3NlIGFuZCBq
dXN0IHVzZSBkZXZfZXJyLCBkZXZfd2FybiwgCj4+IHByX2VyciwgcHJfd2FybiBldGM/Cj4+IAo+
PiBJIG1lYW4gaXMgaXQgdXNlZnVsIHRvIGhhdmUgdGhpcyBleHRyYSBwcmludGluZyBzdWJzeXN0
ZW0gaW4gRFJNIHdoaWxlIAo+PiB0aGUgc3RhbmRhcmQgTGludXggb25lIGFjdHVhbGx5IGRvZXMg
YSBiZXR0ZXIgam9iPwo+IFRoZSBhZGRlZCBmdW5jdGlvbmFsaXR5IG9mIGRybV94eHhfZXJyIHdv
dWxkIGJlIHRvIGtlZXAgdGhlIGN1cnJlbnQKPiBkcm0uZGVidWc9MHgxZiBmaWx0ZXJpbmcgb24g
dGhlIGNvbW1hbmQtbGluZS4KPiBJIGRvIG5vdCB0aGluayB3ZSBjYW4gZG8gdGhpcyB3aXRoIHRo
ZSBzdGFuZGFyZCBsb2dnaW5nLgoKQ29ycmVjdC4gSSdkIGxvdmUgdGhlIGJlbmVmaXRzIG9mIGR5
bmFtaWMgZGVidWcsIGJ1dCB0aGVyZSdzIG5vIHN1cHBvcnQKZm9yIHRoZSBraW5kIG9mIG1lc3Nh
Z2UgY2F0ZWdvcmllcyB0aGF0IHdlIGRvIHdpdGggZHJtLmRlYnVnLgoKSSd2ZSBjb250ZW1wbGF0
ZWQgc3dpdGNoaW5nIGk5MTUgb3ZlciB0byB1c2luZyB0aGUgdmFyaWFudHMgd2hlcmUgeW91CnBh
c3MgdGhlIGRldmljZSwgYnV0IEkgcmVhbGx5IHJlYWxseSBkb24ndCBsaWtlIHRoZSBpZGVhIG9m
OgoKLSAJRFJNX0RFQlVHX0tNUygiaGVsbG9cbiIpOworIAlEUk1fREVWX0RFQlVHX0tNUyhpOTE1
LT5kcm0uZGV2LCAiaGVsbG9cbiIpOwoKV2hlcmUgaTkxNSBpcyBvdXIgcHJpdmF0ZSB3cmFwcGVy
IGZvciBkcm1fZGV2aWNlLiBJIHRoaW5rIGl0J3MganVzdCB0b28KbXVjaCB1Z2x5IHVwcGVyY2Fz
ZSBib2lsZXJwbGF0ZSwgYW5kIGEgbGFyZ2UgcG9ydGlvbiBvZiB0aGUgZGVidWdzIHdvdWxkCmhh
dmUgdG8gc3BhbiBhdCBsZWFzdCBhbiBleHRyYSBsaW5lIGFmdGVyIHRoYXQuCgpJJ2QgYWxzbyB2
ZXJ5IG11Y2ggcHJlZmVyIHBhc3NpbmcganVzdCBzdHJ1Y3QgKmRybV9kZXZpY2UgaW5zdGVhZCBv
ZgpzdHJ1Y3QgKmRldmljZS4gSW4gdGhhdCwgSSB0aGluayB0aGUgbmVlZHMgb2YgdGhlIGZldyBo
YXZlIHByZXZhaWxlZApvdmVyIHRoZSBuZWVkcyBvZiB0aGUgbWFueS4gSSdkIGRlZmluaXRlbHkg
cHJlZmVyIGRybV9lcnIoY29uc3Qgc3RydWN0CmRybV9kZXZpY2UgKmRybSwgLi4uKSBhbmQgZnJp
ZW5kcyBvdmVyIHRoZSBjdXJyZW50IG9uZXMuCgpGcmFua2x5LCBJJ3ZlIGFjdHVhbGx5IGVuZGVk
IHVwIHRoaW5raW5nIGFib3V0IGFkZGluZyBvdXIgb3duLCBzaG9ydAppOTE1IHdyYXBwZXJzIGZv
ciBvdXIgbmVlZHMuIDooCgpCUiwKSmFuaS4KCgo+Cj4gQW5kIHRoZW4gd2UgY2FuIHByZWZpeCBl
dmVyeSBsb2dnaW5nIHdpdGggZHJpdmVyIG5hbWUgYW5kIGRldmljZSBuYW1lLgo+Cj4gVGhlIGlk
ZWEgaXMgdG8gbWFrZSBhIHRoaW4gbGF5ZXIgb24gdG9wIG9mIHRoZSBleGlzdGluZyBwcl94eHgo
KSBmdW5jdGlvbnMuCj4gU28gbm90IGEgZnVsbCBzdWJzeXN0ZW0sIG9ubHkgYSB3cmFwcGVyIG9u
IHRvcCBvZiB3aGF0IHdlIGFscmVhZHkgaGF2ZS4KPgo+IEFueXdheSwgaWRsZSB0YWxrIG9ubHku
IFdlIG5lZWQgcGF0Y2hlcyBhbmQgc2FtcGxlIG91dHB1dCBpZiB3ZSBzaG91bGQKPiBkaXNjdXNz
IG1vcmUuCj4KPiAJU2FtCj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwo+IEludGVsLWdmeCBtYWlsaW5nIGxpc3QKPiBJbnRlbC1nZnhAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9pbnRlbC1nZngKCi0tIApKYW5pIE5pa3VsYSwgSW50ZWwgT3BlbiBTb3VyY2UgR3JhcGhp
Y3MgQ2VudGVyCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
