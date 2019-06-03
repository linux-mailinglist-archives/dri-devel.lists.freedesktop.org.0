Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 46AA0329D3
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jun 2019 09:40:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E00F789650;
	Mon,  3 Jun 2019 07:40:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B61F898C2
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jun 2019 04:34:05 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id bh12so382079plb.4
 for <dri-devel@lists.freedesktop.org>; Sun, 02 Jun 2019 21:34:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Cjn+fe9pHSnglvx4T5q/xNRom5yt6XJeMvAMIuyqpGU=;
 b=DcxwOZ/k5kOMfUoUEOpue1HEEMPftD1q0BedX+QXuTCSXYsHMJamygcX3Ij4cSkSXK
 orlQDKhJMAETE046qv/KssqK1mfUJ84/RzgsPIeJbtC4VVazn4xXrHbj8EWQzlxBVGvI
 u6ccrdUHFZoAtKl0jLO0Bld5KyMyXf4NPErNGNd/kNBjuuMnChVa4o7ANis23NMcAlO4
 MjSR1mS2SZpatLTaSaa+Wo5vOPBhLbBqfvSHe/ES8vx68FXJbWnivcI0Aqw14V7VLw7W
 IVD2Pk6KN1rahhAgJxvtD+nushUcgvd13Hj6+5WnZYI7E0VTTNPMXatL4AP5VpGKrmLO
 kz1Q==
X-Gm-Message-State: APjAAAX+NW7nhIejH9EsEXK1h5/Rj+L/JJmN/G276gsJVBnyOygTIocG
 ATThPmWoHTU0EmlWbNP+4d56Sw==
X-Google-Smtp-Source: APXvYqwtsOJ5Pc96EE50WIzahRr4M7P5Cn839A0uqq7pGgYj7JP4xpqAWFOhLexsz8HaBDU7wChTEA==
X-Received: by 2002:a17:902:9885:: with SMTP id
 s5mr27565604plp.102.1559536444754; 
 Sun, 02 Jun 2019 21:34:04 -0700 (PDT)
Received: from localhost ([2401:fa00:1:b:e688:dfd2:a1a7:2956])
 by smtp.gmail.com with ESMTPSA id r64sm16094840pfr.58.2019.06.02.21.34.00
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 02 Jun 2019 21:34:04 -0700 (PDT)
From: Cheng-Yi Chiang <cychiang@chromium.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 6/7] ASoC: rockchip_max98090: Add HDMI jack support
Date: Mon,  3 Jun 2019 12:32:50 +0800
Message-Id: <20190603043251.226549-7-cychiang@chromium.org>
X-Mailer: git-send-email 2.22.0.rc1.257.g3120a18244-goog
In-Reply-To: <20190603043251.226549-1-cychiang@chromium.org>
References: <20190603043251.226549-1-cychiang@chromium.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 03 Jun 2019 07:40:43 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Cjn+fe9pHSnglvx4T5q/xNRom5yt6XJeMvAMIuyqpGU=;
 b=Hfq6ax4j9v67eMl3jzhORUV9xlodMxfyEB5jUFylBnMvGjbup0xltWak92wPnYo8jT
 z0URgg2rd1r5wg+Oy3xrddVqdvePsxYBMv74zKntc+d+vjFpS0hNfzpdzd1s9AT5d4X1
 i8E4gAcDkyjhrEy5aOZTU8DXTpX6OpurnFU4Q=
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
Cc: alsa-devel@alsa-project.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Liam Girdwood <lgirdwood@gmail.com>,
 Hans Verkuil <hverkuil@xs4all.nl>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Cheng-Yi Chiang <cychiang@chromium.org>, Takashi Iwai <tiwai@suse.com>,
 linux-rockchip@lists.infradead.org, dgreid@chromium.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, tzungbi@chromium.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Russell King <rmk+kernel@armlinux.org.uk>, Rob Herring <robh+dt@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, linux-arm-kernel@lists.infradead.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, dianders@chromium.org,
 Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SW4gbWFjaGluZSBkcml2ZXIsIGNyZWF0ZSBhIGphY2sgYW5kIGxldCBoZG1pLWNvZGVjIHJlcG9y
dCBqYWNrIHN0YXR1cy4KClNpZ25lZC1vZmYtYnk6IENoZW5nLVlpIENoaWFuZyA8Y3ljaGlhbmdA
Y2hyb21pdW0ub3JnPgotLS0KIHNvdW5kL3NvYy9yb2NrY2hpcC9yb2NrY2hpcF9tYXg5ODA5MC5j
IHwgNDEgKysrKysrKysrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA0MSBpbnNl
cnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvc291bmQvc29jL3JvY2tjaGlwL3JvY2tjaGlwX21heDk4
MDkwLmMgYi9zb3VuZC9zb2Mvcm9ja2NoaXAvcm9ja2NoaXBfbWF4OTgwOTAuYwppbmRleCAyZGQy
NDc2NzBjN2EuLjE3YzUwZDlmYmFjMSAxMDA2NDQKLS0tIGEvc291bmQvc29jL3JvY2tjaGlwL3Jv
Y2tjaGlwX21heDk4MDkwLmMKKysrIGIvc291bmQvc29jL3JvY2tjaGlwL3JvY2tjaGlwX21heDk4
MDkwLmMKQEAgLTE4LDYgKzE4LDcgQEAKICAqLwogCiAjaW5jbHVkZSA8bGludXgvbW9kdWxlLmg+
CisjaW5jbHVkZSA8bGludXgvb2ZfcGxhdGZvcm0uaD4KICNpbmNsdWRlIDxsaW51eC9wbGF0Zm9y
bV9kZXZpY2UuaD4KICNpbmNsdWRlIDxsaW51eC9zbGFiLmg+CiAjaW5jbHVkZSA8bGludXgvZ3Bp
by5oPgpAQCAtMjcsNiArMjgsNyBAQAogI2luY2x1ZGUgPHNvdW5kL3BjbS5oPgogI2luY2x1ZGUg
PHNvdW5kL3BjbV9wYXJhbXMuaD4KICNpbmNsdWRlIDxzb3VuZC9zb2MuaD4KKyNpbmNsdWRlIDxz
b3VuZC9oZG1pLWNvZGVjLmg+CiAKICNpbmNsdWRlICJyb2NrY2hpcF9pMnMuaCIKICNpbmNsdWRl
ICIuLi9jb2RlY3MvdHMzYTIyN2UuaCIKQEAgLTEzMSw2ICsxMzMsMjYgQEAgZW51bSB7CiAJREFJ
TElOS19IRE1JLAogfTsKIAorc3RhdGljIHN0cnVjdCBzbmRfc29jX2phY2sgcmtfaGRtaV9qYWNr
OworCitzdGF0aWMgaW50IHJrX2hkbWlfaW5pdChzdHJ1Y3Qgc25kX3NvY19wY21fcnVudGltZSAq
cnVudGltZSkKK3sKKwlzdHJ1Y3Qgc25kX3NvY19jYXJkICpjYXJkID0gcnVudGltZS0+Y2FyZDsK
KwlzdHJ1Y3Qgc25kX3NvY19jb21wb25lbnQgKmNvbXBvbmVudCA9IHJ1bnRpbWUtPmNvZGVjX2Rh
aS0+Y29tcG9uZW50OworCXN0cnVjdCBkZXZpY2UgKmhkbWlfZGV2ID0gc25kX3NvY19jYXJkX2dl
dF9kcnZkYXRhKGNhcmQpOworCWludCByZXQ7CisKKwkvKiBlbmFibGUgamFjayBkZXRlY3Rpb24g
Ki8KKwlyZXQgPSBzbmRfc29jX2NhcmRfamFja19uZXcoY2FyZCwgIkhETUkgSmFjayIsIFNORF9K
QUNLX0xJTkVPVVQsCisJCQkJICAgICZya19oZG1pX2phY2ssIE5VTEwsIDApOworCWlmIChyZXQp
IHsKKwkJZGV2X2VycihjYXJkLT5kZXYsICJDYW4ndCBuZXcgSERNSSBKYWNrICVkXG4iLCByZXQp
OworCQlyZXR1cm4gcmV0OworCX0KKworCXJldHVybiBoZG1pX2NvZGVjX3NldF9qYWNrX2RldGVj
dChjb21wb25lbnQsICZya19oZG1pX2phY2ssIGhkbWlfZGV2KTsKK30KKwogLyogbWF4OTgwOTAg
YW5kIEhETUkgY29kZWMgZGFpX2xpbmsgKi8KIHN0YXRpYyBzdHJ1Y3Qgc25kX3NvY19kYWlfbGlu
ayBya19kYWlsaW5rc1tdID0gewogCVtEQUlMSU5LX01BWDk4MDkwXSA9IHsKQEAgLTE0OCw2ICsx
NzAsNyBAQCBzdGF0aWMgc3RydWN0IHNuZF9zb2NfZGFpX2xpbmsgcmtfZGFpbGlua3NbXSA9IHsK
IAkJLm9wcyA9ICZya19haWYxX29wcywKIAkJLmRhaV9mbXQgPSBTTkRfU09DX0RBSUZNVF9JMlMg
fCBTTkRfU09DX0RBSUZNVF9OQl9ORiB8CiAJCQlTTkRfU09DX0RBSUZNVF9DQlNfQ0ZTLAorCQku
aW5pdCA9IHJrX2hkbWlfaW5pdCwKIAl9CiB9OwogCkBAIC0yMDAsNiArMjIzLDggQEAgc3RhdGlj
IGludCBzbmRfcmtfbWNfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAlzdHJ1
Y3QgZGV2aWNlX25vZGUgKm5wID0gcGRldi0+ZGV2Lm9mX25vZGU7CiAJc3RydWN0IGRldmljZV9u
b2RlICpucF9jcHU7CiAJc3RydWN0IG9mX3BoYW5kbGVfYXJncyBhcmdzOworCXN0cnVjdCBkZXZp
Y2Vfbm9kZSAqbnBfaGRtaTsKKwlzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpoZG1pX3BkZXY7CiAK
IAkvKiByZWdpc3RlciB0aGUgc29jIGNhcmQgKi8KIAljYXJkLT5kZXYgPSAmcGRldi0+ZGV2OwpA
QCAtMjQ4LDYgKzI3MywyMiBAQCBzdGF0aWMgaW50IHNuZF9ya19tY19wcm9iZShzdHJ1Y3QgcGxh
dGZvcm1fZGV2aWNlICpwZGV2KQogCQlyZXR1cm4gLUVJTlZBTDsKIAl9CiAKKwkvKiBUaGUgaGRt
aSBkZXZpY2UgaGFuZGxlcyBIRE1JIGhvdHBsdWcgZGV0ZWN0aW9uICovCisJbnBfaGRtaSA9IG9m
X3BhcnNlX3BoYW5kbGUobnAsICJyb2NrY2hpcCxoZG1pIiwgMCk7CisJaWYgKCFucF9oZG1pKSB7
CisJCWRldl9lcnIoJnBkZXYtPmRldiwgIkZhaWxlZCB0byBmaW5kIEhETUkgbm9kZVxuIik7CisJ
CXJldHVybiAtRUlOVkFMOworCX0KKworCWhkbWlfcGRldiA9IG9mX2ZpbmRfZGV2aWNlX2J5X25v
ZGUobnBfaGRtaSk7CisJaWYgKCFoZG1pX3BkZXYpIHsKKwkJZGV2X2VycigmcGRldi0+ZGV2LCAi
V2FpdGluZyBmb3IgSERNSSBkZXZpY2UgJXNcbiIsCisJCQlucF9oZG1pLT5mdWxsX25hbWUpOwor
CQlyZXR1cm4gLUVQUk9CRV9ERUZFUjsKKwl9CisKKwlzbmRfc29jX2NhcmRfc2V0X2RydmRhdGEo
Y2FyZCwgJmhkbWlfcGRldi0+ZGV2KTsKKwogCXJldCA9IHNuZF9zb2Nfb2ZfcGFyc2VfY2FyZF9u
YW1lKGNhcmQsICJyb2NrY2hpcCxtb2RlbCIpOwogCWlmIChyZXQpIHsKIAkJZGV2X2VycigmcGRl
di0+ZGV2LAotLSAKMi4yMi4wLnJjMS4yNTcuZzMxMjBhMTgyNDQtZ29vZwoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
