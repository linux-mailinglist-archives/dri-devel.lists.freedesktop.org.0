Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 835A92B0D40
	for <lists+dri-devel@lfdr.de>; Thu, 12 Nov 2020 20:01:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65CFB6E3E5;
	Thu, 12 Nov 2020 19:01:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D9506E3E5
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Nov 2020 19:01:51 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id p1so7128568wrf.12
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Nov 2020 11:01:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LK83PtW9bWg13v6GeG4X98Td032TuGFWFjyFs29+ymI=;
 b=vq4ZP2TVmSqBWCOE1Wu+ytkEKp2xRQfUssN2R6DGgz8tFeRWOgvoEvdWsZE8eSlmzX
 T7oLXH66Lae/Qr3uAOim8byoaRyb2q3k1zhgoit1n1huKS46ig4/cKUNdvroiUKa/I6u
 8RlUhEltZ4fv7QkMnn8qg5Et2eUaCE5zH1UHNRevW64lB/xOIJYt63WmEwYZi//AB+2V
 8sRr68YKSZyT5rl6FSfWtakQZ2iKFLJCyzXGyqBj4oUEsvSCHlMgnamLIx/7sEwt23rj
 WvRMy83ztza+CoIFdi9oVXtjeaJuN//QojE3MCEUeE7da8G4FVpucVGnWk3KSi0H8l0q
 TJQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LK83PtW9bWg13v6GeG4X98Td032TuGFWFjyFs29+ymI=;
 b=oREEWCBdlCK+LvknH0odffpS1dDuZxU/t4kk7xQng+0Zb+KzTazzBplhTnCQAgvV76
 pmvhdpjp+PT9mT+BnO5m03d7ADi/sHi0f39sj5gjkZq87149/fRu+Jy+dcQbab8JFjO5
 recOYkcfNqNjxO9TkU8BLz0fi2Edp78IYQBdk780fy8FEgTn6F3AzQRm377zUdfhzKKa
 OgHaMndyjusYUswWexqORCWs2KxexVZvefl8SIdHgcfOCP9LqKxFXkpX/ADkh+Zzi2uT
 v+jjEKoDR2Mmli1HJdlpKm18hj9Gi3mR4Us/rRlH5I94Rd+BFZQ9/BXlegZCNMzN7NcM
 R4xA==
X-Gm-Message-State: AOAM531UKO81W+gufsplAC+1BLJpHtAI7yV8uk/n/+FXjEIMLhvVQY4j
 cGt90hOKvNkiExmExYUG+GuOPw==
X-Google-Smtp-Source: ABdhPJxNEnxvjxLyk9I2A+iSYrZd6QKCswPKKcJgp9Bl5EuD0dpUMbW/MXKoV3grMsaYvi0XW92N5g==
X-Received: by 2002:a5d:514a:: with SMTP id u10mr1112855wrt.312.1605207709781; 
 Thu, 12 Nov 2020 11:01:49 -0800 (PST)
Received: from dell.default ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id p4sm8105214wrm.51.2020.11.12.11.01.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Nov 2020 11:01:49 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 29/30] drm/amd/amdgpu/atombios_encoders: Remove set but unused
 variable 'backlight_level'
Date: Thu, 12 Nov 2020 19:00:38 +0000
Message-Id: <20201112190039.2785914-30-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201112190039.2785914-1-lee.jones@linaro.org>
References: <20201112190039.2785914-1-lee.jones@linaro.org>
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
cy9ncHUvZHJtL2FtZC9hbWRncHUvYXRvbWJpb3NfZW5jb2RlcnMuYzogSW4gZnVuY3Rpb24g4oCY
YW1kZ3B1X2F0b21iaW9zX2VuY29kZXJfaW5pdF9iYWNrbGlnaHTigJk6CiBkcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hdG9tYmlvc19lbmNvZGVycy5jOjE3NDo1OiB3YXJuaW5nOiB2YXJpYWJs
ZSDigJhiYWNrbGlnaHRfbGV2ZWzigJkgc2V0IGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtYnV0LXNl
dC12YXJpYWJsZV0KCkNjOiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+
CkNjOiAiQ2hyaXN0aWFuIEvDtm5pZyIgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KQ2M6IERh
dmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBm
ZndsbC5jaD4KQ2M6IEx1YmVuIFR1aWtvdiA8bHViZW4udHVpa292QGFtZC5jb20+CkNjOiBhbWQt
Z2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpTaWduZWQtb2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgotLS0K
IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2F0b21iaW9zX2VuY29kZXJzLmMgfCAzICstLQog
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2F0b21iaW9zX2VuY29kZXJzLmMgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hdG9tYmlvc19lbmNvZGVycy5jCmluZGV4IGZhODE3ZWJm
Zjk4MDQuLmFmODc1MDVhZDdkNTcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2F0b21iaW9zX2VuY29kZXJzLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YXRvbWJpb3NfZW5jb2RlcnMuYwpAQCAtMTcxLDcgKzE3MSw2IEBAIHZvaWQgYW1kZ3B1X2F0b21i
aW9zX2VuY29kZXJfaW5pdF9iYWNrbGlnaHQoc3RydWN0IGFtZGdwdV9lbmNvZGVyICphbWRncHVf
ZW5jb2RlCiAJc3RydWN0IGJhY2tsaWdodF9wcm9wZXJ0aWVzIHByb3BzOwogCXN0cnVjdCBhbWRn
cHVfYmFja2xpZ2h0X3ByaXZkYXRhICpwZGF0YTsKIAlzdHJ1Y3QgYW1kZ3B1X2VuY29kZXJfYXRv
bV9kaWcgKmRpZzsKLQl1OCBiYWNrbGlnaHRfbGV2ZWw7CiAJY2hhciBibF9uYW1lWzE2XTsKIAog
CS8qIE1hYyBsYXB0b3BzIHdpdGggbXVsdGlwbGUgR1BVcyB1c2UgdGhlIGdtdXggZHJpdmVyIGZv
ciBiYWNrbGlnaHQKQEAgLTIwNyw3ICsyMDYsNyBAQCB2b2lkIGFtZGdwdV9hdG9tYmlvc19lbmNv
ZGVyX2luaXRfYmFja2xpZ2h0KHN0cnVjdCBhbWRncHVfZW5jb2RlciAqYW1kZ3B1X2VuY29kZQog
CiAJcGRhdGEtPmVuY29kZXIgPSBhbWRncHVfZW5jb2RlcjsKIAotCWJhY2tsaWdodF9sZXZlbCA9
IGFtZGdwdV9hdG9tYmlvc19lbmNvZGVyX2dldF9iYWNrbGlnaHRfbGV2ZWxfZnJvbV9yZWcoYWRl
dik7CisJYW1kZ3B1X2F0b21iaW9zX2VuY29kZXJfZ2V0X2JhY2tsaWdodF9sZXZlbF9mcm9tX3Jl
ZyhhZGV2KTsKIAogCWRpZyA9IGFtZGdwdV9lbmNvZGVyLT5lbmNfcHJpdjsKIAlkaWctPmJsX2Rl
diA9IGJkOwotLSAKMi4yNS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWwK
