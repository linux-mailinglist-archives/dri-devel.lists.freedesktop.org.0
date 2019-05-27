Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A2712AFF8
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2019 10:19:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5E758991C;
	Mon, 27 May 2019 08:19:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 494F689951
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2019 08:19:26 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id s17so15993312wru.3
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2019 01:19:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DZcPJUtjgv9EKQIqfc2FSo+GKmCjWmQE5625uXYlrlA=;
 b=n0ilZVNC9nsS35ooVsCyjWX5rM+uNhoBj5gez1zhunAvftSxgNeN44i1+KSXG6+Uc7
 NsLyczpfoUvUAsMO1v33O4nLYLA7YEUj6wwojctF8nwUHCUoXCRy7A0GEjc+v56bFsEd
 mBbI0yEb4X2UdR1M0uJJLTEWYB11+x2gI4OVX9SWPs0BrE0Mud3In3NmlXILYg7805uB
 6PEvL4BRetXxdxL30qLiZStU7h1VXZIRQQ5FXXq5g3CSxeQvIZcVTJTo1gUwU3P3JDLt
 JG6KDF87yLbJzzpQbSwrIW3pE4bPajH74fQSUpyphjg+OgYY+uXzM3KEkNKy2FTlUrf+
 N+yA==
X-Gm-Message-State: APjAAAWPgppUPjMsdsO7RldKm+roaINLUAXnkt6YMA7gtjiDyjzepXD2
 6eLuyHwUbV1c+PkOgWCsm1+C6pY+
X-Google-Smtp-Source: APXvYqzMUlVUW1Fwkfu+vXmFld07AUFTq1e+L/MqAXuH3JsdS1HFlDTJU4RcRBYJ6EAhvXmA9RkgZQ==
X-Received: by 2002:adf:c601:: with SMTP id n1mr67879516wrg.49.1558945164454; 
 Mon, 27 May 2019 01:19:24 -0700 (PDT)
Received: from localhost.localdomain
 (cpc91192-cmbg18-2-0-cust374.5-4.cable.virginm.net. [80.6.113.119])
 by smtp.gmail.com with ESMTPSA id a124sm7511876wmh.3.2019.05.27.01.19.23
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 27 May 2019 01:19:23 -0700 (PDT)
From: Emil Velikov <emil.l.velikov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 11/13] drm/vgem: drop DRM_AUTH usage from the driver
Date: Mon, 27 May 2019 09:17:39 +0100
Message-Id: <20190527081741.14235-11-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190527081741.14235-1-emil.l.velikov@gmail.com>
References: <20190527081741.14235-1-emil.l.velikov@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DZcPJUtjgv9EKQIqfc2FSo+GKmCjWmQE5625uXYlrlA=;
 b=h4xR1VSZE1+WbCvh2FlqTbo5Ulw13wVRkWOiMgc+L0GFvU5NHF8UQDFYpbKPKEGjVf
 kOxwB5Rj9k5vg6Lo6V8uWvD0ZTFmYmxFf9CpNlLRndLawPyytMOK8pdL5Kb28vBZbycv
 koR6wDWBJuf0XnVF09praX9lQ/GdOWxGY7NwkbGAiW57cprdN4Mp+Ewk6r0OBbeKqyV7
 EvfQZp/mblPS38RTmRB92JhTgp5DVLjUbVOL5j9JWDPuWaha0vNs2ghvIZEsTDLVCb2g
 /135Va/9sYrZuPgib9i476nrYZkznv0QdcxTUQG/Bb/YSxHipWEFeUUOZzqbNOoY15PU
 UTyg==
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
Cc: David Airlie <airlied@linux.ie>, emil.l.velikov@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogRW1pbCBWZWxpa292IDxlbWlsLnZlbGlrb3ZAY29sbGFib3JhLmNvbT4KClRoZSBhdXRo
ZW50aWNhdGlvbiBjYW4gYmUgY2lyY3VtdmVudGVkLCBieSBkZXNpZ24sIGJ5IHVzaW5nIHRoZSBy
ZW5kZXIKbm9kZS4KCkZyb20gdGhlIGRyaXZlciBQT1YgdGhlcmUgaXMgbm8gZGlzdGluY3Rpb24g
YmV0d2VlbiBwcmltYXJ5IGFuZCByZW5kZXIKbm9kZXMsIHRodXMgd2UgY2FuIGRyb3AgdGhlIHRv
a2VuLgoKQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KQ2M6IERhbmllbCBWZXR0
ZXIgPGRhbmllbEBmZndsbC5jaD4KU2lnbmVkLW9mZi1ieTogRW1pbCBWZWxpa292IDxlbWlsLnZl
bGlrb3ZAY29sbGFib3JhLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vdmdlbS92Z2VtX2Rydi5j
IHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS92Z2VtL3ZnZW1fZHJ2LmMgYi9kcml2ZXJz
L2dwdS9kcm0vdmdlbS92Z2VtX2Rydi5jCmluZGV4IDExYThmOTliYTE4Yy4uMGJhMDc5ZjFiMzAy
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vdmdlbS92Z2VtX2Rydi5jCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS92Z2VtL3ZnZW1fZHJ2LmMKQEAgLTI0Niw4ICsyNDYsOCBAQCBzdGF0aWMgaW50
IHZnZW1fZ2VtX2R1bWJfbWFwKHN0cnVjdCBkcm1fZmlsZSAqZmlsZSwgc3RydWN0IGRybV9kZXZp
Y2UgKmRldiwKIH0KIAogc3RhdGljIHN0cnVjdCBkcm1faW9jdGxfZGVzYyB2Z2VtX2lvY3Rsc1td
ID0gewotCURSTV9JT0NUTF9ERUZfRFJWKFZHRU1fRkVOQ0VfQVRUQUNILCB2Z2VtX2ZlbmNlX2F0
dGFjaF9pb2N0bCwgRFJNX0FVVEh8RFJNX1JFTkRFUl9BTExPVyksCi0JRFJNX0lPQ1RMX0RFRl9E
UlYoVkdFTV9GRU5DRV9TSUdOQUwsIHZnZW1fZmVuY2Vfc2lnbmFsX2lvY3RsLCBEUk1fQVVUSHxE
Uk1fUkVOREVSX0FMTE9XKSwKKwlEUk1fSU9DVExfREVGX0RSVihWR0VNX0ZFTkNFX0FUVEFDSCwg
dmdlbV9mZW5jZV9hdHRhY2hfaW9jdGwsIERSTV9SRU5ERVJfQUxMT1cpLAorCURSTV9JT0NUTF9E
RUZfRFJWKFZHRU1fRkVOQ0VfU0lHTkFMLCB2Z2VtX2ZlbmNlX3NpZ25hbF9pb2N0bCwgRFJNX1JF
TkRFUl9BTExPVyksCiB9OwogCiBzdGF0aWMgaW50IHZnZW1fbW1hcChzdHJ1Y3QgZmlsZSAqZmls
cCwgc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEpCi0tIAoyLjIxLjAKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
