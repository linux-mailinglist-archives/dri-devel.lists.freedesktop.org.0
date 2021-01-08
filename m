Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BD442EF89D
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jan 2021 21:15:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2C916E8CB;
	Fri,  8 Jan 2021 20:15:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC0986E8C7
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jan 2021 20:15:12 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id e25so9468842wme.0
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Jan 2021 12:15:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/ToVqtfELMjein9lDL+03lGe+1Pl1kI6Nuvl2V02OQw=;
 b=nPDEIclvcchArGWcIIvap7p0tV/Rf2lx9TgJnp2hWX/nn04pew9eH1DzQvuV0oY5dO
 uYlPu7t+/BwZmmgpIRvGBX6xDjVNdvmLl+T2XbI2y544GNEB6poJK2wXefPMvuaFj0LP
 1bCfmVawsAnd5iffgC8cCaUk23jdkFMPX+hldzpdztsaQnGn2D8TM1pnYc4PdJ6sTXk3
 P1sqHnU5kzx2HnlGpQuZsYJ+pxTCkn5kn6mPH3fPIPc1QO5y/Xrw6NNIr/Q1c7Xnw8aQ
 r9Pdv/WXBOoNMt3BNY+r7SM95gZeSzHHPx7Kev1iki8AutO6xe2Cz9US+Kdjr5TXZeoz
 MdEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/ToVqtfELMjein9lDL+03lGe+1Pl1kI6Nuvl2V02OQw=;
 b=QjojQ/h0yAmvxdzjAcbWqpTwoNpyo4OanaskwBVezYudyxXBvC99DVBC6Xq3lOcfKN
 0vwNajiIahj4MIVds9c3ohN0NHPn0G7Iy5o+sxtkfxp040eXc0VV0XjO3f4YV5nih+SF
 xRTxhoG/HQQrm/VNDJmhh4z8JJ6+UFE2pbfUVBEvV3jBEgLkjxxrpXnW7IqQDxzi53SA
 Q/jxhdd6Pd9vN23O/5sxjmtH67relu/k3Wjexo8wzR2IpNyFtc734OSGSkz6zVnyjH6D
 D0xF7Ds08OebY/gQpWAGTSn9lqoCOTLEWRn7/yQvH9nDEOA4lnVaopOnn+y1L9+IzYU2
 4gQA==
X-Gm-Message-State: AOAM531PUuTevKunSSv5KNnMM/ZVo+ikASLUa/8YuB9t7xoGv/xapKQq
 TQcYFoLqsbM08e/R/95Ex9gePw==
X-Google-Smtp-Source: ABdhPJwLriGozB2TPxioYAuJqC4MQxJsUyszHxe6cwB1QkejO+IfiqkrvkQrmnCI6WmGh/14mcUFyg==
X-Received: by 2002:a1c:1d08:: with SMTP id d8mr4586040wmd.159.1610136911373; 
 Fri, 08 Jan 2021 12:15:11 -0800 (PST)
Received: from dell.default ([91.110.221.229])
 by smtp.gmail.com with ESMTPSA id l8sm15598671wrb.73.2021.01.08.12.15.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jan 2021 12:15:10 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 05/40] drm/amd/amdgpu/vega20_ih: Add missing descriptions for
 'ih' and fix spelling error
Date: Fri,  8 Jan 2021 20:14:22 +0000
Message-Id: <20210108201457.3078600-6-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210108201457.3078600-1-lee.jones@linaro.org>
References: <20210108201457.3078600-1-lee.jones@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, Feifei Xu <Feifei.Xu@amd.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvdmVnYTIwX2loLmM6Mzc4OiB3YXJuaW5nOiBGdW5jdGlvbiBw
YXJhbWV0ZXIgb3IgbWVtYmVyICdpaCcgbm90IGRlc2NyaWJlZCBpbiAndmVnYTIwX2loX2dldF93
cHRyJwogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdmVnYTIwX2loLmM6NDIxOiB3YXJuaW5n
OiBGdW5jdGlvbiBwYXJhbWV0ZXIgb3IgbWVtYmVyICdpaCcgbm90IGRlc2NyaWJlZCBpbiAndmVn
YTIwX2loX2lycV9yZWFybScKIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3ZlZ2EyMF9paC5j
OjQ0Nzogd2FybmluZzogRnVuY3Rpb24gcGFyYW1ldGVyIG9yIG1lbWJlciAnaWgnIG5vdCBkZXNj
cmliZWQgaW4gJ3ZlZ2EyMF9paF9zZXRfcnB0cicKCkNjOiBBbGV4IERldWNoZXIgPGFsZXhhbmRl
ci5kZXVjaGVyQGFtZC5jb20+CkNjOiAiQ2hyaXN0aWFuIEvDtm5pZyIgPGNocmlzdGlhbi5rb2Vu
aWdAYW1kLmNvbT4KQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KQ2M6IERhbmll
bCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KQ2M6IEhhd2tpbmcgWmhhbmcgPEhhd2tpbmcuWmhh
bmdAYW1kLmNvbT4KQ2M6IEZlaWZlaSBYdSA8RmVpZmVpLlh1QGFtZC5jb20+CkNjOiBhbWQtZ2Z4
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpTaWduZWQtb2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgotLS0KIGRy
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3ZlZ2EyMF9paC5jIHwgNSArKysrLQogMSBmaWxlIGNo
YW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3ZlZ2EyMF9paC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvdmVnYTIwX2loLmMKaW5kZXggNDIwMzJjYTM4MGNjZi4uNWEzYzg2N2Q1ODgxMSAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdmVnYTIwX2loLmMKKysrIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdmVnYTIwX2loLmMKQEAgLTg4LDcgKzg4LDcgQEAgc3Rh
dGljIHZvaWQgdmVnYTIwX2loX2luaXRfcmVnaXN0ZXJfb2Zmc2V0KHN0cnVjdCBhbWRncHVfZGV2
aWNlICphZGV2KQogICogdmVnYTIwX2loX3RvZ2dsZV9yaW5nX2ludGVycnVwdHMgLSB0b2dnbGUg
dGhlIGludGVycnVwdCByaW5nIGJ1ZmZlcgogICoKICAqIEBhZGV2OiBhbWRncHVfZGV2aWNlIHBv
aW50ZXIKLSAqIEBpaDogYW1kZ3B1X2loX3JpbmcgcG9pbnRldAorICogQGloOiBhbWRncHVfaWhf
cmluZyBwb2ludGVyCiAgKiBAZW5hYmxlOiB0cnVlIC0gZW5hYmxlIHRoZSBpbnRlcnJ1cHRzLCBm
YWxzZSAtIGRpc2FibGUgdGhlIGludGVycnVwdHMKICAqCiAgKiBUb2dnbGUgdGhlIGludGVycnVw
dCByaW5nIGJ1ZmZlciAoVkVHQTIwKQpAQCAtMzY3LDYgKzM2Nyw3IEBAIHN0YXRpYyB2b2lkIHZl
Z2EyMF9paF9pcnFfZGlzYWJsZShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKICAqIHZlZ2Ey
MF9paF9nZXRfd3B0ciAtIGdldCB0aGUgSUggcmluZyBidWZmZXIgd3B0cgogICoKICAqIEBhZGV2
OiBhbWRncHVfZGV2aWNlIHBvaW50ZXIKKyAqIEBpaDogYW1kZ3B1X2loX3JpbmcgcG9pbnRlcgog
ICoKICAqIEdldCB0aGUgSUggcmluZyBidWZmZXIgd3B0ciBmcm9tIGVpdGhlciB0aGUgcmVnaXN0
ZXIKICAqIG9yIHRoZSB3cml0ZWJhY2sgbWVtb3J5IGJ1ZmZlciAoVkVHQTIwKS4gIEFsc28gY2hl
Y2sgZm9yCkBAIC00MTQsNiArNDE1LDcgQEAgc3RhdGljIHUzMiB2ZWdhMjBfaWhfZ2V0X3dwdHIo
c3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCiAgKiB2ZWdhMjBfaWhfaXJxX3JlYXJtIC0gcmVh
cm0gSVJRIGlmIGxvc3QKICAqCiAgKiBAYWRldjogYW1kZ3B1X2RldmljZSBwb2ludGVyCisgKiBA
aWg6IGFtZGdwdV9paF9yaW5nIHBvaW50ZXIKICAqCiAgKi8KIHN0YXRpYyB2b2lkIHZlZ2EyMF9p
aF9pcnFfcmVhcm0oc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCkBAIC00MzksNiArNDQxLDcg
QEAgc3RhdGljIHZvaWQgdmVnYTIwX2loX2lycV9yZWFybShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAq
YWRldiwKICAqIHZlZ2EyMF9paF9zZXRfcnB0ciAtIHNldCB0aGUgSUggcmluZyBidWZmZXIgcnB0
cgogICoKICAqIEBhZGV2OiBhbWRncHVfZGV2aWNlIHBvaW50ZXIKKyAqIEBpaDogYW1kZ3B1X2lo
X3JpbmcgcG9pbnRlcgogICoKICAqIFNldCB0aGUgSUggcmluZyBidWZmZXIgcnB0ci4KICAqLwot
LSAKMi4yNS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
