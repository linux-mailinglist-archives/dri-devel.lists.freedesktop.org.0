Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 53E0B2C30EF
	for <lists+dri-devel@lfdr.de>; Tue, 24 Nov 2020 20:45:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A56876E580;
	Tue, 24 Nov 2020 19:44:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F2C36E554
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Nov 2020 19:44:13 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id 23so23518988wrc.8
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Nov 2020 11:44:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZMRPM9I1lRNzH88FtoqbWHR6lT2TOJ7GT2PZsC4P/7E=;
 b=Pv1nAl+XofxDOZMywxILqcP4qIfKofxo/gaSMnaL6TNvz2rt53Q/joRSKnqpI7b53o
 +mFQmg+10YbgQAqbu6F/cdCzPBL58XI60OMwNhhOmGOdPuoWXcqr88wOld6btC+12xTf
 vHOZo7K8jnHhrisjkOZOwcL8kDhmTh9ZMP4QGo3QnFq1KxzD84c366EnPZGiWBR1rvXX
 hlQ9n+fPeXMkpACeuYr0J69YEKM3NGMCv/LM9NFvZZ/IzMjhZRGShhD9/7VZmk25Gm2f
 VqeMCMauBULX0332aSWQFCo5DEL0tMUuX4zfbsqua/L0qPD8eIEnuUlEv//H5f+tcSu5
 8v2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZMRPM9I1lRNzH88FtoqbWHR6lT2TOJ7GT2PZsC4P/7E=;
 b=ORxlQMd8JQz65mYx4YTzcjFeRZRkDYqS/XOVPDRVxs66FKSVF/WJ+1ZHLwkEmHUkLb
 Dj2SKN0jJUETyBSUgm1q7VOxFF7pbeKxx1l8IwNN3VG9jLiCeYZnDLMIDISH/3hMoj4W
 qr4pxDWlDuUxfNseMHj5wDtyo3838p0EfJoguDJ/U7h9Vs6pWohHXDF0oc5bgh+JNxHK
 pgfH/eP6DZ6Y0RwRjOTh04fw1TJMX0w8qeI/RdlHdM6D8+zNFjYgsx+70XYzNz1tUIZ3
 PhxBom+ExcGRucqPO7t5Q4PkKhr1/Pv8GHMWu2p4s2ivLp64la4MjJTcjx9LhlYO1yCT
 5+Uw==
X-Gm-Message-State: AOAM533ZZgnuDUsR2sdMXG6KO1qCjMRw1s4yL7qIhzGVpDAShT2fSy/s
 +OCyQfcMVkUJ9OLtxwz0JGQNrQ==
X-Google-Smtp-Source: ABdhPJxtPeOQq1Pn1Ae5Xv1UPMN/ILKfgZPrpa0CptICuNWu7dvVV2HkVJwgEEZQcuPZyY8YjfDuGA==
X-Received: by 2002:adf:f7c2:: with SMTP id a2mr78636wrq.11.1606247052702;
 Tue, 24 Nov 2020 11:44:12 -0800 (PST)
Received: from dell.default ([91.110.221.235])
 by smtp.gmail.com with ESMTPSA id d134sm200511wmd.8.2020.11.24.11.44.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Nov 2020 11:44:12 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 11/40] drm/amd/amdgpu/psp_v11_0: Make local function
 'psp_v11_0_wait_for_bootloader()' static
Date: Tue, 24 Nov 2020 19:37:55 +0000
Message-Id: <20201124193824.1118741-12-lee.jones@linaro.org>
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
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvcHNwX3YxMV8wLmM6MjIzOjU6IHdhcm5pbmc6IG5vIHByZXZp
b3VzIHByb3RvdHlwZSBmb3Ig4oCYcHNwX3YxMV8wX3dhaXRfZm9yX2Jvb3Rsb2FkZXLigJkgWy1X
bWlzc2luZy1wcm90b3R5cGVzXQoKQ2M6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJA
YW1kLmNvbT4KQ2M6ICJDaHJpc3RpYW4gS8O2bmlnIiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29t
PgpDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgpDYzogRGFuaWVsIFZldHRlciA8
ZGFuaWVsQGZmd2xsLmNoPgpDYzogSGF3a2luZyBaaGFuZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29t
PgpDYzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKQ2M6IGRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKU2lnbmVkLW9mZi1ieTogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJv
Lm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9wc3BfdjExXzAuYyB8IDIgKy0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3BzcF92MTFfMC5jIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvcHNwX3YxMV8wLmMKaW5kZXggZWRkMmQ2YmQxZDg2YS4uYmQ0MjQ4Yzkz
YzQ5ZiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvcHNwX3YxMV8wLmMK
KysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvcHNwX3YxMV8wLmMKQEAgLTIyMCw3ICsy
MjAsNyBAQCBzdGF0aWMgaW50IHBzcF92MTFfMF9pbml0X21pY3JvY29kZShzdHJ1Y3QgcHNwX2Nv
bnRleHQgKnBzcCkKIAlyZXR1cm4gZXJyOwogfQogCi1pbnQgcHNwX3YxMV8wX3dhaXRfZm9yX2Jv
b3Rsb2FkZXIoc3RydWN0IHBzcF9jb250ZXh0ICpwc3ApCitzdGF0aWMgaW50IHBzcF92MTFfMF93
YWl0X2Zvcl9ib290bG9hZGVyKHN0cnVjdCBwc3BfY29udGV4dCAqcHNwKQogewogCXN0cnVjdCBh
bWRncHVfZGV2aWNlICphZGV2ID0gcHNwLT5hZGV2OwogCi0tIAoyLjI1LjEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
