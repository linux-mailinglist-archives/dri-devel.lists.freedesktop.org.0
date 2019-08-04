Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0451D80C78
	for <lists+dri-devel@lfdr.de>; Sun,  4 Aug 2019 22:17:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F299E89EA6;
	Sun,  4 Aug 2019 20:17:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8793A89EB7
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Aug 2019 20:17:39 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id k18so77399894ljc.11
 for <dri-devel@lists.freedesktop.org>; Sun, 04 Aug 2019 13:17:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=6MTU39yk5XE3/teu/iygu6ssiL/liUAav6Pm3DHBCYk=;
 b=hx7AoNrI5pnFtSdpgSIum74PUmgVn5F6ySU1yx9U2PXsJ/KPlPLG/v0mQLNAPehcpy
 joHYiCC80Th6/TQcNsMrij//zIKpwGm9ah0/jGPAlIJCO8AdyxrNr5l4sPDUddJA+1BC
 G8oU+DWTu1w7iyI4bSdBGfa3hbhpbPn329nyO7sCQUpbJwIsGbxvV5tlNqXLsycm2Nsa
 B04T5o05epAblDa4dcWFOMkgVgL7VNYgBF9HwFUBoL1pcwMt6iMBPCJKXZURa3sMrIIa
 pZwKOboULv3L12q5wiLiVmUrWG5LWIVcf4QX7s0roQm+yZ2WYn04OD9qsU2aV8gB5Kae
 a3KQ==
X-Gm-Message-State: APjAAAVeFXOJ5Ji6y0xdR5fnAp8/e2Vj5GZMLVouVHLrgd4mLb/TgYbx
 0vUJbe+MJb7l8jWmcDdOB5sStb3wiscjyQ==
X-Google-Smtp-Source: APXvYqx8atks2YbWr9RifkxwlrpCrnQ0MuWxB3GhHudkPh8VHtkqm1B+XsEC8X6Ec2DIcd1SBSKPlQ==
X-Received: by 2002:a2e:9a58:: with SMTP id k24mr76690634ljj.165.1564949857549; 
 Sun, 04 Aug 2019 13:17:37 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 p87sm16540794ljp.50.2019.08.04.13.17.35
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 04 Aug 2019 13:17:37 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v1 13/16] drm/panel: drop return code from drm_panel_detach()
Date: Sun,  4 Aug 2019 22:16:34 +0200
Message-Id: <20190804201637.1240-14-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190804201637.1240-1-sam@ravnborg.org>
References: <20190804201637.1240-1-sam@ravnborg.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6MTU39yk5XE3/teu/iygu6ssiL/liUAav6Pm3DHBCYk=;
 b=ZA+/n3H1+MtW9kTQsOeyUTYBdS4nVqs91zmpewRJFA3g7GvGQHLzWjAjOA2KjxXx06
 We5wixz1fYGGRfl4QVFNMFUlpsCTWlYYKqEvsenMNEn+umCLTk9CVcDwep5AWL3nMklw
 BE0U06HBU0suEpm4nBPoJDfJhOJ3w9QwKz6jigew0xkksRe9L00eDSnEM71EoDfCTUPg
 7nrulAhNbAbTHY+edA4Z3Svw2nUDmxkVdABuSiEuGp6HMhZXFqmRCr1nFitHbmU1UlYG
 Zy65eNXTqN6bZkutzJV1YvC+78T9mG4fIKkroPYupOV3oH41jdymZWNkxjqAGh2S3boz
 c+IQ==
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Marek Vasut <marex@denx.de>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Kukjin Kim <kgene@kernel.org>,
 Allison Randal <allison@lohutok.net>, NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Jonas Karlman <jonas@kwiboo.se>, Alison Wang <alison.wang@nxp.com>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 Alexios Zavras <alexios.zavras@intel.com>, linux-samsung-soc@vger.kernel.org,
 linux-tegra@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
 Jernej Skrabec <jernej.skrabec@siol.net>, Shawn Guo <shawnguo@kernel.org>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Vincent Abriou <vincent.abriou@st.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, Enrico Weigelt <info@metux.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlcmUgYXJlIG5vIGVycm9ycyB0aGF0IGNhbiBiZSByZXBvcnRlZCBieSB0aGlzIGZ1bmN0aW9u
LApzbyBkcm9wIHRoZSByZXR1cm4gY29kZS4KRml4IHRoZSBvbmx5IGJyaWRnZSBkcml2ZXIgdGhh
dCBjaGVja2VkIHRoZSByZXR1cm4gcmVzdWx0LgoKU2lnbmVkLW9mZi1ieTogU2FtIFJhdm5ib3Jn
IDxzYW1AcmF2bmJvcmcub3JnPgpDYzogVGhpZXJyeSBSZWRpbmcgPHRoaWVycnkucmVkaW5nQGdt
YWlsLmNvbT4KQ2M6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KQ2M6IE1hYXJ0ZW4g
TGFua2hvcnN0IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+CkNjOiBNYXhpbWUg
UmlwYXJkIDxtYXhpbWUucmlwYXJkQGJvb3RsaW4uY29tPgpDYzogU2VhbiBQYXVsIDxzZWFuQHBv
b3JseS5ydW4+CkNjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+CkNjOiBEYW5pZWwg
VmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+CkNjOiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBp
bmNoYXJ0K3JlbmVzYXNAaWRlYXNvbmJvYXJkLmNvbT4KQ2M6IEFuZHJ6ZWogSGFqZGEgPGEuaGFq
ZGFAc2Ftc3VuZy5jb20+CkNjOiBHd2FuLWd5ZW9uZyBNdW4gPGd3YW4tZ3llb25nLm11bkBpbnRl
bC5jb20+CkNjOiBUaG9tYXMgR2xlaXhuZXIgPHRnbHhAbGludXRyb25peC5kZT4KQ2M6IExpbnVz
IFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0v
YnJpZGdlL2FuYWxvZ2l4L2FuYWxvZ2l4X2RwX2NvcmUuYyB8IDMgKy0tCiBkcml2ZXJzL2dwdS9k
cm0vZHJtX3BhbmVsLmMgICAgICAgICAgICAgICAgICAgICAgICB8IDYgKy0tLS0tCiBpbmNsdWRl
L2RybS9kcm1fcGFuZWwuaCAgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDIgKy0KIDMgZmls
ZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYW5hbG9naXgvYW5hbG9naXhfZHBfY29yZS5jIGIvZHJp
dmVycy9ncHUvZHJtL2JyaWRnZS9hbmFsb2dpeC9hbmFsb2dpeF9kcF9jb3JlLmMKaW5kZXggZjJm
N2Y2OWQ2Y2MzLi4yMjg4NWRjZWFhMTcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlk
Z2UvYW5hbG9naXgvYW5hbG9naXhfZHBfY29yZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlk
Z2UvYW5hbG9naXgvYW5hbG9naXhfZHBfY29yZS5jCkBAIC0xNzgwLDggKzE3ODAsNyBAQCB2b2lk
IGFuYWxvZ2l4X2RwX3VuYmluZChzdHJ1Y3QgYW5hbG9naXhfZHBfZGV2aWNlICpkcCkKIAlpZiAo
ZHAtPnBsYXRfZGF0YS0+cGFuZWwpIHsKIAkJaWYgKGRybV9wYW5lbF91bnByZXBhcmUoZHAtPnBs
YXRfZGF0YS0+cGFuZWwpKQogCQkJRFJNX0VSUk9SKCJmYWlsZWQgdG8gdHVybm9mZiB0aGUgcGFu
ZWxcbiIpOwotCQlpZiAoZHJtX3BhbmVsX2RldGFjaChkcC0+cGxhdF9kYXRhLT5wYW5lbCkpCi0J
CQlEUk1fRVJST1IoImZhaWxlZCB0byBkZXRhY2ggdGhlIHBhbmVsXG4iKTsKKwkJZHJtX3BhbmVs
X2RldGFjaChkcC0+cGxhdF9kYXRhLT5wYW5lbCk7CiAJfQogCiAJZHJtX2RwX2F1eF91bnJlZ2lz
dGVyKCZkcC0+YXV4KTsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fcGFuZWwuYyBi
L2RyaXZlcnMvZ3B1L2RybS9kcm1fcGFuZWwuYwppbmRleCA5OTQ2YjhkOWJhY2MuLmRhMTlkNWI0
YTJmNCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9wYW5lbC5jCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS9kcm1fcGFuZWwuYwpAQCAtMjE5LDE1ICsyMTksMTEgQEAgRVhQT1JUX1NZTUJP
TChkcm1fcGFuZWxfYXR0YWNoKTsKICAqCiAgKiBUaGlzIGZ1bmN0aW9uIHNob3VsZCBub3QgYmUg
Y2FsbGVkIGJ5IHRoZSBwYW5lbCBkZXZpY2UgaXRzZWxmLiBJdAogICogaXMgb25seSBmb3IgdGhl
IGRybSBkZXZpY2UgdGhhdCBjYWxsZWQgZHJtX3BhbmVsX2F0dGFjaCgpLgotICoKLSAqIFJldHVy
bjogMCBvbiBzdWNjZXNzIG9yIGEgbmVnYXRpdmUgZXJyb3IgY29kZSBvbiBmYWlsdXJlLgogICov
Ci1pbnQgZHJtX3BhbmVsX2RldGFjaChzdHJ1Y3QgZHJtX3BhbmVsICpwYW5lbCkKK3ZvaWQgZHJt
X3BhbmVsX2RldGFjaChzdHJ1Y3QgZHJtX3BhbmVsICpwYW5lbCkKIHsKIAlwYW5lbC0+Y29ubmVj
dG9yID0gTlVMTDsKIAlwYW5lbC0+ZHJtID0gTlVMTDsKLQotCXJldHVybiAwOwogfQogRVhQT1JU
X1NZTUJPTChkcm1fcGFuZWxfZGV0YWNoKTsKIApkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vZHJt
X3BhbmVsLmggYi9pbmNsdWRlL2RybS9kcm1fcGFuZWwuaAppbmRleCA1ZTYyZGVlYTQ5YmEuLjYy
NGJkMTVlY2ZhYiAxMDA2NDQKLS0tIGEvaW5jbHVkZS9kcm0vZHJtX3BhbmVsLmgKKysrIGIvaW5j
bHVkZS9kcm0vZHJtX3BhbmVsLmgKQEAgLTE1Myw3ICsxNTMsNyBAQCBpbnQgZHJtX3BhbmVsX2Fk
ZChzdHJ1Y3QgZHJtX3BhbmVsICpwYW5lbCk7CiB2b2lkIGRybV9wYW5lbF9yZW1vdmUoc3RydWN0
IGRybV9wYW5lbCAqcGFuZWwpOwogCiBpbnQgZHJtX3BhbmVsX2F0dGFjaChzdHJ1Y3QgZHJtX3Bh
bmVsICpwYW5lbCwgc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3Rvcik7Ci1pbnQgZHJtX3Bh
bmVsX2RldGFjaChzdHJ1Y3QgZHJtX3BhbmVsICpwYW5lbCk7Cit2b2lkIGRybV9wYW5lbF9kZXRh
Y2goc3RydWN0IGRybV9wYW5lbCAqcGFuZWwpOwogCiBpbnQgZHJtX3BhbmVsX3ByZXBhcmUoc3Ry
dWN0IGRybV9wYW5lbCAqcGFuZWwpOwogaW50IGRybV9wYW5lbF91bnByZXBhcmUoc3RydWN0IGRy
bV9wYW5lbCAqcGFuZWwpOwotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
