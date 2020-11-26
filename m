Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98E482C5631
	for <lists+dri-devel@lfdr.de>; Thu, 26 Nov 2020 14:44:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82B256E985;
	Thu, 26 Nov 2020 13:43:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10CAC6E99F
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Nov 2020 13:43:42 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id p8so2194356wrx.5
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Nov 2020 05:43:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VB1b8+HX0cMDaWmJBmE+LGhIQvSkQPR66e8ggHq+N+Q=;
 b=XxZ37GB0KpmVxrU9vwF7H6yWe5kLeflzs8gZYUkJvmzO75EMKFpjikfiFkRATr+PYk
 xVJsFJ8MlCX7JEFQF5EH+wxZjeAR6AAKMAUe6A4slFX4FgCiHh2yM5zwqB353KB4oqIw
 X+P/pOW+yAy8nskR5vatXd4YkKtooeYl/csb9hoaemLg2DfJWcDczneVuo4zN74yPihy
 YHY5rS7Y3S7UxJ3B0lUy5sQuezOiOmNeiqulnV8BrL0UbUNcXRnXgAOPNUM02JooqAMz
 /LCvBZB7hD1p2fkaY3JKLbaUoBbRbDEC124el020n/q/0Ochw15abcX9sdoU+nZTOqos
 6Czw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VB1b8+HX0cMDaWmJBmE+LGhIQvSkQPR66e8ggHq+N+Q=;
 b=CBtc6D0oC5o/7I2k6lBEU4KrMbrmFCs2XjXJNmnuN3Ur3p7AzqpLU6R1CbbP5Pzw1t
 g09E7WlmnPIKf98gxhOqYACQnOzCxZefYg/G6+DI6Qg4qa4PAAE83tgcK1W08+aD9aiU
 18ASrPVnJhus66JclIM/+00u+dQkXyJAUQToLlZvVqXB8r93fJ/Mr+i+6s8L+fA5ciCj
 h6duZOD1VzWnnhzX8P+d+2+YEdxfUPXuGNigE1Rfu8/4T6hq2Iiwp/cqDwuDkQjoiUv1
 zC01RUP8yrWrS043hIx25tkchx9fCRqBT5cnESlMghq3Xm8cp05GXkY3Vpd1ua1NGtMS
 YQ5Q==
X-Gm-Message-State: AOAM530qZ6M5IdUeYUcBiBy4I7UMyiKGkGYdOzaGl7QJqe2lv7/4GCsC
 P0UapV5sT1Len5OMPfX4Vn4FXw==
X-Google-Smtp-Source: ABdhPJwVfHcERYxVhmR4rmdwSIAsofDYdoAklfqWn1euwhxJfD6gxAJllgiYzUpJtVkfnBP6hYWcyQ==
X-Received: by 2002:a5d:4408:: with SMTP id z8mr4115578wrq.204.1606398220768; 
 Thu, 26 Nov 2020 05:43:40 -0800 (PST)
Received: from dell.default ([91.110.221.235])
 by smtp.gmail.com with ESMTPSA id k205sm9275738wmk.4.2020.11.26.05.43.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Nov 2020 05:43:40 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 38/40] drm/amd/display/dc/basics/conversion: Include header
 containing our prototypes
Date: Thu, 26 Nov 2020 13:42:38 +0000
Message-Id: <20201126134240.3214176-39-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201126134240.3214176-1-lee.jones@linaro.org>
References: <20201126134240.3214176-1-lee.jones@linaro.org>
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
Cc: Leo Li <sunpeng.li@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9kYy9iYXNpY3MvY29udmVyc2lvbi5jOjM0
OjEwOiB3YXJuaW5nOiBubyBwcmV2aW91cyBwcm90b3R5cGUgZm9yIOKAmGZpeGVkX3BvaW50X3Rv
X2ludF9mcmFj4oCZIFstV21pc3NpbmctcHJvdG90eXBlc10KIGRyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1Ly4uL2Rpc3BsYXkvZGMvYmFzaWNzL2NvbnZlcnNpb24uYzo4MTo2OiB3YXJuaW5nOiBu
byBwcmV2aW91cyBwcm90b3R5cGUgZm9yIOKAmGNvbnZlcnRfZmxvYXRfbWF0cml44oCZIFstV21p
c3NpbmctcHJvdG90eXBlc10KCkNjOiBIYXJyeSBXZW50bGFuZCA8aGFycnkud2VudGxhbmRAYW1k
LmNvbT4KQ2M6IExlbyBMaSA8c3VucGVuZy5saUBhbWQuY29tPgpDYzogQWxleCBEZXVjaGVyIDxh
bGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgpDYzogIkNocmlzdGlhbiBLw7ZuaWciIDxjaHJpc3Rp
YW4ua29lbmlnQGFtZC5jb20+CkNjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+CkNj
OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+CkNjOiBhbWQtZ2Z4QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpTaWduZWQtb2Zm
LWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2Ry
bS9hbWQvZGlzcGxheS9kYy9iYXNpY3MvY29udmVyc2lvbi5jIHwgMSArCiAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3Bs
YXkvZGMvYmFzaWNzL2NvbnZlcnNpb24uYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9k
Yy9iYXNpY3MvY29udmVyc2lvbi5jCmluZGV4IDUwYjQ3ZjExODc1YzkuLjI0ZWQwM2Q4Y2RhNzQg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9iYXNpY3MvY29udmVy
c2lvbi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9iYXNpY3MvY29udmVy
c2lvbi5jCkBAIC0yNCw2ICsyNCw3IEBACiAgKi8KIAogI2luY2x1ZGUgImRtX3NlcnZpY2VzLmgi
CisjaW5jbHVkZSAiY29udmVyc2lvbi5oIgogCiAjZGVmaW5lIERJVklERVIgMTAwMDAKIAotLSAK
Mi4yNS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
