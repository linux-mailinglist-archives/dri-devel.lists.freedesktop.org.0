Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B3AE24DA0
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2019 13:09:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8B668930E;
	Tue, 21 May 2019 11:09:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D5DF8930E
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2019 11:09:12 +0000 (UTC)
X-Originating-IP: 90.88.22.185
Received: from localhost (aaubervilliers-681-1-80-185.w90-88.abo.wanadoo.fr
 [90.88.22.185]) (Authenticated sender: maxime.ripard@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 2B579C0007;
 Tue, 21 May 2019 11:09:07 +0000 (UTC)
From: Maxime Ripard <maxime.ripard@bootlin.com>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Sean Paul <seanpaul@chromium.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>
Subject: [PATCH] drm/fourcc: Fix the parameters name in the documentation
Date: Tue, 21 May 2019 13:09:06 +0200
Message-Id: <20190521110906.15268-1-maxime.ripard@bootlin.com>
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
Cc: kbuild test robot <lkp@intel.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2UgaW50cm9kdWNlZCBuZXcgZnVuY3Rpb25zIGluIHRoZSBjb21taXQgYmYzOTYwN2MxNjE0ICgi
ZHJtL2ZvdXJjYzogUGFzcwp0aGUgZm9ybWF0X2luZm8gcG9pbnRlciB0byBkcm1fZm9ybWF0X3Bs
YW5lX3dpZHRoL2hlaWdodCIpIGJhc2VkIG9uCnByZXZpb3VzIG9uZXMgYnV0IHdpdGggYSBzbGln
aHRseSBkaWZmZXJlbnQgcHJvdG90eXBlLiBIb3dldmVyLCB0aGUKZG9jdW1lbnRhdGlvbiB3YXNu
J3QgY2hhbmdlZCB0byByZWZsZWN0IHRoYXQgY2hhbmdlLgoKRml4ZXM6IGJmMzk2MDdjMTYxNCAo
ImRybS9mb3VyY2M6IFBhc3MgdGhlIGZvcm1hdF9pbmZvIHBvaW50ZXIgdG8gZHJtX2Zvcm1hdF9w
bGFuZV93aWR0aC9oZWlnaHQiKQpSZXBvcnRlZC1ieToga2J1aWxkIHRlc3Qgcm9ib3QgPGxrcEBp
bnRlbC5jb20+ClNpZ25lZC1vZmYtYnk6IE1heGltZSBSaXBhcmQgPG1heGltZS5yaXBhcmRAYm9v
dGxpbi5jb20+Ci0tLQogaW5jbHVkZS9kcm0vZHJtX2ZvdXJjYy5oIHwgNCArKy0tCiAxIGZpbGUg
Y2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2lu
Y2x1ZGUvZHJtL2RybV9mb3VyY2MuaCBiL2luY2x1ZGUvZHJtL2RybV9mb3VyY2MuaAppbmRleCA0
MDU0NjY2OTJiZDIuLjMwNmQxZWZlYjVlMCAxMDA2NDQKLS0tIGEvaW5jbHVkZS9kcm0vZHJtX2Zv
dXJjYy5oCisrKyBiL2luY2x1ZGUvZHJtL2RybV9mb3VyY2MuaApAQCAtMjYyLDcgKzI2Miw3IEBA
IGRybV9mb3JtYXRfaW5mb19pc195dXZfc2FtcGxpbmdfNDQ0KGNvbnN0IHN0cnVjdCBkcm1fZm9y
bWF0X2luZm8gKmluZm8pCiAKIC8qKgogICogZHJtX2Zvcm1hdF9pbmZvX3BsYW5lX3dpZHRoIC0g
d2lkdGggb2YgdGhlIHBsYW5lIGdpdmVuIHRoZSBmaXJzdCBwbGFuZQotICogQGZvcm1hdDogcGl4
ZWwgZm9ybWF0IGluZm8KKyAqIEBpbmZvOiBwaXhlbCBmb3JtYXQgaW5mbwogICogQHdpZHRoOiB3
aWR0aCBvZiB0aGUgZmlyc3QgcGxhbmUKICAqIEBwbGFuZTogcGxhbmUgaW5kZXgKICAqCkBAIC0y
ODQsNyArMjg0LDcgQEAgaW50IGRybV9mb3JtYXRfaW5mb19wbGFuZV93aWR0aChjb25zdCBzdHJ1
Y3QgZHJtX2Zvcm1hdF9pbmZvICppbmZvLCBpbnQgd2lkdGgsCiAKIC8qKgogICogZHJtX2Zvcm1h
dF9pbmZvX3BsYW5lX2hlaWdodCAtIGhlaWdodCBvZiB0aGUgcGxhbmUgZ2l2ZW4gdGhlIGZpcnN0
IHBsYW5lCi0gKiBAZm9ybWF0OiBwaXhlbCBmb3JtYXQgaW5mbworICogQGluZm86IHBpeGVsIGZv
cm1hdCBpbmZvCiAgKiBAaGVpZ2h0OiBoZWlnaHQgb2YgdGhlIGZpcnN0IHBsYW5lCiAgKiBAcGxh
bmU6IHBsYW5lIGluZGV4CiAgKgotLSAKMi4yMS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
