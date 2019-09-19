Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33771B8BE7
	for <lists+dri-devel@lfdr.de>; Fri, 20 Sep 2019 09:52:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 154AE6F580;
	Fri, 20 Sep 2019 07:51:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66E166F62C
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Sep 2019 13:55:44 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id q5so2370061pfg.13
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Sep 2019 06:55:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YvltAwcazfPUXLVaME+JgA9zHiL2aoA68dvUhBxJ+k0=;
 b=L/iTsxQbjOxvXO739+TDzr8OasDy4+7wc3EUYv40K7wLrKs4K0jAj/IFYe4My8wDu0
 /acp3OA2u7Fq7Y41/K66DB0gtMj72LV3Ok3eAwDbtdzw6ZHirPFgkbBiMApBKsAsOsEO
 scfbgTpgcfuEMornhJ47jlLpE5V+1K7Rl04PLFqjZHDoaMx9XcR3gZ4dhZJVsBZgma7z
 CsilB+4LX7oGf75y98MUfoXEcY8da3VbEQd5miM8+aZTheFdP7aUvjf3QaBItbW/W5ne
 8M2/Bg0duz1jjkZ2YpQUaH8bCaTBa36ZxNo5E4oSCod0++ugoXOI3ae2nUYzxSEcS0Cr
 TV2g==
X-Gm-Message-State: APjAAAW6+bo2E0IHde7tAmhv/XI5/HeLyU7WWXyJgEl7WYT6wv4TbMs1
 p2wsicZzItBnvuuC1gbX2330aA==
X-Google-Smtp-Source: APXvYqxuqnv1/cDU4+3U+mf3SnkxxpRBvj/VkJDXLtzVeqncPGK5Xr2EZWZwOmm3tU9s2WzYUgipeQ==
X-Received: by 2002:a65:4189:: with SMTP id a9mr8987692pgq.399.1568901343986; 
 Thu, 19 Sep 2019 06:55:43 -0700 (PDT)
Received: from localhost ([2401:fa00:1:10:79b4:bd83:e4a5:a720])
 by smtp.gmail.com with ESMTPSA id j16sm7633402pje.6.2019.09.19.06.55.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Sep 2019 06:55:43 -0700 (PDT)
From: Cheng-Yi Chiang <cychiang@chromium.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v7 4/4] ASoC: rockchip_max98090: Add HDMI jack support
Date: Thu, 19 Sep 2019 21:54:50 +0800
Message-Id: <20190919135450.62309-5-cychiang@chromium.org>
X-Mailer: git-send-email 2.23.0.237.gc6a4ce50a0-goog
In-Reply-To: <20190919135450.62309-1-cychiang@chromium.org>
References: <20190919135450.62309-1-cychiang@chromium.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 20 Sep 2019 07:51:40 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YvltAwcazfPUXLVaME+JgA9zHiL2aoA68dvUhBxJ+k0=;
 b=VvascM4pkKU4F95ti9Bl2ciow4VSlKqVRkoSZam4Zy8pNf/KevJdJe7PbSc5A8Vbei
 5rjN7aU8GqL4jAo2r4eOUtchAoARXaF/M/SDOimb4RwY4uw62x+wPKDT3kX7ps/g8kyT
 nKD1WRtYLJOSDO6M0MwbYowZ0jXZKtt1qrzFM=
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
Cc: alsa-devel@alsa-project.org, Neil Armstrong <narmstrong@baylibre.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Liam Girdwood <lgirdwood@gmail.com>, Hans Verkuil <hverkuil@xs4all.nl>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Takashi Iwai <tiwai@suse.com>,
 linux-rockchip@lists.infradead.org, dgreid@chromium.org,
 Cheng-Yi Chiang <cychiang@chromium.org>, tzungbi@chromium.org,
 Jonas Karlman <jonas@kwiboo.se>, Russell King <rmk+kernel@armlinux.org.uk>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 linux-arm-kernel@lists.infradead.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 dianders@chromium.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SW4gbWFjaGluZSBkcml2ZXIsIGNyZWF0ZSBhIGphY2sgYW5kIGxldCBoZG1pLWNvZGVjIHJlcG9y
dCBqYWNrIHN0YXR1cy4KClNpZ25lZC1vZmYtYnk6IENoZW5nLVlpIENoaWFuZyA8Y3ljaGlhbmdA
Y2hyb21pdW0ub3JnPgotLS0KIHNvdW5kL3NvYy9yb2NrY2hpcC9LY29uZmlnICAgICAgICAgICAg
IHwgIDMgKystCiBzb3VuZC9zb2Mvcm9ja2NoaXAvcm9ja2NoaXBfbWF4OTgwOTAuYyB8IDIwICsr
KysrKysrKysrKysrKysrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDIyIGluc2VydGlvbnMoKyksIDEg
ZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9zb3VuZC9zb2Mvcm9ja2NoaXAvS2NvbmZpZyBiL3Nv
dW5kL3NvYy9yb2NrY2hpcC9LY29uZmlnCmluZGV4IGI0MzY1N2U2ZTY1NS4uZDYxMGI1NTNlYTNi
IDEwMDY0NAotLS0gYS9zb3VuZC9zb2Mvcm9ja2NoaXAvS2NvbmZpZworKysgYi9zb3VuZC9zb2Mv
cm9ja2NoaXAvS2NvbmZpZwpAQCAtNDAsOSArNDAsMTAgQEAgY29uZmlnIFNORF9TT0NfUk9DS0NI
SVBfTUFYOTgwOTAKIAlzZWxlY3QgU05EX1NPQ19ST0NLQ0hJUF9JMlMKIAlzZWxlY3QgU05EX1NP
Q19NQVg5ODA5MAogCXNlbGVjdCBTTkRfU09DX1RTM0EyMjdFCisJc2VsZWN0IFNORF9TT0NfSERN
SV9DT0RFQwogCWhlbHAKIAkgIFNheSBZIG9yIE0gaGVyZSBpZiB5b3Ugd2FudCB0byBhZGQgc3Vw
cG9ydCBmb3IgU29DIGF1ZGlvIG9uIFJvY2tjaGlwCi0JICBib2FyZHMgdXNpbmcgdGhlIE1BWDk4
MDkwIGNvZGVjLCBzdWNoIGFzIFZleXJvbi4KKwkgIGJvYXJkcyB1c2luZyB0aGUgTUFYOTgwOTAg
Y29kZWMgYW5kIEhETUkgY29kZWMsIHN1Y2ggYXMgVmV5cm9uLgogCiBjb25maWcgU05EX1NPQ19S
T0NLQ0hJUF9SVDU2NDUKIAl0cmlzdGF0ZSAiQVNvQyBzdXBwb3J0IGZvciBSb2NrY2hpcCBib2Fy
ZHMgdXNpbmcgYSBSVDU2NDUvUlQ1NjUwIGNvZGVjIgpkaWZmIC0tZ2l0IGEvc291bmQvc29jL3Jv
Y2tjaGlwL3JvY2tjaGlwX21heDk4MDkwLmMgYi9zb3VuZC9zb2Mvcm9ja2NoaXAvcm9ja2NoaXBf
bWF4OTgwOTAuYwppbmRleCA2YzIxNzQ5MmJiMzAuLjExY2YyNTJlODM5MSAxMDA2NDQKLS0tIGEv
c291bmQvc29jL3JvY2tjaGlwL3JvY2tjaGlwX21heDk4MDkwLmMKKysrIGIvc291bmQvc29jL3Jv
Y2tjaGlwL3JvY2tjaGlwX21heDk4MDkwLmMKQEAgLTEzNCw2ICsxMzQsMjUgQEAgZW51bSB7CiAJ
REFJTElOS19IRE1JLAogfTsKIAorc3RhdGljIHN0cnVjdCBzbmRfc29jX2phY2sgcmtfaGRtaV9q
YWNrOworCitzdGF0aWMgaW50IHJrX2hkbWlfaW5pdChzdHJ1Y3Qgc25kX3NvY19wY21fcnVudGlt
ZSAqcnVudGltZSkKK3sKKwlzdHJ1Y3Qgc25kX3NvY19jYXJkICpjYXJkID0gcnVudGltZS0+Y2Fy
ZDsKKwlzdHJ1Y3Qgc25kX3NvY19jb21wb25lbnQgKmNvbXBvbmVudCA9IHJ1bnRpbWUtPmNvZGVj
X2RhaS0+Y29tcG9uZW50OworCWludCByZXQ7CisKKwkvKiBlbmFibGUgamFjayBkZXRlY3Rpb24g
Ki8KKwlyZXQgPSBzbmRfc29jX2NhcmRfamFja19uZXcoY2FyZCwgIkhETUkgSmFjayIsIFNORF9K
QUNLX0xJTkVPVVQsCisJCQkJICAgICZya19oZG1pX2phY2ssIE5VTEwsIDApOworCWlmIChyZXQp
IHsKKwkJZGV2X2VycihjYXJkLT5kZXYsICJDYW4ndCBuZXcgSERNSSBKYWNrICVkXG4iLCByZXQp
OworCQlyZXR1cm4gcmV0OworCX0KKworCXJldHVybiBoZG1pX2NvZGVjX3NldF9qYWNrX2RldGVj
dChjb21wb25lbnQsICZya19oZG1pX2phY2spOworfQorCiAvKiBtYXg5ODA5MCBhbmQgSERNSSBj
b2RlYyBkYWlfbGluayAqLwogc3RhdGljIHN0cnVjdCBzbmRfc29jX2RhaV9saW5rIHJrX2RhaWxp
bmtzW10gPSB7CiAJW0RBSUxJTktfTUFYOTgwOTBdID0gewpAQCAtMTUxLDYgKzE3MCw3IEBAIHN0
YXRpYyBzdHJ1Y3Qgc25kX3NvY19kYWlfbGluayBya19kYWlsaW5rc1tdID0gewogCQkub3BzID0g
JnJrX2FpZjFfb3BzLAogCQkuZGFpX2ZtdCA9IFNORF9TT0NfREFJRk1UX0kyUyB8IFNORF9TT0Nf
REFJRk1UX05CX05GIHwKIAkJCVNORF9TT0NfREFJRk1UX0NCU19DRlMsCisJCS5pbml0ID0gcmtf
aGRtaV9pbml0LAogCQlTTkRfU09DX0RBSUxJTktfUkVHKGhkbWkpLAogCX0KIH07Ci0tIAoyLjIz
LjAuMjM3LmdjNmE0Y2U1MGEwLWdvb2cKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
