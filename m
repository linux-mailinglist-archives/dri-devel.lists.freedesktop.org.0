Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D57052B4D52
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 18:38:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1112B6E08E;
	Mon, 16 Nov 2020 17:38:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2D176E9ED
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 17:37:55 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id p1so19601642wrf.12
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 09:37:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wcR9SHA/hLxAo0DjnBJYKl1ZjLgHXt+Q6E2OPcU6TRk=;
 b=PD4ZgQMZc0zjxIrjINFoGLWFLiD9nsqe4m09WvxLwc4lK/OJwqcl5NM9CfB8miTxhp
 Ma93beNUf5CGer5yi6sN7aNsLZu1pCUWwPYqHrTOqtltVJK83S07N/Fvy8cKqs6Gcfx5
 c6bIztFZ+QB2VhosEON3sfBHv3qhI9uuGnATdpU6Kl/EM2ygpRSqP4897TFPba5AKPcj
 V3jxwH4MpFQ8oIxWWM1toY80XO3Pe3eg05EXLZwswlr16Q1UFVnIX62o7aru7zSO+mD2
 sCXBU6nZp6xSyAagvnTd8yKWIPJZzi0EW//O9VhlehDylZjokCG2Hsas/zDUJN1nh8SB
 ekDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wcR9SHA/hLxAo0DjnBJYKl1ZjLgHXt+Q6E2OPcU6TRk=;
 b=hUFl5pojgv6Z4SBMRN267gRswszxqanvl8G+mOOmfPEEfKx5o7Q9zLIak6nqxM/Ov2
 Xtjyxzzqib3y+dFM/ID+PMfIhL3tUGUzUHwAGT5vzd6dW/9vJn+Yu11xmNpX6K5OcXaK
 Bu49rLD483zwDVbq3zHU2ujKnRhPNm4ZAKZm2py0qRBXxo8HTegsq1mWaZNuvRJByA1W
 Q4VcKVBRCB8ay2Prdar7giuP995VQCQvTD9RgVxZMxcjsYFB1RaeE6p5Xufw5yiEEI9M
 +Q/jc5NxPFfcal1R/wD0nuRgYS50ecj9qDu56Q70ohQ/OeRBiy3zIqavT/t5TeUmndz8
 d5fw==
X-Gm-Message-State: AOAM530yzvzYi3n+2RJP8xzb81lQ2mK4De99uCyBc503//KKxLF83q50
 hT5pPdaSXiF9+3gszOiLszMLXA==
X-Google-Smtp-Source: ABdhPJxvfA9lwqfWGkqjGiyJLV87fl0kCzlW8nO3dkzHqjHgQ3TGj2I2Y/FSm1mKoTJJN3k/a/XjDg==
X-Received: by 2002:adf:b74d:: with SMTP id n13mr3638294wre.101.1605548274459; 
 Mon, 16 Nov 2020 09:37:54 -0800 (PST)
Received: from dell.default ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id 30sm16942828wrd.88.2020.11.16.09.37.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 09:37:53 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 37/43] drm/radeon/ci_dpm: Move 'si_*()'s prototypes to shared
 header
Date: Mon, 16 Nov 2020 17:36:54 +0000
Message-Id: <20201116173700.1830487-38-lee.jones@linaro.org>
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
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL3JhZGVvbi9zaV9kcG0uYzozODAyOjQ6IHdhcm5pbmc6IG5vIHByZXZpb3VzIHBy
b3RvdHlwZSBmb3Ig4oCYc2lfZ2V0X2RkcjNfbWNsa19mcmVxdWVuY3lfcmF0aW/igJkgWy1XbWlz
c2luZy1wcm90b3R5cGVzXQogMzgwMiB8IHU4IHNpX2dldF9kZHIzX21jbGtfZnJlcXVlbmN5X3Jh
dGlvKHUzMiBtZW1vcnlfY2xvY2spCiB8IF5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
CiBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3NpX2RwbS5jOjM4MTU6NDogd2FybmluZzogbm8gcHJl
dmlvdXMgcHJvdG90eXBlIGZvciDigJhzaV9nZXRfbWNsa19mcmVxdWVuY3lfcmF0aW/igJkgWy1X
bWlzc2luZy1wcm90b3R5cGVzXQogMzgxNSB8IHU4IHNpX2dldF9tY2xrX2ZyZXF1ZW5jeV9yYXRp
byh1MzIgbWVtb3J5X2Nsb2NrLCBib29sIHN0cm9iZV9tb2RlKQogfCBefn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn4KIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vc2lfZHBtLmM6Mzg5Nzo2OiB3YXJu
aW5nOiBubyBwcmV2aW91cyBwcm90b3R5cGUgZm9yIOKAmHNpX3RyaW1fdm9sdGFnZV90YWJsZV90
b19maXRfc3RhdGVfdGFibGXigJkgWy1XbWlzc2luZy1wcm90b3R5cGVzXQogMzg5NyB8IHZvaWQg
c2lfdHJpbV92b2x0YWdlX3RhYmxlX3RvX2ZpdF9zdGF0ZV90YWJsZShzdHJ1Y3QgcmFkZW9uX2Rl
dmljZSAqcmRldiwKIHwgXn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fgoK
Q2M6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KQ2M6ICJDaHJpc3Rp
YW4gS8O2bmlnIiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgpDYzogRGF2aWQgQWlybGllIDxh
aXJsaWVkQGxpbnV4LmllPgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgpDYzog
YW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKU2lnbmVkLW9mZi1ieTogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4K
LS0tCiBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL2NpX2RwbS5jIHwgNiArLS0tLS0KIGRyaXZlcnMv
Z3B1L2RybS9yYWRlb24vc2lfZHBtLmggfCA1ICsrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDYgaW5z
ZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
cmFkZW9uL2NpX2RwbS5jIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9jaV9kcG0uYwppbmRleCBh
OWZjMGE1NTI3MzZjLi4wZGZiMGVkOWFmODlkIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
cmFkZW9uL2NpX2RwbS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vY2lfZHBtLmMKQEAg
LTMzLDYgKzMzLDcgQEAKICNpbmNsdWRlICJyYWRlb24uaCIKICNpbmNsdWRlICJyYWRlb25fYXNp
Yy5oIgogI2luY2x1ZGUgInJhZGVvbl91Y29kZS5oIgorI2luY2x1ZGUgInNpX2RwbS5oIgogCiAj
ZGVmaW5lIE1DX0NHX0FSQl9GUkVRX0YwICAgICAgICAgICAweDBhCiAjZGVmaW5lIE1DX0NHX0FS
Ql9GUkVRX0YxICAgICAgICAgICAweDBiCkBAIC0xNTMsMTEgKzE1NCw2IEBAIHN0YXRpYyBjb25z
dCBzdHJ1Y3QgY2lfcHRfY29uZmlnX3JlZyBkaWR0X2NvbmZpZ19jaVtdID0KIGV4dGVybiB1OCBy
djc3MF9nZXRfbWVtb3J5X21vZHVsZV9pbmRleChzdHJ1Y3QgcmFkZW9uX2RldmljZSAqcmRldik7
CiBleHRlcm4gaW50IG5pX2NvcHlfYW5kX3N3aXRjaF9hcmJfc2V0cyhzdHJ1Y3QgcmFkZW9uX2Rl
dmljZSAqcmRldiwKIAkJCQkgICAgICAgdTMyIGFyYl9mcmVxX3NyYywgdTMyIGFyYl9mcmVxX2Rl
c3QpOwotZXh0ZXJuIHU4IHNpX2dldF9kZHIzX21jbGtfZnJlcXVlbmN5X3JhdGlvKHUzMiBtZW1v
cnlfY2xvY2spOwotZXh0ZXJuIHU4IHNpX2dldF9tY2xrX2ZyZXF1ZW5jeV9yYXRpbyh1MzIgbWVt
b3J5X2Nsb2NrLCBib29sIHN0cm9iZV9tb2RlKTsKLWV4dGVybiB2b2lkIHNpX3RyaW1fdm9sdGFn
ZV90YWJsZV90b19maXRfc3RhdGVfdGFibGUoc3RydWN0IHJhZGVvbl9kZXZpY2UgKnJkZXYsCi0J
CQkJCQkgICAgIHUzMiBtYXhfdm9sdGFnZV9zdGVwcywKLQkJCQkJCSAgICAgc3RydWN0IGF0b21f
dm9sdGFnZV90YWJsZSAqdm9sdGFnZV90YWJsZSk7CiBzdGF0aWMgaW50IGNpX2dldF9zdGRfdm9s
dGFnZV92YWx1ZV9zaWRkKHN0cnVjdCByYWRlb25fZGV2aWNlICpyZGV2LAogCQkJCQkgc3RydWN0
IGF0b21fdm9sdGFnZV90YWJsZV9lbnRyeSAqdm9sdGFnZV90YWJsZSwKIAkJCQkJIHUxNiAqc3Rk
X3ZvbHRhZ2VfaGlfc2lkZCwgdTE2ICpzdGRfdm9sdGFnZV9sb19zaWRkKTsKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vc2lfZHBtLmggYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9u
L3NpX2RwbS5oCmluZGV4IDEwMzJhNjhiZTc5MmIuLmFhODU3OTA2ZWY5M2QgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vc2lfZHBtLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL3Jh
ZGVvbi9zaV9kcG0uaApAQCAtMjM0LDUgKzIzNCwxMCBAQCBzdHJ1Y3Qgc2lfcG93ZXJfaW5mbyB7
CiAjZGVmaW5lIFNJU0xBTkRTX0NHVUxWUEFSQU1FVEVSX0RGTFQgICAgICAgICAgICAgICAgICAg
IDB4MDAwNDAwMzUKICNkZWZpbmUgU0lTTEFORFNfQ0dVTFZDT05UUk9MX0RGTFQgICAgICAgICAg
ICAgICAgICAgICAgMHgxZjAwNzU1MAogCit1OCBzaV9nZXRfZGRyM19tY2xrX2ZyZXF1ZW5jeV9y
YXRpbyh1MzIgbWVtb3J5X2Nsb2NrKTsKK3U4IHNpX2dldF9tY2xrX2ZyZXF1ZW5jeV9yYXRpbyh1
MzIgbWVtb3J5X2Nsb2NrLCBib29sIHN0cm9iZV9tb2RlKTsKK3ZvaWQgc2lfdHJpbV92b2x0YWdl
X3RhYmxlX3RvX2ZpdF9zdGF0ZV90YWJsZShzdHJ1Y3QgcmFkZW9uX2RldmljZSAqcmRldiwKKwkJ
CQkJICAgICAgdTMyIG1heF92b2x0YWdlX3N0ZXBzLAorCQkJCQkgICAgICBzdHJ1Y3QgYXRvbV92
b2x0YWdlX3RhYmxlICp2b2x0YWdlX3RhYmxlKTsKIAogI2VuZGlmCi0tIAoyLjI1LjEKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
