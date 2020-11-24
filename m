Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18C602C30D7
	for <lists+dri-devel@lfdr.de>; Tue, 24 Nov 2020 20:44:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 349D06E532;
	Tue, 24 Nov 2020 19:44:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7311B6E530
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Nov 2020 19:44:05 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id h21so95639wmb.2
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Nov 2020 11:44:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=L1J0FZrjGGbUvQrx4IUztzi5KvWWyU4p9mOY8CTJ3cA=;
 b=QXlVUxy6zeD7fG03DNRKZjOqWu/z5RftRerC7Nod0O6W82BFawtqlxypHgaR1y9cfS
 k4JVEcy4z2Sokjv0yUDlvFXL5rq2nVg+yG/XbM1ihly/c3pBUyKJBBqvWsEU772LQEJi
 IWtiAhdZe3S/MYFSU926bn1kXQwdlXGWXdZ+XUY5cN4hL72ZhijYDA/HDl1sh1wAwNu5
 XHyg/zNL2MIRxkfwfrh8n2HtZZohtLXDT9KfKPmgENUntqkpNScWvK+SWC/Pfwfq38MM
 P4fDdeodGJmFfOFLqHbuJ62dssNCTGpSfSnlew6jTU30F5HKWC0TY1t5QwaH7HwKEP+v
 vhUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=L1J0FZrjGGbUvQrx4IUztzi5KvWWyU4p9mOY8CTJ3cA=;
 b=OeTiT+Ad72nCstZfEOHDpYMrGUeFCql5BQ/HepoVBoE9cc5810PIeG1E2oI48VX3DY
 Yd3N85UQqh7YzJfKXEo/dY68Avz/8KkzbHPhM73A/0eVoh5Llb3LjPQ3K6yxf5xlo4NM
 elJiIfwTOAUuTpHVP//ScPENLkACu7T7w2YIlvy/rcf92W+Yooz5lYmqL2hEdrZYEvAA
 hKtvIFkf9K0kH9Dg0O7i1xuMQJVaWUqgoVKuCtaqTYCej7xJo4m1U8nlqSqTpswLCxiy
 H6y1EvXlC5FWYpDNerPpDqZmy5PCPuovArmk3N9oTBN2cetUocXX/ODt183M9ZVrWLmX
 CvKg==
X-Gm-Message-State: AOAM5303LcAD8JkjlmkQFAzSNLVAs131zBWgdjxRQRGEnGsDeV0gMUOh
 YrccSZojyR6+/2Mxo+BLbzhHlYFuC9+xqSaZ
X-Google-Smtp-Source: ABdhPJxc2TNfGqS0ggO4k/it/goFudlMzzl3LPT5tEdGbregUV4F60QAMLaiU8tsX9d38vnfFQcSEw==
X-Received: by 2002:a7b:cf2b:: with SMTP id m11mr134617wmg.163.1606247044173; 
 Tue, 24 Nov 2020 11:44:04 -0800 (PST)
Received: from dell.default ([91.110.221.235])
 by smtp.gmail.com with ESMTPSA id d134sm200511wmd.8.2020.11.24.11.44.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Nov 2020 11:44:03 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 04/40] drm/amd/amdgpu/iceland_ih: Add missing function param
 descriptions for 'ih' and 'entry'
Date: Tue, 24 Nov 2020 19:37:48 +0000
Message-Id: <20201124193824.1118741-5-lee.jones@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvaWNlbGFuZF9paC5jOjE5MTogd2FybmluZzogRnVuY3Rpb24g
cGFyYW1ldGVyIG9yIG1lbWJlciAnaWgnIG5vdCBkZXNjcmliZWQgaW4gJ2ljZWxhbmRfaWhfZ2V0
X3dwdHInCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9pY2VsYW5kX2loLmM6MjIzOiB3YXJu
aW5nOiBGdW5jdGlvbiBwYXJhbWV0ZXIgb3IgbWVtYmVyICdpaCcgbm90IGRlc2NyaWJlZCBpbiAn
aWNlbGFuZF9paF9kZWNvZGVfaXYnCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9pY2VsYW5k
X2loLmM6MjIzOiB3YXJuaW5nOiBGdW5jdGlvbiBwYXJhbWV0ZXIgb3IgbWVtYmVyICdlbnRyeScg
bm90IGRlc2NyaWJlZCBpbiAnaWNlbGFuZF9paF9kZWNvZGVfaXYnCiBkcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9pY2VsYW5kX2loLmM6MjUzOiB3YXJuaW5nOiBGdW5jdGlvbiBwYXJhbWV0ZXIg
b3IgbWVtYmVyICdpaCcgbm90IGRlc2NyaWJlZCBpbiAnaWNlbGFuZF9paF9zZXRfcnB0cicKCkNj
OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+CkNjOiAiQ2hyaXN0aWFu
IEvDtm5pZyIgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KQ2M6IERhdmlkIEFpcmxpZSA8YWly
bGllZEBsaW51eC5pZT4KQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KQ2M6IGFt
ZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCkNjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnClNpZ25lZC1vZmYtYnk6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+Ci0t
LQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvaWNlbGFuZF9paC5jIHwgNCArKysrCiAxIGZp
bGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvaWNlbGFuZF9paC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvaWNl
bGFuZF9paC5jCmluZGV4IGExM2RkOWE1MTE0OWEuLjM3ZDhiNmNhNGRhYjggMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2ljZWxhbmRfaWguYworKysgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9pY2VsYW5kX2loLmMKQEAgLTE3OSw2ICsxNzksNyBAQCBzdGF0aWMg
dm9pZCBpY2VsYW5kX2loX2lycV9kaXNhYmxlKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQog
ICogaWNlbGFuZF9paF9nZXRfd3B0ciAtIGdldCB0aGUgSUggcmluZyBidWZmZXIgd3B0cgogICoK
ICAqIEBhZGV2OiBhbWRncHVfZGV2aWNlIHBvaW50ZXIKKyAqIEBpaDogSUggcmluZyBidWZmZXIg
dG8gZmV0Y2ggd3B0cgogICoKICAqIEdldCB0aGUgSUggcmluZyBidWZmZXIgd3B0ciBmcm9tIGVp
dGhlciB0aGUgcmVnaXN0ZXIKICAqIG9yIHRoZSB3cml0ZWJhY2sgbWVtb3J5IGJ1ZmZlciAoVkkp
LiAgQWxzbyBjaGVjayBmb3IKQEAgLTIxMyw2ICsyMTQsOCBAQCBzdGF0aWMgdTMyIGljZWxhbmRf
aWhfZ2V0X3dwdHIoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCiAgKiBpY2VsYW5kX2loX2Rl
Y29kZV9pdiAtIGRlY29kZSBhbiBpbnRlcnJ1cHQgdmVjdG9yCiAgKgogICogQGFkZXY6IGFtZGdw
dV9kZXZpY2UgcG9pbnRlcgorICogQGloOiBJSCByaW5nIGJ1ZmZlciB0byBkZWNvZGUKKyAqIEBl
bnRyeTogSVYgZW50cnkgdG8gcGxhY2UgZGVjb2RlZCBpbmZvcm1hdGlvbiBpbnRvCiAgKgogICog
RGVjb2RlcyB0aGUgaW50ZXJydXB0IHZlY3RvciBhdCB0aGUgY3VycmVudCBycHRyCiAgKiBwb3Np
dGlvbiBhbmQgYWxzbyBhZHZhbmNlIHRoZSBwb3NpdGlvbi4KQEAgLTI0NSw2ICsyNDgsNyBAQCBz
dGF0aWMgdm9pZCBpY2VsYW5kX2loX2RlY29kZV9pdihzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRl
diwKICAqIGljZWxhbmRfaWhfc2V0X3JwdHIgLSBzZXQgdGhlIElIIHJpbmcgYnVmZmVyIHJwdHIK
ICAqCiAgKiBAYWRldjogYW1kZ3B1X2RldmljZSBwb2ludGVyCisgKiBAaWg6IElIIHJpbmcgYnVm
ZmVyIHRvIHNldCBycHRyCiAgKgogICogU2V0IHRoZSBJSCByaW5nIGJ1ZmZlciBycHRyLgogICov
Ci0tIAoyLjI1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bAo=
