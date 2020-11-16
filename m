Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37CE42B4D40
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 18:38:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CAA56E07F;
	Mon, 16 Nov 2020 17:37:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 085F86E04A
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 17:37:42 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id d142so19141wmd.4
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 09:37:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eP0WyWZg5ruAlRDHyNqDbB7ackT3+aNOib1WfADr30A=;
 b=wN846j+j1t9h9fPa28Onu7GZYXmQoYRLOxLBMdsgxmd2qjwO/2SHbYJ4aaZPTOwNwI
 Ie150qvycEdxzYdE6ALo/tJp0eHb8s/iM39uIWYiZQDcB4VODCCA6qx2PL3x1IxOyEzm
 pL94h3zfHi2M8NAko8DKtXEINUpu2UL/DlQGS7Zk5gfFe80wLQ5orA+eTl3yaAh0r6VC
 KFIJU5Qe6Hc25f0CT+oHuz4AYsncg/BtVJ0gYQz16eTW0QE8347rmKKa7A+A6aAKLWLK
 g+FRI4hv2PhqAzly5Q9dVAuFaGxdjBHlsW1nFIlcbHXoOuBALWhGlG+j2fgjcbRPY70Y
 evIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eP0WyWZg5ruAlRDHyNqDbB7ackT3+aNOib1WfADr30A=;
 b=RhFcgBlGdLkq11MIlLyPgP+A2IoLrkO2CkeBIyaT1kpIVu1BoBxuSaykz3Uoz5I5fB
 /TWDB77J/I1ufUSpkSKGjMNOEXy5yVBoLhd2qgyyaOIbz9/ERJYEYIzXuNWDY1HTp70s
 ENPCFmvaQj/9yfXINAfb95487HP1gMEQIaf7bpQmL4hQzR/H85fyBdug2kIuVp0K1UdO
 AR3QY7V77r7huGK/RXUUg2sa3k04x6/ayKJaWqIOjCk/zFqy53Cp6iLUpRHC8YdJKY8j
 n2zL0fPD3mgR23LVEEY8rbLLMamkDka2iKNN28PcB5PPdqHi6p4/vnlGsJqvPy1b549E
 Cgcw==
X-Gm-Message-State: AOAM533m20Vyp4zvWHFceHJpOToh/f1tm7KHxdG8/vED9QNloj1LKfsx
 fex1sHMcbrrnrj6cPXpsK9Sjzg==
X-Google-Smtp-Source: ABdhPJxnW5vVWKO5IKiS8AJDMKtmOdtkHQWn7yrRtegS0lejzK4gfrcvcn+KCja9gLQX70R+jn+t2w==
X-Received: by 2002:a1c:c90b:: with SMTP id f11mr24711wmb.54.1605548260732;
 Mon, 16 Nov 2020 09:37:40 -0800 (PST)
Received: from dell.default ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id 30sm16942828wrd.88.2020.11.16.09.37.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 09:37:40 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 26/43] drm/radeon/radeon_atombios: Move
 'radeon_add_atom_encoder()'s prototype to shared header
Date: Mon, 16 Nov 2020 17:36:43 +0000
Message-Id: <20201116173700.1830487-27-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201116173700.1830487-1-lee.jones@linaro.org>
References: <20201116173700.1830487-1-lee.jones@linaro.org>
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
