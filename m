Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 110E99E1BF
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2019 10:14:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F136890EF;
	Tue, 27 Aug 2019 08:14:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC5E789915
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2019 08:14:32 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id f72so2043531wmf.5
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2019 01:14:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vESqQdKKmtjJu0iF9bZQdLNZv1Sk8fyWyDEwOtz2JiU=;
 b=GJHy14N2+AOBrw65GsHknPCizDGhkdBYOannfJqV4WjI2wDWsmKTnmh3BFY+RRBu36
 1OUoXXMetss7mdMcFWmzTJQ2fURQpwcSs3fX3CSjjp3QXK0qyGVvbQKq/e2SZ5c+x/6h
 +eNq5wsKx6tJa+ujQgYP3p4ypQwQV4aIq/8voNsSdWegkeVvxnBQpWEKcJKwG8VEvR7q
 ECWb5pT2IfWM7eux5ohk7FVkZmE/2RvAxLOh1g7v5H+DSkYB0zZZFioTuMU37/dEDGjc
 nGGczC9SIgb/7V5VQ0ccku+cKp4mwl9oP7BYj8hPLdSFhn5pSXhb+10brvxItmOG2LYj
 4P3w==
X-Gm-Message-State: APjAAAXKyW6XFSli07JSr3rPGIyU5vODFi5CzW4gEJK2kaNewDPQBogS
 +LoQjEvTSr0BJejXpC79NkSxyw==
X-Google-Smtp-Source: APXvYqxTGusXca11jahXo+oITqWlzpLMh6fmhYKtqYvBOkcJ/84U7plQRFYWEGH2K3ihPVh6YMaQ4g==
X-Received: by 2002:a7b:cd17:: with SMTP id f23mr27433268wmj.177.1566893671411; 
 Tue, 27 Aug 2019 01:14:31 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id f18sm11911792wrx.85.2019.08.27.01.14.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Aug 2019 01:14:30 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: a.hajda@samsung.com, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@siol.net, boris.brezillon@collabora.com
Subject: [PATCH RFC v2 4/8] drm/meson: dw-hdmi: stop enforcing input_bus_format
Date: Tue, 27 Aug 2019 10:14:21 +0200
Message-Id: <20190827081425.15011-5-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190827081425.15011-1-narmstrong@baylibre.com>
References: <20190827081425.15011-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vESqQdKKmtjJu0iF9bZQdLNZv1Sk8fyWyDEwOtz2JiU=;
 b=MTLfRB14y+Jjwbv24sKyqUJ2bNmWeIKurBYz/VL9f2aDLLCwuvDlny5d9hxfbjVCkw
 97dN0mB0D2XtfkKwbZ7DxuA//5S+FnGHZD0dHBsS6aXhepStpMj8+RQetHiWvhNJRNxK
 Xgwby2bxMPoETHjhng1TYYPoW1gceWkfmrFbsqIRIh/eQak0m+8d65qSMWj23WF3A7X2
 PTrkIW92lGHMd6NGkfxkHR4EpkhT5Lm7QLAfB51Qs0Pyq275LyepBiOteR3Ec9O58lSV
 dQ6lV/nk3DqPUUQeSt+LTtawdfDTkZDkbTsxamymatQZH6XIXtLDsbxjGPR1f9ZE713l
 yBWA==
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
eCAzMzM1ODNlZjNhYjkuLjlhZTI0Y2M1ZmFhMiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L21lc29uL21lc29uX2R3X2hkbWkuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25f
ZHdfaGRtaS5jCkBAIC0xMDA3LDcgKzEwMDcsNiBAQCBzdGF0aWMgaW50IG1lc29uX2R3X2hkbWlf
YmluZChzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBkZXZpY2UgKm1hc3RlciwKIAlkd19wbGF0
X2RhdGEtPnBoeV9vcHMgPSAmbWVzb25fZHdfaGRtaV9waHlfb3BzOwogCWR3X3BsYXRfZGF0YS0+
cGh5X25hbWUgPSAibWVzb25fZHdfaGRtaV9waHkiOwogCWR3X3BsYXRfZGF0YS0+cGh5X2RhdGEg
PSBtZXNvbl9kd19oZG1pOwotCWR3X3BsYXRfZGF0YS0+aW5wdXRfYnVzX2Zvcm1hdCA9IE1FRElB
X0JVU19GTVRfWVVWOF8xWDI0OwogCWR3X3BsYXRfZGF0YS0+aW5wdXRfYnVzX2VuY29kaW5nID0g
VjRMMl9ZQ0JDUl9FTkNfNzA5OwogCiAJcGxhdGZvcm1fc2V0X2RydmRhdGEocGRldiwgbWVzb25f
ZHdfaGRtaSk7Ci0tIAoyLjIyLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
