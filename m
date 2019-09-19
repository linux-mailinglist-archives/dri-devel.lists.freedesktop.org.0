Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 53FA1B7441
	for <lists+dri-devel@lfdr.de>; Thu, 19 Sep 2019 09:36:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF9F26F9B7;
	Thu, 19 Sep 2019 07:36:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E46DC6F4C1
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Sep 2019 06:18:17 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id s1so139015pgv.8
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Sep 2019 23:18:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=erFhC+Y8BCqMphIbiYUXELNsShwwK45DFuHK9KBgzww=;
 b=feV9k4q6bnfhl0ZnVdZXJgdExi044XJDH+FSf1Fqm/KCfmcrLQMVLVZWBeij42NL8u
 bHO9GB01RUYLximlk7Z9x4oDEIch6avcO+2wuQRugIOcCgmqzwFZguCiuNLTiXiWYx2N
 LoFFW3j5ZYYl77zILThX6xZb6Ou3/YvGB8L2HpM6SXT5pK7U8YypyiQ+EhsjNkG7P8et
 zkKim5m7u66UuCWkkOtibdfP9UV8SfZXmazN5Ef9EKKaHt468jJFfMlvRBSH1tp6wz4e
 ZYjkTIu0J/BqPRkz2gbjg9xj8/pr3eI2cur/v1QH4I8fI7g2l9N6g6OXI5wE8jVR7Mbc
 WwnA==
X-Gm-Message-State: APjAAAXn/lKo3e77+x8QPcsbu4mdma5vZf9sHUaI7tUDcvwOX31nCzB8
 JAvQCTVhH0lAPno02b1tE+bMvUswep0=
X-Google-Smtp-Source: APXvYqye7GqZapOhZZepCdYSZjcsKv33XSdIzRXTRiUIdesD1lRv4qQQ7wUWtapVzNySlhjfgdX5WQ==
X-Received: by 2002:aa7:9a92:: with SMTP id w18mr8815223pfi.244.1568873897465; 
 Wed, 18 Sep 2019 23:18:17 -0700 (PDT)
Received: from super-sugar.huaqin.com ([101.78.151.194])
 by smtp.gmail.com with ESMTPSA id p20sm6963869pgj.47.2019.09.18.23.18.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Sep 2019 23:18:17 -0700 (PDT)
From: Jerry Han <jerry.han.hq@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 7/9] [v10,
 7/9] drm/panel: Add Boe Himax8279d MIPI-DSI LCD panel
Date: Thu, 19 Sep 2019 14:18:12 +0800
Message-Id: <20190919061812.2922-1-jerry.han.hq@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Thu, 19 Sep 2019 07:35:45 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=erFhC+Y8BCqMphIbiYUXELNsShwwK45DFuHK9KBgzww=;
 b=JDqV3TKEmBiDIZ5XFYDtxVJ31n2Ev1DuVOpvqdg9mKJmJF4RnR7K4XYHfm7nWXCuru
 0icwsfeMFA8P+52pxJyWsvvjYMjzOHp4v/eK1YZm8TkMRcWwuJ2TLFKLB4HfCDwq00MU
 VsAQju0OL35AR0hekuBtUDirnaE1sLbabX81j0olBTC4HCyqByCuKgqFdh8e3upck/Gp
 vnLAJkVIEW2G6Zthin2I9vMm1vD5QoiW8hpQYoQZIBRSJq/guhOsdjGZNsKEp4RvpnMk
 2L1/MvoEk/MCLOC224erWv/gb15PvhofFEhPJtzH8t8DyZ+wwVrzPQXZUcOSijPwMNbY
 GRFg==
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
Cc: Jerry Han <jerry.han.hq@gmail.com>, Jitao Shi <jitao.shi@mediatek.com>,
 Rock wang <rock_wang@himax.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U3VwcG9ydCBCb2UgSGltYXg4Mjc5ZCA4LjAiIDEyMDB4MTkyMCBURlQgTENEIHBhbmVsLCBpdCBp
cyBhIE1JUEkgRFNJCnBhbmVsLgoKVjc6Ci0gTW9kaWZ5IGNvbW11bmljYXRpb24gYWRkcmVzcwoK
VjY6Ci0gQWRkIHRoZSBpbmZvcm1hdGlvbiBvZiB0aGUgcmV2aWV3ZXIKLSBSZW1vdmUgdW5uZWNl
c3NhcnkgZGVsYXlzLCBUaGUgdWRlbGF5X3JhbmdlIGNvZGUgZ3JhY2VmdWxseSByZXR1cm5zCiAg
ICB3aXRob3V0IGhpdHRpbmcgdGhlIHNjaGVkdWxlciBvbiBhIGRlbGF5IG9mIDAuIChEZXJlaykK
LSBNZXJnZSB0aGUgc2FtZSBkYXRhIHN0cnVjdHVyZXMsIGxpa2UgZGlzcGxheV9tb2RlIGFuZCBv
ZmZfY21kcyAoRGVyZWspCi0gT3B0aW1pemUgdGhlIHByb2Nlc3Npbmcgb2YgcmVzdWx0cyByZXR1
cm5lZCBieQogICAgZGV2bV9ncGlvZF9nZXRfb3B0aW9uYWwgKERlcmVrKQoKVjU6Ci0gQWRkIHRo
ZSBpbmZvcm1hdGlvbiBvZiB0aGUgcmV2aWV3ZXIgKFNhbSkKLSBEZWxldGUgdW5uZWNlc3Nhcnkg
aGVhZGVyIGZpbGVzICNpbmNsdWRlIDxsaW51eC9mYi5oPiAoU2FtKQotIFRoZSBjb25maWcgRFJN
X1BBTkVMX0JPRV9ISU1BWDgyNzlEIGFwcGVhcnMgdHdpY2UuIERyb3Agb25lIG9mIHRoZW0gKFNh
bSkKLSBBREQgc3RhdGljLCBzZXRfZ3Bpb3MgZnVuY3Rpb24gaXMgbm90IHVzZWQgb3V0c2lkZSB0
aGlzIG1vZHVsZSAoU2FtKQoKVjQ6Ci0gRnJlZml4IGFsbCBmdW5jdGlvbiBtYWVzIHdpdGggYm9l
XyAoU2FtKQotIEZzZWQgImVuYWJsZV9ncGlvIiByZXBsYWNlICJyZXNldF9ncGlvIiwgTWFrZSBp
dCBsb29rIGNsZWFyZXIgKFNhbSkKLSBTb3J0IGluY2x1ZGUgbGluZXMgYWxwaGFiZXRpY2FsbHkg
KFNhbSkKLSBGaXhlZCBlbnRyaWVzIGluIHRoZSBtYWtlZmlsZSBtdXN0IGJlIHNvcnRlZCBhbHBo
YWJldGljYWxseSAoU2FtKQotIEFkZCBzZW5kX21pcGlfY21kcyBmdW5jdGlvbiB0byBhdm9pZCBk
dXBsaWNhdGluZyB0aGUgY29kZSAoU2FtKQotIEFkZCB0aGUgbmVjZXNzYXJ5IGRlbGF5KHJlc2V0
X2RlbGF5X3Q1KSBiZXR3ZWVuIHJlc2V0IGFuZCBzZW5kaW5nCiAgICB0aGUgaW5pdGlhbGl6YXRp
b24gY29tbWFuZCAoUm9jayB3YW5nKQoKVjM6Ci0gUmVtb3ZlIHVubmVjZXNzYXJ5IGRlbGF5cyBp
biBzZW5kaW5nIGluaXRpYWxpemF0aW9uIGNvbW1hbmRzIChKaXRhbyBTaGkpCgpWMjoKLSBVc2Ug
U1BEWCBpZGVudGlmaWVyIChTYW0pCi0gVXNlIG5lY2Vzc2FyeSBoZWFkZXIgZmlsZXMgcmVwbGFj
ZSBkcm1QLmggKFNhbSkKLSBEZWxldGUgdW5uZWNlc3NhcnkgaGVhZGVyIGZpbGVzICNpbmNsdWRl
IDxsaW51eC9lcnIuaD4gKFNhbSkKLSBTcGVjaWZpZXMgYSBHUElPcyBhcnJheSB0byBjb250cm9s
IHRoZSByZXNldCB0aW1pbmcsCiAgICBpbnN0ZWFkIG9mIHJlYWRpbmcgImRzaS1yZXNldC1zZXF1
ZW5jZSIgZGF0YSBmcm9tIERUUyAoU2FtKQotIERlbGV0ZSBiYWNrbGlnaHRfZGlzYWJsZSgpIGZ1
bmN0aW9uIHdoZW4gYWxyZWFkeSBkaXNhYmxlZCAoU2FtKQotIFVzZSBkZXZtX29mX2ZpbmRfYmFj
a2xpZ2h0KCkgcmVwbGFjZSBvZl9maW5kX2JhY2tsaWdodF9ieV9ub2RlKCkgKFNhbSkKLSBNb3Zl
IHRoZSBuZWNlc3NhcnkgZGF0YSBpbiB0aGUgRFRTIHRvIHRoZSBjdXJyZW50IGZpbGUsCiAgICBs
aWtlIHBvcmNoLCBkaXNwbGF5X21vZGUgYW5kIEluaXQgY29kZSBldGMuIChTYW0pCi0gQWRkIGNv
bXBhdGlibGUgZGV2aWNlICJib2UsaGltYXg4Mjc5ZDEwcCIgKFNhbSkKClYxOgotIFN1cHBvcnQg
Qm9lIEhpbWF4ODI3OWQgOC4wIiAxMjAweDE5MjAgVEZUIExDRCBwYW5lbCwgaXQgaXMgYSBNSVBJ
IERTSQogICAgcGFuZWwuCgpTaWduZWQtb2ZmLWJ5OiBKZXJyeSBIYW4gPGplcnJ5Lmhhbi5ocUBn
bWFpbC5jb20+ClJldmlld2VkLWJ5OiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+ClJl
dmlld2VkLWJ5OiBEZXJlayBCYXNlaG9yZSA8ZGJhc2Vob3JlQGNocm9taXVtLm9yZz4KQ2M6IEpp
dGFvIFNoaSA8aml0YW8uc2hpQG1lZGlhdGVrLmNvbT4KQ2M6IFJvY2sgd2FuZyA8cm9ja193YW5n
QGhpbWF4LmNvbS5jbj4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtYm9lLWhpbWF4
ODI3OWQuYyB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtYm9lLWhp
bWF4ODI3OWQuYyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1ib2UtaGltYXg4Mjc5ZC5j
CmluZGV4IGZmNWE4OWUzOGZkNy4uOWM4ZWNlNGZhMzBhIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vcGFuZWwvcGFuZWwtYm9lLWhpbWF4ODI3OWQuYworKysgYi9kcml2ZXJzL2dwdS9kcm0v
cGFuZWwvcGFuZWwtYm9lLWhpbWF4ODI3OWQuYwpAQCAtMiw3ICsyLDcgQEAKIC8qCiAgKiBDb3B5
cmlnaHQgKGMpIDIwMTksIEh1YXFpbiBUZWxlY29tIFRlY2hub2xvZ3kgQ28uLCBMdGQKICAqCi0g
KiBBdXRob3I6IEplcnJ5IEhhbiA8aGFueHU1QGh1YXFpbi5jb3JwLXBhcnRuZXIuZ29vZ2xlLmNv
bT4KKyAqIEF1dGhvcjogSmVycnkgSGFuIDxqZXJyeS5oYW4uaHFAZ21haWwuY29tPgogICoKICAq
LwogCkBAIC0xMDQ1LDYgKzEwNDUsNiBAQCBzdGF0aWMgc3RydWN0IG1pcGlfZHNpX2RyaXZlciBw
YW5lbF9kcml2ZXIgPSB7CiB9OwogbW9kdWxlX21pcGlfZHNpX2RyaXZlcihwYW5lbF9kcml2ZXIp
OwogCi1NT0RVTEVfQVVUSE9SKCJKZXJyeSBIYW4gPGhhbnh1NUBodWFxaW4uY29ycC1wYXJ0bmVy
Lmdvb2dsZS5jb20+Iik7CitNT0RVTEVfQVVUSE9SKCJKZXJyeSBIYW4gPGplcnJ5Lmhhbi5ocUBn
bWFpbC5jb20+Iik7CiBNT0RVTEVfREVTQ1JJUFRJT04oIkJvZSBIaW1heDgyNzlkIGRyaXZlciIp
OwogTU9EVUxFX0xJQ0VOU0UoIkdQTCB2MiIpOwotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
