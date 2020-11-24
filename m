Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D49F92C30DB
	for <lists+dri-devel@lfdr.de>; Tue, 24 Nov 2020 20:44:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E67AF6E546;
	Tue, 24 Nov 2020 19:44:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28CC26E53C
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Nov 2020 19:44:09 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id h21so95791wmb.2
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Nov 2020 11:44:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zomKjMWIzPWrEYw6ovqJZadIuaIS2jNkIlpZKRH8vHs=;
 b=Cybaq8YBYtuTaFR9pBITA1eQRnSBpzhBLkn4zNF+2G3HKC8ZoZ6IIv1b5/uH9fiyVm
 34zogKau3MdUz9JhxsXYpQdi3G7agieql+9jT4s0GActMXzOvScBl0L6AxuVTQHjXCwd
 8XbMr1LcfHVtvjKBTRkxNgaBWMC2klAWVbsp2zM7N3lf+v1GB61U9DU2YYCWdoM9nUtF
 TUzZ+vpHwelItISKNaByhSP4b0gb+/zFCFhXKorLw2zAsz3s148A3UfUpuqf5D/mKslA
 uu66sHvtiZtIKh/qjMtlnJMmd75EIOucoeNL7XXgS8oINJiY9f1yxbNsWiStD/hjpNUi
 YMzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zomKjMWIzPWrEYw6ovqJZadIuaIS2jNkIlpZKRH8vHs=;
 b=SiggOv0c/jr8X/afG0dftX2jQDieCGXsWuoBKH9Au7AlACbKLM5xiocfWFxpTiuHLO
 JrupFPiA5Ysu8GM+GUsPCCszcXIwMAvGOgwUuGYgk9QxrEWPQmhfNIhUcWAenTLsGdaT
 8ATou2ywNS3/o/oYzDlgSaqYv1v3PUC7YKEPdRL+iVesDI22/EMvUoB4Cn7I0m9eTzLu
 jwwVFt7oVWZ7xoybYx2lWdw/ctwq/DoguUrZQRcArhTQpNGC9RESxbQTtxSe4G4MTGZF
 6Eg0ozZ/LfzoGt+sKOaDes5oX3hvC6B5Ak27e9i3igE+a190LvRXOopmdCkafTL/VwGE
 muBg==
X-Gm-Message-State: AOAM530BTOJJS1IS2Wace0nb3HBgdV4pCXq+WxQ+UC1eGpSa8Dnfuy0W
 2nAkCajQ80nYoDBwTVO4fijCkw==
X-Google-Smtp-Source: ABdhPJyp6RogQVTezKIu79LTXpjXEtp0sMVK4trAa640b+djxzfz62EpQey4z/X3AvcXXAyXJhkViw==
X-Received: by 2002:a1c:2ec6:: with SMTP id u189mr173565wmu.31.1606247047808; 
 Tue, 24 Nov 2020 11:44:07 -0800 (PST)
Received: from dell.default ([91.110.221.235])
 by smtp.gmail.com with ESMTPSA id d134sm200511wmd.8.2020.11.24.11.44.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Nov 2020 11:44:07 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 07/40] drm/amd/amdgpu/amdgpu_psp: Make local function
 'parse_ta_bin_descriptor' static
Date: Tue, 24 Nov 2020 19:37:51 +0000
Message-Id: <20201124193824.1118741-8-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201124193824.1118741-1-lee.jones@linaro.org>
References: <20201124193824.1118741-1-lee.jones@linaro.org>
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
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3BzcC5jOjI1NzY6NTogd2FybmluZzogbm8gcHJl
dmlvdXMgcHJvdG90eXBlIGZvciDigJhwYXJzZV90YV9iaW5fZGVzY3JpcHRvcuKAmSBbLVdtaXNz
aW5nLXByb3RvdHlwZXNdCgpDYzogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQu
Y29tPgpDYzogIkNocmlzdGlhbiBLw7ZuaWciIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+CkNj
OiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5p
ZWxAZmZ3bGwuY2g+CkNjOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpDYzogZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpTaWduZWQtb2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5q
b25lc0BsaW5hcm8ub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9w
c3AuYyB8IDYgKysrLS0tCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9w
c3AuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wc3AuYwppbmRleCA3NGNi
YWYyMTI2OTgyLi45MTBlODlkYzMyNGI4IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfcHNwLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X3BzcC5jCkBAIC0yNTczLDkgKzI1NzMsOSBAQCBpbnQgcHNwX2luaXRfc29zX21pY3JvY29k
ZShzdHJ1Y3QgcHNwX2NvbnRleHQgKnBzcCwKIAlyZXR1cm4gZXJyOwogfQogCi1pbnQgcGFyc2Vf
dGFfYmluX2Rlc2NyaXB0b3Ioc3RydWN0IHBzcF9jb250ZXh0ICpwc3AsCi0JCQkgICAgY29uc3Qg
c3RydWN0IHRhX2Z3X2Jpbl9kZXNjICpkZXNjLAotCQkJICAgIGNvbnN0IHN0cnVjdCB0YV9maXJt
d2FyZV9oZWFkZXJfdjJfMCAqdGFfaGRyKQorc3RhdGljIGludCBwYXJzZV90YV9iaW5fZGVzY3Jp
cHRvcihzdHJ1Y3QgcHNwX2NvbnRleHQgKnBzcCwKKwkJCQkgICBjb25zdCBzdHJ1Y3QgdGFfZndf
YmluX2Rlc2MgKmRlc2MsCisJCQkJICAgY29uc3Qgc3RydWN0IHRhX2Zpcm13YXJlX2hlYWRlcl92
Ml8wICp0YV9oZHIpCiB7CiAJdWludDhfdCAqdWNvZGVfc3RhcnRfYWRkciAgPSBOVUxMOwogCi0t
IAoyLjI1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
