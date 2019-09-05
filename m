Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 03CBCAB2CE
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2019 09:01:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EF7C6E15C;
	Fri,  6 Sep 2019 07:01:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E675B6E0CD
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Sep 2019 16:18:07 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id h195so2075707pfe.5
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Sep 2019 09:18:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=3Bt6nNLlt+xUVNaG8TogY6q5T68efSQtUAFTBH8Xlsg=;
 b=FUWRIDrqB38oNvxIEIvnQbmMjDJnGkcWg1+lIZySz752K0kcEcsqnBIRbFTYuwOZny
 t7C1Ys98aZ94yn0hNEt2nBQP6kEZEIjArl3SwXrS8kaTaaviBrHXlaXMKV2FhAGICu19
 dq8QCArwx1J0Wif7yccr0Hl9CaR1y/h4sEu5rbHdSTyxCBCB48MoDmIS93caQ5oSsalI
 MzXkuqpsy4cHgkMMmNGi0MFJ/FSywHfyGj4q9gFMqtNhkS3dBcTpNUUuShdnGbZF/Jff
 O2+FpDncYrbXOqDSp9e70s6+bePbbXb3Rfo0G1f5IVenPnF1ANC6z2RflusBGwYhcSsX
 pV6A==
X-Gm-Message-State: APjAAAXqkrZ8SUt79cGAm0shRSGM2hfH3iVz42OSsh51WAX85+CHRe+T
 UyzkhXo39/vMy4fVscvdO2eOoQ==
X-Google-Smtp-Source: APXvYqyeuaXfpPcMY8LL3N9SzaC/DWAxU9D1agyzvWDKKPe/Or/72DzL6TV62pYkRSpSy8AT7z2T/g==
X-Received: by 2002:a63:6686:: with SMTP id a128mr3841760pgc.361.1567700287353; 
 Thu, 05 Sep 2019 09:18:07 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net.
 [68.147.8.254])
 by smtp.gmail.com with ESMTPSA id m129sm6324005pga.39.2019.09.05.09.18.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Sep 2019 09:18:06 -0700 (PDT)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: stable@vger.kernel.org
Subject: [BACKPORT 4.14.y 05/18] mfd: palmas: Assign the right powerhold mask
 for tps65917
Date: Thu,  5 Sep 2019 10:17:46 -0600
Message-Id: <20190905161759.28036-6-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190905161759.28036-1-mathieu.poirier@linaro.org>
References: <20190905161759.28036-1-mathieu.poirier@linaro.org>
X-Mailman-Approved-At: Fri, 06 Sep 2019 07:01:00 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=3Bt6nNLlt+xUVNaG8TogY6q5T68efSQtUAFTBH8Xlsg=;
 b=HI5tWkpkgDB2JApLY2ATp8wEzTgsgI7cUXG07/am8F65CP7VSB3lI0NXxyns+DWiX2
 gaWTANI3zq2OwmaBZXn99DM6sZThpLtoRKLYi5a2I85zG/SH7P8SCjVgftKwhY5ktFuA
 vJO992gbVyS1qZ7VJYG2btuxuSIAhhpNXMIqEzmVfiiabSsH0Mel1mVFYnYEbX7WVla8
 tN7UFY3JcIVURcYH4ZeeV0a1XoRM7rgtLWf0/zDA5+VHxMm9oxNpGTujIBcQCjB7dge2
 mpkITrf0/86JuXKn9lS53c6lBD7zg0AWMotgCzvCXmzDoFROpRfyCy8gCpdWJAq9a8Hw
 RNtw==
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
Cc: linux-pm@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mtd@lists.infradead.org,
 linux-i2c@vger.kernel.org, linux-omap@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogS2VlcnRoeSA8ai1rZWVydGh5QHRpLmNvbT4KCmNvbW1pdCA1NzJmZjRkNTYwYmUzNzg0
MjA1YjIyNGNkNjdkNjcxNTYyMDA5MmQ3IHVwc3RyZWFtCgpUaGUgcG93ZXJob2xkIG1hc2sgZm9y
IFRQUzY1OTE3IGlzIGRpZmZlcmVudCB3aGVuIGNvbWFwcmVkIHRvCnRoZSBvdGhlciBwYWxtYXMg
dmVyc2lvbnMuIEhlbmNlIGFzc2lnbiB0aGUgcmlnaHQgbWFzayB0aGF0IGVuYWJsZXMKcG93ZXIg
b2ZmIG9mIHRwczY1OTE3IHBtaWMgY29ycmVjdGx5LgoKU2lnbmVkLW9mZi1ieTogS2VlcnRoeSA8
ai1rZWVydGh5QHRpLmNvbT4KU2lnbmVkLW9mZi1ieTogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGlu
YXJvLm9yZz4KU2lnbmVkLW9mZi1ieTogTWF0aGlldSBQb2lyaWVyIDxtYXRoaWV1LnBvaXJpZXJA
bGluYXJvLm9yZz4KLS0tCiBkcml2ZXJzL21mZC9wYWxtYXMuYyAgICAgICB8IDEwICsrKysrKysr
Ky0KIGluY2x1ZGUvbGludXgvbWZkL3BhbG1hcy5oIHwgIDMgKysrCiAyIGZpbGVzIGNoYW5nZWQs
IDEyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL21m
ZC9wYWxtYXMuYyBiL2RyaXZlcnMvbWZkL3BhbG1hcy5jCmluZGV4IDM5MjJhOTNmOWY5Mi4uNjYz
YTIzOThiNmIxIDEwMDY0NAotLS0gYS9kcml2ZXJzL21mZC9wYWxtYXMuYworKysgYi9kcml2ZXJz
L21mZC9wYWxtYXMuYwpAQCAtNDMwLDYgKzQzMCw3IEBAIHN0YXRpYyB2b2lkIHBhbG1hc19wb3dl
cl9vZmYodm9pZCkKIHsKIAl1bnNpZ25lZCBpbnQgYWRkcjsKIAlpbnQgcmV0LCBzbGF2ZTsKKwl1
OCBwb3dlcmhvbGRfbWFzazsKIAlzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wID0gcGFsbWFzX2Rldi0+
ZGV2LT5vZl9ub2RlOwogCiAJaWYgKG9mX3Byb3BlcnR5X3JlYWRfYm9vbChucCwgInRpLHBhbG1h
cy1vdmVycmlkZS1wb3dlcmhvbGQiKSkgewpAQCAtNDM3LDggKzQzOCwxNSBAQCBzdGF0aWMgdm9p
ZCBwYWxtYXNfcG93ZXJfb2ZmKHZvaWQpCiAJCQkJCSAgUEFMTUFTX1BSSU1BUllfU0VDT05EQVJZ
X1BBRDIpOwogCQlzbGF2ZSA9IFBBTE1BU19CQVNFX1RPX1NMQVZFKFBBTE1BU19QVV9QRF9PRF9C
QVNFKTsKIAorCQlpZiAob2ZfZGV2aWNlX2lzX2NvbXBhdGlibGUobnAsICJ0aSx0cHM2NTkxNyIp
KQorCQkJcG93ZXJob2xkX21hc2sgPQorCQkJCVRQUzY1OTE3X1BSSU1BUllfU0VDT05EQVJZX1BB
RDJfR1BJT181X01BU0s7CisJCWVsc2UKKwkJCXBvd2VyaG9sZF9tYXNrID0KKwkJCQlQQUxNQVNf
UFJJTUFSWV9TRUNPTkRBUllfUEFEMl9HUElPXzdfTUFTSzsKKwogCQlyZXQgPSByZWdtYXBfdXBk
YXRlX2JpdHMocGFsbWFzX2Rldi0+cmVnbWFwW3NsYXZlXSwgYWRkciwKLQkJCQlQQUxNQVNfUFJJ
TUFSWV9TRUNPTkRBUllfUEFEMl9HUElPXzdfTUFTSywgMCk7CisJCQkJCSBwb3dlcmhvbGRfbWFz
aywgMCk7CiAJCWlmIChyZXQpCiAJCQlkZXZfZXJyKHBhbG1hc19kZXYtPmRldiwKIAkJCQkiVW5h
YmxlIHRvIHdyaXRlIFBSSU1BUllfU0VDT05EQVJZX1BBRDIgJWRcbiIsCmRpZmYgLS1naXQgYS9p
bmNsdWRlL2xpbnV4L21mZC9wYWxtYXMuaCBiL2luY2x1ZGUvbGludXgvbWZkL3BhbG1hcy5oCmlu
ZGV4IDZkZWM0MzgyNjMwMy4uY2ZmYjIzYjhiZDcwIDEwMDY0NAotLS0gYS9pbmNsdWRlL2xpbnV4
L21mZC9wYWxtYXMuaAorKysgYi9pbmNsdWRlL2xpbnV4L21mZC9wYWxtYXMuaApAQCAtMzczMyw2
ICszNzMzLDkgQEAgZW51bSB1c2JfaXJxX2V2ZW50cyB7CiAjZGVmaW5lIFRQUzY1OTE3X1JFR0VO
M19DVFJMX01PREVfQUNUSVZFCQkJMHgwMQogI2RlZmluZSBUUFM2NTkxN19SRUdFTjNfQ1RSTF9N
T0RFX0FDVElWRV9TSElGVAkJCTB4MDAKIAorLyogUE9XRVJIT0xEIE1hc2sgZmllbGQgZm9yIFBS
SU1BUllfU0VDT05EQVJZX1BBRDIgcmVnaXN0ZXIgKi8KKyNkZWZpbmUgVFBTNjU5MTdfUFJJTUFS
WV9TRUNPTkRBUllfUEFEMl9HUElPXzVfTUFTSwkJMHhDCisKIC8qIFJlZ2lzdGVycyBmb3IgZnVu
Y3Rpb24gUkVTT1VSQ0UgKi8KICNkZWZpbmUgVFBTNjU5MTdfUkVHRU4xX0NUUkwJCQkJCTB4Mgog
I2RlZmluZSBUUFM2NTkxN19QTExFTl9DVFJMCQkJCQkweDMKLS0gCjIuMTcuMQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
