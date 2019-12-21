Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 86BE61288F9
	for <lists+dri-devel@lfdr.de>; Sat, 21 Dec 2019 13:06:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15BCA6E455;
	Sat, 21 Dec 2019 12:06:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1213E6E455;
 Sat, 21 Dec 2019 12:06:19 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 Dec 2019 04:06:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,338,1571727600"; d="scan'208";a="219065226"
Received: from ideak-desk.fi.intel.com ([10.237.72.183])
 by orsmga003.jf.intel.com with ESMTP; 21 Dec 2019 04:06:16 -0800
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 05/10] drm/framebuffer: Format modifier for Intel Gen-12
 render compression
Date: Sat, 21 Dec 2019 14:05:38 +0200
Message-Id: <20191221120543.22816-6-imre.deak@intel.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20191221120543.22816-1-imre.deak@intel.com>
References: <20191221120543.22816-1-imre.deak@intel.com>
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
Cc: Nanley G Chery <nanley.g.chery@intel.com>,
 Mika Kahola <mika.kahola@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, dri-devel@lists.freedesktop.org,
 Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>,
 Jason Ekstrand <jason@jlekstrand.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogRGhpbmFrYXJhbiBQYW5kaXlhbiA8ZGhpbmFrYXJhbi5wYW5kaXlhbkBpbnRlbC5jb20+
CgpHZW4tMTIgaGFzIGEgbmV3IGNvbXByZXNzaW9uIGZvcm1hdCwgYWRkIGEgbmV3IG1vZGlmaWVy
IHRvIGluZGljYXRlIHRoYXQuCgpDYzogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxp
bnV4LmludGVsLmNvbT4KQ2M6IE1hdHQgUm9wZXIgPG1hdHRoZXcuZC5yb3BlckBpbnRlbC5jb20+
CkNjOiBOYW5sZXkgRyBDaGVyeSA8bmFubGV5LmcuY2hlcnlAaW50ZWwuY29tPgpDYzogSmFzb24g
RWtzdHJhbmQgPGphc29uQGpsZWtzdHJhbmQubmV0PgpDYzogTWlrYSBLYWhvbGEgPG1pa2Eua2Fo
b2xhQGludGVsLmNvbT4KQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKU2lnbmVk
LW9mZi1ieTogRGhpbmFrYXJhbiBQYW5kaXlhbiA8ZGhpbmFrYXJhbi5wYW5kaXlhbkBpbnRlbC5j
b20+ClNpZ25lZC1vZmYtYnk6IEx1Y2FzIERlIE1hcmNoaSA8bHVjYXMuZGVtYXJjaGlAaW50ZWwu
Y29tPgpTaWduZWQtb2ZmLWJ5OiBJbXJlIERlYWsgPGltcmUuZGVha0BpbnRlbC5jb20+ClJldmll
d2VkLWJ5OiBNaWthIEthaG9sYSA8bWlrYS5rYWhvbGFAaW50ZWwuY29tPgotLS0KIGluY2x1ZGUv
dWFwaS9kcm0vZHJtX2ZvdXJjYy5oIHwgMTEgKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAx
MSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvaW5jbHVkZS91YXBpL2RybS9kcm1fZm91cmNj
LmggYi9pbmNsdWRlL3VhcGkvZHJtL2RybV9mb3VyY2MuaAppbmRleCA4Y2FhYWY3ZmY5MWIuLjVi
YTQ4MWY0OTkzMSAxMDA2NDQKLS0tIGEvaW5jbHVkZS91YXBpL2RybS9kcm1fZm91cmNjLmgKKysr
IGIvaW5jbHVkZS91YXBpL2RybS9kcm1fZm91cmNjLmgKQEAgLTQxMCw2ICs0MTAsMTcgQEAgZXh0
ZXJuICJDIiB7CiAjZGVmaW5lIEk5MTVfRk9STUFUX01PRF9ZX1RJTEVEX0NDUwlmb3VyY2NfbW9k
X2NvZGUoSU5URUwsIDQpCiAjZGVmaW5lIEk5MTVfRk9STUFUX01PRF9ZZl9USUxFRF9DQ1MJZm91
cmNjX21vZF9jb2RlKElOVEVMLCA1KQogCisvKgorICogSW50ZWwgY29sb3IgY29udHJvbCBzdXJm
YWNlcyAoQ0NTKSBmb3IgR2VuLTEyIHJlbmRlciBjb21wcmVzc2lvbi4KKyAqCisgKiBUaGUgbWFp
biBzdXJmYWNlIGlzIFktdGlsZWQgYW5kIGF0IHBsYW5lIGluZGV4IDAsIHRoZSBDQ1MgaXMgbGlu
ZWFyIGFuZAorICogYXQgaW5kZXggMS4gQSA2NEIgQ0NTIGNhY2hlIGxpbmUgY29ycmVzcG9uZHMg
dG8gYW4gYXJlYSBvZiA0eDEgdGlsZXMgaW4KKyAqIG1haW4gc3VyZmFjZS4gSW4gb3RoZXIgd29y
ZHMsIDQgYml0cyBpbiBDQ1MgbWFwIHRvIGEgbWFpbiBzdXJmYWNlIGNhY2hlCisgKiBsaW5lIHBh
aXIuIFRoZSBtYWluIHN1cmZhY2UgcGl0Y2ggaXMgcmVxdWlyZWQgdG8gYmUgYSBtdWx0aXBsZSBv
ZiBmb3VyCisgKiBZLXRpbGUgd2lkdGhzLgorICovCisjZGVmaW5lIEk5MTVfRk9STUFUX01PRF9Z
X1RJTEVEX0dFTjEyX1JDX0NDUyBmb3VyY2NfbW9kX2NvZGUoSU5URUwsIDYpCisKIC8qCiAgKiBU
aWxlZCwgTlYxMk1ULCBncm91cGVkIGluIDY0IChwaXhlbHMpIHggMzIgKGxpbmVzKSAtc2l6ZWQg
bWFjcm9ibG9ja3MKICAqCi0tIAoyLjIyLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbAo=
