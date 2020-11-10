Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F1C42ADF59
	for <lists+dri-devel@lfdr.de>; Tue, 10 Nov 2020 20:31:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F17B89BEC;
	Tue, 10 Nov 2020 19:31:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C75E89BE8
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 19:31:20 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id h62so4311284wme.3
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 11:31:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZQX81Ctm9sTtgsQoGgQawTW9+eghPr6miXi9Ld6UbB8=;
 b=CmiXRc4v8Kl5jmW2EN11kUgPzLzq6Ark8ALqQCkz7GSbVukMERLz7d42Srtb/5WZf0
 9GGVvNS/FOFrNkCI2tC+GVapoUfn3vxiA/2KGrNqIlUJuTVatDxWbLsoqyjpWdrsxfKw
 2koS0NDXH7HziyogXgW4QacBGKC2Zo4tkuZYo8up3YFUB6bl1jTDN3iWO15YazabMPTo
 GxLWm0N9zlhFo0tAcj5TGPHZF8oyEK5bM96EaQpH7iqLceE5jm8NEMIYaJoLFqSRa8Oy
 iIfkHJ0VjJp+5NAo2Mftgh+iev5UvoFwfRFjqqciW/UHlHutNrL1V9oUVAyVk8sM9Z4F
 zmFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZQX81Ctm9sTtgsQoGgQawTW9+eghPr6miXi9Ld6UbB8=;
 b=UoT9sCZ4zNqnAbRDVrBeTxzEUhqXuvNUsIGnZVqawlo4c+9tj7V3NgwGT+M360xFbW
 EBS8Tz5N/4pNYc5ZKi7ejYBkdhOgTISJchLfNRJdoB52mWwkypyuYR2dca896alvS0YH
 V2zFsRaFit27/po3QEbPg/3ryCOsw8KiMnpwBzH468zM08AJmOZm74U/savkF2cutCmZ
 wWV13EjN1KDGAInNvJjjYGI0TKXD69rELO/vTROxP0sEeXyUEP/iJG1xvVhen8+rPK2a
 silGBXrRUQ7tMCgSO0HLVBT6zMuza6x9hiAmjITKBw4bIT6BJH1TiPlanktSpS1QoLWW
 satA==
X-Gm-Message-State: AOAM532MyEJ9n3+X5sO/QeQkokLDdcUuq5NOEjzUYOATYsEPTUXDJ2UI
 TD54QnagX6KOvGAy1Nlqok0VpNs6Kf4aE5rV
X-Google-Smtp-Source: ABdhPJyo1saJykBWBcugWCd9fSt0sIUSOPTzL4VrP0JyyLveR/RMfi+hE/k2HljcYsPVsoensWKyoA==
X-Received: by 2002:a1c:b041:: with SMTP id z62mr712398wme.183.1605036679051; 
 Tue, 10 Nov 2020 11:31:19 -0800 (PST)
Received: from dell.default ([91.110.221.139])
 by smtp.gmail.com with ESMTPSA id 30sm17635335wrs.84.2020.11.10.11.31.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 11:31:18 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 02/30] drm/radeon/evergreen: Remove set but unused variable
 'mc_shared_chmap'
Date: Tue, 10 Nov 2020 19:30:44 +0000
Message-Id: <20201110193112.988999-3-lee.jones@linaro.org>
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
cy9ncHUvZHJtL3JhZGVvbi9ldmVyZ3JlZW4uYzogSW4gZnVuY3Rpb24g4oCYZXZlcmdyZWVuX2dw
dV9pbml04oCZOgogZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9ldmVyZ3JlZW4uYzozMTM1OjY6IHdh
cm5pbmc6IHZhcmlhYmxlIOKAmG1jX3NoYXJlZF9jaG1hcOKAmSBzZXQgYnV0IG5vdCB1c2VkIFst
V3VudXNlZC1idXQtc2V0LXZhcmlhYmxlXQoKQ2M6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRl
dWNoZXJAYW1kLmNvbT4KQ2M6ICJDaHJpc3RpYW4gS8O2bmlnIiA8Y2hyaXN0aWFuLmtvZW5pZ0Bh
bWQuY29tPgpDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgpDYzogRGFuaWVsIFZl
dHRlciA8ZGFuaWVsQGZmd2xsLmNoPgpDYzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
Q2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKU2lnbmVkLW9mZi1ieTogTGVlIEpv
bmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL2V2
ZXJncmVlbi5jIHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vZXZlcmdyZWVu
LmMgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL2V2ZXJncmVlbi5jCmluZGV4IGM5YTlhODc5NTlm
OWUuLmVmYjE5YzQ0NWU0OGYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vZXZl
cmdyZWVuLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9ldmVyZ3JlZW4uYwpAQCAtMzEz
NSw3ICszMTM1LDcgQEAgc3RhdGljIGludCBldmVyZ3JlZW5fY3BfcmVzdW1lKHN0cnVjdCByYWRl
b25fZGV2aWNlICpyZGV2KQogc3RhdGljIHZvaWQgZXZlcmdyZWVuX2dwdV9pbml0KHN0cnVjdCBy
YWRlb25fZGV2aWNlICpyZGV2KQogewogCXUzMiBnYl9hZGRyX2NvbmZpZzsKLQl1MzIgbWNfc2hh
cmVkX2NobWFwLCBtY19hcmJfcmFtY2ZnOworCXUzMiBtY19hcmJfcmFtY2ZnOwogCXUzMiBzeF9k
ZWJ1Z18xOwogCXUzMiBzbXhfZGNfY3RsMDsKIAl1MzIgc3FfY29uZmlnOwpAQCAtMzM5OSw3ICsz
Mzk5LDcgQEAgc3RhdGljIHZvaWQgZXZlcmdyZWVuX2dwdV9pbml0KHN0cnVjdCByYWRlb25fZGV2
aWNlICpyZGV2KQogCiAJZXZlcmdyZWVuX2ZpeF9wY2lfbWF4X3JlYWRfcmVxX3NpemUocmRldik7
CiAKLQltY19zaGFyZWRfY2htYXAgPSBSUkVHMzIoTUNfU0hBUkVEX0NITUFQKTsKKwlSUkVHMzIo
TUNfU0hBUkVEX0NITUFQKTsKIAlpZiAoKHJkZXYtPmZhbWlseSA9PSBDSElQX1BBTE0pIHx8CiAJ
ICAgIChyZGV2LT5mYW1pbHkgPT0gQ0hJUF9TVU1PKSB8fAogCSAgICAocmRldi0+ZmFtaWx5ID09
IENISVBfU1VNTzIpKQotLSAKMi4yNS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWwK
