Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F7452B1C3C
	for <lists+dri-devel@lfdr.de>; Fri, 13 Nov 2020 14:50:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 656AC6E523;
	Fri, 13 Nov 2020 13:50:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7973C6E4DD
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Nov 2020 13:50:04 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id u12so2763571wrt.0
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Nov 2020 05:50:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FPP0KPBE9bJ91PMqYQecftz5TXmHEXYH6/4+Sl+qsTE=;
 b=atNqYZ8kRbRqU8GNbprKEAbi23pRTlYb5L0MmlYxC7m6PmpZNGQuhqP6ASY22r5shn
 j1W43Id8OBhgGoyS3zM/JamzfB6UNXGFblqrp5WI1jIz1bxgmVD6gTxPvE+CWSipHFfK
 6n5Rryizvvc9J6mIbOwX2TP6WkS9/ZKzFI+xgT5oMcJ2rpcOtdgCpf7WOcrRH78gg+vn
 ywhJNI9DQHewqFej2ROXNGRf0ixudva9FfMawIBD5Z8MJcrzAIPrTLPNKGoydcPVKRLU
 1JJPW4cqi4cGWAkpwJmhjSGNo2ofbJA1/N6sih1n/2VAD+c9DbDFpseCcXv1ncnGQMxr
 QadA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FPP0KPBE9bJ91PMqYQecftz5TXmHEXYH6/4+Sl+qsTE=;
 b=BoHov9FrhnJYEMqDBnNctVWQi9ckh+NQsiarb0gecpkPBcx0xCN6tf4MWC49Hkj0SU
 WIzG9AyEN73tux62HlHZ/NUHkzxsF1eUWwwsTkUwcxY6XpdqA9P0AQ3SO4DMhuJ4L1pP
 J4BQr/2dspI++7dbE6tnvyWGAPOzbFQExggRnMk2os2OfYk3Wkc8PUcLp6IZkvlrXHr2
 /IR1eBGNfXTU4RJJVHv0CXSx+RCG89o+1F88Ga+0On+ZQf9/j5snMfXCAduNomZZpVbZ
 Ma8aG/funzY0Dnn0+QPbkSue9yV3lku9cOYyFmfwR0Dur+8eI8q1zqyBxtA/DSRZNaSN
 ISBw==
X-Gm-Message-State: AOAM532/R11COB7dh9NedQhnIb3qkTeO+2A4oKQSXFhF3IS4+T6pauuH
 fTsMA3U/z9dozPCjBNK+Cu7ucQ==
X-Google-Smtp-Source: ABdhPJwH0G0Dh1nWggTcRBgogx0/P/R+hHDVfYcBOXgPs1OuarDaHOCCcZpMJv2RIDqqw50TszH2jw==
X-Received: by 2002:a5d:44cf:: with SMTP id z15mr3550191wrr.353.1605275402684; 
 Fri, 13 Nov 2020 05:50:02 -0800 (PST)
Received: from dell.default ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id t11sm4561614wrm.8.2020.11.13.05.50.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Nov 2020 05:50:02 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 17/40] drm/meson/meson_vclk: Make two local functions static
Date: Fri, 13 Nov 2020 13:49:15 +0000
Message-Id: <20201113134938.4004947-18-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201113134938.4004947-1-lee.jones@linaro.org>
References: <20201113134938.4004947-1-lee.jones@linaro.org>
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL21lc29uL21lc29uX3ZjbGsuYzoxMzQ6Njogd2FybmluZzogbm8gcHJldmlvdXMg
cHJvdG90eXBlIGZvciDigJhtZXNvbl92aWRfcGxsX3NldOKAmSBbLVdtaXNzaW5nLXByb3RvdHlw
ZXNdCiBkcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fdmNsay5jOjQ5MDo2OiB3YXJuaW5nOiBu
byBwcmV2aW91cyBwcm90b3R5cGUgZm9yIOKAmG1lc29uX2hkbWlfcGxsX3NldF9wYXJhbXPigJkg
Wy1XbWlzc2luZy1wcm90b3R5cGVzXQoKQ2M6IE5laWwgQXJtc3Ryb25nIDxuYXJtc3Ryb25nQGJh
eWxpYnJlLmNvbT4KQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KQ2M6IERhbmll
bCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KQ2M6IEtldmluIEhpbG1hbiA8a2hpbG1hbkBiYXls
aWJyZS5jb20+CkNjOiBKZXJvbWUgQnJ1bmV0IDxqYnJ1bmV0QGJheWxpYnJlLmNvbT4KQ2M6IE1h
cnRpbiBCbHVtZW5zdGluZ2wgPG1hcnRpbi5ibHVtZW5zdGluZ2xAZ29vZ2xlbWFpbC5jb20+CkNj
OiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCkNjOiBsaW51eC1hbWxvZ2ljQGxpc3Rz
LmluZnJhZGVhZC5vcmcKQ2M6IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwpT
aWduZWQtb2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgotLS0KIGRyaXZl
cnMvZ3B1L2RybS9tZXNvbi9tZXNvbl92Y2xrLmMgfCA4ICsrKystLS0tCiAxIGZpbGUgY2hhbmdl
ZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9tZXNvbi9tZXNvbl92Y2xrLmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25f
dmNsay5jCmluZGV4IDBlYjg2OTQzYTM1ODguLjJhODIxMTllYjU4ZWQgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl92Y2xrLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL21l
c29uL21lc29uX3ZjbGsuYwpAQCAtMTMxLDcgKzEzMSw3IEBAIGVudW0gewogCVZJRF9QTExfRElW
XzE1LAogfTsKIAotdm9pZCBtZXNvbl92aWRfcGxsX3NldChzdHJ1Y3QgbWVzb25fZHJtICpwcml2
LCB1bnNpZ25lZCBpbnQgZGl2KQorc3RhdGljIHZvaWQgbWVzb25fdmlkX3BsbF9zZXQoc3RydWN0
IG1lc29uX2RybSAqcHJpdiwgdW5zaWduZWQgaW50IGRpdikKIHsKIAl1bnNpZ25lZCBpbnQgc2hp
ZnRfdmFsID0gMDsKIAl1bnNpZ25lZCBpbnQgc2hpZnRfc2VsID0gMDsKQEAgLTQ4Nyw5ICs0ODcs
OSBAQCBzdGF0aWMgaW5saW5lIHVuc2lnbmVkIGludCBwbGxfb2RfdG9fcmVnKHVuc2lnbmVkIGlu
dCBvZCkKIAlyZXR1cm4gMDsKIH0KIAotdm9pZCBtZXNvbl9oZG1pX3BsbF9zZXRfcGFyYW1zKHN0
cnVjdCBtZXNvbl9kcm0gKnByaXYsIHVuc2lnbmVkIGludCBtLAotCQkJICAgICAgIHVuc2lnbmVk
IGludCBmcmFjLCB1bnNpZ25lZCBpbnQgb2QxLAotCQkJICAgICAgIHVuc2lnbmVkIGludCBvZDIs
IHVuc2lnbmVkIGludCBvZDMpCitzdGF0aWMgdm9pZCBtZXNvbl9oZG1pX3BsbF9zZXRfcGFyYW1z
KHN0cnVjdCBtZXNvbl9kcm0gKnByaXYsIHVuc2lnbmVkIGludCBtLAorCQkJCSAgICAgIHVuc2ln
bmVkIGludCBmcmFjLCB1bnNpZ25lZCBpbnQgb2QxLAorCQkJCSAgICAgIHVuc2lnbmVkIGludCBv
ZDIsIHVuc2lnbmVkIGludCBvZDMpCiB7CiAJdW5zaWduZWQgaW50IHZhbDsKIAotLSAKMi4yNS4x
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
