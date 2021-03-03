Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6995B32B826
	for <lists+dri-devel@lfdr.de>; Wed,  3 Mar 2021 14:44:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5810F6E8F8;
	Wed,  3 Mar 2021 13:43:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D46E6E8EC
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Mar 2021 13:43:46 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id f12so19930928wrx.8
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Mar 2021 05:43:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dhEuhGFXr/bQGRE4okPVNID5UMggkL9a7rhCimuP+ao=;
 b=MYUt36BHKi3+/nFVEwYOKehOixCmGYE75NoUp9lQ8IyUA60ZXrT1kCGasQIb3lerEi
 lxYGVvqkhzzo/2mnZiWA+W4MS59e6NtKYarYxEBxC+js4/3KVp0aw5VOIjykL++ohZVw
 vfAvPed6+VgGAZbh06xm+D8naHhdyuSh/hTJR8EzknQF2KvLpM+rdVOOq60lPonItUL4
 mPzZ+j8K33j6sFxolR4hFZhxfXxg7yM1dbjJwGafe1/xdnM1EWJtn1mUjQdFepJh+Cuv
 jBBIrRfR6UP7ZgbhkaPzubfZrW0jzRTPi5ZxfRdjQ5OiMSMzrpkw0VqIeg9AvY+dXGRH
 DHnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dhEuhGFXr/bQGRE4okPVNID5UMggkL9a7rhCimuP+ao=;
 b=ssZ9NOrFzhXUrh+uEbs0CVtO9THNMuR3XR19o40Q1taWbnPprwiMTmHoWO7QqhE6hG
 Ikb8xEKB5vg7bnjU23XyHRstgwRSqI6stG6ulg5Yt/db0mvjBZ3etjXE+rhGk4AIRFSa
 VR1g0eXxfD2y6WeENLFEynxJaE2FoDlBlWnaLC22LboldiILAzTNW2dJzlQ04fDsFdoY
 JucznZhAgemANhkVqbbqR4SG70w7Z7rwVk6dmuGykZK4qeWMGzliu340tBroonkGfwf6
 cwRQ6d/RvTJT+myWdMAUaxZNIYdONlnulajqRz7oaeAwVK478EuEjUPhPaHzC1Q73lqY
 PQew==
X-Gm-Message-State: AOAM533vGKHR9oT61E7ZKPIoTOP333mnVbel4zzpC4j5fqIU9nx6iiAE
 h93aQnBNEm6DUlsVzl0DWu2mQw==
X-Google-Smtp-Source: ABdhPJzbgvSx7PDjj6EWPiA7QS1Lk+De+efwgOaWw8y4Wly/hMcIVBgcrSDjwZGcEBeSjtKchb0ojQ==
X-Received: by 2002:a5d:5104:: with SMTP id s4mr28478476wrt.62.1614779025255; 
 Wed, 03 Mar 2021 05:43:45 -0800 (PST)
Received: from dell.default ([91.110.221.155])
 by smtp.gmail.com with ESMTPSA id w18sm6109524wrr.7.2021.03.03.05.43.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 05:43:44 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 14/53] drm/nouveau/nouveau_display: Remove set but unused
 variable 'width'
Date: Wed,  3 Mar 2021 13:42:40 +0000
Message-Id: <20210303134319.3160762-15-lee.jones@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9kaXNwbGF5LmM6IEluIGZ1bmN0aW9uIOKAmG5vdXZl
YXVfZnJhbWVidWZmZXJfbmV34oCZOgogZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9k
aXNwbGF5LmM6MzA5OjE1OiB3YXJuaW5nOiB2YXJpYWJsZSDigJh3aWR0aOKAmSBzZXQgYnV0IG5v
dCB1c2VkIFstV3VudXNlZC1idXQtc2V0LXZhcmlhYmxlXQoKQ2M6IEJlbiBTa2VnZ3MgPGJza2Vn
Z3NAcmVkaGF0LmNvbT4KQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KQ2M6IERh
bmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKQ2M6IG5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnClNpZ25lZC1vZmYtYnk6
IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL25v
dXZlYXUvbm91dmVhdV9kaXNwbGF5LmMgfCA4ICsrKystLS0tCiAxIGZpbGUgY2hhbmdlZCwgNCBp
bnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9ub3V2ZWF1L25vdXZlYXVfZGlzcGxheS5jIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91
dmVhdV9kaXNwbGF5LmMKaW5kZXggMTc4MzFlZTg5N2VhNC4uMDg0OWYzNjc2MzFhOSAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9kaXNwbGF5LmMKKysrIGIvZHJp
dmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9kaXNwbGF5LmMKQEAgLTMwNiw3ICszMDYsNyBA
QCBub3V2ZWF1X2ZyYW1lYnVmZmVyX25ldyhzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LAogCXN0cnVj
dCBub3V2ZWF1X2JvICpudmJvID0gbm91dmVhdV9nZW1fb2JqZWN0KGdlbSk7CiAJc3RydWN0IGRy
bV9mcmFtZWJ1ZmZlciAqZmI7CiAJY29uc3Qgc3RydWN0IGRybV9mb3JtYXRfaW5mbyAqaW5mbzsK
LQl1bnNpZ25lZCBpbnQgd2lkdGgsIGhlaWdodCwgaTsKKwl1bnNpZ25lZCBpbnQgaGVpZ2h0LCBp
OwogCXVpbnQzMl90IHRpbGVfbW9kZTsKIAl1aW50OF90IGtpbmQ7CiAJaW50IHJldDsKQEAgLTM0
Niw5ICszNDYsOSBAQCBub3V2ZWF1X2ZyYW1lYnVmZmVyX25ldyhzdHJ1Y3QgZHJtX2RldmljZSAq
ZGV2LAogCWluZm8gPSBkcm1fZ2V0X2Zvcm1hdF9pbmZvKGRldiwgbW9kZV9jbWQpOwogCiAJZm9y
IChpID0gMDsgaSA8IGluZm8tPm51bV9wbGFuZXM7IGkrKykgewotCQl3aWR0aCA9IGRybV9mb3Jt
YXRfaW5mb19wbGFuZV93aWR0aChpbmZvLAotCQkJCQkJICAgIG1vZGVfY21kLT53aWR0aCwKLQkJ
CQkJCSAgICBpKTsKKwkJZHJtX2Zvcm1hdF9pbmZvX3BsYW5lX3dpZHRoKGluZm8sCisJCQkJCSAg
ICBtb2RlX2NtZC0+d2lkdGgsCisJCQkJCSAgICBpKTsKIAkJaGVpZ2h0ID0gZHJtX2Zvcm1hdF9p
bmZvX3BsYW5lX2hlaWdodChpbmZvLAogCQkJCQkJICAgICAgbW9kZV9jbWQtPmhlaWdodCwKIAkJ
CQkJCSAgICAgIGkpOwotLSAKMi4yNy4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWwK
