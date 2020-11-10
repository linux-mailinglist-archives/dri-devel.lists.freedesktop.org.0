Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB4CA2ADF6C
	for <lists+dri-devel@lfdr.de>; Tue, 10 Nov 2020 20:31:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E66F589BF8;
	Tue, 10 Nov 2020 19:31:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3EB689C13
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 19:31:37 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id h62so4312145wme.3
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 11:31:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=E+NA4KRLjKd0GRAbHJkCDNT0uCDdmE3g7EFp7CscWp0=;
 b=FsrKOA7++uCL4W3W0ttuyWVPqj3ihLBcI8pDZK10eyMbh5zUSeR/ifrfFkDq46rbJj
 lkIyU0y+cbkMa3eHjnE6JJUOqs+kGLYrr9Hm5jdIqgK5fDbBYb/r6EcU76Xu36UGgfGh
 6bXgjpOoJwEtttmmwz49YImkEslqTJqNxKj3UnGB9LraE1OWO/YUqo9vcg5A/KE42NXv
 Jx8ySu3mhi6eia/XzoH17mq2pfFdw/V2lkDTNH7gwUAjC89+oyOXL2CDNxE9YpGVyyDr
 yYSlAfRUP1C8PsqtJcu9QkEGFSJVLnaQ05Y3wfHCdd+HO61cXxE15+XtLUTAUhlzzJZW
 49SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=E+NA4KRLjKd0GRAbHJkCDNT0uCDdmE3g7EFp7CscWp0=;
 b=i/4bh+c97KtrO7jDfVrcIitV2kZYjj3lbfw3hztizN03L3pqNBNkQMK+lA8+b/v5X5
 lZbQl/rQmPrkAlMnu/TwdPhXdd7KCBDi8L7imbeFyDxKvpWaGKthrzcF5KGL+1apH/eA
 T/k2qd3YSoLicBcMAXlUZ7YNVoHaLtJ4CNgQ4Ad7HqCfa9tF7n2kqzcSf/D2tyo9UEkh
 q8RXnf2ofe1iktZN9gtkR5RfFzaA+iz7VUSzi8bYOEjXPkchwg5ICZx6J7nhW3iT1lQK
 eb+JaZb7t3Tghz5roZ7mN0MOXy85+xUIxoYY9lorEuTxpfuMMnUqVJWfdYTq3P+LeOzU
 6Qow==
X-Gm-Message-State: AOAM532+42lc7fXGTNsDHOXFRNbL+54XMHpImZGFeR5mtUEoOpYZfv/I
 mGZLdezx1YpNGFx1feM8J177PA==
X-Google-Smtp-Source: ABdhPJyKq4mKCH/nqgkvIQYhpyL12zgD5LtXKaBkPg4GIUYYBIk9BwqQzypaSJMbpeQi+7UpQmEv3g==
X-Received: by 2002:a05:600c:21cc:: with SMTP id
 x12mr761167wmj.8.1605036696563; 
 Tue, 10 Nov 2020 11:31:36 -0800 (PST)
Received: from dell.default ([91.110.221.139])
 by smtp.gmail.com with ESMTPSA id 30sm17635335wrs.84.2020.11.10.11.31.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 11:31:35 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 16/30] drm/radeon/r100: Fix some kernel-doc formatting,
 misnaming and missing issues
Date: Tue, 10 Nov 2020 19:30:58 +0000
Message-Id: <20201110193112.988999-17-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201110193112.988999-1-lee.jones@linaro.org>
References: <20201110193112.988999-1-lee.jones@linaro.org>
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
cy9ncHUvZHJtL3JhZGVvbi9yMTAwLmM6MTYzOiB3YXJuaW5nOiBGdW5jdGlvbiBwYXJhbWV0ZXIg
b3IgbWVtYmVyICdhc3luYycgbm90IGRlc2NyaWJlZCBpbiAncjEwMF9wYWdlX2ZsaXAnCiBkcml2
ZXJzL2dwdS9kcm0vcmFkZW9uL3IxMDAuYzo4NDg6IHdhcm5pbmc6IEZ1bmN0aW9uIHBhcmFtZXRl
ciBvciBtZW1iZXIgJ3JkZXYnIG5vdCBkZXNjcmliZWQgaW4gJ3IxMDBfcmluZ19oZHBfZmx1c2gn
CiBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3IxMDAuYzo4NDg6IHdhcm5pbmc6IEZ1bmN0aW9uIHBh
cmFtZXRlciBvciBtZW1iZXIgJ3JpbmcnIG5vdCBkZXNjcmliZWQgaW4gJ3IxMDBfcmluZ19oZHBf
Zmx1c2gnCiBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3IxMDAuYzoxNDI1OiB3YXJuaW5nOiBGdW5j
dGlvbiBwYXJhbWV0ZXIgb3IgbWVtYmVyICdwJyBub3QgZGVzY3JpYmVkIGluICdyMTAwX2NzX3Bh
Y2tldF9wYXJzZV92bGluZScKIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vcjEwMC5jOjE0MjU6IHdh
cm5pbmc6IEV4Y2VzcyBmdW5jdGlvbiBwYXJhbWV0ZXIgJ3BhcnNlcicgZGVzY3JpcHRpb24gaW4g
J3IxMDBfY3NfcGFja2V0X3BhcnNlX3ZsaW5lJwoKQ2M6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVy
LmRldWNoZXJAYW1kLmNvbT4KQ2M6ICJDaHJpc3RpYW4gS8O2bmlnIiA8Y2hyaXN0aWFuLmtvZW5p
Z0BhbWQuY29tPgpDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgpDYzogRGFuaWVs
IFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgpDYzogU3VtaXQgU2Vtd2FsIDxzdW1pdC5zZW13YWxA
bGluYXJvLm9yZz4KQ2M6IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCkNjOiBkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCkNjOiBsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmcK
Q2M6IGxpbmFyby1tbS1zaWdAbGlzdHMubGluYXJvLm9yZwpTaWduZWQtb2ZmLWJ5OiBMZWUgSm9u
ZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vcjEw
MC5jIHwgNyArKysrLS0tCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAzIGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcjEwMC5jIGIvZHJp
dmVycy9ncHUvZHJtL3JhZGVvbi9yMTAwLmMKaW5kZXggMjRjOGRiNjczOTMxYS4uOTIwNzVkZWRm
MmNiMiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yMTAwLmMKKysrIGIvZHJp
dmVycy9ncHUvZHJtL3JhZGVvbi9yMTAwLmMKQEAgLTE1Myw2ICsxNTMsNyBAQCB2b2lkIHIxMDBf
d2FpdF9mb3JfdmJsYW5rKHN0cnVjdCByYWRlb25fZGV2aWNlICpyZGV2LCBpbnQgY3J0YykKICAq
IEByZGV2OiByYWRlb25fZGV2aWNlIHBvaW50ZXIKICAqIEBjcnRjX2lkOiBjcnRjIHRvIGNsZWFu
dXAgcGFnZWZsaXAgb24KICAqIEBjcnRjX2Jhc2U6IG5ldyBhZGRyZXNzIG9mIHRoZSBjcnRjIChH
UFUgTUMgYWRkcmVzcykKKyAqIEBhc3luYzogdW51c2VkCiAgKgogICogRG9lcyB0aGUgYWN0dWFs
IHBhZ2VmbGlwIChyMXh4LXI0eHgpLgogICogRHVyaW5nIHZibGFuayB3ZSB0YWtlIHRoZSBjcnRj
IGxvY2sgYW5kIHdhaXQgZm9yIHRoZSB1cGRhdGVfcGVuZGluZwpAQCAtODQxLDggKzg0Miw4IEBA
IHUzMiByMTAwX2dldF92YmxhbmtfY291bnRlcihzdHJ1Y3QgcmFkZW9uX2RldmljZSAqcmRldiwg
aW50IGNydGMpCiAKIC8qKgogICogcjEwMF9yaW5nX2hkcF9mbHVzaCAtIGZsdXNoIEhvc3QgRGF0
YSBQYXRoIHZpYSB0aGUgcmluZyBidWZmZXIKLSAqIHJkZXY6IHJhZGVvbiBkZXZpY2Ugc3RydWN0
dXJlCi0gKiByaW5nOiByaW5nIGJ1ZmZlciBzdHJ1Y3QgZm9yIGVtaXR0aW5nIHBhY2tldHMKKyAq
IEByZGV2OiByYWRlb24gZGV2aWNlIHN0cnVjdHVyZQorICogQHJpbmc6IHJpbmcgYnVmZmVyIHN0
cnVjdCBmb3IgZW1pdHRpbmcgcGFja2V0cwogICovCiBzdGF0aWMgdm9pZCByMTAwX3JpbmdfaGRw
X2ZsdXNoKHN0cnVjdCByYWRlb25fZGV2aWNlICpyZGV2LCBzdHJ1Y3QgcmFkZW9uX3JpbmcgKnJp
bmcpCiB7CkBAIC0xNDA5LDcgKzE0MTAsNyBAQCBpbnQgcjEwMF9jc19wYXJzZV9wYWNrZXQwKHN0
cnVjdCByYWRlb25fY3NfcGFyc2VyICpwLAogCiAvKioKICAqIHIxMDBfY3NfcGFja2V0X25leHRf
dmxpbmUoKSAtIHBhcnNlIHVzZXJzcGFjZSBWTElORSBwYWNrZXQKLSAqIEBwYXJzZXI6CQlwYXJz
ZXIgc3RydWN0dXJlIGhvbGRpbmcgcGFyc2luZyBjb250ZXh0LgorICogQHA6CQlwYXJzZXIgc3Ry
dWN0dXJlIGhvbGRpbmcgcGFyc2luZyBjb250ZXh0LgogICoKICAqIFVzZXJzcGFjZSBzZW5kcyBh
IHNwZWNpYWwgc2VxdWVuY2UgZm9yIFZMSU5FIHdhaXRzLgogICogUEFDS0VUMCAtIFZMSU5FX1NU
QVJUX0VORCArIHZhbHVlCi0tIAoyLjI1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbAo=
