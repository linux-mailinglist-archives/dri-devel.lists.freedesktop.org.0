Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 160692AF830
	for <lists+dri-devel@lfdr.de>; Wed, 11 Nov 2020 19:36:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14B036E0DC;
	Wed, 11 Nov 2020 18:36:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BB606E0D4
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Nov 2020 18:36:17 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id p1so3479805wrf.12
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Nov 2020 10:36:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1BMpKgrGRaaFsrowXlZeUlkXnTCJQ5S+7+zF8aRI5RM=;
 b=gv9rARHr4D0R1XbUNjjQpIHG+8Ukz+VROemjmN9deTxOLLwa57CGwe7Yw2nPVD5LkI
 x7sBA5S4Izl8Y+DLOybIvelf93pnTPj30GwSDjNqThbgY52WPq9pGugtalPjo4Me6wOi
 v3Wf9SH9nuttFyN/EE8mWWiXT3JxVUq06ieJknk5W231WtKu0+8a6uSy7vdh1HVUK8ea
 2AC/M3H/iD7QdDK/feCxSxKB0ScDF6vwy8oQrAZTdgXy/8X1ALdG+Vxo9y/csOsWa8Qz
 txo6oqrG/NN9rdWgI6GsC3//RR1aBRg7CpXQRIiN8lqFXulSkUJ5ArqmT2m75r2FCIsu
 /yXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1BMpKgrGRaaFsrowXlZeUlkXnTCJQ5S+7+zF8aRI5RM=;
 b=QMKsT4AAirnBjSVva6fqRfVBS+7KlrhJ6I0XXGI9M5pzWu7Fbyft77Q1ov7bD9hKZB
 f5LiHEJX085ByNxRRry097r1wtJz7ei/owkxVNTjzcEKwYAE42dCg0hBbQq7DdSYpokF
 AskI7SblHUNduiBi/3VYEQMu8EKhnS6IEafXhZTGmzsOdmA+XpPidE4VcXh6cWPYQ0Ec
 1uYYxErjoyoz+i2cXzyj9SM6CL1k8zb6EySeu4zEEVv8o6I//FJcxx3ecgjFdonzDUtg
 HSuDfmQgV3b+iuNT0iz69Rh4RzRo5Oa2WSMt9XV2SLjETIJkKmHwMPveasNuRu2TRH/U
 Ns+w==
X-Gm-Message-State: AOAM53184TszPRWOonvtyNYzFNnPJv2vYaMgKsLFnp9TadU2SPpwsXYt
 Grtogwe4hSVu5OHD/Ld7c77IPw==
X-Google-Smtp-Source: ABdhPJyUfP02CiM21bckjb6v/8zvCckUDUA51nDOma7tQN+Oa6OdUY9rQNKYPeBoyCSxr/LkFz5tnQ==
X-Received: by 2002:a5d:474d:: with SMTP id o13mr33192388wrs.178.1605119775741; 
 Wed, 11 Nov 2020 10:36:15 -0800 (PST)
Received: from dell.default ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id k84sm3558311wmf.42.2020.11.11.10.36.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Nov 2020 10:36:15 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 19/19] drm/radeon/evergreen_cs: Move
 'r600_dma_cs_next_reloc()'s prototype to shared header
Date: Wed, 11 Nov 2020 18:35:45 +0000
Message-Id: <20201111183545.1756994-20-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201111183545.1756994-1-lee.jones@linaro.org>
References: <20201111183545.1756994-1-lee.jones@linaro.org>
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
cy9ncHUvZHJtL3JhZGVvbi9yNjAwX2NzLmM6MjM0Mzo1OiB3YXJuaW5nOiBubyBwcmV2aW91cyBw
cm90b3R5cGUgZm9yIOKAmHI2MDBfZG1hX2NzX25leHRfcmVsb2PigJkgWy1XbWlzc2luZy1wcm90
b3R5cGVzXQogMjM0MyB8IGludCByNjAwX2RtYV9jc19uZXh0X3JlbG9jKHN0cnVjdCByYWRlb25f
Y3NfcGFyc2VyICpwLAogfCBefn5+fn5+fn5+fn5+fn5+fn5+fn5+CgpDYzogQWxleCBEZXVjaGVy
IDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgpDYzogIkNocmlzdGlhbiBLw7ZuaWciIDxjaHJp
c3RpYW4ua29lbmlnQGFtZC5jb20+CkNjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+
CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+CkNjOiBhbWQtZ2Z4QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpTaWduZWQt
b2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgotLS0KIGRyaXZlcnMvZ3B1
L2RybS9yYWRlb24vZXZlcmdyZWVuX2NzLmMgfCAzICstLQogZHJpdmVycy9ncHUvZHJtL3JhZGVv
bi9yNjAwLmggICAgICAgICB8IDQgKysrKwogZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yNjAwX2Nz
LmMgICAgICB8IDEgKwogMyBmaWxlcyBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDIgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9ldmVyZ3JlZW5fY3Mu
YyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vZXZlcmdyZWVuX2NzLmMKaW5kZXggNTNiNzVjZjIw
MTk1OC4uMGRlNzlmM2E3ZTNmZiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9l
dmVyZ3JlZW5fY3MuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL2V2ZXJncmVlbl9jcy5j
CkBAIC0yOCw2ICsyOCw3IEBACiAKICNpbmNsdWRlICJyYWRlb24uaCIKICNpbmNsdWRlICJyYWRl
b25fYXNpYy5oIgorI2luY2x1ZGUgInI2MDAuaCIKICNpbmNsdWRlICJldmVyZ3JlZW5kLmgiCiAj
aW5jbHVkZSAiZXZlcmdyZWVuX3JlZ19zYWZlLmgiCiAjaW5jbHVkZSAiY2F5bWFuX3JlZ19zYWZl
LmgiCkBAIC0zNyw4ICszOCw2IEBACiAKICNkZWZpbmUgUkVHX1NBRkVfQk1fU0laRSBBUlJBWV9T
SVpFKGV2ZXJncmVlbl9yZWdfc2FmZV9ibSkKIAotaW50IHI2MDBfZG1hX2NzX25leHRfcmVsb2Mo
c3RydWN0IHJhZGVvbl9jc19wYXJzZXIgKnAsCi0JCQkgICBzdHJ1Y3QgcmFkZW9uX2JvX2xpc3Qg
Kipjc19yZWxvYyk7CiBzdHJ1Y3QgZXZlcmdyZWVuX2NzX3RyYWNrIHsKIAl1MzIJCQlncm91cF9z
aXplOwogCXUzMgkJCW5iYW5rczsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24v
cjYwMC5oIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yNjAwLmgKaW5kZXggYTI1OTk3NmE5NTkx
My4uMjFmZTQ0MTk4YTk2NiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yNjAw
LmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yNjAwLmgKQEAgLTI5LDcgKzI5LDkgQEAK
ICNkZWZpbmUgX19SNjAwX0hfXwogCiBzdHJ1Y3QgcjYwMF9hdWRpb19waW47CitzdHJ1Y3QgcmFk
ZW9uX2JvX2xpc3Q7CiBzdHJ1Y3QgcmFkZW9uX2NydGM7CitzdHJ1Y3QgcmFkZW9uX2NzX3BhcnNl
cjsKIHN0cnVjdCByYWRlb25fZGV2aWNlOwogc3RydWN0IHJhZGVvbl9oZG1pX2FjcjsKIApAQCAt
NTAsNCArNTIsNiBAQCB2b2lkIHI2MDBfaGRtaV91cGRhdGVfYWNyKHN0cnVjdCBkcm1fZW5jb2Rl
ciAqZW5jb2RlciwgbG9uZyBvZmZzZXQsCiB2b2lkIHI2MDBfc2V0X3ZiaV9wYWNrZXQoc3RydWN0
IGRybV9lbmNvZGVyICplbmNvZGVyLCB1MzIgb2Zmc2V0KTsKIHZvaWQgcjYwMF9oZG1pX2VuYWJs
ZShzdHJ1Y3QgZHJtX2VuY29kZXIgKmVuY29kZXIsIGJvb2wgZW5hYmxlKTsKIAoraW50IHI2MDBf
ZG1hX2NzX25leHRfcmVsb2Moc3RydWN0IHJhZGVvbl9jc19wYXJzZXIgKnAsCisJCQkgICBzdHJ1
Y3QgcmFkZW9uX2JvX2xpc3QgKipjc19yZWxvYyk7CiAjZW5kaWYJCQkJLyogX19SNjAwX0hfXyAq
LwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yNjAwX2NzLmMgYi9kcml2ZXJz
L2dwdS9kcm0vcmFkZW9uL3I2MDBfY3MuYwppbmRleCBmMjBiNjE5NDY2ODE2Li5kYzY4ZTUzOGQ1
YTk3IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3I2MDBfY3MuYworKysgYi9k
cml2ZXJzL2dwdS9kcm0vcmFkZW9uL3I2MDBfY3MuYwpAQCAtMjksNiArMjksNyBAQAogCiAjaW5j
bHVkZSAicmFkZW9uLmgiCiAjaW5jbHVkZSAicmFkZW9uX2FzaWMuaCIKKyNpbmNsdWRlICJyNjAw
LmgiCiAjaW5jbHVkZSAicjYwMGQuaCIKICNpbmNsdWRlICJyNjAwX3JlZ19zYWZlLmgiCiAKLS0g
CjIuMjUuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
