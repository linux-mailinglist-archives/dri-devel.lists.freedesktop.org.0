Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A78CEAA10F
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2019 13:17:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BEE86E071;
	Thu,  5 Sep 2019 11:17:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D4036E071
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Sep 2019 11:16:59 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id i78so1652146qke.11
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Sep 2019 04:16:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=1RtJ0DInKStLNm7nRRLdODfCYZfUMUe8UxnFTe9vEuw=;
 b=JAso2SWzs3lAmfgmQNMrKArr05az0ym2d+TDvu8eq9+rOZRjBePDZy2no9sEt0I1B4
 5T8HrIXi1w3CBMznL0/FPo8ZC58ax2CR6rlP/5+/U1gA6HN7tR47rEaQxVWR5SNFQXou
 DhG67dFWjGMwB8oNhfsL9tqbQBPikzch1LOcrUgWo4Ynv8K7opU7s7QaHrlzSOg+hLwX
 jg96OBWm11v+IPVy5NraO1atgW+3gOKK4/BWijcf+gQ4kzwWp6XcFsPmZ9mgUOB+x6Zn
 EBhxreGB/tH407rUCN/pk1XeCDOHiD5hHOyBLgB1Bo0xByYXPKEDq0veq0XWcDSjvhwT
 kxyw==
X-Gm-Message-State: APjAAAWFMjBfAb7A8t/zSmXyjTJnRpzEEyovk5nSKtB++oi38cCP/rqG
 eH6PPzaZqA8zWbjk8MCfpA7GcvzJ
X-Google-Smtp-Source: APXvYqxSGWC4onoTEz0DUnOdi4eFadkrQp9G8tRvV5mvqBpu33ZnuFM9J/pomGZcFWv51KhkMx3khg==
X-Received: by 2002:a05:620a:234:: with SMTP id
 u20mr2283723qkm.11.1567682218167; 
 Thu, 05 Sep 2019 04:16:58 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:482:9a5::1])
 by smtp.gmail.com with ESMTPSA id b192sm925416qkg.39.2019.09.05.04.16.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Sep 2019 04:16:57 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: robdclark@gmail.com
Subject: [PATCH] drm/msm/adreno: Do not print error on "qcom,
 gpu-pwrlevels" absence
Date: Thu,  5 Sep 2019 08:16:48 -0300
Message-Id: <20190905111648.11559-1-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=1RtJ0DInKStLNm7nRRLdODfCYZfUMUe8UxnFTe9vEuw=;
 b=pN6dQ/6QyAUzD0+gKffZNDV5d+f3T4tmASOgqkFVxa/4NzL7pR/lj2H0yVMSVI0F3U
 ldlUtNHsO/ZwVdrqtR2oR7bkHO92pZSAXnL0uyhe96aKhZwM4NuhwjN88n27bLG9RDbJ
 rXTJqGQKQEwQCehmilQy0wgg6e6kDIDV7zwhwky7oKdhg6I9QnVmPjcq1OPjiN8CBw7i
 cOyMpxN0vYSOKXp/ckvxRUifajTWtxLQaPuW7EIG42OKR1fkwFddK7BDRo6bo3Osj0Kf
 fvvo7Mr4IAReOosrb3wRf3PkI883Qp4LCtGkhYeONRKnHrosQjJkwNTdsFzd2Kb9HSkG
 El8A==
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
Cc: jonathan@marek.ca, dri-devel@lists.freedesktop.org, sean@poorly.run,
 cphealy@gmail.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Qm9vdGluZyB0aGUgYWRyZW5vIGRyaXZlciBvbiBhIGlteDUzIGJvYXJkIGxlYWRzIHRvIHRoZSBm
b2xsb3dpbmcKZXJyb3IgbWVzc2FnZToKCmFkcmVubyAzMDAwMDAwMC5ncHU6IFtkcm06YWRyZW5v
X2dwdV9pbml0XSAqRVJST1IqIENvdWxkIG5vdCBmaW5kIHRoZSBHUFUgcG93ZXJsZXZlbHMKCkFz
IHRoZSAicWNvbSxncHUtcHdybGV2ZWxzIiBwcm9wZXJ0eSBpcyBvcHRpb25hbCBhbmQgbmV2ZXIg
cHJlc2VudCBvbgppLk1YNSwgdHVybiB0aGUgbWVzc2FnZSBpbnRvIGRlYnVnIGxldmVsIGluc3Rl
YWQuCgpTaWduZWQtb2ZmLWJ5OiBGYWJpbyBFc3RldmFtIDxmZXN0ZXZhbUBnbWFpbC5jb20+Ci0t
LQogZHJpdmVycy9ncHUvZHJtL21zbS9hZHJlbm8vYWRyZW5vX2dwdS5jIHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL21zbS9hZHJlbm8vYWRyZW5vX2dwdS5jIGIvZHJpdmVycy9ncHUvZHJtL21z
bS9hZHJlbm8vYWRyZW5vX2dwdS5jCmluZGV4IDA0OGM4YmU0MjZmMy4uNzNjNzlmMTYxNGMxIDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVuby9hZHJlbm9fZ3B1LmMKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL21zbS9hZHJlbm8vYWRyZW5vX2dwdS5jCkBAIC04MjUsNyArODI1LDcg
QEAgc3RhdGljIGludCBhZHJlbm9fZ2V0X2xlZ2FjeV9wd3JsZXZlbHMoc3RydWN0IGRldmljZSAq
ZGV2KQogCiAJbm9kZSA9IG9mX2dldF9jb21wYXRpYmxlX2NoaWxkKGRldi0+b2Zfbm9kZSwgInFj
b20sZ3B1LXB3cmxldmVscyIpOwogCWlmICghbm9kZSkgewotCQlEUk1fREVWX0VSUk9SKGRldiwg
IkNvdWxkIG5vdCBmaW5kIHRoZSBHUFUgcG93ZXJsZXZlbHNcbiIpOworCQlEUk1fREVWX0RFQlVH
KGRldiwgIkNvdWxkIG5vdCBmaW5kIHRoZSBHUFUgcG93ZXJsZXZlbHNcbiIpOwogCQlyZXR1cm4g
LUVOWElPOwogCX0KIAotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
