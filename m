Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B61342EF8B2
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jan 2021 21:15:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33D516E8E4;
	Fri,  8 Jan 2021 20:15:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B7026E8DF
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jan 2021 20:15:42 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id g185so9442006wmf.3
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Jan 2021 12:15:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gUGfQYc+R1dSwJCy8EOZsDxk+j22XvGXIhAmHcCe5cw=;
 b=DWuALbOhM66Bs4VwVlyplT5ynHt8NzU3loaaZxKRM42BP/MjWrJmNNyXEDNQAWWUgJ
 AVVbyPb8jiDbNhUJkj4Gmsg7VzT3+WI261d/9SWtCnnkvlsZNNbXp0ehTrZASSv6Rrkv
 xiAVooMmLYM8rmb8ZwAnTu6rPmRD9O1kjkhFONkNcdyv22UeNWhpzZQJwZtq11T+Q/UR
 emEiXSKaK8tShQ2wut5xKFCiNJ+IKcYdMGxp3TkIsfzVueHbBGvpxrnmZ2nVdeC6X1vV
 dDC9x2dPQxojVJcxAbk2qGprHLHKrqdzLejDbibsn2hUTXEt+V5wuL2hydI5G1bhoXxX
 Oc7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gUGfQYc+R1dSwJCy8EOZsDxk+j22XvGXIhAmHcCe5cw=;
 b=ljJCZxP5V/EEwfVN4LmlrPwjwycXHngoV2OUhr1wAGs7ZpPdwYu1EIDkURqkI6AEn4
 WogJuSqa81RceDi//+zE0Zs83/ezOwTwlcoST4R/vDafSm10qJy3cpq5NeM35sdWY3DK
 gQ2Aw8BDkwVDHPgXNcdjNcgO2fxbfrV2avCtEM8TZ8oR0G8bi5P01PXJeneery53qvH8
 S2RnNBEV/pOSeYcYt8dBduOu0pX+fiy/VZ7KQcugjk/UBfUKYAFYrfcvAlnCUAVutzxl
 ItDVMuqrTBM0iy6vaGCksA8jNM71i3uurKdUj0tdX3O9PdfO7OoKnqYo/KL7PVFj62Rv
 W/Vw==
X-Gm-Message-State: AOAM5306L0WMOK3Hhs2FhK/krrUXSP9GZT4n74f869HdVIoJGk7W12pe
 CEmYxAup2+EaEi5C+7VhCl1UTg==
X-Google-Smtp-Source: ABdhPJwZWGT0SqzjU0ajhwspc3Sw3rWT8U3ETPx3G6MwoIvh2O6d6nInckJTXpUxvcYNu6v99GiJnA==
X-Received: by 2002:a1c:9a57:: with SMTP id c84mr4347583wme.183.1610136941141; 
 Fri, 08 Jan 2021 12:15:41 -0800 (PST)
Received: from dell.default ([91.110.221.229])
 by smtp.gmail.com with ESMTPSA id l8sm15598671wrb.73.2021.01.08.12.15.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jan 2021 12:15:40 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 25/40] drm/amd/display/dc/dce/dce_link_encoder: Make functions
 invoked by reference static
Date: Fri,  8 Jan 2021 20:14:42 +0000
Message-Id: <20210108201457.3078600-26-lee.jones@linaro.org>
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
cy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9kYy9kY2UvZGNlX2xpbmtfZW5jb2Rlci5j
OjEyMDA6Njogd2FybmluZzogbm8gcHJldmlvdXMgcHJvdG90eXBlIGZvciDigJhkY2U2MF9saW5r
X2VuY29kZXJfZW5hYmxlX2RwX291dHB1dOKAmSBbLVdtaXNzaW5nLXByb3RvdHlwZXNdCiBkcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9kaXNwbGF5L2RjL2RjZS9kY2VfbGlua19lbmNvZGVy
LmM6MTIzOTo2OiB3YXJuaW5nOiBubyBwcmV2aW91cyBwcm90b3R5cGUgZm9yIOKAmGRjZTYwX2xp
bmtfZW5jb2Rlcl9lbmFibGVfZHBfbXN0X291dHB1dOKAmSBbLVdtaXNzaW5nLXByb3RvdHlwZXNd
CiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9kaXNwbGF5L2RjL2RjZS9kY2VfbGlua19l
bmNvZGVyLmM6MTQyOTo2OiB3YXJuaW5nOiBubyBwcmV2aW91cyBwcm90b3R5cGUgZm9yIOKAmGRj
ZTYwX2xpbmtfZW5jb2Rlcl9kcF9zZXRfcGh5X3BhdHRlcm7igJkgWy1XbWlzc2luZy1wcm90b3R5
cGVzXQoKQ2M6IEhhcnJ5IFdlbnRsYW5kIDxoYXJyeS53ZW50bGFuZEBhbWQuY29tPgpDYzogTGVv
IExpIDxzdW5wZW5nLmxpQGFtZC5jb20+CkNjOiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVj
aGVyQGFtZC5jb20+CkNjOiAiQ2hyaXN0aWFuIEvDtm5pZyIgPGNocmlzdGlhbi5rb2VuaWdAYW1k
LmNvbT4KQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KQ2M6IERhbmllbCBWZXR0
ZXIgPGRhbmllbEBmZndsbC5jaD4KQ2M6IE1hdXJvIFJvc3NpIDxpc3Nvci5vcnVhbUBnbWFpbC5j
b20+CkNjOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpDYzogZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpTaWduZWQtb2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5h
cm8ub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2UvZGNlX2xpbmtf
ZW5jb2Rlci5jIHwgNiArKystLS0KIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2Rj
L2RjZS9kY2VfbGlua19lbmNvZGVyLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMv
ZGNlL2RjZV9saW5rX2VuY29kZXIuYwppbmRleCAyMTA0NjZiMmQ4NjMxLi4wZWYyZjRkOWQ4YmYz
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlL2RjZV9saW5r
X2VuY29kZXIuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlL2RjZV9s
aW5rX2VuY29kZXIuYwpAQCAtMTE5Nyw3ICsxMTk3LDcgQEAgdm9pZCBkY2UxMTBfbGlua19lbmNv
ZGVyX2VuYWJsZV9kcF9tc3Rfb3V0cHV0KAogCiAjaWYgZGVmaW5lZChDT05GSUdfRFJNX0FNRF9E
Q19TSSkKIC8qIGVuYWJsZXMgRFAgUEhZIG91dHB1dCAqLwotdm9pZCBkY2U2MF9saW5rX2VuY29k
ZXJfZW5hYmxlX2RwX291dHB1dCgKK3N0YXRpYyB2b2lkIGRjZTYwX2xpbmtfZW5jb2Rlcl9lbmFi
bGVfZHBfb3V0cHV0KAogCXN0cnVjdCBsaW5rX2VuY29kZXIgKmVuYywKIAljb25zdCBzdHJ1Y3Qg
ZGNfbGlua19zZXR0aW5ncyAqbGlua19zZXR0aW5ncywKIAllbnVtIGNsb2NrX3NvdXJjZV9pZCBj
bG9ja19zb3VyY2UpCkBAIC0xMjM2LDcgKzEyMzYsNyBAQCB2b2lkIGRjZTYwX2xpbmtfZW5jb2Rl
cl9lbmFibGVfZHBfb3V0cHV0KAogfQogCiAvKiBlbmFibGVzIERQIFBIWSBvdXRwdXQgaW4gTVNU
IG1vZGUgKi8KLXZvaWQgZGNlNjBfbGlua19lbmNvZGVyX2VuYWJsZV9kcF9tc3Rfb3V0cHV0KAor
c3RhdGljIHZvaWQgZGNlNjBfbGlua19lbmNvZGVyX2VuYWJsZV9kcF9tc3Rfb3V0cHV0KAogCXN0
cnVjdCBsaW5rX2VuY29kZXIgKmVuYywKIAljb25zdCBzdHJ1Y3QgZGNfbGlua19zZXR0aW5ncyAq
bGlua19zZXR0aW5ncywKIAllbnVtIGNsb2NrX3NvdXJjZV9pZCBjbG9ja19zb3VyY2UpCkBAIC0x
NDI2LDcgKzE0MjYsNyBAQCB2b2lkIGRjZTExMF9saW5rX2VuY29kZXJfZHBfc2V0X3BoeV9wYXR0
ZXJuKAogCiAjaWYgZGVmaW5lZChDT05GSUdfRFJNX0FNRF9EQ19TSSkKIC8qIHNldCBEUCBQSFkg
dGVzdCBhbmQgdHJhaW5pbmcgcGF0dGVybnMgKi8KLXZvaWQgZGNlNjBfbGlua19lbmNvZGVyX2Rw
X3NldF9waHlfcGF0dGVybigKK3N0YXRpYyB2b2lkIGRjZTYwX2xpbmtfZW5jb2Rlcl9kcF9zZXRf
cGh5X3BhdHRlcm4oCiAJc3RydWN0IGxpbmtfZW5jb2RlciAqZW5jLAogCWNvbnN0IHN0cnVjdCBl
bmNvZGVyX3NldF9kcF9waHlfcGF0dGVybl9wYXJhbSAqcGFyYW0pCiB7Ci0tIAoyLjI1LjEKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
