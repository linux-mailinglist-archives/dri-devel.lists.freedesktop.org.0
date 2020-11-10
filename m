Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95CA12ADF68
	for <lists+dri-devel@lfdr.de>; Tue, 10 Nov 2020 20:31:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BF3C89BFF;
	Tue, 10 Nov 2020 19:31:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A439889BF8
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 19:31:31 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id h62so4311838wme.3
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 11:31:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xLMSTbAF92ExvmzWs2JoLwFgJtHWMDt9gk+mh90YZlk=;
 b=vS46JKcEmSWEQ3jxokyfU3VpP+Kg5LtmqXQcuf/5Lpde1IBpJDp2rXzKHT9D2/Sn5J
 yCgGGCxwdlJNzYtFFtYduZNnDZW8g7uzYAawpyS49TyAd1vEMgQLCnuL7DuH22jt4jmE
 /flXpNq4bfxjgNX0LGd6afTlsweLI1uevM8eoFZSv5F3HHg0BuqX6D262fuEtKnk/n9/
 slWy4R9tVgQaF1FOGG56x8ognPP/x2Grl1EEOyXYILf0zJAIguIzqxePHoQLKZ90QQyN
 BJdcIKLygprzsTLHGs4qnZzfIJUPOjadAD49f8ag10HK38i0fzolUac0mlThHXgdqn4F
 hZLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xLMSTbAF92ExvmzWs2JoLwFgJtHWMDt9gk+mh90YZlk=;
 b=g4UDk2xq3jfqbWdtFiHPxdfdA7uEMY732NHOiVROLjJaKR+MQ4MW4SAC/NEky7jZaX
 9US0aMW/+xw0u/3RcDl/rL3JBO209sjjNLMQRDXAqLv+Cq3kQ0h8JDHB3ylEJ9wax4/0
 spkrgEX5hZuLp0iy8VMlM8jjeIDTZHoGVwBSUMJ+7XEG4S/AnZsA//Ae6sc3tc2Sgr4z
 rW7gDUYWSwXADV0Xx3HKaLJAeXKpeAVu7Rjisuxf09MZWRRMXJpd1cXGEicT6tRJIzlj
 5Y528ZmzA+YQqJDqd9auVkhrs6oC3mhdUrtbieeC40ClbfS1z6g1q4LgH/wScjaTirK0
 slGA==
X-Gm-Message-State: AOAM532kXRavWlMcCy+Hi2pZiTT7Jkb/VMaYanEQ9GDaVEhNJXzWOyvq
 g6RZ0KErLOVSFGjq63REIE/Ukw==
X-Google-Smtp-Source: ABdhPJw/JxxqA18VBzRvlKN0u/UYpIts1gzl/5bw4Z+3TTPyCM+aH12jT763m9MwukJRI3bn6bSaeA==
X-Received: by 2002:a1c:99d3:: with SMTP id b202mr764766wme.0.1605036690396;
 Tue, 10 Nov 2020 11:31:30 -0800 (PST)
Received: from dell.default ([91.110.221.139])
 by smtp.gmail.com with ESMTPSA id 30sm17635335wrs.84.2020.11.10.11.31.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 11:31:29 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 11/30] drm/radeon/radeon_ib: Supply description for
 'radeon_ib_get's get param
Date: Tue, 10 Nov 2020 19:30:53 +0000
Message-Id: <20201110193112.988999-12-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201110193112.988999-1-lee.jones@linaro.org>
References: <20201110193112.988999-1-lee.jones@linaro.org>
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
cy9ncHUvZHJtL3JhZGVvbi9yYWRlb25faWIuYzo2MTogd2FybmluZzogRnVuY3Rpb24gcGFyYW1l
dGVyIG9yIG1lbWJlciAndm0nIG5vdCBkZXNjcmliZWQgaW4gJ3JhZGVvbl9pYl9nZXQnCgpDYzog
QWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgpDYzogIkNocmlzdGlhbiBL
w7ZuaWciIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+CkNjOiBEYXZpZCBBaXJsaWUgPGFpcmxp
ZWRAbGludXguaWU+CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+CkNjOiBhbWQt
Z2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpTaWduZWQtb2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgotLS0K
IGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2liLmMgfCAxICsKIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFk
ZW9uX2liLmMgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9pYi5jCmluZGV4IDlmZDU1
ZTljNjE2YjAuLmMxZmNhMmJhNDQzYzkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yYWRl
b24vcmFkZW9uX2liLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25faWIuYwpA
QCAtNDgsNiArNDgsNyBAQCBzdGF0aWMgaW50IHJhZGVvbl9kZWJ1Z2ZzX3NhX2luaXQoc3RydWN0
IHJhZGVvbl9kZXZpY2UgKnJkZXYpOwogICoKICAqIEByZGV2OiByYWRlb25fZGV2aWNlIHBvaW50
ZXIKICAqIEByaW5nOiByaW5nIGluZGV4IHRoZSBJQiBpcyBhc3NvY2lhdGVkIHdpdGgKKyAqIEB2
bTogcmVxdWVzdGVkIHZtCiAgKiBAaWI6IElCIG9iamVjdCByZXR1cm5lZAogICogQHNpemU6IHJl
cXVlc3RlZCBJQiBzaXplCiAgKgotLSAKMi4yNS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWwK
