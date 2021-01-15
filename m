Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7892A2F837D
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jan 2021 19:14:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C155F6E4A7;
	Fri, 15 Jan 2021 18:14:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13C066E49C
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 18:14:05 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id y187so8409447wmd.3
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 10:14:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JPqjkgIRJp+MRlYiJIdOLESmtI1+G3x8A3c4gbTlrp8=;
 b=URYUQikT1ubIBypdWNn5JgBBuXlql29P1qAbd5qPje/NQfeENl1ULvQa//CbMbYFoF
 b20uBNi16xepfMRbzFAyJRUVZ5MqivZm/jQ3qlfN7rnn+QWmxkY2iaz8w1vQ2BgJSII3
 0FwKk8O6S4fT3G1jrL1Nm0znrOhkfTzKQcuxjdDJigTEszxLz87IAitAEMwf4C97U6AX
 KHGWLXJiXGxqvJNLPK3vjQ0+TiasqtTYfpbhyX8g1IJOabVyiiW4vHc7/d9vvvMkRYZT
 bAG0gZZTYzUgwzxPPL+V2uepaHxF6vv6mwTy6iwe+9FlYsL9SGj8WiBBjMMNQZgSFKdY
 uCEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JPqjkgIRJp+MRlYiJIdOLESmtI1+G3x8A3c4gbTlrp8=;
 b=T1R+ehSqpFCDGfIkOxFH9VvMU3+/45nSge+pId8Mv7E5h8tZ0YyIw6GygN9IZUnSlg
 2Tjl+WHJJkUGK7UbpIlkMUqUMte4dUtqIilsnkBIWlEW3YbE2nyiDokoBwrlSHwBY90+
 lx5d7JopUn2LlDDxgjORuylEWQZge0y7lyAGJq3Fzdroo+S9ojf8KYo4UDSNts0zfby8
 2se/gKBy9lwdUn9qg7SpUH8xz1x6Ep9jPGLLBqmcJH34TGfCH4Q6W7P85tSFmNceOZFa
 N9/o9l1OkCF//1XDiQmUe54HXJheuhNqP+xm7K9VmghRwqefb6neCpfNAWpGxvWldhs5
 7Hvw==
X-Gm-Message-State: AOAM530T9uISvJ8cvs81NshjMhUxiKdHGjkUUvywH9ip0PfaiIMtr90y
 YFsmX0J7tqqJVqfhGw3xkgEXOg==
X-Google-Smtp-Source: ABdhPJw2MMzpvaVQAHHCh49HDDbQw3JQpBE0IuwjQPFWWV6qwKFryTl5zZIFzmE6Gxwu+wLm18l++w==
X-Received: by 2002:a1c:2d48:: with SMTP id t69mr9677839wmt.124.1610734443715; 
 Fri, 15 Jan 2021 10:14:03 -0800 (PST)
Received: from dell.default ([91.110.221.158])
 by smtp.gmail.com with ESMTPSA id j2sm16123484wrh.78.2021.01.15.10.14.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 10:14:03 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 31/40] drm/gma500/gem: Do not rely on consumers to include
 drm/drm_device.h before gem.h
Date: Fri, 15 Jan 2021 18:13:04 +0000
Message-Id: <20210115181313.3431493-32-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210115181313.3431493-1-lee.jones@linaro.org>
References: <20210115181313.3431493-1-lee.jones@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL2dtYTUwMC9nZW0uaDoxMzo1Nzogd2FybmluZzog4oCYc3RydWN0IGRybV9kZXZp
Y2XigJkgZGVjbGFyZWQgaW5zaWRlIHBhcmFtZXRlciBsaXN0IHdpbGwgbm90IGJlIHZpc2libGUg
b3V0c2lkZSBvZiB0aGlzIGRlZmluaXRpb24gb3IgZGVjbGFyYXRpb24KCkNjOiBQYXRyaWsgSmFr
b2Jzc29uIDxwYXRyaWsuci5qYWtvYnNzb25AZ21haWwuY29tPgpDYzogRGF2aWQgQWlybGllIDxh
aXJsaWVkQGxpbnV4LmllPgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgpDYzog
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpTaWduZWQtb2ZmLWJ5OiBMZWUgSm9uZXMg
PGxlZS5qb25lc0BsaW5hcm8ub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9nbWE1MDAvZ2VtLmgg
fCAyICsrCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2dtYTUwMC9nZW0uaCBiL2RyaXZlcnMvZ3B1L2RybS9nbWE1MDAvZ2VtLmgK
aW5kZXggMzc0MWE3MTFiOWZkZS4uYmFlNjQ1NGVhZDI5MiAxMDA2NDQKLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2dtYTUwMC9nZW0uaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vZ21hNTAwL2dlbS5oCkBA
IC04LDYgKzgsOCBAQAogI2lmbmRlZiBfR0VNX0gKICNkZWZpbmUgX0dFTV9ICiAKK3N0cnVjdCBk
cm1fZGV2aWNlOworCiBleHRlcm4gY29uc3Qgc3RydWN0IGRybV9nZW1fb2JqZWN0X2Z1bmNzIHBz
Yl9nZW1fb2JqZWN0X2Z1bmNzOwogCiBleHRlcm4gaW50IHBzYl9nZW1fY3JlYXRlKHN0cnVjdCBk
cm1fZmlsZSAqZmlsZSwgc3RydWN0IGRybV9kZXZpY2UgKmRldiwKLS0gCjIuMjUuMQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
