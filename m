Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B4F47C79E
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2019 17:53:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22DAD89F77;
	Wed, 31 Jul 2019 15:53:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E78189F2A;
 Wed, 31 Jul 2019 15:52:56 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id r6so49632403qkc.0;
 Wed, 31 Jul 2019 08:52:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dm4/Q3Pzv5uPs38Q3w4deJjqtn3Adu0zibSRSatQK6E=;
 b=fPFg7iIjyPkiqrxQ3+nI8qSkaCVUEJZ7ri/4AKqaM9C+PTbxmY6SxSqsEL0PHUVWbE
 plIouw7lE4zo6MaEmiFt1blM+11d5pA1ANBhi8n9lYKtBlsrRp9yYEHDUgg7Fex4KY5+
 T4VNexw60tXGoQT0s5y6j5ZrsxZHT2i9eHMNE8jI0pTDU25aCSZKAq7Ryd+GDoZJm6Gz
 1CAB6BDFm7D3+bmVxkO6UTxJ3hMtdYWW7CdDJ2uFUeNtZ1U9b6nOt1MlVmttZm8f7JSn
 laLA/tz8zlksMGJFBVOy1ZqmkHuO/5iXnEJ035GUTIEVORuqJk5jjyGlXrUrmK4MnBqo
 sSxQ==
X-Gm-Message-State: APjAAAV9/02g14ikT3wV2Jup878U6323MzVF8I9tFzE7wglBbK48SFyr
 +bkiZEsZmx78iUkq4UWMYmMoo7zd
X-Google-Smtp-Source: APXvYqxN9YuzU1RztthJwuJ/t9++vJWPUp/TqTviBMOrfMaIXeD0CWqw8Hc0Lf3SnnTt2y6iEqztLg==
X-Received: by 2002:a05:620a:4:: with SMTP id
 j4mr80933195qki.269.1564588375274; 
 Wed, 31 Jul 2019 08:52:55 -0700 (PDT)
Received: from localhost.localdomain ([71.219.6.100])
 by smtp.gmail.com with ESMTPSA id v17sm38020296qtc.23.2019.07.31.08.52.54
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 31 Jul 2019 08:52:54 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 3/8] drm/amdgpu: drop drmP.h in gfx_v10_0.c
Date: Wed, 31 Jul 2019 10:52:41 -0500
Message-Id: <20190731155246.20603-3-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190731155246.20603-1-alexander.deucher@amd.com>
References: <20190731155246.20603-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dm4/Q3Pzv5uPs38Q3w4deJjqtn3Adu0zibSRSatQK6E=;
 b=cY1H072gJCMV7MVP4RgRDRl+U/DCYJPRqRte9pb47WE9ldwBl7xQ/kB3pTqGpRUEwP
 ppSnUqVKx1ZEyJKkY664DQHR2JLBF8oHJRST+bjckqd5P76FxeQlM6dRBVG/fosKoNQP
 sN/Doo/oOPGDckkB703cgfTIA9deMOcwqY1I13uaXr2L6ovxhLaDSqSu5TsLC/1gtLGB
 hnpMcfa2MgLg45YWDigqqscyhMJovNoEbqRy/lrefOMeDX7sgcq2x/ZsCd1bgLPC2CI3
 kC7OlKLueMGA3SKxq9WpsgdNNM0ChzclPcyWQi6XCHk98LaDJpdhc7LneSe11WeNR84m
 B//A==
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
Cc: Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW5kIGZpeCB0aGUgZmFsbG91dC4KClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFu
ZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhf
djEwXzAuYyB8IDEwICsrKysrKystLS0KIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyks
IDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
Z2Z4X3YxMF8wLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjEwXzAuYwppbmRl
eCBlODczMWRmNDAzNDAuLjgyNzMyMTc4ZDM2NSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvZ2Z4X3YxMF8wLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
Z2Z4X3YxMF8wLmMKQEAgLTIwLDggKzIwLDEyIEBACiAgKiBPVEhFUiBERUFMSU5HUyBJTiBUSEUg
U09GVFdBUkUuCiAgKgogICovCisKKyNpbmNsdWRlIDxsaW51eC9kZWxheS5oPgorI2luY2x1ZGUg
PGxpbnV4L2tlcm5lbC5oPgogI2luY2x1ZGUgPGxpbnV4L2Zpcm13YXJlLmg+Ci0jaW5jbHVkZSA8
ZHJtL2RybVAuaD4KKyNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4KKyNpbmNsdWRlIDxsaW51eC9w
Y2kuaD4KICNpbmNsdWRlICJhbWRncHUuaCIKICNpbmNsdWRlICJhbWRncHVfZ2Z4LmgiCiAjaW5j
bHVkZSAiYW1kZ3B1X3BzcC5oIgpAQCAtMzkzLDcgKzM5Nyw3IEBAIHN0YXRpYyBpbnQgZ2Z4X3Yx
MF8wX3JpbmdfdGVzdF9yaW5nKHN0cnVjdCBhbWRncHVfcmluZyAqcmluZykKIAkJaWYgKGFtZGdw
dV9lbXVfbW9kZSA9PSAxKQogCQkJbXNsZWVwKDEpOwogCQllbHNlCi0JCQlEUk1fVURFTEFZKDEp
OworCQkJdWRlbGF5KDEpOwogCX0KIAlpZiAoaSA8IGFkZXYtPnVzZWNfdGltZW91dCkgewogCQlp
ZiAoYW1kZ3B1X2VtdV9tb2RlID09IDEpCkBAIC00NTUxLDcgKzQ1NTUsNyBAQCBzdGF0aWMgaW50
IGdmeF92MTBfMF9yaW5nX3ByZWVtcHRfaWIoc3RydWN0IGFtZGdwdV9yaW5nICpyaW5nKQogCQlp
ZiAocmluZy0+dHJhaWxfc2VxID09CiAJCSAgICBsZTMyX3RvX2NwdSgqKHJpbmctPnRyYWlsX2Zl
bmNlX2NwdV9hZGRyKSkpCiAJCQlicmVhazsKLQkJRFJNX1VERUxBWSgxKTsKKwkJdWRlbGF5KDEp
OwogCX0KIAogCWlmIChpID49IGFkZXYtPnVzZWNfdGltZW91dCkgewotLSAKMi4yMC4xCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
