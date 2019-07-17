Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BCC36BD9F
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jul 2019 15:50:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C95506E046;
	Wed, 17 Jul 2019 13:50:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 698F96E103
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jul 2019 08:34:23 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id w10so10806889pgj.7
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jul 2019 01:34:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cidGTqyDmTdA37+BpWIU23tti1Aef+vr+fIqWe45Ips=;
 b=fXuZJ0skRkbLKdisDibxCIrlRzJrzsLDmde9SajdNyqsns3I3B/q181wTHiGJ2yRGr
 0XTQFMNSgKJzV3hmCNFAyuX3ABbm3tI05sFs22eFZ2RruAmeV0KJsYXbi2zoEDmlQZAY
 TVln6QIm4BliG1gn3hD//xIJxT87HUj1qENxf+RzG/VCOZzGBhQ6CgzVq4PAV+bwmUpU
 c8HqGURk+yKgna+G/5IdQdBdfX84D7CynJ22ObxL1n8ovxAO8G8C9UuXdE8ePydprQMI
 NsFWdFNAgdZ/SzY1Hjnwfue+F2g+xEiqw9lRWJchJsiOEhv25XA/PLCfU4Mi6PaJpodE
 zFxg==
X-Gm-Message-State: APjAAAVFd/hDGQhigAKvglLoYau9VfDLrsYcy+cIBtq8nciZe46tVsMP
 IdnMqpnJf1Tx8GYuVQTvRWlByw==
X-Google-Smtp-Source: APXvYqzlpXfBkcYTJYh+zRzHNs0eeuRkE1NZqTwzR7hx5d1u6W8AZyHHRlNHdrM7cO2RviT7Cn4/cQ==
X-Received: by 2002:a63:4185:: with SMTP id o127mr1878619pga.82.1563352463012; 
 Wed, 17 Jul 2019 01:34:23 -0700 (PDT)
Received: from localhost ([2401:fa00:1:b:e688:dfd2:a1a7:2956])
 by smtp.gmail.com with ESMTPSA id x9sm27902875pfn.177.2019.07.17.01.34.19
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 17 Jul 2019 01:34:22 -0700 (PDT)
From: Cheng-Yi Chiang <cychiang@chromium.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v5 5/5] ASoC: rockchip_max98090: Add HDMI jack support
Date: Wed, 17 Jul 2019 16:33:27 +0800
Message-Id: <20190717083327.47646-6-cychiang@chromium.org>
X-Mailer: git-send-email 2.22.0.510.g264f2c817a-goog
In-Reply-To: <20190717083327.47646-1-cychiang@chromium.org>
References: <20190717083327.47646-1-cychiang@chromium.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 17 Jul 2019 13:50:42 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cidGTqyDmTdA37+BpWIU23tti1Aef+vr+fIqWe45Ips=;
 b=Pd9rMXqrPjeccHxZLywI63NSXDq23LfJH4aCPFLK7QnpkUPTxZgry6WuFZisQlBS6z
 wF7jGO9ojokkzEIb+2RQrPLLNnOiyW45ESsKQjm2fRb/dMnHljP0rhhOVlh5Y/dJ7HWq
 boBtCwQJdcRxbtnVIy7b+VEjhNf+UN+Y+UMZA=
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
aGRtaV9pbml0LAogCQlTTkRfU09DX0RBSUxJTktfUkVHKGhkbWkpLAogCX0KIH07Ci0tIAoyLjIy
LjAuNTEwLmcyNjRmMmM4MTdhLWdvb2cKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
