Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 29609FDE32
	for <lists+dri-devel@lfdr.de>; Fri, 15 Nov 2019 13:44:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E1066E5CA;
	Fri, 15 Nov 2019 12:44:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FBE06E5C1;
 Fri, 15 Nov 2019 12:44:15 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 15 Nov 2019 04:44:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,308,1569308400"; d="scan'208";a="257749774"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by FMSMGA003.fm.intel.com with SMTP; 15 Nov 2019 04:44:12 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 15 Nov 2019 14:44:11 +0200
Date: Fri, 15 Nov 2019 14:44:11 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [Intel-gfx] [PATCH 1/8] drm/fb: More paranoia in addfb checks
Message-ID: <20191115124411.GC1208@intel.com>
References: <20191115092120.4445-1-daniel.vetter@ffwll.ch>
 <20191115092120.4445-2-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191115092120.4445-2-daniel.vetter@ffwll.ch>
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Pekka Paalanen <pekka.paalanen@collabora.co.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBOb3YgMTUsIDIwMTkgYXQgMTA6MjE6MTNBTSArMDEwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiAtIE91ciBsaW1pdCBpcyB1aW50MzJfdCwgbWFrZSB0aGF0IGV4cGxpY2l0Lgo+IAo+
IC0gVW50YW5nbGUgdGhlIG9uZSBvdmVyZmxvdyBjaGVjaywgSSB0aGluayAoYnV0IG5vdCBzdXJl
KSB0aGF0IHdpdGgKPiAgIGFsbCB0aHJlZSB0b2dldGhlciB5b3UgY291bGQgb3ZlcmZsb3cgdGhl
IHVpbnQ2NF90IGFuZCBpdCdkIGxvb2sKPiAgIGNvb2wgYWdhaW4uCgpJdCBjYW4ndCBvdmVyZmxv
dy4gQWxsIHRoZXJlZSBpbnB1dHMgYXJlIHUzMiBzbyB0aGUgbWF4IHZhbHVlCnlvdSBjYW4gZ2V0
IGlzIDB4ZmZmZmZmZmYwMDAwMDAwMC4KCj4gSGVuY2UgdHdvIHN0ZXBzLiBBbHNvIGdvIHdpdGgg
dGhlIG1vcmUgY29tbW9uIChhbmQgaW1vCj4gICBzYWZlciBhcHByb2FjaCkgCgpBbHNvIHJlc3Vs
dHMgaW4gbXVsdGlwbGUgZGl2aXNpb25zIHdoaWNoIGlzIG5lZWRsZXNzbHkgZXhwZW5zaXZlLgpU
aGUgb3JpZ2luYWwgaXMganVzdCBtdWwrYWRkLgoKPiBvZiByZWR1Y2luZyB0aGUgcmFuZ2Ugd2Ug
YWNjZXB0LCBpbnN0ZWFkIG9mIHRyeWluZwo+ICAgdG8gY29tcHV0ZSB0aGUgb3ZlcmZsb3cgaW4g
aGlnaCBlbm91Z2ggcHJlY2lzaW9uLgo+IAo+IC0gVGhlIGFib3ZlIHdvdWxkIGJsb3cgdXAgaWYg
d2UgZ2V0IGEgMCBwaXRjaGVzLCBzbyBjaGVjayBmb3IgdGhhdAo+ICAgdG9vLCBidXQgb25seSBp
ZiBibG9ja19zaXplIGlzIGEgdGhpbmcuCj4gCj4gQ2M6IFBla2thIFBhYWxhbmVuIDxwZWtrYS5w
YWFsYW5lbkBjb2xsYWJvcmEuY28udWs+Cj4gU2lnbmVkLW9mZi1ieTogRGFuaWVsIFZldHRlciA8
ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fZnJh
bWVidWZmZXIuYyB8IDE3ICsrKysrKysrKysrLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAxMSBp
bnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vZHJtX2ZyYW1lYnVmZmVyLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2ZyYW1lYnVmZmVy
LmMKPiBpbmRleCA1NzU2NDMxOGNlZWEuLjMxNDFjNmVkNmRkMiAxMDA2NDQKPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0vZHJtX2ZyYW1lYnVmZmVyLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJt
X2ZyYW1lYnVmZmVyLmMKPiBAQCAtMjE0LDE1ICsyMTQsMjAgQEAgc3RhdGljIGludCBmcmFtZWJ1
ZmZlcl9jaGVjayhzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LAo+ICAJCQlyZXR1cm4gLUVJTlZBTDsK
PiAgCQl9Cj4gIAo+IC0JCWlmIChtaW5fcGl0Y2ggPiBVSU5UX01BWCkKPiArCQlpZiAobWluX3Bp
dGNoID4gVThfTUFYKQoKVTg/Cgo+ICAJCQlyZXR1cm4gLUVSQU5HRTsKPiAgCj4gLQkJaWYgKCh1
aW50NjRfdCkgaGVpZ2h0ICogci0+cGl0Y2hlc1tpXSArIHItPm9mZnNldHNbaV0gPiBVSU5UX01B
WCkKPiAtCQkJcmV0dXJuIC1FUkFOR0U7Cj4gKwkJaWYgKGJsb2NrX3NpemUpIHsKPiArCQkJaWYg
KHItPnBpdGNoZXNbaV0gPCBtaW5fcGl0Y2gpIHsKPiArCQkJCURSTV9ERUJVR19LTVMoImJhZCBw
aXRjaCAldSBmb3IgcGxhbmUgJWRcbiIsIHItPnBpdGNoZXNbaV0sIGkpOwo+ICsJCQkJcmV0dXJu
IC1FSU5WQUw7Cj4gKwkJCX0KPiAgCj4gLQkJaWYgKGJsb2NrX3NpemUgJiYgci0+cGl0Y2hlc1tp
XSA8IG1pbl9waXRjaCkgewo+IC0JCQlEUk1fREVCVUdfS01TKCJiYWQgcGl0Y2ggJXUgZm9yIHBs
YW5lICVkXG4iLCByLT5waXRjaGVzW2ldLCBpKTsKPiAtCQkJcmV0dXJuIC1FSU5WQUw7Cj4gKwkJ
CWlmIChoZWlnaHQgPiBVOF9NQVggLyByLT5waXRjaGVzW2ldKQo+ICsJCQkJcmV0dXJuIC1FUkFO
R0U7Cj4gKwo+ICsJCQlpZiAoci0+b2Zmc2V0c1tpXSA+IFU4X01BWCAvIHItPnBpdGNoZXNbaV0g
LSBoZWlnaHQpCj4gKwkJCQlyZXR1cm4gLUVSQU5HRTsKPiAgCQl9Cj4gIAo+ICAJCWlmIChyLT5t
b2RpZmllcltpXSAmJiAhKHItPmZsYWdzICYgRFJNX01PREVfRkJfTU9ESUZJRVJTKSkgewo+IC0t
IAo+IDIuMjQuMAo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCj4gSW50ZWwtZ2Z4IG1haWxpbmcgbGlzdAo+IEludGVsLWdmeEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2ludGVsLWdmeAoKLS0gClZpbGxlIFN5cmrDpGzDpApJbnRlbApfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
