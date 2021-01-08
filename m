Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 307E72EF8A6
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jan 2021 21:15:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9E4C6E8D0;
	Fri,  8 Jan 2021 20:15:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99DE26E8D3
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jan 2021 20:15:26 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id a12so10120439wrv.8
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Jan 2021 12:15:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EprdkygQQeeC3xFfzaC8MU1I4kxvwWaMs/mQ4lWUqWY=;
 b=QgbTBp7NIQ6cMjQpN9ajxDDhoxzEh3uB8E0xPXcX72UNdYf3NJAQMX2HmAolEzEQCl
 APJ9C/UfuCn5kvTUIkCcN3eOgy3d0WNKC4zdca3c0tNvyoDo5vpp31Bviol4UInGfPWM
 sIACr/f+bwjh+pKNVXolQnElxLlEcLNhIKmYhXOvo+Rgp6qz6rF6zXuIievOaQUMY8oD
 Ot7ptexOlSpzw+tA4Gvu9OKRvIz+CxeRf8y9hkBWePe9ACdGkaiKJmuI7oC5/CzVt/c/
 iqSdtGROS+v1QFwtpLBeBnUYJ2/Nydb+q208F74w1qbwtz0/kiZqxOvkI+To3yVcw6nM
 ewXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EprdkygQQeeC3xFfzaC8MU1I4kxvwWaMs/mQ4lWUqWY=;
 b=lt379FF4EXVSvTakiz3lqwqdK2ateUaL+B9fWgy7JvaYj9TniRInwT5Jj4tH45HBer
 SNLkMVy4TEBbSnCeHhY2+ful2ykZIdRzz1FUtX4GHCpXYKSKch92u3AcJ0KQ1Qmj4xzJ
 sapVu9g3Ui6VABbrqpcLRjBHE9yGrRnqZaj4ygbJeU4wMfOZm4Tpq0lQxBOlhY39/cv8
 9AT99qnz9ZwjSeU+9mIv9Q1PtvKjhr4z08sTRpvNwdQdRMCXPvCy9Baa/tabxrE3YQTO
 aPX4gZtXXrwFOtkamkHLxAVtxStYL1B8IY7F2jQTZ0uNtaV3qu1TRjyE91yzsAOp42ny
 hrKA==
X-Gm-Message-State: AOAM5319n8bJ+ro1uWBaB3Rn+osSWGxPOjVGjhQ06vVuQj3lXnae1ZF0
 JLAXVyj4ngyq5UbemIm6TquT8Q==
X-Google-Smtp-Source: ABdhPJxZLiuupBgjimOBLQ9o78NI5+Pncd6QzWuKFO7HA12438j7MXJ1/hp4hVpMp/a39pOJnz8tug==
X-Received: by 2002:adf:e688:: with SMTP id r8mr5166369wrm.20.1610136925233;
 Fri, 08 Jan 2021 12:15:25 -0800 (PST)
Received: from dell.default ([91.110.221.229])
 by smtp.gmail.com with ESMTPSA id l8sm15598671wrb.73.2021.01.08.12.15.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jan 2021 12:15:24 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 14/40] drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs: Demote
 non-kernel-doc comment blocks
Date: Fri,  8 Jan 2021 20:14:31 +0000
Message-Id: <20210108201457.3078600-15-lee.jones@linaro.org>
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
Cc: Eryk Brol <eryk.brol@amd.com>, Leo Li <sunpeng.li@amd.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Mikita Lipski <mikita.lipski@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX2RlYnVn
ZnMuYzo2OTk6IHdhcm5pbmc6IEZ1bmN0aW9uIHBhcmFtZXRlciBvciBtZW1iZXIgJ20nIG5vdCBk
ZXNjcmliZWQgaW4gJ2RtdWJfdHJhY2VidWZmZXJfc2hvdycKIGRyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1Ly4uL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9kZWJ1Z2ZzLmM6Njk5OiB3YXJu
aW5nOiBGdW5jdGlvbiBwYXJhbWV0ZXIgb3IgbWVtYmVyICdkYXRhJyBub3QgZGVzY3JpYmVkIGlu
ICdkbXViX3RyYWNlYnVmZmVyX3Nob3cnCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9k
aXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1fZGVidWdmcy5jOjc0Mzogd2FybmluZzogRnVuY3Rp
b24gcGFyYW1ldGVyIG9yIG1lbWJlciAnbScgbm90IGRlc2NyaWJlZCBpbiAnZG11Yl9md19zdGF0
ZV9zaG93JwogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9hbWRncHVfZG0v
YW1kZ3B1X2RtX2RlYnVnZnMuYzo3NDM6IHdhcm5pbmc6IEZ1bmN0aW9uIHBhcmFtZXRlciBvciBt
ZW1iZXIgJ2RhdGEnIG5vdCBkZXNjcmliZWQgaW4gJ2RtdWJfZndfc3RhdGVfc2hvdycKCkNjOiBI
YXJyeSBXZW50bGFuZCA8aGFycnkud2VudGxhbmRAYW1kLmNvbT4KQ2M6IExlbyBMaSA8c3VucGVu
Zy5saUBhbWQuY29tPgpDYzogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29t
PgpDYzogIkNocmlzdGlhbiBLw7ZuaWciIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+CkNjOiBE
YXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxA
ZmZ3bGwuY2g+CkNjOiBNaWtpdGEgTGlwc2tpIDxtaWtpdGEubGlwc2tpQGFtZC5jb20+CkNjOiBF
cnlrIEJyb2wgPGVyeWsuYnJvbEBhbWQuY29tPgpDYzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKU2lnbmVkLW9mZi1ieTog
TGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1k
L2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9kZWJ1Z2ZzLmMgfCA0ICsrLS0KIDEgZmlsZSBj
aGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1fZGVidWdmcy5jIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1fZGVidWdmcy5j
CmluZGV4IDExNDU5ZmIwOWEzNzIuLmQ2NDVmM2U0NjEwZWIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX2RlYnVnZnMuYworKysgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9kZWJ1Z2ZzLmMK
QEAgLTY5MSw3ICs2OTEsNyBAQCBzdGF0aWMgc3NpemVfdCBkcF9waHlfdGVzdF9wYXR0ZXJuX2Rl
YnVnZnNfd3JpdGUoc3RydWN0IGZpbGUgKmYsIGNvbnN0IGNoYXIgX191cwogCXJldHVybiBzaXpl
OwogfQogCi0vKioKKy8qCiAgKiBSZXR1cm5zIHRoZSBETUNVQiB0cmFjZWJ1ZmZlciBjb250ZW50
cy4KICAqIEV4YW1wbGUgdXNhZ2U6IGNhdCAvc3lzL2tlcm5lbC9kZWJ1Zy9kcmkvMC9hbWRncHVf
ZG1fZG11Yl90cmFjZWJ1ZmZlcgogICovCkBAIC03MzUsNyArNzM1LDcgQEAgc3RhdGljIGludCBk
bXViX3RyYWNlYnVmZmVyX3Nob3coc3RydWN0IHNlcV9maWxlICptLCB2b2lkICpkYXRhKQogCXJl
dHVybiAwOwogfQogCi0vKioKKy8qCiAgKiBSZXR1cm5zIHRoZSBETUNVQiBmaXJtd2FyZSBzdGF0
ZSBjb250ZW50cy4KICAqIEV4YW1wbGUgdXNhZ2U6IGNhdCAvc3lzL2tlcm5lbC9kZWJ1Zy9kcmkv
MC9hbWRncHVfZG1fZG11Yl9md19zdGF0ZQogICovCi0tIAoyLjI1LjEKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
