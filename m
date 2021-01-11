Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B118B2F1ED9
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jan 2021 20:19:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 390BA89E08;
	Mon, 11 Jan 2021 19:19:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7B0689E06
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 19:19:40 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id c5so928999wrp.6
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 11:19:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gYAUvWYhLSY+y3POXwzPmF8UOJaTJ9mXjk2V2XniJm0=;
 b=AvjJHTIgB9FSFfzuhd2/xZddg8dZhEgKX/CNFOHHQ7b9yZsOPZNXR49nJuu2Y3EZf6
 nUy0bQnAI1boEBFBEoLLzNZNtykXnh6Nep+/FljRN06bxsfy9XrWoASbuW4gRpXFmeHq
 uw87V0KY+HzEFkFreB0xHPov/rSoFGqymGVJCJKOd5Xj7nLXfnnwmP4Rxeev8YCd/XzN
 eoNsw5lmZJrz9wKkkiTSm9obVvLZuTZuyD09jCcXNJMvvm/FUZRXFn8GSmGRi1njKqMW
 gFM8rEm3OsjmjtxdT9TdiLV56tLbw67SeScy7kFp2Og0E2rZzMC32vhYy9IZbztGz2XX
 y1/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gYAUvWYhLSY+y3POXwzPmF8UOJaTJ9mXjk2V2XniJm0=;
 b=FTFHHIfRUbz4wHoSuIKWEHsvz4f7VJJDerBsG9RtRr0JZtSRF8tIb5rVRqeFvHn2lW
 xxTruB3qP/MlhG3e2yEQO8miDMIyzVQAiD1VbABP5HB7GFfsWGF72wz/EzNtQI9jX3Gh
 t3IZbGk+eSVCtI1ayRj/GMDfWHeS/Qq19cMT1Y2R2W45ZqA8D9QUExd34ma5km6sIS7s
 OBvmXgw8B3HX1kXTDXmmFaH3VYf4UIS8/QNYM8hTKKIsl6z+tq1ZQLBghANqEBLFC1G2
 9qlMI86r4YDSmc+QDTElSpqADym9N9bkuqqfNKNpA27ez7e9Rujv353Hki8658WhuXAM
 STdQ==
X-Gm-Message-State: AOAM5302UBl87Ute1w/8hG+Mr3PvMt7G0/5CrxuISTYnYR0BCoVCGab9
 4dMPb/Eqxt49YEQhTBSq6ssQxA==
X-Google-Smtp-Source: ABdhPJx4yFMdBRMlt7UNZ0+TK6A3eCANJ4OL+8R9h9mxZjmvYAxD+wT/31ZR77V8KnbfZmyjH+EZVQ==
X-Received: by 2002:adf:fd41:: with SMTP id h1mr613515wrs.284.1610392779552;
 Mon, 11 Jan 2021 11:19:39 -0800 (PST)
Received: from dell.default ([91.110.221.229])
 by smtp.gmail.com with ESMTPSA id n3sm778090wrw.61.2021.01.11.11.19.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 11:19:38 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 07/40] drm/amd/display/dc/irq/irq_service: Make local function
 static
Date: Mon, 11 Jan 2021 19:18:53 +0000
Message-Id: <20210111191926.3688443-8-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210111191926.3688443-1-lee.jones@linaro.org>
References: <20210111191926.3688443-1-lee.jones@linaro.org>
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
Cc: Leo Li <sunpeng.li@amd.com>, Mauro Rossi <issor.oruam@gmail.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9kYy9pcnEvaXJxX3NlcnZpY2UuYzo4Mjoz
MTogd2FybmluZzogbm8gcHJldmlvdXMgcHJvdG90eXBlIGZvciDigJhmaW5kX2lycV9zb3VyY2Vf
aW5mb+KAmSBbLVdtaXNzaW5nLXByb3RvdHlwZXNdCgpDYzogSGFycnkgV2VudGxhbmQgPGhhcnJ5
LndlbnRsYW5kQGFtZC5jb20+CkNjOiBMZW8gTGkgPHN1bnBlbmcubGlAYW1kLmNvbT4KQ2M6IEFs
ZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KQ2M6ICJDaHJpc3RpYW4gS8O2
bmlnIiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgpDYzogRGF2aWQgQWlybGllIDxhaXJsaWVk
QGxpbnV4LmllPgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgpDYzogTWF1cm8g
Um9zc2kgPGlzc29yLm9ydWFtQGdtYWlsLmNvbT4KQ2M6IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCkNjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnClNpZ25lZC1vZmYtYnk6
IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2Ft
ZC9kaXNwbGF5L2RjL2lycS9pcnFfc2VydmljZS5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9kaXNwbGF5L2RjL2lycS9pcnFfc2VydmljZS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9k
aXNwbGF5L2RjL2lycS9pcnFfc2VydmljZS5jCmluZGV4IDZiZjI3YmRlODcyNDAuLjVmMjQ1YmRl
NTRmZjcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9pcnEvaXJx
X3NlcnZpY2UuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvaXJxL2lycV9z
ZXJ2aWNlLmMKQEAgLTc5LDcgKzc5LDcgQEAgdm9pZCBkYWxfaXJxX3NlcnZpY2VfZGVzdHJveShz
dHJ1Y3QgaXJxX3NlcnZpY2UgKippcnFfc2VydmljZSkKIAkqaXJxX3NlcnZpY2UgPSBOVUxMOwog
fQogCi1jb25zdCBzdHJ1Y3QgaXJxX3NvdXJjZV9pbmZvICpmaW5kX2lycV9zb3VyY2VfaW5mbygK
K3N0YXRpYyBjb25zdCBzdHJ1Y3QgaXJxX3NvdXJjZV9pbmZvICpmaW5kX2lycV9zb3VyY2VfaW5m
bygKIAlzdHJ1Y3QgaXJxX3NlcnZpY2UgKmlycV9zZXJ2aWNlLAogCWVudW0gZGNfaXJxX3NvdXJj
ZSBzb3VyY2UpCiB7Ci0tIAoyLjI1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbAo=
