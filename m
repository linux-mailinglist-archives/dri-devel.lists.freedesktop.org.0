Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 549EB2AC6D5
	for <lists+dri-devel@lfdr.de>; Mon,  9 Nov 2020 22:19:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3165B895B4;
	Mon,  9 Nov 2020 21:19:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 159B489598
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Nov 2020 21:19:27 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id s8so3284477wrw.10
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Nov 2020 13:19:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Tr0ixvpAne6ZdwZHnMFSb4ufpkRvb3k+F4potoikpiI=;
 b=gos6PdJK9eoOZt5jAVidZVPiNSp7oMO7v/VwIq7DXK6v8BMHqbyy322XdWXNcfBWKf
 rYyWHR0GBx0IoFGoaAXbiyoTaY9cr2uiACim4xVlAVhQp/drKv8pdLkhLS/HH5Kkx5md
 tol4j4FQeDeqF37INsLFh+mswbJiu4IN7tG/6B56wbIe2ENo8DXUBHxhH/Q+KYN9N6oH
 SelA1dZwpqUDcK+AXu+wxqkKMHHFLCicP4Uu5f2aAIJHV65JPoXv5nKByQNEr4PA1sO/
 nexs/LOKUrdFkJwytG62ilL+tRypUFvudMmo0ni9onyE480ckbyN2peZV9UCw2Qys3c0
 PIog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Tr0ixvpAne6ZdwZHnMFSb4ufpkRvb3k+F4potoikpiI=;
 b=MSqWsf3QfWwZMGrVfmW6uLhVSIlYjZfFPw+hVrwG4ttWFG8Ge/WEFheBcKPDXnwKnJ
 QZrtURQYZ1ClCdfsmmsCDwEGyu1+2pQzLpSy44Wr/IRlIAVdx+kXghSMj+Gg9GJOEb4h
 P+ovITKimUntDUNxgJpu9XM1WYYqCLOjZl5lFDoZDbl4AeXNzahYWvn+8xF62IwupFmw
 xbgl7SdCbUa9miGZOmihCYSKyHK4dD/Mh5cJ5tqqPRDaMN9a5viJ+IqaCQA2Sf/SjVsO
 xrwex1TpJANWgueRWIasWHonKpZmDDDe861egHWgMQl4cTGC8Xd6YVqEoXv7ZiACClz+
 QwCA==
X-Gm-Message-State: AOAM5337ohUUu7Ahesi+jGUsliEgxjN9SaZDzpjc8sq8DGO5+Utc/Epn
 309fEdwAJB1RsePRHY66KCdObw==
X-Google-Smtp-Source: ABdhPJyBmNq1JIYMn1Ln21eExIKIRlKHSenjgVq526BS9p+l/W7PscsUXFgUiNU3unXijKsSI7AghA==
X-Received: by 2002:a05:6000:1006:: with SMTP id
 a6mr11354521wrx.367.1604956765807; 
 Mon, 09 Nov 2020 13:19:25 -0800 (PST)
Received: from dell.default ([91.110.221.139])
 by smtp.gmail.com with ESMTPSA id 71sm15170630wrm.20.2020.11.09.13.19.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2020 13:19:25 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 09/20] drm/radeon/radeon_irq_kms: Demote non-conformant
 kernel-doc fix another
Date: Mon,  9 Nov 2020 21:18:44 +0000
Message-Id: <20201109211855.3340030-10-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201109211855.3340030-1-lee.jones@linaro.org>
References: <20201109211855.3340030-1-lee.jones@linaro.org>
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
cy9ncHUvZHJtL3JhZGVvbi9yYWRlb25faXJxX2ttcy5jOjU2OiB3YXJuaW5nOiBGdW5jdGlvbiBw
YXJhbWV0ZXIgb3IgbWVtYmVyICdpcnEnIG5vdCBkZXNjcmliZWQgaW4gJ3JhZGVvbl9kcml2ZXJf
aXJxX2hhbmRsZXJfa21zJwogZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25faXJxX2ttcy5j
OjU2OiB3YXJuaW5nOiBGdW5jdGlvbiBwYXJhbWV0ZXIgb3IgbWVtYmVyICdhcmcnIG5vdCBkZXNj
cmliZWQgaW4gJ3JhZGVvbl9kcml2ZXJfaXJxX2hhbmRsZXJfa21zJwogZHJpdmVycy9ncHUvZHJt
L3JhZGVvbi9yYWRlb25faXJxX2ttcy5jOjU3MTogd2FybmluZzogRnVuY3Rpb24gcGFyYW1ldGVy
IG9yIG1lbWJlciAnbicgbm90IGRlc2NyaWJlZCBpbiAncmFkZW9uX2lycV9rbXNfc2V0X2lycV9u
X2VuYWJsZWQnCiBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9pcnFfa21zLmM6NTcxOiB3
YXJuaW5nOiBFeGNlc3MgZnVuY3Rpb24gcGFyYW1ldGVyICdudW0nIGRlc2NyaXB0aW9uIGluICdy
YWRlb25faXJxX2ttc19zZXRfaXJxX25fZW5hYmxlZCcKCkNjOiBBbGV4IERldWNoZXIgPGFsZXhh
bmRlci5kZXVjaGVyQGFtZC5jb20+CkNjOiAiQ2hyaXN0aWFuIEvDtm5pZyIgPGNocmlzdGlhbi5r
b2VuaWdAYW1kLmNvbT4KQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KQ2M6IERh
bmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KQ2M6IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCkNjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnClNpZ25lZC1vZmYtYnk6
IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3Jh
ZGVvbi9yYWRlb25faXJxX2ttcy5jIHwgNiArKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2Vy
dGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3Jh
ZGVvbi9yYWRlb25faXJxX2ttcy5jIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25faXJx
X2ttcy5jCmluZGV4IGI4NmJjODhhZDQzMDguLjM1MjEwODQwMzBkMjQgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2lycV9rbXMuYworKysgYi9kcml2ZXJzL2dwdS9k
cm0vcmFkZW9uL3JhZGVvbl9pcnFfa21zLmMKQEAgLTQzLDExICs0Myw5IEBACiAKICNkZWZpbmUg
UkFERU9OX1dBSVRfSURMRV9USU1FT1VUIDIwMAogCi0vKioKKy8qCiAgKiByYWRlb25fZHJpdmVy
X2lycV9oYW5kbGVyX2ttcyAtIGlycSBoYW5kbGVyIGZvciBLTVMKICAqCi0gKiBAaW50IGlycSwg
dm9pZCAqYXJnOiBhcmdzCi0gKgogICogVGhpcyBpcyB0aGUgaXJxIGhhbmRsZXIgZm9yIHRoZSBy
YWRlb24gS01TIGRyaXZlciAoYWxsIGFzaWNzKS4KICAqIHJhZGVvbl9pcnFfcHJvY2VzcyBpcyBh
IG1hY3JvIHRoYXQgcG9pbnRzIHRvIHRoZSBwZXItYXNpYwogICogaXJxIGhhbmRsZXIgY2FsbGJh
Y2suCkBAIC01NTYsNyArNTU0LDcgQEAgdm9pZCByYWRlb25faXJxX2ttc19kaXNhYmxlX2hwZChz
dHJ1Y3QgcmFkZW9uX2RldmljZSAqcmRldiwgdW5zaWduZWQgaHBkX21hc2spCiAgKiBAbWFzazog
dGhlIG1hc2sgdGhhdCBlbmFibGVzIHRoZSBpbnRlcnJ1cHRzCiAgKiBAZW5hYmxlOiB3aGV0aGVy
IHRvIGVuYWJsZSBvciBkaXNhYmxlIHRoZSBpbnRlcnJ1cHQgcmVnaXN0ZXIKICAqIEBuYW1lOiB0
aGUgbmFtZSBvZiB0aGUgaW50ZXJydXB0IHJlZ2lzdGVyIHRvIHByaW50IHRvIHRoZSBrZXJuZWwg
bG9nCi0gKiBAbnVtOiB0aGUgbnVtYmVyIG9mIHRoZSBpbnRlcnJ1cHQgcmVnaXN0ZXIgdG8gcHJp
bnQgdG8gdGhlIGtlcm5lbCBsb2cKKyAqIEBuOiB0aGUgbnVtYmVyIG9mIHRoZSBpbnRlcnJ1cHQg
cmVnaXN0ZXIgdG8gcHJpbnQgdG8gdGhlIGtlcm5lbCBsb2cKICAqCiAgKiBIZWxwZXIgZm9yIHVw
ZGF0aW5nIHRoZSBlbmFibGUgc3RhdGUgb2YgaW50ZXJydXB0IHJlZ2lzdGVycy4gQ2hlY2tzIHdo
ZXRoZXIKICAqIG9yIG5vdCB0aGUgaW50ZXJydXB0IG1hdGNoZXMgdGhlIGVuYWJsZSBzdGF0ZSB3
ZSB3YW50LiBJZiBpdCBkb2Vzbid0LCB0aGVuCi0tIAoyLjI1LjEKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
