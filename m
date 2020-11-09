Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 072C32AC6DF
	for <lists+dri-devel@lfdr.de>; Mon,  9 Nov 2020 22:19:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 133F389650;
	Mon,  9 Nov 2020 21:19:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2468A89654
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Nov 2020 21:19:48 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id s13so907359wmh.4
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Nov 2020 13:19:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2Un/LDNkdtYgdVjwGu3XY0AMRqx0e4C7tEIbE9voLUM=;
 b=krtpRYJ7mJUGfshUvedarUQRk839XAsX1wT12dXjV+G7bjHLBn+k/FCaHDeBwJ6zmR
 3e2WA9H9T5WGYWerXvnIdIlBKuOUi0/peBoe60omFIGgRa00EwPLs3UpTyrq9TGFYRY7
 cPCF25r0zM+iPp/uYSwZ/iAS8Oc5OLnKgP9gC7Kqrv0Nuy/dOka94U9QSbg60Dg4UrQk
 yYsmArQ6NE0XriEBZ5U9RjF3P6yr4ypMPN8vNWQRKc4YEEzLtkrSwLbKERomuMHFbFak
 iEDHJjsS0XIqmRZ2lUxemTSkEl12uzmk3qkW+gSEX64gIFbXq56QLJTS2aVCjo4dXf8t
 TngA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2Un/LDNkdtYgdVjwGu3XY0AMRqx0e4C7tEIbE9voLUM=;
 b=bRauFR2SgY9HDhplx0YeIP+0EbI4REpUr8sSk2rrSuPCTcDDjfQWQezVBdFt3K3lht
 TaGBaS1Dly3s1sK7+NaKwVRfY9XtgN/mISS6f99pmxZzHdUwHovehZmeapj7C6ualj31
 wmffzgHJM1/Fi7/0X2YOEX9JJYyw2aRcRHKK5bZEH6c4WkI+pQtNmPpTVlMR85lURzWB
 QFnlppTTdHT0trchl/lEvFUeCaRXHFI8swtA5NdZDHVG1MclnBWeXZtrnsPAmqKGPZfg
 j0CjDpL5w3vCWghsY/eRCofmjyBVN9P8eWc2hJtMVOh0V8RCL1I8YltNhmsSvrAmgEso
 sHug==
X-Gm-Message-State: AOAM531c8JtCGyCt/3P9w9QsOD+gzSE2O6pHSfzANv+gRXbK1ATrpdMf
 YLZcGioqXHWtROhxWD3SV9r+Ww==
X-Google-Smtp-Source: ABdhPJzQT+thyPpVYvbchZtc1JXpMg/qh1aMOeBb/tJzI2/gm4KhjdaY+QRcLCwdSVRehiKW3tVUSw==
X-Received: by 2002:a05:600c:2048:: with SMTP id
 p8mr1123112wmg.165.1604956786842; 
 Mon, 09 Nov 2020 13:19:46 -0800 (PST)
Received: from dell.default ([91.110.221.139])
 by smtp.gmail.com with ESMTPSA id 71sm15170630wrm.20.2020.11.09.13.19.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2020 13:19:46 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 19/20] drm/radeon/r600: Fix a misnamed parameter description
 and a formatting issue
Date: Mon,  9 Nov 2020 21:18:54 +0000
Message-Id: <20201109211855.3340030-20-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201109211855.3340030-1-lee.jones@linaro.org>
References: <20201109211855.3340030-1-lee.jones@linaro.org>
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
 amd-gfx@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL3JhZGVvbi9yNjAwLmM6Mjk2NTogd2FybmluZzogRnVuY3Rpb24gcGFyYW1ldGVy
IG9yIG1lbWJlciAncmVzdicgbm90IGRlc2NyaWJlZCBpbiAncjYwMF9jb3B5X2NwZG1hJwogZHJp
dmVycy9ncHUvZHJtL3JhZGVvbi9yNjAwLmM6Mjk2NTogd2FybmluZzogRXhjZXNzIGZ1bmN0aW9u
IHBhcmFtZXRlciAnZmVuY2UnIGRlc2NyaXB0aW9uIGluICdyNjAwX2NvcHlfY3BkbWEnCiBkcml2
ZXJzL2dwdS9kcm0vcmFkZW9uL3I2MDAuYzo0MzgyOiB3YXJuaW5nOiBGdW5jdGlvbiBwYXJhbWV0
ZXIgb3IgbWVtYmVyICdyZGV2JyBub3QgZGVzY3JpYmVkIGluICdyNjAwX21taW9faGRwX2ZsdXNo
JwoKQ2M6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KQ2M6ICJDaHJp
c3RpYW4gS8O2bmlnIiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgpDYzogRGF2aWQgQWlybGll
IDxhaXJsaWVkQGxpbnV4LmllPgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgpD
YzogU3VtaXQgU2Vtd2FsIDxzdW1pdC5zZW13YWxAbGluYXJvLm9yZz4KQ2M6IGFtZC1nZnhAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCkNjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCkNj
OiBsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmcKQ2M6IGxpbmFyby1tbS1zaWdAbGlzdHMubGlu
YXJvLm9yZwpTaWduZWQtb2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgot
LS0KIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vcjYwMC5jIHwgNCArKy0tCiAxIGZpbGUgY2hhbmdl
ZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9yYWRlb24vcjYwMC5jIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yNjAwLmMKaW5k
ZXggOTU4Nzc5MjUwMzUyNS4uMGEwODViODVmNTU5ZCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL3JhZGVvbi9yNjAwLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yNjAwLmMKQEAg
LTI5NTIsNyArMjk1Miw3IEBAIGJvb2wgcjYwMF9zZW1hcGhvcmVfcmluZ19lbWl0KHN0cnVjdCBy
YWRlb25fZGV2aWNlICpyZGV2LAogICogQHNyY19vZmZzZXQ6IHNyYyBHUFUgYWRkcmVzcwogICog
QGRzdF9vZmZzZXQ6IGRzdCBHUFUgYWRkcmVzcwogICogQG51bV9ncHVfcGFnZXM6IG51bWJlciBv
ZiBHUFUgcGFnZXMgdG8geGZlcgotICogQGZlbmNlOiByYWRlb24gZmVuY2Ugb2JqZWN0CisgKiBA
cmVzdjogRE1BIHJlc2VydmF0aW9uIG9iamVjdCB0byBtYW5hZ2UgZmVuY2VzCiAgKgogICogQ29w
eSBHUFUgcGFnaW5nIHVzaW5nIHRoZSBDUCBETUEgZW5naW5lIChyNnh4KykuCiAgKiBVc2VkIGJ5
IHRoZSByYWRlb24gdHRtIGltcGxlbWVudGF0aW9uIHRvIG1vdmUgcGFnZXMgaWYKQEAgLTQzNzEs
NyArNDM3MSw3IEBAIGludCByNjAwX2RlYnVnZnNfbWNfaW5mb19pbml0KHN0cnVjdCByYWRlb25f
ZGV2aWNlICpyZGV2KQogCiAvKioKICAqIHI2MDBfbW1pb19oZHBfZmx1c2ggLSBmbHVzaCBIb3N0
IERhdGEgUGF0aCBjYWNoZSB2aWEgTU1JTwotICogcmRldjogcmFkZW9uIGRldmljZSBzdHJ1Y3R1
cmUKKyAqIEByZGV2OiByYWRlb24gZGV2aWNlIHN0cnVjdHVyZQogICoKICAqIFNvbWUgUjZYWC9S
N1hYIGRvbid0IHNlZW0gdG8gdGFrZSBpbnRvIGFjY291bnQgSERQIGZsdXNoZXMgcGVyZm9ybWVk
CiAgKiB0aHJvdWdoIHRoZSByaW5nIGJ1ZmZlci4gVGhpcyBsZWFkcyB0byBjb3JydXB0aW9uIGlu
IHJlbmRlcmluZywgc2VlCi0tIAoyLjI1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbAo=
