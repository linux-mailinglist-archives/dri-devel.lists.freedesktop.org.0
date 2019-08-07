Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BB4B84E97
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2019 16:21:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B9386E70F;
	Wed,  7 Aug 2019 14:21:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb41.google.com (mail-yb1-xb41.google.com
 [IPv6:2607:f8b0:4864:20::b41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D74AA6E710
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Aug 2019 14:21:21 +0000 (UTC)
Received: by mail-yb1-xb41.google.com with SMTP id q5so20228610ybp.1
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Aug 2019 07:21:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zAihxkfX9EywdeIr6db6fRkWBSNpTnefl57FhpwciLs=;
 b=QlO5NMq9xOwQeDYQitX8p+ZL0I8buMUiizZ5AtDu0MMtKwS5VRuRoFDZ7qxBF4hYJR
 F2Avv/ek0dCNIMfMx1k+D35D+1xPMRf0u1zWbMnRHAwVTKNzIMtH5XW2lMjYxiUxGPDG
 SEur28CUxhkDwVhdJqNyvY6JSWBRio7Jxx43eLc81RCAUuLkJPttxf0GwvFdyby5E7qh
 IKSsHDUz5Fnpy+qECEHH1RreRUhUNVW8arSwv9EwTOY7U4+K6nSc905RsKmHM125XmzT
 TPGnjC4r7piV/bBvwrQlqGBuCcEe/9X4qyyFSQwXbheL1o3JfvcYAb/8vWGm7o7w+vAu
 AJCA==
X-Gm-Message-State: APjAAAUMx1K56XqpA/A2OtJIs0tZGA1AWx35NYgoM4SGrm2QPDzM0BKo
 vo+sJVl6vOm9ieu0dmWldIjbBF2W9OQ=
X-Google-Smtp-Source: APXvYqztd/aFQeKsYeu8VeoPo7FAU5KUAL61J+4RFkygDdeG+R6cikuwGXewOwom6dzdq37mEv9Vxw==
X-Received: by 2002:a25:3b56:: with SMTP id i83mr6536439yba.39.1565187680857; 
 Wed, 07 Aug 2019 07:21:20 -0700 (PDT)
Received: from rosewood.cam.corp.google.com
 ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id d204sm20419451ywe.33.2019.08.07.07.21.20
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 07 Aug 2019 07:21:20 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org, daniel@ffwll.ch, airlied@gmail.com,
 mripard@kernel.org, robh@kernel.org, emil.velikov@collabora.com
Subject: [PATCH 2/5] Revert "Revert "drm/panfrost: Use drm_gem_map_offset()""
Date: Wed,  7 Aug 2019 10:20:55 -0400
Message-Id: <20190807142101.251400-3-sean@poorly.run>
X-Mailer: git-send-email 2.23.0.rc1.153.gdeed80330f-goog
In-Reply-To: <20190807142101.251400-1-sean@poorly.run>
References: <20190807142101.251400-1-sean@poorly.run>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zAihxkfX9EywdeIr6db6fRkWBSNpTnefl57FhpwciLs=;
 b=BJfAGBUCOSWv1TPP1GouABQNDNNQr2dTG+rWAauDI+tcX5aeqQ3zoXDZMzAliPRw/U
 0ruw++CCecpHSRWl4cn6F35oahceqIAcnGBW/PJ6VFi62EhT1iR+ftTfKX3IGGYV4c39
 mjiQ0fWA3nT6JlIG3hmm+EU40ElwMnFm3mogo448hcoSKCvycWwZCsghZ9ReHwowVzHr
 yR6YAb08lLNe7Bw5pUvxvuCeX/YejiQcRYrsCXarZGxbDP2Z4z88IsX1XxVKDaAcnmXK
 4twZkcdTb+ZnhNNw+tKaYSBwm2YslLtQrYfIx17B2LTHX3d8CRwKRip0Zydq21X0/VYz
 HF9A==
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
Cc: Sean Paul <seanpaul@chromium.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogU2VhbiBQYXVsIDxzZWFucGF1bEBjaHJvbWl1bS5vcmc+CgpUaGlzIHJldmVydHMgY29t
bWl0IGJlODU1MzgyYmFjYjVjY2ZkMjRmOWJlNjA5OGQ4N2FjZjRjZmJiMTUuCgpNYW5kYXRvcnkg
cmV2aWV3IHdhcyBtaXNzaW5nIGZyb20gdGhpcyBwYXRjaC4KClNpZ25lZC1vZmYtYnk6IFNlYW4g
UGF1bCA8c2VhbnBhdWxAY2hyb21pdW0ub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9wYW5mcm9z
dC9wYW5mcm9zdF9kcnYuYyB8IDE2ICsrLS0tLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAy
IGluc2VydGlvbnMoKyksIDE0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9w
YW5mcm9zdF9kcnYuYwppbmRleCBiMTg3ZGFhNGRhODUuLmIyZTMyNWUyNzBiNyAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2Rydi5jCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kcnYuYwpAQCAtMjkxLDI2ICsyOTEsMTQgQEAgc3Rh
dGljIGludCBwYW5mcm9zdF9pb2N0bF9tbWFwX2JvKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHZv
aWQgKmRhdGEsCiAJCSAgICAgIHN0cnVjdCBkcm1fZmlsZSAqZmlsZV9wcml2KQogewogCXN0cnVj
dCBkcm1fcGFuZnJvc3RfbW1hcF9ibyAqYXJncyA9IGRhdGE7Ci0Jc3RydWN0IGRybV9nZW1fb2Jq
ZWN0ICpnZW1fb2JqOwotCWludCByZXQ7CiAKIAlpZiAoYXJncy0+ZmxhZ3MgIT0gMCkgewogCQlE
Uk1fSU5GTygidW5rbm93biBtbWFwX2JvIGZsYWdzOiAlZFxuIiwgYXJncy0+ZmxhZ3MpOwogCQly
ZXR1cm4gLUVJTlZBTDsKIAl9CiAKLQlnZW1fb2JqID0gZHJtX2dlbV9vYmplY3RfbG9va3VwKGZp
bGVfcHJpdiwgYXJncy0+aGFuZGxlKTsKLQlpZiAoIWdlbV9vYmopIHsKLQkJRFJNX0RFQlVHKCJG
YWlsZWQgdG8gbG9vayB1cCBHRU0gQk8gJWRcbiIsIGFyZ3MtPmhhbmRsZSk7Ci0JCXJldHVybiAt
RU5PRU5UOwotCX0KLQotCXJldCA9IGRybV9nZW1fY3JlYXRlX21tYXBfb2Zmc2V0KGdlbV9vYmop
OwotCWlmIChyZXQgPT0gMCkKLQkJYXJncy0+b2Zmc2V0ID0gZHJtX3ZtYV9ub2RlX29mZnNldF9h
ZGRyKCZnZW1fb2JqLT52bWFfbm9kZSk7Ci0JZHJtX2dlbV9vYmplY3RfcHV0X3VubG9ja2VkKGdl
bV9vYmopOwotCi0JcmV0dXJuIHJldDsKKwlyZXR1cm4gZHJtX2dlbV9tYXBfb2Zmc2V0KGZpbGVf
cHJpdiwgZGV2LCBhcmdzLT5oYW5kbGUsCisJCQkJICAgICAgICZhcmdzLT5vZmZzZXQpOwogfQog
CiBzdGF0aWMgaW50IHBhbmZyb3N0X2lvY3RsX2dldF9ib19vZmZzZXQoc3RydWN0IGRybV9kZXZp
Y2UgKmRldiwgdm9pZCAqZGF0YSwKLS0gClNlYW4gUGF1bCwgU29mdHdhcmUgRW5naW5lZXIsIEdv
b2dsZSAvIENocm9taXVtIE9TCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
