Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C3B2C0436
	for <lists+dri-devel@lfdr.de>; Mon, 23 Nov 2020 12:20:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BECED89683;
	Mon, 23 Nov 2020 11:20:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 443BA89FA9
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Nov 2020 11:20:14 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id e7so674811wrv.6
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Nov 2020 03:20:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HOTLquS1a42dGVr9bz1l9EZWYtJ3S+2UXgNiNnLXoLI=;
 b=Uu3PFLsVsi7flain8U5ubOSFOjf9aeein2CRsEPdGjFW3xzqfAueWWaYTJq2EtEAEb
 ENXZIBrA5guueBXUS95e0Imp78fMfwCLoliHzv8We9iHmewbcx4+02Mmpb19cHsagOvq
 9C20GI9WcfOEgnYwQRT0N4yrZP9CPUMedWD0hPbemW3gojXqYe2GelPIMFq6bR4cuuNz
 YYAGcq4Q7bML/Q+wU9YLK2q90I2unSkJle3DIxj0T2sCwO5im/7Kr6A+1AeIYKainpNp
 Sa5sIe1w5PokpQKU/89WPL/Qc+oRr82P6Ma1O7W3FiJufPYDgImWxJ9tsf1VKbXZito9
 2vVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HOTLquS1a42dGVr9bz1l9EZWYtJ3S+2UXgNiNnLXoLI=;
 b=QDceM0kn9Ni8mMBKi14M3BiAFZS+HC0xjcNi3Tus2WLHt+05ijhAKpi8hlcrG6hlLL
 jyQT0bppZsUN+jZu48vq6epJtc7aNN3ThIS4smVDcHSSwA/ITchZsSBxWk1iz63sshAF
 cm/HkRk4bWdVV5N938djRSMlMuvMT5dAgxjPRcMNHCjW2c61weM6Sc69Zu7RvHj0IAeq
 id0cbQ3QRt0cPnYhzIWbgSU7rGv2+tD5P3popJoFRXvkh+4znJLb8GloubMbVx+vKX58
 fPo5KSoo1xOiN9mj7/uf+JZMIrbMSvtsHNHSXq6vjE9m+51XRcoGM5zz3ZXRYEz8L0r6
 or8Q==
X-Gm-Message-State: AOAM532EPEy7yMav3iqqviJ5Bm+RudR27I81qiqUSNhCTzHwMbkmqb3I
 hcirCfOYATaIEHN3K6Q9g2r3VQ==
X-Google-Smtp-Source: ABdhPJzQqJOwuP10BOXdsN8wGv7anaDO5nCMhFGsDWrNNSRUZ452W4PnBjZ6V9XjfivqiECCkdrOIA==
X-Received: by 2002:adf:f441:: with SMTP id f1mr30643254wrp.225.1606130412831; 
 Mon, 23 Nov 2020 03:20:12 -0800 (PST)
Received: from dell.default ([91.110.221.218])
 by smtp.gmail.com with ESMTPSA id n9sm16317290wmd.4.2020.11.23.03.20.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Nov 2020 03:20:11 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 36/40] drm/amd/amdgpu/gmc_v7_0: Add some missing kernel-doc
 descriptions
Date: Mon, 23 Nov 2020 11:19:15 +0000
Message-Id: <20201123111919.233376-37-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201123111919.233376-1-lee.jones@linaro.org>
References: <20201123111919.233376-1-lee.jones@linaro.org>
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
cy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y3XzAuYzo0MzM6IHdhcm5pbmc6IEZ1bmN0aW9uIHBh
cmFtZXRlciBvciBtZW1iZXIgJ2ZsdXNoX3R5cGUnIG5vdCBkZXNjcmliZWQgaW4gJ2dtY192N18w
X2ZsdXNoX2dwdV90bGJfcGFzaWQnCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjdf
MC5jOjQzMzogd2FybmluZzogRnVuY3Rpb24gcGFyYW1ldGVyIG9yIG1lbWJlciAnYWxsX2h1Yicg
bm90IGRlc2NyaWJlZCBpbiAnZ21jX3Y3XzBfZmx1c2hfZ3B1X3RsYl9wYXNpZCcKIGRyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2dtY192N18wLmM6NDcxOiB3YXJuaW5nOiBGdW5jdGlvbiBwYXJh
bWV0ZXIgb3IgbWVtYmVyICd2bWh1Yicgbm90IGRlc2NyaWJlZCBpbiAnZ21jX3Y3XzBfZmx1c2hf
Z3B1X3RsYicKIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192N18wLmM6NDcxOiB3YXJu
aW5nOiBGdW5jdGlvbiBwYXJhbWV0ZXIgb3IgbWVtYmVyICdmbHVzaF90eXBlJyBub3QgZGVzY3Jp
YmVkIGluICdnbWNfdjdfMF9mbHVzaF9ncHVfdGxiJwogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvZ21jX3Y3XzAuYzo3NzE6IHdhcm5pbmc6IEZ1bmN0aW9uIHBhcmFtZXRlciBvciBtZW1iZXIg
J3Bhc2lkJyBub3QgZGVzY3JpYmVkIGluICdnbWNfdjdfMF92bV9kZWNvZGVfZmF1bHQnCgpDYzog
QWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgpDYzogIkNocmlzdGlhbiBL
w7ZuaWciIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+CkNjOiBEYXZpZCBBaXJsaWUgPGFpcmxp
ZWRAbGludXguaWU+CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+CkNjOiBhbWQt
Z2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpTaWduZWQtb2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgotLS0K
IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192N18wLmMgfCA3ICsrKysrKy0KIDEgZmls
ZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjdfMC5jIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvZ21jX3Y3XzAuYwppbmRleCA4MGMxNDZkZjMzOGFhLi5mZTcxYzg5ZWNkMjZmIDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjdfMC5jCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192N18wLmMKQEAgLTQyNCw2ICs0MjQsOCBAQCBz
dGF0aWMgaW50IGdtY192N18wX21jX2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiAg
KgogICogQGFkZXY6IGFtZGdwdV9kZXZpY2UgcG9pbnRlcgogICogQHBhc2lkOiBwYXNpZCB0byBi
ZSBmbHVzaAorICogQGZsdXNoX3R5cGU6IHVudXNlZAorICogQGFsbF9odWI6IHVudXNlZAogICoK
ICAqIEZsdXNoIHRoZSBUTEIgZm9yIHRoZSByZXF1ZXN0ZWQgcGFzaWQuCiAgKi8KQEAgLTQ2Myw3
ICs0NjUsOSBAQCBzdGF0aWMgaW50IGdtY192N18wX2ZsdXNoX2dwdV90bGJfcGFzaWQoc3RydWN0
IGFtZGdwdV9kZXZpY2UgKmFkZXYsCiAgKgogICogQGFkZXY6IGFtZGdwdV9kZXZpY2UgcG9pbnRl
cgogICogQHZtaWQ6IHZtIGluc3RhbmNlIHRvIGZsdXNoCi0gKgorICogQHZtaHViOiB1bnVzZWQK
KyAqIEBmbHVzaF90eXBlOiB1bnVzZWQKKyAqICoKICAqIEZsdXNoIHRoZSBUTEIgZm9yIHRoZSBy
ZXF1ZXN0ZWQgcGFnZSB0YWJsZSAoQ0lLKS4KICAqLwogc3RhdGljIHZvaWQgZ21jX3Y3XzBfZmx1
c2hfZ3B1X3RsYihzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwgdWludDMyX3Qgdm1pZCwKQEAg
LTc2Myw2ICs3NjcsNyBAQCBzdGF0aWMgdm9pZCBnbWNfdjdfMF9nYXJ0X2Rpc2FibGUoc3RydWN0
IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiAgKiBAc3RhdHVzOiBWTV9DT05URVhUMV9QUk9URUNUSU9O
X0ZBVUxUX1NUQVRVUyByZWdpc3RlciB2YWx1ZQogICogQGFkZHI6IFZNX0NPTlRFWFQxX1BST1RF
Q1RJT05fRkFVTFRfQUREUiByZWdpc3RlciB2YWx1ZQogICogQG1jX2NsaWVudDogVk1fQ09OVEVY
VDFfUFJPVEVDVElPTl9GQVVMVF9NQ0NMSUVOVCByZWdpc3RlciB2YWx1ZQorICogQHBhc2lkOiBk
ZWJ1ZyBsb2dnaW5nIG9ubHkgLSBubyBmdW5jdGlvbmFsIHVzZQogICoKICAqIFByaW50IGh1bWFu
IHJlYWRhYmxlIGZhdWx0IGluZm9ybWF0aW9uIChDSUspLgogICovCi0tIAoyLjI1LjEKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
