Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A0B12ADF60
	for <lists+dri-devel@lfdr.de>; Tue, 10 Nov 2020 20:31:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12A4489BF0;
	Tue, 10 Nov 2020 19:31:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10FAF89BDB
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 19:31:24 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id c17so14000106wrc.11
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 11:31:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wRyVj7QwW9m8+QJhWlLMpTOCKbqNO9FAw2XMc+XmqfM=;
 b=VXWEbmSQdarwlsBZu0sGfm2zUAEFee1etW65JRLgltUoi+G+TEfeOZuvcOFOtETnCl
 BR5u0aCXUDMEWbkQM8dypexH5UgRgI4h6cG10ovPBfrlnJlxBhDfQdojqGQiEzWjkbv2
 IP4UAKUedp43K+i37H+yZhL1bcqhNEp8De6a/VguzFgKA4iokYZ+bFOl3qn9hbp8enbe
 wxHwYjyBP15UyrKgnwQGKu5uSOZB5y9CI009lwCVp0s83UX9oHeQM4fjPomRExZibnxt
 pPN7DIs/GidNsVTpHOIdaS1azDjBDcohEpKiQ8LdZDfycd5MpkEQCRUpk8za67UsVFxp
 D19w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wRyVj7QwW9m8+QJhWlLMpTOCKbqNO9FAw2XMc+XmqfM=;
 b=cxAyXrTVa74PJRl/sgpfdocGzDFHjJqeedIrgaf7ozibRJM/2EILf6jr7TycOQtylo
 x3jP0giUhGjrgWX3vqb0vHonn/8kjAmJVQf5rc+xbRPtwGxXIMTUe7SxCDupJl+pUfop
 SJsqxoD05hCPrVGdMrcbkb+GStAtwFHJ8IYbK4xLu9yBbBSCnpErGaiLv0pNmsJaHgwS
 UMxgsfpCjGgxUTq50KFdSeEKznp0GcoYXpwj2vqrFqOd8s6MVEVFWYCRTsgSa0QygM32
 vbHTBbTHQXOHMfdB5z+VpOHSEdLbdV9VX8O683Oon/vCGiaTRDQz5cdkjhy73xuWIenj
 hxPg==
X-Gm-Message-State: AOAM533TDIycZo8bA2yBVNd8HQyo1fI+qc5PhZrhHMuzf7hKA1AUZcPh
 YKX8Ayh23sNMFFLjhxypWCFAiQ==
X-Google-Smtp-Source: ABdhPJwWshC2o53BvNhQdk0R+5cyozx2c9WuwgLipcJsRxBlRZ8RuYlhCvVs65g9PrFdKEC6fxWuCg==
X-Received: by 2002:a5d:634c:: with SMTP id b12mr10100178wrw.130.1605036682691; 
 Tue, 10 Nov 2020 11:31:22 -0800 (PST)
Received: from dell.default ([91.110.221.139])
 by smtp.gmail.com with ESMTPSA id 30sm17635335wrs.84.2020.11.10.11.31.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 11:31:22 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 05/30] drm/radeon/cik: Remove set but unused variable
 'mc_shared_chmap'
Date: Tue, 10 Nov 2020 19:30:47 +0000
Message-Id: <20201110193112.988999-6-lee.jones@linaro.org>
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
cy9ncHUvZHJtL3JhZGVvbi9jaWsuYzogSW4gZnVuY3Rpb24g4oCYY2lrX2dwdV9pbml04oCZOgog
ZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9jaWsuYzozMTgwOjY6IHdhcm5pbmc6IHZhcmlhYmxlIOKA
mG1jX3NoYXJlZF9jaG1hcOKAmSBzZXQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1idXQtc2V0LXZh
cmlhYmxlXQoKQ2M6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KQ2M6
ICJDaHJpc3RpYW4gS8O2bmlnIiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgpDYzogRGF2aWQg
QWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xs
LmNoPgpDYzogU3VtaXQgU2Vtd2FsIDxzdW1pdC5zZW13YWxAbGluYXJvLm9yZz4KQ2M6IGFtZC1n
ZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCkNjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCkNjOiBsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmcKQ2M6IGxpbmFyby1tbS1zaWdAbGlz
dHMubGluYXJvLm9yZwpTaWduZWQtb2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8u
b3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vY2lrLmMgfCA0ICsrLS0KIDEgZmlsZSBj
aGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL3JhZGVvbi9jaWsuYyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vY2lrLmMK
aW5kZXggNDQ5NGY5MTIyZmQ5MS4uYjk0ZTJlNjc4ZjI1NSAxMDA2NDQKLS0tIGEvZHJpdmVycy9n
cHUvZHJtL3JhZGVvbi9jaWsuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL2Npay5jCkBA
IC0zMTc3LDcgKzMxNzcsNyBAQCBzdGF0aWMgdm9pZCBjaWtfc2V0dXBfcmIoc3RydWN0IHJhZGVv
bl9kZXZpY2UgKnJkZXYsCiBzdGF0aWMgdm9pZCBjaWtfZ3B1X2luaXQoc3RydWN0IHJhZGVvbl9k
ZXZpY2UgKnJkZXYpCiB7CiAJdTMyIGdiX2FkZHJfY29uZmlnID0gUlJFRzMyKEdCX0FERFJfQ09O
RklHKTsKLQl1MzIgbWNfc2hhcmVkX2NobWFwLCBtY19hcmJfcmFtY2ZnOworCXUzMiBtY19hcmJf
cmFtY2ZnOwogCXUzMiBoZHBfaG9zdF9wYXRoX2NudGw7CiAJdTMyIHRtcDsKIAlpbnQgaSwgajsK
QEAgLTMyNzAsNyArMzI3MCw3IEBAIHN0YXRpYyB2b2lkIGNpa19ncHVfaW5pdChzdHJ1Y3QgcmFk
ZW9uX2RldmljZSAqcmRldikKIAogCVdSRUczMihCSUZfRkJfRU4sIEZCX1JFQURfRU4gfCBGQl9X
UklURV9FTik7CiAKLQltY19zaGFyZWRfY2htYXAgPSBSUkVHMzIoTUNfU0hBUkVEX0NITUFQKTsK
KwlSUkVHMzIoTUNfU0hBUkVEX0NITUFQKTsKIAltY19hcmJfcmFtY2ZnID0gUlJFRzMyKE1DX0FS
Ql9SQU1DRkcpOwogCiAJcmRldi0+Y29uZmlnLmNpay5udW1fdGlsZV9waXBlcyA9IHJkZXYtPmNv
bmZpZy5jaWsubWF4X3RpbGVfcGlwZXM7Ci0tIAoyLjI1LjEKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
