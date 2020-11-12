Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 988A32B0D38
	for <lists+dri-devel@lfdr.de>; Thu, 12 Nov 2020 20:01:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B50BC6E334;
	Thu, 12 Nov 2020 19:01:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2968F6E334
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Nov 2020 19:01:41 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id d142so6187977wmd.4
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Nov 2020 11:01:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CEyFJOSSbdvLfYxo1nswzgxPyZwwh2XfGKJvNAOyE+k=;
 b=luGD853vRdhiDvEzMuqlML/DI46z1HchP7kIYP7123hCXjIDgT+HMOCnSJrjwbOs5T
 dyI9rFHG0jjrNjVTuoAMKToPrIkva/LkzsMRcVNzK9cBSG2xBrrMOPXjo/YLDV+uHCjF
 H7vK6vwlbKYitJyuncaAeAWzP2EWg44x3fmsTEpg53cocdLYVkxg3dTjJzwp9W717Bbf
 m9syiXJiuReemJUapLpUUPWPavpT6L8UOkIrtVnpFmG1FGBdZvF3DcldZyWeqB3hxnnK
 eNzI7U1bN53rVphSw0qjmtxO0V1pGzv6KhP75YnlQNU7GvWZJiHb0QSUJwnj1C6EckMd
 hDEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CEyFJOSSbdvLfYxo1nswzgxPyZwwh2XfGKJvNAOyE+k=;
 b=s1TIVOH5WvxGuoktEHq6O94CusDMyImxNAUebH6RZqJaEXLpGG0s0q5e02IchrYTpS
 AEKdrk4PH6uIh20+FKuChFcwCpSMBJCvD2Qd70jBexndnuLXC/bUEZ60MmMIrR37DjZ9
 FPZCoB3n5Se+4OynHRfRuUumO4444EikjTxO374EeD2GVmWkCthfVixNtp4hywSVTrwQ
 dYZJFHm7dMsmY3S8e0R1JnawVdSHqZNMGNVU7/SfXRE2ZLba52JHxNmBOPJ8urSGtrNj
 v4Bgo4Y90a6uwBNJJDmf3rp1QisukPickiYY36fxzZ0n0P30op1xo16jvp2Koxcdd4y5
 eJUQ==
X-Gm-Message-State: AOAM530CAKist0iRYlHACxAzGgJIuxse6XCuouoRxwfiWtSCcft2jqbX
 b1DdiDxfqeYvJlV1Vo9IKLHu2w==
X-Google-Smtp-Source: ABdhPJzJ0+Yyv/37xYPSl7RKQhEM9Vy9lp/Wn8yEAkQh4vhITJTf2t4B9xuaXBBI/2x2qd6o8Gl7Dg==
X-Received: by 2002:a1c:1d82:: with SMTP id d124mr1156353wmd.12.1605207699167; 
 Thu, 12 Nov 2020 11:01:39 -0800 (PST)
Received: from dell.default ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id p4sm8105214wrm.51.2020.11.12.11.01.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Nov 2020 11:01:38 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 22/30] drm/rockchip/dw-mipi-dsi-rockchip: Demote
 non-conformant kernel-doc headers
Date: Thu, 12 Nov 2020 19:00:31 +0000
Message-Id: <20201112190039.2785914-23-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201112190039.2785914-1-lee.jones@linaro.org>
References: <20201112190039.2785914-1-lee.jones@linaro.org>
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
 dri-devel@lists.freedesktop.org, Sandy Huang <hjc@rock-chips.com>,
 linux-rockchip@lists.infradead.org, Nickey Yang <nickey.yang@rock-chips.com>,
 Chris Zhong <zyw@rock-chips.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL3JvY2tjaGlwL2R3LW1pcGktZHNpLXJvY2tjaGlwLmM6MzU3OiB3YXJuaW5nOiBG
dW5jdGlvbiBwYXJhbWV0ZXIgb3IgbWVtYmVyICdkc2knIG5vdCBkZXNjcmliZWQgaW4gJ25zMmJj
JwogZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL2R3LW1pcGktZHNpLXJvY2tjaGlwLmM6MzU3OiB3
YXJuaW5nOiBGdW5jdGlvbiBwYXJhbWV0ZXIgb3IgbWVtYmVyICducycgbm90IGRlc2NyaWJlZCBp
biAnbnMyYmMnCiBkcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvZHctbWlwaS1kc2ktcm9ja2NoaXAu
YzozNjU6IHdhcm5pbmc6IEZ1bmN0aW9uIHBhcmFtZXRlciBvciBtZW1iZXIgJ2RzaScgbm90IGRl
c2NyaWJlZCBpbiAnbnMydWknCiBkcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvZHctbWlwaS1kc2kt
cm9ja2NoaXAuYzozNjU6IHdhcm5pbmc6IEZ1bmN0aW9uIHBhcmFtZXRlciBvciBtZW1iZXIgJ25z
JyBub3QgZGVzY3JpYmVkIGluICduczJ1aScKCkNjOiBTYW5keSBIdWFuZyA8aGpjQHJvY2stY2hp
cHMuY29tPgpDYzogIkhlaWtvIFN0w7xibmVyIiA8aGVpa29Ac250ZWNoLmRlPgpDYzogRGF2aWQg
QWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xs
LmNoPgpDYzogQ2hyaXMgWmhvbmcgPHp5d0Byb2NrLWNoaXBzLmNvbT4KQ2M6IE5pY2tleSBZYW5n
IDxuaWNrZXkueWFuZ0Byb2NrLWNoaXBzLmNvbT4KQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKQ2M6IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwpDYzogbGlu
dXgtcm9ja2NoaXBAbGlzdHMuaW5mcmFkZWFkLm9yZwpTaWduZWQtb2ZmLWJ5OiBMZWUgSm9uZXMg
PGxlZS5qb25lc0BsaW5hcm8ub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9kdy1t
aXBpLWRzaS1yb2NrY2hpcC5jIHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25z
KCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hp
cC9kdy1taXBpLWRzaS1yb2NrY2hpcC5jIGIvZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL2R3LW1p
cGktZHNpLXJvY2tjaGlwLmMKaW5kZXggNTQyZGNmN2VkZGQ2Ni4uZTg0MzI1ZTU2ZDk4MCAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL2R3LW1pcGktZHNpLXJvY2tjaGlwLmMK
KysrIGIvZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL2R3LW1pcGktZHNpLXJvY2tjaGlwLmMKQEAg
LTM1MCw3ICszNTAsNyBAQCBzdGF0aWMgdm9pZCBkd19taXBpX2RzaV9waHlfd3JpdGUoc3RydWN0
IGR3X21pcGlfZHNpX3JvY2tjaGlwICpkc2ksCiAJZHNpX3dyaXRlKGRzaSwgRFNJX1BIWV9UU1Rf
Q1RSTDAsIFBIWV9URVNUQ0xLIHwgUEhZX1VOVEVTVENMUik7CiB9CiAKLS8qKgorLyoKICAqIG5z
MmJjIC0gTmFub3NlY29uZHMgdG8gYnl0ZSBjbG9jayBjeWNsZXMKICAqLwogc3RhdGljIGlubGlu
ZSB1bnNpZ25lZCBpbnQgbnMyYmMoc3RydWN0IGR3X21pcGlfZHNpX3JvY2tjaGlwICpkc2ksIGlu
dCBucykKQEAgLTM1OCw3ICszNTgsNyBAQCBzdGF0aWMgaW5saW5lIHVuc2lnbmVkIGludCBuczJi
YyhzdHJ1Y3QgZHdfbWlwaV9kc2lfcm9ja2NoaXAgKmRzaSwgaW50IG5zKQogCXJldHVybiBESVZf
Uk9VTkRfVVAobnMgKiBkc2ktPmxhbmVfbWJwcyAvIDgsIDEwMDApOwogfQogCi0vKioKKy8qCiAg
KiBuczJ1aSAtIE5hbm9zZWNvbmRzIHRvIFVJIHRpbWUgcGVyaW9kcwogICovCiBzdGF0aWMgaW5s
aW5lIHVuc2lnbmVkIGludCBuczJ1aShzdHJ1Y3QgZHdfbWlwaV9kc2lfcm9ja2NoaXAgKmRzaSwg
aW50IG5zKQotLSAKMi4yNS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWwK
