Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E65292AC6D2
	for <lists+dri-devel@lfdr.de>; Mon,  9 Nov 2020 22:19:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DD7589590;
	Mon,  9 Nov 2020 21:19:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10CC289598
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Nov 2020 21:19:20 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id t67so902273wmt.5
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Nov 2020 13:19:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mNbwgos7EBbAiIS/whVqYV59kF6ty8MKTbhrWe3Hj/4=;
 b=vDRSOmaOWfnFuTXwEONPBcO8vJz7zF39LmqlgHPib6OIXViysSis7axMfLToI6uzcL
 fflPl+k/7ZFLIGyyXOLQ3TiIrfwGxSkGA9MmRO2uUcGtCt0kGjl+uBPJRp3aPomVX1BF
 EsHIQZXRDK9Vnv4zD/sgKAUuLnYw0kUHMXsav4ieFfUvp3ZnOj++Jot2LssQVDnBcsPx
 39lCcPvgMs9bMyUsvFNk7r5g109XNQaut2J9n314ZUar9st0RyOSYygednECLaUvqshj
 UwCOwCaWkMWuHpYepBA4xCTKSRCE/Z6mWJww+6Zuk694xH4pxg0gQXodu1LbNfYithWA
 sLVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mNbwgos7EBbAiIS/whVqYV59kF6ty8MKTbhrWe3Hj/4=;
 b=dQeC2V31+6feyBQMFUPOFFjO+U12dU8+Ht5NHX5e0z9PDl+pqXSDep+LJCAlNWTV/g
 IlgGyUkByLrc8xqCMEm4TsLEAxzLYaCL1Q3uitCkDYYAetj0H5d97TDxjaAnC0t297mr
 NkNyHcELrtjlpE6ciVPDTbsmFWnU4zYaJ22HJliSI6hRbvctTAzkhlvf01FKdIQsqD/6
 bv9+zO+fGW1Dxiktw/I38k+WdQ7Xay7kw5WdAVMfI/4JdF86nZ/DFLMEQiiPdmSapV6n
 h+ElEV1ruajKi9rWgcRiqbr8cY8l/dV5O8cx5uRcOt+OhCvjah3d9qmwplebIyEb0saA
 2hsg==
X-Gm-Message-State: AOAM531pzjHhO0yXLqMXRSRRD3cm+pmihKr5oJvzjmSXXskiCRGBmkuT
 3SX6zAQ3mC/uvPtcrlesBjhY7g==
X-Google-Smtp-Source: ABdhPJwXSIdyefVkSvwIj9A5z6/yqfw7C2R6xM1Kyh7ySdKYokfnHteeebzlBmPFWZibPYCJ4/B5lg==
X-Received: by 2002:a1c:9950:: with SMTP id b77mr1103869wme.123.1604956758642; 
 Mon, 09 Nov 2020 13:19:18 -0800 (PST)
Received: from dell.default ([91.110.221.139])
 by smtp.gmail.com with ESMTPSA id 71sm15170630wrm.20.2020.11.09.13.19.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2020 13:19:18 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 06/20] drm/radeon/radeon_connectors: Strip out set but unused
 variable 'ret'
Date: Mon,  9 Nov 2020 21:18:41 +0000
Message-Id: <20201109211855.3340030-7-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201109211855.3340030-1-lee.jones@linaro.org>
References: <20201109211855.3340030-1-lee.jones@linaro.org>
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
cy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fY29ubmVjdG9ycy5jOiBJbiBmdW5jdGlvbiDigJhyYWRl
b25fc2V0dXBfbXN0X2Nvbm5lY3RvcuKAmToKIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9u
X2Nvbm5lY3RvcnMuYzoyNTc0Ojc6IHdhcm5pbmc6IHZhcmlhYmxlIOKAmHJldOKAmSBzZXQgYnV0
IG5vdCB1c2VkIFstV3VudXNlZC1idXQtc2V0LXZhcmlhYmxlXQoKQ2M6IEFsZXggRGV1Y2hlciA8
YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KQ2M6ICJDaHJpc3RpYW4gS8O2bmlnIiA8Y2hyaXN0
aWFuLmtvZW5pZ0BhbWQuY29tPgpDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgpD
YzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgpDYzogYW1kLWdmeEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKU2lnbmVkLW9m
Zi1ieTogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9k
cm0vcmFkZW9uL3JhZGVvbl9jb25uZWN0b3JzLmMgfCA0ICstLS0KIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vcmFkZW9uL3JhZGVvbl9jb25uZWN0b3JzLmMgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3Jh
ZGVvbl9jb25uZWN0b3JzLmMKaW5kZXggZTMwODM0NDM0NDQyNS4uNjA3YWQ1NjIwYmQ5OSAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fY29ubmVjdG9ycy5jCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2Nvbm5lY3RvcnMuYwpAQCAtMjU3MSwxMyAr
MjU3MSwxMSBAQCB2b2lkIHJhZGVvbl9zZXR1cF9tc3RfY29ubmVjdG9yKHN0cnVjdCBkcm1fZGV2
aWNlICpkZXYpCiAJCXJldHVybjsKIAogCWxpc3RfZm9yX2VhY2hfZW50cnkoY29ubmVjdG9yLCAm
ZGV2LT5tb2RlX2NvbmZpZy5jb25uZWN0b3JfbGlzdCwgaGVhZCkgewotCQlpbnQgcmV0OwotCiAJ
CXJhZGVvbl9jb25uZWN0b3IgPSB0b19yYWRlb25fY29ubmVjdG9yKGNvbm5lY3Rvcik7CiAKIAkJ
aWYgKGNvbm5lY3Rvci0+Y29ubmVjdG9yX3R5cGUgIT0gRFJNX01PREVfQ09OTkVDVE9SX0Rpc3Bs
YXlQb3J0KQogCQkJY29udGludWU7CiAKLQkJcmV0ID0gcmFkZW9uX2RwX21zdF9pbml0KHJhZGVv
bl9jb25uZWN0b3IpOworCQlyYWRlb25fZHBfbXN0X2luaXQocmFkZW9uX2Nvbm5lY3Rvcik7CiAJ
fQogfQotLSAKMi4yNS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWwK
