Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35BC8707A4
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2019 19:40:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B241789D73;
	Mon, 22 Jul 2019 17:40:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0393689D7B;
 Mon, 22 Jul 2019 17:40:47 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id 31so40344483wrm.1;
 Mon, 22 Jul 2019 10:40:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=P2u3WVZOxoMXROYBMO+U2l2dAHqPfXIiodrmDPuBaoA=;
 b=oYy8pYNNA5qaGEXt5oCZIAdqr3gX4rwW+bIQ6ZEwGrel2GlK4OzTbP1PvPDDoPkvI+
 yyu+XGFUNa+b9qhanBvm+6mXgq1Gcb8ZHeOwXwhUdhmjk/8qeZfJckzCacR8C/GJZIb/
 NZwkqQSdbAlYrBkmTrjeEjMF4el9hBSBLgKsT/U0HElusrUK173L9k12uPeflhZRodLS
 QUBDHCIDyfqFSJNb+gWc87UrZKMlFRymkRdAa/fT+Y09mmm9ac/1vXi3BxUCXrYDDmEo
 +oh+eI0U2Cp8fN02NugQ4o6rr2nIZg11CTM0dN4gLOFiV7jf6TJimLOoWNbovEj0FUYF
 CC2g==
X-Gm-Message-State: APjAAAU2bOtBM4y6XyJQ6Tj/cy5dVx/NQrix/+Y1flbbvgyYj+YI6NQp
 r1Pq/ybwBN7AU2o0vUNBPgS+gK+I
X-Google-Smtp-Source: APXvYqxSLq/ocfFfhMUu5nqgr0BqkvzKMrs5ZR52W57Xr5BXHVHN9FqUuvXYxiOGauC4rz0tq4f/Xg==
X-Received: by 2002:a5d:63c8:: with SMTP id c8mr35001176wrw.21.1563817246400; 
 Mon, 22 Jul 2019 10:40:46 -0700 (PDT)
Received: from arch-x1c3.cbg.collabora.co.uk
 ([2a00:5f00:102:0:9665:9cff:feee:aa4d])
 by smtp.gmail.com with ESMTPSA id b2sm51844663wrp.72.2019.07.22.10.40.45
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 22 Jul 2019 10:40:45 -0700 (PDT)
From: Emil Velikov <emil.l.velikov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/3] drm: drop DRM_AUTH from PRIME_TO/FROM_HANDLE ioctls
Date: Mon, 22 Jul 2019 18:40:25 +0100
Message-Id: <20190722174025.9830-3-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190722174025.9830-1-emil.l.velikov@gmail.com>
References: <20190722174025.9830-1-emil.l.velikov@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=P2u3WVZOxoMXROYBMO+U2l2dAHqPfXIiodrmDPuBaoA=;
 b=m21nKWQoaigxHufx4Hivx5CoDlffm/jmEZSRsvfMtxG2Nr1ChMONnuQVPO2zsPZlsa
 K5ESmEugZyuJjBzYwYDsfdneOILGmQdawcATeSwz7k67U3fiFmU6K3s/s9Hk8GHYCsNs
 ceQDBm65b475IHLY9YzU6xBi4kV2v+X5FXHMFQPZlX7RqcGjW8b+tRu/GygKyHZGO2qT
 +XoXiMOolNLATxqKUC5jYTw+VEbneqWssGxGpHQlmYCoEntRjO8ElM4+f0Vh+MyupNd/
 AaLJH9YAZyvWKX+Wo98Q2kGkngu32V6wJX5hV3RH2t45KwXK9rROVkxFAdiLdPELbjw1
 rKHA==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, emil.l.velikov@gmail.com,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogRW1pbCBWZWxpa292IDxlbWlsLnZlbGlrb3ZAY29sbGFib3JhLmNvbT4KCkFzIG1lbnRp
b25lZCBieSBDaHJpc3RpYW4sIGZvciBkcml2ZXJzIHdoaWNoIHN1cHBvcnQgb25seSBwcmltYXJ5
IG5vZGVzCnRoaXMgY2hhbmdlcyB0aGUgcmV0dXJuZWQgZXJyb3IgZnJvbSAtRUFDQ0VTIGludG8g
LUVPUE5PVFNVUFAvLUVOT1NZUy4KCkZvciBvdGhlcnMsIHRoaXMgY2hlY2sgaW4gcGFydGljdWxh
ciB3aWxsIGJlIGEgbm9vcC4gU28gbGV0J3MgcmVtb3ZlIGl0CmFzIHN1Z2dlc3RlZCBieSBDaHJp
c3RpYW4uCgpDYzogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgpDYzog
Q2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgpDYzogYW1kLWdmeEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4K
U2lnbmVkLW9mZi1ieTogRW1pbCBWZWxpa292IDxlbWlsLnZlbGlrb3ZAY29sbGFib3JhLmNvbT4K
LS0tCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2lvY3RsLmMgfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2Vk
LCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2RybV9pb2N0bC5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9pb2N0bC5jCmluZGV4IDA5
ZjdmOGUzM2ZhMy4uYTM5NzE3N2FmMzY5IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJt
X2lvY3RsLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9pb2N0bC5jCkBAIC02NDcsOCArNjQ3
LDggQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1faW9jdGxfZGVzYyBkcm1faW9jdGxzW10gPSB7
CiAKIAlEUk1fSU9DVExfREVGKERSTV9JT0NUTF9NT0RFX0dFVFJFU09VUkNFUywgZHJtX21vZGVf
Z2V0cmVzb3VyY2VzLCAwKSwKIAotCURSTV9JT0NUTF9ERUYoRFJNX0lPQ1RMX1BSSU1FX0hBTkRM
RV9UT19GRCwgZHJtX3ByaW1lX2hhbmRsZV90b19mZF9pb2N0bCwgRFJNX0FVVEh8RFJNX1JFTkRF
Ul9BTExPVyksCi0JRFJNX0lPQ1RMX0RFRihEUk1fSU9DVExfUFJJTUVfRkRfVE9fSEFORExFLCBk
cm1fcHJpbWVfZmRfdG9faGFuZGxlX2lvY3RsLCBEUk1fQVVUSHxEUk1fUkVOREVSX0FMTE9XKSwK
KwlEUk1fSU9DVExfREVGKERSTV9JT0NUTF9QUklNRV9IQU5ETEVfVE9fRkQsIGRybV9wcmltZV9o
YW5kbGVfdG9fZmRfaW9jdGwsIERSTV9SRU5ERVJfQUxMT1cpLAorCURSTV9JT0NUTF9ERUYoRFJN
X0lPQ1RMX1BSSU1FX0ZEX1RPX0hBTkRMRSwgZHJtX3ByaW1lX2ZkX3RvX2hhbmRsZV9pb2N0bCwg
RFJNX1JFTkRFUl9BTExPVyksCiAKIAlEUk1fSU9DVExfREVGKERSTV9JT0NUTF9NT0RFX0dFVFBM
QU5FUkVTT1VSQ0VTLCBkcm1fbW9kZV9nZXRwbGFuZV9yZXMsIDApLAogCURSTV9JT0NUTF9ERUYo
RFJNX0lPQ1RMX01PREVfR0VUQ1JUQywgZHJtX21vZGVfZ2V0Y3J0YywgMCksCi0tIAoyLjIxLjAK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
