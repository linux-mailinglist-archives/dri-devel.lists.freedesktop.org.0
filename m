Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5218D7506
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2019 13:33:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 053AC6E2C8;
	Tue, 15 Oct 2019 11:33:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E18626E7AD
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2019 11:33:21 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id z9so23401958wrl.11
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2019 04:33:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qDD2ziTUH4iVa0dzLE+0MqtrcwtEloFCQjzGa/0salE=;
 b=M7IoFQVEiLz60BgmndaHx2lqAlRzWQljhSmoUw0wjg70RlQ6BFU2Y19WL4m2SUX+xu
 sqfZN7/Mbiv+ss2g5GstcIvJF62SFB/XwmUpw/qy5j3pEF4wxWNbRCVV8pGMSRovjiF8
 aYq+yLK/l7iUoBPqo7snsFqkJY+v9Ld7S66dytUpTc5J1fMLh2hjVoreRnnd1/TN3LzP
 OOrV3xgoVXoVvqMSD1Jd20/4+pV4HWUEDYNx1kz3cKJZrpwv86BQbAizc3yirM60euai
 voQMgNGTKKwvJk27pcgFcgxs7wWOty7mkCH+czNri6i61+wsxCbbhTQRf9DNTsZzzR0n
 FsQQ==
X-Gm-Message-State: APjAAAUMUmbDkpc1cxEQ8bZUmpMxCOuTsJg6BWmCIkzYZ50viWqfTiZQ
 Jf4Uq0TTbtHSKhl04QMM0sCL0e6HOCscqA==
X-Google-Smtp-Source: APXvYqzvHDrAswuxfaKhLlsc6gVx/1CV0JI9RaDviWLgIieIrtHFyZ5gMV1lLmSdngWnO/oDbDSaIA==
X-Received: by 2002:a5d:50c9:: with SMTP id f9mr28942541wrt.36.1571139200081; 
 Tue, 15 Oct 2019 04:33:20 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id 63sm32395096wri.25.2019.10.15.04.33.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Oct 2019 04:33:19 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/3] drm/meson: add RDMA register bits defines
Date: Tue, 15 Oct 2019 13:33:15 +0200
Message-Id: <20191015113317.8870-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20191015113317.8870-1-narmstrong@baylibre.com>
References: <20191015113317.8870-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qDD2ziTUH4iVa0dzLE+0MqtrcwtEloFCQjzGa/0salE=;
 b=UKUn63uYSPaK29ydxiYmSknSs81jDHNuTMRX1J5rZqWRKtzQRtgYKONVZBUv4gEPso
 5GeJinkiduOh0IbwrGej/wJPrKKqCP0ASaiobuINL9/sQoCl4eBw1LHdGEZ+qgUqdIhL
 is6wfVj2XvWrXp9TvdGXppR4eGhs3YvjUht8aBRq8xi4UWX+88iPKhcyVYgNWHU4ZGg0
 utp8lrJFUvERfqO7bMuSCegmjZCKVbEmA0HFyJmDKkZLVPcpXycMW3Qx/Q/XRA/+Xcu3
 OL2BJHCuipRRgJZnImMjaXbO9cYA4zwpBcAzc2cFSAxp1QChHTL9iIJ5wi2ZjOQrNG+J
 lHUA==
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
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
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
