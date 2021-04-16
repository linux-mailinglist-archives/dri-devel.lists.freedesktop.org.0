Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF79A36228F
	for <lists+dri-devel@lfdr.de>; Fri, 16 Apr 2021 16:38:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A34C6EC1C;
	Fri, 16 Apr 2021 14:37:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90CD26EC03
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 14:37:51 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id u17so42505719ejk.2
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 07:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eXZ/aruuf/HDb1osSRlOCbptqW9LQNCh62l+8IzDShM=;
 b=nala5xvwW4MR5oUqd1Vd1iKc4vIyEJwpnl6RWKmmRlI6Autue0yAgs03YV3Gh8pRy4
 kQ4hQeBHdwy4OObwHv3Zc8vILSSbr7ywqZx40DdqQvNjkhibnACpJEeb081cQ7YBdTED
 QGWpeKx4AfyrhZBX0iCxe4a2kz6ZcrqZ8f/DWwUX9dvKHxa2apbWfWverpRtZpWGBZFv
 x5I5vVcbL3vY7l871W6ewNDm7yrxYYb3nJccs+QLYmiCHlER6RjIE+YWnO9pfXmZ5WKh
 c+3gNXB/0gw9wlMUuziI9QCqfgF776+08XI5QLAy5fkkeTpXCRf7kIU5dBUP4WWuWde5
 1jPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eXZ/aruuf/HDb1osSRlOCbptqW9LQNCh62l+8IzDShM=;
 b=QTsOCbEdQ/pemAvyGFenzCaCjUfZjdclx8WZpTgYPuVRXi/OyiRJqto+3KPVRD4xR9
 yPlZSbEX2WBCu8epcghrRJi2eTpWfdCB0mB/1TI7p6WuKxfUJ4hCiIDVhjDcNSEtWzOk
 UIjCZgosP9R7xqApFVzCSRpTVPXsrqq23vGUml66+nPhJWoBm7hF14sFqOU+XgCicVvD
 6H9B9wIe8a94Bzxowka8jcHKmWr49ylzb5FOlcQ8LTh3WbJd5q38NWaHAG2f5FlbYS5m
 MxlUF1yzOHQ1TFGlYT3hHpCGX/8jWtYP5cnM4HhEf9Je2zmZbHXkZleEyeZg0AzEoaTa
 jeWA==
X-Gm-Message-State: AOAM532pCXZR3SlIfHjL45gFKAEdSalxY8yEbOdBFQA1gEpiv8Q4+lu5
 DhNmNceOFJkbEA/8Qx+53BCf3w==
X-Google-Smtp-Source: ABdhPJzMVYjB71yZ+la0ZUZ6dNZ79mUg8xL53xjArp5VNzBK2OTsFLdVpHquWHqf/cMoj1h10DZv2w==
X-Received: by 2002:a17:906:90d4:: with SMTP id
 v20mr8564697ejw.275.1618583870141; 
 Fri, 16 Apr 2021 07:37:50 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
 by smtp.gmail.com with ESMTPSA id j10sm1326523ejk.93.2021.04.16.07.37.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 07:37:49 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 19/40] drm/omapdrm/omap_gem: Properly document
 omap_gem_dumb_map_offset()
Date: Fri, 16 Apr 2021 15:37:04 +0100
Message-Id: <20210416143725.2769053-20-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210416143725.2769053-1-lee.jones@linaro.org>
References: <20210416143725.2769053-1-lee.jones@linaro.org>
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
Cc: Tomi Valkeinen <tomba@kernel.org>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, Rob Clark <rob.clark@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL29tYXBkcm0vb21hcF9nZW0uYzo2MTk6IHdhcm5pbmc6IGV4cGVjdGluZyBwcm90
b3R5cGUgZm9yIG9tYXBfZ2VtX2R1bWJfbWFwKCkuIFByb3RvdHlwZSB3YXMgZm9yIG9tYXBfZ2Vt
X2R1bWJfbWFwX29mZnNldCgpIGluc3RlYWQKCkNjOiBUb21pIFZhbGtlaW5lbiA8dG9tYmFAa2Vy
bmVsLm9yZz4KQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KQ2M6IERhbmllbCBW
ZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KQ2M6IFN1bWl0IFNlbXdhbCA8c3VtaXQuc2Vtd2FsQGxp
bmFyby5vcmc+CkNjOiAiQ2hyaXN0aWFuIEvDtm5pZyIgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNv
bT4KQ2M6IFJvYiBDbGFyayA8cm9iLmNsYXJrQGxpbmFyby5vcmc+CkNjOiBkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCkNjOiBsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmcKQ2M6IGxp
bmFyby1tbS1zaWdAbGlzdHMubGluYXJvLm9yZwpTaWduZWQtb2ZmLWJ5OiBMZWUgSm9uZXMgPGxl
ZS5qb25lc0BsaW5hcm8ub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL29tYXBfZ2Vt
LmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vb21hcGRybS9vbWFwX2dlbS5jIGIvZHJpdmVy
cy9ncHUvZHJtL29tYXBkcm0vb21hcF9nZW0uYwppbmRleCAzOGFmNjE5NWQ5NTkzLi4yN2M3MWNk
ZWQ1ZDBhIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vb21hcGRybS9vbWFwX2dlbS5jCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL29tYXBfZ2VtLmMKQEAgLTYwNSw3ICs2MDUsNyBA
QCBpbnQgb21hcF9nZW1fZHVtYl9jcmVhdGUoc3RydWN0IGRybV9maWxlICpmaWxlLCBzdHJ1Y3Qg
ZHJtX2RldmljZSAqZGV2LAogfQogCiAvKioKLSAqIG9tYXBfZ2VtX2R1bWJfbWFwCS0JYnVmZmVy
IG1hcHBpbmcgZm9yIGR1bWIgaW50ZXJmYWNlCisgKiBvbWFwX2dlbV9kdW1iX21hcF9vZmZzZXQJ
LQlidWZmZXIgbWFwcGluZyBmb3IgZHVtYiBpbnRlcmZhY2UKICAqIEBmaWxlOiBvdXIgZHJtIGNs
aWVudCBmaWxlCiAgKiBAZGV2OiBkcm0gZGV2aWNlCiAgKiBAaGFuZGxlOiBHRU0gaGFuZGxlIHRv
IHRoZSBvYmplY3QgKGZyb20gZHVtYl9jcmVhdGUpCi0tIAoyLjI3LjAKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
