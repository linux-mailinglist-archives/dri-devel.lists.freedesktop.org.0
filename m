Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B2072B4DA8
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 18:41:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C8086E9EB;
	Mon, 16 Nov 2020 17:41:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E22D96E8E7
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 17:41:29 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id k2so19701375wrx.2
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 09:41:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NO2flJnZQ5gKgn/ih0D6aTqpwf9ViRniG5BiRkSE7jU=;
 b=dNwXbsPl6q1/WYDA3oEdV/zceq4tTRbwO6lTXlm5XU9tFJdlL8uLCb2UQHW6BfNZn+
 mgndbZ8TvSG3mtt/+A+jocB/IQFje8yUxevFzpcVFB6E5R2NBK/G30xCQNZJztpaSFpj
 7ZL6jHg4IpI1yxLcXSvFPmiWVMom49yEIm89insI5yf38ZUfud8tZbfGClv+QtqTRh8K
 Gq07tgEv6tNT68z5M1XbSKZVOq8SQXXWhA7Hpv/yIwvULEp8E4HTctxb8tjJFZk/4Bb/
 WbgxYlrEvPj5DQjWt0ZA/cKbW6LHdSm7hTS8aDEIcN1QcPH3xmp0cy8EjLxZ15mIUZmy
 ZGvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NO2flJnZQ5gKgn/ih0D6aTqpwf9ViRniG5BiRkSE7jU=;
 b=pqkHWebDV88DzbMAJeEg82DdCouChKgJnWKlEAlnfzTVsOTxdNUeJ5mU67NtPUTO+s
 zC/YnDG3qVSuW+p6t/FFlKpk0b3cnOVR0ZehUtqAt0ItaLvkgY2QvuVv5ujQxvMDZIe4
 skx+oxiW3MmY2kuQVyV8uFW7WwOZ6ZqjrtQl8ogmMZg2FOH8Cwf6D5ROWejxO0wLGQGj
 gZ0gS/e/Jjw2YyNuHoh7VB2szRzVZ+O2RIV/6Z1rvalQaxdPxM48ngrv5WlurTN/KWwD
 BASfyqTTMlh6JxsoP0/vipJ/dTGBIFYpBk7cvhfklhBgDr/UtLNcwDks2zxb3h8BBvGO
 hPpg==
X-Gm-Message-State: AOAM532IShozTZcX6hrrA2ltDLYJmANKgyxvcYtoxW2DcmCuhaEoOf0T
 exEr3+Gfl0M4qF9Cf5nYdpOCkQ==
X-Google-Smtp-Source: ABdhPJz+zBLjNMtTAkRpY8Bqlfb5jRoe4b4kXclN6HEEszc34CvpCg6cluG5/xfolZQyW6Bj4pbxTw==
X-Received: by 2002:a5d:6411:: with SMTP id z17mr21002442wru.112.1605548488615; 
 Mon, 16 Nov 2020 09:41:28 -0800 (PST)
Received: from dell.default ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id n10sm24667224wrx.9.2020.11.16.09.41.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 09:41:27 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 07/42] drm/mediatek/mtk_dpi: Remove unused struct definition
 'mtk_dpi_encoder_funcs'
Date: Mon, 16 Nov 2020 17:40:37 +0000
Message-Id: <20201116174112.1833368-8-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201116174112.1833368-1-lee.jones@linaro.org>
References: <20201116174112.1833368-1-lee.jones@linaro.org>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Jie Qiu <jie.qiu@mediatek.com>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL21lZGlhdGVrL210a19kcGkuYzo1MzA6Mzk6IHdhcm5pbmc6IOKAmG10a19kcGlf
ZW5jb2Rlcl9mdW5jc+KAmSBkZWZpbmVkIGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtY29uc3QtdmFy
aWFibGU9XQoKQ2M6IENodW4tS3VhbmcgSHUgPGNodW5rdWFuZy5odUBrZXJuZWwub3JnPgpDYzog
UGhpbGlwcCBaYWJlbCA8cC56YWJlbEBwZW5ndXRyb25peC5kZT4KQ2M6IERhdmlkIEFpcmxpZSA8
YWlybGllZEBsaW51eC5pZT4KQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KQ2M6
IE1hdHRoaWFzIEJydWdnZXIgPG1hdHRoaWFzLmJnZ0BnbWFpbC5jb20+CkNjOiBKaWUgUWl1IDxq
aWUucWl1QG1lZGlhdGVrLmNvbT4KQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
Q2M6IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwpDYzogbGludXgtbWVkaWF0
ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpTaWduZWQtb2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25l
c0BsaW5hcm8ub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHBpLmMgfCA5
IC0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDkgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcGkuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRp
YXRlay9tdGtfZHBpLmMKaW5kZXggY2YxMWM0ODUwYjQwNS4uNTJmMTFhNjNhMzMwNCAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcGkuYworKysgYi9kcml2ZXJzL2dw
dS9kcm0vbWVkaWF0ZWsvbXRrX2RwaS5jCkBAIC01MjIsMTUgKzUyMiw2IEBAIHN0YXRpYyBpbnQg
bXRrX2RwaV9zZXRfZGlzcGxheV9tb2RlKHN0cnVjdCBtdGtfZHBpICpkcGksCiAJcmV0dXJuIDA7
CiB9CiAKLXN0YXRpYyB2b2lkIG10a19kcGlfZW5jb2Rlcl9kZXN0cm95KHN0cnVjdCBkcm1fZW5j
b2RlciAqZW5jb2RlcikKLXsKLQlkcm1fZW5jb2Rlcl9jbGVhbnVwKGVuY29kZXIpOwotfQotCi1z
dGF0aWMgY29uc3Qgc3RydWN0IGRybV9lbmNvZGVyX2Z1bmNzIG10a19kcGlfZW5jb2Rlcl9mdW5j
cyA9IHsKLQkuZGVzdHJveSA9IG10a19kcGlfZW5jb2Rlcl9kZXN0cm95LAotfTsKLQogc3RhdGlj
IGludCBtdGtfZHBpX2JyaWRnZV9hdHRhY2goc3RydWN0IGRybV9icmlkZ2UgKmJyaWRnZSwKIAkJ
CQkgZW51bSBkcm1fYnJpZGdlX2F0dGFjaF9mbGFncyBmbGFncykKIHsKLS0gCjIuMjUuMQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
