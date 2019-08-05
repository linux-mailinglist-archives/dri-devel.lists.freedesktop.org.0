Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C91C8191E
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2019 14:24:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04EA66E409;
	Mon,  5 Aug 2019 12:23:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42E0A6E409
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2019 12:23:55 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id i11so14970465edq.0
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Aug 2019 05:23:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FYiUY5p+TWatTxX9qBGkn9VrpmRhMnZJh/hFNFOnOtM=;
 b=XFiXdFGp8ozI/WjKjNQzYlPTvtx4hvVIeG5MDKey1/rlgyjDSNA059QyDsnP6I/9AB
 dsXsJZWjJmsn17a/tmYYtWt/LwgOVLZLEKcSZH7FLpFvI/mZViAMVuI8QOiO08f3d6tf
 wRvaIIe/xZU01Wu7lFO6xhu58twa+Wlwbwd386MQu+VT9gBaeObjgvsbiJMXLXL3KkNr
 HYhFuQk47z2NzFA6pchXrk1tfQYiyu+3S776q8Y4VHLq19miVmyR7JVO9SfSllOWQEms
 L5iu9Xz82uUx3wg0g9apvftJbmBbu2tycoVoLAtEX2kGC69qkP2BRMI1lr2VHRqTNXTQ
 TlLQ==
X-Gm-Message-State: APjAAAVjRNIvprh0NNNoVI8lPaU97b5aOgwUYdavx1Az3miEqqMYnsZ/
 0sUsOqqK8xxCfETY0HAZyQ9eH4C1
X-Google-Smtp-Source: APXvYqwefkauo0w45Kylb0IEfdhRV666GyVj6crDPl4j1h3ofvRs1+UIDXjs87Wk4+u/dSYdTLf/GA==
X-Received: by 2002:a17:906:3497:: with SMTP id
 g23mr33884330ejb.70.1565007833542; 
 Mon, 05 Aug 2019 05:23:53 -0700 (PDT)
Received: from localhost (pD9E51890.dip0.t-ipconnect.de. [217.229.24.144])
 by smtp.gmail.com with ESMTPSA id z9sm20151135edd.53.2019.08.05.05.23.52
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 05 Aug 2019 05:23:53 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 02/21] drm/dp: Add missing kerneldoc for struct drm_dp_link
Date: Mon,  5 Aug 2019 14:23:31 +0200
Message-Id: <20190805122350.8838-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190805122350.8838-1-thierry.reding@gmail.com>
References: <20190805122350.8838-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=FYiUY5p+TWatTxX9qBGkn9VrpmRhMnZJh/hFNFOnOtM=;
 b=uD9iwi/QnyBl+GAIGdl9irFlUU8iKP2S4G9UAp/mivu2Qn/RiVCU5cwwucC5nlPbrq
 UtorkLDqh0i6nCqL+gUtc5CmbMWAIIj2ajmG1lGX7jFanEBSPGt1mFD9G2w9ximQDQpQ
 D1je+N/2hXYnJ8QmsqY9th6E6EH+FZ7xBTWjLPim2tn/qDsjDgjUNaxvSTOtpo+c+S9V
 a4t3EqE4eaqm7W4Sz5NVvuz80/Ufqkr8bh8/YcIuKrw8HcW7n8K6ZDQft9qP47AwUokE
 uxht4liKxscqwwRlREzOvZV6SycDZgl3HmJf7TwU4UsEnNsAweaGmPEVQX8y9ryEeSVe
 VaWw==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KClRoZSBkcm1fZHBfbGlu
ayBzdHJ1Y3R1cmUgdHJhY2tzIGNhcGFiaWxpdGllcyBvbiB0aGUgRFAgbGluay4gQWRkIHNvbWUK
a2VybmVsZG9jIHRvIGV4cGxhaW4gd2hhdCBlYWNoIG9mIGl0cyBmaWVsZHMgbWVhbnMuCgpTaWdu
ZWQtb2ZmLWJ5OiBUaGllcnJ5IFJlZGluZyA8dHJlZGluZ0BudmlkaWEuY29tPgotLS0KIGluY2x1
ZGUvZHJtL2RybV9kcF9oZWxwZXIuaCB8IDcgKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDcgaW5z
ZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2RybV9kcF9oZWxwZXIuaCBiL2lu
Y2x1ZGUvZHJtL2RybV9kcF9oZWxwZXIuaAppbmRleCAxMTQyNjExNThiNzMuLjkzNWYzMzFlNmU3
MiAxMDA2NDQKLS0tIGEvaW5jbHVkZS9kcm0vZHJtX2RwX2hlbHBlci5oCisrKyBiL2luY2x1ZGUv
ZHJtL2RybV9kcF9oZWxwZXIuaApAQCAtMTM1OCw2ICsxMzU4LDEzIEBAIGludCBkcm1fZHBfZHBj
ZF9yZWFkX2xpbmtfc3RhdHVzKHN0cnVjdCBkcm1fZHBfYXV4ICphdXgsCiAgKi8KICNkZWZpbmUg
RFBfTElOS19DQVBfRU5IQU5DRURfRlJBTUlORyAoMSA8PCAwKQogCisvKioKKyAqIHN0cnVjdCBk
cm1fZHBfbGluayAtIERQIGxpbmsgY2FwYWJpbGl0aWVzCisgKiBAcmV2aXNpb246IERQIHNwZWNp
ZmljYXRpb24gcmV2aXNpb24gc3VwcG9ydGVkIG9uIHRoZSBsaW5rCisgKiBAcmF0ZTogbWF4aW11
bSBjbG9jayByYXRlIHN1cHBvcnRlZCBvbiB0aGUgbGluaworICogQG51bV9sYW5lczogbWF4aW11
bSBudW1iZXIgb2YgbGFuZXMgc3VwcG9ydGVkIG9uIHRoZSBsaW5rCisgKiBAY2FwYWJpbGl0aWVz
OiBiaXRtYXNrIG9mIGNhcGFiaWxpdGllcyBzdXBwb3J0ZWQgb24gdGhlIGxpbmsKKyAqLwogc3Ry
dWN0IGRybV9kcF9saW5rIHsKIAl1bnNpZ25lZCBjaGFyIHJldmlzaW9uOwogCXVuc2lnbmVkIGlu
dCByYXRlOwotLSAKMi4yMi4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
