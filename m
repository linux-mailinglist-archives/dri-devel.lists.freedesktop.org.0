Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBA67DCE86
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2019 20:45:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0D286E15D;
	Fri, 18 Oct 2019 18:45:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DD546E15D
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2019 18:45:34 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Oct 2019 11:45:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,312,1566889200"; d="scan'208";a="195542716"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga008.fm.intel.com with SMTP; 18 Oct 2019 11:45:30 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 18 Oct 2019 21:45:30 +0300
Date: Fri, 18 Oct 2019 21:45:30 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: "Ben Dooks (Codethink)" <ben.dooks@codethink.co.uk>
Subject: Re: [PATCH] drm: include <drm/drm_cache.h> for 'drm_need_swiotlb'
Message-ID: <20191018184530.GF1208@intel.com>
References: <20191017110846.21769-1-ben.dooks@codethink.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191017110846.21769-1-ben.dooks@codethink.co.uk>
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
Cc: linux-kernel@lists.codethink.co.uk, David Airlie <airlied@linux.ie>,
 Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBPY3QgMTcsIDIwMTkgYXQgMTI6MDg6NDZQTSArMDEwMCwgQmVuIERvb2tzIChDb2Rl
dGhpbmspIHdyb3RlOgo+IFRoZSBkcm1fbmVlZF9zd2lvdGxiIGlzIGRlY2xhcmVkIGluIDxkcm0v
ZHJtX2NhY2hlLmg+Cj4gd2hpY2ggc2hvdWxkIGJlIGluY2x1ZGVkIGluIGRyaXZlcnMvZ3B1L2Ry
bS9kcm1fbWVtb3J5LmMKPiB0byBzaWxlbmNlIHRoZSBmb2xsb3dpbmcgd2FybmluZzoKPiAKPiBk
cml2ZXJzL2dwdS9kcm0vZHJtX21lbW9yeS5jOjE1OTo2OiB3YXJuaW5nOiBzeW1ib2wgJ2RybV9u
ZWVkX3N3aW90bGInIHdhcyBub3QgZGVjbGFyZWQuIFNob3VsZCBpdCBiZSBzdGF0aWM/CgpJSVJD
IEkgc2lsZW5jZWQgdGhhdCBhbHJlYWR5LCBzbyB5b3UncmUgcHJvYmFibHkgd29ya2luZyBvbgpz
b21lIG9sZCB0cmVlLiBGb3IgdGhlIGxhdGVzdCBzdHVmZiB1c2U6CgpnaXQ6Ly9hbm9uZ2l0LmZy
ZWVkZXNrdG9wLm9yZy9kcm0tdGlwIGRybS10aXAKCj4gCj4gU2lnbmVkLW9mZi1ieTogQmVuIERv
b2tzIDxiZW4uZG9va3NAY29kZXRoaW5rLmNvLnVrPgo+IC0tLQo+IENjOiBNYWFydGVuIExhbmto
b3JzdCA8bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPgo+IENjOiBNYXhpbWUgUmlw
YXJkIDxtcmlwYXJkQGtlcm5lbC5vcmc+Cj4gQ2M6IFNlYW4gUGF1bCA8c2VhbkBwb29ybHkucnVu
Pgo+IENjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+Cj4gQ2M6IERhbmllbCBWZXR0
ZXIgPGRhbmllbEBmZndsbC5jaD4KPiBDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
Zwo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX21lbW9yeS5jIHwgMSArCj4gIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
ZHJtX21lbW9yeS5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9tZW1vcnkuYwo+IGluZGV4IDBiZWM2
ZGJiMDE0Mi4uMmQ4NjE1YmFlYWRjIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1f
bWVtb3J5LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX21lbW9yeS5jCj4gQEAgLTQxLDYg
KzQxLDcgQEAKPiAgCj4gICNpbmNsdWRlIDxkcm0vZHJtX2FncHN1cHBvcnQuaD4KPiAgI2luY2x1
ZGUgPGRybS9kcm1fZGV2aWNlLmg+Cj4gKyNpbmNsdWRlIDxkcm0vZHJtX2NhY2hlLmg+Cj4gIAo+
ICAjaW5jbHVkZSAiZHJtX2xlZ2FjeS5oIgo+ICAKPiAtLSAKPiAyLjIzLjAKPiAKPiBfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKCi0tIApWaWxsZSBT
eXJqw6Rsw6QKSW50ZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
