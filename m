Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 987902AF817
	for <lists+dri-devel@lfdr.de>; Wed, 11 Nov 2020 19:36:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC8FD6E0AB;
	Wed, 11 Nov 2020 18:35:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F13C46E0A8
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Nov 2020 18:35:53 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id o15so3514449wru.6
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Nov 2020 10:35:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5TTguyaQuVrd+USo/F+rMhw06NLnXmuljJDk3k933AM=;
 b=uzYnXdFFpGFm/O/yOG8ZnLUAwCXGekg2acMZNKqILkDN5/NpAh6cm4f6K2dqKdkJSn
 C7NRB6cZlnNl8hSwWeBmI36L4kdkOL3H4CmV87xjGW/FpXfExfTEu8a45Q4Y/V243SnO
 qGFS0il8RaTQOfwdfzUBnRXSabA3COE4c7YFG+yDuJ9WBCF9rBWj8yrEzOrUgjnQapnL
 D/WJ/RQQOsJ6t8yAtJBi2DNUPyxK5rCNaUWcRyoqXBo21obVwGHtq5ZrCENObNqe0lN1
 3qjzGG56Gfes7ebdpjzYG1smr2Tp3b5vwvffnIt63DYfsfYCIuVGakNbesczuHou+RCn
 /xOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5TTguyaQuVrd+USo/F+rMhw06NLnXmuljJDk3k933AM=;
 b=TEhNn4Qb7Y2baKeOIahMLYkwZ/R60FNgfnqOqUXKTfZRQDX0Bm3FtHyZEhM0wjCUD8
 xF2lcT2+Ic8XriIGCoV0GFItyt6tKxcM3vKE1GwpCcJZFQS2JQNd3TpqohyHWgrgnVdY
 IQc6lEYpD6drHu2Cvgh8jrfTw1KmV1NLuUABQc4GCGTQ9u9Bkc/wPGCLIFjoJt0ogxxD
 c+5v5r653zzYbBDpDfvCBbpmIm7Pm6pERN9ORqJVfpBlLwZ9vsff8GCKv3rqPmyMoOq5
 fE5vCmm1yfRNBCIbHEaBa1+BOnn6xUVZAqjlw3tvxZJgUzInsN1YZqa/C1AW28fEbEzA
 ngiA==
X-Gm-Message-State: AOAM533Qtwd5R4Xvmvxs2lvhch2G8ZdAXVCj3skNNgkmeapwcNDCDa1Q
 r7+xf7gruaPvFC5mWZEloNu20A==
X-Google-Smtp-Source: ABdhPJz1U7jH0AHxumlfztYxCgXSd62vSFI+BQvD1c3fi+W9yP8psRSOQGLIgiF1Ay2M34GtNjD27Q==
X-Received: by 2002:a5d:6cc5:: with SMTP id c5mr31747759wrc.301.1605119752670; 
 Wed, 11 Nov 2020 10:35:52 -0800 (PST)
Received: from dell.default ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id k84sm3558311wmf.42.2020.11.11.10.35.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Nov 2020 10:35:51 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 03/19] drm/radeon/ni_dma: Move
 'cayman_gpu_check_soft_reset()'s prototype to shared header
Date: Wed, 11 Nov 2020 18:35:29 +0000
Message-Id: <20201111183545.1756994-4-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201111183545.1756994-1-lee.jones@linaro.org>
References: <20201111183545.1756994-1-lee.jones@linaro.org>
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
cy9ncHUvZHJtL3JhZGVvbi9uaS5jOjE3MzM6NTogd2FybmluZzogbm8gcHJldmlvdXMgcHJvdG90
eXBlIGZvciDigJhjYXltYW5fZ3B1X2NoZWNrX3NvZnRfcmVzZXTigJkgWy1XbWlzc2luZy1wcm90
b3R5cGVzXQogMTczMyB8IHUzMiBjYXltYW5fZ3B1X2NoZWNrX3NvZnRfcmVzZXQoc3RydWN0IHJh
ZGVvbl9kZXZpY2UgKnJkZXYpCiB8IF5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fgoKQ2M6IEFs
ZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KQ2M6ICJDaHJpc3RpYW4gS8O2
bmlnIiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgpDYzogRGF2aWQgQWlybGllIDxhaXJsaWVk
QGxpbnV4LmllPgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgpDYzogYW1kLWdm
eEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKU2lnbmVkLW9mZi1ieTogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4KLS0tCiBk
cml2ZXJzL2dwdS9kcm0vcmFkZW9uL25pLmggICAgIHwgMSArCiBkcml2ZXJzL2dwdS9kcm0vcmFk
ZW9uL25pX2RtYS5jIHwgMyArLS0KIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAy
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vbmkuaCBi
L2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vbmkuaAppbmRleCBkNjNiZTFjODhjMGYxLi45YTVmMzFh
MDVlNjhmIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL25pLmgKKysrIGIvZHJp
dmVycy9ncHUvZHJtL3JhZGVvbi9uaS5oCkBAIC0zNCw1ICszNCw2IEBAIHZvaWQgY2F5bWFuX2Nw
X2ludF9jbnRsX3NldHVwKHN0cnVjdCByYWRlb25fZGV2aWNlICpyZGV2LAogCQkJICAgICAgaW50
IHJpbmcsIHUzMiBjcF9pbnRfY250bCk7CiB2b2lkIGNheW1hbl92bV9kZWNvZGVfZmF1bHQoc3Ry
dWN0IHJhZGVvbl9kZXZpY2UgKnJkZXYsCiAJCQkgICAgdTMyIHN0YXR1cywgdTMyIGFkZHIpOwor
dTMyIGNheW1hbl9ncHVfY2hlY2tfc29mdF9yZXNldChzdHJ1Y3QgcmFkZW9uX2RldmljZSAqcmRl
dik7CiAKICNlbmRpZgkJCQkvKiBfX05JX0hfXyAqLwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL3JhZGVvbi9uaV9kbWEuYyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vbmlfZG1hLmMKaW5k
ZXggYzU2MTM2ODQ4MzYwZS4uYmQ1MTVhZDRmZTRjYyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL3JhZGVvbi9uaV9kbWEuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL25pX2RtYS5j
CkBAIC0yNSwxMCArMjUsOSBAQAogI2luY2x1ZGUgInJhZGVvbi5oIgogI2luY2x1ZGUgInJhZGVv
bl9hc2ljLmgiCiAjaW5jbHVkZSAicmFkZW9uX3RyYWNlLmgiCisjaW5jbHVkZSAibmkuaCIKICNp
bmNsdWRlICJuaWQuaCIKIAotdTMyIGNheW1hbl9ncHVfY2hlY2tfc29mdF9yZXNldChzdHJ1Y3Qg
cmFkZW9uX2RldmljZSAqcmRldik7Ci0KIC8qCiAgKiBETUEKICAqIFN0YXJ0aW5nIHdpdGggUjYw
MCwgdGhlIEdQVSBoYXMgYW4gYXN5bmNocm9ub3VzCi0tIAoyLjI1LjEKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
