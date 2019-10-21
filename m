Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9339FDE7AF
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2019 11:15:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF79B89CBC;
	Mon, 21 Oct 2019 09:15:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B2CD89C94
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2019 09:15:15 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id r19so12403691wmh.2
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2019 02:15:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qDD2ziTUH4iVa0dzLE+0MqtrcwtEloFCQjzGa/0salE=;
 b=DF/pHp1mJOqVTuJnJZTrtVU/V3SDFhHSD4nxPJr99/mN9Nf3UDBqg2tx5MJXCh0BD8
 5F6tV2+7AhwxfQoDqWWfua9jOWRJ/1siHbZ7uWg2DuhhpyPDhRVb2KysFo3ok8JW2pqe
 qvyRhy8M4dega6pUPV+EvI4uDoUAByRWKYkkhNYTRzjUl2O6dbmDqMx+cp86KyPOHTo+
 sPan21M4kxEjzt9upAEN+QZPl+NuNyEZG1MPDDdvweI7PIYOI46bvwSkosCasBoevM3E
 QR2Teo9sAoMp1zDRCSLO1jLbu4dRuZS9aRsHLHzNbZMzvFWT2RCAlri2CJjM0Ln0veT8
 3nsw==
X-Gm-Message-State: APjAAAX7EBozULCNmLWaya89xb17IJwQhulREBRAOOyHXxyEwtl3+xzz
 xpaiKlEOW1dQcGYH5tOKPD2c35klLZgRWA==
X-Google-Smtp-Source: APXvYqxwpMCLFzRRta3WE5BmI//VeCYqIDqGSOxYZVPKLJENo6zfL95E75p+aJ12kCrXGKdqjUu8GA==
X-Received: by 2002:a1c:c90c:: with SMTP id f12mr17569471wmb.97.1571649313528; 
 Mon, 21 Oct 2019 02:15:13 -0700 (PDT)
Received: from localhost.localdomain
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id t13sm20281595wra.70.2019.10.21.02.15.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Oct 2019 02:15:12 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 2/9] drm/meson: add RDMA register bits defines
Date: Mon, 21 Oct 2019 11:15:02 +0200
Message-Id: <20191021091509.3864-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20191021091509.3864-1-narmstrong@baylibre.com>
References: <20191021091509.3864-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qDD2ziTUH4iVa0dzLE+0MqtrcwtEloFCQjzGa/0salE=;
 b=Z73uEg7UKgYk1leib+Lrz12y+eL4X27Nq3POnyLEcHDYIjKTXRd1/zU0aqSEEkVGU9
 cdTdpNl/8DMrrwjvId3op7/1+gzPKxdZb0wBHm7n0z9YeOHPsjXzzbaJC6vAlLy8urWw
 i+meUGAPQsTSafCAmV75L/xCeFlqIen2wS8vou2PDLJ+qV5lKKV3eyfkyeOw/QmSKDFM
 g6aIFmh9rhAW2gC57oRFCRwKpT4nJDKb5GRWosAMsEiKLvthKgeTwAgJz+XZ1BUMRKcC
 a4u7AytvzMU6kOz7a8aXA6/6UdJ1AF5atDdTkEydN9xLJpU1tHRlo/ztXoHFgINrw+PB
 o06Q==
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
Cc: khilman@baylibre.com, linux-amlogic@lists.infradead.org,
 ayan.halder@arm.com, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIEFtbG9naWMgVlBVIGVtYmVkcyBhICJSZWdpc3RlciBETUEiIHRoYXQgY2FuIHdyaXRlIGEg
c2VxdWVuY2Ugb2YgcmVnaXN0ZXJzCm9uIHRoZSBWUFUgQUhCIGJ1cywgZWl0aGVyIG1hbnVhbGx5
IG9yIHRyaWdnZXJlZCBieSBhbiBpbnRlcm5hbCBJUlEgZXZlbnQgbGlrZQpWU1lOQyBvciBhIGxp
bmUgaW5wdXQgY291bnRlci4KClRoaXMgYWRkcyB0aGUgcmVnaXN0ZXIgZGVmaW5lcy4KClNpZ25l
ZC1vZmYtYnk6IE5laWwgQXJtc3Ryb25nIDxuYXJtc3Ryb25nQGJheWxpYnJlLmNvbT4KLS0tCiBk
cml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fcmVnaXN0ZXJzLmggfCA0OCArKysrKysrKysrKysr
KysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgNDggaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl9yZWdpc3RlcnMuaCBiL2RyaXZlcnMvZ3B1
L2RybS9tZXNvbi9tZXNvbl9yZWdpc3RlcnMuaAppbmRleCA1NDdiZWUwNGI0NmUuLjhlYTAwNTQ2
Y2Q0ZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29uX3JlZ2lzdGVycy5o
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl9yZWdpc3RlcnMuaApAQCAtMTIxMSwx
MSArMTIxMSw1OSBAQAogI2RlZmluZSBSRE1BX0FIQl9TVEFSVF9BRERSXzcgMHgxMTBlCiAjZGVm
aW5lIFJETUFfQUhCX0VORF9BRERSXzcgMHgxMTBmCiAjZGVmaW5lIFJETUFfQUNDRVNTX0FVVE8g
MHgxMTEwCisjZGVmaW5lCQlSRE1BX0FDQ0VTU19UUklHR0VSX0NIQU4zCUdFTk1BU0soMzEsIDI0
KQorI2RlZmluZQkJUkRNQV9BQ0NFU1NfVFJJR0dFUl9DSEFOMglHRU5NQVNLKDIzLCAxNikKKyNk
ZWZpbmUJCVJETUFfQUNDRVNTX1RSSUdHRVJfQ0hBTjEJR0VOTUFTSygxNSwgOCkKKyNkZWZpbmUJ
CVJETUFfQUNDRVNTX1RSSUdHRVJfU1RPUAkwCisjZGVmaW5lCQlSRE1BX0FDQ0VTU19UUklHR0VS
X1ZTWU5DCTEKKyNkZWZpbmUJCVJETUFfQUNDRVNTX1RSSUdHRVJfTElORQkzMgorI2RlZmluZQkJ
UkRNQV9BQ0NFU1NfUldfRkxBR19DSEFOMwlCSVQoNykKKyNkZWZpbmUJCVJETUFfQUNDRVNTX1JX
X0ZMQUdfQ0hBTjIJQklUKDYpCisjZGVmaW5lCQlSRE1BX0FDQ0VTU19SV19GTEFHX0NIQU4xCUJJ
VCg1KQorI2RlZmluZQkJUkRNQV9BQ0NFU1NfQUREUl9JTkNfQ0hBTjMJQklUKDMpCisjZGVmaW5l
CQlSRE1BX0FDQ0VTU19BRERSX0lOQ19DSEFOMglCSVQoMikKKyNkZWZpbmUJCVJETUFfQUNDRVNT
X0FERFJfSU5DX0NIQU4xCUJJVCgxKQogI2RlZmluZSBSRE1BX0FDQ0VTU19BVVRPMiAweDExMTEK
KyNkZWZpbmUJCVJETUFfQUNDRVNTX1JXX0ZMQUdfQ0hBTjcJQklUKDcpCisjZGVmaW5lCQlSRE1B
X0FDQ0VTU19SV19GTEFHX0NIQU42CUJJVCg2KQorI2RlZmluZQkJUkRNQV9BQ0NFU1NfUldfRkxB
R19DSEFONQlCSVQoNSkKKyNkZWZpbmUJCVJETUFfQUNDRVNTX1JXX0ZMQUdfQ0hBTjQJQklUKDQp
CisjZGVmaW5lCQlSRE1BX0FDQ0VTU19BRERSX0lOQ19DSEFONwlCSVQoMykKKyNkZWZpbmUJCVJE
TUFfQUNDRVNTX0FERFJfSU5DX0NIQU42CUJJVCgyKQorI2RlZmluZQkJUkRNQV9BQ0NFU1NfQURE
Ul9JTkNfQ0hBTjUJQklUKDEpCisjZGVmaW5lCQlSRE1BX0FDQ0VTU19BRERSX0lOQ19DSEFONAlC
SVQoMCkKICNkZWZpbmUgUkRNQV9BQ0NFU1NfQVVUTzMgMHgxMTEyCisjZGVmaW5lCQlSRE1BX0FD
Q0VTU19UUklHR0VSX0NIQU43CUdFTk1BU0soMzEsIDI0KQorI2RlZmluZQkJUkRNQV9BQ0NFU1Nf
VFJJR0dFUl9DSEFONglHRU5NQVNLKDIzLCAxNikKKyNkZWZpbmUJCVJETUFfQUNDRVNTX1RSSUdH
RVJfQ0hBTjUJR0VOTUFTSygxNSwgOCkKKyNkZWZpbmUJCVJETUFfQUNDRVNTX1RSSUdHRVJfQ0hB
TjQJR0VOTUFTSyg3LCAwKQogI2RlZmluZSBSRE1BX0FDQ0VTU19NQU4gMHgxMTEzCisjZGVmaW5l
CQlSRE1BX0FDQ0VTU19NQU5fUldfRkxBRwkJQklUKDIpCisjZGVmaW5lCQlSRE1BX0FDQ0VTU19N
QU5fQUREUl9JTkMJQklUKDEpCisjZGVmaW5lCQlSRE1BX0FDQ0VTU19NQU5fU1RBUlQJCUJJVCgw
KQogI2RlZmluZSBSRE1BX0NUUkwgMHgxMTE0CisjZGVmaW5lCQlSRE1BX0lSUV9DTEVBUl9DSEFO
NwlCSVQoMzEpCisjZGVmaW5lCQlSRE1BX0lSUV9DTEVBUl9DSEFONglCSVQoMzApCisjZGVmaW5l
CQlSRE1BX0lSUV9DTEVBUl9DSEFONQlCSVQoMjkpCisjZGVmaW5lCQlSRE1BX0lSUV9DTEVBUl9D
SEFONAlCSVQoMjgpCisjZGVmaW5lCQlSRE1BX0lSUV9DTEVBUl9DSEFOMwlCSVQoMjcpCisjZGVm
aW5lCQlSRE1BX0lSUV9DTEVBUl9DSEFOMglCSVQoMjYpCisjZGVmaW5lCQlSRE1BX0lSUV9DTEVB
Ul9DSEFOMQlCSVQoMjUpCisjZGVmaW5lCQlSRE1BX0lSUV9DTEVBUl9DSEFOX01BTglCSVQoMjQp
CisjZGVmaW5lCQlSRE1BX0RFRkFVTFRfQ09ORklHCShCSVQoNykgfCBCSVQoNikpCisjZGVmaW5l
CQlSRE1BX0NUUkxfQUhCX1dSX0JVUlNUCUdFTk1BU0soNSwgNCkKKyNkZWZpbmUJCVJETUFfQ1RS
TF9BSEJfUkRfQlVSU1QJR0VOTUFTSygzLCAyKQorI2RlZmluZQkJUkRNQV9DVFJMX1NXX1JFU0VU
CUJJVCgxKQorI2RlZmluZQkJUkRNQV9DVFJMX0ZSRUVfQ0xLX0VOCUJJVCgwKQogI2RlZmluZSBS
RE1BX1NUQVRVUyAweDExMTUKKyNkZWZpbmUJCVJETUFfSVJRX1NUQVRfQ0hBTjcJQklUKDMxKQor
I2RlZmluZQkJUkRNQV9JUlFfU1RBVF9DSEFONglCSVQoMzApCisjZGVmaW5lCQlSRE1BX0lSUV9T
VEFUX0NIQU41CUJJVCgyOSkKKyNkZWZpbmUJCVJETUFfSVJRX1NUQVRfQ0hBTjQJQklUKDI4KQor
I2RlZmluZQkJUkRNQV9JUlFfU1RBVF9DSEFOMwlCSVQoMjcpCisjZGVmaW5lCQlSRE1BX0lSUV9T
VEFUX0NIQU4yCUJJVCgyNikKKyNkZWZpbmUJCVJETUFfSVJRX1NUQVRfQ0hBTjEJQklUKDI1KQor
I2RlZmluZQkJUkRNQV9JUlFfU1RBVF9DSEFOX01BTglCSVQoMjQpCiAjZGVmaW5lIFJETUFfU1RB
VFVTMiAweDExMTYKICNkZWZpbmUgUkRNQV9TVEFUVVMzIDB4MTExNwogI2RlZmluZSBMX0dBTU1B
X0NOVExfUE9SVCAweDE0MDAKLS0gCjIuMjIuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
