Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 875F32A8174
	for <lists+dri-devel@lfdr.de>; Thu,  5 Nov 2020 15:52:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72C056ED94;
	Thu,  5 Nov 2020 14:52:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D20476ED92
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Nov 2020 14:52:24 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id 33so2089546wrl.7
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Nov 2020 06:52:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AjBPdz+8mpzbEfzyqGKPlE/9r69QMe/kgLbI+X7lVik=;
 b=tS6RccjZm9XFR5PPPsKzjHr+15rT9c+pyaaKa3oTIxSSg9rigM8R5GtZ2ZewHuhAV7
 AT0G632//S8OZXZ+wVHiTMC/QIX2O1WgL4uDqgp/PSws2NlL1q3zu7SXfBypJKiLlZeK
 txrVBNiBYyQqWcP2pUTDkip2KylIpRWprckhw71bLvqYqT0EOAC+LlAM6+2r4g7mSi1u
 YuaXoVDSY4HdHu+GwAbkn7hGmf6z8pWvKGsXczqFA5afKn9UlCZkPuUqQIdSTycoQbur
 +xgLPhv63tlBwL2YnXN9XED9/yi4orIo/qxH9gHJrKbkjb++yFurjXlMY6/z4VKiglFQ
 1enQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AjBPdz+8mpzbEfzyqGKPlE/9r69QMe/kgLbI+X7lVik=;
 b=nru3I2SgfzOXj74r9/CNc9ULOnLxfomkX4kiMcfcU/a81O8Lxmyc3jZgsiuhGzGA/f
 /j/B0F1CJzkhvcwx5rf787Y8N1dV7SSNIg930aZ0Cvip2Es4OtmYsiWlcW15TxXDKR5L
 33Uzj+Wu59D86HuOAUTi1I9iY4oz3FPwJ1iB/rtRtfAWnl6QOvPYds9ZBDJMD5pdkHFW
 CxZobEpESfcBBTNTOm35O2vvSQuz35i9Lj2g0Q/NHnhnSyGoP/l6ecwn6Z8QDx7SOME5
 lVkRwbwmPoV1wQ89av8pHqBUIiNqXvmqKCzqhbPPqBtY6MKcg9zDKaUnLXeGjOxIxbQ7
 F11w==
X-Gm-Message-State: AOAM530tRl6SW0hun+1Z/M7SZzjAdWwsDFQpwTxcwRnpWuEs7yserNmL
 SO0F0Wazr0bW6kMDbIgii0zqhQ==
X-Google-Smtp-Source: ABdhPJyRWm95rr/rrX+vwzMrA+OAGQ0bPe8HoSoQw05klN+IufG2gMUpauu6wrD4P4hiQLXPg7q2Xg==
X-Received: by 2002:adf:9150:: with SMTP id j74mr3666874wrj.57.1604587943605; 
 Thu, 05 Nov 2020 06:52:23 -0800 (PST)
Received: from dell.default ([91.110.221.242])
 by smtp.gmail.com with ESMTPSA id f5sm2631243wmh.16.2020.11.05.06.52.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2020 06:52:22 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 07/19] gpu: drm: scheduler: sched_entity: Demote
 non-conformant kernel-doc headers
Date: Thu,  5 Nov 2020 14:45:05 +0000
Message-Id: <20201105144517.1826692-8-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201105144517.1826692-1-lee.jones@linaro.org>
References: <20201105144517.1826692-1-lee.jones@linaro.org>
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
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Alex Deucher <alexander.deucher@amd.com>, linux-media@vger.kernel.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Nirmoy Das <nirmoy.aiemd@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9lbnRpdHkuYzozMTY6IHdhcm5pbmc6IEZ1bmN0aW9u
IHBhcmFtZXRlciBvciBtZW1iZXIgJ2YnIG5vdCBkZXNjcmliZWQgaW4gJ2RybV9zY2hlZF9lbnRp
dHlfY2xlYXJfZGVwJwogZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9lbnRpdHkuYzoz
MTY6IHdhcm5pbmc6IEZ1bmN0aW9uIHBhcmFtZXRlciBvciBtZW1iZXIgJ2NiJyBub3QgZGVzY3Jp
YmVkIGluICdkcm1fc2NoZWRfZW50aXR5X2NsZWFyX2RlcCcKIGRyaXZlcnMvZ3B1L2RybS9zY2hl
ZHVsZXIvc2NoZWRfZW50aXR5LmM6MzMwOiB3YXJuaW5nOiBGdW5jdGlvbiBwYXJhbWV0ZXIgb3Ig
bWVtYmVyICdmJyBub3QgZGVzY3JpYmVkIGluICdkcm1fc2NoZWRfZW50aXR5X3dha2V1cCcKIGRy
aXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2NoZWRfZW50aXR5LmM6MzMwOiB3YXJuaW5nOiBGdW5j
dGlvbiBwYXJhbWV0ZXIgb3IgbWVtYmVyICdjYicgbm90IGRlc2NyaWJlZCBpbiAnZHJtX3NjaGVk
X2VudGl0eV93YWtldXAnCgpDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgpDYzog
RGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgpDYzogU3VtaXQgU2Vtd2FsIDxzdW1pdC5z
ZW13YWxAbGluYXJvLm9yZz4KQ2M6ICJDaHJpc3RpYW4gS8O2bmlnIiA8Y2hyaXN0aWFuLmtvZW5p
Z0BhbWQuY29tPgpDYzogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgpD
YzogTmlybW95IERhcyA8bmlybW95LmFpZW1kQGdtYWlsLmNvbT4KQ2M6IGRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKQ2M6IGxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZwpDYzogbGlu
YXJvLW1tLXNpZ0BsaXN0cy5saW5hcm8ub3JnClNpZ25lZC1vZmYtYnk6IExlZSBKb25lcyA8bGVl
LmpvbmVzQGxpbmFyby5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9l
bnRpdHkuYyB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX2Vu
dGl0eS5jIGIvZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9lbnRpdHkuYwppbmRleCBm
OGVjMjc3YTZhYTg1Li5jMWFjM2U0MDAzYzZmIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
c2NoZWR1bGVyL3NjaGVkX2VudGl0eS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIv
c2NoZWRfZW50aXR5LmMKQEAgLTMwOCw3ICszMDgsNyBAQCB2b2lkIGRybV9zY2hlZF9lbnRpdHlf
ZGVzdHJveShzdHJ1Y3QgZHJtX3NjaGVkX2VudGl0eSAqZW50aXR5KQogfQogRVhQT1JUX1NZTUJP
TChkcm1fc2NoZWRfZW50aXR5X2Rlc3Ryb3kpOwogCi0vKioKKy8qCiAgKiBkcm1fc2NoZWRfZW50
aXR5X2NsZWFyX2RlcCAtIGNhbGxiYWNrIHRvIGNsZWFyIHRoZSBlbnRpdGllcyBkZXBlbmRlbmN5
CiAgKi8KIHN0YXRpYyB2b2lkIGRybV9zY2hlZF9lbnRpdHlfY2xlYXJfZGVwKHN0cnVjdCBkbWFf
ZmVuY2UgKmYsCkBAIC0zMjEsNyArMzIxLDcgQEAgc3RhdGljIHZvaWQgZHJtX3NjaGVkX2VudGl0
eV9jbGVhcl9kZXAoc3RydWN0IGRtYV9mZW5jZSAqZiwKIAlkbWFfZmVuY2VfcHV0KGYpOwogfQog
Ci0vKioKKy8qCiAgKiBkcm1fc2NoZWRfZW50aXR5X2NsZWFyX2RlcCAtIGNhbGxiYWNrIHRvIGNs
ZWFyIHRoZSBlbnRpdGllcyBkZXBlbmRlbmN5IGFuZAogICogd2FrZSB1cCBzY2hlZHVsZXIKICAq
LwotLSAKMi4yNS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWwK
