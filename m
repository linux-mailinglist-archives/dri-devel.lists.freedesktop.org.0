Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28FE2BC858
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2019 14:59:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 027CF6EA1F;
	Tue, 24 Sep 2019 12:59:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74DC36EA1C;
 Tue, 24 Sep 2019 12:59:19 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 Sep 2019 05:59:18 -0700
X-IronPort-AV: E=Sophos;i="5.64,544,1559545200"; d="scan'208";a="179473339"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 Sep 2019 05:59:10 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 0/9] drm/print: add and use drm_debug_enabled()
Date: Tue, 24 Sep 2019 15:58:56 +0300
Message-Id: <cover.1569329774.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Cc: jani.nikula@intel.com, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, Russell King <linux+etnaviv@armlinux.org.uk>,
 amd-gfx@lists.freedesktop.org, etnaviv@lists.freedesktop.org,
 Eric Engestrom <eric.engestrom@intel.com>, Ben Skeggs <bskeggs@redhat.com>,
 linux-arm-msm@vger.kernel.org, Alex Deucher <alexander.deucher@amd.com>,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgYWxsLCB2MiBvZiBbMV0sIGEgbGl0dGxlIHJlZmFjdG9yaW5nIGFyb3VuZCBkcm1fZGVidWcg
YWNjZXNzIHRvCmFic3RyYWN0IGl0IGJldHRlci4gVGhlcmUgc2hvdWxkbid0IGJlIGFueSBmdW5j
dGlvbmFsIGNoYW5nZXMuCgpJJ2QgYXBwcmVjaWF0ZSBhY2tzIGZvciBtZXJnaW5nIHRoZSBsb3Qg
dmlhIGRybS1taXNjLiBJZiB0aGVyZSBhcmUgYW55Cm9iamVjdGlvbnMgdG8gdGhhdCwgd2UnbGwg
bmVlZCB0byBwb3N0cG9uZSB0aGUgbGFzdCBwYXRjaCB1bnRpbApldmVyeXRoaW5nIGhhcyBiZWVu
IG1lcmdlZCBhbmQgY29udmVydGVkIGluIGRybS1uZXh0LgoKQlIsCkphbmkuCgpDYzogRXJpYyBF
bmdlc3Ryb20gPGVyaWMuZW5nZXN0cm9tQGludGVsLmNvbT4KQ2M6IEFsZXggRGV1Y2hlciA8YWxl
eGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KQ2M6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5r
b2VuaWdAYW1kLmNvbT4KQ2M6IERhdmlkIChDaHVuTWluZykgWmhvdSA8RGF2aWQxLlpob3VAYW1k
LmNvbT4KQ2M6IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCkNjOiBCZW4gU2tlZ2dzIDxi
c2tlZ2dzQHJlZGhhdC5jb20+CkNjOiBub3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpDYzog
Um9iIENsYXJrIDxyb2JkY2xhcmtAZ21haWwuY29tPgpDYzogU2VhbiBQYXVsIDxzZWFuQHBvb3Js
eS5ydW4+CkNjOiBsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZwpDYzogZnJlZWRyZW5vQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpDYzogRnJhbmNpc2NvIEplcmV6IDxjdXJyb2plcmV6QHJpc2V1
cC5uZXQ+CkNjOiBMdWNhcyBTdGFjaCA8bC5zdGFjaEBwZW5ndXRyb25peC5kZT4KQ2M6IFJ1c3Nl
bGwgS2luZyA8bGludXgrZXRuYXZpdkBhcm1saW51eC5vcmcudWs+CkNjOiBDaHJpc3RpYW4gR21l
aW5lciA8Y2hyaXN0aWFuLmdtZWluZXJAZ21haWwuY29tPgpDYzogZXRuYXZpdkBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKCgpbMV0gaHR0cDovL21pZC5tYWlsLWFyY2hpdmUuY29tL2NvdmVyLjE1Njgz
NzUxODkuZ2l0LmphbmkubmlrdWxhQGludGVsLmNvbQoKSmFuaSBOaWt1bGEgKDkpOgogIGRybS9w
cmludDogbW92ZSBkcm1fZGVidWcgdmFyaWFibGUgdG8gZHJtX3ByaW50LltjaF0KICBkcm0vcHJp
bnQ6IGFkZCBkcm1fZGVidWdfZW5hYmxlZCgpCiAgZHJtL2V0bmF2aXY6IHVzZSBkcm1fZGVidWdf
ZW5hYmxlZCgpIHRvIGNoZWNrIGZvciBkZWJ1ZyBjYXRlZ29yaWVzCiAgZHJtL2kyYy9zaWwxNjQ6
IHVzZSBkcm1fZGVidWdfZW5hYmxlZCgpIHRvIGNoZWNrIGZvciBkZWJ1ZyBjYXRlZ29yaWVzCiAg
ZHJtL2k5MTU6IHVzZSBkcm1fZGVidWdfZW5hYmxlZCgpIHRvIGNoZWNrIGZvciBkZWJ1ZyBjYXRl
Z29yaWVzCiAgZHJtL21zbTogdXNlIGRybV9kZWJ1Z19lbmFibGVkKCkgdG8gY2hlY2sgZm9yIGRl
YnVnIGNhdGVnb3JpZXMKICBkcm0vbm91dmVhdTogdXNlIGRybV9kZWJ1Z19lbmFibGVkKCkgdG8g
Y2hlY2sgZm9yIGRlYnVnIGNhdGVnb3JpZXMKICBkcm0vYW1kZ3B1OiB1c2UgZHJtX2RlYnVnX2Vu
YWJsZWQoKSB0byBjaGVjayBmb3IgZGVidWcgY2F0ZWdvcmllcwogIGRybS9wcmludDogcmVuYW1l
IGRybV9kZWJ1ZyB0byBfX2RybV9kZWJ1ZyB0byBkaXNjb3VyYWdlIHVzZQoKIGRyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L3NtdV92MTFfMF9pMmMuYyAgIHwgIDQgKystLQogZHJpdmVycy9ncHUv
ZHJtL2RybV9hdG9taWNfdWFwaS5jICAgICAgICAgICAgfCAgMiArLQogZHJpdmVycy9ncHUvZHJt
L2RybV9kcF9tc3RfdG9wb2xvZ3kuYyAgICAgICAgfCAgNiArKy0tLQogZHJpdmVycy9ncHUvZHJt
L2RybV9kcnYuYyAgICAgICAgICAgICAgICAgICAgfCAxNyAtLS0tLS0tLS0tLS0tLS0KIGRyaXZl
cnMvZ3B1L2RybS9kcm1fZWRpZC5jICAgICAgICAgICAgICAgICAgIHwgIDIgKy0KIGRyaXZlcnMv
Z3B1L2RybS9kcm1fZWRpZF9sb2FkLmMgICAgICAgICAgICAgIHwgIDIgKy0KIGRyaXZlcnMvZ3B1
L2RybS9kcm1fbWlwaV9kYmkuYyAgICAgICAgICAgICAgIHwgIDQgKystLQogZHJpdmVycy9ncHUv
ZHJtL2RybV9wcmludC5jICAgICAgICAgICAgICAgICAgfCAyMyArKysrKysrKysrKysrKysrKyst
LQogZHJpdmVycy9ncHUvZHJtL2RybV92YmxhbmsuYyAgICAgICAgICAgICAgICAgfCAgNiArKy0t
LQogZHJpdmVycy9ncHUvZHJtL2V0bmF2aXYvZXRuYXZpdl9idWZmZXIuYyAgICAgfCAgOCArKyst
LS0tCiBkcml2ZXJzL2dwdS9kcm0vaTJjL3NpbDE2NF9kcnYuYyAgICAgICAgICAgICB8ICAyICst
CiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXkuYyB8ICA0ICsrLS0K
IGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHAuYyAgICAgIHwgIDIgKy0KIGRy
aXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfZHJ2LmMgICAgICAgICAgICAgIHwgIDIgKy0KIGRyaXZl
cnMvZ3B1L2RybS9pOTE1L2k5MTVfZ2VtLmggICAgICAgICAgICAgIHwgIDIgKy0KIGRyaXZlcnMv
Z3B1L2RybS9pOTE1L2k5MTVfdXRpbHMuYyAgICAgICAgICAgIHwgIDIgKy0KIGRyaXZlcnMvZ3B1
L2RybS9pOTE1L2ludGVsX3BtLmMgICAgICAgICAgICAgIHwgIDIgKy0KIGRyaXZlcnMvZ3B1L2Ry
bS9tc20vZGlzcC9kcHUxL2RwdV9rbXMuaCAgICAgIHwgIDQgKystLQogZHJpdmVycy9ncHUvZHJt
L25vdXZlYXUvZGlzcG52NTAvZGlzcC5oICAgICAgfCAgNCArKy0tCiBkcml2ZXJzL2dwdS9kcm0v
bm91dmVhdS9ub3V2ZWF1X2Rydi5oICAgICAgICB8ICA0ICsrLS0KIGluY2x1ZGUvZHJtL2RybV9k
cnYuaCAgICAgICAgICAgICAgICAgICAgICAgIHwgIDIgLS0KIGluY2x1ZGUvZHJtL2RybV9wcmlu
dC5oICAgICAgICAgICAgICAgICAgICAgIHwgIDggKysrKysrKwogMjIgZmlsZXMgY2hhbmdlZCwg
NjAgaW5zZXJ0aW9ucygrKSwgNTIgZGVsZXRpb25zKC0pCgotLSAKMi4yMC4xCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
