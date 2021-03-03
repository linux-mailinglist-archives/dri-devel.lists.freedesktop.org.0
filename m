Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4223832B825
	for <lists+dri-devel@lfdr.de>; Wed,  3 Mar 2021 14:44:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B25D56E8F1;
	Wed,  3 Mar 2021 13:43:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDC9B6E8D9
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Mar 2021 13:43:45 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id u125so6379092wmg.4
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Mar 2021 05:43:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LL2CIStDBvdCQ2ilvl+8GEJmSghnQSGgGmDvpCxTU0Q=;
 b=JAR371RMHMFvNknWC4hTcGuEAbhD8bdPwtV8wy/zEUaqExQqn49iQu+3FZE5JeJ482
 TTxTOhGQXqFarSADpG3hoP9sVweTfSwdInfl4ijt+5NNYhYgK44aT6oWR0AHJYEjy/NW
 63j4wlV4giSCXJZMusdcHGwj83XWUOM3WtrQJMgEDJfDXyDq4YtRQdhQZ/g926iBrhok
 aTczenLvwexE8X+xuU8Zvz4M9PaqcOEwh7ohl+xI+weOigImuBmjT1S44SOWRe/BziJm
 LxsHNW9IXmqiXjDhBPGZdGejytI0y1AcpsV0fAhpF/9Gj5rVWwsbJrNWCXuMbunOUnkz
 koog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LL2CIStDBvdCQ2ilvl+8GEJmSghnQSGgGmDvpCxTU0Q=;
 b=Ku8W8EN69uLWZ5G86dALHiYsXzwa3nstHYJ+bl4GUMajnsxIeMTvRCNC84JUUKmh1U
 7aW/P/zZG+BxhfbTi9x5k4j4un4stfxgyxoDXqU3lSk8vawgt9f8OW666B3dLQ8o7mJv
 SY+tyoTUI4A+zliwMb5v6jO020XiNPEXyOb/GLXECpcRCINM1nJ4Y1WqmiV9GlR+Fe0a
 GLk2Zb5XIGd8hAd7JCA44iaqL51LF1HMF8Gi4oWDOxiGqjvCByh2JRou8gJmKNZt+lSp
 1bhA488yzERKvEDIVybj3Rqc5U+OR4qJb3fSz/3FT/fbo77sUjz8Gj5/z7xlevEN38gW
 RlqA==
X-Gm-Message-State: AOAM533E+JrilU0J1BoymPo/hiOj2GAHCzsgn5SjEDc8y9msaep6DrTw
 RTujPlULSUrpc2E1cECc8Zh2ow==
X-Google-Smtp-Source: ABdhPJy3BEgPq8kDRUEDefnM1AmgmfYSo8HfYm0VdWVUkTu6qNsrubOKe7pD80qd1DLzjYlkm27t5Q==
X-Received: by 2002:a7b:c755:: with SMTP id w21mr9451964wmk.89.1614779024289; 
 Wed, 03 Mar 2021 05:43:44 -0800 (PST)
Received: from dell.default ([91.110.221.155])
 by smtp.gmail.com with ESMTPSA id w18sm6109524wrr.7.2021.03.03.05.43.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 05:43:43 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 13/53] drm/nouveau/nouveau_bo: Remove unused variables 'dev'
Date: Wed,  3 Mar 2021 13:42:39 +0000
Message-Id: <20210303134319.3160762-14-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210303134319.3160762-1-lee.jones@linaro.org>
References: <20210303134319.3160762-1-lee.jones@linaro.org>
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
dS9kcm0vbm91dmVhdS9ub3V2ZWF1X2JvLmMKaW5kZXggMjM3NTcxMTg3N2NmMy4uMGI5NGY4YWU3
NzI5MSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9iby5jCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfYm8uYwpAQCAtMTI1MSw3ICsxMjUx
LDYgQEAgbm91dmVhdV90dG1fdHRfcG9wdWxhdGUoc3RydWN0IHR0bV9ib19kZXZpY2UgKmJkZXYs
CiB7CiAJc3RydWN0IHR0bV90dCAqdHRtX2RtYSA9ICh2b2lkICopdHRtOwogCXN0cnVjdCBub3V2
ZWF1X2RybSAqZHJtOwotCXN0cnVjdCBkZXZpY2UgKmRldjsKIAlib29sIHNsYXZlID0gISEodHRt
LT5wYWdlX2ZsYWdzICYgVFRNX1BBR0VfRkxBR19TRyk7CiAKIAlpZiAodHRtX3R0X2lzX3BvcHVs
YXRlZCh0dG0pKQpAQCAtMTI2NCw3ICsxMjYzLDYgQEAgbm91dmVhdV90dG1fdHRfcG9wdWxhdGUo
c3RydWN0IHR0bV9ib19kZXZpY2UgKmJkZXYsCiAJfQogCiAJZHJtID0gbm91dmVhdV9iZGV2KGJk
ZXYpOwotCWRldiA9IGRybS0+ZGV2LT5kZXY7CiAKIAlyZXR1cm4gdHRtX3Bvb2xfYWxsb2MoJmRy
bS0+dHRtLmJkZXYucG9vbCwgdHRtLCBjdHgpOwogfQpAQCAtMTI3NCwxNCArMTI3MiwxMiBAQCBu
b3V2ZWF1X3R0bV90dF91bnBvcHVsYXRlKHN0cnVjdCB0dG1fYm9fZGV2aWNlICpiZGV2LAogCQkJ
ICBzdHJ1Y3QgdHRtX3R0ICp0dG0pCiB7CiAJc3RydWN0IG5vdXZlYXVfZHJtICpkcm07Ci0Jc3Ry
dWN0IGRldmljZSAqZGV2OwogCWJvb2wgc2xhdmUgPSAhISh0dG0tPnBhZ2VfZmxhZ3MgJiBUVE1f
UEFHRV9GTEFHX1NHKTsKIAogCWlmIChzbGF2ZSkKIAkJcmV0dXJuOwogCiAJZHJtID0gbm91dmVh
dV9iZGV2KGJkZXYpOwotCWRldiA9IGRybS0+ZGV2LT5kZXY7CiAKIAlyZXR1cm4gdHRtX3Bvb2xf
ZnJlZSgmZHJtLT50dG0uYmRldi5wb29sLCB0dG0pOwogfQotLSAKMi4yNy4wCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
