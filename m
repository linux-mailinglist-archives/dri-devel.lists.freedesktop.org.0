Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FF8335853
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2019 10:13:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C697895CA;
	Wed,  5 Jun 2019 08:12:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 573 seconds by postgrey-1.36 at gabe;
 Wed, 05 Jun 2019 08:12:57 UTC
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61C0A895CA
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2019 08:12:57 +0000 (UTC)
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 80DE5200753;
 Wed,  5 Jun 2019 10:03:23 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 71EB0200746;
 Wed,  5 Jun 2019 10:03:19 +0200 (CEST)
Received: from localhost.localdomain (mega.ap.freescale.net [10.192.208.232])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 87F1D402D5;
 Wed,  5 Jun 2019 16:03:14 +0800 (SGT)
From: sandor.yu@nxp.com
To: hjc@rock-chips.com, heiko@sntech.de, airlied@linux.ie, daniel@ffwll.ch,
 sandor.yu@nxp.com
Subject: [PATCH] DRM: Rockchip: correct rate in the struct drm_dp_link
 assignment
Date: Wed,  5 Jun 2019 16:04:24 +0800
Message-Id: <20190605080424.28731-1-sandor.yu@nxp.com>
X-Mailer: git-send-email 2.17.1
X-Virus-Scanned: ClamAV using ClamSMTP
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
Cc: Sandor Yu <Sandor.yu@nxp.com>, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogU2FuZG9yIFl1IDxTYW5kb3IueXVAbnhwLmNvbT4KCnZhcmlhYmxlIG9mIHJhdGUgaW4g
dGhlIHN0cnVjdCBkcm1fZHBfbGluayBzaG91bGQgYXNzaWduIHRvCjE2MjAwMC8yNzAwMDAvNTQw
MDAwLzgxMDAwMC4KClNpZ25lZC1vZmYtYnk6IFNhbmRvciBZdSA8U2FuZG9yLnl1QG54cC5jb20+
Ci0tLQogZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL2Nkbi1kcC1yZWcuYyB8IDQgKystLQogMSBm
aWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvY2RuLWRwLXJlZy5jIGIvZHJpdmVycy9ncHUvZHJt
L3JvY2tjaGlwL2Nkbi1kcC1yZWcuYwppbmRleCA2YzhiMTRmLi4wYTJhZWJlIDEwMDY0NAotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvY2RuLWRwLXJlZy5jCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9yb2NrY2hpcC9jZG4tZHAtcmVnLmMKQEAgLTU0Myw3ICs1NDMsNyBAQCBzdGF0aWMgaW50
IGNkbl9kcF9nZXRfdHJhaW5pbmdfc3RhdHVzKHN0cnVjdCBjZG5fZHBfZGV2aWNlICpkcCkKIAlp
ZiAocmV0KQogCQlnb3RvIGVycl9nZXRfdHJhaW5pbmdfc3RhdHVzOwogCi0JZHAtPmxpbmsucmF0
ZSA9IHN0YXR1c1swXTsKKwlkcC0+bGluay5yYXRlID0gZHJtX2RwX2J3X2NvZGVfdG9fbGlua19y
YXRlKHN0YXR1c1swXSk7CiAJZHAtPmxpbmsubnVtX2xhbmVzID0gc3RhdHVzWzFdOwogCiBlcnJf
Z2V0X3RyYWluaW5nX3N0YXR1czoKQEAgLTY0Nyw3ICs2NDcsNyBAQCBpbnQgY2RuX2RwX2NvbmZp
Z192aWRlbyhzdHJ1Y3QgY2RuX2RwX2RldmljZSAqZHApCiAJYml0X3Blcl9waXggPSAodmlkZW8t
PmNvbG9yX2ZtdCA9PSBZQ0JDUl80XzJfMikgPwogCQkgICAgICAodmlkZW8tPmNvbG9yX2RlcHRo
ICogMikgOiAodmlkZW8tPmNvbG9yX2RlcHRoICogMyk7CiAKLQlsaW5rX3JhdGUgPSBkcm1fZHBf
YndfY29kZV90b19saW5rX3JhdGUoZHAtPmxpbmsucmF0ZSkgLyAxMDAwOworCWxpbmtfcmF0ZSA9
IGRwLT5saW5rLnJhdGUgLyAxMDAwOwogCiAJcmV0ID0gY2RuX2RwX3JlZ193cml0ZShkcCwgQk5E
X0hTWU5DMlZTWU5DLCBWSUZfQllQQVNTX0lOVEVSTEFDRSk7CiAJaWYgKHJldCkKLS0gCjIuNy40
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
