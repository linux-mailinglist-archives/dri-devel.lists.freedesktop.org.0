Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDCCCD6FF7
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2019 09:13:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC8AC6E610;
	Tue, 15 Oct 2019 07:13:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6C836E2B2
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2019 12:53:10 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id m7so16531312lji.2
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2019 05:53:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VY1HJeXOWBTSxDIpEf1BQUQwWK9Qg2h3vXazbHlYNs8=;
 b=VJcGBMNaiwEZL/otncfGDHWOREaxhBMnYE0jXSre8sdZt2mqntA9T1NLG2NA0ffEvd
 zjkUSsiLLFTizcbjK+6AuXUE3ewjVO7jgT7Ik3T1tn6/tQjDS+PelIMiTeRUibfOgjqh
 581Rvj9rUjVQTUgrxzwu2ZykBk/ph9y3s2Z9QGKSK41Mej7BJAPdtxQSR2fa/d3nhlnd
 UCQ6+JfkVUt4W9t2qvJwN0u1S/PiWj/aaGUzXjrgxLyUd3XAWH0xecmzGSSAIh8ohdo5
 Ekoldj5rW0JUoPaL3elsq1rF3oIxHmVJfUfvyJESnlr3UEEIb5cjdQ8PXFscrIr+X1NY
 0fDA==
X-Gm-Message-State: APjAAAUFqR5Yi05wOELLmW7jteq/EN+jMB3Y8YGA2cx36Bla200bcF+G
 UKMxs2qlxfYcHNgCebZjEf07Dw==
X-Google-Smtp-Source: APXvYqwcR6rJM0wrezHoQV9+aMKDlUkrWkgLeTTn4JrT5XvG8xafVe86yzBDLcqtbkKsYbGoL+/pRA==
X-Received: by 2002:a2e:9205:: with SMTP id k5mr11807766ljg.202.1571057589040; 
 Mon, 14 Oct 2019 05:53:09 -0700 (PDT)
Received: from localhost (c-413e70d5.07-21-73746f28.bbcust.telenor.se.
 [213.112.62.65])
 by smtp.gmail.com with ESMTPSA id c16sm4296623lfj.8.2019.10.14.05.53.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Oct 2019 05:53:08 -0700 (PDT)
From: Anders Roxell <anders.roxell@linaro.org>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, sean@poorly.run,
 airlied@linux.ie, daniel.vetter@ffwll.ch
Subject: [PATCH] drm/dp-mst: remove unused variable
Date: Mon, 14 Oct 2019 14:53:02 +0200
Message-Id: <20191014125302.21479-1-anders.roxell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 15 Oct 2019 07:12:31 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VY1HJeXOWBTSxDIpEf1BQUQwWK9Qg2h3vXazbHlYNs8=;
 b=S7wKPIdyT6ici7ZYTf/lSrUqOiypj53THCy9xqoVLl2+oYnyF8hXL+jli9skZrXLPh
 EZf0a0DWqeSE2padGXd3BMjokHsjWKf8ekTeEYnkaBX49QaeU+Oomt/f3Rxtps9xhAXY
 zsvVvTPKTPfExH7oomu1w1xpAv/R5EyQ9N/D5jSgfKKnj9eeydyQv+h/erdcYzOtV5QA
 Z0y19YpoqfU/dASwNjVLToraMbFxd5VKkpskHeQkjUP0X4E1WNtkOB4nC5GVAu/t6Qk1
 lDsh24E2W8HzJcMs3VMQSzo6MRdBMkl/OsGxTK+4HAfEVex7vzYS9UGXkesvsiZ5p4vA
 Kt+Q==
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
Cc: Anders Roxell <anders.roxell@linaro.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIHZhcmlhYmxlICdkZXYnIGlzIG5vIGxvbmdlciB1c2VkIGFuZCB0aGUgY29tcGlsZXIgcmln
aHRseSBjb21wbGFpbnMKdGhhdCBpdCBzaG91bGQgYmUgcmVtb3ZlZC4KCi4uL2RyaXZlcnMvZ3B1
L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmM6IEluIGZ1bmN0aW9uIOKAmGRybV9hdG9taWNfZ2V0
X21zdF90b3BvbG9neV9zdGF0ZeKAmToKLi4vZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9w
b2xvZ3kuYzo0MTg3OjIxOiB3YXJuaW5nOiB1bnVzZWQgdmFyaWFibGUg4oCYZGV24oCZIFstV3Vu
dXNlZC12YXJpYWJsZV0KICBzdHJ1Y3QgZHJtX2RldmljZSAqZGV2ID0gbWdyLT5kZXY7CiAgICAg
ICAgICAgICAgICAgICAgIF5+fgoKUmV3b3JrIHRvIHJlbW92ZSB0aGUgdW51c2VkIHZhcmlhYmxl
LgoKRml4ZXM6IDgzZmE5ODQyYWZlNyAoImRybS9kcC1tc3Q6IERyb3AgY29ubmVjdGlvbl9tdXRl
eCBjaGVjayIpClNpZ25lZC1vZmYtYnk6IEFuZGVycyBSb3hlbGwgPGFuZGVycy5yb3hlbGxAbGlu
YXJvLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jIHwgMiAt
LQogMSBmaWxlIGNoYW5nZWQsIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3kuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0
X3RvcG9sb2d5LmMKaW5kZXggOTM2NGU0ZjQyOTc1Li45Y2NjYzVlNjMzMDkgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3kuYwpAQCAtNDE4NCw4ICs0MTg0LDYgQEAgRVhQT1JUX1NZ
TUJPTChkcm1fZHBfbXN0X3RvcG9sb2d5X3N0YXRlX2Z1bmNzKTsKIHN0cnVjdCBkcm1fZHBfbXN0
X3RvcG9sb2d5X3N0YXRlICpkcm1fYXRvbWljX2dldF9tc3RfdG9wb2xvZ3lfc3RhdGUoc3RydWN0
IGRybV9hdG9taWNfc3RhdGUgKnN0YXRlLAogCQkJCQkJCQkgICAgc3RydWN0IGRybV9kcF9tc3Rf
dG9wb2xvZ3lfbWdyICptZ3IpCiB7Ci0Jc3RydWN0IGRybV9kZXZpY2UgKmRldiA9IG1nci0+ZGV2
OwotCiAJcmV0dXJuIHRvX2RwX21zdF90b3BvbG9neV9zdGF0ZShkcm1fYXRvbWljX2dldF9wcml2
YXRlX29ial9zdGF0ZShzdGF0ZSwgJm1nci0+YmFzZSkpOwogfQogRVhQT1JUX1NZTUJPTChkcm1f
YXRvbWljX2dldF9tc3RfdG9wb2xvZ3lfc3RhdGUpOwotLSAKMi4yMC4xCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
