Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E409C5AB32
	for <lists+dri-devel@lfdr.de>; Sat, 29 Jun 2019 15:02:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 273CB6E9A3;
	Sat, 29 Jun 2019 13:02:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6CE56E9A6
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Jun 2019 13:02:00 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id q26so5787691lfc.3
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Jun 2019 06:02:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ji8jAojLPl8vD+gcsy1dZ2LAcjvPmFSVJ5glNsjtSak=;
 b=FfXI1LIAYlPAhRzSZHJzCWcoUsPy0H/qV6g1742Snqg66PHRY41lwBaEw3yCpJxdWe
 prdzdP38IJMHr+If6llDXi+gBvRXMKbdlgbhD2HWihtMDNTf5tatLeDVNNDDCi1D0DCD
 rJBtAylYN8uAbmHFfXlmartEMF1zkj8wZsg+TgPGhGLRquc/qBN1N/PLPaIBbz4GO+vI
 4CD4tLGlKmO/VV93HukrUcV2k3rwT/I1Uta3UFRGDzIMFk1vTMCzCXJUmTrBO6a/0whr
 bhWHrkdtP98Wvp+eAU0y7OdnJh8R2GwsJ7hj5H53jjqUFhQDcjAB56gs1KWf8sH13FzY
 /g7Q==
X-Gm-Message-State: APjAAAUwTfrVr+Tehlkvi7IGdLcaU78gqCM5xwV/QDj+nXfiONOm47uo
 uWba306A105pxBshZnjMwm3gWNbt4g6B6A==
X-Google-Smtp-Source: APXvYqw4JVg2KbWLoxvVW9U6jPqYrcYh2H4AXq4ph9NDkiYzD2Bg7mSbg0zvS+exFIzcUH3D8CLeKg==
X-Received: by 2002:a19:f601:: with SMTP id x1mr7523920lfe.182.1561813318996; 
 Sat, 29 Jun 2019 06:01:58 -0700 (PDT)
Received: from localhost.localdomain
 (c-22cd225c.014-348-6c756e10.bbcust.telenor.se. [92.34.205.34])
 by smtp.gmail.com with ESMTPSA id v2sm1354500lfi.52.2019.06.29.06.01.57
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sat, 29 Jun 2019 06:01:57 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>
Subject: [PATCH 3/7] drm/msm/dpu: Drop unused GPIO code
Date: Sat, 29 Jun 2019 14:59:29 +0200
Message-Id: <20190629125933.679-3-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190629125933.679-1-linus.walleij@linaro.org>
References: <20190629125933.679-1-linus.walleij@linaro.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ji8jAojLPl8vD+gcsy1dZ2LAcjvPmFSVJ5glNsjtSak=;
 b=nAjmGaNaoXOfVZnFCs0LUWx0cgkIpWqrZKexDYARBy6576kyG3UYP+U3tLv6Z7mbun
 3mza7Rr4HNinHrz/Z+ZS8QeQeD2ig1Wuy5eIgVPImRlRcCxR6UE3d6lvjrMrektszXS+
 0CG3ahmSPlVFxu3mFx0uVQqdq4jNPLcFg8BC+yVu43Um7D3UMfNOpakEUcEVn6MuC8Ry
 X4Gx9ihORnId7aLMGMVG+MYoXUZ7qMgU1CSiYsMEXSOfdUiBe/5UWIg8MwtVDMvToc9k
 2kG/2Li5Bv+dVCPKpJYsQ5s5V65k/L9JNU0oyZMgdR84ds/6gyw5txkGZP6EpXJbSn72
 8DlA==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIERQVSBoYXMgc29tZSBraW5kIG9mIGlkZWEgdGhhdCBpdCB3YW50cyB0byBiZSBhYmxlIHRv
CmJyaW5nIHVwIHBvd2VyIHVzaW5nIEdQSU8gbGluZXMuIFRoZSBzdHJ1Y3QgZHNzX2dwaW8gaXMg
aG93ZXZlcgpjb21wbGV0ZWx5IHVudXNlZCBhbmQgc2hvdWxkIHRoaXMgYmUgZG9uZSwgaXQgc2hv
dWxkIGJlIGRvbmUKdXNpbmcgdGhlIEdQSU8gZGVzY3JpcHRvciBmcmFtZXdvcmsgcmF0aGVyIHRo
YW4gdGhpcyBBUEkKd2hpY2ggcmVsaWVzIG9uIHRoZSBnbG9iYWwgR1BJTyBudW1iZXJzcGFjZS4g
RGVsZXRlIHRoaXMKY29kZSBiZWZvcmUgYW55b25lIGh1cnQgdGhlbXNlbHZlcy4KClRoZSBpbmNs
dXNpb24gb2YgPGxpbnV4L2dwaW8uaD4gd2FzIGFidXNlZCB0byBnZXQgc29tZSBPRgphbmQgSVJR
IGhlYWRlcnMgaW1wbGljaXRseSBpbmNsdWRlZCBpbnRvIHRoZSBEUFUgdXRpbGl0aWVzLAptYWtl
IHRoZXNlIGluY2x1ZGVzIGV4cGxpY2l0IGFuZCBwdXNoIHRoZW0gZG93biBpbnRvIHRoZSBhY3R1
YWwKaW1wbGVtZW50YXRpb24uCgpDYzogUm9iIENsYXJrIDxyb2JkY2xhcmtAZ21haWwuY29tPgpD
YzogU2VhbiBQYXVsIDxzZWFuQHBvb3JseS5ydW4+CkNjOiBsaW51eC1hcm0tbXNtQHZnZXIua2Vy
bmVsLm9yZwpDYzogZnJlZWRyZW5vQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpTaWduZWQtb2ZmLWJ5
OiBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxsZWlqQGxpbmFyby5vcmc+Ci0tLQogZHJpdmVycy9n
cHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2lvX3V0aWwuYyB8IDEgKwogZHJpdmVycy9ncHUvZHJt
L21zbS9kaXNwL2RwdTEvZHB1X2lvX3V0aWwuaCB8IDkgLS0tLS0tLS0tCiBkcml2ZXJzL2dwdS9k
cm0vbXNtL2Rpc3AvZHB1MS9kcHVfbWRzcy5jICAgIHwgNCArKysrCiAzIGZpbGVzIGNoYW5nZWQs
IDUgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfaW9fdXRpbC5jIGIvZHJpdmVycy9ncHUvZHJtL21zbS9k
aXNwL2RwdTEvZHB1X2lvX3V0aWwuYwppbmRleCA3ODgzM2MyYzI3ZjguLjc4ZjA0MTQ3ODM5ZiAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2lvX3V0aWwuYwor
KysgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfaW9fdXRpbC5jCkBAIC0xNSw2
ICsxNSw3IEBACiAjaW5jbHVkZSA8bGludXgvY2xrL2Nsay1jb25mLmg+CiAjaW5jbHVkZSA8bGlu
dXgvZXJyLmg+CiAjaW5jbHVkZSA8bGludXgvZGVsYXkuaD4KKyNpbmNsdWRlIDxsaW51eC9vZi5o
PgogCiAjaW5jbHVkZSA8ZHJtL2RybV9wcmludC5oPgogCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfaW9fdXRpbC5oIGIvZHJpdmVycy9ncHUvZHJtL21zbS9k
aXNwL2RwdTEvZHB1X2lvX3V0aWwuaAppbmRleCBiYzA3MzgxZDc0MjkuLmEwNDk4YzdiZDY3NyAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2lvX3V0aWwuaAor
KysgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfaW9fdXRpbC5oCkBAIC0xMyw3
ICsxMyw2IEBACiAjaWZuZGVmIF9fRFBVX0lPX1VUSUxfSF9fCiAjZGVmaW5lIF9fRFBVX0lPX1VU
SUxfSF9fCiAKLSNpbmNsdWRlIDxsaW51eC9ncGlvLmg+CiAjaW5jbHVkZSA8bGludXgvcGxhdGZv
cm1fZGV2aWNlLmg+CiAjaW5jbHVkZSA8bGludXgvdHlwZXMuaD4KIApAQCAtMjIsMTIgKzIxLDYg
QEAKICNkZWZpbmUgREVWX1dBUk4oZm10LCBhcmdzLi4uKSAgcHJfd2FybihmbXQsICMjYXJncykK
ICNkZWZpbmUgREVWX0VSUihmbXQsIGFyZ3MuLi4pICAgcHJfZXJyKGZtdCwgIyNhcmdzKQogCi1z
dHJ1Y3QgZHNzX2dwaW8gewotCXVuc2lnbmVkIGludCBncGlvOwotCXVuc2lnbmVkIGludCB2YWx1
ZTsKLQljaGFyIGdwaW9fbmFtZVszMl07Ci19OwotCiBlbnVtIGRzc19jbGtfdHlwZSB7CiAJRFNT
X0NMS19BSEIsIC8qIG5vIHNldCByYXRlLiByYXRlIGNvbnRyb2xsZWQgdGhyb3VnaCBycG0gKi8K
IAlEU1NfQ0xLX1BDTEssCkBAIC00Miw4ICszNSw2IEBAIHN0cnVjdCBkc3NfY2xrIHsKIH07CiAK
IHN0cnVjdCBkc3NfbW9kdWxlX3Bvd2VyIHsKLQl1bnNpZ25lZCBpbnQgbnVtX2dwaW87Ci0Jc3Ry
dWN0IGRzc19ncGlvICpncGlvX2NvbmZpZzsKIAl1bnNpZ25lZCBpbnQgbnVtX2NsazsKIAlzdHJ1
Y3QgZHNzX2NsayAqY2xrX2NvbmZpZzsKIH07CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
bXNtL2Rpc3AvZHB1MS9kcHVfbWRzcy5jIGIvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEv
ZHB1X21kc3MuYwppbmRleCA3MzE2YjRhYjFiODUuLjliYWFiYWRjNjJiYiAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X21kc3MuYworKysgYi9kcml2ZXJzL2dw
dS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfbWRzcy5jCkBAIC0zLDYgKzMsMTAgQEAKICAqIENvcHly
aWdodCAoYykgMjAxOCwgVGhlIExpbnV4IEZvdW5kYXRpb24KICAqLwogCisjaW5jbHVkZSA8bGlu
dXgvaXJxLmg+CisjaW5jbHVkZSA8bGludXgvaXJxY2hpcC5oPgorI2luY2x1ZGUgPGxpbnV4L2ly
cWRlc2MuaD4KKyNpbmNsdWRlIDxsaW51eC9pcnFjaGlwL2NoYWluZWRfaXJxLmg+CiAjaW5jbHVk
ZSAiZHB1X2ttcy5oIgogCiAjZGVmaW5lIHRvX2RwdV9tZHNzKHgpIGNvbnRhaW5lcl9vZih4LCBz
dHJ1Y3QgZHB1X21kc3MsIGJhc2UpCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
