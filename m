Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE6A52C30F5
	for <lists+dri-devel@lfdr.de>; Tue, 24 Nov 2020 20:45:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E9E76E5A3;
	Tue, 24 Nov 2020 19:44:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B19C6E54C
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Nov 2020 19:44:15 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id a3so81139wmb.5
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Nov 2020 11:44:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FS9YPeBS7kCrSPbUVkxYBE/KfGD+0TCEKMjrGKoj90U=;
 b=uPKMUh800nKfHaIh28pUF8SIocH8o+qrfL+QGuLUqd1kge/4Pl3XBpgRH2vT7ZMJSY
 uakHIOVbvrsrVX5vocCdEfXc4nhCqiXticos1FPTvuuwGD74+vEUTrQ77bG4krExi0Yj
 2KOTD2uvcR+0wE7EYSaX/7PE4vNy/XMZk7JBoQ3k2lzhwIXBqDY3oO1lQEHVNB8Wvi1f
 zjkWjrssK0ni8EdeoVN989g5UCWkHIWXrwwwUSka5WH7gYX5ThWerASjzmLoXGqX8QaJ
 C5CTqEy+zxMcqZWmfi/+uP+kU1QkfLIH1Cw2NQUv3dNg3u/52dC+0Jtm/hB8C6eS0Q3K
 hpOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FS9YPeBS7kCrSPbUVkxYBE/KfGD+0TCEKMjrGKoj90U=;
 b=X/jROgmJMOP8ADsVuy3Xx2NefQxuR/08r+tyrGHW2Oq0EwIIaJ0EJqTjUdnF65O9EB
 88QU8BFuhnnUb5MEVy6/xcy/zgww+W+PrlUTHh14c0LC+5kpHGcbhI9PdBPKwZqKJFJf
 MDhYGgpgfn8Hmh4hLAfmhZSiw1eLGRfghLUiC1+uRiBDbgG/7pr2fA771I8m5CIV3fP8
 C07QbJlhRStV6UNFssFi/BpxGksQ/JqIV4phTsc/PXqL09TtWZsSCauUJFsc9JHgjRhe
 Ay1z8JZTB80sBvp5QwLiezk/EVg7De7g8Hwkceh2/+RF0RAyPZBHK3btm6wC//slY9Gx
 ow6Q==
X-Gm-Message-State: AOAM531up1iMFQbRFDqkx+nFB4tCsMEOXhG3XnX9uxf08CIqsCFRSWsc
 XpDcfeMxCFa/N9HlYkdZL/VR0w==
X-Google-Smtp-Source: ABdhPJzsE7Vx9UXN4W0umVdESe5TbA5OW0VFsT+YDpvTZyofmmt2DJ2JzZ4s9n8DupjG43ptWoyjKw==
X-Received: by 2002:a7b:cb0c:: with SMTP id u12mr166411wmj.11.1606247053955;
 Tue, 24 Nov 2020 11:44:13 -0800 (PST)
Received: from dell.default ([91.110.221.235])
 by smtp.gmail.com with ESMTPSA id d134sm200511wmd.8.2020.11.24.11.44.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Nov 2020 11:44:13 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 12/40] drm/amd/amdgpu/dce_v10_0: Supply description for
 function param 'async'
Date: Tue, 24 Nov 2020 19:37:56 +0000
Message-Id: <20201124193824.1118741-13-lee.jones@linaro.org>
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
 amd-gfx@lists.freedesktop.org, Luben Tuikov <luben.tuikov@amd.com>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvZGNlX3YxMF8wLmM6MjM3OiB3YXJuaW5nOiBGdW5jdGlvbiBw
YXJhbWV0ZXIgb3IgbWVtYmVyICdhc3luYycgbm90IGRlc2NyaWJlZCBpbiAnZGNlX3YxMF8wX3Bh
Z2VfZmxpcCcKCkNjOiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+CkNj
OiAiQ2hyaXN0aWFuIEvDtm5pZyIgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KQ2M6IERhdmlk
IEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZnds
bC5jaD4KQ2M6IEx1YmVuIFR1aWtvdiA8bHViZW4udHVpa292QGFtZC5jb20+CkNjOiBhbWQtZ2Z4
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpTaWduZWQtb2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgotLS0KIGRy
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2RjZV92MTBfMC5jIHwgMSArCiAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9kY2VfdjEwXzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2RjZV92MTBfMC5jCmlu
ZGV4IGRhMjQwZjhmYWZjZjguLjc5NDQ3ODFlMTA4NmIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2RjZV92MTBfMC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2RjZV92MTBfMC5jCkBAIC0yMjgsNiArMjI4LDcgQEAgc3RhdGljIHZvaWQgZGNlX3YxMF8w
X3BhZ2VmbGlwX2ludGVycnVwdF9maW5pKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogICog
QGFkZXY6IGFtZGdwdV9kZXZpY2UgcG9pbnRlcgogICogQGNydGNfaWQ6IGNydGMgdG8gY2xlYW51
cCBwYWdlZmxpcCBvbgogICogQGNydGNfYmFzZTogbmV3IGFkZHJlc3Mgb2YgdGhlIGNydGMgKEdQ
VSBNQyBhZGRyZXNzKQorICogQGFzeW5jOiBhc3luY2hyb25vdXMgZmxpcAogICoKICAqIFRyaWdn
ZXJzIHRoZSBhY3R1YWwgcGFnZWZsaXAgYnkgdXBkYXRpbmcgdGhlIHByaW1hcnkKICAqIHN1cmZh
Y2UgYmFzZSBhZGRyZXNzLgotLSAKMi4yNS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWwK
