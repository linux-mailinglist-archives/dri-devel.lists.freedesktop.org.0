Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00674F3398
	for <lists+dri-devel@lfdr.de>; Thu,  7 Nov 2019 16:42:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C597F6F725;
	Thu,  7 Nov 2019 15:42:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F5AF6F722
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Nov 2019 15:42:15 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 Nov 2019 07:42:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,278,1569308400"; d="scan'208";a="201426943"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga007.fm.intel.com with SMTP; 07 Nov 2019 07:42:10 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 07 Nov 2019 17:42:09 +0200
Date: Thu, 7 Nov 2019 17:42:09 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: allen <allen.chen@ite.com.tw>
Subject: Re: [PATCH] drm/edid: fixup EDID 1.3 and 1.4 judge reduced-blanking
 timings logic
Message-ID: <20191107154209.GC1208@intel.com>
References: <1572856969-12115-1-git-send-email-allen.chen@ite.com.tw>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1572856969-12115-1-git-send-email-allen.chen@ite.com.tw>
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
Cc: Jau-Chih Tseng <Jau-Chih.Tseng@ite.com.tw>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, Pi-Hsun Shih <pihsun@chromium.org>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBOb3YgMDQsIDIwMTkgYXQgMDQ6NDI6NDlQTSArMDgwMCwgYWxsZW4gd3JvdGU6Cj4g
QWNjb3JkaW5nIHRvIFZFU0EgRU5IQU5DRUQgRVhURU5ERUQgRElTUExBWSBJREVOVElGSUNBVElP
TiBEQVRBIFNUQU5EQVJECj4gKERlZmluZXMgRURJRCBTdHJ1Y3R1cmUgVmVyc2lvbiAxLCBSZXZp
c2lvbiA0KSBwYWdlOiAzOQo+IEhvdyB0byBkZXRlcm1pbmUgd2hldGhlciB0aGUgbW9uaXRvciBz
dXBwb3J0IFJCIHRpbWluZyBvciBub3Q/Cj4gRURJRCAxLjQKPiBGaXJzdDogIHJlYWQgZGV0YWls
ZWQgdGltaW5nIGRlc2NyaXB0b3IgYW5kIG1ha2Ugc3VyZSBieXRlMCA9IDAsCj4gCWJ5dGUxID0g
MCwgYnl0ZTIgPSAwIGFuZCBieXRlMyA9IDB4RkQKClRoYXQgc2hvdWxkIHByb2JhYmx5IGJlIHNv
bWUgbmV3IGZ1bmN0aW9uOgpib29sIGlzX2Rpc3BsYXlfZGVzY3JpcHRvcihjb25zdCB1OCAqZGVz
YywgdTggdGFnKTsKaXNfZGlzcGxheV9kZXNjcmlwdG9yKEVESURfREVUQUlMX01PTklUT1JfUkFO
R0UpCm9yIHNvbWV0aGluZyBhbG9uZyB0aG9zZSBsaW5lcwoKV2UgZG9uJ3Qgc2VlbSB0byBjaGVj
ayB0aGF0IGluIG1vc3QgcGxhY2VzIHNvIHNob3VsZCBiZSByb2xsZWQgb3V0IGFsbApvdmVyLiBU
aGUgdXNhZ2Ugb2Ygc3RydWN0IGRldGFpbGVkX3RpbWluZyBhbGwgb3ZlciBhbHNvIG1ha2VzIGV2
ZXJ5dGhpbmcKcmF0aGVyIGNvbmZ1c2luZy4KCj4gU2Vjb25kOiByZWFkIGRldGFpbGVkIHRpbWlu
ZyBkZXNjcmlwdG9yIGJ5dGUxMCA9IDB4MDQgYW5kCj4gCUVESUQgYnl0ZTE4aCBiaXQwID0gMQoK
SW5kaWNhdGVzIENWVCBzdXBwb3J0LiBTaG91bGQgZ2l2ZSB0aGVzZSB0aGluZ3MgcmVhbCBuYW1l
cyBzbwpvbmUgd291bGRuJ3QgaGF2ZSB0byBkZWNvZGUgYnkgaGFuZC4KCj4gVGhpcmQ6ICBpZiBF
RElEIGJ5dGUxOGggYml0MCA9PSAxICYmIGJ5dGUxMCA9PSAweDA0LAo+IAl0aGVuIHdlIGNhbiBj
aGVjayBieXRlMTUsIGlmIGJ5dGUxNSBiaXQ0ID0xIGlzIHN1cHBvcnQgUkIKPiAgICAgICAgIGlm
IEVESUQgYnl0ZTE4aCBiaXQwICE9IDEgfHwgYnl0ZTEwICE9IDB4MDQsCj4gCXRoZW4gYnl0ZTE1
IGNhbiBub3QgYmUgdXNlZAo+IAo+IFRoZSBsaW51eCBjb2RlIGlzX3JiIGZ1bmN0aW9uIG5vdCBm
b2xsb3cgdGhlIFZFU0EncyBydWxlCj4gCj4gRURJRCAxLjMKPiBMQ0TigIJmbGF04oCCcGFuZWxz
IGRv4oCCbm904oCCcmVxdWlyZeKAgmxvbmfigIJibGFua2luZ+KAgmludGVydmFsc+KAgmFz4oCC
YeKAgnJldHJhY2UKPiBwZXJpb2Qgc28gZGVmYXVsdCBzdXBwb3J0IHJlZHVjZWQtYmxhbmtpbmcg
dGltaW5ncy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbGxlbiBDaGVuIDxhbGxlbi5jaGVuQGl0ZS5j
b20udHc+Cj4gUmVwb3J0ZWQtYnk6IGtidWlsZCB0ZXN0IHJvYm90IDxsa3BAaW50ZWwuY29tPgo+
IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX2VkaWQuYyB8IDI4ICsrKysrKysrKysrKysrKysr
KysrKy0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDIxIGluc2VydGlvbnMoKyksIDcgZGVsZXRp
b25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZWRpZC5jIGIvZHJp
dmVycy9ncHUvZHJtL2RybV9lZGlkLmMKPiBpbmRleCBlNWU3ZTY1Li45YjY3YjgwIDEwMDY0NAo+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZWRpZC5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L2RybV9lZGlkLmMKPiBAQCAtOTMsNiArOTMsMTEgQEAgc3RydWN0IGRldGFpbGVkX21vZGVfY2xv
c3VyZSB7Cj4gIAlpbnQgbW9kZXM7Cj4gIH07Cj4gIAo+ICtzdHJ1Y3QgZWRpZF9zdXBwb3J0X3Ji
X2Nsb3N1cmUgewo+ICsJc3RydWN0IGVkaWQgKmVkaWQ7Cj4gKwlzOCBzdXBwb3J0X3JiOwoKYm9v
bAoKPiArfTsKPiArCj4gICNkZWZpbmUgTEVWRUxfRE1UCTAKPiAgI2RlZmluZSBMRVZFTF9HVEYJ
MQo+ICAjZGVmaW5lIExFVkVMX0dURjIJMgo+IEBAIC0yMDE4LDIyICsyMDIzLDMxIEBAIHN0cnVj
dCBkcm1fZGlzcGxheV9tb2RlICpkcm1fbW9kZV9maW5kX2RtdChzdHJ1Y3QgZHJtX2RldmljZSAq
ZGV2LAo+ICBpc19yYihzdHJ1Y3QgZGV0YWlsZWRfdGltaW5nICp0LCB2b2lkICpkYXRhKQo+ICB7
Cj4gIAl1OCAqciA9ICh1OCAqKXQ7Cj4gLQlpZiAoclszXSA9PSBFRElEX0RFVEFJTF9NT05JVE9S
X1JBTkdFKQo+IC0JCWlmIChyWzE1XSAmIDB4MTApCj4gLQkJCSooYm9vbCAqKWRhdGEgPSB0cnVl
Owo+ICsJc3RydWN0IGVkaWRfc3VwcG9ydF9yYl9jbG9zdXJlICpjbG9zdXJlID0gZGF0YTsKPiAr
CXN0cnVjdCBlZGlkICplZGlkID0gY2xvc3VyZS0+ZWRpZDsKPiArCj4gKwlpZiAoIXJbMF0gJiYg
IXJbMV0gJiYgIXJbMl0gJiYgclszXSA9PSBFRElEX0RFVEFJTF9NT05JVE9SX1JBTkdFKSB7Cj4g
KwkJaWYgKGVkaWQtPmZlYXR1cmVzICYgQklUKDApICYmIHJbMTBdID09IEJJVCgyKSkKPiArCQkJ
Y2xvc3VyZS0+c3VwcG9ydF9yYiA9IChyWzE1XSAmIDB4MTApID8gMSA6IDA7CgpXaXRoIHRoZSBi
b29sIHRoZSB0ZXJuYXJ5IG9wZXJhdG9yIGlzIG5vdCBuZWVkZWQuIEFsc28gc2hvdWxkIG1heWJl
IApiZSB8PSBpbiBjYXNlIHdlIGhhdmUgbXVsdGlwbGUgcmFuZ2UgZGVzY3JpcHRvcnM/IE5vdCBz
dXJlIHRoYXQgaXMKbGVnYWwuCgo+ICsJfQo+ICB9Cj4gIAo+ICAvKiBFRElEIDEuNCBkZWZpbmVz
IHRoaXMgZXhwbGljaXRseS4gIEZvciBFRElEIDEuMywgd2UgZ3Vlc3MsIGJhZGx5LiAqLwo+ICBz
dGF0aWMgYm9vbAo+ICBkcm1fbW9uaXRvcl9zdXBwb3J0c19yYihzdHJ1Y3QgZWRpZCAqZWRpZCkK
PiAgewo+ICsJc3RydWN0IGVkaWRfc3VwcG9ydF9yYl9jbG9zdXJlIGNsb3N1cmUgPSB7Cj4gKwkJ
LmVkaWQgPSBlZGlkLAo+ICsJCS5zdXBwb3J0X3JiID0gLTEsCj4gKwl9Owo+ICsKPiAgCWlmIChl
ZGlkLT5yZXZpc2lvbiA+PSA0KSB7Cj4gLQkJYm9vbCByZXQgPSBmYWxzZTsKPiAtCQlkcm1fZm9y
X2VhY2hfZGV0YWlsZWRfYmxvY2soKHU4ICopZWRpZCwgaXNfcmIsICZyZXQpOwo+IC0JCXJldHVy
biByZXQ7Cj4gKwkJZHJtX2Zvcl9lYWNoX2RldGFpbGVkX2Jsb2NrKCh1OCAqKWVkaWQsIGlzX3Ji
LCAmY2xvc3VyZSk7Cj4gKwkJaWYgKGNsb3N1cmUuc3VwcG9ydF9yYiA+PSAwKQo+ICsJCQlyZXR1
cm4gY2xvc3VyZS5zdXBwb3J0X3JiOwo+ICAJfQo+ICAKPiAtCXJldHVybiAoKGVkaWQtPmlucHV0
ICYgRFJNX0VESURfSU5QVVRfRElHSVRBTCkgIT0gMCk7Cj4gKwlyZXR1cm4gdHJ1ZTsKCldoeSBh
cmUgd2Ugbm93IGFzc3VtaW5nIHJiIGZvciBhbGwgcHJlIDEuNCBFRElEcz8KCj4gIH0KPiAgCj4g
IHN0YXRpYyB2b2lkCj4gLS0gCj4gMS45LjEKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwo+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiBkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKCi0tIApWaWxsZSBTeXJqw6Rsw6QKSW50ZWwKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
