Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF31DC29E7
	for <lists+dri-devel@lfdr.de>; Tue,  1 Oct 2019 00:47:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FC466E0BF;
	Mon, 30 Sep 2019 22:47:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EB1D6E0BF;
 Mon, 30 Sep 2019 22:46:59 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 30 Sep 2019 15:46:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,568,1559545200"; d="scan'208";a="184991979"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.135])
 by orsmga008.jf.intel.com with ESMTP; 30 Sep 2019 15:46:57 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v7 0/3] CRTC background color
Date: Mon, 30 Sep 2019 15:47:04 -0700
Message-Id: <20190930224707.14904-1-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.21.0
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIHByZXZpb3VzIHZlcnNpb24gb2YgdGhpcyBzZXJpZXMgd2FzIHBvc3RlZCBpbiBGZWJydWFy
eSBoZXJlOgogICAgICAgIGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL2FyY2hpdmVzL2Ry
aS1kZXZlbC8yMDE5LUZlYnJ1YXJ5LzIwODA2OC5odG1sCgpSaWdodCBiZWZvcmUgd2UgbWVyZ2Vk
IHRoaXMgaW4gRmVicnVhcnkgTWFhcnRlbiBub3RpY2VkIHRoYXQgd2Ugc2hvdWxkCmJlIHNldHRp
bmcgdXAgdGhlIGluaXRpYWwgcHJvcGVydHkgc3RhdGUgaW4gYSBDUlRDIHJlc2V0IGZ1bmN0aW9u
ICh3aGljaApkaWRuJ3QgZXhpc3QgeWV0KSBpbnN0ZWFkIG9mIHdoZW4gdGhlIHByb3BlcnR5IHdh
cyBhdHRhY2hlZC4gIE1hYXJ0ZW4KbGFuZGVkIHRoZSBDUlRDIHJlc2V0IGZ1bmN0aW9uYWxpdHkg
YSB3ZWVrIG9yIHR3byBsYXRlciwgYnV0IEkgd2FzIGJ1c3kKd2l0aCB0cmF2ZWwgYW5kIG90aGVy
IHdvcmsgYXQgdGhlIHRpbWUsIHNvIHJldmlzaXRpbmcgYW5kIHJlYmFzaW5nIHRoaXMKYmFja2dy
b3VuZCBjb2xvciBzZXJpZXMgZmVsbCB0aHJvdWdoIHRoZSBjcmFja3MgYW5kIEknbSBqdXN0IGdl
dHRpbmcKYmFjayB0byBpdCBub3cuCgpVc2Vyc3BhY2UgY29uc3VtZXIgaXMgY2hyb21lb3M7IHRo
ZXNlIGFyZSB0aGUgbGlua3MgdGhlIENocm9tZU9TIGZvbGtzCmdhdmUgbWUgYmFjayBpbiBGZWJy
dWFyeToKICBodHRwczovL2Nocm9taXVtLXJldmlldy5nb29nbGVzb3VyY2UuY29tL2MvY2hyb21p
dW0vc3JjLysvMTI3ODg1OAogIGh0dHBzOi8vY2hyb21pdW0tcmV2aWV3Lmdvb2dsZXNvdXJjZS5j
b20vYy9jaHJvbWl1bW9zL3BsYXRmb3JtL2RybS10ZXN0cy8rLzEyNDE0MzYKCklHVCBpcyBzdGls
bCB0aGUgc2FtZSBhcyBwb3N0ZWQgaW4gRmVicnVhcnk6CiAgaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvYXJjaGl2ZXMvaWd0LWRldi8yMDE5LUZlYnJ1YXJ5LzAwOTYzNy5odG1sCgpDYzog
TWFhcnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNvbT4KCk1h
dHQgUm9wZXIgKDMpOgogIGRybTogQWRkIENSVEMgYmFja2dyb3VuZCBjb2xvciBwcm9wZXJ0eQog
IGRybS9pOTE1L2dlbjkrOiBBZGQgc3VwcG9ydCBmb3IgcGlwZSBiYWNrZ3JvdW5kIGNvbG9yCiAg
ZHJtL2k5MTU6IEFkZCBiYWNrZ3JvdW5kIGNvbG9yIGhhcmR3YXJlIHJlYWRvdXQgYW5kIHN0YXRl
IGNoZWNrCgogZHJpdmVycy9ncHUvZHJtL2RybV9hdG9taWNfc3RhdGVfaGVscGVyLmMgICAgfCAg
NCArLQogZHJpdmVycy9ncHUvZHJtL2RybV9hdG9taWNfdWFwaS5jICAgICAgICAgICAgfCAgNCAr
KwogZHJpdmVycy9ncHUvZHJtL2RybV9ibGVuZC5jICAgICAgICAgICAgICAgICAgfCAzNSArKysr
KysrKysrKysrLS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fbW9kZV9jb25maWcuYyAgICAgICAgICAg
IHwgIDYgKysrCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2NvbG9yLmMgICB8
IDExICsrKy0tCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXkuYyB8
IDQ1ICsrKysrKysrKysrKysrKysrKysrCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X2RlYnVn
ZnMuYyAgICAgICAgICB8ICA5ICsrKysKIGluY2x1ZGUvZHJtL2RybV9ibGVuZC5oICAgICAgICAg
ICAgICAgICAgICAgIHwgIDEgKwogaW5jbHVkZS9kcm0vZHJtX2NydGMuaCAgICAgICAgICAgICAg
ICAgICAgICAgfCAxMiArKysrKysKIGluY2x1ZGUvZHJtL2RybV9tb2RlX2NvbmZpZy5oICAgICAg
ICAgICAgICAgIHwgIDUgKysrCiBpbmNsdWRlL3VhcGkvZHJtL2RybV9tb2RlLmggICAgICAgICAg
ICAgICAgICB8IDI4ICsrKysrKysrKysrKwogMTEgZmlsZXMgY2hhbmdlZCwgMTUzIGluc2VydGlv
bnMoKyksIDcgZGVsZXRpb25zKC0pCgotLSAKMi4yMS4wCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
