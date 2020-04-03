Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A447819DFB1
	for <lists+dri-devel@lfdr.de>; Fri,  3 Apr 2020 22:41:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64E6E6EC9A;
	Fri,  3 Apr 2020 20:41:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CEF48933E;
 Fri,  3 Apr 2020 20:41:17 +0000 (UTC)
IronPort-SDR: Fst/SCiBJ7Q+Dcs4We4wznElV5BhPhLs54uNn9pfUeNPTL46Y/UvBkoVuEovIH3pMqW+Uay6df
 AKBQtN1TqdJg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2020 13:41:16 -0700
IronPort-SDR: cBdw1vt8HGxh1iDG6us6SDQfBqpR0u4gEd6PS1wRfWqG8NI02HLKKYVOC0BS60i8vByFt4GznI
 wA8NGA6/fXyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,341,1580803200"; d="scan'208";a="360635978"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga001.fm.intel.com with SMTP; 03 Apr 2020 13:41:14 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 03 Apr 2020 23:41:13 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 16/17] drm: Nuke mode->private_flags
Date: Fri,  3 Apr 2020 23:40:07 +0300
Message-Id: <20200403204008.14864-17-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200403204008.14864-1-ville.syrjala@linux.intel.com>
References: <20200403204008.14864-1-ville.syrjala@linux.intel.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 Sam Ravnborg <sam@ravnborg.org>, Emil Velikov <emil.l.velikov@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KClRo
ZSBsYXN0IHR3byB1c2VzIG9mIG1vZGUtPnByaXZhdGVfZmxhZ3MgKGluIGk5MTUgYW5kIGdtYTUw
MCkKYXJlIG5vdyBnb25lLiBTbyBsZXQncyByZW1vdmUgbW9kZS0+cHJpdmF0ZV9mbGFncyBlbnRp
cmVseS4KCkNDOiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+CkNjOiBEYW5pZWwgVmV0
dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgpDYzogRW1pbCBWZWxpa292IDxlbWlsLmwudmVs
aWtvdkBnbWFpbC5jb20+ClNpZ25lZC1vZmYtYnk6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3ly
amFsYUBsaW51eC5pbnRlbC5jb20+Ci0tLQogaW5jbHVkZS9kcm0vZHJtX21vZGVzLmggfCAxMCAt
LS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTAgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
aW5jbHVkZS9kcm0vZHJtX21vZGVzLmggYi9pbmNsdWRlL2RybS9kcm1fbW9kZXMuaAppbmRleCA0
N2Q2MmI5ZDhkMjAuLjFlOTcxMzhhOWI4YyAxMDA2NDQKLS0tIGEvaW5jbHVkZS9kcm0vZHJtX21v
ZGVzLmgKKysrIGIvaW5jbHVkZS9kcm0vZHJtX21vZGVzLmgKQEAgLTM0OCwxNiArMzQ4LDYgQEAg
c3RydWN0IGRybV9kaXNwbGF5X21vZGUgewogCSAqLwogCXU4IHR5cGU7CiAKLQkvKioKLQkgKiBA
cHJpdmF0ZV9mbGFnczoKLQkgKgotCSAqIERyaXZlciBwcml2YXRlIGZsYWdzLiBwcml2YXRlX2Zs
YWdzIGNhbiBvbmx5IGJlIHVzZWQgZm9yIG1vZGUKLQkgKiBvYmplY3RzIHBhc3NlZCB0byBkcml2
ZXJzIGluIG1vZGVzZXQgb3BlcmF0aW9ucy4gSXQgc2hvdWxkbid0IGJlIHVzZWQKLQkgKiBieSBh
dG9taWMgZHJpdmVycyBzaW5jZSB0aGV5IGNhbiBzdG9yZSBhbnkgYWRkaXRpb25hbCBkYXRhIGJ5
Ci0JICogc3ViY2xhc3Npbmcgc3RhdGUgc3RydWN0dXJlcy4KLQkgKi8KLQl1OCBwcml2YXRlX2Zs
YWdzOwotCiAJLyoqCiAJICogQGhlYWQ6CiAJICoKLS0gCjIuMjQuMQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
