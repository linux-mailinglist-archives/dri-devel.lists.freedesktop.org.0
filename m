Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDBBDFE5D1
	for <lists+dri-devel@lfdr.de>; Fri, 15 Nov 2019 20:42:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFD4F6E5FE;
	Fri, 15 Nov 2019 19:42:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80E2D6E51A;
 Fri, 15 Nov 2019 19:42:08 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 15 Nov 2019 11:42:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,309,1569308400"; d="scan'208";a="288645060"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga001.jf.intel.com with SMTP; 15 Nov 2019 11:42:05 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 15 Nov 2019 21:42:04 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/7] drm: Random pile of core stuff
Date: Fri, 15 Nov 2019 21:41:57 +0200
Message-Id: <20191115194204.22244-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.23.0
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
Cc: intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCkkg
Zm91bmQgdGhpcyByYW5kb20gcGlsZSBvZiBzdHVmZiBseWluZyBhcm91bmQuIER1c3RlZCBpdCBv
ZmYKYW5kIHRvc3NlZCBpbiB0aGUgbmV3IHNlbGZ0ZXN0cy4KClZpbGxlIFN5cmrDpGzDpCAoNyk6
CiAgZHJtOiBNb3ZlIHBhZ2VfZmxpcCBmYiBsb29rdXAgZWFybGllcgogIGRybTogQWxsb2NhdGUg
dGhlIHBhZ2UgZmxpcCBldmVudCBlYXJsaWVyCiAgZHJtOiBFeHRyYWN0IHBhZ2VfZmxpcF97aW50
ZXJuYWwsYXRvbWljfSgpCiAgZHJtOiBTaW1wbGlmeSB0aGUgc2V0cGxhbmUgb2xkX2ZiIGhhbmRs
aW5nIGZ1cnRoZXIKICBkcm0vc2VsZnRlc3RzOiBBZGQgc29tZSBzZWxmdGVzdHMgZm9yIGRybV9h
dG9taWNfc2V0X21vZGVfZm9yX2NydGMoKQogIGRybS9hdG9taWM6IEZpeCB0aGUgZWFybHkgcmV0
dXJuIGluIGRybV9hdG9taWNfc2V0X21vZGVfZm9yX2NydGMoKQogIGRybS9hdG9taWM6IFJlZHVj
ZSBzZXRwbGFuZSBsb2NraW5nCgogZHJpdmVycy9ncHUvZHJtL2RybV9hdG9taWNfdWFwaS5jICAg
ICAgICAgICAgIHwgICA5ICstCiBkcml2ZXJzL2dwdS9kcm0vZHJtX3BsYW5lLmMgICAgICAgICAg
ICAgICAgICAgfCAyODUgKysrKysrKysrKystLS0tLS0tCiBkcml2ZXJzL2dwdS9kcm0vc2VsZnRl
c3RzL01ha2VmaWxlICAgICAgICAgICAgfCAgIDMgKy0KIC4uLi9ncHUvZHJtL3NlbGZ0ZXN0cy9k
cm1fbW9kZXNldF9zZWxmdGVzdHMuaCB8ICAgMiArCiAuLi4vZ3B1L2RybS9zZWxmdGVzdHMvdGVz
dC1kcm1fYXRvbWljX3VhcGkuYyAgfCAxMTAgKysrKysrKwogLi4uL2RybS9zZWxmdGVzdHMvdGVz
dC1kcm1fbW9kZXNldF9jb21tb24uaCAgIHwgICAyICsKIDYgZmlsZXMgY2hhbmdlZCwgMjkxIGlu
c2VydGlvbnMoKyksIDEyMCBkZWxldGlvbnMoLSkKIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJz
L2dwdS9kcm0vc2VsZnRlc3RzL3Rlc3QtZHJtX2F0b21pY191YXBpLmMKCi0tIAoyLjIzLjAKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
