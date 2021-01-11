Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 62AF12F1F03
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jan 2021 20:20:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5515C89FC5;
	Mon, 11 Jan 2021 19:20:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4D1289FC0
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 19:20:15 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id i63so237491wma.4
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 11:20:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WUI8zMKN7GlYJMYgpQ8BoEDGt3wAB5ccQaGwQCdPONQ=;
 b=ODjNCowqY28FhbIanlnU07cUII0VkYfzg2ra7UmLI3aacqHbD0K1Vk44vSU95Z5fLH
 zfFdShsLLUd1zQFNt3YzOT4rcMUqceJRBLMgLZgpl04IUDNnVGck9gjzC7jXD0hY6qPt
 AVvjTKdeqhe0bWb/DLgbx3VV5uoBUIuyy9nKCPZm2Fge9i3KyMidHNVSEidEhNju5z8N
 +50A5OsmIj5kQlDAP/Rh91qV/3GwvzTA8LzQYQLMFFVB54fN2CfvjZP32CN3T0ayWJ88
 q79zE1ws9LyaQLYqcao8F3sX3SbMZzwB2nBH3AOYy6hLcsy6BC4A/Vf/9mOk2vNPXy7W
 +liQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WUI8zMKN7GlYJMYgpQ8BoEDGt3wAB5ccQaGwQCdPONQ=;
 b=j86N1Ze/mg33hxdF+FVrXsZzTprX4rwXUUoLvV/pDX4J5CEi1QJjks7AUCFwvPnD+r
 6K1KgLtGV6RWhxrsB4ffcAfo9voE2+E4R1Qhjd8mA9WkgVHuMqAYcUCktoQOMx5dqjga
 lfC6z9K/ZRrZ5g1lwS0LWS7Xg4Ivc0XFPbTo3SubaGRzNFDZsaJO2lmwwL+O+jFDgLNY
 2m8Hj3cHB2Mvs+xpxy3e/qGBfGd4EWBNn8+6+oAANeJmNSjqW78q4uMbrRlrZYZnwEAE
 xkFZecUt3mZbNlYJkSl68ydBb7xzy/QJUFtV3bALQTG6d4R0yZZAuTreIShmjZmf07OD
 pVcg==
X-Gm-Message-State: AOAM530vUCmm1cDrvYsnlvk4xEeiEJ+rKjNdIqmn/bkS3Ku/Al4/KhHJ
 lABwxlrie0g7KQrUvxUspEgiyQ==
X-Google-Smtp-Source: ABdhPJz8tM5Xs/MNa8ZtK7I5QhoB0S+VaI3xXWPEjjhTmvqmg32J+h5D8Sve6UMd0TzFj9pGiOHvOw==
X-Received: by 2002:a7b:cb54:: with SMTP id v20mr290685wmj.148.1610392814445; 
 Mon, 11 Jan 2021 11:20:14 -0800 (PST)
Received: from dell.default ([91.110.221.229])
 by smtp.gmail.com with ESMTPSA id n3sm778090wrw.61.2021.01.11.11.20.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 11:20:13 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 34/40] drm/amd/display/dc/dce110/dce110_transform_v: Demote
 kernel-doc abuse
Date: Mon, 11 Jan 2021 19:19:20 +0000
Message-Id: <20210111191926.3688443-35-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210111191926.3688443-1-lee.jones@linaro.org>
References: <20210111191926.3688443-1-lee.jones@linaro.org>
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
Cc: Leo Li <sunpeng.li@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9kYy9kY2UxMTAvZGNlMTEwX3RyYW5zZm9y
bV92LmM6MjI4OiB3YXJuaW5nOiBiYWQgbGluZTogICAgdm9pZAogZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvLi4vZGlzcGxheS9kYy9kY2UxMTAvZGNlMTEwX3RyYW5zZm9ybV92LmM6MjMzOiB3
YXJuaW5nOiBGdW5jdGlvbiBwYXJhbWV0ZXIgb3IgbWVtYmVyICd4Zm1fZGNlJyBub3QgZGVzY3Jp
YmVkIGluICdwcm9ncmFtX292ZXJzY2FuJwogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4v
ZGlzcGxheS9kYy9kY2UxMTAvZGNlMTEwX3RyYW5zZm9ybV92LmM6MjMzOiB3YXJuaW5nOiBGdW5j
dGlvbiBwYXJhbWV0ZXIgb3IgbWVtYmVyICdkYXRhJyBub3QgZGVzY3JpYmVkIGluICdwcm9ncmFt
X292ZXJzY2FuJwoKQ2M6IEhhcnJ5IFdlbnRsYW5kIDxoYXJyeS53ZW50bGFuZEBhbWQuY29tPgpD
YzogTGVvIExpIDxzdW5wZW5nLmxpQGFtZC5jb20+CkNjOiBBbGV4IERldWNoZXIgPGFsZXhhbmRl
ci5kZXVjaGVyQGFtZC5jb20+CkNjOiAiQ2hyaXN0aWFuIEvDtm5pZyIgPGNocmlzdGlhbi5rb2Vu
aWdAYW1kLmNvbT4KQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KQ2M6IERhbmll
bCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KQ2M6IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCkNjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnClNpZ25lZC1vZmYtYnk6IExl
ZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+Ci0tLQogLi4uL2Rpc3BsYXkvZGMvZGNlMTEw
L2RjZTExMF90cmFuc2Zvcm1fdi5jICAgIHwgMTkgKysrKysrKysrLS0tLS0tLS0tLQogMSBmaWxl
IGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZTExMC9kY2UxMTBfdHJhbnNmb3JtX3Yu
YyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2UxMTAvZGNlMTEwX3RyYW5zZm9y
bV92LmMKaW5kZXggYjFhYWFiNTU5MGNjNi4uMjk0MzhjNjA1MGRiYiAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZTExMC9kY2UxMTBfdHJhbnNmb3JtX3YuYwor
KysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlMTEwL2RjZTExMF90cmFuc2Zv
cm1fdi5jCkBAIC0yMTcsMTYgKzIxNywxNSBAQCBzdGF0aWMgYm9vbCBzZXR1cF9zY2FsaW5nX2Nv
bmZpZ3VyYXRpb24oCiAJcmV0dXJuIGlzX3NjYWxpbmdfbmVlZGVkOwogfQogCi0vKioKLSogRnVu
Y3Rpb246Ci0qIHZvaWQgcHJvZ3JhbV9vdmVyc2NhbgotKgotKiBQdXJwb3NlOiBQcm9ncmFtcyBv
dmVyc2NhbiBib3JkZXIKLSogSW5wdXQ6ICAgb3ZlcnNjYW4KLSoKLSogT3V0cHV0OgotICAgdm9p
ZAotKi8KKy8qCisgKiBGdW5jdGlvbjoKKyAqIHZvaWQgcHJvZ3JhbV9vdmVyc2NhbgorICoKKyAq
IFB1cnBvc2U6IFByb2dyYW1zIG92ZXJzY2FuIGJvcmRlcgorICogSW5wdXQ6ICAgb3ZlcnNjYW4K
KyAqCisgKiBPdXRwdXQ6IHZvaWQKKyAqLwogc3RhdGljIHZvaWQgcHJvZ3JhbV9vdmVyc2NhbigK
IAkJc3RydWN0IGRjZV90cmFuc2Zvcm0gKnhmbV9kY2UsCiAJCWNvbnN0IHN0cnVjdCBzY2FsZXJf
ZGF0YSAqZGF0YSkKLS0gCjIuMjUuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVsCg==
