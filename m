Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D1F193F8A
	for <lists+dri-devel@lfdr.de>; Thu, 26 Mar 2020 14:15:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75B9B6E138;
	Thu, 26 Mar 2020 13:15:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64E346E138;
 Thu, 26 Mar 2020 13:15:11 +0000 (UTC)
IronPort-SDR: p9MZQllKD6/juZwZlJws/lCtt03fD10aV4Y4DSIGqzw4zrE548XyTITniFIaOvveO1JmWr3drr
 w67oGeL6lw9g==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2020 06:15:10 -0700
IronPort-SDR: kg7vt9TlrsRc7W8H1noQoEiOLzQk1PuR0gZMvvSvp3tajfqmBIJfdhBAZTxpzqxheeRPtB/ufn
 h9mciL5WZ/0A==
X-IronPort-AV: E=Sophos;i="5.72,308,1580803200"; d="scan'208";a="420697207"
Received: from mschuste-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.252.32.130])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2020 06:15:07 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
Subject: Re: [Intel-gfx] [PATCH 02/51] drm/i915: Don't clear drvdata in
 ->release
In-Reply-To: <87o8ski9e1.fsf@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20200323144950.3018436-1-daniel.vetter@ffwll.ch>
 <20200323144950.3018436-3-daniel.vetter@ffwll.ch> <87o8ski9e1.fsf@intel.com>
Date: Thu, 26 Mar 2020 15:15:04 +0200
Message-ID: <87v9mrgsvb.fsf@intel.com>
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAyNSBNYXIgMjAyMCwgSmFuaSBOaWt1bGEgPGphbmkubmlrdWxhQGxpbnV4LmludGVs
LmNvbT4gd3JvdGU6Cj4gT24gTW9uLCAyMyBNYXIgMjAyMCwgRGFuaWVsIFZldHRlciA8ZGFuaWVs
LnZldHRlckBmZndsbC5jaD4gd3JvdGU6Cj4+IEZvciB0d28gcmVhc29uczoKPj4KPj4gLSBUaGUg
ZHJpdmVyIGNvcmUgY2xlYXJzIHRoaXMgYWxyZWFkeSBmb3IgdXMgYWZ0ZXIgd2UncmUgdW5sb2Fk
ZWQgaW4KPj4gICBfX2RldmljZV9yZWxlYXNlX2RyaXZlcigpLgo+Pgo+PiAtIEl0J3Mgd2F5IHRv
byBsYXRlLCB0aGUgZHJtX2RldmljZSAtPnJlbGVhc2UgY2FsbGJhY2sgbWlnaHQgbWFzc2l2ZWx5
Cj4+ICAgb3V0bGl2ZSB0aGUgdW5kZXJseWluZyBwaHlzaWNhbCBkZXZpY2UsIHNpbmNlIGEgZHJt
X2RldmljZSBjYW4ndCBiZQo+Cj4gKmNhbiBiZSo/Cj4KPj4gICBrZXB0IGFsaXZlIGJ5IG9wZW4g
ZHJtX2ZpbGUgb3Igd2VsbCByZWFsbHkgYW55dGhpbmcgZWxzZSB1c2Vyc3BhY2UKPj4gICBpcyBz
dGlsbCBoYW5naW5nIG9udG8uIFNvIGlmIHdlIGNsZWFyIHRoaXMgb3Vyc2VsdmVzLCB3ZSBzaG91
bGQKPj4gICBjbGVhciBpdCBpbiB0aGUgcGNpIC0+cmVtb3ZlIGNhbGxiYWNrLCBub3QgaW4gdGhl
IGRybV9kZXZpY2UKPj4gICAtPnJlbGFzZSBjYWxsYmFjay4KPgo+IC0+cmVsZWFzZQo+Cj4gUmV2
aWV3ZWQtYnk6IEphbmkgTmlrdWxhIDxqYW5pLm5pa3VsYUBpbnRlbC5jb20+CgpPb3BzLAoKZHJp
dmVycy9ncHUvZHJtL2k5MTUvaTkxNV9kcnYuYzogSW4gZnVuY3Rpb24g4oCYaTkxNV9kcml2ZXJf
ZGVzdHJveeKAmToKZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9kcnYuYzo5MTE6MTg6IGVycm9y
OiB1bnVzZWQgdmFyaWFibGUg4oCYcGRlduKAmSBbLVdlcnJvcj11bnVzZWQtdmFyaWFibGVdCiAg
c3RydWN0IHBjaV9kZXYgKnBkZXYgPSBpOTE1LT5kcm0ucGRldjsKICAgICAgICAgICAgICAgICAg
Xn5+fgoKCgo+Cj4+Cj4+IExvb2tpbmcgYXQgZ2l0IGhpc3RvcnkgdGhpcyB3YXMgZml4ZWQgaW4g
dGhlIGRyaXZlciBjb3JlIHdpdGgKPj4KPj4gY29tbWl0IDA5OThkMDYzMTAwMTI4OGE1OTc0YWZj
MGIyYTVmNTY4YmNkZWNiNGQKPj4gQXV0aG9yOiBIYW5zIGRlIEdvZWRlIDxoZGVnb2VkZUByZWRo
YXQuY29tPgo+PiBEYXRlOiAgIFdlZCBNYXkgMjMgMDA6MDk6MzQgMjAxMiArMDIwMAo+Pgo+PiAg
ICAgZGV2aWNlLWNvcmU6IEVuc3VyZSBkcnZkYXRhID0gTlVMTCB3aGVuIG5vIGRyaXZlciBpcyBi
b3VuZAo+Pgo+PiB2MjogQ2l0ZSB0aGUgY29yZSBmaXggaW4gdGhlIGNvbW1pdCBtZXNzYWdlIChD
aHJpcykuCj4+Cj4+IENjOiBHcmVnIEtyb2FoLUhhcnRtYW4gPGdyZWdraEBsaW51eGZvdW5kYXRp
b24ub3JnPgo+PiBDYzogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+Cj4+
IFNpZ25lZC1vZmYtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAaW50ZWwuY29tPgo+
PiAtLS0KPj4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfZHJ2LmMgfCAzIC0tLQo+PiAgMSBm
aWxlIGNoYW5nZWQsIDMgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vaTkxNS9pOTE1X2Rydi5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9kcnYuYwo+
PiBpbmRleCA0OGJhMzdlMzViZWEuLjQ3OTIwNTFlOWUyZSAxMDA2NDQKPj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2k5MTUvaTkxNV9kcnYuYwo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9p
OTE1X2Rydi5jCj4+IEBAIC05MDksOSArOTA5LDYgQEAgc3RhdGljIHZvaWQgaTkxNV9kcml2ZXJf
ZGVzdHJveShzdHJ1Y3QgZHJtX2k5MTVfcHJpdmF0ZSAqaTkxNSkKPj4gIAo+PiAgCWRybV9kZXZf
ZmluaSgmaTkxNS0+ZHJtKTsKPj4gIAlrZnJlZShpOTE1KTsKPj4gLQo+PiAtCS8qIEFuZCBtYWtl
IHN1cmUgd2UgbmV2ZXIgY2hhc2Ugb3VyIGRhbmdsaW5nIHBvaW50ZXIgZnJvbSBwY2lfZGV2ICov
Cj4+IC0JcGNpX3NldF9kcnZkYXRhKHBkZXYsIE5VTEwpOwo+PiAgfQo+PiAgCj4+ICAvKioKCi0t
IApKYW5pIE5pa3VsYSwgSW50ZWwgT3BlbiBTb3VyY2UgR3JhcGhpY3MgQ2VudGVyCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
