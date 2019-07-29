Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D632D78D57
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jul 2019 16:01:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D70889D66;
	Mon, 29 Jul 2019 14:01:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F192089D66;
 Mon, 29 Jul 2019 14:01:22 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Jul 2019 05:41:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,322,1559545200"; d="scan'208";a="190561299"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.150])
 by fmsmga001.fm.intel.com with ESMTP; 29 Jul 2019 05:41:11 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: "Koenig\, Christian" <Christian.Koenig@amd.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Sam Ravnborg <sam@ravnborg.org>,
 "dri-devel\@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v1 02/11] drm: drop uapi dependency from drm_print.h
In-Reply-To: <460bf1e1-a38b-5f79-26e5-93764067f4e1@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20190718161507.2047-1-sam@ravnborg.org>
 <20190718161507.2047-3-sam@ravnborg.org>
 <156346840026.24728.936589728458336617@skylake-alporthouse-com>
 <460bf1e1-a38b-5f79-26e5-93764067f4e1@amd.com>
Date: Mon, 29 Jul 2019 15:45:35 +0300
Message-ID: <87tvb5nh5c.fsf@intel.com>
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
Cc: Boris Brezillon <bbrezillon@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Liviu Dudau <Liviu.Dudau@arm.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Paul <seanpaul@chromium.org>,
 Thierry Reding <treding@nvidia.com>, Sean Paul <sean@poorly.run>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAxOSBKdWwgMjAxOSwgIktvZW5pZywgQ2hyaXN0aWFuIiA8Q2hyaXN0aWFuLktvZW5p
Z0BhbWQuY29tPiB3cm90ZToKPiBBbSAxOC4wNy4xOSB1bSAxODo0NiBzY2hyaWViIENocmlzIFdp
bHNvbjoKPj4gUXVvdGluZyBTYW0gUmF2bmJvcmcgKDIwMTktMDctMTggMTc6MTQ6NTgpCj4+PiBk
cm1fcHJpbnQuaCB1c2VkIERSTV9OQU1FIC0gdGh1cyBhZGRpbmcgYSBkZXBlbmRlbmN5IGZyb20K
Pj4+IGluY2x1ZGUvZHJtL2RybV9wcmludC5oID0+IHVhcGkvZHJtL2RybS5oCj4+Pgo+Pj4gSGFy
ZGNvZGUgdGhlIG5hbWUgImRybSIgdG8gYnJlYWsgdGhpcyBkZXBlbmRlbmN5Lgo+Pj4gVGhlIGlk
ZWEgaXMgdGhhdCB0aGVyZSBzaGFsbCBiZSBhIG1pbmltYWwgZGVwZW5kZW5jeQo+Pj4gYmV0d2Vl
biBpbmNsdWRlL2RybS8qIGFuZCB1YXBpLyoKPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBTYW0gUmF2
bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+Cj4+PiBTdWdnZXN0ZWQtYnk6IERhbmllbCBWZXR0ZXIg
PGRhbmllbEBmZndsbC5jaD4KPj4+IFJldmlld2VkLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwu
dmV0dGVyQGZmd2xsLmNoPgo+Pj4gQ2M6IE1hYXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmto
b3JzdEBsaW51eC5pbnRlbC5jb20+Cj4+PiBDYzogTWF4aW1lIFJpcGFyZCA8bWF4aW1lLnJpcGFy
ZEBib290bGluLmNvbT4KPj4+IENjOiBTZWFuIFBhdWwgPHNlYW5AcG9vcmx5LnJ1bj4KPj4+IENj
OiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+Cj4+PiBDYzogUm9iIENsYXJrIDxyb2Jk
Y2xhcmtAZ21haWwuY29tPgo+Pj4gQ2M6IFNlYW4gUGF1bCA8c2VhbnBhdWxAY2hyb21pdW0ub3Jn
Pgo+Pj4gQ2M6IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPgo+Pj4gQ2M6
IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KPj4+IC0tLQo+Pj4gICBpbmNsdWRlL2Ry
bS9kcm1fcHJpbnQuaCB8IDQgKy0tLQo+Pj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KyksIDMgZGVsZXRpb25zKC0pCj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2RybV9w
cmludC5oIGIvaW5jbHVkZS9kcm0vZHJtX3ByaW50LmgKPj4+IGluZGV4IGE1ZDZmMmYzZTQzMC4u
NzYwZDFiZDBlYWYxIDEwMDY0NAo+Pj4gLS0tIGEvaW5jbHVkZS9kcm0vZHJtX3ByaW50LmgKPj4+
ICsrKyBiL2luY2x1ZGUvZHJtL2RybV9wcmludC5oCj4+PiBAQCAtMzIsOCArMzIsNiBAQAo+Pj4g
ICAjaW5jbHVkZSA8bGludXgvZGV2aWNlLmg+Cj4+PiAgICNpbmNsdWRlIDxsaW51eC9kZWJ1Z2Zz
Lmg+Cj4+PiAgIAo+Pj4gLSNpbmNsdWRlIDxkcm0vZHJtLmg+Cj4+PiAtCj4+PiAgIC8qKgo+Pj4g
ICAgKiBET0M6IHByaW50Cj4+PiAgICAqCj4+PiBAQCAtMjg3LDcgKzI4NSw3IEBAIHZvaWQgZHJt
X2Vycihjb25zdCBjaGFyICpmb3JtYXQsIC4uLik7Cj4+PiAgIC8qIE1hY3JvcyB0byBtYWtlIHBy
aW50ayBlYXNpZXIgKi8KPj4+ICAgCj4+PiAgICNkZWZpbmUgX0RSTV9QUklOVEsob25jZSwgbGV2
ZWwsIGZtdCwgLi4uKSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+Pj4gLSAgICAgICBw
cmludGsjI29uY2UoS0VSTl8jI2xldmVsICJbIiBEUk1fTkFNRSAiXSAiIGZtdCwgIyNfX1ZBX0FS
R1NfXykKPj4+ICsgICAgICAgcHJpbnRrIyNvbmNlKEtFUk5fIyNsZXZlbCAiW2RybV0gIiBmbXQs
ICMjX19WQV9BUkdTX18pCj4+IEkgZ3Vlc3MgSSdtIHRoIG9ubHkgb25lIHdobwo+Pgo+PiAjdW5k
ZWYgRFJNX05BTUUKPj4gI2RlZmluZSBEUk1fTkFNRSBpOTE1Cj4+Cj4+IGp1c3Qgc28gdGhhdCBJ
IGRpZG4ndCBoYXZlIGluYW5lIGxvZ3M/Cj4+Cj4+IE9uZSBtaWdodCBzdWdnZXN0IHRoYXQgaW5z
dGVhZCBvZiBoYXJkY29kaW5nIGl0LCBmb2xsb3cgdGhlIHByX2ZtdCgpCj4+IHBhdHRlcm4gYW5k
IG9ubHkgYWRkICJbZHJtXSIgZm9yIHRoZSBkcm0gY29yZS4KPj4KPj4gRXZlbiB0aGVuIGl0IHNv
IHVzZWxlc3MgKHdoaWNoIGRybSBkcml2ZXIgaXMgdGhpcyBtZXNzYWdlIGZvcj8/PykgdGhhdCBJ
Cj4+IHdhbnQgdG8gcmVtb3ZlIHRoZW0gYWxsIDooCj4KPiBZZWFoLCBhZ3JlZS4gSSBtZWFuIGl0
IGlzIG5pY2UgaWYgdGhlIGNvcmUgZHJtIGZ1bmN0aW9ucyB1c2UgYSBwcmVmaXggCj4gZm9yIGRl
YnVnIG91dHB1dC4KPgo+IEJ1dCBJIGFjdHVhbGx5IGRvbid0IHNlZSB0aGUgcG9pbnQgZm9yIGlu
ZGl2aWR1YWwgZHJpdmVycy4KCldlIHNob3VsZCBhbGwgbWlncmF0ZSB0byB0aGUgdmVyc2lvbnMg
d2l0aCBkZXZpY2UuLi4KCkJSLApKYW5pLgoKCj4KPiBDaHJpc3RpYW4uCj4KPj4gLUNocmlzCj4K
PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKCi0t
IApKYW5pIE5pa3VsYSwgSW50ZWwgT3BlbiBTb3VyY2UgR3JhcGhpY3MgQ2VudGVyCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
