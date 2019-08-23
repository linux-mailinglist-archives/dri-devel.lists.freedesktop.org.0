Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 490189A8E8
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2019 09:35:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96CFB6EBC7;
	Fri, 23 Aug 2019 07:34:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 384436E040
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2019 07:34:56 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id x3so6455910lfc.0
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2019 00:34:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aLw4CRSPJ3WKrmTX2TV02F/5DZkmqEb7ZJ94kU2yaI8=;
 b=VnZ9cdbBSM9ygriMGqJFM2lfeixxUbRRxBmSIoccdP3GYzOUkXpfmVUFklEGcLgYvn
 KcdqCnsn7bM+3u1KMKfrrjINWhHZzFzCohe/8N7lEzuePAJAAPYf7txN3MINGuEs4PUq
 hkJs0OR3N16U67TCd0qMTq3SR5YNGONRbHZASL5iCmySK5/uk4kmdmCuim5A22zWrJ/J
 bAGsefovwiUgijbfx50t3PKCUhpsk+JqIb8xtQ1DZZO7YiVhmOTypBuKa8jHioa6VZvq
 7vDygW4kaXO6//EJLvjNMqRZfKwR/d6NTQbmzgbP95klB/86BlWmd6tChw95v+DEoh5X
 Zlaw==
X-Gm-Message-State: APjAAAWCbExcVt492F/lUxT/HsgZ8cEYS2kWSkEZJo+7UcxXZouAkBC/
 S8kx9k9nagpTnbm7AKnhjKwNZA==
X-Google-Smtp-Source: APXvYqxxsyuYmqHanoZNUMD5o5aUUSlZcJr9+cGYQ4QpjraO5WVJnV9YZinq5/Pk3jeJh6ojZT+g4w==
X-Received: by 2002:a19:5217:: with SMTP id m23mr1846635lfb.124.1566545694604; 
 Fri, 23 Aug 2019 00:34:54 -0700 (PDT)
Received: from genomnajs.ideon.se ([85.235.10.227])
 by smtp.gmail.com with ESMTPSA id n7sm483780ljh.2.2019.08.23.00.34.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Aug 2019 00:34:53 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: [PATCH 1/6 v2] drm/msm/mdp4: Drop unused GPIO include
Date: Fri, 23 Aug 2019 09:34:43 +0200
Message-Id: <20190823073448.8385-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aLw4CRSPJ3WKrmTX2TV02F/5DZkmqEb7ZJ94kU2yaI8=;
 b=mphS1O4ssdOoGeOzJ5pPlICCD+JVCVu7mO1MYI2hIn4o48+vvTMUX6lt5XrggcYA32
 3In3CIS0bcTGBJwH+b1sZUdhF/nQD37bGMatfAZpEdoazdQHOLooCOCJ1pWPa3JpUSFp
 s/s1cqjf5sVKoYN7NiOpW2LyVU6l4EtZ5sdFNNiKvnc0dy8TNTNdKsG/aH+lB5k1Jsi1
 sdntV9G3GRZAv74A3j7jm4q0qvTQN+sTzDNn8VmGxd9kJmr5KxouK+7IDh1pQSWaobo8
 vYI0wikqg9vW9Iv6zET6CYfA6LUFuA3q6HYz41laNEhEJRUKglRPTb7n9qTylzzu8y4k
 11bg==
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
Cc: dri-devel@lists.freedesktop.org, Brian Masney <masneyb@onstation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBmaWxlIGlzIG5vdCB1c2luZyBhbnkgc3ltYm9scyBmcm9tIDxsaW51eC9ncGlvLmg+IHNv
IGp1c3QKZHJvcCB0aGlzIGluY2x1ZGUuCgpDYzogUm9iIENsYXJrIDxyb2JkY2xhcmtAZ21haWwu
Y29tPgpDYzogU2VhbiBQYXVsIDxzZWFuQHBvb3JseS5ydW4+CkNjOiBsaW51eC1hcm0tbXNtQHZn
ZXIua2VybmVsLm9yZwpDYzogZnJlZWRyZW5vQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpSZXZpZXdl
ZC1ieTogQnJpYW4gTWFzbmV5IDxtYXNuZXliQG9uc3RhdGlvbi5vcmc+ClNpZ25lZC1vZmYtYnk6
IExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz4KLS0tCkNoYW5nZUxvZyB2
MS0+djI6Ci0gUmViYXNlZCBvbiB2NS4zLXJjMQotIENvbGxlY3RlZCByZXZpZXcgdGFnCi0tLQog
ZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL21kcDQvbWRwNF9sdmRzX2Nvbm5lY3Rvci5jIHwgMiAt
LQogMSBmaWxlIGNoYW5nZWQsIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL21zbS9kaXNwL21kcDQvbWRwNF9sdmRzX2Nvbm5lY3Rvci5jIGIvZHJpdmVycy9ncHUv
ZHJtL21zbS9kaXNwL21kcDQvbWRwNF9sdmRzX2Nvbm5lY3Rvci5jCmluZGV4IGVjZWY0ZjViOWYy
Ni4uOTI2MmVkMmRjOGMzIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvbWRw
NC9tZHA0X2x2ZHNfY29ubmVjdG9yLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL21k
cDQvbWRwNF9sdmRzX2Nvbm5lY3Rvci5jCkBAIC01LDggKzUsNiBAQAogICogQXV0aG9yOiBWaW5h
eSBTaW1oYSA8dmluYXlzaW1oYUBpbmZvcmNlY29tcHV0aW5nLmNvbT4KICAqLwogCi0jaW5jbHVk
ZSA8bGludXgvZ3Bpby5oPgotCiAjaW5jbHVkZSAibWRwNF9rbXMuaCIKIAogc3RydWN0IG1kcDRf
bHZkc19jb25uZWN0b3IgewotLSAKMi4yMS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
