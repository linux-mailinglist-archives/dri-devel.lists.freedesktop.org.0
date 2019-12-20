Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6F3D12799C
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2019 11:50:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6748289D79;
	Fri, 20 Dec 2019 10:50:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD63D89D56;
 Fri, 20 Dec 2019 10:50:04 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Dec 2019 02:50:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,335,1571727600"; d="scan'208";a="218778034"
Received: from ideak-desk.fi.intel.com ([10.237.72.183])
 by orsmga003.jf.intel.com with ESMTP; 20 Dec 2019 02:50:02 -0800
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 11/15] drm/framebuffer: Format modifier for Intel Gen-12 media
 compression
Date: Fri, 20 Dec 2019 12:49:28 +0200
Message-Id: <20191220104931.12135-4-imre.deak@intel.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20191218161105.30638-12-imre.deak@intel.com>
References: <20191218161105.30638-12-imre.deak@intel.com>
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
 Lucas De Marchi <lucas.demarchi@intel.com>, dri-devel@lists.freedesktop.org,
 Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>,
 Mika Kahola <mika.kahola@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogRGhpbmFrYXJhbiBQYW5kaXlhbiA8ZGhpbmFrYXJhbi5wYW5kaXlhbkBpbnRlbC5jb20+
CgpHZW4tMTIgZGlzcGxheSBjYW4gZGVjb21wcmVzcyBzdXJmYWNlcyBjb21wcmVzc2VkIGJ5IHRo
ZSBtZWRpYSBlbmdpbmUsIGFkZAphIG5ldyBtb2RpZmllciBhcyB0aGUgZHJpdmVyIG5lZWRzIHRv
IGtub3cgdGhlIHN1cmZhY2Ugd2FzIGNvbXByZXNzZWQgYnkKdGhlIG1lZGlhIG9yIHJlbmRlciBl
bmdpbmUuCgp2MjogVXBkYXRlIGNvZGUgY29tbWVudCBkZXNjcmliaW5nIHRoZSBjb2xvciBwbGFu
ZSBvcmRlciBmb3IgWVVWCiAgICBzZW1pcGxhbmFyIGZvcm1hdHMuCgpDYzogTmFubGV5IEcgQ2hl
cnkgPG5hbmxleS5nLmNoZXJ5QGludGVsLmNvbT4KQ2M6IE1hdHQgUm9wZXIgPG1hdHRoZXcuZC5y
b3BlckBpbnRlbC5jb20+CkNjOiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXgu
aW50ZWwuY29tPgpDYzogTWlrYSBLYWhvbGEgPG1pa2Eua2Fob2xhQGludGVsLmNvbT4KQ2M6IGRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKU2lnbmVkLW9mZi1ieTogRGhpbmFrYXJhbiBQ
YW5kaXlhbiA8ZGhpbmFrYXJhbi5wYW5kaXlhbkBpbnRlbC5jb20+ClNpZ25lZC1vZmYtYnk6IEx1
Y2FzIERlIE1hcmNoaSA8bHVjYXMuZGVtYXJjaGlAaW50ZWwuY29tPgpTaWduZWQtb2ZmLWJ5OiBJ
bXJlIERlYWsgPGltcmUuZGVha0BpbnRlbC5jb20+ClJldmlld2VkLWJ5OiBNaWthIEthaG9sYSA8
bWlrYS5rYWhvbGFAaW50ZWwuY29tPgotLS0KIGluY2x1ZGUvdWFwaS9kcm0vZHJtX2ZvdXJjYy5o
IHwgMTMgKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKykKCmRp
ZmYgLS1naXQgYS9pbmNsdWRlL3VhcGkvZHJtL2RybV9mb3VyY2MuaCBiL2luY2x1ZGUvdWFwaS9k
cm0vZHJtX2ZvdXJjYy5oCmluZGV4IDViYTQ4MWY0OTkzMS4uOGJjMGIzMTU5N2Q4IDEwMDY0NAot
LS0gYS9pbmNsdWRlL3VhcGkvZHJtL2RybV9mb3VyY2MuaAorKysgYi9pbmNsdWRlL3VhcGkvZHJt
L2RybV9mb3VyY2MuaApAQCAtNDIxLDYgKzQyMSwxOSBAQCBleHRlcm4gIkMiIHsKICAqLwogI2Rl
ZmluZSBJOTE1X0ZPUk1BVF9NT0RfWV9USUxFRF9HRU4xMl9SQ19DQ1MgZm91cmNjX21vZF9jb2Rl
KElOVEVMLCA2KQogCisvKgorICogSW50ZWwgY29sb3IgY29udHJvbCBzdXJmYWNlcyAoQ0NTKSBm
b3IgR2VuLTEyIG1lZGlhIGNvbXByZXNzaW9uCisgKgorICogVGhlIG1haW4gc3VyZmFjZSBpcyBZ
LXRpbGVkIGFuZCBhdCBwbGFuZSBpbmRleCAwLCB0aGUgQ0NTIGlzIGxpbmVhciBhbmQKKyAqIGF0
IGluZGV4IDEuIEEgNjRCIENDUyBjYWNoZSBsaW5lIGNvcnJlc3BvbmRzIHRvIGFuIGFyZWEgb2Yg
NHgxIHRpbGVzIGluCisgKiBtYWluIHN1cmZhY2UuIEluIG90aGVyIHdvcmRzLCA0IGJpdHMgaW4g
Q0NTIG1hcCB0byBhIG1haW4gc3VyZmFjZSBjYWNoZQorICogbGluZSBwYWlyLiBUaGUgbWFpbiBz
dXJmYWNlIHBpdGNoIGlzIHJlcXVpcmVkIHRvIGJlIGEgbXVsdGlwbGUgb2YgZm91cgorICogWS10
aWxlIHdpZHRocy4gRm9yIHNlbWktcGxhbmFyIGZvcm1hdHMgbGlrZSBOVjEyLCBDQ1MgcGxhbmVz
IGZvbGxvdyB0aGUKKyAqIFkgYW5kIFVWIHBsYW5lcyBpLmUuLCBwbGFuZXMgMCBhbmQgMSBhcmUg
dXNlZCBmb3IgWSBhbmQgVVYgc3VyZmFjZXMsCisgKiBwbGFuZXMgMiBhbmQgMyBmb3IgdGhlIHJl
c3BlY3RpdmUgQ0NTLgorICovCisjZGVmaW5lIEk5MTVfRk9STUFUX01PRF9ZX1RJTEVEX0dFTjEy
X01DX0NDUyBmb3VyY2NfbW9kX2NvZGUoSU5URUwsIDcpCisKIC8qCiAgKiBUaWxlZCwgTlYxMk1U
LCBncm91cGVkIGluIDY0IChwaXhlbHMpIHggMzIgKGxpbmVzKSAtc2l6ZWQgbWFjcm9ibG9ja3MK
ICAqCi0tIAoyLjIyLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbAo=
