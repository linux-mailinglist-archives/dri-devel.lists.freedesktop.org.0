Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 479262F45BE
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jan 2021 09:08:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE56F89F6F;
	Wed, 13 Jan 2021 08:08:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 897F289F2E
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 08:08:02 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id c124so681443wma.5
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 00:08:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YaJ+xpBDvvYC3lW5kV2UczyJUDW/j4U+lHIq9z+JvDw=;
 b=WsQms4zJiYtT5LVKrCDvJqTzyauR1L7ZrV/ErDeTxtpEOnQQJzux+BCYQydoZtAyo0
 EPxFeb095dvlkwDkYDE+e60fyWPr+ZnRC2hcA18fuSphilINabII+6TeyMwbwOaOiKfw
 OC/UxR/UuA7wsll84KPXCHnkzQP08OFr9F63whp9Rp5wAJsdytx4qsc8Ni8DmlLarXxR
 D5uVCKUaa0MHoo3TVb+28cdBVCnJcJi4RNixwFuvmuKR2hu8JuDCAp8E2MNZJfjLlv5t
 I34lrVKBpNGDaX9HZFr9LoLI+yLNoiMmSbPAIWwe6PAQRCnK7OFFkIvT37B5tFz8CsXl
 axIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YaJ+xpBDvvYC3lW5kV2UczyJUDW/j4U+lHIq9z+JvDw=;
 b=r2wktL5ZBsuC6ApNuNE+jDja/PN83FbYP0kJ6+Yl8Tx/wcC7K0cNsWkqw6eaE3T+k4
 xArwRpYzzv2MyKQG+xXjFMPT1uoVsDnNBBO5vzpr/JSVP8PyVwOXr4rE9qlPeY22myyi
 EbK/X5VqmpuaBDG+3nG3/JoK7E+lfZK8mR0TEgDtlp+zeoHJjUnUaFxjW6npOfCnXIhq
 xwYgNVQlyOBfuj3h5LXZPzoB2RK723MPLgMR5E8iIlZr4JPllsdnaDFcnnW/0ioICLFW
 nTvaeqrGnXEEPuw3wvRtEICCF08l+AbsxTqu3eLwi3JC7fBL4DfOrpgcLRaORCztwqzu
 x+Ow==
X-Gm-Message-State: AOAM530yQeOV8iETtALeQjjlWhSa2E/Bj7RmonH3g/AcSnt8G88KDBms
 DWmIItf6m4N4cf5ojZPjNiXfhQ==
X-Google-Smtp-Source: ABdhPJzYql5/UWMI/LumOt2JvYksf/Z9CIRastCwWreEyNI3i2UayobU2A3/YhQZL+8jW8Jyw8t5mw==
X-Received: by 2002:a7b:cc87:: with SMTP id p7mr991968wma.112.1610525281314;
 Wed, 13 Jan 2021 00:08:01 -0800 (PST)
Received: from dell.default ([91.110.221.229])
 by smtp.gmail.com with ESMTPSA id r20sm1642486wmh.15.2021.01.13.00.07.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 00:08:00 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 04/30] drm/amd/display/modules/power/power_helpers: Staticify
 local functions
Date: Wed, 13 Jan 2021 08:07:26 +0000
Message-Id: <20210113080752.1003793-5-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210113080752.1003793-1-lee.jones@linaro.org>
References: <20210113080752.1003793-1-lee.jones@linaro.org>
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
Cc: Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9tb2R1bGVzL3Bvd2VyL3Bvd2VyX2hlbHBl
cnMuYzoyODE6Njogd2FybmluZzogbm8gcHJldmlvdXMgcHJvdG90eXBlIGZvciDigJhmaWxsX2ly
YW1fdl8y4oCZIFstV21pc3NpbmctcHJvdG90eXBlc10KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1Ly4uL2Rpc3BsYXkvbW9kdWxlcy9wb3dlci9wb3dlcl9oZWxwZXJzLmM6NDU1OjY6IHdhcm5p
bmc6IG5vIHByZXZpb3VzIHByb3RvdHlwZSBmb3Ig4oCYZmlsbF9pcmFtX3ZfMl8y4oCZIFstV21p
c3NpbmctcHJvdG90eXBlc10KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2Rpc3BsYXkv
bW9kdWxlcy9wb3dlci9wb3dlcl9oZWxwZXJzLmM6NjAxOjY6IHdhcm5pbmc6IG5vIHByZXZpb3Vz
IHByb3RvdHlwZSBmb3Ig4oCYZmlsbF9pcmFtX3ZfMl8z4oCZIFstV21pc3NpbmctcHJvdG90eXBl
c10KCkNjOiBIYXJyeSBXZW50bGFuZCA8aGFycnkud2VudGxhbmRAYW1kLmNvbT4KQ2M6IExlbyBM
aSA8c3VucGVuZy5saUBhbWQuY29tPgpDYzogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hl
ckBhbWQuY29tPgpDYzogIkNocmlzdGlhbiBLw7ZuaWciIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5j
b20+CkNjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+CkNjOiBEYW5pZWwgVmV0dGVy
IDxkYW5pZWxAZmZ3bGwuY2g+CkNjOiBSb2RyaWdvIFNpcXVlaXJhIDxSb2RyaWdvLlNpcXVlaXJh
QGFtZC5jb20+CkNjOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpDYzogZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpTaWduZWQtb2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25l
c0BsaW5hcm8ub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9tb2R1bGVzL3Bv
d2VyL3Bvd2VyX2hlbHBlcnMuYyB8IDYgKysrLS0tCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRp
b25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
ZGlzcGxheS9tb2R1bGVzL3Bvd2VyL3Bvd2VyX2hlbHBlcnMuYyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvZGlzcGxheS9tb2R1bGVzL3Bvd2VyL3Bvd2VyX2hlbHBlcnMuYwppbmRleCA0ZmQ4YmNlOTVk
ODQzLi4zZDRjNjY5MzNmNTE4IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3Bs
YXkvbW9kdWxlcy9wb3dlci9wb3dlcl9oZWxwZXJzLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9kaXNwbGF5L21vZHVsZXMvcG93ZXIvcG93ZXJfaGVscGVycy5jCkBAIC0yNzgsNyArMjc4LDcg
QEAgc3RhdGljIHZvaWQgZmlsbF9iYWNrbGlnaHRfdHJhbnNmb3JtX3RhYmxlX3ZfMl8yKHN0cnVj
dCBkbWN1X2lyYW1fcGFyYW1ldGVycyBwYXIKIAl9CiB9CiAKLXZvaWQgZmlsbF9pcmFtX3ZfMihz
dHJ1Y3QgaXJhbV90YWJsZV92XzIgKnJhbV90YWJsZSwgc3RydWN0IGRtY3VfaXJhbV9wYXJhbWV0
ZXJzIHBhcmFtcykKK3N0YXRpYyB2b2lkIGZpbGxfaXJhbV92XzIoc3RydWN0IGlyYW1fdGFibGVf
dl8yICpyYW1fdGFibGUsIHN0cnVjdCBkbWN1X2lyYW1fcGFyYW1ldGVycyBwYXJhbXMpCiB7CiAJ
dW5zaWduZWQgaW50IHNldCA9IHBhcmFtcy5zZXQ7CiAKQEAgLTQ1Miw3ICs0NTIsNyBAQCB2b2lk
IGZpbGxfaXJhbV92XzIoc3RydWN0IGlyYW1fdGFibGVfdl8yICpyYW1fdGFibGUsIHN0cnVjdCBk
bWN1X2lyYW1fcGFyYW1ldGVycwogCQkJcGFyYW1zLCByYW1fdGFibGUpOwogfQogCi12b2lkIGZp
bGxfaXJhbV92XzJfMihzdHJ1Y3QgaXJhbV90YWJsZV92XzJfMiAqcmFtX3RhYmxlLCBzdHJ1Y3Qg
ZG1jdV9pcmFtX3BhcmFtZXRlcnMgcGFyYW1zKQorc3RhdGljIHZvaWQgZmlsbF9pcmFtX3ZfMl8y
KHN0cnVjdCBpcmFtX3RhYmxlX3ZfMl8yICpyYW1fdGFibGUsIHN0cnVjdCBkbWN1X2lyYW1fcGFy
YW1ldGVycyBwYXJhbXMpCiB7CiAJdW5zaWduZWQgaW50IHNldCA9IHBhcmFtcy5zZXQ7CiAKQEAg
LTU5OCw3ICs1OTgsNyBAQCB2b2lkIGZpbGxfaXJhbV92XzJfMihzdHJ1Y3QgaXJhbV90YWJsZV92
XzJfMiAqcmFtX3RhYmxlLCBzdHJ1Y3QgZG1jdV9pcmFtX3BhcmFtZQogCQkJcGFyYW1zLCByYW1f
dGFibGUsIHRydWUpOwogfQogCi12b2lkIGZpbGxfaXJhbV92XzJfMyhzdHJ1Y3QgaXJhbV90YWJs
ZV92XzJfMiAqcmFtX3RhYmxlLCBzdHJ1Y3QgZG1jdV9pcmFtX3BhcmFtZXRlcnMgcGFyYW1zLCBi
b29sIGJpZ19lbmRpYW4pCitzdGF0aWMgdm9pZCBmaWxsX2lyYW1fdl8yXzMoc3RydWN0IGlyYW1f
dGFibGVfdl8yXzIgKnJhbV90YWJsZSwgc3RydWN0IGRtY3VfaXJhbV9wYXJhbWV0ZXJzIHBhcmFt
cywgYm9vbCBiaWdfZW5kaWFuKQogewogCXVuc2lnbmVkIGludCBpLCBqOwogCXVuc2lnbmVkIGlu
dCBzZXQgPSBwYXJhbXMuc2V0OwotLSAKMi4yNS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWwK
