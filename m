Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA80811F2C4
	for <lists+dri-devel@lfdr.de>; Sat, 14 Dec 2019 17:21:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F266D6E10E;
	Sat, 14 Dec 2019 16:21:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 861506E10E
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Dec 2019 16:21:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: ezequiel) with ESMTPSA id 30336289F2D
From: Ezequiel Garcia <ezequiel@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm: shrinker: Add a prefix on purging logs
Date: Sat, 14 Dec 2019 13:20:49 -0300
Message-Id: <20191214162049.10997-1-ezequiel@collabora.com>
X-Mailer: git-send-email 2.22.0
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
Cc: David Airlie <airlied@linux.ie>, Ezequiel Garcia <ezequiel@collabora.com>,
 kernel@collabora.com, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SXQncyBub3QgZW50aXJlbHkgb2J2aW91cyB3aHkgdGhlc2UgbWVzc2FnZXMgaGF2ZQoiaW5mbyIg
c2V2ZXJpdHkuIEluIGFueSBjYXNlLCBhZGQgYSBwcm9wZXIgZHJpdmVyIHByZWZpeAp0byBnaXZl
IHRoZSB1c2VyIGEgYml0IG9mIGNvbnRleHQgb2Ygd2hlcmUgdGhleSBhcmUgY29taW5nIGZyb20u
CgpTaWduZWQtb2ZmLWJ5OiBFemVxdWllbCBHYXJjaWEgPGV6ZXF1aWVsQGNvbGxhYm9yYS5jb20+
Ci0tLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL2k5MTVfZ2VtX3Nocmlua2VyLmMgICAgIHwg
MiArKwogZHJpdmVycy9ncHUvZHJtL21zbS9tc21fZ2VtX3Nocmlua2VyLmMgICAgICAgICAgIHwg
MiArKwogZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2dlbV9zaHJpbmtlci5jIHwg
MiArKwogMyBmaWxlcyBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vaTkxNS9nZW0vaTkxNV9nZW1fc2hyaW5rZXIuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2dlbS9pOTE1X2dlbV9zaHJpbmtlci5jCmluZGV4IDNhOTI2YTg3NTVjNi4uY2QwMzcy
YTFkOTM2IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0vaTkxNV9nZW1fc2hy
aW5rZXIuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0vaTkxNV9nZW1fc2hyaW5rZXIu
YwpAQCAtNCw2ICs0LDggQEAKICAqIENvcHlyaWdodCDCqSAyMDA4LTIwMTUgSW50ZWwgQ29ycG9y
YXRpb24KICAqLwogCisjZGVmaW5lIHByX2ZtdChmbXQpIEtCVUlMRF9NT0ROQU1FICI6ICIgZm10
CisKICNpbmNsdWRlIDxsaW51eC9vb20uaD4KICNpbmNsdWRlIDxsaW51eC9zY2hlZC9tbS5oPgog
I2luY2x1ZGUgPGxpbnV4L3NobWVtX2ZzLmg+CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
bXNtL21zbV9nZW1fc2hyaW5rZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vbXNtX2dlbV9zaHJp
bmtlci5jCmluZGV4IDcyMmQ2MTY2OGE5Ny4uMDYyMGQ0NDFhMmNjIDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vbXNtL21zbV9nZW1fc2hyaW5rZXIuYworKysgYi9kcml2ZXJzL2dwdS9kcm0v
bXNtL21zbV9nZW1fc2hyaW5rZXIuYwpAQCAtNCw2ICs0LDggQEAKICAqIEF1dGhvcjogUm9iIENs
YXJrIDxyb2JkY2xhcmtAZ21haWwuY29tPgogICovCiAKKyNkZWZpbmUgcHJfZm10KGZtdCkgS0JV
SUxEX01PRE5BTUUgIjogIiBmbXQKKwogI2luY2x1ZGUgIm1zbV9kcnYuaCIKICNpbmNsdWRlICJt
c21fZ2VtLmgiCiAKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9z
dF9nZW1fc2hyaW5rZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9nZW1f
c2hyaW5rZXIuYwppbmRleCA0NThmMGZhNjgxMTEuLmI5ZDBlODIxYzNmNiAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2dlbV9zaHJpbmtlci5jCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9nZW1fc2hyaW5rZXIuYwpAQCAtNiw2ICs2
LDggQEAKICAqIEF1dGhvcjogUm9iIENsYXJrIDxyb2JkY2xhcmtAZ21haWwuY29tPgogICovCiAK
KyNkZWZpbmUgcHJfZm10KGZtdCkgS0JVSUxEX01PRE5BTUUgIjogIiBmbXQKKwogI2luY2x1ZGUg
PGxpbnV4L2xpc3QuaD4KIAogI2luY2x1ZGUgPGRybS9kcm1fZGV2aWNlLmg+Ci0tIAoyLjIyLjAK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
