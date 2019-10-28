Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75FF0E7581
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2019 16:49:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 000A96E959;
	Mon, 28 Oct 2019 15:49:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1EC56E957
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2019 15:49:32 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 38454B5A7;
 Mon, 28 Oct 2019 15:49:31 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, kraxel@redhat.com, sam@ravnborg.org,
 chen@aspeedtech.com
Subject: [PATCH 3/9] drm/ast: Don't clear base address and offset with default
 values
Date: Mon, 28 Oct 2019 16:49:22 +0100
Message-Id: <20191028154928.4058-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191028154928.4058-1-tzimmermann@suse.de>
References: <20191028154928.4058-1-tzimmermann@suse.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIGNvbnRlbnQgb2YgdGhlIGJhc2UtYWRkcmVzcyBhbmQgb2Zmc2V0IHJlZ2lzdGVycyBhcmUg
c3RhdGUgb2YKdGhlIHByaW1hcnkgcGxhbmUuIENsZWFyaW5nIGl0IHRvIGRlZmF1bHQgdmFsdWVz
IHdpbGwgaW50ZXJmZXJlIHdpdGgKcGxhbmUgZnVuY3Rpb25zIGZvciBhdG9taWMgbW9kZSBzZXR0
aW5nLgoKU2lnbmVkLW9mZi1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2Uu
ZGU+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfbW9kZS5jIHwgOCArKysrKystLQogMSBm
aWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9tb2RlLmMgYi9kcml2ZXJzL2dwdS9kcm0vYXN0L2Fz
dF9tb2RlLmMKaW5kZXggYjEzZWFhMjYxOWFiLi5iM2Y4MmMyZDI3NGQgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9hc3QvYXN0X21vZGUuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYXN0L2Fz
dF9tb2RlLmMKQEAgLTI1Myw5ICsyNTMsMTMgQEAgc3RhdGljIHZvaWQgYXN0X3NldF9zdGRfcmVn
KHN0cnVjdCBkcm1fY3J0YyAqY3J0Yywgc3RydWN0IGRybV9kaXNwbGF5X21vZGUgKm1vZGUKIAkJ
YXN0X3NldF9pbmRleF9yZWcoYXN0LCBBU1RfSU9fU0VRX1BPUlQsIChpICsgMSkgLCBqcmVnKTsK
IAl9CiAKLQkvKiBTZXQgQ1JUQyAqLworCS8qIFNldCBDUlRDOyBleGNlcHQgYmFzZSBhZGRyZXNz
IGFuZCBvZmZzZXQgKi8KIAlhc3Rfc2V0X2luZGV4X3JlZ19tYXNrKGFzdCwgQVNUX0lPX0NSVENf
UE9SVCwgMHgxMSwgMHg3ZiwgMHgwMCk7Ci0JZm9yIChpID0gMDsgaSA8IDI1OyBpKyspCisJZm9y
IChpID0gMDsgaSA8IDEyOyBpKyspCisJCWFzdF9zZXRfaW5kZXhfcmVnKGFzdCwgQVNUX0lPX0NS
VENfUE9SVCwgaSwgc3RkdGFibGUtPmNydGNbaV0pOworCWZvciAoaSA9IDE0OyBpIDwgMTk7IGkr
KykKKwkJYXN0X3NldF9pbmRleF9yZWcoYXN0LCBBU1RfSU9fQ1JUQ19QT1JULCBpLCBzdGR0YWJs
ZS0+Y3J0Y1tpXSk7CisJZm9yIChpID0gMjA7IGkgPCAyNTsgaSsrKQogCQlhc3Rfc2V0X2luZGV4
X3JlZyhhc3QsIEFTVF9JT19DUlRDX1BPUlQsIGksIHN0ZHRhYmxlLT5jcnRjW2ldKTsKIAogCS8q
IHNldCBBUiAqLwotLSAKMi4yMy4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
