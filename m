Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A1482B4DC2
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 18:42:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E21F6EA08;
	Mon, 16 Nov 2020 17:42:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B30B6EA07
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 17:41:56 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id d12so19622248wrr.13
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 09:41:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CEyFJOSSbdvLfYxo1nswzgxPyZwwh2XfGKJvNAOyE+k=;
 b=gjEJWyJwzFrX7dC3f76aducJiYprGZ51SMUFwBK0DQrAv2ywbkD8FzspryEi7eqbmU
 NXN1+uLfqPrmytc1nA4abMsKa57dKeJvezW7Rwn+7yCHAylw/EoLcg9k6NvPlYerc67F
 QHekoEKTHsinLMc3sfH0j8TI3MZbJXOfA58QULxB4oq1DmI1kEj8W8/yjoiry5RfRYjb
 hwxFEINkJg6rRbF27qnkxPUEz2B1K+Gwpmg8fZp/SXQRDZKiHYeHpXXTyxGIKh40CdHu
 Wp26Nhmd141+vPVeDCootPazEl9rUNZH5qUXvPTcRM89akPJGhDuAYOv8WSU2mHvgXfy
 4dkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CEyFJOSSbdvLfYxo1nswzgxPyZwwh2XfGKJvNAOyE+k=;
 b=RkTESOYsevcvQ5RLc8XqN3CYD50o66h8P2Fe8vTvw8fefWtJKHy+GqlOYypVUegcgI
 l7+Xh5+hSPi2UuXxd3DZb88NeJ6tjii48OpBfpqscN+y3XfRtMg+Mu8eaNG/a6Z9L9Vc
 5qLGZHDNNbGspKD9uaTaOYr62X15Wzd3XqOpfQ+qsXNr3iufGgNUCMtTSTAspMj6GUdw
 9YoddAnRx9pbOU/rUlHhV9smAvFGlzByUI2/DgytY3xpPc5VqWT65BC0Lm5/1jyFPRdj
 RDPmTfSs97i150bQLlqOP6RsRVA+zLx4cvFyol3D9An94z1Z6PLKo/2zWM2wk2WvMsWx
 gq6Q==
X-Gm-Message-State: AOAM533tcUr06ahpcThxtDo93nYNbatlgSQ4Vz2tGwEdqhoEVA2km4qC
 GX2dw4wWolz+HGe7js/2P/LzUxQRmMZRAjJB
X-Google-Smtp-Source: ABdhPJzEz6hKtbXBg6S6mlCSEzioxtEnXfOHuGEg87lALXMzEVHRmwq7gEtk9990PpeLgnNOh0pLRQ==
X-Received: by 2002:adf:cf0b:: with SMTP id o11mr20117453wrj.162.1605548514868; 
 Mon, 16 Nov 2020 09:41:54 -0800 (PST)
Received: from dell.default ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id n10sm24667224wrx.9.2020.11.16.09.41.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 09:41:54 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 24/42] drm/rockchip/dw-mipi-dsi-rockchip: Demote
 non-conformant kernel-doc headers
Date: Mon, 16 Nov 2020 17:40:54 +0000
Message-Id: <20201116174112.1833368-25-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201116174112.1833368-1-lee.jones@linaro.org>
References: <20201116174112.1833368-1-lee.jones@linaro.org>
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
