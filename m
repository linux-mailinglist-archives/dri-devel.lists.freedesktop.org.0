Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B8DC3F0EB
	for <lists+dri-devel@lfdr.de>; Tue, 30 Apr 2019 09:10:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BDF0893EC;
	Tue, 30 Apr 2019 07:10:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1839B892FA
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Apr 2019 10:23:40 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id y5so14001676wma.2
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Apr 2019 03:23:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9U654s0y3/OTSiMoK1+3nXkaUK985F53Lm18Cxpkwjw=;
 b=RKyvH1vFlTXgYZkV2+kteNSJ2qIFiGuB3cjppCc5D3nTFeQX8lNNaqns65cUpDSQyS
 AZw74AKT/uRzUkI/3oWF2dO/Zi/oI9NEOto7Ue7cCGIWWujWSpkgtKbfsfV4PXT7cRLT
 JK4cJ2T6XPvH1KXY/BJmLydgStgafHofXh5mu8X3yVlcw5kRp/JqD23+EK06nf5IW2mK
 oJESnNFNyXVAP1a+YkCZDG5ZuCE/C9S8XMP1KXUa/GSxESnuYWLSvsF5yUBccj0b+pYg
 8OnSf6z8Gj+eex+mPtPEdoNSbCxvjiqEKfG62yvLZ260fxv17gPE26bwiondrw+tVVp6
 3zpw==
X-Gm-Message-State: APjAAAWWPnlG7jMbBNaOTIy4JQlqI8YM0iA1Po1pYdd1/YVWF1oGc/FA
 9vZo71VsTla6gk5LrJPwFneNcg==
X-Google-Smtp-Source: APXvYqzuIr088WqVnUik2HpohJ2FvVRToR12zoB533mbajPOk1tDXuO2RvmDLe+JxMnff/DpTnJyIg==
X-Received: by 2002:a1c:e916:: with SMTP id q22mr16865079wmc.148.1556533418772; 
 Mon, 29 Apr 2019 03:23:38 -0700 (PDT)
Received: from boomer.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id m25sm1598874wmi.45.2019.04.29.03.23.37
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 29 Apr 2019 03:23:38 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH] drm/meson: imply dw-hdmi i2s audio for meson hdmi
Date: Mon, 29 Apr 2019 12:23:25 +0200
Message-Id: <20190429102325.29022-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 30 Apr 2019 07:09:47 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9U654s0y3/OTSiMoK1+3nXkaUK985F53Lm18Cxpkwjw=;
 b=sNu4hws/TaY8GaFc8dyvmg+FW5/ryQH20TEta7WDZ6DNboRsaDEJ1G5g+3QodO80lz
 yWV2/U6H+LDyxFWVETn1tW+Yy/z5WDXiuFOmveVhzrLUwJJGcmABzlsUaDfMCXY6mhTn
 BJALXTC/JxKGC3cGGMd1rRALKsv1IUYXlqaFZ73NOVXK+AXa6w2tfgnkzQVirczoMYbJ
 l0tAobCAA5vMUdM9a9UFg9BW4e31Ychs932Icrlkj0pg/0xjUs66axoWRZP/1xTBUf75
 VCTq01XreUR2RV5J4OZxSdTg0HT1aU2Y6JpcsQdX3m1wOqAdeSDGfvjR/LhTYBxgiA8P
 W8MA==
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SW1wbHkgdGhlIGkycyBwYXJ0IG9mIHRoZSBTeW5vcHN5cyBIRE1JIGRyaXZlciBmb3IgQW1sb2dp
YyBTb0NzLgpUaGlzIHdpbGwgZW5hYmxlIHRoZSBpMnMgcGFydCBieSBkZWZhdWx0IHdoZW4gbWVz
b24gaGRtaSBkcml2ZXIKaXMgZW5hYmxlIGJ1dCBsZXQgcGxhdGZvcm1zIG5vdCBzdXBwb3J0ZWQg
YnkgdGhlIGF1ZGlvIHN1YnN5c3RlbQpkaXNhYmxlIGl0IGlmIG5lY2Vzc2FyeS4KClNpZ25lZC1v
ZmYtYnk6IEplcm9tZSBCcnVuZXQgPGpicnVuZXRAYmF5bGlicmUuY29tPgotLS0KIGRyaXZlcnMv
Z3B1L2RybS9tZXNvbi9LY29uZmlnIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVzb24vS2NvbmZpZyBiL2RyaXZlcnMv
Z3B1L2RybS9tZXNvbi9LY29uZmlnCmluZGV4IGMyOGI2OWY0ODU1NS4uYTQ4MGU0YTgwYmVhIDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVzb24vS2NvbmZpZworKysgYi9kcml2ZXJzL2dw
dS9kcm0vbWVzb24vS2NvbmZpZwpAQCAtMTQsMyArMTQsNCBAQCBjb25maWcgRFJNX01FU09OX0RX
X0hETUkKIAlkZXBlbmRzIG9uIERSTV9NRVNPTgogCWRlZmF1bHQgeSBpZiBEUk1fTUVTT04KIAlz
ZWxlY3QgRFJNX0RXX0hETUkKKwlpbXBseSBEUk1fRFdfSERNSV9JMlNfQVVESU8KLS0gCjIuMjAu
MQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
