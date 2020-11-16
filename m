Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1914A2B4D32
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 18:37:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF64F6E054;
	Mon, 16 Nov 2020 17:37:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F9536E04E
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 17:37:24 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id s13so15698wmh.4
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 09:37:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LOhlVom8ArIcUSlzkbPekEoXplId4I2upAMKLydb2GM=;
 b=CmPxnfrb0iveHS+EM+94RdsbI4La2NMSex8aL0XxYO+VsmiHxb1T/B0NVOroiN4eNy
 znBmDRIvsBXEblbIonPmhP54WgoTytMUlbfC+xD/LJkUwRKBoi5dfGThNDnjMMn1GPZQ
 HURBVacMhPpsqtVDiGkQdoi8T9Hvgq0fwOQyAVwuw7HQ1SQao+jOshpXOjMsm9DX+Jlo
 RBt20P0RIfkJ+fsKhkZNswBsAgph2o0G2IjIaLW5x+5Z0yIeauoJsnQIBu/uClSaKxod
 euCSaxmgg0cNnMcDKWUevDeoTsfpdsYbqv6Mrdxk8hn0lbFaeOjLcxwg/65wZ2ZVl5ti
 k8ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LOhlVom8ArIcUSlzkbPekEoXplId4I2upAMKLydb2GM=;
 b=P3Led8o4Pjag9tNhMReiaVfw5KN0YZXwpJMCpQKtfnFk+xq1/baorxqzmesh/eY8RK
 A1T/Vi65f6kDI0ECWOSafxunOU/LMqrULp7FAXOP6rl8i6vd97OvDu/wCgzKGOFTkYYO
 7Jv1CZtngvSRqFeRZ9zn0Cll8nrWqGXd6yFkphZ135KK6IFwOLewoEnTNgKGwHnEUL4i
 aI6r8ewzLEXxAVfZrw5bosdk0hRGC7DEePwRghm6nKr5LECeiezkuNlDXxw1TsHNWS9e
 VhE7M3uNLaszoI+UmnQwvg8BNSdweUNWxVRCa1MqFQzeQEBDHXGHf/DmWi1X1/sqlWDh
 rjwA==
X-Gm-Message-State: AOAM533d5yeZy+utD41zv+fXuymS+qABWmac2B8gjcgeOqkNCsYIAIfE
 CY+p+XOd2ADB3jhOQ6JZ7gnxgQ==
X-Google-Smtp-Source: ABdhPJzjyUh+LR9GJPN71pkjIX+r0WRrnEuSfi4PJuZCXq3w8Q9K/MPiknpf2qjWiSC6Jg5OmyyMQQ==
X-Received: by 2002:a1c:bcc1:: with SMTP id m184mr5069wmf.132.1605548243272;
 Mon, 16 Nov 2020 09:37:23 -0800 (PST)
Received: from dell.default ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id 30sm16942828wrd.88.2020.11.16.09.37.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 09:37:22 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 14/43] drm/radeon/radeon_drv: Move
 'radeon_driver_irq_handler_kms's prototype into shared header
Date: Mon, 16 Nov 2020 17:36:31 +0000
Message-Id: <20201116173700.1830487-15-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201116173700.1830487-1-lee.jones@linaro.org>
References: <20201116173700.1830487-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, Gareth Hughes <gareth@valinux.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL3JhZGVvbi9yYWRlb25faXJxX2ttcy5jOjUzOjEzOiB3YXJuaW5nOiBubyBwcmV2
aW91cyBwcm90b3R5cGUgZm9yIOKAmHJhZGVvbl9kcml2ZXJfaXJxX2hhbmRsZXJfa21z4oCZIFst
V21pc3NpbmctcHJvdG90eXBlc10KIDUzIHwgaXJxcmV0dXJuX3QgcmFkZW9uX2RyaXZlcl9pcnFf
aGFuZGxlcl9rbXMoaW50IGlycSwgdm9pZCAqYXJnKQogfCBefn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fgogZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25faXJxX2ttcy5jOjEyMDo2OiB3
YXJuaW5nOiBubyBwcmV2aW91cyBwcm90b3R5cGUgZm9yIOKAmHJhZGVvbl9kcml2ZXJfaXJxX3By
ZWluc3RhbGxfa21z4oCZIFstV21pc3NpbmctcHJvdG90eXBlc10KIDEyMCB8IHZvaWQgcmFkZW9u
X2RyaXZlcl9pcnFfcHJlaW5zdGFsbF9rbXMoc3RydWN0IGRybV9kZXZpY2UgKmRldikKIHwgXn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4KIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFk
ZW9uX2lycV9rbXMuYzoxNTI6NTogd2FybmluZzogbm8gcHJldmlvdXMgcHJvdG90eXBlIGZvciDi
gJhyYWRlb25fZHJpdmVyX2lycV9wb3N0aW5zdGFsbF9rbXPigJkgWy1XbWlzc2luZy1wcm90b3R5
cGVzXQogMTUyIHwgaW50IHJhZGVvbl9kcml2ZXJfaXJxX3Bvc3RpbnN0YWxsX2ttcyhzdHJ1Y3Qg
ZHJtX2RldmljZSAqZGV2KQogfCBefn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4KIGRy
aXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2lycV9rbXMuYzoxNzE6Njogd2FybmluZzogbm8g
cHJldmlvdXMgcHJvdG90eXBlIGZvciDigJhyYWRlb25fZHJpdmVyX2lycV91bmluc3RhbGxfa21z
4oCZIFstV21pc3NpbmctcHJvdG90eXBlc10KIDE3MSB8IHZvaWQgcmFkZW9uX2RyaXZlcl9pcnFf
dW5pbnN0YWxsX2ttcyhzdHJ1Y3QgZHJtX2RldmljZSAqZGV2KQogfCBefn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+CgpDYzogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQu
Y29tPgpDYzogIkNocmlzdGlhbiBLw7ZuaWciIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+CkNj
OiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5p
ZWxAZmZ3bGwuY2g+CkNjOiBHYXJldGggSHVnaGVzIDxnYXJldGhAdmFsaW51eC5jb20+CkNjOiBh
bWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpTaWduZWQtb2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgot
LS0KIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2Rydi5jICAgICB8IDUgKy0tLS0KIGRy
aXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2lycV9rbXMuYyB8IDEgKwogZHJpdmVycy9ncHUv
ZHJtL3JhZGVvbi9yYWRlb25fa21zLmggICAgIHwgNSArKysrKwogMyBmaWxlcyBjaGFuZ2VkLCA3
IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL3JhZGVvbi9yYWRlb25fZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9k
cnYuYwppbmRleCAyYjlkZWFlYWQ5OWIyLi4yMTE5MzJkNzNiMTkxIDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9kcnYuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vcmFk
ZW9uL3JhZGVvbl9kcnYuYwpAQCAtNTEsNiArNTEsNyBAQAogI2luY2x1ZGUgPGRybS9yYWRlb25f
ZHJtLmg+CiAKICNpbmNsdWRlICJyYWRlb25fZHJ2LmgiCisjaW5jbHVkZSAicmFkZW9uX2ttcy5o
IgogI2luY2x1ZGUgInJhZGVvbl90dG0uaCIKICNpbmNsdWRlICJyYWRlb24uaCIKICNpbmNsdWRl
ICJyYWRlb25fZGV2aWNlLmgiCkBAIC0xMTcsMTAgKzExOCw2IEBACiBpbnQgcmFkZW9uX3N1c3Bl
bmRfa21zKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIGJvb2wgc3VzcGVuZCwKIAkJICAgICAgIGJv
b2wgZmJjb24sIGJvb2wgZnJlZXplKTsKIGludCByYWRlb25fcmVzdW1lX2ttcyhzdHJ1Y3QgZHJt
X2RldmljZSAqZGV2LCBib29sIHJlc3VtZSwgYm9vbCBmYmNvbik7Ci12b2lkIHJhZGVvbl9kcml2
ZXJfaXJxX3ByZWluc3RhbGxfa21zKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYpOwotaW50IHJhZGVv
bl9kcml2ZXJfaXJxX3Bvc3RpbnN0YWxsX2ttcyhzdHJ1Y3QgZHJtX2RldmljZSAqZGV2KTsKLXZv
aWQgcmFkZW9uX2RyaXZlcl9pcnFfdW5pbnN0YWxsX2ttcyhzdHJ1Y3QgZHJtX2RldmljZSAqZGV2
KTsKLWlycXJldHVybl90IHJhZGVvbl9kcml2ZXJfaXJxX2hhbmRsZXJfa21zKGludCBpcnEsIHZv
aWQgKmFyZyk7CiBleHRlcm4gaW50IHJhZGVvbl9nZXRfY3J0Y19zY2Fub3V0cG9zKHN0cnVjdCBk
cm1fZGV2aWNlICpkZXYsIHVuc2lnbmVkIGludCBjcnRjLAogCQkJCSAgICAgIHVuc2lnbmVkIGlu
dCBmbGFncywgaW50ICp2cG9zLCBpbnQgKmhwb3MsCiAJCQkJICAgICAga3RpbWVfdCAqc3RpbWUs
IGt0aW1lX3QgKmV0aW1lLApkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRl
b25faXJxX2ttcy5jIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25faXJxX2ttcy5jCmlu
ZGV4IGEyNDJiNjA1M2Q0N2UuLmI4YjdmNjI3ZjBhOWMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9yYWRlb24vcmFkZW9uX2lycV9rbXMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9u
L3JhZGVvbl9pcnFfa21zLmMKQEAgLTM4LDYgKzM4LDcgQEAKIAogI2luY2x1ZGUgImF0b20uaCIK
ICNpbmNsdWRlICJyYWRlb24uaCIKKyNpbmNsdWRlICJyYWRlb25fa21zLmgiCiAjaW5jbHVkZSAi
cmFkZW9uX3JlZy5oIgogCiAKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFk
ZW9uX2ttcy5oIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fa21zLmgKaW5kZXggMzZl
NzNjZWE5MjE1NC4uOTEzYzgyMzlkNWQ4ZCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3Jh
ZGVvbi9yYWRlb25fa21zLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fa21z
LmgKQEAgLTMyLDQgKzMyLDkgQEAgdTMyIHJhZGVvbl9nZXRfdmJsYW5rX2NvdW50ZXJfa21zKHN0
cnVjdCBkcm1fY3J0YyAqY3J0Yyk7CiBpbnQgcmFkZW9uX2VuYWJsZV92Ymxhbmtfa21zKHN0cnVj
dCBkcm1fY3J0YyAqY3J0Yyk7CiB2b2lkIHJhZGVvbl9kaXNhYmxlX3ZibGFua19rbXMoc3RydWN0
IGRybV9jcnRjICpjcnRjKTsKIAoraXJxcmV0dXJuX3QgcmFkZW9uX2RyaXZlcl9pcnFfaGFuZGxl
cl9rbXMoaW50IGlycSwgdm9pZCAqYXJnKTsKK3ZvaWQgcmFkZW9uX2RyaXZlcl9pcnFfcHJlaW5z
dGFsbF9rbXMoc3RydWN0IGRybV9kZXZpY2UgKmRldik7CitpbnQgcmFkZW9uX2RyaXZlcl9pcnFf
cG9zdGluc3RhbGxfa21zKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYpOwordm9pZCByYWRlb25fZHJp
dmVyX2lycV91bmluc3RhbGxfa21zKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYpOworCiAjZW5kaWYJ
CQkJLyogX19SQURFT05fS01TX0hfXyAqLwotLSAKMi4yNS4xCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
