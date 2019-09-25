Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E6CF8BD982
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2019 10:07:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FBFF6E9C1;
	Wed, 25 Sep 2019 08:07:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from regular1.263xmail.com (regular1.263xmail.com [211.150.70.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0173E6E9C1
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2019 08:07:08 +0000 (UTC)
Received: from hjc?rock-chips.com (unknown [192.168.167.42])
 by regular1.263xmail.com (Postfix) with ESMTP id EA12B305;
 Wed, 25 Sep 2019 16:07:05 +0800 (CST)
X-263anti-spam: KSV:0;BIG:0;
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-KSVirus-check: 0
X-ADDR-CHECKED4: 1
X-ABS-CHECKED: 1
X-SKE-CHECKED: 1
X-ANTISPAM-LEVEL: 2
Received: from localhost.localdomain (unknown [58.22.7.114])
 by smtp.263.net (postfix) whith ESMTP id
 P2645T139744972404480S1569398812082049_; 
 Wed, 25 Sep 2019 16:07:05 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <b7eb8ce1b1359ea5bd932d20f67e4313>
X-RL-SENDER: hjc@rock-chips.com
X-SENDER: hjc@rock-chips.com
X-LOGIN-NAME: hjc@rock-chips.com
X-FST-TO: dri-devel@lists.freedesktop.org
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-DNS-TYPE: 0
From: Sandy Huang <hjc@rock-chips.com>
To: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 1/3] drm: Add some new format DRM_FORMAT_NVXX_10
Date: Wed, 25 Sep 2019 16:06:38 +0800
Message-Id: <1569398801-92201-2-git-send-email-hjc@rock-chips.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1569398801-92201-1-git-send-email-hjc@rock-chips.com>
References: <1569398801-92201-1-git-send-email-hjc@rock-chips.com>
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
Cc: linux-kernel@vger.kernel.org, Ayan.Halder@arm.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlc2UgbmV3IGZvcm1hdCBpcyBzdXBwb3J0ZWQgYnkgc29tZSByb2NrY2hpcCBzb2NzOgoKRFJN
X0ZPUk1BVF9OVjEyXzEwL0RSTV9GT1JNQVRfTlYyMV8xMApEUk1fRk9STUFUX05WMTZfMTAvRFJN
X0ZPUk1BVF9OVjYxXzEwCkRSTV9GT1JNQVRfTlYyNF8xMC9EUk1fRk9STUFUX05WNDJfMTAKClNp
Z25lZC1vZmYtYnk6IFNhbmR5IEh1YW5nIDxoamNAcm9jay1jaGlwcy5jb20+Ci0tLQogZHJpdmVy
cy9ncHUvZHJtL2RybV9mb3VyY2MuYyAgfCAxOCArKysrKysrKysrKysrKysrKysKIGluY2x1ZGUv
dWFwaS9kcm0vZHJtX2ZvdXJjYy5oIHwgMTQgKysrKysrKysrKysrKysKIDIgZmlsZXMgY2hhbmdl
ZCwgMzIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZm91
cmNjLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2ZvdXJjYy5jCmluZGV4IGM2MzAwNjQuLmYyNWZh
ODEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZm91cmNjLmMKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2RybV9mb3VyY2MuYwpAQCAtMjc0LDYgKzI3NCwyNCBAQCBjb25zdCBzdHJ1Y3Qg
ZHJtX2Zvcm1hdF9pbmZvICpfX2RybV9mb3JtYXRfaW5mbyh1MzIgZm9ybWF0KQogCQl7IC5mb3Jt
YXQgPSBEUk1fRk9STUFUX1lVVjQyMF8xMEJJVCwgICAgLmRlcHRoID0gMCwKIAkJICAubnVtX3Bs
YW5lcyA9IDEsIC5jcHAgPSB7IDAsIDAsIDAgfSwgLmhzdWIgPSAyLCAudnN1YiA9IDIsCiAJCSAg
LmlzX3l1diA9IHRydWUgfSwKKwkJeyAuZm9ybWF0ID0gRFJNX0ZPUk1BVF9OVjEyXzEwLAkJLmRl
cHRoID0gMCwKKwkJICAubnVtX3BsYW5lcyA9IDIsIC5jcHAgPSB7IDAsIDAsIDAgfSwgLmhzdWIg
PSAyLCAudnN1YiA9IDIsCisJCSAgLmlzX3l1diA9IHRydWUgfSwKKwkJeyAuZm9ybWF0ID0gRFJN
X0ZPUk1BVF9OVjIxXzEwLAkJLmRlcHRoID0gMCwKKwkJICAubnVtX3BsYW5lcyA9IDIsIC5jcHAg
PSB7IDAsIDAsIDAgfSwgLmhzdWIgPSAyLCAudnN1YiA9IDIsCisJCSAgLmlzX3l1diA9IHRydWUg
fSwKKwkJeyAuZm9ybWF0ID0gRFJNX0ZPUk1BVF9OVjE2XzEwLAkJLmRlcHRoID0gMCwKKwkJICAu
bnVtX3BsYW5lcyA9IDIsIC5jcHAgPSB7IDAsIDAsIDAgfSwgLmhzdWIgPSAyLCAudnN1YiA9IDEs
CisJCSAgLmlzX3l1diA9IHRydWUgfSwKKwkJeyAuZm9ybWF0ID0gRFJNX0ZPUk1BVF9OVjYxXzEw
LAkJLmRlcHRoID0gMCwKKwkJICAubnVtX3BsYW5lcyA9IDIsIC5jcHAgPSB7IDAsIDAsIDAgfSwg
LmhzdWIgPSAyLCAudnN1YiA9IDEsCisJCSAgLmlzX3l1diA9IHRydWUgfSwKKwkJeyAuZm9ybWF0
ID0gRFJNX0ZPUk1BVF9OVjI0XzEwLAkJLmRlcHRoID0gMCwKKwkJICAubnVtX3BsYW5lcyA9IDIs
IC5jcHAgPSB7IDAsIDAsIDAgfSwgLmhzdWIgPSAxLCAudnN1YiA9IDEsCisJCSAgLmlzX3l1diA9
IHRydWUgfSwKKwkJeyAuZm9ybWF0ID0gRFJNX0ZPUk1BVF9OVjQyXzEwLAkJLmRlcHRoID0gMCwK
KwkJICAubnVtX3BsYW5lcyA9IDIsIC5jcHAgPSB7IDAsIDAsIDAgfSwgLmhzdWIgPSAxLCAudnN1
YiA9IDEsCisJCSAgLmlzX3l1diA9IHRydWUgfSwKIAl9OwogCiAJdW5zaWduZWQgaW50IGk7CmRp
ZmYgLS1naXQgYS9pbmNsdWRlL3VhcGkvZHJtL2RybV9mb3VyY2MuaCBiL2luY2x1ZGUvdWFwaS9k
cm0vZHJtX2ZvdXJjYy5oCmluZGV4IDNmZWVhYTMuLjA0NzlmNDcgMTAwNjQ0Ci0tLSBhL2luY2x1
ZGUvdWFwaS9kcm0vZHJtX2ZvdXJjYy5oCisrKyBiL2luY2x1ZGUvdWFwaS9kcm0vZHJtX2ZvdXJj
Yy5oCkBAIC0yMzgsNiArMjM4LDIwIEBAIGV4dGVybiAiQyIgewogI2RlZmluZSBEUk1fRk9STUFU
X05WNDIJCWZvdXJjY19jb2RlKCdOJywgJ1YnLCAnNCcsICcyJykgLyogbm9uLXN1YnNhbXBsZWQg
Q2I6Q3IgcGxhbmUgKi8KIAogLyoKKyAqIDIgcGxhbmUgWUNiQ3IgMTBiaXQKKyAqIGluZGV4IDAg
PSBZIHBsYW5lLCBbOTowXSBZCisgKiBpbmRleCAxID0gQ3I6Q2IgcGxhbmUsIFsxOTowXQorICog
b3IKKyAqIGluZGV4IDEgPSBDYjpDciBwbGFuZSwgWzE5OjBdCisgKi8KKyNkZWZpbmUgRFJNX0ZP
Uk1BVF9OVjEyXzEwCWZvdXJjY19jb2RlKCdOJywgJ0EnLCAnMScsICcyJykgLyogMngyIHN1YnNh
bXBsZWQgQ3I6Q2IgcGxhbmUgKi8KKyNkZWZpbmUgRFJNX0ZPUk1BVF9OVjIxXzEwCWZvdXJjY19j
b2RlKCdOJywgJ0EnLCAnMicsICcxJykgLyogMngyIHN1YnNhbXBsZWQgQ2I6Q3IgcGxhbmUgKi8K
KyNkZWZpbmUgRFJNX0ZPUk1BVF9OVjE2XzEwCWZvdXJjY19jb2RlKCdOJywgJ0EnLCAnMScsICc2
JykgLyogMngxIHN1YnNhbXBsZWQgQ3I6Q2IgcGxhbmUgKi8KKyNkZWZpbmUgRFJNX0ZPUk1BVF9O
VjYxXzEwCWZvdXJjY19jb2RlKCdOJywgJ0EnLCAnNicsICcxJykgLyogMngxIHN1YnNhbXBsZWQg
Q2I6Q3IgcGxhbmUgKi8KKyNkZWZpbmUgRFJNX0ZPUk1BVF9OVjI0XzEwCWZvdXJjY19jb2RlKCdO
JywgJ0EnLCAnMicsICc0JykgLyogbm9uLXN1YnNhbXBsZWQgQ3I6Q2IgcGxhbmUgKi8KKyNkZWZp
bmUgRFJNX0ZPUk1BVF9OVjQyXzEwCWZvdXJjY19jb2RlKCdOJywgJ0EnLCAnNCcsICcyJykgLyog
bm9uLXN1YnNhbXBsZWQgQ2I6Q3IgcGxhbmUgKi8KKworLyoKICAqIDIgcGxhbmUgWUNiQ3IgTVNC
IGFsaWduZWQKICAqIGluZGV4IDAgPSBZIHBsYW5lLCBbMTU6MF0gWTp4IFsxMDo2XSBsaXR0bGUg
ZW5kaWFuCiAgKiBpbmRleCAxID0gQ3I6Q2IgcGxhbmUsIFszMTowXSBDcjp4OkNiOnggWzEwOjY6
MTA6Nl0gbGl0dGxlIGVuZGlhbgotLSAKMi43LjQKCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
