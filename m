Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8890F2FE8A1
	for <lists+dri-devel@lfdr.de>; Thu, 21 Jan 2021 12:22:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DBC16E419;
	Thu, 21 Jan 2021 11:22:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4E6D6E1D2;
 Thu, 21 Jan 2021 11:22:34 +0000 (UTC)
IronPort-SDR: RsRbTTg/CNHOy2qSRdhAghvr1eAvfaVrgy5CzyXKCwy28Cl7UUSZf4eIpRsnKj+pV8miEIAWfj
 KQ3euFaua6qQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9870"; a="240793545"
X-IronPort-AV: E=Sophos;i="5.79,363,1602572400"; d="scan'208";a="240793545"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2021 03:22:31 -0800
IronPort-SDR: EI/Nf0J8fuvXfUWeTyEbEkayuiif5i9QL+oZ3ExuNhOFL9fr0htQYfimjeYFcL6Jaau+1J0T3w
 m+DtMu4E/+Ng==
X-IronPort-AV: E=Sophos;i="5.79,363,1602572400"; d="scan'208";a="385262939"
Received: from cohrs-mobl.ger.corp.intel.com (HELO localhost) ([10.252.51.23])
 by orsmga008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2021 03:22:28 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Lyude Paul <lyude@redhat.com>, intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH] drm/msm/dp: fix build after dp quirk helper change
In-Reply-To: <92f48ffdfa30c3941e0fd22337217f0b10d75ec8.camel@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210120110708.32131-1-jani.nikula@intel.com>
 <92f48ffdfa30c3941e0fd22337217f0b10d75ec8.camel@redhat.com>
Date: Thu, 21 Jan 2021 13:22:24 +0200
Message-ID: <875z3qmt5b.fsf@intel.com>
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Sean Paul <sean@poorly.run>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAyMCBKYW4gMjAyMSwgTHl1ZGUgUGF1bCA8bHl1ZGVAcmVkaGF0LmNvbT4gd3JvdGU6
Cj4gUmV2aWV3ZWQtYnk6IEx5dWRlIFBhdWwgPGx5dWRlQHJlZGhhdC5jb20+CgpUaGFua3MgZm9y
IHRoZSByZXZpZXcuCgpTZWFuLCBSb2IsIG9yIGFueW9uZSB3aXRoIGFuIGFybSB0b29sY2hhaW4g
Zm9yIG1zbSBhdmFpbGFibGUsIGNvdWxkIEkKdHJvdWJsZSB5b3UgdG8gYnVpbGQgdGVzdCB0aGlz
IHBsZWFzZT8KCgpCUiwKSmFuaS4KCgo+Cj4gT24gV2VkLCAyMDIxLTAxLTIwIGF0IDEzOjA3ICsw
MjAwLCBKYW5pIE5pa3VsYSB3cm90ZToKPj4gQ29tbWl0IDdjNTUzZjhiNWE3ZCAoImRybS9kcDog
UmV2ZXJ0ICJkcm0vZHA6IEludHJvZHVjZSBFRElELWJhc2VkCj4+IHF1aXJrcyIiKSByZW1vdmVk
IGRybV9kcF9nZXRfZWRpZF9xdWlya3MoKSBhbmQgY2hhbmdlZCB0aGUgc2lnbmF0dXJlIG9mCj4+
IGRybV9kcF9oYXNfcXVpcmsoKSB3aGlsZSB0aGV5IHdlcmUgc3RpbGwgYmVpbmcgdXNlZCBpbiBt
c20uIEZpeCB0aGUKPj4gYnJlYWthZ2UuIEZ1bmN0aW9uYWxseSwgcmVtb3ZpbmcgdGhlIEVESUQt
YmFzZWQgcXVpcmtzIGhhcyBubyBpbXBhY3Qgb24KPj4gbXNtLgo+PiAKPj4gW1RoZSBhYm92ZSBj
b21taXQgd2FzIG1lcmdlZCB0byBkcm0taW50ZWwtbmV4dDsgbWFrZSB0d28gd3JvbmdzIGEgcmln
aHQKPj4gYnkgbWVyZ2luZyB0aGlzIGZpeCB0aHJvdWdoIGRybS1pbnRlbC1uZXh0IGFzIHdlbGwu
XQo+PiAKPj4gUmVwb3J0ZWQtYnk6IFN0ZXBoZW4gUm90aHdlbGwgPHNmckBjYW5iLmF1dWcub3Jn
LmF1Pgo+PiBSZWZlcmVuY2VzOgo+PiBodHRwOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyMTAxMjAx
MDU3MTUuNDM5MWRkOTVAY2FuYi5hdXVnLm9yZy5hdQo+PiBGaXhlczogN2M1NTNmOGI1YTdkICgi
ZHJtL2RwOiBSZXZlcnQgImRybS9kcDogSW50cm9kdWNlIEVESUQtYmFzZWQgcXVpcmtzIiIpCj4+
IENjOiBMeXVkZSBQYXVsIDxseXVkZUByZWRoYXQuY29tPgo+PiBBY2tlZC1ieTogRGFuaWVsIFZl
dHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KPj4gQ2M6IFJvYiBDbGFyayA8cm9iZGNsYXJr
QGdtYWlsLmNvbT4KPj4gQ2M6IFNlYW4gUGF1bCA8c2VhbkBwb29ybHkucnVuPgo+PiBDYzogZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+PiBTaWduZWQtb2ZmLWJ5OiBKYW5pIE5pa3Vs
YSA8amFuaS5uaWt1bGFAaW50ZWwuY29tPgo+PiAKPj4gLS0tCj4+IAo+PiBOb3RlOiBJIGFkbWl0
IHRvIG5vdCBldmVuIGJ1aWxkIHRlc3RpbmcgdGhpcyBvbmUuIEknZCBuZWVkIGEgY29uZmlnLAo+
PiBwb3NzaWJseSBhbHNvIGEgdG9vbGNoYWluIHNldHVwIGZvciB0aGF0Lgo+PiAtLS0KPj4gwqBk
cml2ZXJzL2dwdS9kcm0vbXNtL2RwL2RwX2N0cmwuYyB8IDYgKystLS0tCj4+IMKgMSBmaWxlIGNo
YW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPj4gCj4+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vbXNtL2RwL2RwX2N0cmwuYwo+PiBiL2RyaXZlcnMvZ3B1L2RybS9t
c20vZHAvZHBfY3RybC5jCj4+IGluZGV4IGUzNDYyZjVkOTZkNy4uMzZiMzljMzgxYjNmIDEwMDY0
NAo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2RwL2RwX2N0cmwuYwo+PiArKysgYi9kcml2
ZXJzL2dwdS9kcm0vbXNtL2RwL2RwX2N0cmwuYwo+PiBAQCAtMTQyMCwxNiArMTQyMCwxNCBAQCB2
b2lkIGRwX2N0cmxfaG9zdF9kZWluaXQoc3RydWN0IGRwX2N0cmwgKmRwX2N0cmwpCj4+IMKgc3Rh
dGljIGJvb2wgZHBfY3RybF91c2VfZml4ZWRfbnZpZChzdHJ1Y3QgZHBfY3RybF9wcml2YXRlICpj
dHJsKQo+PiDCoHsKPj4gwqDCoMKgwqDCoMKgwqDCoHU4ICpkcGNkID0gY3RybC0+cGFuZWwtPmRw
Y2Q7Cj4+IC3CoMKgwqDCoMKgwqDCoHUzMiBlZGlkX3F1aXJrcyA9IDA7Cj4+IMKgCj4+IC3CoMKg
wqDCoMKgwqDCoGVkaWRfcXVpcmtzID0gZHJtX2RwX2dldF9lZGlkX3F1aXJrcyhjdHJsLT5wYW5l
bC0+ZWRpZCk7Cj4+IMKgwqDCoMKgwqDCoMKgwqAvKgo+PiDCoMKgwqDCoMKgwqDCoMKgICogRm9y
IGJldHRlciBpbnRlcm9wIGV4cGVyaWVuY2UsIHVzZWQgYSBmaXhlZCBOVklEPTB4ODAwMAo+PiDC
oMKgwqDCoMKgwqDCoMKgICogd2hlbmV2ZXIgY29ubmVjdGVkIHRvIGEgVkdBIGRvbmdsZSBkb3du
c3RyZWFtLgo+PiDCoMKgwqDCoMKgwqDCoMKgICovCj4+IMKgwqDCoMKgwqDCoMKgwqBpZiAoZHJt
X2RwX2lzX2JyYW5jaChkcGNkKSkKPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJl
dHVybiAoZHJtX2RwX2hhc19xdWlyaygmY3RybC0+cGFuZWwtPmRlc2MsIGVkaWRfcXVpcmtzLAo+
PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqBEUF9EUENEX1FVSVJLX0NPTlNUQU5UX04pKTsKPj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoHJldHVybiAoZHJtX2RwX2hhc19xdWlyaygmY3RybC0+cGFuZWwtPmRlc2Ms
Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgRFBfRFBDRF9RVUlSS19DT05TVEFOVF9OKSk7Cj4+
IMKgCj4+IMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gZmFsc2U7Cj4+IMKgfQoKLS0gCkphbmkgTmlr
dWxhLCBJbnRlbCBPcGVuIFNvdXJjZSBHcmFwaGljcyBDZW50ZXIKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
