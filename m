Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0812A2C30DC
	for <lists+dri-devel@lfdr.de>; Tue, 24 Nov 2020 20:44:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE3236E53C;
	Tue, 24 Nov 2020 19:44:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C44396E542
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Nov 2020 19:44:12 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id p22so80208wmg.3
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Nov 2020 11:44:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=S/LGt8e6L64JAUL4CT/1IK4l3Dhv3BlKAOxBbtF4q2Y=;
 b=MEXHM1XESDogQHFfN3R4bynB0veB0Mi8lFjJtgfaZVWY5T8zvvbNN+2TlP9zYS1vHI
 6ESdKOievxShN8Cu7g04MDj+zHLSuErcwz3GRGoqe8nc0On0bv8drWOofDWVMObj44zn
 N86Zx52vI4kQ0f/LB0c6zQ2AhmPavlAJ8TwbKti0GwoW1hTjD8RgAHVaqRnwkkbF52rd
 +BvbH351Wdbh1h886XoNMPWoWrIKEw13vmaG9CZzvqOmA8LwSl8yJcs5hvKcV+AVmc1m
 0KGpQ0lfL6evjhd0DdKTcGJfqI77zymc/Wj6gNniRR699QG7F9yQdEuNfEuFt1HhoQkY
 GCwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=S/LGt8e6L64JAUL4CT/1IK4l3Dhv3BlKAOxBbtF4q2Y=;
 b=m93grOb+76l0QB41XhUIEOAyCEOFu5NTIqD+XdLBv0p0QvYGaoUzqhDEFew1+AIRxP
 Vz+0y1n8n+LvD9Hzgu2CrZfEGr5NlKHG0rSqRjmwEsmuD28uGQjhIEkRihS6IJQpo8WH
 JBsUgu2oTkwc4ltVHoZEF0+MZ1O218ZPnLtrhFKW75OmD50mflbBIjOhFAHWujSG84en
 5kUoQiiFtI1yOPISu4eDs/IzvzxfneavhdcH30ZkeajaN5tWQ2XqniD1uc15VMrawAkE
 bkrZPvdjk6zWIg1neufzAu/g1r6NCvAQ3y/RQMejCk/dWsZYWcfjF58+FfzaerO9XTaL
 CZBg==
X-Gm-Message-State: AOAM532Qd6TfSZfWs2ydmrC3XrPnQnDVJledm8TEO/Ue5O/kaGVnhmHm
 xc65TUvsXtPyykejCjSS9BUn9A==
X-Google-Smtp-Source: ABdhPJyxOoAxWaCxDE+GYFO65fr1bgljFI1ba7+hik2P3LFmw6uXan361fLLAp0T1omJO2iSZUaVQA==
X-Received: by 2002:a1c:7e4f:: with SMTP id z76mr49811wmc.149.1606247051472;
 Tue, 24 Nov 2020 11:44:11 -0800 (PST)
Received: from dell.default ([91.110.221.235])
 by smtp.gmail.com with ESMTPSA id d134sm200511wmd.8.2020.11.24.11.44.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Nov 2020 11:44:10 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 10/40] drm/amd/amdgpu/navi10_ih: Add descriptions for 'ih' and
 'entry'
Date: Tue, 24 Nov 2020 19:37:54 +0000
Message-Id: <20201124193824.1118741-11-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201124193824.1118741-1-lee.jones@linaro.org>
References: <20201124193824.1118741-1-lee.jones@linaro.org>
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
Cc: Alex Sierra <alex.sierra@amd.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvbmF2aTEwX2loLmM6NDUzOiB3YXJuaW5nOiBGdW5jdGlvbiBw
YXJhbWV0ZXIgb3IgbWVtYmVyICdpaCcgbm90IGRlc2NyaWJlZCBpbiAnbmF2aTEwX2loX2dldF93
cHRyJwogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbmF2aTEwX2loLmM6NTEyOiB3YXJuaW5n
OiBGdW5jdGlvbiBwYXJhbWV0ZXIgb3IgbWVtYmVyICdpaCcgbm90IGRlc2NyaWJlZCBpbiAnbmF2
aTEwX2loX2RlY29kZV9pdicKIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L25hdmkxMF9paC5j
OjUxMjogd2FybmluZzogRnVuY3Rpb24gcGFyYW1ldGVyIG9yIG1lbWJlciAnZW50cnknIG5vdCBk
ZXNjcmliZWQgaW4gJ25hdmkxMF9paF9kZWNvZGVfaXYnCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9uYXZpMTBfaWguYzo1NTI6IHdhcm5pbmc6IEZ1bmN0aW9uIHBhcmFtZXRlciBvciBtZW1i
ZXIgJ2loJyBub3QgZGVzY3JpYmVkIGluICduYXZpMTBfaWhfaXJxX3JlYXJtJwogZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvbmF2aTEwX2loLmM6NTg1OiB3YXJuaW5nOiBGdW5jdGlvbiBwYXJh
bWV0ZXIgb3IgbWVtYmVyICdpaCcgbm90IGRlc2NyaWJlZCBpbiAnbmF2aTEwX2loX3NldF9ycHRy
JwoKQ2M6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KQ2M6ICJDaHJp
c3RpYW4gS8O2bmlnIiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgpDYzogRGF2aWQgQWlybGll
IDxhaXJsaWVkQGxpbnV4LmllPgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgpD
YzogQWxleCBTaWVycmEgPGFsZXguc2llcnJhQGFtZC5jb20+CkNjOiBhbWQtZ2Z4QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpTaWduZWQt
b2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgotLS0KIGRyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L25hdmkxMF9paC5jIHwgNSArKysrKwogMSBmaWxlIGNoYW5nZWQsIDUg
aW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L25h
dmkxMF9paC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbmF2aTEwX2loLmMKaW5kZXgg
ODM3NzY5ZmNiMzViNy4uMzMzODA1MmIwODBiNiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvbmF2aTEwX2loLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
bmF2aTEwX2loLmMKQEAgLTQ0Miw2ICs0NDIsNyBAQCBzdGF0aWMgdm9pZCBuYXZpMTBfaWhfaXJx
X2Rpc2FibGUoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiAgKiBuYXZpMTBfaWhfZ2V0X3dw
dHIgLSBnZXQgdGhlIElIIHJpbmcgYnVmZmVyIHdwdHIKICAqCiAgKiBAYWRldjogYW1kZ3B1X2Rl
dmljZSBwb2ludGVyCisgKiBAaWg6IElIIHJpbmcgYnVmZmVyIHRvIGZldGNoIHdwdHIKICAqCiAg
KiBHZXQgdGhlIElIIHJpbmcgYnVmZmVyIHdwdHIgZnJvbSBlaXRoZXIgdGhlIHJlZ2lzdGVyCiAg
KiBvciB0aGUgd3JpdGViYWNrIG1lbW9yeSBidWZmZXIgKE5BVkkxMCkuICBBbHNvIGNoZWNrIGZv
cgpAQCAtNTAyLDYgKzUwMyw4IEBAIHN0YXRpYyB1MzIgbmF2aTEwX2loX2dldF93cHRyKHN0cnVj
dCBhbWRncHVfZGV2aWNlICphZGV2LAogICogbmF2aTEwX2loX2RlY29kZV9pdiAtIGRlY29kZSBh
biBpbnRlcnJ1cHQgdmVjdG9yCiAgKgogICogQGFkZXY6IGFtZGdwdV9kZXZpY2UgcG9pbnRlcgor
ICogQGloOiBJSCByaW5nIGJ1ZmZlciB0byBkZWNvZGUKKyAqIEBlbnRyeTogSVYgZW50cnkgdG8g
cGxhY2UgZGVjb2RlZCBpbmZvcm1hdGlvbiBpbnRvCiAgKgogICogRGVjb2RlcyB0aGUgaW50ZXJy
dXB0IHZlY3RvciBhdCB0aGUgY3VycmVudCBycHRyCiAgKiBwb3NpdGlvbiBhbmQgYWxzbyBhZHZh
bmNlIHRoZSBwb3NpdGlvbi4KQEAgLTU0NSw2ICs1NDgsNyBAQCBzdGF0aWMgdm9pZCBuYXZpMTBf
aWhfZGVjb2RlX2l2KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAogICogbmF2aTEwX2loX2ly
cV9yZWFybSAtIHJlYXJtIElSUSBpZiBsb3N0CiAgKgogICogQGFkZXY6IGFtZGdwdV9kZXZpY2Ug
cG9pbnRlcgorICogQGloOiBJSCByaW5nIHRvIG1hdGNoCiAgKgogICovCiBzdGF0aWMgdm9pZCBu
YXZpMTBfaWhfaXJxX3JlYXJtKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LApAQCAtNTc4LDYg
KzU4Miw3IEBAIHN0YXRpYyB2b2lkIG5hdmkxMF9paF9pcnFfcmVhcm0oc3RydWN0IGFtZGdwdV9k
ZXZpY2UgKmFkZXYsCiAgKgogICogQGFkZXY6IGFtZGdwdV9kZXZpY2UgcG9pbnRlcgogICoKKyAq
IEBpaDogSUggcmluZyBidWZmZXIgdG8gc2V0IHJwdHIKICAqIFNldCB0aGUgSUggcmluZyBidWZm
ZXIgcnB0ci4KICAqLwogc3RhdGljIHZvaWQgbmF2aTEwX2loX3NldF9ycHRyKHN0cnVjdCBhbWRn
cHVfZGV2aWNlICphZGV2LAotLSAKMi4yNS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWwK
