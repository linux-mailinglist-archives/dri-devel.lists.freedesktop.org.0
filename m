Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C488D20378
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2019 12:32:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE9488930C;
	Thu, 16 May 2019 10:32:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D11968930C
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2019 10:32:01 +0000 (UTC)
X-Originating-IP: 80.215.244.179
Received: from localhost (unknown [80.215.244.179])
 (Authenticated sender: maxime.ripard@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id CD49524000A;
 Thu, 16 May 2019 10:31:54 +0000 (UTC)
From: Maxime Ripard <maxime.ripard@bootlin.com>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Sean Paul <seanpaul@chromium.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>
Subject: [PATCH v3 1/7] drm/rockchip: Change the scl_vop_cal_scl_fac to pass
 drm_format_info
Date: Thu, 16 May 2019 12:31:46 +0200
Message-Id: <27b0041c7977402df4a087c78d2849ffe51c9f1c.1558002671.git-series.maxime.ripard@bootlin.com>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIFJvY2tjaGlwIFZPUCBkcml2ZXIgaGFzIGEgZnVuY3Rpb24sIHNjbF92b3BfY2FsX3NjbF9m
YWMsIHRoYXQgd2lsbApsb29rdXAgdGhlIGRybV9mb3JtYXRfaW5mbyBzdHJ1Y3R1cmUgZnJvbSB0
aGUgZm91cmNjIHBhc3NlZCB0byBpdCBieSBpdHMKY2FsbGVyLgoKSG93ZXZlciwgaXRzIG9ubHkg
Y2FsbGVyIGFscmVhZHkgZGVyZWZlbmNlcyB0aGUgZHJtX2Zvcm1hdF9pbmZvIHN0cnVjdHVyZQpp
dCBoYXMgYWNjZXNzIHRvIHRvIHJldHJpZXZlIHRoYXQgZm91cmNjLiBDaGFuZ2UgdGhlIHByb3Rv
dHlwZSBvZiB0aGF0CmZ1bmN0aW9uIHRvIHBhc3MgdGhlIGRybV9mb3JtYXRfaW5mbyBzdHJ1Y3R1
cmUgZGlyZWN0bHksIHJlbW92aW5nIHRoZSBuZWVkCmZvciBhbiBleHRyYSBsb29rdXAuCgpTdWdn
ZXN0ZWQtYnk6IFBoaWxpcHAgWmFiZWwgPHAuemFiZWxAcGVuZ3V0cm9uaXguZGU+ClNpZ25lZC1v
ZmYtYnk6IE1heGltZSBSaXBhcmQgPG1heGltZS5yaXBhcmRAYm9vdGxpbi5jb20+Ci0tLQogZHJp
dmVycy9ncHUvZHJtL3JvY2tjaGlwL3JvY2tjaGlwX2RybV92b3AuYyB8IDExICsrKystLS0tLS0t
CiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9kcm1fdm9wLmMgYi9kcml2
ZXJzL2dwdS9kcm0vcm9ja2NoaXAvcm9ja2NoaXBfZHJtX3ZvcC5jCmluZGV4IDIwYTljMjk2ZDAy
Ny4uOWMwZDZiMzY3NzA5IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvcm9j
a2NoaXBfZHJtX3ZvcC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9k
cm1fdm9wLmMKQEAgLTMxNSwxNCArMzE1LDEzIEBAIHN0YXRpYyB1aW50MTZfdCBzY2xfdm9wX2Nh
bF9zY2FsZShlbnVtIHNjYWxlX21vZGUgbW9kZSwgdWludDMyX3Qgc3JjLAogCiBzdGF0aWMgdm9p
ZCBzY2xfdm9wX2NhbF9zY2xfZmFjKHN0cnVjdCB2b3AgKnZvcCwgY29uc3Qgc3RydWN0IHZvcF93
aW5fZGF0YSAqd2luLAogCQkJICAgICB1aW50MzJfdCBzcmNfdywgdWludDMyX3Qgc3JjX2gsIHVp
bnQzMl90IGRzdF93LAotCQkJICAgICB1aW50MzJfdCBkc3RfaCwgdWludDMyX3QgcGl4ZWxfZm9y
bWF0KQorCQkJICAgICB1aW50MzJfdCBkc3RfaCwgY29uc3Qgc3RydWN0IGRybV9mb3JtYXRfaW5m
byAqaW5mbykKIHsKIAl1aW50MTZfdCB5cmdiX2hvcl9zY2xfbW9kZSwgeXJnYl92ZXJfc2NsX21v
ZGU7CiAJdWludDE2X3QgY2Jjcl9ob3Jfc2NsX21vZGUgPSBTQ0FMRV9OT05FOwogCXVpbnQxNl90
IGNiY3JfdmVyX3NjbF9tb2RlID0gU0NBTEVfTk9ORTsKLQlpbnQgaHN1YiA9IGRybV9mb3JtYXRf
aG9yel9jaHJvbWFfc3Vic2FtcGxpbmcocGl4ZWxfZm9ybWF0KTsKLQlpbnQgdnN1YiA9IGRybV9m
b3JtYXRfdmVydF9jaHJvbWFfc3Vic2FtcGxpbmcocGl4ZWxfZm9ybWF0KTsKLQljb25zdCBzdHJ1
Y3QgZHJtX2Zvcm1hdF9pbmZvICppbmZvOworCWludCBoc3ViID0gZHJtX2Zvcm1hdF9ob3J6X2No
cm9tYV9zdWJzYW1wbGluZyhpbmZvLT5mb3JtYXQpOworCWludCB2c3ViID0gZHJtX2Zvcm1hdF92
ZXJ0X2Nocm9tYV9zdWJzYW1wbGluZyhpbmZvLT5mb3JtYXQpOwogCWJvb2wgaXNfeXV2ID0gZmFs
c2U7CiAJdWludDE2X3QgY2Jjcl9zcmNfdyA9IHNyY193IC8gaHN1YjsKIAl1aW50MTZfdCBjYmNy
X3NyY19oID0gc3JjX2ggLyB2c3ViOwpAQCAtMzMxLDggKzMzMCw2IEBAIHN0YXRpYyB2b2lkIHNj
bF92b3BfY2FsX3NjbF9mYWMoc3RydWN0IHZvcCAqdm9wLCBjb25zdCBzdHJ1Y3Qgdm9wX3dpbl9k
YXRhICp3aW4sCiAJdWludDMyX3QgdmFsOwogCWludCB2c2tpcGxpbmVzOwogCi0JaW5mbyA9IGRy
bV9mb3JtYXRfaW5mbyhwaXhlbF9mb3JtYXQpOwotCiAJaWYgKGluZm8tPmlzX3l1dikKIAkJaXNf
eXV2ID0gdHJ1ZTsKIApAQCAtODU2LDcgKzg1Myw3IEBAIHN0YXRpYyB2b2lkIHZvcF9wbGFuZV9h
dG9taWNfdXBkYXRlKHN0cnVjdCBkcm1fcGxhbmUgKnBsYW5lLAogCWlmICh3aW4tPnBoeS0+c2Ns
KQogCQlzY2xfdm9wX2NhbF9zY2xfZmFjKHZvcCwgd2luLCBhY3R1YWxfdywgYWN0dWFsX2gsCiAJ
CQkJICAgIGRybV9yZWN0X3dpZHRoKGRlc3QpLCBkcm1fcmVjdF9oZWlnaHQoZGVzdCksCi0JCQkJ
ICAgIGZiLT5mb3JtYXQtPmZvcm1hdCk7CisJCQkJICAgIGZiLT5mb3JtYXQpOwogCiAJVk9QX1dJ
Tl9TRVQodm9wLCB3aW4sIGFjdF9pbmZvLCBhY3RfaW5mbyk7CiAJVk9QX1dJTl9TRVQodm9wLCB3
aW4sIGRzcF9pbmZvLCBkc3BfaW5mbyk7CgpiYXNlLWNvbW1pdDogYTgwMjMwMzkzNGIzYmQ0ZGY2
ZTJmYzhiZjJlNGViY2VkMWMzNzU1NgotLSAKZ2l0LXNlcmllcyAwLjkuMQpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
