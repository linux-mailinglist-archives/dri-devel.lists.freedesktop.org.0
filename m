Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16FE756428
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 10:13:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB2E96E2EB;
	Wed, 26 Jun 2019 08:12:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8074D6E171
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 16:35:06 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id p13so18610690wru.10
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 09:35:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bAOkVHO1BfkTnSJLTBWlqsTsKKDk8gdZ6nODPU4c1tE=;
 b=uZkZkBEQMo2VPKNQLdTQqGZ0ptE3yaLlnnd60BO9ZX26waxMuszt8zfRXUHBmKIKQa
 rV5EhfdIhCwiaKS5mxZ6V9FNPDDn+PgUoIKzpKNe89VzwEvyyfSf/wsi0DEQu7WY1kiw
 HOKEGqFNLxd7DXBJ0vCx7BSMsLd3wWukCD0qO4wu27toc9RVUu1Ibo+inPdgaAjy869S
 N6t9z1ATmqO5IVW5xQKQHNs10ht4kC0S6XXzOH4EB9ZxjtDbKdaMOdtf83pNK4GFTZ6v
 +iB1/k96ue5Jqxd9BIL59q0O3oxmvHw2iKFm0ApsR+y6elqqi0NiUBAquPqsr+FSFWqb
 fAOQ==
X-Gm-Message-State: APjAAAW2AKPu1M0EkMaoJtasrk06hlY4/Hn+a6lddWZ3H48o89Lk9Qq+
 rvGDSNvhS4lDNv0MAdAwXRtYxg==
X-Google-Smtp-Source: APXvYqytytlRfo6YGBjwFJZaCuSVzWH7Bv4+NP+iZBeBXrfYOEHyoR/Ueaj3FUGfeHDYPIHfHNmD2A==
X-Received: by 2002:adf:e691:: with SMTP id r17mr62365819wrm.67.1561480505225; 
 Tue, 25 Jun 2019 09:35:05 -0700 (PDT)
Received: from debian-brgl.home ([2a01:cb1d:af:5b00:6d6c:8493:1ab5:dad7])
 by smtp.gmail.com with ESMTPSA id g8sm2683795wme.20.2019.06.25.09.35.04
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 25 Jun 2019 09:35:04 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Sekhar Nori <nsekhar@ti.com>, Kevin Hilman <khilman@kernel.org>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Lechner <david@lechnology.com>,
 Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 11/12] fbdev: da8xx-fb: drop a redundant if
Date: Tue, 25 Jun 2019 18:34:33 +0200
Message-Id: <20190625163434.13620-12-brgl@bgdev.pl>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190625163434.13620-1-brgl@bgdev.pl>
References: <20190625163434.13620-1-brgl@bgdev.pl>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 26 Jun 2019 08:12:13 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bAOkVHO1BfkTnSJLTBWlqsTsKKDk8gdZ6nODPU4c1tE=;
 b=i50TzhxoE0EVWRZb7FuSgJwILA4rx2iPG77Mv3xcrrEJhVN4B/h7MPBBWVugqYxWp2
 z/toOghI0xFLzo4j20BFkcTCK+t9oS1ur5Zxjuv68/EUxdI7HLW8oC2Nj9IGNwbxlkcf
 ppV6VXclq/A8Z0b+pcsB0R3xp2T8dBZGYEgPFrzfJRHQCawfFi+1EpUaRPuEwp5oe/TE
 cjUFukQoM00ogBXYvTqt763tfq4G+xwbOAaEuus8bhR4jpNdbtNk1PP3kxzDeiAC6IY4
 zhd+wjbHvP1qPE3kwpdpje4Jp/GVei4mLQW7Kg6+P3xNN65ClIzjaWSbuQstQ63Hv5H+
 570A==
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
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogQmFydG9zeiBHb2xhc3pld3NraSA8YmdvbGFzemV3c2tpQGJheWxpYnJlLmNvbT4KClRo
ZSBkcml2ZXIgZGF0YSBpcyBhbHdheXMgc2V0IGluIHByb2JlLiBUaGUgcmVtb3ZlKCkgY2FsbGJh
Y2sgd29uJ3QgYmUKY2FsbGVkIGlmIHByb2JlIGZhaWxlZCB3aGljaCBpcyB0aGUgb25seSB3YXkg
Zm9yIGl0IHRvIGJlIE5VTEwuIFJlbW92ZQp0aGUgcmVkdW5kYW50IGlmLgoKU2lnbmVkLW9mZi1i
eTogQmFydG9zeiBHb2xhc3pld3NraSA8YmdvbGFzemV3c2tpQGJheWxpYnJlLmNvbT4KLS0tCiBk
cml2ZXJzL3ZpZGVvL2ZiZGV2L2RhOHh4LWZiLmMgfCA0MyArKysrKysrKysrKysrKysrLS0tLS0t
LS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMjAgaW5zZXJ0aW9ucygrKSwgMjMgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy92aWRlby9mYmRldi9kYTh4eC1mYi5jIGIvZHJp
dmVycy92aWRlby9mYmRldi9kYTh4eC1mYi5jCmluZGV4IDRkZGExOTRkNmI4Zi4uNmIxMWE4MTA4
MTA4IDEwMDY0NAotLS0gYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2RhOHh4LWZiLmMKKysrIGIvZHJp
dmVycy92aWRlby9mYmRldi9kYTh4eC1mYi5jCkBAIC0xMDY3LDM3ICsxMDY3LDM0IEBAIHN0YXRp
YyB2b2lkIGxjZF9kYTh4eF9jcHVmcmVxX2RlcmVnaXN0ZXIoc3RydWN0IGRhOHh4X2ZiX3BhciAq
cGFyKQogc3RhdGljIGludCBmYl9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqZGV2KQog
ewogCXN0cnVjdCBmYl9pbmZvICppbmZvID0gZGV2X2dldF9kcnZkYXRhKCZkZXYtPmRldik7CisJ
c3RydWN0IGRhOHh4X2ZiX3BhciAqcGFyID0gaW5mby0+cGFyOwogCWludCByZXQ7CiAKLQlpZiAo
aW5mbykgewotCQlzdHJ1Y3QgZGE4eHhfZmJfcGFyICpwYXIgPSBpbmZvLT5wYXI7Ci0KICNpZmRl
ZiBDT05GSUdfQ1BVX0ZSRVEKLQkJbGNkX2RhOHh4X2NwdWZyZXFfZGVyZWdpc3RlcihwYXIpOwor
CWxjZF9kYTh4eF9jcHVmcmVxX2RlcmVnaXN0ZXIocGFyKTsKICNlbmRpZgotCQlpZiAocGFyLT5s
Y2Rfc3VwcGx5KSB7Ci0JCQlyZXQgPSByZWd1bGF0b3JfZGlzYWJsZShwYXItPmxjZF9zdXBwbHkp
OwotCQkJaWYgKHJldCkKLQkJCQlyZXR1cm4gcmV0OwotCQl9CisJaWYgKHBhci0+bGNkX3N1cHBs
eSkgeworCQlyZXQgPSByZWd1bGF0b3JfZGlzYWJsZShwYXItPmxjZF9zdXBwbHkpOworCQlpZiAo
cmV0KQorCQkJcmV0dXJuIHJldDsKKwl9CiAKLQkJbGNkX2Rpc2FibGVfcmFzdGVyKERBOFhYX0ZS
QU1FX1dBSVQpOwotCQlsY2RjX3dyaXRlKDAsIExDRF9SQVNURVJfQ1RSTF9SRUcpOworCWxjZF9k
aXNhYmxlX3Jhc3RlcihEQThYWF9GUkFNRV9XQUlUKTsKKwlsY2RjX3dyaXRlKDAsIExDRF9SQVNU
RVJfQ1RSTF9SRUcpOwogCi0JCS8qIGRpc2FibGUgRE1BICAqLwotCQlsY2RjX3dyaXRlKDAsIExD
RF9ETUFfQ1RSTF9SRUcpOworCS8qIGRpc2FibGUgRE1BICAqLworCWxjZGNfd3JpdGUoMCwgTENE
X0RNQV9DVFJMX1JFRyk7CiAKLQkJdW5yZWdpc3Rlcl9mcmFtZWJ1ZmZlcihpbmZvKTsKLQkJZmJf
ZGVhbGxvY19jbWFwKCZpbmZvLT5jbWFwKTsKLQkJZG1hX2ZyZWVfY29oZXJlbnQocGFyLT5kZXYs
IFBBTEVUVEVfU0laRSwgcGFyLT52X3BhbGV0dGVfYmFzZSwKLQkJCQkgIHBhci0+cF9wYWxldHRl
X2Jhc2UpOwotCQlkbWFfZnJlZV9jb2hlcmVudChwYXItPmRldiwgcGFyLT52cmFtX3NpemUsIHBh
ci0+dnJhbV92aXJ0LAotCQkJCSAgcGFyLT52cmFtX3BoeXMpOwotCQlwbV9ydW50aW1lX3B1dF9z
eW5jKCZkZXYtPmRldik7Ci0JCXBtX3J1bnRpbWVfZGlzYWJsZSgmZGV2LT5kZXYpOwotCQlmcmFt
ZWJ1ZmZlcl9yZWxlYXNlKGluZm8pOworCXVucmVnaXN0ZXJfZnJhbWVidWZmZXIoaW5mbyk7CisJ
ZmJfZGVhbGxvY19jbWFwKCZpbmZvLT5jbWFwKTsKKwlkbWFfZnJlZV9jb2hlcmVudChwYXItPmRl
diwgUEFMRVRURV9TSVpFLCBwYXItPnZfcGFsZXR0ZV9iYXNlLAorCQkJICBwYXItPnBfcGFsZXR0
ZV9iYXNlKTsKKwlkbWFfZnJlZV9jb2hlcmVudChwYXItPmRldiwgcGFyLT52cmFtX3NpemUsIHBh
ci0+dnJhbV92aXJ0LAorCQkJICBwYXItPnZyYW1fcGh5cyk7CisJcG1fcnVudGltZV9wdXRfc3lu
YygmZGV2LT5kZXYpOworCXBtX3J1bnRpbWVfZGlzYWJsZSgmZGV2LT5kZXYpOworCWZyYW1lYnVm
ZmVyX3JlbGVhc2UoaW5mbyk7CiAKLQl9CiAJcmV0dXJuIDA7CiB9CiAKLS0gCjIuMjEuMAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
