Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B35910D424
	for <lists+dri-devel@lfdr.de>; Fri, 29 Nov 2019 11:31:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F4566E8C8;
	Fri, 29 Nov 2019 10:31:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B98F6E8C4;
 Fri, 29 Nov 2019 10:31:16 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Nov 2019 02:31:16 -0800
X-IronPort-AV: E=Sophos;i="5.69,257,1571727600"; d="scan'208";a="234672184"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Nov 2019 02:31:12 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org
Subject: [PATCH v2 12/14] media: constify fb ops across all drivers
Date: Fri, 29 Nov 2019 12:29:42 +0200
Message-Id: <9cfc1a171d12a52dfbd5508d737681f2d89d21df.1575022735.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1575022735.git.jani.nikula@intel.com>
References: <cover.1575022735.git.jani.nikula@intel.com>
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
Cc: Andy Walls <awalls@md.metrocast.net>, jani.nikula@intel.com,
 Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 ivtv-devel@ivtvdriver.org, Hans Verkuil <hverkuil@xs4all.nl>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Tm93IHRoYXQgdGhlIGZib3BzIG1lbWJlciBvZiBzdHJ1Y3QgZmJfaW5mbyBpcyBjb25zdCwgd2Ug
Y2FuIHN0YXJ0Cm1ha2luZyB0aGUgb3BzIGNvbnN0IGFzIHdlbGwuCgpSZW1vdmUgdGhlIHJlZHVu
ZGFudCBmYm9wcyBhc3NpZ25tZW50cyB3aGlsZSBhdCBpdC4KCnYyOgotIGFjdHVhbGx5IGFkZCBj
b25zdCBpbiB2aXZpZAotIGZpeCB0eXBvIChDaHJpc3RvcGhlIGRlIERpbmVjaGluKQoKQ2M6IEhh
bnMgVmVya3VpbCA8aHZlcmt1aWxAeHM0YWxsLm5sPgpDYzogQW5keSBXYWxscyA8YXdhbGxzQG1k
Lm1ldHJvY2FzdC5uZXQ+CkNjOiBsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmcKQ2M6IGl2dHYt
ZGV2ZWxAaXZ0dmRyaXZlci5vcmcKUmV2aWV3ZWQtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52
ZXR0ZXJAZmZ3bGwuY2g+ClNpZ25lZC1vZmYtYnk6IEphbmkgTmlrdWxhIDxqYW5pLm5pa3VsYUBp
bnRlbC5jb20+CgpmaXh1cC10by1tZWRpYQotLS0KIGRyaXZlcnMvbWVkaWEvcGNpL2l2dHYvaXZ0
dmZiLmMgICAgICAgICAgfCAzICstLQogZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS92aXZpZC92aXZp
ZC1vc2QuYyB8IDMgKy0tCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgNCBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL21lZGlhL3BjaS9pdnR2L2l2dHZmYi5jIGIv
ZHJpdmVycy9tZWRpYS9wY2kvaXZ0di9pdnR2ZmIuYwppbmRleCA5NWE1NmNjZTliNjUuLmYyOTIy
YjU1NGIwOSAxMDA2NDQKLS0tIGEvZHJpdmVycy9tZWRpYS9wY2kvaXZ0di9pdnR2ZmIuYworKysg
Yi9kcml2ZXJzL21lZGlhL3BjaS9pdnR2L2l2dHZmYi5jCkBAIC05MjUsNyArOTI1LDcgQEAgc3Rh
dGljIGludCBpdnR2ZmJfYmxhbmsoaW50IGJsYW5rX21vZGUsIHN0cnVjdCBmYl9pbmZvICppbmZv
KQogCXJldHVybiAwOwogfQogCi1zdGF0aWMgc3RydWN0IGZiX29wcyBpdnR2ZmJfb3BzID0gewor
c3RhdGljIGNvbnN0IHN0cnVjdCBmYl9vcHMgaXZ0dmZiX29wcyA9IHsKIAkub3duZXIgPSBUSElT
X01PRFVMRSwKIAkuZmJfd3JpdGUgICAgICAgPSBpdnR2ZmJfd3JpdGUsCiAJLmZiX2NoZWNrX3Zh
ciAgID0gaXZ0dmZiX2NoZWNrX3ZhciwKQEAgLTEwNDksNyArMTA0OSw2IEBAIHN0YXRpYyBpbnQg
aXZ0dmZiX2luaXRfdmlkbW9kZShzdHJ1Y3QgaXZ0diAqaXR2KQogCiAJb2ktPml2dHZmYl9pbmZv
Lm5vZGUgPSAtMTsKIAlvaS0+aXZ0dmZiX2luZm8uZmxhZ3MgPSBGQklORk9fRkxBR19ERUZBVUxU
OwotCW9pLT5pdnR2ZmJfaW5mby5mYm9wcyA9ICZpdnR2ZmJfb3BzOwogCW9pLT5pdnR2ZmJfaW5m
by5wYXIgPSBpdHY7CiAJb2ktPml2dHZmYl9pbmZvLnZhciA9IG9pLT5pdnR2ZmJfZGVmaW5lZDsK
IAlvaS0+aXZ0dmZiX2luZm8uZml4ID0gb2ktPml2dHZmYl9maXg7CmRpZmYgLS1naXQgYS9kcml2
ZXJzL21lZGlhL3BsYXRmb3JtL3ZpdmlkL3ZpdmlkLW9zZC5jIGIvZHJpdmVycy9tZWRpYS9wbGF0
Zm9ybS92aXZpZC92aXZpZC1vc2QuYwppbmRleCBmMmU3ODliZGY0YTYuLmZiYWVjOGFjYzE2MSAx
MDA2NDQKLS0tIGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS92aXZpZC92aXZpZC1vc2QuYworKysg
Yi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL3ZpdmlkL3ZpdmlkLW9zZC5jCkBAIC0yNDQsNyArMjQ0
LDcgQEAgc3RhdGljIGludCB2aXZpZF9mYl9ibGFuayhpbnQgYmxhbmtfbW9kZSwgc3RydWN0IGZi
X2luZm8gKmluZm8pCiAJcmV0dXJuIDA7CiB9CiAKLXN0YXRpYyBzdHJ1Y3QgZmJfb3BzIHZpdmlk
X2ZiX29wcyA9IHsKK3N0YXRpYyBjb25zdCBzdHJ1Y3QgZmJfb3BzIHZpdmlkX2ZiX29wcyA9IHsK
IAkub3duZXIgPSBUSElTX01PRFVMRSwKIAkuZmJfY2hlY2tfdmFyICAgPSB2aXZpZF9mYl9jaGVj
a192YXIsCiAJLmZiX3NldF9wYXIgICAgID0gdml2aWRfZmJfc2V0X3BhciwKQEAgLTMxMSw3ICsz
MTEsNiBAQCBzdGF0aWMgaW50IHZpdmlkX2ZiX2luaXRfdmlkbW9kZShzdHJ1Y3Qgdml2aWRfZGV2
ICpkZXYpCiAKIAlkZXYtPmZiX2luZm8ubm9kZSA9IC0xOwogCWRldi0+ZmJfaW5mby5mbGFncyA9
IEZCSU5GT19GTEFHX0RFRkFVTFQ7Ci0JZGV2LT5mYl9pbmZvLmZib3BzID0gJnZpdmlkX2ZiX29w
czsKIAlkZXYtPmZiX2luZm8ucGFyID0gZGV2OwogCWRldi0+ZmJfaW5mby52YXIgPSBkZXYtPmZi
X2RlZmluZWQ7CiAJZGV2LT5mYl9pbmZvLmZpeCA9IGRldi0+ZmJfZml4OwotLSAKMi4yMC4xCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
