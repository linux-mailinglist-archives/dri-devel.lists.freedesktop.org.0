Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECFEF959E3
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2019 10:41:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A6E66E7BC;
	Tue, 20 Aug 2019 08:41:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F9746E795
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2019 08:41:21 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id m125so1860036wmm.3
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2019 01:41:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jE5m0TfqElnaXCkHBFVwFbXc+R1MiIYDmSAYCCl3YU4=;
 b=P5CNyrOjsSo+SpVKmMJ5SJHhxCPDyVpr4MlF59s3pRxzShJUaAHnE8vZNTYIxDNXTZ
 ZFHKDBn1CHEZSP2p7jGKlCgTSF2cuQOfUmRZD9NgN6X2LtplhiROprhJFJQ89PvQY0bt
 566XBRsyHnjTw9lG7WyLHdSBHKgG8BQ4QZHO3sSZWdPeHK4ipZHnf/IxBAtvGN4Hpugk
 uaBLAKOQbaY1ltpF36ayAgUK8Ab/OhzBlA49TEdetwHd56Zt7i1HwRdskXF0CFTgtnIZ
 gKbQHUWc88Zie3RaKfbvM+iS6YFP1ZxlH/x1kcBPNNOLIu3jhXhST2F2Vt24z2+J3Ti/
 UbQA==
X-Gm-Message-State: APjAAAVbe/GLUviZ08rw1XgC1F66Qz/Fpt/4ZGA9ve1Jp18HMkuaUUp8
 RInkH+VIuoPYY2rDdyTgA/r6tA==
X-Google-Smtp-Source: APXvYqxz2QfYRtKrzranf4cVovpcdQcEZHLRNe8Ltpfp2/9EWb41HLsZFmalHz+UQINsNt8K92A/kQ==
X-Received: by 2002:a7b:c8cb:: with SMTP id f11mr24737137wml.138.1566290479876; 
 Tue, 20 Aug 2019 01:41:19 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id g2sm34275648wru.27.2019.08.20.01.41.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2019 01:41:18 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: a.hajda@samsung.com, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@siol.net, boris.brezillon@collabora.com
Subject: [RFC 06/11] drm/meson: dw-hdmi: stop enforcing input_bus_format
Date: Tue, 20 Aug 2019 10:41:04 +0200
Message-Id: <20190820084109.24616-7-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190820084109.24616-1-narmstrong@baylibre.com>
References: <20190820084109.24616-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jE5m0TfqElnaXCkHBFVwFbXc+R1MiIYDmSAYCCl3YU4=;
 b=MsWPu6jFBtdd3leXvljR+mIFouGHkKizVhM8iGdY2lNx+9fBmeUAh5kwBxAy3psYXD
 eeZn/5cjiwstKXDAQa92bAYcvYQCHFf18N2M/Txqe/D4sKuiTYCcgAZUtKaSowmsKaPt
 mdVUi9N1+X4Bw+OSzcfc47lWHTtLHpqJH51wVdWfwpcZabcoDhkWzAhae7/d+B2R+bYh
 o3xGHXuJA58v4Rqd1CMi26soJy6n3bV8vfnYZXwvcSuU1Gl42OmbDRfYO+bARdnDAi8W
 TslFqrIQDT1Jfw/forC72E95oxJ5jC1DERORG4AU1pMNuB/EG66TBPnhAMV+1l4pvgZ9
 R1aA==
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
 dri-devel@lists.freedesktop.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VG8gYWxsb3cgdXNpbmcgZm9ybWF0cyBmcm9tIG5lZ29jaWF0aW9uLCBzdG9wIGVuZm9yY2luZyBp
bnB1dF9idXNfZm9ybWF0CmluIHRoZSBwcml2YXRlIGR3LXBsYXQtZGF0YSBzdHJ1Y3QuCgpTaWdu
ZWQtb2ZmLWJ5OiBOZWlsIEFybXN0cm9uZyA8bmFybXN0cm9uZ0BiYXlsaWJyZS5jb20+Ci0tLQog
ZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29uX2R3X2hkbWkuYyB8IDEgLQogMSBmaWxlIGNoYW5n
ZWQsIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVz
b25fZHdfaGRtaS5jIGIvZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29uX2R3X2hkbWkuYwppbmRl
eCA5YTk5ZDM5MjA2MTAuLmZiMDk1OTJlYmEzZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L21lc29uL21lc29uX2R3X2hkbWkuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25f
ZHdfaGRtaS5jCkBAIC05NzUsNyArOTc1LDYgQEAgc3RhdGljIGludCBtZXNvbl9kd19oZG1pX2Jp
bmQoc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3QgZGV2aWNlICptYXN0ZXIsCiAJZHdfcGxhdF9k
YXRhLT5waHlfb3BzID0gJm1lc29uX2R3X2hkbWlfcGh5X29wczsKIAlkd19wbGF0X2RhdGEtPnBo
eV9uYW1lID0gIm1lc29uX2R3X2hkbWlfcGh5IjsKIAlkd19wbGF0X2RhdGEtPnBoeV9kYXRhID0g
bWVzb25fZHdfaGRtaTsKLQlkd19wbGF0X2RhdGEtPmlucHV0X2J1c19mb3JtYXQgPSBNRURJQV9C
VVNfRk1UX1lVVjhfMVgyNDsKIAlkd19wbGF0X2RhdGEtPmlucHV0X2J1c19lbmNvZGluZyA9IFY0
TDJfWUNCQ1JfRU5DXzcwOTsKIAogCXBsYXRmb3JtX3NldF9kcnZkYXRhKHBkZXYsIG1lc29uX2R3
X2hkbWkpOwotLSAKMi4yMi4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
