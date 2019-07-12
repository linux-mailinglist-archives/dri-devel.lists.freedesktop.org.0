Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0ED267A75
	for <lists+dri-devel@lfdr.de>; Sat, 13 Jul 2019 16:24:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAC7A8996F;
	Sat, 13 Jul 2019 14:24:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF7FE6E33E
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jul 2019 10:05:52 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id f17so111899pfn.6
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jul 2019 03:05:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nJ9T4k4yWMJOAaiUcAIMxLuNgP/0Z4a1nwB48vdQUdo=;
 b=lPMq4yMXC7BJ5aJrdt6aUvY5lVsS2kd+muVLYcHRavfjP4w/Woh+yXiADfqDv1CMdd
 D/2gRtXWNKfZfNItJ36hJxthi2IcXVbL1K1aFKLG9JmkYqyZ4AQOofUDwQg4V0xDTPhW
 cQxarEVYtWk5xXFxAGZtJ5b2iRm4a3aiWnmAqKDcqk6PwGNGGgnQcgnY5lkD4hkEDLC2
 smTKB2nZb1sKOOPIUtBkEc+olcb7rl0bUDpRYGlNOLQY2Pg3n/HkZyziwBfyY3deRl/e
 sHpd/bJJzaL/1WN4z3G4BQ2kjNvf61oJWTl17C9T4biNJBSwc0qGLIrk3Egg79kktGUx
 vBfQ==
X-Gm-Message-State: APjAAAWez9/IWZQt6OIMrsep0C6mUzkiVBPcHjGfG62u3s4gn7swHDNu
 tlK05kzChA7khIInB7+fvZ4+yA==
X-Google-Smtp-Source: APXvYqzcKtPuhjN3ijrX729Do7YsSN+gK9Xr22OXFsbtMH8dYsUUfVeTSwF+bRxflD1NC8uUuIDzXg==
X-Received: by 2002:a63:ef4b:: with SMTP id c11mr8249027pgk.129.1562925951980; 
 Fri, 12 Jul 2019 03:05:51 -0700 (PDT)
Received: from localhost ([2401:fa00:1:b:e688:dfd2:a1a7:2956])
 by smtp.gmail.com with ESMTPSA id p1sm9585097pff.74.2019.07.12.03.05.48
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 12 Jul 2019 03:05:51 -0700 (PDT)
From: Cheng-Yi Chiang <cychiang@chromium.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3 5/5] FROMLIST: ASoC: rockchip_max98090: Add HDMI jack
 support
Date: Fri, 12 Jul 2019 18:04:43 +0800
Message-Id: <20190712100443.221322-6-cychiang@chromium.org>
X-Mailer: git-send-email 2.22.0.510.g264f2c817a-goog
In-Reply-To: <20190712100443.221322-1-cychiang@chromium.org>
References: <20190712100443.221322-1-cychiang@chromium.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 13 Jul 2019 14:24:23 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nJ9T4k4yWMJOAaiUcAIMxLuNgP/0Z4a1nwB48vdQUdo=;
 b=LIB+Rre0v7/4eGBzlbZVV4iXe63QiDwXFv6Pu5pDZ5CU9oH53Bf5meBibasUu47y1o
 fKey8dlXGs3cFXeiByS/PWsiYLqc86igrAvoKaHxdDQ+sBb/1zQRUDvm0VGq+Ft3iO9H
 WfI+8Jm/oHJVtEx5ysuu5u5hE0wk0Y6PD5SlY=
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
Cc: alsa-devel@alsa-project.org, dianders@chromium.org,
 linux-rockchip@lists.infradead.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, tzungbi@chromium.org,
 Jaroslav Kysela <perex@perex.cz>, Hans Verkuil <hverkuil@xs4all.nl>,
 Russell King <rmk+kernel@armlinux.org.uk>, Mark Brown <broonie@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, dgreid@chromium.org,
 linux-arm-kernel@lists.infradead.org, Cheng-Yi Chiang <cychiang@chromium.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SW4gbWFjaGluZSBkcml2ZXIsIGNyZWF0ZSBhIGphY2sgYW5kIGxldCBoZG1pLWNvZGVjIHJlcG9y
dCBqYWNrIHN0YXR1cy4KClNpZ25lZC1vZmYtYnk6IENoZW5nLVlpIENoaWFuZyA8Y3ljaGlhbmdA
Y2hyb21pdW0ub3JnPgotLS0KIHNvdW5kL3NvYy9yb2NrY2hpcC9yb2NrY2hpcF9tYXg5ODA5MC5j
IHwgMjAgKysrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAyMCBpbnNlcnRpb25z
KCspCgpkaWZmIC0tZ2l0IGEvc291bmQvc29jL3JvY2tjaGlwL3JvY2tjaGlwX21heDk4MDkwLmMg
Yi9zb3VuZC9zb2Mvcm9ja2NoaXAvcm9ja2NoaXBfbWF4OTgwOTAuYwppbmRleCBjODI5NDhlMzgz
ZGEuLmM4MWM0YWNkYTkxNyAxMDA2NDQKLS0tIGEvc291bmQvc29jL3JvY2tjaGlwL3JvY2tjaGlw
X21heDk4MDkwLmMKKysrIGIvc291bmQvc29jL3JvY2tjaGlwL3JvY2tjaGlwX21heDk4MDkwLmMK
QEAgLTEzNCw2ICsxMzQsMjUgQEAgZW51bSB7CiAJREFJTElOS19IRE1JLAogfTsKIAorc3RhdGlj
IHN0cnVjdCBzbmRfc29jX2phY2sgcmtfaGRtaV9qYWNrOworCitzdGF0aWMgaW50IHJrX2hkbWlf
aW5pdChzdHJ1Y3Qgc25kX3NvY19wY21fcnVudGltZSAqcnVudGltZSkKK3sKKwlzdHJ1Y3Qgc25k
X3NvY19jYXJkICpjYXJkID0gcnVudGltZS0+Y2FyZDsKKwlzdHJ1Y3Qgc25kX3NvY19jb21wb25l
bnQgKmNvbXBvbmVudCA9IHJ1bnRpbWUtPmNvZGVjX2RhaS0+Y29tcG9uZW50OworCWludCByZXQ7
CisKKwkvKiBlbmFibGUgamFjayBkZXRlY3Rpb24gKi8KKwlyZXQgPSBzbmRfc29jX2NhcmRfamFj
a19uZXcoY2FyZCwgIkhETUkgSmFjayIsIFNORF9KQUNLX0xJTkVPVVQsCisJCQkJICAgICZya19o
ZG1pX2phY2ssIE5VTEwsIDApOworCWlmIChyZXQpIHsKKwkJZGV2X2VycihjYXJkLT5kZXYsICJD
YW4ndCBuZXcgSERNSSBKYWNrICVkXG4iLCByZXQpOworCQlyZXR1cm4gcmV0OworCX0KKworCXJl
dHVybiBoZG1pX2NvZGVjX3NldF9qYWNrX2RldGVjdChjb21wb25lbnQsICZya19oZG1pX2phY2sp
OworfQorCiAvKiBtYXg5ODA5MCBhbmQgSERNSSBjb2RlYyBkYWlfbGluayAqLwogc3RhdGljIHN0
cnVjdCBzbmRfc29jX2RhaV9saW5rIHJrX2RhaWxpbmtzW10gPSB7CiAJW0RBSUxJTktfTUFYOTgw
OTBdID0gewpAQCAtMTUxLDYgKzE3MCw3IEBAIHN0YXRpYyBzdHJ1Y3Qgc25kX3NvY19kYWlfbGlu
ayBya19kYWlsaW5rc1tdID0gewogCQkub3BzID0gJnJrX2FpZjFfb3BzLAogCQkuZGFpX2ZtdCA9
IFNORF9TT0NfREFJRk1UX0kyUyB8IFNORF9TT0NfREFJRk1UX05CX05GIHwKIAkJCVNORF9TT0Nf
REFJRk1UX0NCU19DRlMsCisJCS5pbml0ID0gcmtfaGRtaV9pbml0LAogCQlTTkRfU09DX0RBSUxJ
TktfUkVHKGhkbWkpLAogCX0KIH07Ci0tIAoyLjIyLjAuNTEwLmcyNjRmMmM4MTdhLWdvb2cKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
