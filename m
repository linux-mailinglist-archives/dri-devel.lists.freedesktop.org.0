Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A65E2A9F71
	for <lists+dri-devel@lfdr.de>; Fri,  6 Nov 2020 22:50:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EE096EB35;
	Fri,  6 Nov 2020 21:50:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A905B6EB2B
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Nov 2020 21:50:13 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id b8so2801712wrn.0
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Nov 2020 13:50:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XN+cgxXjY3IWekASuJPYqV0dOA81c47vUDG0BBQb6c0=;
 b=HCGvUbcx5ZEN2tfKGwHJicVvv+pm5x43BHYd0mWRsxxz1IOqVirgnGczw7oawgtQXB
 7UygpB7ndYtvwbAuuhuaC6Qb2sfQK60p1OUOxbmCjKhcxzjmmm4TTDd1LFZtaWUZIudH
 GCsTzPE/zuBUGTLoiaFz52M0clHGNBXnsdLFW2mOxaO0RaV/pUYsX07zEX7Z0XNI/n1q
 AgU2ChqZX7giA7oo56qtWu8HkTrMDdt2oxJk+AYpkaHiYP0Ns4cEFV9WglGGP6sGMmVL
 FmVkjlPKqeawp62wfvotAn2I65hfXYwautS3PIWf0NqQV4Ei7ry86OU7eRNamQLgA1q1
 3crg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XN+cgxXjY3IWekASuJPYqV0dOA81c47vUDG0BBQb6c0=;
 b=CZP7Gvu8ol05wceDQXSSgQgiO56JXG6gBTuk9D+hYLz5ByCzYfQnUO6NHaHgiTMixk
 1UylinLXgyeYLcH9Lml/kADNolcjtQyGudoMJv5REJvb1MCUkS6hn//FbaGwvMBalozy
 lrjAv9bKHRnV8pLQ/Q3lEGx0f1exoBuJdn8a/jI3QVbAG01sr5Gd2KX4jSaWLDvA/Ry4
 DyQsYltJKl0kv250ilZRPsre0xpS8Uueo5FFXbPlXvtEkfRmFLrq2PryQHEMvU3jHehP
 6WIQ+zWAfAf2Aj4oLjm97FTNs3yB3c2DnYtigQK2y3Z/W2nAasickDhZWm4Hic+KoPjJ
 rZRA==
X-Gm-Message-State: AOAM530RUA777htjmeicL41/7yX3Fry1LRZ23eNkHSOwa65aZxBzFgKs
 qTJgQJRRTNYBOW1bxRgvtzxcaQ==
X-Google-Smtp-Source: ABdhPJz9VXDl2U52UY4eXa5169UHGNjCTgPviCAyaRgtL3TzMxHGPQw76W+ApIl3BeVptCZSq2myUQ==
X-Received: by 2002:a5d:4001:: with SMTP id n1mr4927117wrp.426.1604699412401; 
 Fri, 06 Nov 2020 13:50:12 -0800 (PST)
Received: from dell.default ([91.110.221.236])
 by smtp.gmail.com with ESMTPSA id t199sm3981084wmt.46.2020.11.06.13.50.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2020 13:50:11 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 15/19] drm/radeon: Move prototypes to shared header
Date: Fri,  6 Nov 2020 21:49:45 +0000
Message-Id: <20201106214949.2042120-16-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201106214949.2042120-1-lee.jones@linaro.org>
References: <20201106214949.2042120-1-lee.jones@linaro.org>
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
 amd-gfx@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fa21zLmM6NzU2OjU6IHdhcm5pbmc6IG5vIHByZXZpb3Vz
IHByb3RvdHlwZSBmb3Ig4oCYcmFkZW9uX2dldF92YmxhbmtfY291bnRlcl9rbXPigJkgWy1XbWlz
c2luZy1wcm90b3R5cGVzXQogNzU2IHwgdTMyIHJhZGVvbl9nZXRfdmJsYW5rX2NvdW50ZXJfa21z
KHN0cnVjdCBkcm1fY3J0YyAqY3J0YykKIHwgXn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4K
IGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2ttcy5jOjgyNjo1OiB3YXJuaW5nOiBubyBw
cmV2aW91cyBwcm90b3R5cGUgZm9yIOKAmHJhZGVvbl9lbmFibGVfdmJsYW5rX2ttc+KAmSBbLVdt
aXNzaW5nLXByb3RvdHlwZXNdCiA4MjYgfCBpbnQgcmFkZW9uX2VuYWJsZV92Ymxhbmtfa21zKHN0
cnVjdCBkcm1fY3J0YyAqY3J0YykKIHwgXn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+CiBkcml2ZXJz
L2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9rbXMuYzo4NTM6Njogd2FybmluZzogbm8gcHJldmlvdXMg
cHJvdG90eXBlIGZvciDigJhyYWRlb25fZGlzYWJsZV92Ymxhbmtfa21z4oCZIFstV21pc3Npbmct
cHJvdG90eXBlc10KIDg1MyB8IHZvaWQgcmFkZW9uX2Rpc2FibGVfdmJsYW5rX2ttcyhzdHJ1Y3Qg
ZHJtX2NydGMgKmNydGMpCiB8IF5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4KCkNjOiBBbGV4IERl
dWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+CkNjOiAiQ2hyaXN0aWFuIEvDtm5pZyIg
PGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51
eC5pZT4KQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KQ2M6IFN1bWl0IFNlbXdh
bCA8c3VtaXQuc2Vtd2FsQGxpbmFyby5vcmc+CkNjOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpDYzogbGludXgtbWVkaWFA
dmdlci5rZXJuZWwub3JnCkNjOiBsaW5hcm8tbW0tc2lnQGxpc3RzLmxpbmFyby5vcmcKU2lnbmVk
LW9mZi1ieTogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4KLS0tCiBkcml2ZXJzL2dw
dS9kcm0vcmFkZW9uL3JhZGVvbi5oICAgICAgICAgfCA2ICsrKysrKwogZHJpdmVycy9ncHUvZHJt
L3JhZGVvbi9yYWRlb25fZGlzcGxheS5jIHwgNCAtLS0tCiAyIGZpbGVzIGNoYW5nZWQsIDYgaW5z
ZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
cmFkZW9uL3JhZGVvbi5oIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb24uaAppbmRleCBl
MTEzMmQ4NmQyNTA3Li45NjFhMzFiODgwNWMyIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
cmFkZW9uL3JhZGVvbi5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uLmgKQEAg
LTI4MzIsNiArMjgzMiwxMiBAQCBleHRlcm4gdm9pZCByYWRlb25fcHJvZ3JhbV9yZWdpc3Rlcl9z
ZXF1ZW5jZShzdHJ1Y3QgcmFkZW9uX2RldmljZSAqcmRldiwKIAkJCQkJICAgICBjb25zdCB1MzIg
YXJyYXlfc2l6ZSk7CiBzdHJ1Y3QgcmFkZW9uX2RldmljZSAqcmFkZW9uX2dldF9yZGV2KHN0cnVj
dCB0dG1fYm9fZGV2aWNlICpiZGV2KTsKIAorLyogS01TICovCisKK3UzMiByYWRlb25fZ2V0X3Zi
bGFua19jb3VudGVyX2ttcyhzdHJ1Y3QgZHJtX2NydGMgKmNydGMpOworaW50IHJhZGVvbl9lbmFi
bGVfdmJsYW5rX2ttcyhzdHJ1Y3QgZHJtX2NydGMgKmNydGMpOwordm9pZCByYWRlb25fZGlzYWJs
ZV92Ymxhbmtfa21zKHN0cnVjdCBkcm1fY3J0YyAqY3J0Yyk7CisKIC8qCiAgKiB2bQogICovCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9kaXNwbGF5LmMgYi9kcml2
ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9kaXNwbGF5LmMKaW5kZXggYjc5Njg2Y2Y4YmRiZC4u
YmQ2MGYxNmZkMGQ3OCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25f
ZGlzcGxheS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2Rpc3BsYXkuYwpA
QCAtNDUsMTAgKzQ1LDYgQEAKICNpbmNsdWRlICJhdG9tLmgiCiAjaW5jbHVkZSAicmFkZW9uLmgi
CiAKLXUzMiByYWRlb25fZ2V0X3ZibGFua19jb3VudGVyX2ttcyhzdHJ1Y3QgZHJtX2NydGMgKmNy
dGMpOwotaW50IHJhZGVvbl9lbmFibGVfdmJsYW5rX2ttcyhzdHJ1Y3QgZHJtX2NydGMgKmNydGMp
Owotdm9pZCByYWRlb25fZGlzYWJsZV92Ymxhbmtfa21zKHN0cnVjdCBkcm1fY3J0YyAqY3J0Yyk7
Ci0KIHN0YXRpYyB2b2lkIGF2aXZvX2NydGNfbG9hZF9sdXQoc3RydWN0IGRybV9jcnRjICpjcnRj
KQogewogCXN0cnVjdCByYWRlb25fY3J0YyAqcmFkZW9uX2NydGMgPSB0b19yYWRlb25fY3J0Yyhj
cnRjKTsKLS0gCjIuMjUuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVsCg==
