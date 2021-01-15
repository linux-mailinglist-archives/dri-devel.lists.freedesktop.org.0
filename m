Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3BCF2F8381
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jan 2021 19:14:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19F6A6E4AB;
	Fri, 15 Jan 2021 18:14:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B627E6E49C
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 18:14:08 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id c124so8205039wma.5
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 10:14:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=e4bk6qPXM66REGe7AKVzGIJtGtbIBYeQRfbgzaiwlYw=;
 b=fbb83iZMimVayaujWI7iqzvQdiDkC19anKbQzeQLH9LqVfAVeEbBkPQu4blHEoLKev
 i3i3zIQCkHlJGER+MRp3TWy9xSSMDlpvtIy+T8YazOBmD33GNLsZnl7rNXojiajHELwb
 cfXqzHGIWk5gyOSmMyiNZe/p2nKDoGO67Drb4QHc7MZVy5K6Y05wlwy1LkXtY/7aTZX5
 s6NjqotAtkTBef5VABXoZTQFMfwN/VaHFPoi2Pgt2WgYoCyKJqnPkAehJwXPmsHli5Z+
 6JX3/EkQaeQjxG+o00JgKm8ma0pfZza2tMXHL+iJTR7bI7/yGXY8jSVIv97xynJUvCuo
 xupw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=e4bk6qPXM66REGe7AKVzGIJtGtbIBYeQRfbgzaiwlYw=;
 b=AmmKH3sCEPz5eSoBElBWbThy4IKwZZAu730HDOPXBT6eOpZd3Gh6rVWUV+KwuHh+A8
 sQCY/jE1LvENe5TBdgoRGJ4zm+NCba4U7E4c3NZ/orbcG14XAQTWe+uWTvJMt897MQM9
 l66cP/Id2JZ9SaazXi9BZIqX2bTrCrBm3Uq5K7frcIo1gBm5LCMneJN2AB+ayWRQESwM
 wrS/WbVGPg7PmNiMT0JcS2hXf4OnZBCBCAq7aFcHhocXQj5P19wT+G9NFegg2dr2Pced
 5iduOEs+XvrrDpoEqpvp0QyLc+b4FnipH0rHWwtHk1xc1l9BlNrMNUAMwqdRwFHJjgcd
 UmLA==
X-Gm-Message-State: AOAM531HxlTTt/AsSI/VqhZlNmIgM7Un4rgi7MUgM4tDDB1EItWBrcLb
 bMayLHtzgDmhpEaiWatiPfvUnA==
X-Google-Smtp-Source: ABdhPJyC90DXJbQi68KM16rzl+PXjOw/34j6vjAGEAnISOreJODFMHF+Ahf6R8hUIqHswTaf/dZF7A==
X-Received: by 2002:a1c:9684:: with SMTP id y126mr10136669wmd.2.1610734447408; 
 Fri, 15 Jan 2021 10:14:07 -0800 (PST)
Received: from dell.default ([91.110.221.158])
 by smtp.gmail.com with ESMTPSA id j2sm16123484wrh.78.2021.01.15.10.14.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 10:14:06 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 34/40] drm/gma500/mmu: Remove unused function
 'psb_get_default_pd_addr'
Date: Fri, 15 Jan 2021 18:13:07 +0000
Message-Id: <20210115181313.3431493-35-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210115181313.3431493-1-lee.jones@linaro.org>
References: <20210115181313.3431493-1-lee.jones@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL2dtYTUwMC9tbXUuYzo0MjA6MTA6IHdhcm5pbmc6IG5vIHByZXZpb3VzIHByb3Rv
dHlwZSBmb3Ig4oCYcHNiX2dldF9kZWZhdWx0X3BkX2FkZHLigJkgWy1XbWlzc2luZy1wcm90b3R5
cGVzXQoKQ2M6IFBhdHJpayBKYWtvYnNzb24gPHBhdHJpay5yLmpha29ic3NvbkBnbWFpbC5jb20+
CkNjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+CkNjOiBEYW5pZWwgVmV0dGVyIDxk
YW5pZWxAZmZ3bGwuY2g+CkNjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnClNpZ25l
ZC1vZmYtYnk6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+Ci0tLQogZHJpdmVycy9n
cHUvZHJtL2dtYTUwMC9tbXUuYyB8IDkgLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgOSBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZ21hNTAwL21tdS5jIGIvZHJp
dmVycy9ncHUvZHJtL2dtYTUwMC9tbXUuYwppbmRleCA0MmI1M2MwMWI3OWY0Li4wMTRkYWYwMjgw
NDg1IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZ21hNTAwL21tdS5jCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS9nbWE1MDAvbW11LmMKQEAgLTQxNiwxNSArNDE2LDYgQEAgc3RydWN0IHBzYl9t
bXVfcGQgKnBzYl9tbXVfZ2V0X2RlZmF1bHRfcGQoc3RydWN0IHBzYl9tbXVfZHJpdmVyICpkcml2
ZXIpCiAJcmV0dXJuIHBkOwogfQogCi0vKiBSZXR1cm5zIHRoZSBwaHlzaWNhbCBhZGRyZXNzIG9m
IHRoZSBQRCBzaGFyZWQgYnkgc2d4L21zdmR4ICovCi11aW50MzJfdCBwc2JfZ2V0X2RlZmF1bHRf
cGRfYWRkcihzdHJ1Y3QgcHNiX21tdV9kcml2ZXIgKmRyaXZlcikKLXsKLQlzdHJ1Y3QgcHNiX21t
dV9wZCAqcGQ7Ci0KLQlwZCA9IHBzYl9tbXVfZ2V0X2RlZmF1bHRfcGQoZHJpdmVyKTsKLQlyZXR1
cm4gcGFnZV90b19wZm4ocGQtPnApIDw8IFBBR0VfU0hJRlQ7Ci19Ci0KIHZvaWQgcHNiX21tdV9k
cml2ZXJfdGFrZWRvd24oc3RydWN0IHBzYl9tbXVfZHJpdmVyICpkcml2ZXIpCiB7CiAJc3RydWN0
IGRybV9kZXZpY2UgKmRldiA9IGRyaXZlci0+ZGV2OwotLSAKMi4yNS4xCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
