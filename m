Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89DAE82CA7
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2019 09:25:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E68A89F0B;
	Tue,  6 Aug 2019 07:24:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CE1C6E454
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2019 13:41:13 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id v15so74807981wml.0
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Aug 2019 06:41:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2grGK+7b0cBByVRRUu0+TFl4ki5jcSq2t6fD2bzIBcg=;
 b=LxpVpubsAc4l+MvG2BSO6WeLAfkwbAt12ue4rVGzc4Gnfw+TclPBb2Lqrum8EQpoDW
 gKSXMH5aCfhQRuDhdLogYaofRuyE7TQEasl5Y7B1mwuG7x6iOBe5HX7pNDzDsvy9m22J
 Aa1D22AnZ8ERXx/EFXOszeJCskxZ3WkUeTiXWgDf2wUqd0J5+DeyA0FdUO8E9TwGgRw1
 lcAu3JYLMJwJ1QoOktvz6XJdsa3uxJf7b78rUbOfECtmSONZHlYGDspVXkYBcCljsvz9
 0u52cpkBjx/bZg3zUmf9kL5auCFA4NESqqnRTfHGDqWpl/PapXOJTbxGTlPC2A67Mn5V
 4EYg==
X-Gm-Message-State: APjAAAWukS7r7UEvOxxYLOFzgfvVG3rekXmYu1+ev8dgFtvAtjSROrdI
 OivBvtrGf/42ISpwAQWnfyeemo5WhGs=
X-Google-Smtp-Source: APXvYqxCpcovHfHjK57i7gHO5E0iPm5URGttLvaapaIyenpv0N3qiZvBMVpLedY5JPKCE562WeBNtg==
X-Received: by 2002:a1c:a7c6:: with SMTP id
 q189mr19275733wme.146.1565012471772; 
 Mon, 05 Aug 2019 06:41:11 -0700 (PDT)
Received: from starbuck.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id w7sm99040534wrn.11.2019.08.05.06.41.10
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 05 Aug 2019 06:41:10 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 5/8] drm/bridge: dw-hdmi-i2s: set the channel allocation
Date: Mon,  5 Aug 2019 15:40:59 +0200
Message-Id: <20190805134102.24173-6-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190805134102.24173-1-jbrunet@baylibre.com>
References: <20190805134102.24173-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-Mailman-Approved-At: Tue, 06 Aug 2019 07:24:35 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2grGK+7b0cBByVRRUu0+TFl4ki5jcSq2t6fD2bzIBcg=;
 b=XY6BtsEB1h0Gtg+bL5p1xMMozbLebyArx8o4E98A64UfAQwGnp5hTTSwxO3wBSrqNs
 sjtDhqO4sss6ywReivGGAP6VbBnP2qbrBZ5RDcxsWDX2P+Q9CaAIWgOrJZQHEH+twJPE
 C/kxG+bLpg59JjLS7HcM/K2Pehm7/j8fiXU6UnxOoJr101ja8u28RuDLs8CT+zvN5Rvg
 2Ns0saVhFskKwefkeTaCx8x6mDEL08r4MclXBIMcTbDgbjKDJp0E1Nz+mXzDNqVCTsRy
 fUbTPcQbKGuYauyamy2q/FlnfnOy4z8lWR0PNpP7fonXJu8qTymVLyzDNFJJVjFG2kGu
 yZyg==
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
Cc: Jonas Karlman <jonas@kwiboo.se>, Kevin Hilman <khilman@baylibre.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

c2V0dXAgdGhlIGNoYW5uZWwgYWxsb2NhdGlvbiBwcm92aWRlZCBieSB0aGUgZ2VuZXJpYyBoZG1p
LWNvZGVjIGRyaXZlcgoKQ2M6IEpvbmFzIEthcmxtYW4gPGpvbmFzQGt3aWJvby5zZT4KU2lnbmVk
LW9mZi1ieTogSmVyb21lIEJydW5ldCA8amJydW5ldEBiYXlsaWJyZS5jb20+Ci0tLQogZHJpdmVy
cy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1pLWkycy1hdWRpby5jIHwgMSArCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
YnJpZGdlL3N5bm9wc3lzL2R3LWhkbWktaTJzLWF1ZGlvLmMgYi9kcml2ZXJzL2dwdS9kcm0vYnJp
ZGdlL3N5bm9wc3lzL2R3LWhkbWktaTJzLWF1ZGlvLmMKaW5kZXggY2FmOGFlZDc4ZmVhLi4wODY0
ZGVlOGQxODAgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHct
aGRtaS1pMnMtYXVkaW8uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3
LWhkbWktaTJzLWF1ZGlvLmMKQEAgLTg1LDYgKzg1LDcgQEAgc3RhdGljIGludCBkd19oZG1pX2ky
c19od19wYXJhbXMoc3RydWN0IGRldmljZSAqZGV2LCB2b2lkICpkYXRhLAogCiAJZHdfaGRtaV9z
ZXRfc2FtcGxlX3JhdGUoaGRtaSwgaHBhcm1zLT5zYW1wbGVfcmF0ZSk7CiAJZHdfaGRtaV9zZXRf
Y2hhbm5lbF9jb3VudChoZG1pLCBocGFybXMtPmNoYW5uZWxzKTsKKwlkd19oZG1pX3NldF9jaGFu
bmVsX2FsbG9jYXRpb24oaGRtaSwgaHBhcm1zLT5jZWEuY2hhbm5lbF9hbGxvY2F0aW9uKTsKIAog
CWhkbWlfd3JpdGUoYXVkaW8sIGlucHV0Y2xrZnMsIEhETUlfQVVEX0lOUFVUQ0xLRlMpOwogCWhk
bWlfd3JpdGUoYXVkaW8sIGNvbmYwLCBIRE1JX0FVRF9DT05GMCk7Ci0tIAoyLjIxLjAKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
