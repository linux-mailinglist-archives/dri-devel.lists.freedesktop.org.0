Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35ED36A25E
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2019 08:45:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3DBC6E0B9;
	Tue, 16 Jul 2019 06:45:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 362C06E0B9
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2019 06:45:04 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id i21so18764910ljj.3
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2019 23:45:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=BLzrivlzbG9YgJMADuqOSti0EOMld+bYTfrmgVmPJHA=;
 b=rUdqm++DbQQQ2PLmHxtqZp8KfWeqdsyTrkOhn/1gjxyejgrGM1D8ayd71OvrT2fLmS
 I4ux6nvSjlfnwzmpLFFJTdJyAxxccuZciKig4pSFbq+AzrtrZpWum1w1n6zMyp16kfea
 4fEeHxd0YFmpY/7xFz0JaKxeps8YtMFkpljgLs8mhmXEMryGuCispm24pM5QtKs290mw
 Qxn2X3lbWiv0e5WEVwh23Th/fwGA6r85A2wCgGcyIukJKxiMU4MwNh235+Lk+Ftl4PWJ
 k3VTK5Dof7qadoyZxMNUq2flhL3xRiM31RR8y4+b/sXXcDNwMuFGvqUVIDl2FIFrJb7Z
 94Ng==
X-Gm-Message-State: APjAAAXnU5GCZCQAQWmkZgzkF4CBamptYHgtqsURyHxtKEC9fuojzmXU
 c7vCt3g/2zquZyhiB6JECiq96Y0fwHYCGw==
X-Google-Smtp-Source: APXvYqyIcVnvbkoMMl5nEtvdEaddR8z44b37EwjgmzLmRayaQ4ULviImZ0FNThDBcCubVuo2qSr8+w==
X-Received: by 2002:a2e:25a:: with SMTP id 87mr16649331ljc.183.1563259501752; 
 Mon, 15 Jul 2019 23:45:01 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 27sm3529993ljw.97.2019.07.15.23.45.00
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 15 Jul 2019 23:45:01 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 16/19] drm/i2c/sil164: drop use of drmP.h
Date: Tue, 16 Jul 2019 08:42:17 +0200
Message-Id: <20190716064220.18157-17-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190716064220.18157-1-sam@ravnborg.org>
References: <20190716064220.18157-1-sam@ravnborg.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BLzrivlzbG9YgJMADuqOSti0EOMld+bYTfrmgVmPJHA=;
 b=SEn23wZ0lO+CREMe0tosG2Hu0mGQ34UqBTwqaMLo8GOGyHbquGkkmupSo7szHIVX4T
 F6U5ZN7D9Hu1vrD9YT7mWbQVanpJQUFk2+xaXO+Oqj1iGqtTaoR7R1Y6mf68ekN/XWHu
 IC1ec+T2Q9QFrvnIiHKPeyFKobOULKnm1Y7jwaHcTWLe4bY0MO25ch5enqhvcHSteSAB
 TWj0PurKGXCujPR/3EdJ4zoBv4fhirLRsxC21caaQOD7nfsOH1orPTAg6Bhvmtfkv9/s
 fKedocvW0+CfQt2HsV45s2peib4V6QlwIAvO2qyqdyZ3DaIfBEzsd+SnR1ou+Rr/ytmo
 Cv4w==
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
Cc: David Airlie <airlied@linux.ie>, Sam Ravnborg <sam@ravnborg.org>,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RHJvcCB1c2Ugb2YgdGhlIGRlcHJlY2F0ZWQgZHJtUC5oIGhlYWRlciBmaWxlLgpGaXggZmFsbG91
dC4KClNpZ25lZC1vZmYtYnk6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KQWNrZWQt
Ynk6IEVtaWwgVmVsaWtvdiA8ZW1pbC52ZWxpa292QGNvbGxhYm9yYS5jb20+CkNjOiBEYXZpZCBB
aXJsaWUgPGFpcmxpZWRAbGludXguaWU+CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwu
Y2g+CkNjOiBGcmFuY2lzY28gSmVyZXogPGN1cnJvamVyZXpAcmlzZXVwLm5ldD4KLS0tCiBkcml2
ZXJzL2dwdS9kcm0vaTJjL3NpbDE2NF9kcnYuYyB8IDMgKystCiAxIGZpbGUgY2hhbmdlZCwgMiBp
bnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2kyYy9zaWwxNjRfZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vaTJjL3NpbDE2NF9kcnYuYwppbmRl
eCA4NzhiYThkMDZjZTIuLjhiY2YwZDE5OTE0NSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2kyYy9zaWwxNjRfZHJ2LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2kyYy9zaWwxNjRfZHJ2LmMK
QEAgLTI2LDggKzI2LDkgQEAKIAogI2luY2x1ZGUgPGxpbnV4L21vZHVsZS5oPgogCi0jaW5jbHVk
ZSA8ZHJtL2RybVAuaD4KKyNpbmNsdWRlIDxkcm0vZHJtX2Rydi5oPgogI2luY2x1ZGUgPGRybS9k
cm1fZW5jb2Rlcl9zbGF2ZS5oPgorI2luY2x1ZGUgPGRybS9kcm1fcHJpbnQuaD4KICNpbmNsdWRl
IDxkcm0vZHJtX3Byb2JlX2hlbHBlci5oPgogI2luY2x1ZGUgPGRybS9pMmMvc2lsMTY0Lmg+CiAK
LS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
