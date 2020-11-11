Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B6CD2AF815
	for <lists+dri-devel@lfdr.de>; Wed, 11 Nov 2020 19:35:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D9316E0AC;
	Wed, 11 Nov 2020 18:35:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57CAA6E0B6
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Nov 2020 18:35:55 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id k2so3527974wrx.2
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Nov 2020 10:35:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eP0WyWZg5ruAlRDHyNqDbB7ackT3+aNOib1WfADr30A=;
 b=uWL7G87ad8BBVCkHBLVEpHZDR8zZqKdyrnOOfcEpLPyUY3xT+ts4pkohRGIbD+xnu8
 /Iz+STdZtJMMEoeMJaIhC356yaZnl6WUZGi47iCmWDzKV0Mu+VkcfBm4HTxKQ+RO0KA/
 HdkdQwGyTAqbmjccN90fWErcuo6zeYrO+h6Da6EK+C9xPXHLyLa6YAqONl16i3IQEvcU
 +3siVCh0rpVbt1upZqzW+MliM3OXB0129YlDV3PAHMl9JKSAwWTt9rrH9aI+w81zgyCA
 ulk7nZN40BMCJdrrUgJPMrIoFuerGLtgVecgPs39c3C4GsMjHzKzET9sK6WY6ikVhKpN
 dn6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eP0WyWZg5ruAlRDHyNqDbB7ackT3+aNOib1WfADr30A=;
 b=ZK0xrcnfV+5U95UDQErvWB54QKdrIf8MhIA1QhZ/GnHc90c7WubqkmXTGHa7S4Q8XP
 JkBz4KurguMvSj4XqxtI8xLjj+fa/wpcaLifOjVzPxtEy72zIpg/njYEXNzDO0QZRWpL
 K6FiZGw9OtwRvcxGd0NvZBDaFNYCDrvqUFGDAHaJ1YOSAvbvAaxNN3Cz1qNriXco8BFr
 1nygiEt+Yb7Rscx/HX+FdBDFutR5lgsiDNdTvDIm3W8t2Hwc9kdamoqPjAKJXgsgpR1x
 bkgTDIDxUjAPCLURrXsnbiDahfgoVB8Dee9s3hXE/+JFSiXXll2Zq4DSaVv5h5+l8X1U
 35jw==
X-Gm-Message-State: AOAM530DV9q01NP9iHZdjVJ09zjXjvxhE+ov6EqQHJSWMC/E3tuSpqVf
 C3UaKlAE+yuQo0Z2ji5nNGwupQ==
X-Google-Smtp-Source: ABdhPJySQOMuzRn2OADac5SQlejJdpHY1681Ddh/ovuTq00XPGI73rfjk/KhDTqbXGIORvDN1CVW2Q==
X-Received: by 2002:adf:ed11:: with SMTP id a17mr16771878wro.197.1605119753978; 
 Wed, 11 Nov 2020 10:35:53 -0800 (PST)
Received: from dell.default ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id k84sm3558311wmf.42.2020.11.11.10.35.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Nov 2020 10:35:53 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 04/19] drm/radeon/radeon_atombios: Move
 'radeon_add_atom_encoder()'s prototype to shared header
Date: Wed, 11 Nov 2020 18:35:30 +0000
Message-Id: <20201111183545.1756994-5-lee.jones@linaro.org>
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
cy9ncHUvZHJtL3JhZGVvbi9hdG9tYmlvc19lbmNvZGVycy5jOjI3MjE6MTogd2FybmluZzogbm8g
cHJldmlvdXMgcHJvdG90eXBlIGZvciDigJhyYWRlb25fYWRkX2F0b21fZW5jb2RlcuKAmSBbLVdt
aXNzaW5nLXByb3RvdHlwZXNdCiAyNzIxIHwgcmFkZW9uX2FkZF9hdG9tX2VuY29kZXIoc3RydWN0
IGRybV9kZXZpY2UgKmRldiwKIHwgXn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4KCkNjOiBBbGV4IERl
dWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+CkNjOiAiQ2hyaXN0aWFuIEvDtm5pZyIg
PGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51
eC5pZT4KQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KQ2M6IGFtZC1nZnhAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCkNjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnClNp
Z25lZC1vZmYtYnk6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+Ci0tLQogZHJpdmVy
cy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fYXRvbWJpb3MuYyB8IDQgLS0tLQogZHJpdmVycy9ncHUv
ZHJtL3JhZGVvbi9yYWRlb25fYXRvbWJpb3MuaCB8IDQgKysrKwogMiBmaWxlcyBjaGFuZ2VkLCA0
IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL3JhZGVvbi9yYWRlb25fYXRvbWJpb3MuYyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFk
ZW9uX2F0b21iaW9zLmMKaW5kZXggY2M4MDY1MWIyNTc3My4uYmU5NmQ5YjY0ZTQzYiAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fYXRvbWJpb3MuYworKysgYi9kcml2
ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9hdG9tYmlvcy5jCkBAIC0zNywxMCArMzcsNiBAQAog
I2luY2x1ZGUgInJhZGVvbl9hdG9tYmlvcy5oIgogI2luY2x1ZGUgInJhZGVvbl9sZWdhY3lfZW5j
b2RlcnMuaCIKIAotZXh0ZXJuIHZvaWQKLXJhZGVvbl9hZGRfYXRvbV9lbmNvZGVyKHN0cnVjdCBk
cm1fZGV2aWNlICpkZXYsIHVpbnQzMl90IGVuY29kZXJfZW51bSwKLQkJCXVpbnQzMl90IHN1cHBv
cnRlZF9kZXZpY2UsIHUxNiBjYXBzKTsKLQogdW5pb24gYXRvbV9zdXBwb3J0ZWRfZGV2aWNlcyB7
CiAJc3RydWN0IF9BVE9NX1NVUFBPUlRFRF9ERVZJQ0VTX0lORk8gaW5mbzsKIAlzdHJ1Y3QgX0FU
T01fU1VQUE9SVEVEX0RFVklDRVNfSU5GT18yIGluZm9fMjsKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9yYWRlb24vcmFkZW9uX2F0b21iaW9zLmggYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9u
L3JhZGVvbl9hdG9tYmlvcy5oCmluZGV4IGI3Yzc2OTIwZmViN2QuLmE4OTVhNzAwMmMzZDMgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2F0b21iaW9zLmgKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fYXRvbWJpb3MuaApAQCAtMjgsMTAgKzI4LDE0
IEBACiAjaWZuZGVmIF9fUkFERU9OX0FUT01CSU9TX0hfXwogI2RlZmluZSBfX1JBREVPTl9BVE9N
QklPU19IX18KIAorc3RydWN0IGRybV9kZXZpY2U7CiBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZTsK
IHN0cnVjdCByYWRlb25fZGV2aWNlOwogCiBib29sIHJhZGVvbl9hdG9tX2dldF90dl90aW1pbmdz
KHN0cnVjdCByYWRlb25fZGV2aWNlICpyZGV2LCBpbnQgaW5kZXgsCiAJCQkJc3RydWN0IGRybV9k
aXNwbGF5X21vZGUgKm1vZGUpOwordm9pZCByYWRlb25fYWRkX2F0b21fZW5jb2RlcihzdHJ1Y3Qg
ZHJtX2RldmljZSAqZGV2LCB1aW50MzJfdCBlbmNvZGVyX2VudW0sCisJCQkgICAgIHVpbnQzMl90
IHN1cHBvcnRlZF9kZXZpY2UsIHUxNiBjYXBzKTsKKwogCiAjZW5kaWYgICAgICAgICAgICAgICAg
ICAgICAgICAgLyogX19SQURFT05fQVRPTUJJT1NfSF9fICovCi0tIAoyLjI1LjEKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
