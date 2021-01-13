Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43DC62F45D5
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jan 2021 09:08:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2869A6E08E;
	Wed, 13 Jan 2021 08:08:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0206C6E09F
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 08:08:26 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id k10so688951wmi.3
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 00:08:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YPaIJ4NMJ9MMh9q35TQI1iqMYfx8RWuRYjdqoNV8b68=;
 b=Pl0iBz8pshuI89xlZdvYpcf992qQSZUVTOMqSflDk88q+C/knT37dU5H+g193L0RGy
 Jt8q6Jiuk9N/WlhQxOZAdr34cvKW5c8NMMSA8KKqWBl0S7ro+InhGcLHBprSRquy/Hx+
 0NYVvNBo7mbXI7R+Ts3jsTHi6PAaxDXC/duX6ejbIar1W9hQwSuppdBXXrPUafFk0KPZ
 6KjW2hwHAB66OwA9qf/3eqDAwAAPV1Xg6NuvWWJSp4F673dhAw7mQrJ8vA2vFx6yAKGZ
 k3980aINhNQ3+wT5BwktClc0ojis8PUuJQ030NKbPhV2iAznrIKedpNjdzBJqUAhQ+Tj
 KAzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YPaIJ4NMJ9MMh9q35TQI1iqMYfx8RWuRYjdqoNV8b68=;
 b=HCqmyhHw6vGd3FGDF8mA+vmm0Nbv0cfGaXZfZ4jJ6XtvPb00XCVc6usZ99BusGdQX1
 ugxYqcusbJV04gPOcohzJhWfSnAnh82fzmDRIITXEHYq07zXfx3H6CB6DLQNUfmK1l+y
 9w0uP6qBkUbFhrwTIUCJ1IB71g9tngPjPIQGPfWUXW+Np6/81J8qbPFuBAWa/ncsnMA+
 aL3AXCmnWcuJKwlm7I542xNmxfb8lOdxLPvNRYg/QIiCm9KpQpw3VIVIcM3nIHgw4zT1
 S+EGpllwIgfPmJ3JTyJnO401uakVVvX5VLINXy9qD58f1SBMuCydUEZARNFXCOEs6oet
 /SeA==
X-Gm-Message-State: AOAM533AidV7+AfQjNzjOPzhFvud4BFlHZirTCgRDWLMdnuFLdJ1yxSk
 nhPIYeSUISUkdUMgzCdAdn7W6A==
X-Google-Smtp-Source: ABdhPJwhI4kz7dKLgiYn369E3gtSmgFMuXq0Ti6NvHwq/hN3nNoVYiMhE6eptFQyRqw9gbP3R1ETzQ==
X-Received: by 2002:a1c:e902:: with SMTP id q2mr924513wmc.143.1610525305691;
 Wed, 13 Jan 2021 00:08:25 -0800 (PST)
Received: from dell.default ([91.110.221.229])
 by smtp.gmail.com with ESMTPSA id r20sm1642486wmh.15.2021.01.13.00.08.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 00:08:25 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 24/30] drm/nouveau/nouveau_bo: Remove unused variables 'dev'
Date: Wed, 13 Jan 2021 08:07:46 +0000
Message-Id: <20210113080752.1003793-25-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210113080752.1003793-1-lee.jones@linaro.org>
References: <20210113080752.1003793-1-lee.jones@linaro.org>
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
Cc: Jeremy Kolb <jkolb@brandeis.edu>, David Airlie <airlied@linux.ie>,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Ben Skeggs <bskeggs@redhat.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9iby5jOiBJbiBmdW5jdGlvbiDigJhub3V2ZWF1X3R0
bV90dF9wb3B1bGF0ZeKAmToKIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfYm8uYzox
MjI4OjE3OiB3YXJuaW5nOiB2YXJpYWJsZSDigJhkZXbigJkgc2V0IGJ1dCBub3QgdXNlZCBbLVd1
bnVzZWQtYnV0LXNldC12YXJpYWJsZV0KIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVf
Ym8uYzogSW4gZnVuY3Rpb24g4oCYbm91dmVhdV90dG1fdHRfdW5wb3B1bGF0ZeKAmToKIGRyaXZl
cnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfYm8uYzoxMjUyOjE3OiB3YXJuaW5nOiB2YXJpYWJs
ZSDigJhkZXbigJkgc2V0IGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtYnV0LXNldC12YXJpYWJsZV0K
CkNjOiBCZW4gU2tlZ2dzIDxic2tlZ2dzQHJlZGhhdC5jb20+CkNjOiBEYXZpZCBBaXJsaWUgPGFp
cmxpZWRAbGludXguaWU+CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+CkNjOiBT
dW1pdCBTZW13YWwgPHN1bWl0LnNlbXdhbEBsaW5hcm8ub3JnPgpDYzogIkNocmlzdGlhbiBLw7Zu
aWciIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+CkNjOiBKZXJlbXkgS29sYiA8amtvbGJAYnJh
bmRlaXMuZWR1PgpDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpDYzogbm91dmVh
dUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKQ2M6IGxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZwpD
YzogbGluYXJvLW1tLXNpZ0BsaXN0cy5saW5hcm8ub3JnClNpZ25lZC1vZmYtYnk6IExlZSBKb25l
cyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91
dmVhdV9iby5jIHwgNCAtLS0tCiAxIGZpbGUgY2hhbmdlZCwgNCBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2JvLmMgYi9kcml2ZXJzL2dw
dS9kcm0vbm91dmVhdS9ub3V2ZWF1X2JvLmMKaW5kZXggYzg1YjFhZjA2YjdiZi4uMWU4ZDVlMWNi
MThmMyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9iby5jCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfYm8uYwpAQCAtMTIyNSw3ICsxMjI1
LDYgQEAgbm91dmVhdV90dG1fdHRfcG9wdWxhdGUoc3RydWN0IHR0bV9ib19kZXZpY2UgKmJkZXYs
CiB7CiAJc3RydWN0IHR0bV90dCAqdHRtX2RtYSA9ICh2b2lkICopdHRtOwogCXN0cnVjdCBub3V2
ZWF1X2RybSAqZHJtOwotCXN0cnVjdCBkZXZpY2UgKmRldjsKIAlib29sIHNsYXZlID0gISEodHRt
LT5wYWdlX2ZsYWdzICYgVFRNX1BBR0VfRkxBR19TRyk7CiAKIAlpZiAodHRtX3R0X2lzX3BvcHVs
YXRlZCh0dG0pKQpAQCAtMTIzOSw3ICsxMjM4LDYgQEAgbm91dmVhdV90dG1fdHRfcG9wdWxhdGUo
c3RydWN0IHR0bV9ib19kZXZpY2UgKmJkZXYsCiAJfQogCiAJZHJtID0gbm91dmVhdV9iZGV2KGJk
ZXYpOwotCWRldiA9IGRybS0+ZGV2LT5kZXY7CiAKIAlyZXR1cm4gdHRtX3Bvb2xfYWxsb2MoJmRy
bS0+dHRtLmJkZXYucG9vbCwgdHRtLCBjdHgpOwogfQpAQCAtMTI0OSwxNCArMTI0NywxMiBAQCBu
b3V2ZWF1X3R0bV90dF91bnBvcHVsYXRlKHN0cnVjdCB0dG1fYm9fZGV2aWNlICpiZGV2LAogCQkJ
ICBzdHJ1Y3QgdHRtX3R0ICp0dG0pCiB7CiAJc3RydWN0IG5vdXZlYXVfZHJtICpkcm07Ci0Jc3Ry
dWN0IGRldmljZSAqZGV2OwogCWJvb2wgc2xhdmUgPSAhISh0dG0tPnBhZ2VfZmxhZ3MgJiBUVE1f
UEFHRV9GTEFHX1NHKTsKIAogCWlmIChzbGF2ZSkKIAkJcmV0dXJuOwogCiAJZHJtID0gbm91dmVh
dV9iZGV2KGJkZXYpOwotCWRldiA9IGRybS0+ZGV2LT5kZXY7CiAKIAlyZXR1cm4gdHRtX3Bvb2xf
ZnJlZSgmZHJtLT50dG0uYmRldi5wb29sLCB0dG0pOwogfQotLSAKMi4yNS4xCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
