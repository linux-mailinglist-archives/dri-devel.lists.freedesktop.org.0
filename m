Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 597ACB742D
	for <lists+dri-devel@lfdr.de>; Thu, 19 Sep 2019 09:35:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBBDB6F728;
	Thu, 19 Sep 2019 07:35:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57EDA6F4C1
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Sep 2019 06:17:51 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id s1so138423pgv.8
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Sep 2019 23:17:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=6rLH/KYpoERkeQDUwY/g0kKvSdaqXj9l05vZFi3kAjw=;
 b=bLihcvdVofdr7qwS2ti+ptsv+Q2Ss2bDCl6NXS70x05eZzlTfZTRjGN2iMAiNWoB8u
 YuhqRUWLrcO/G2MTHnA3WF3JOIWAjMYoDLEXaHy6dKCX8cUbfdFQbalX5eYAOK4USuV2
 996S1zaocykMFFfZqfJYokyxRUrnQrnYnT9VrtHv7dZT+Upao+MRKz3owWqMrPYTGR7c
 MOqBpP8x/PP2YosdnZzCJBaSSV9MTIuASca2mIjSRpBO1AoH9MjofKj0tYXJNBzAo2ZM
 4vrGP2fcnU4TLk1ml9/lOt+em0vbncXnpvDeNWFCx3PeupbMI9G1BJk6EUOLdDYbHDei
 Ks0Q==
X-Gm-Message-State: APjAAAVzqC2UAiQse5IoW3yw8dDBq980XYUMMZZSPKP/k/R0dnYJ1Smk
 IQ/P1xa8/kLY53HBqGGnvwEFHInvDSs=
X-Google-Smtp-Source: APXvYqzASW2m4fzEXUZGV+FEU+2XyVS7ca0md/dEM1cMh/Pu+SyKliBFMmvNJPyEi2xLuN4wvkSmig==
X-Received: by 2002:a17:90a:3aa6:: with SMTP id
 b35mr1928083pjc.94.1568873870810; 
 Wed, 18 Sep 2019 23:17:50 -0700 (PDT)
Received: from super-sugar.huaqin.com ([101.78.151.194])
 by smtp.gmail.com with ESMTPSA id p88sm4367416pjp.22.2019.09.18.23.17.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Sep 2019 23:17:50 -0700 (PDT)
From: Jerry Han <jerry.han.hq@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 5/9] [v10,
 5/9] drm/panel: Add Boe Himax8279d MIPI-DSI LCD panel
Date: Thu, 19 Sep 2019 14:17:45 +0800
Message-Id: <20190919061745.2589-1-jerry.han.hq@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Thu, 19 Sep 2019 07:35:45 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=6rLH/KYpoERkeQDUwY/g0kKvSdaqXj9l05vZFi3kAjw=;
 b=GEVxn49mumF8g5uvkIB57Tu7QtJIYxp5vdXv5ado5BIdtKuzgK9zOabJAq17zPGhEI
 qqPjZZW/WHPe9K8BUqfOklUUYCCtqPJntByRfrh5umk5R9deQ0vXkF/9ESLl/9cty+W0
 d1aG4ycc+1LenOzswaeVwwq+P/TB2/OvaUXGsyeF3gGeSBxCfDhSqucAfokgowyWEk+c
 HQNhENBBIMl2xpEosvsIiGsSc4rkGduzPrTOiqdFfr+1wnxy8ysF14TLpOEpNdyd885B
 8DgG0dq88OnDI1E77EInD8Ixc6P9E/s6x8M1N1QiiDj3pigBGZU5ttFVBF2EWw2rSQBy
 poYA==
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
Cc: Derek Basehore <dbasehore@chromium.org>, Jerry Han <jerry.han.hq@gmail.com>,
 Jitao Shi <jitao.shi@mediatek.com>,
 Jerry Han <hanxu5@huaqin.corp-partner.google.com>,
 Rock wang <rock_wang@himax.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U3VwcG9ydCBCb2UgSGltYXg4Mjc5ZCA4LjAiIDEyMDB4MTkyMCBURlQgTENEIHBhbmVsLCBpdCBp
cyBhIE1JUEkgRFNJCnBhbmVsLgoKVjU6Ci0gQWRkIHRoZSBpbmZvcm1hdGlvbiBvZiB0aGUgcmV2
aWV3ZXIgKFNhbSkKLSBEZWxldGUgdW5uZWNlc3NhcnkgaGVhZGVyIGZpbGVzICNpbmNsdWRlIDxs
aW51eC9mYi5oPiAoU2FtKQotIFRoZSBjb25maWcgRFJNX1BBTkVMX0JPRV9ISU1BWDgyNzlEIGFw
cGVhcnMgdHdpY2UuIERyb3Agb25lIG9mIHRoZW0gKFNhbSkKLSBBREQgc3RhdGljLCBzZXRfZ3Bp
b3MgZnVuY3Rpb24gaXMgbm90IHVzZWQgb3V0c2lkZSB0aGlzIG1vZHVsZSAoU2FtKQoKVjQ6Ci0g
RnJlZml4IGFsbCBmdW5jdGlvbiBtYWVzIHdpdGggYm9lXyAoU2FtKQotIEZzZWQgImVuYWJsZV9n
cGlvIiByZXBsYWNlICJyZXNldF9ncGlvIiwgTWFrZSBpdCBsb29rIGNsZWFyZXIgKFNhbSkKLSBT
b3J0IGluY2x1ZGUgbGluZXMgYWxwaGFiZXRpY2FsbHkgKFNhbSkKLSBGaXhlZCBlbnRyaWVzIGlu
IHRoZSBtYWtlZmlsZSBtdXN0IGJlIHNvcnRlZCBhbHBoYWJldGljYWxseSAoU2FtKQotIEFkZCBz
ZW5kX21pcGlfY21kcyBmdW5jdGlvbiB0byBhdm9pZCBkdXBsaWNhdGluZyB0aGUgY29kZSAoU2Ft
KQotIEFkZCB0aGUgbmVjZXNzYXJ5IGRlbGF5KHJlc2V0X2RlbGF5X3Q1KSBiZXR3ZWVuIHJlc2V0
IGFuZCBzZW5kaW5nCiAgICB0aGUgaW5pdGlhbGl6YXRpb24gY29tbWFuZCAoUm9jayB3YW5nKQoK
VjM6Ci0gUmVtb3ZlIHVubmVjZXNzYXJ5IGRlbGF5cyBpbiBzZW5kaW5nIGluaXRpYWxpemF0aW9u
IGNvbW1hbmRzIChKaXRhbyBTaGkpCgpWMjoKLSBVc2UgU1BEWCBpZGVudGlmaWVyIChTYW0pCi0g
VXNlIG5lY2Vzc2FyeSBoZWFkZXIgZmlsZXMgcmVwbGFjZSBkcm1QLmggKFNhbSkKLSBEZWxldGUg
dW5uZWNlc3NhcnkgaGVhZGVyIGZpbGVzICNpbmNsdWRlIDxsaW51eC9lcnIuaD4gKFNhbSkKLSBT
cGVjaWZpZXMgYSBHUElPcyBhcnJheSB0byBjb250cm9sIHRoZSByZXNldCB0aW1pbmcsCiAgICBp
bnN0ZWFkIG9mIHJlYWRpbmcgImRzaS1yZXNldC1zZXF1ZW5jZSIgZGF0YSBmcm9tIERUUyAoU2Ft
KQotIERlbGV0ZSBiYWNrbGlnaHRfZGlzYWJsZSgpIGZ1bmN0aW9uIHdoZW4gYWxyZWFkeSBkaXNh
YmxlZCAoU2FtKQotIFVzZSBkZXZtX29mX2ZpbmRfYmFja2xpZ2h0KCkgcmVwbGFjZSBvZl9maW5k
X2JhY2tsaWdodF9ieV9ub2RlKCkgKFNhbSkKLSBNb3ZlIHRoZSBuZWNlc3NhcnkgZGF0YSBpbiB0
aGUgRFRTIHRvIHRoZSBjdXJyZW50IGZpbGUsCiAgICBsaWtlIHBvcmNoLCBkaXNwbGF5X21vZGUg
YW5kIEluaXQgY29kZSBldGMuIChTYW0pCi0gQWRkIGNvbXBhdGlibGUgZGV2aWNlICJib2UsaGlt
YXg4Mjc5ZDEwcCIgKFNhbSkKClYxOgotIFN1cHBvcnQgQm9lIEhpbWF4ODI3OWQgOC4wIiAxMjAw
eDE5MjAgVEZUIExDRCBwYW5lbCwgaXQgaXMgYSBNSVBJIERTSQogICAgcGFuZWwuCgpTaWduZWQt
b2ZmLWJ5OiBKZXJyeSBIYW4gPGhhbnh1NUBodWFxaW4uY29ycC1wYXJ0bmVyLmdvb2dsZS5jb20+
ClJldmlld2VkLWJ5OiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+CkNjOiBKaXRhbyBT
aGkgPGppdGFvLnNoaUBtZWRpYXRlay5jb20+CkNjOiBEZXJlayBCYXNlaG9yZSA8ZGJhc2Vob3Jl
QGNocm9taXVtLm9yZz4KQ2M6IFJvY2sgd2FuZyA8cm9ja193YW5nQGhpbWF4LmNvbS5jbj4KLS0t
CiBkcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtYm9lLWhpbWF4ODI3OWQuYyB8IDMgKy0tCiAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLWJvZS1oaW1heDgyNzlkLmMgYi9kcml2ZXJz
L2dwdS9kcm0vcGFuZWwvcGFuZWwtYm9lLWhpbWF4ODI3OWQuYwppbmRleCBhYTdkOTEyNzk4MTku
LmMwNTBhNDg0ODdhMiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLWJv
ZS1oaW1heDgyNzlkLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLWJvZS1oaW1h
eDgyNzlkLmMKQEAgLTgsNyArOCw2IEBACiAKICNpbmNsdWRlIDxsaW51eC9iYWNrbGlnaHQuaD4K
ICNpbmNsdWRlIDxsaW51eC9kZWxheS5oPgotI2luY2x1ZGUgPGxpbnV4L2ZiLmg+CiAjaW5jbHVk
ZSA8bGludXgva2VybmVsLmg+CiAjaW5jbHVkZSA8bGludXgvbW9kdWxlLmg+CiAjaW5jbHVkZSA8
bGludXgvb2YuaD4KQEAgLTcyLDcgKzcxLDcgQEAgc3RhdGljIGlubGluZSBzdHJ1Y3QgcGFuZWxf
aW5mbyAqdG9fcGFuZWxfaW5mbyhzdHJ1Y3QgZHJtX3BhbmVsICpwYW5lbCkKIAlyZXR1cm4gY29u
dGFpbmVyX29mKHBhbmVsLCBzdHJ1Y3QgcGFuZWxfaW5mbywgYmFzZSk7CiB9CiAKLXZvaWQgc2V0
X2dwaW9zKHN0cnVjdCBwYW5lbF9pbmZvICpwaW5mbywgaW50IGVuYWJsZSkKK3N0YXRpYyB2b2lk
IHNldF9ncGlvcyhzdHJ1Y3QgcGFuZWxfaW5mbyAqcGluZm8sIGludCBlbmFibGUpCiB7CiAJZ3Bp
b2Rfc2V0X3ZhbHVlKHBpbmZvLT5lbmFibGVfZ3BpbywgZW5hYmxlKTsKIAlncGlvZF9zZXRfdmFs
dWUocGluZm8tPnBwMzNfZ3BpbywgZW5hYmxlKTsKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
