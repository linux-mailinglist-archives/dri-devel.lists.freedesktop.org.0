Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A201B743C
	for <lists+dri-devel@lfdr.de>; Thu, 19 Sep 2019 09:36:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBAB96FA48;
	Thu, 19 Sep 2019 07:36:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEB2B6EE4B
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Sep 2019 08:25:51 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id x10so3580282pgi.5
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Sep 2019 01:25:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=58QuMxmjHlqsWVtyFBQnvBpwo6+B1q1GdfYt1s4m2qE=;
 b=Er3wFRsTPxccJ/llnqcnLco+WB/bE5A+Ywh7AesOT9zGfBr2duR5W+u+ShHTw6HUp6
 E/e1jVfm6jVo4Nl5capOULRSEDlRn8Wlym22u6ZuwNrgovVGn9gXe/Fa0PePn9NWXuK1
 YX7+REve7by3uH6Fa9W1EJj55UmPvRl0rwX/Azqa+px/DhEycGZAgxjCCFpEODAirg7S
 44FIrGlWsmI/ePwT33ZTnJYC3Ypx+HpB3oco5ewc1SpUbyei8tbz8Il7wKFCNcs2+NQq
 RFY4ECtLaQQpEQ6ojyPxBiflAXZrny6fdOX9EKvC9N0sAJoX0E9rUNxRyJfZW7ZiiGVj
 WEAw==
X-Gm-Message-State: APjAAAUTGds4R1QCpPcbOLqLU8pKfxhj+eqPydiuRqX8UaJiypLAdvpz
 xe0z4mGFk0YKdJgEtJJZ3mM9LQ==
X-Google-Smtp-Source: APXvYqxHmdR5xUtBiMVc0Mnxrw8HNJTIpU4I57BZIUZlNw5Ee/93dqanNwaTMuLFn6EQAArQLOrQxQ==
X-Received: by 2002:a63:1a5a:: with SMTP id a26mr2870744pgm.178.1568795151570; 
 Wed, 18 Sep 2019 01:25:51 -0700 (PDT)
Received: from localhost ([2401:fa00:1:10:79b4:bd83:e4a5:a720])
 by smtp.gmail.com with ESMTPSA id v44sm13357519pgn.17.2019.09.18.01.25.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Sep 2019 01:25:50 -0700 (PDT)
From: Cheng-Yi Chiang <cychiang@chromium.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v6 4/4] ASoC: rockchip_max98090: Add HDMI jack support
Date: Wed, 18 Sep 2019 16:25:00 +0800
Message-Id: <20190918082500.209281-5-cychiang@chromium.org>
X-Mailer: git-send-email 2.23.0.237.gc6a4ce50a0-goog
In-Reply-To: <20190918082500.209281-1-cychiang@chromium.org>
References: <20190918082500.209281-1-cychiang@chromium.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 19 Sep 2019 07:35:45 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=58QuMxmjHlqsWVtyFBQnvBpwo6+B1q1GdfYt1s4m2qE=;
 b=QTaH6GH5UguvXVEDbNSlyuomPAH87bYVOWqCH6McKhsGTYK/xYVHQgKnh5a5Tw0WNQ
 e1ZPFnuD/Y0yn4S2mKnoxDRgTiB9Z50mHQ31aQMtM2MYHFdO9az/vg2dsYmvd6pDZ634
 kY66oETu+TYVAH5TtMe6QmFRkiCAUAqTvr8BY=
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
bWF4OTgwOTAuYwppbmRleCBjODI5NDhlMzgzZGEuLmM4MWM0YWNkYTkxNyAxMDA2NDQKLS0tIGEv
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
