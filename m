Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C0E836229F
	for <lists+dri-devel@lfdr.de>; Fri, 16 Apr 2021 16:38:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50F906EC25;
	Fri, 16 Apr 2021 14:38:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1188A6EC0F
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 14:38:04 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id m3so32537654edv.5
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 07:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eZSAadoVwWWKS/0qwmdM9B0hG2udBsRl+ZNcX49QlvU=;
 b=nw2nOI9l6bUUJmtRby49O2JfdE9k1M4kUJc1s4RPv33ufbBEVEtxgscvAnToufcmDo
 RbVeTBFbe3K1OylmmnszhZ1sts9nOAjyQ6gQAQZWgdBZLy5/fAADEWhPmjg8Kb9pBDrt
 v4ajsDabD+SR+GdhKqXy8O+PVM9vzbs6COwHPxfWao+2YZNVqSBNb8KAKtMl8i3Yp9Fj
 utQpfV5J7eXNzA9EyqhqZ49g+0VzXGyRprORETslu3gZEaJCebXLpeii7FClbzLtrHfa
 bWETg/DXaJIFFqy6ADORLEp/MJfg71OENRKxzlW5QUtqlEKemuH3f0mjzQUqbicdf1vy
 wDSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eZSAadoVwWWKS/0qwmdM9B0hG2udBsRl+ZNcX49QlvU=;
 b=AxFYKKSWscRn4uaeM2ixLX/e1s+eRRZ14QEj49z89e6YpfI6ic5uJhC5HDTMMkW+xa
 oitt1LwPvm/ynP/NVkMwzYxJdiNaY0eW3kJKKL5bp/gWgv2OeO78aAS5RgVIWG6SK2ZV
 ohh5tO4xy/I7QjQERAeqO+AVzmN4RVdxrOsRYg3vSFc8w0O0jXVw9NjmAdTb5CPXBcTn
 3icf3GYHE/k9bDmlzP1hzhJ1L26NlRnxF8sNKBRYO6+FkAyK8Gj1gbvI3aj0hmSxV4Dd
 z85sEjAWpaO7TruN2rDQN5noGUdblm3yg0qUPKlrrGaKltProamtdr5CL7s23werhjDg
 84sQ==
X-Gm-Message-State: AOAM530d70SxpJGvoJMnb+jw2xlz/kkManqUb0ArSsdEu8ux/JJZuR39
 +po/MGcle5aeAi4VifNX5whDxw==
X-Google-Smtp-Source: ABdhPJyaWCWNnk1gyPCzfGXwhwfCB5WDHs+D8lShvvSaWygeMRqZlvqxZLDhhzs5ZiOecIFpI4V1ww==
X-Received: by 2002:a50:85cd:: with SMTP id q13mr10416204edh.114.1618583882788; 
 Fri, 16 Apr 2021 07:38:02 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
 by smtp.gmail.com with ESMTPSA id j10sm1326523ejk.93.2021.04.16.07.38.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 07:38:02 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 31/40] drm/amd/amdgpu/amdgpu_gart: Correct a couple of
 function names in the docs
Date: Fri, 16 Apr 2021 15:37:16 +0100
Message-Id: <20210416143725.2769053-32-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210416143725.2769053-1-lee.jones@linaro.org>
References: <20210416143725.2769053-1-lee.jones@linaro.org>
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
 amd-gfx@lists.freedesktop.org, Nirmoy Das <nirmoy.das@amd.com>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dhcnQuYzo3Mzogd2FybmluZzogZXhwZWN0aW5n
IHByb3RvdHlwZSBmb3IgYW1kZ3B1X2R1bW15X3BhZ2VfaW5pdCgpLiBQcm90b3R5cGUgd2FzIGZv
ciBhbWRncHVfZ2FydF9kdW1teV9wYWdlX2luaXQoKSBpbnN0ZWFkCiBkcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfZ2FydC5jOjk2OiB3YXJuaW5nOiBleHBlY3RpbmcgcHJvdG90eXBl
IGZvciBhbWRncHVfZHVtbXlfcGFnZV9maW5pKCkuIFByb3RvdHlwZSB3YXMgZm9yIGFtZGdwdV9n
YXJ0X2R1bW15X3BhZ2VfZmluaSgpIGluc3RlYWQKCkNjOiBBbGV4IERldWNoZXIgPGFsZXhhbmRl
ci5kZXVjaGVyQGFtZC5jb20+CkNjOiAiQ2hyaXN0aWFuIEvDtm5pZyIgPGNocmlzdGlhbi5rb2Vu
aWdAYW1kLmNvbT4KQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KQ2M6IERhbmll
bCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KQ2M6IE5pcm1veSBEYXMgPG5pcm1veS5kYXNAYW1k
LmNvbT4KQ2M6IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCkNjOiBkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnClNpZ25lZC1vZmYtYnk6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxp
bmFyby5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dhcnQuYyB8
IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ2FydC5jIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dhcnQuYwppbmRleCBjNWE5YTRmYjEw
ZDJiLi41NTYyYjVjOTBjMDMyIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfZ2FydC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9n
YXJ0LmMKQEAgLTYwLDcgKzYwLDcgQEAKICAqLwogCiAvKioKLSAqIGFtZGdwdV9kdW1teV9wYWdl
X2luaXQgLSBpbml0IGR1bW15IHBhZ2UgdXNlZCBieSB0aGUgZHJpdmVyCisgKiBhbWRncHVfZ2Fy
dF9kdW1teV9wYWdlX2luaXQgLSBpbml0IGR1bW15IHBhZ2UgdXNlZCBieSB0aGUgZHJpdmVyCiAg
KgogICogQGFkZXY6IGFtZGdwdV9kZXZpY2UgcG9pbnRlcgogICoKQEAgLTg2LDcgKzg2LDcgQEAg
c3RhdGljIGludCBhbWRncHVfZ2FydF9kdW1teV9wYWdlX2luaXQoc3RydWN0IGFtZGdwdV9kZXZp
Y2UgKmFkZXYpCiB9CiAKIC8qKgotICogYW1kZ3B1X2R1bW15X3BhZ2VfZmluaSAtIGZyZWUgZHVt
bXkgcGFnZSB1c2VkIGJ5IHRoZSBkcml2ZXIKKyAqIGFtZGdwdV9nYXJ0X2R1bW15X3BhZ2VfZmlu
aSAtIGZyZWUgZHVtbXkgcGFnZSB1c2VkIGJ5IHRoZSBkcml2ZXIKICAqCiAgKiBAYWRldjogYW1k
Z3B1X2RldmljZSBwb2ludGVyCiAgKgotLSAKMi4yNy4wCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
