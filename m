Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ACF562AF81B
	for <lists+dri-devel@lfdr.de>; Wed, 11 Nov 2020 19:36:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1278C6E0BA;
	Wed, 11 Nov 2020 18:36:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EBDD6E0B8
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Nov 2020 18:36:02 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id b8so3528942wrn.0
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Nov 2020 10:36:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=c/TaDkB9aPGP5jIvVTMt5uJ/KkWKg3o08L440ECaIrc=;
 b=r6woMpmmXo0Dj5775fZ4Cgbnwo1FcLxbbKcVGettNgkwJ6Cx4wfgTiVzUOZ6yjHa91
 PDuEfCvVpOvcRcswiUXZE4gg4YiSkaO4G+MOIhIJDFTP4KBjBvqLiq0DNNqICzoiFW7K
 vnX1v4/opW7uZuRGmvaWYOCdLTTwraEi8lxRBR8Po9duljYvHQJF46gFiGEtDBUWJwGv
 DrHkoqTr2dLCZEXQhmRMLTOTSwId9FnX25/MW4mzBrabNNErqk3pzrqo+Xd6pXZyl6sE
 2ULcoFWvBt9kwgAkdUKPix1fyjnL3O+cZaEVUSV5Zl0EWldvROjwGOxITtQgijDW3MkZ
 s3bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=c/TaDkB9aPGP5jIvVTMt5uJ/KkWKg3o08L440ECaIrc=;
 b=uQUmrzQwIdj3QHrkoVSadSKCsgN0KDRRWbcZWjU8GAVf09Ch4YvOolQDgyRVnC5pM5
 /t0ZiaUuR+u9VfQYqiKt63K9okQAuJ2flPATIhoHln1g/y70mitL6nTRpDyI7QvanBgA
 jf41tUeuBnP/rEDeEnc19d0W3odzG1cVxF098++64rdBxsOBgNrabm8vho+u6b7Gahrg
 sdzCY4GqVeOc+gg6b7Ti91mtkTeG/y3NUJn1xEPRB93iAGmJv6HrO/Etx0K8IfQrW+tZ
 MMxTfglmA4g+NhGpVZeYpF7RciUsRkVm0HeT/NaZAA3Z6oj4sJl/qp4bE2craxXsdezd
 B3Ww==
X-Gm-Message-State: AOAM532zKOrKLHi8qaQf9zNUnDP7iKCFuvn36m0WOw8H6q3YOysZJ70/
 XHgwlPUukDpPkemIsPA8qcRrBw==
X-Google-Smtp-Source: ABdhPJyY8o8gKVGXYOjDyRor39+RIHFMv2JbLl6uaiGyTOZu1dzApGW0b1xKClawnwujHmvLLUWJAw==
X-Received: by 2002:adf:e44f:: with SMTP id t15mr28375034wrm.380.1605119761005; 
 Wed, 11 Nov 2020 10:36:01 -0800 (PST)
Received: from dell.default ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id k84sm3558311wmf.42.2020.11.11.10.35.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Nov 2020 10:36:00 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 08/19] drm/radeon/si_dma: Move 'si_gpu_check_soft_reset()'s
 prototype to shared header
Date: Wed, 11 Nov 2020 18:35:34 +0000
Message-Id: <20201111183545.1756994-9-lee.jones@linaro.org>
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
cy9ncHUvZHJtL3JhZGVvbi9zaS5jOjM3Njg6NTogd2FybmluZzogbm8gcHJldmlvdXMgcHJvdG90
eXBlIGZvciDigJhzaV9ncHVfY2hlY2tfc29mdF9yZXNldOKAmSBbLVdtaXNzaW5nLXByb3RvdHlw
ZXNdCiAzNzY4IHwgdTMyIHNpX2dwdV9jaGVja19zb2Z0X3Jlc2V0KHN0cnVjdCByYWRlb25fZGV2
aWNlICpyZGV2KQogfCBefn5+fn5+fn5+fn5+fn5+fn5+fn5+fgoKQ2M6IEFsZXggRGV1Y2hlciA8
YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KQ2M6ICJDaHJpc3RpYW4gS8O2bmlnIiA8Y2hyaXN0
aWFuLmtvZW5pZ0BhbWQuY29tPgpDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgpD
YzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgpDYzogYW1kLWdmeEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKU2lnbmVkLW9m
Zi1ieTogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9k
cm0vcmFkZW9uL3NpLmggICAgIHwgMSArCiBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3NpX2RtYS5j
IHwgMyArLS0KIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vc2kuaCBiL2RyaXZlcnMvZ3B1
L2RybS9yYWRlb24vc2kuaAppbmRleCAwYTUwMThlZjE2NmUyLi5hMTc1MWFlNTYwZjAyIDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3NpLmgKKysrIGIvZHJpdmVycy9ncHUvZHJt
L3JhZGVvbi9zaS5oCkBAIC0yNyw1ICsyNyw2IEBACiBzdHJ1Y3QgcmFkZW9uX2RldmljZTsKIAog
aW50IHNpX21jX2xvYWRfbWljcm9jb2RlKHN0cnVjdCByYWRlb25fZGV2aWNlICpyZGV2KTsKK3Uz
MiBzaV9ncHVfY2hlY2tfc29mdF9yZXNldChzdHJ1Y3QgcmFkZW9uX2RldmljZSAqcmRldik7CiAK
ICNlbmRpZiAgICAgICAgICAgICAgICAgICAgICAgICAvKiBfX1NJX0hfXyAqLwpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9zaV9kbWEuYyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRl
b24vc2lfZG1hLmMKaW5kZXggZDJmYTMwMmE1YmU5Zi4uNjQ1ODk3ZDFiZmMzMSAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9zaV9kbWEuYworKysgYi9kcml2ZXJzL2dwdS9kcm0v
cmFkZW9uL3NpX2RtYS5jCkBAIC0yNSwxMCArMjUsOSBAQAogI2luY2x1ZGUgInJhZGVvbi5oIgog
I2luY2x1ZGUgInJhZGVvbl9hc2ljLmgiCiAjaW5jbHVkZSAicmFkZW9uX3RyYWNlLmgiCisjaW5j
bHVkZSAic2kuaCIKICNpbmNsdWRlICJzaWQuaCIKIAotdTMyIHNpX2dwdV9jaGVja19zb2Z0X3Jl
c2V0KHN0cnVjdCByYWRlb25fZGV2aWNlICpyZGV2KTsKLQogLyoqCiAgKiBzaV9kbWFfaXNfbG9j
a3VwIC0gQ2hlY2sgaWYgdGhlIERNQSBlbmdpbmUgaXMgbG9ja2VkIHVwCiAgKgotLSAKMi4yNS4x
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
