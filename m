Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 68FD4B7440
	for <lists+dri-devel@lfdr.de>; Thu, 19 Sep 2019 09:36:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12C536FA49;
	Thu, 19 Sep 2019 07:36:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A2AE6F468
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Sep 2019 06:17:20 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id a24so1272334pgj.2
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Sep 2019 23:17:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=TTVL9tvcC/vblrk69APZe2JtNjVnFcPeBrBZDhnwSec=;
 b=P4uppcPLCDr69M/s/H6WaovqNW5SVV7EZj/V8WHOMLb/RNmHRU9dlEOQC5ZYXAfUQi
 t3swOHUO+gLQ6JQxMQGz+xNoHnNY8Sbal1g9EJgq2l/S27ux8lj0mUDKInsANkEpNdK/
 grXxju8hcvtXB2XJm3KmJzMkboE2JaJbz9vi8LASjWAMN5MrAsNQq7NhfTZsKrvgWzXq
 nkgiwZrFlIrMHIu1wfPuTYP9ncpN5KxQYL7z7ih0cf7RALEuR75kpNkLHsZR/Rxygyn0
 KpaeZJD/p6ws6VrLMtMTdlXoqJbWhgLlNw563K8ZnmwvILDeLIBfjg5imjtjcfrjX1ok
 8KUw==
X-Gm-Message-State: APjAAAX+l3jTYxSX88P+ywh/71m1CLLMY3u09GSJCYYacUFbRVkcnka8
 meBuzFGhk5vFQjUe4pvga/YHNCJoHoc=
X-Google-Smtp-Source: APXvYqxODwCVhm2r+5PpSEFKEAaTEucvvu2WEhyEhtiGJ1l0PTLEx3C8pKv9UwmBbRi8YIFjTQEcjw==
X-Received: by 2002:a17:90a:1c01:: with SMTP id
 s1mr1940572pjs.76.1568873839945; 
 Wed, 18 Sep 2019 23:17:19 -0700 (PDT)
Received: from super-sugar.huaqin.com ([101.78.151.194])
 by smtp.gmail.com with ESMTPSA id s7sm4291542pjn.8.2019.09.18.23.17.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Sep 2019 23:17:19 -0700 (PDT)
From: Jerry Han <jerry.han.hq@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/9] [v10,
 3/9] drm/panel: Add Boe Himax8279d MIPI-DSI LCD panel
Date: Thu, 19 Sep 2019 14:17:13 +0800
Message-Id: <20190919061713.2334-1-jerry.han.hq@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Thu, 19 Sep 2019 07:35:45 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=TTVL9tvcC/vblrk69APZe2JtNjVnFcPeBrBZDhnwSec=;
 b=thSqBJrxxohxmlcLiKD5jv4YUm1XfA+c8IEzbELzPdWW03R22RfGfwn7MZUFssO2B6
 e8GSfgokrYKeuFLiQjxDrWfn9/GpdnkueaPlTEN/00vyi9dJMyoBGTe/lQppbqZ7W8fs
 JTUZJS7x7Ahee9Q22/YEDMd8DZtKn2BE2mqOePSYS/UExKX9O6PR6p72VwFKDGcrNz9t
 g7wVCPnXRlDQ6h3UIFJqtvuRJ2GcupQIiKj9+juf9bVGurwFO5linbllSQBUq1GPRmL5
 3Wyf+2faSTaXftMsFpPtVaiP8MOYq4k0Mys6CLh6ElonE1hs8sKe2XPUpR/4Y7guPEsF
 31MQ==
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
 YH Lin <yueherngl@chromium.org>, Nick Sanders <nsanders@google.com>,
 Jerry Han <hanxu5@huaqin.corp-partner.google.com>,
 Rock wang <rock_wang@himax.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U3VwcG9ydCBCb2UgSGltYXg4Mjc5ZCA4LjAiIDEyMDB4MTkyMCBURlQgTENEIHBhbmVsLCBpdCBp
cyBhIE1JUEkgRFNJCnBhbmVsLgoKVjM6Ci0gUmVtb3ZlIHVubmVjZXNzYXJ5IGRlbGF5cyBpbiBz
ZW5kaW5nIGluaXRpYWxpemF0aW9uIGNvbW1hbmRzIChKaXRhbyBTaGkpCgpWMjoKLSBVc2UgU1BE
WCBpZGVudGlmaWVyIChTYW0pCi0gVXNlIG5lY2Vzc2FyeSBoZWFkZXIgZmlsZXMgcmVwbGFjZSBk
cm1QLmggKFNhbSkKLSBEZWxldGUgdW5uZWNlc3NhcnkgaGVhZGVyIGZpbGVzICNpbmNsdWRlIDxs
aW51eC9lcnIuaD4gKFNhbSkKLSBTcGVjaWZpZXMgYSBHUElPcyBhcnJheSB0byBjb250cm9sIHRo
ZSByZXNldCB0aW1pbmcsCiAgICBpbnN0ZWFkIG9mIHJlYWRpbmcgImRzaS1yZXNldC1zZXF1ZW5j
ZSIgZGF0YSBmcm9tIERUUyAoU2FtKQotIERlbGV0ZSBiYWNrbGlnaHRfZGlzYWJsZSgpIGZ1bmN0
aW9uIHdoZW4gYWxyZWFkeSBkaXNhYmxlZCAoU2FtKQotIFVzZSBkZXZtX29mX2ZpbmRfYmFja2xp
Z2h0KCkgcmVwbGFjZSBvZl9maW5kX2JhY2tsaWdodF9ieV9ub2RlKCkgKFNhbSkKLSBNb3ZlIHRo
ZSBuZWNlc3NhcnkgZGF0YSBpbiB0aGUgRFRTIHRvIHRoZSBjdXJyZW50IGZpbGUsCiAgICBsaWtl
IHBvcmNoLCBkaXNwbGF5X21vZGUgYW5kIEluaXQgY29kZSBldGMuIChTYW0pCi0gQWRkIGNvbXBh
dGlibGUgZGV2aWNlICJib2UsaGltYXg4Mjc5ZDEwcCIgKFNhbSkKClYxOgotIFN1cHBvcnQgQm9l
IEhpbWF4ODI3OWQgOC4wIiAxMjAweDE5MjAgVEZUIExDRCBwYW5lbCwgaXQgaXMgYSBNSVBJIERT
SQogICAgcGFuZWwuCgpTaWduZWQtb2ZmLWJ5OiBKZXJyeSBIYW4gPGhhbnh1NUBodWFxaW4uY29y
cC1wYXJ0bmVyLmdvb2dsZS5jb20+CkNjOiBKaXRhbyBTaGkgPGppdGFvLnNoaUBtZWRpYXRlay5j
b20+CkNjOiBOaWNrIFNhbmRlcnMgPG5zYW5kZXJzQGdvb2dsZS5jb20+CkNjOiBZSCBMaW4gPHl1
ZWhlcm5nbEBjaHJvbWl1bS5vcmc+CkNjOiBSb2NrIHdhbmcgPHJvY2tfd2FuZ0BoaW1heC5jb20u
Y24+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLWJvZS1oaW1heDgyNzlkLmMgfCAx
MSArKysrKysrLS0tLQogMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtYm9lLWhpbWF4
ODI3OWQuYyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1ib2UtaGltYXg4Mjc5ZC5jCmlu
ZGV4IDgzNmE5Y2JjNTg5MS4uNjBmNWY4YmYyZTE0IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vcGFuZWwvcGFuZWwtYm9lLWhpbWF4ODI3OWQuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vcGFu
ZWwvcGFuZWwtYm9lLWhpbWF4ODI3OWQuYwpAQCAtMTE5LDggKzExOSw5IEBAIHN0YXRpYyBpbnQg
cGFuZWxfdW5wcmVwYXJlKHN0cnVjdCBkcm1fcGFuZWwgKnBhbmVsKQogCQkJCQllcnIpOwogCQkJ
CWdvdG8gcG93ZXJvZmY7CiAJCQl9Ci0JCQl1c2xlZXBfcmFuZ2UoKGNtZC0+ZGF0YVswXSkgKiAx
MDAwLAotCQkJCSAgICAoMSArIGNtZC0+ZGF0YVswXSkgKiAxMDAwKTsKKwkJCWlmIChjbWQtPmRh
dGFbMF0pCisJCQkJdXNsZWVwX3JhbmdlKChjbWQtPmRhdGFbMF0pICogMTAwMCwKKwkJCQkJICAg
ICgxICsgY21kLT5kYXRhWzBdKSAqIDEwMDApOwogCQl9CiAJfQogCkBAIC0xODcsOCArMTg4LDEw
IEBAIHN0YXRpYyBpbnQgcGFuZWxfcHJlcGFyZShzdHJ1Y3QgZHJtX3BhbmVsICpwYW5lbCkKIAkJ
CQkJZXJyKTsKIAkJCQlnb3RvIHBvd2Vyb2ZmOwogCQkJfQotCQkJdXNsZWVwX3JhbmdlKGNtZC0+
ZGF0YVswXSAqIDEwMDAsCi0JCQkJICAgICgxICsgY21kLT5kYXRhWzBdKSAqIDEwMDApOworCisJ
CQlpZiAoY21kLT5kYXRhWzBdKQorCQkJCXVzbGVlcF9yYW5nZShjbWQtPmRhdGFbMF0gKiAxMDAw
LAorCQkJCQkgICAgKDEgKyBjbWQtPmRhdGFbMF0pICogMTAwMCk7CiAJCX0KIAl9CiAKLS0gCjIu
MTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
