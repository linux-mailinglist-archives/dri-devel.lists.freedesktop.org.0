Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 174A02C0435
	for <lists+dri-devel@lfdr.de>; Mon, 23 Nov 2020 12:20:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD73F89AA7;
	Mon, 23 Nov 2020 11:20:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC4FB89683
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Nov 2020 11:20:17 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id e7so674993wrv.6
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Nov 2020 03:20:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dUeixF4MexcQptzRTHrmHc3KXAc8UlMXol5+btOxzyI=;
 b=Mgn5NMLhJpAl73mAfi6yoe9e8RtL/B1FIcdsGg2VTegVerYl9+T3G23KUJvYn0BDoF
 dlBP/X8WktZxc0ZCu+O1ZljebWw81+gjSvSbLG5Bdk3nGL5OBbiZzNo9YhiQIKSF1lUL
 gOix0w2ugmEjS9JVXUW28BxIQSvVZdpD8jZMgQi92EHVLJHcXDFnYWL43sF4I96SBH7/
 D9sVx3HH7YaHGxybPEAnIA4O5QASV4xoEgRv2q93MKVZfRajp6lsW72rlLbIGxKvetL+
 /YpGoq+Ty/beR9aTF2YRNUaA+MPUlWoK3EMlvY7XVLzZdA6Bc3uv+HsiBmhRl21IeO4j
 TSmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dUeixF4MexcQptzRTHrmHc3KXAc8UlMXol5+btOxzyI=;
 b=XB42uHLjYCvOasOcSgA9z2S2Cp8umLA0WZQHQenWUTQLFXk94PVP8csumRL1sH/vnY
 3xjtsLU+4CCKp/eJ830kYDmLFAVnSvtZWd7PUXJWM2siCwmOVytguoOBVCgOjc7Q0iCB
 n4yn6I++oKD+XtaZtgQEIKg4pFIN7j4nWB1MsNu9oHJfno1icXzfm7I4OKowSN8blFP8
 fA2eNGBc18UEimu9mczZMyzKGYsMk09OFkQ5b/4CMUxZ7EYXs+zrm39LZ+qE+qPStFPm
 YJdtZxuJfjvbnUsRpw8R1BX/I+c83eE9QBuEUp4dIQdSms8V3eE5f+uJzZgDL78aIX0m
 AcHQ==
X-Gm-Message-State: AOAM530ev2/bNBdKvfN0h2B4HGse+lAo2SEsj2BoRV5D6SlvhS3lXxSC
 QTVRg0toP0AfO83oRzSE9eJdCQ==
X-Google-Smtp-Source: ABdhPJwf1MG0nyF0KLJfvrLqdG9CK8RUAZrjaSqIDR0mr7UkahjCOL9jww5T+xSB+9uq9C230bQPuA==
X-Received: by 2002:adf:9d49:: with SMTP id o9mr30393682wre.413.1606130416608; 
 Mon, 23 Nov 2020 03:20:16 -0800 (PST)
Received: from dell.default ([91.110.221.218])
 by smtp.gmail.com with ESMTPSA id n9sm16317290wmd.4.2020.11.23.03.20.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Nov 2020 03:20:16 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 39/40] drm/amd/amdgpu/gmc_v9_0: Remove unused table
 'ecc_umc_mcumc_status_addrs'
Date: Mon, 23 Nov 2020 11:19:18 +0000
Message-Id: <20201123111919.233376-40-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201123111919.233376-1-lee.jones@linaro.org>
References: <20201123111919.233376-1-lee.jones@linaro.org>
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
cy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y5XzAuYzozODI6MjM6IHdhcm5pbmc6IOKAmGVjY191
bWNfbWN1bWNfc3RhdHVzX2FkZHJz4oCZIGRlZmluZWQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1j
b25zdC12YXJpYWJsZT1dCgpDYzogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQu
Y29tPgpDYzogIkNocmlzdGlhbiBLw7ZuaWciIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+CkNj
OiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5p
ZWxAZmZ3bGwuY2g+CkNjOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpDYzogZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpTaWduZWQtb2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5q
b25lc0BsaW5hcm8ub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8w
LmMgfCAzNSAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAzNSBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNf
djlfMC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y5XzAuYwppbmRleCAwYzM0
MjFkNTg3ZTg3Li5mYmVlNDNiNGJhNjRkIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9nbWNfdjlfMC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192
OV8wLmMKQEAgLTM3OSw0MSArMzc5LDYgQEAgc3RhdGljIGNvbnN0IHVpbnQzMl90IGVjY191bWNf
bWN1bWNfY3RybF9tYXNrX2FkZHJzW10gPSB7CiAJKDB4MDAxZDQzZTAgKyAweDAwMDAxODAwKSwK
IH07CiAKLXN0YXRpYyBjb25zdCB1aW50MzJfdCBlY2NfdW1jX21jdW1jX3N0YXR1c19hZGRyc1td
ID0gewotCSgweDAwMDE0M2MyICsgMHgwMDAwMDAwMCksCi0JKDB4MDAwMTQzYzIgKyAweDAwMDAw
ODAwKSwKLQkoMHgwMDAxNDNjMiArIDB4MDAwMDEwMDApLAotCSgweDAwMDE0M2MyICsgMHgwMDAw
MTgwMCksCi0JKDB4MDAwNTQzYzIgKyAweDAwMDAwMDAwKSwKLQkoMHgwMDA1NDNjMiArIDB4MDAw
MDA4MDApLAotCSgweDAwMDU0M2MyICsgMHgwMDAwMTAwMCksCi0JKDB4MDAwNTQzYzIgKyAweDAw
MDAxODAwKSwKLQkoMHgwMDA5NDNjMiArIDB4MDAwMDAwMDApLAotCSgweDAwMDk0M2MyICsgMHgw
MDAwMDgwMCksCi0JKDB4MDAwOTQzYzIgKyAweDAwMDAxMDAwKSwKLQkoMHgwMDA5NDNjMiArIDB4
MDAwMDE4MDApLAotCSgweDAwMGQ0M2MyICsgMHgwMDAwMDAwMCksCi0JKDB4MDAwZDQzYzIgKyAw
eDAwMDAwODAwKSwKLQkoMHgwMDBkNDNjMiArIDB4MDAwMDEwMDApLAotCSgweDAwMGQ0M2MyICsg
MHgwMDAwMTgwMCksCi0JKDB4MDAxMTQzYzIgKyAweDAwMDAwMDAwKSwKLQkoMHgwMDExNDNjMiAr
IDB4MDAwMDA4MDApLAotCSgweDAwMTE0M2MyICsgMHgwMDAwMTAwMCksCi0JKDB4MDAxMTQzYzIg
KyAweDAwMDAxODAwKSwKLQkoMHgwMDE1NDNjMiArIDB4MDAwMDAwMDApLAotCSgweDAwMTU0M2My
ICsgMHgwMDAwMDgwMCksCi0JKDB4MDAxNTQzYzIgKyAweDAwMDAxMDAwKSwKLQkoMHgwMDE1NDNj
MiArIDB4MDAwMDE4MDApLAotCSgweDAwMTk0M2MyICsgMHgwMDAwMDAwMCksCi0JKDB4MDAxOTQz
YzIgKyAweDAwMDAwODAwKSwKLQkoMHgwMDE5NDNjMiArIDB4MDAwMDEwMDApLAotCSgweDAwMTk0
M2MyICsgMHgwMDAwMTgwMCksCi0JKDB4MDAxZDQzYzIgKyAweDAwMDAwMDAwKSwKLQkoMHgwMDFk
NDNjMiArIDB4MDAwMDA4MDApLAotCSgweDAwMWQ0M2MyICsgMHgwMDAwMTAwMCksCi0JKDB4MDAx
ZDQzYzIgKyAweDAwMDAxODAwKSwKLX07Ci0KIHN0YXRpYyBpbnQgZ21jX3Y5XzBfZWNjX2ludGVy
cnVwdF9zdGF0ZShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKIAkJc3RydWN0IGFtZGdwdV9p
cnFfc3JjICpzcmMsCiAJCXVuc2lnbmVkIHR5cGUsCi0tIAoyLjI1LjEKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
