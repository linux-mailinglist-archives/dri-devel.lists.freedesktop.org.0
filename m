Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E127F2C0415
	for <lists+dri-devel@lfdr.de>; Mon, 23 Nov 2020 12:19:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B609E89D73;
	Mon, 23 Nov 2020 11:19:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDD0189AA7
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Nov 2020 11:19:45 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id h21so16859788wmb.2
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Nov 2020 03:19:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=L1fDlpcchEE8sJt9jBofLY6dgEAvbjxCo2YFiogOR0A=;
 b=pMKJZWqnGQ4EOGsM3m2PkBJTgPkL3qByu1IMOQ0X/arVLPTbGxxWRx1SJeEo/Ph48O
 vVN2QUHMHY9L5b9Rv/C5Ba4yptENb7hnEe1I/jE4i4Cq6aS4NeC8QCpdTbtz9RAC1WPz
 s8FUUBFETfQI9vuV51nSZ69uOd3k1WSU4j338+SMe1Exv4mLTQRtZDisLhXlftvz9ELl
 3nH/hb2pcU/WElO4+fX5n6PwzZP3Tsf+a68dcWx2p5DY+CHRkWvpfRNEOgXXhXCd7UPy
 1UOO0uiqnYk4FYrHawRONEioF2QOYeJpBxWk5AE3zznY6mfgbWWNvjt2+xPWlJ3Tp7Xx
 XEeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=L1fDlpcchEE8sJt9jBofLY6dgEAvbjxCo2YFiogOR0A=;
 b=YAIqyypakcBc2JL7OE6885Njgc2tg5wJAS2wFiFs88VZ8hJfIGFa7YOBkuMGfAPuTE
 7Bz1pPupSQiJDrursdxbY1w44ZUvG/vFDudGCC35PsBTpPeo2/s2VdPXINpQo+qHJS8k
 EuRCJ509rnpmz6Ioyy0dZ0+JFbVwiVGvMFimHq6bYZq39nwFhNvXDBeGwEQwaCIlejxw
 T1ZwY86OTU4klIx0JKI2qblDE09vgUh8Oj1gexVfS2W6ceumo3m9t+dmBXgl9UH2Mnxd
 SsnWDNI1V5I2OBhVyNlQD58OCsS+IwQ69Pyuhoc73RdI3xNZ2k+pJ8pI8jXq2FSFxSsh
 68bg==
X-Gm-Message-State: AOAM532fr1QHVgulhB7dhNIw/toMD+MKK5yqQj6/C8NzrC7uGXdPw9JC
 9kpTIx58WuKkDnpym585AIZoTQ==
X-Google-Smtp-Source: ABdhPJyV/P5H76Wb+5+JAxC5L618gZfe7yTIAvmY7yTdCp7caSJl75guw5MH+E5dslQmHNQXQNPNgg==
X-Received: by 2002:a1c:1c3:: with SMTP id 186mr23088850wmb.39.1606130384390; 
 Mon, 23 Nov 2020 03:19:44 -0800 (PST)
Received: from dell.default ([91.110.221.218])
 by smtp.gmail.com with ESMTPSA id n9sm16317290wmd.4.2020.11.23.03.19.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Nov 2020 03:19:43 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 17/40] drm/amd/amdgpu/gfx_v6_0: Supply description for
 'gfx_v6_0_ring_test_ib()'s 'timeout' param
Date: Mon, 23 Nov 2020 11:18:56 +0000
Message-Id: <20201123111919.233376-18-lee.jones@linaro.org>
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
 amd-gfx@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y2XzAuYzoxOTAzOiB3YXJuaW5nOiBGdW5jdGlvbiBw
YXJhbWV0ZXIgb3IgbWVtYmVyICd0aW1lb3V0JyBub3QgZGVzY3JpYmVkIGluICdnZnhfdjZfMF9y
aW5nX3Rlc3RfaWInCgpDYzogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29t
PgpDYzogIkNocmlzdGlhbiBLw7ZuaWciIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+CkNjOiBE
YXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxA
ZmZ3bGwuY2g+CkNjOiBTdW1pdCBTZW13YWwgPHN1bWl0LnNlbXdhbEBsaW5hcm8ub3JnPgpDYzog
YW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKQ2M6IGxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZwpDYzogbGluYXJvLW1tLXNp
Z0BsaXN0cy5saW5hcm8ub3JnClNpZ25lZC1vZmYtYnk6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxp
bmFyby5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y2XzAuYyB8IDEg
KwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y2XzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2dmeF92Nl8wLmMKaW5kZXggNjcxYzQ2ZWJlY2VkOS4uY2E3NDYzOGRlYzliNyAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y2XzAuYworKysgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9nZnhfdjZfMC5jCkBAIC0xODk0LDYgKzE4OTQsNyBAQCBzdGF0aWMg
dm9pZCBnZnhfdjZfMF9yaW5nX2VtaXRfaWIoc3RydWN0IGFtZGdwdV9yaW5nICpyaW5nLAogICog
Z2Z4X3Y2XzBfcmluZ190ZXN0X2liIC0gYmFzaWMgcmluZyBJQiB0ZXN0CiAgKgogICogQHJpbmc6
IGFtZGdwdV9yaW5nIHN0cnVjdHVyZSBob2xkaW5nIHJpbmcgaW5mb3JtYXRpb24KKyAqIEB0aW1l
b3V0OiB0aW1lb3V0IHZhbHVlIGluIGppZmZpZXMsIG9yIE1BWF9TQ0hFRFVMRV9USU1FT1VUCiAg
KgogICogQWxsb2NhdGUgYW4gSUIgYW5kIGV4ZWN1dGUgaXQgb24gdGhlIGdmeCByaW5nIChTSSku
CiAgKiBQcm92aWRlcyBhIGJhc2ljIGdmeCByaW5nIHRlc3QgdG8gdmVyaWZ5IHRoYXQgSUJzIGFy
ZSB3b3JraW5nLgotLSAKMi4yNS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWwK
