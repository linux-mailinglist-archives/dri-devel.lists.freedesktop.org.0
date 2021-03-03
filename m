Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 499DB32B820
	for <lists+dri-devel@lfdr.de>; Wed,  3 Mar 2021 14:43:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 744FF6E8E8;
	Wed,  3 Mar 2021 13:43:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D3526E8D9
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Mar 2021 13:43:38 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id j2so10883444wrx.9
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Mar 2021 05:43:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wtdOZUPejXIxG4DafVTSnIWvo2XUWaKv8nLuUC2cuVs=;
 b=UZEv1TixOjptA51Xf0D3ZWP6qBa1BuK4fprFPpRVDcuJ49xPXUPJGp6E+dNYNXVJVb
 +wirSDrdZyG+W4R4vXCa+dP800Du/zenIk68HzB2fuoOISKqgdhiA0Yo9Dw6klTLejAP
 njUqmMMsdKiLqi/ldUnjDL3a/hP1xjda+KEfypBrkeXVvofjvEQ/A/MZ4RtN27PbnryP
 0Fp/Tpi1gfoz7AUMR+Ibx7IharnIQuPfmLONZAFKP0/IGEiKunj9r4odx6NNNPjayLCZ
 JfFU7iUcQlv+uNB5/2b5otcEpP3m/Dd0Eeq1XR9kHdAkIqe8fzQggTMec9s32vZPWYbr
 8Yqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wtdOZUPejXIxG4DafVTSnIWvo2XUWaKv8nLuUC2cuVs=;
 b=WdI7yahOgGIgmvYzSZa7CtNrVCzuzV98im7vFduE86oEVSOfWu+Bkw2Zq0/5HMKgTs
 PeI5BaOCAlCj6bcdQuLcWXbAKnfqS2pFfWJkDovZnwJDus1t0XqhEiVkFK7VhHIfxZ4U
 8havPmfV/qx5rjnAeMq+9TfQMmfQdesncu6BvXpbyTYDdhHKNKupaCWE1pXinj+NcWdv
 mSYmpc/GX/aJ7G1cnqSY/YhSx6Ri13e5dgqse7hH6KlBmotSBJp8h+jHT6WhRIfmw7S1
 //W2MgDHd5fo8Jnl/kpsm7b57v+HOhGIygTvzKAuMBe94hF5N/YnXL0NV+wE7JHQmCJ4
 fTzg==
X-Gm-Message-State: AOAM5338jZZ5yeJmCoGdzcdbEbr2bGlYHphWyS86R6nnsYzV/kPzJCFw
 rV4cE9Z2SiyRO+rfl1btaZhRdQ==
X-Google-Smtp-Source: ABdhPJwcK9+jl2BDg1cjYoyYZxUkL7WUrEez2h4jezFZeCdqRD7CYTxftZHx2OfGFGjkntOswUUmDw==
X-Received: by 2002:a5d:6d0c:: with SMTP id e12mr26589790wrq.136.1614779016850; 
 Wed, 03 Mar 2021 05:43:36 -0800 (PST)
Received: from dell.default ([91.110.221.155])
 by smtp.gmail.com with ESMTPSA id w18sm6109524wrr.7.2021.03.03.05.43.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 05:43:36 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 07/53] drm/amd/display/dc/bios/command_table: Remove unused
 variable and associated comment
Date: Wed,  3 Mar 2021 13:42:33 +0000
Message-Id: <20210303134319.3160762-8-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210303134319.3160762-1-lee.jones@linaro.org>
References: <20210303134319.3160762-1-lee.jones@linaro.org>
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
cy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9kYy9iaW9zL2NvbW1hbmRfdGFibGUuYzog
SW4gZnVuY3Rpb24g4oCYYWRqdXN0X2Rpc3BsYXlfcGxsX3Yy4oCZOgogZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvLi4vZGlzcGxheS9kYy9iaW9zL2NvbW1hbmRfdGFibGUuYzoxNDYyOjExOiB3
YXJuaW5nOiB1bnVzZWQgdmFyaWFibGUg4oCYcGl4ZWxfY2xvY2tfMTBLSHpfaW7igJkgWy1XdW51
c2VkLXZhcmlhYmxlXQoKQ2M6IEhhcnJ5IFdlbnRsYW5kIDxoYXJyeS53ZW50bGFuZEBhbWQuY29t
PgpDYzogTGVvIExpIDxzdW5wZW5nLmxpQGFtZC5jb20+CkNjOiBBbGV4IERldWNoZXIgPGFsZXhh
bmRlci5kZXVjaGVyQGFtZC5jb20+CkNjOiAiQ2hyaXN0aWFuIEvDtm5pZyIgPGNocmlzdGlhbi5r
b2VuaWdAYW1kLmNvbT4KQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KQ2M6IERh
bmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KQ2M6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxp
bmFyby5vcmc+CkNjOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpDYzogZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpTaWduZWQtb2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25l
c0BsaW5hcm8ub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9iaW9zL2Nv
bW1hbmRfdGFibGUuYyB8IDQgLS0tLQogMSBmaWxlIGNoYW5nZWQsIDQgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Jpb3MvY29tbWFuZF90
YWJsZS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Jpb3MvY29tbWFuZF90YWJs
ZS5jCmluZGV4IDlkM2JjM2EwNzM4MjEuLmU4NzljZWIwYzQ5ZWQgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9iaW9zL2NvbW1hbmRfdGFibGUuYworKysgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvYmlvcy9jb21tYW5kX3RhYmxlLmMKQEAgLTE1MTgs
MTAgKzE1MTgsNiBAQCBzdGF0aWMgZW51bSBicF9yZXN1bHQgYWRqdXN0X2Rpc3BsYXlfcGxsX3Yy
KAogewogCWVudW0gYnBfcmVzdWx0IHJlc3VsdCA9IEJQX1JFU1VMVF9GQUlMVVJFOwogCi0JLyog
V2UgbmVlZCB0byBjb252ZXJ0IGZyb20gS0h6IHVuaXRzIGludG8gMTBLSHogdW5pdHMgYW5kIHRo
ZW4gY29udmVydAotCSAqIG91dHB1dCBwaXhlbCBjbG9jayBiYWNrIDEwS0h6LS0+S0h6ICovCi0J
dWludDMyX3QgcGl4ZWxfY2xvY2tfMTBLSHpfaW4gPSBicF9wYXJhbXMtPnBpeGVsX2Nsb2NrIC8g
MTA7Ci0KIAlicC0+Y21kX2hlbHBlci0+ZW5jb2Rlcl9pZF90b19hdG9tKAogCQlkYWxfZ3JhcGhp
Y3Nfb2JqZWN0X2lkX2dldF9lbmNvZGVyX2lkKGJwX3BhcmFtcy0+ZW5jb2Rlcl9vYmplY3RfaWQp
KTsKIAlicC0+Y21kX2hlbHBlci0+ZW5jb2Rlcl9tb2RlX2JwX3RvX2F0b20oYnBfcGFyYW1zLT5z
aWduYWxfdHlwZSwgZmFsc2UpOwotLSAKMi4yNy4wCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWwK
