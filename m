Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3A1BBAE21
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2019 08:56:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A8C16E11D;
	Mon, 23 Sep 2019 06:56:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 124BA6E06D;
 Sat, 21 Sep 2019 10:04:45 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id r17so11231544wme.0;
 Sat, 21 Sep 2019 03:04:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Cl1hamWbYxOuqKv9OBA2dHu0ppphIuXvwxXH4x2FRcU=;
 b=dWMs3hUAFGFKcgB4UYuZxQ0C0Q/wXnQO/7nxy9p/+U7TH8En1HATQxZsMxERF62BeK
 Ua4M8ItnN2Ci2EkMLmngy0DcUoM+bUpdFd0nXAjgM2CTpsbQX6jaaUJnlFHRdvtHjqd9
 GrZElxHcGSK09I4GM9EbjPSNhYZqJdMuvWqFP9v+YY3LVyjgy4vQhF1KX8+yjMHYdQog
 qHWZGfoEsX7uBAkTlT6cYk0yOQQn4wBvw3bgQEFcyy67Y8xIx4AUwbQ76fnQ2tjJA7oD
 6oPl0+HYtrP2gaWRFNSbR/qmnWKHgycIQngE9Fb2YFu87ObeSG58SRpZjh9rFB4x0X9j
 arnA==
X-Gm-Message-State: APjAAAWwgtXspFEOWHqjeos8lOW19Fut/Dh4uJSlIdZnnh5L4CM0e7qg
 3VpgalfuRVx3frU0BZkklHw=
X-Google-Smtp-Source: APXvYqyMhT9AaSzDWVV2IXTpsqJJlTW9olrdehI9WtSsgTzKyDofKdram2crCjy/HFZujgXSK/M/4Q==
X-Received: by 2002:a1c:98c8:: with SMTP id a191mr6466479wme.17.1569060283313; 
 Sat, 21 Sep 2019 03:04:43 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([93.51.16.173])
 by smtp.gmail.com with ESMTPSA id g1sm3963575wrv.68.2019.09.21.03.04.42
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 21 Sep 2019 03:04:42 -0700 (PDT)
From: kholk11@gmail.com
To: linux-arm-msm@vger.kernel.org
Subject: [PATCH 0/5] DRM/MSM: Add support for MSM8956 and Adreno 510
Date: Sat, 21 Sep 2019 12:04:34 +0200
Message-Id: <20190921100439.64402-1-kholk11@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 23 Sep 2019 06:55:22 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Cl1hamWbYxOuqKv9OBA2dHu0ppphIuXvwxXH4x2FRcU=;
 b=pu2nEBk4lTAuoP0k3DciFPKz5zwXCqh6cZaKU3EBkFrW/o+ubfIJ/1lOfBopDd0m0j
 wImF0D/5tZeJu7vXp6Zz0Lmv2My3978tkgstO2/0TE+PnGkdSUuQEUcCR1SjxJjEjBu1
 2wes3YmAT1VRdxsUrO5oHCwGXTRY/hMBOUJBwfucDz3Bc/4V/tQ5ajgHqe2XDx3kOgbN
 h21X8zuRf5y89KKaIgmqc8IIzeUkC9N7LRoiYCyEjPIHErLmGnf9CKPbhSQmMGgoURRo
 NRxJaD+Tv917Qa7FHkIoAh6xv//huXOheGoPFwnnGs486/r0gU24A1rFnzKMOn0TQRiv
 sITQ==
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
Cc: mark.rutland@arm.com, freedreno@lists.freedesktop.org, marijns95@gmail.com,
 jonathan@marek.ca, airlied@linux.ie, gregkh@linuxfoundation.org,
 dri-devel@lists.freedesktop.org, bjorn.andersson@linaro.org,
 robh+dt@kernel.org, tglx@linutronix.de, kholk11@gmail.com, sean@poorly.run,
 georgi.djakov@linaro.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogQW5nZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8gPGtob2xrMTFAZ21haWwuY29tPgoKVGhp
cyBwYXRjaCBzZXJpZXMgZW5hYmxlcyBzdXBwb3J0IGZvciBNU004OTU2Lzc2IGFuZCBpdHMgQWRy
ZW5vIDUxMApHUFUgb24gdGhlIGN1cnJlbnQgRFJNIGRyaXZlci4KClRoZSBwZXJzb25hbCBhaW0g
aXMgdG8gdXBzdHJlYW0gTVNNODk1NiBhcyBtdWNoIGFzIHBvc3NpYmxlLgoKVGhpcyBjb2RlIGhh
cyBiZWVuIHRlc3RlZCBvbiB0d28gU29ueSBwaG9uZXMgZmVhdHVyaW5nIHRoZSBRdWFsY29tbQpN
U004OTU2IFNvQy4KCkFuZ2VsbyBHLiBEZWwgUmVnbm8gKDUpOgogIGRybS9tc20vbWRwNTogQWRk
IG9wdGlvbmFsIFRCVSBhbmQgVEJVX1JUIGNsb2NrcwogIGRybS9tc20vbWRwNTogQWRkIGNvbmZp
Z3VyYXRpb24gZm9yIG1zbTh4NTYKICBkcm0vbXNtL2RzaTogQWRkIGNvbmZpZ3VyYXRpb24gZm9y
IDI4bm0gUExMIG9uIGZhbWlseSBCCiAgZHJtL21zbS9kc2k6IEFkZCBjb25maWd1cmF0aW9uIGZv
ciA4eDU2CiAgZHJtL21zbS9hZHJlbm86IEFkZCBzdXBwb3J0IGZvciBBZHJlbm8gNTEwIEdQVQoK
IC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbXNtL2RzaS50eHQgICB8ICAxICsKIGRy
aXZlcnMvZ3B1L2RybS9tc20vYWRyZW5vL2E1eHhfZ3B1LmMgICAgICAgICB8IDg3ICsrKysrKysr
KysrKystLS0KIGRyaXZlcnMvZ3B1L2RybS9tc20vYWRyZW5vL2E1eHhfcG93ZXIuYyAgICAgICB8
ICA3ICsrCiBkcml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVuby9hZHJlbm9fZGV2aWNlLmMgICAgfCAx
NSArKysKIGRyaXZlcnMvZ3B1L2RybS9tc20vYWRyZW5vL2FkcmVub19ncHUuaCAgICAgICB8ICA1
ICsKIGRyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9tZHA1L21kcDVfY2ZnLmMgICAgICB8IDk5ICsr
KysrKysrKysrKysrKysrKysKIGRyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9tZHA1L21kcDVfa21z
LmMgICAgICB8IDEwICsrCiBkcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvbWRwNS9tZHA1X2ttcy5o
ICAgICAgfCAgMiArCiBkcml2ZXJzL2dwdS9kcm0vbXNtL2RzaS9kc2lfY2ZnLmMgICAgICAgICAg
ICAgfCAyMiArKysrKwogZHJpdmVycy9ncHUvZHJtL21zbS9kc2kvZHNpX2NmZy5oICAgICAgICAg
ICAgIHwgIDEgKwogZHJpdmVycy9ncHUvZHJtL21zbS9kc2kvcGh5L2RzaV9waHkuYyAgICAgICAg
IHwgIDIgKwogZHJpdmVycy9ncHUvZHJtL21zbS9kc2kvcGh5L2RzaV9waHkuaCAgICAgICAgIHwg
IDEgKwogZHJpdmVycy9ncHUvZHJtL21zbS9kc2kvcGh5L2RzaV9waHlfMjhubS5jICAgIHwgMTgg
KysrKwogMTMgZmlsZXMgY2hhbmdlZCwgMjU4IGluc2VydGlvbnMoKyksIDEyIGRlbGV0aW9ucygt
KQoKLS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
