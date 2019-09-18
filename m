Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06990B7434
	for <lists+dri-devel@lfdr.de>; Thu, 19 Sep 2019 09:36:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76BC76F9DE;
	Thu, 19 Sep 2019 07:35:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E88456EE4C
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Sep 2019 08:25:37 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id x6so1286887plv.6
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Sep 2019 01:25:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2Eb5XL2gtr4lJ5rnXLq6hKn2qsGsu9ixzGW23+oXREM=;
 b=JBm3CzjQChd+bCSV/X+KhXOQXIvRXbf98HYeYztjKZI45RUvD+jBWXySsPrkAEvDNx
 hYCR284rfc/I5rGIboyLp79fysyKnSe42yzL8i4sjZxEfdbWrcPhZgRFJbKXuvF8mxDR
 kR+96TgmVTFj+YSbzjZ/znoaECANg09psLWyBlPx5mgX9R2djCxancvLF4mR1zyhV3G7
 o3D9Hpc0kWfC/ccDLKiShYliIzA/J6UUxLBPceBM3stxWVYxOWD5ALdfGqRLVU5vvh5X
 jcx3wLEmGuP1DeMim7+HTiVfI5fx8QA8ieUYc20AVmxBAHs0xxzqLAULhWJiTaYn4b84
 XUqg==
X-Gm-Message-State: APjAAAX/8lDq1MmkokPQlPkqP0wiFxDqAF5EOuSIpyIu5KpG+eSewQuQ
 pIyLD69G6RdEQnm7HCpyW3oinQ==
X-Google-Smtp-Source: APXvYqzM/TpxahPcIuKv23Rn/8JiC6t53IiqwM74LdqF2XoFPdEjyVMQG3RRSMyebhB7yKmN9BcEww==
X-Received: by 2002:a17:902:8645:: with SMTP id
 y5mr2925331plt.191.1568795137579; 
 Wed, 18 Sep 2019 01:25:37 -0700 (PDT)
Received: from localhost ([2401:fa00:1:10:79b4:bd83:e4a5:a720])
 by smtp.gmail.com with ESMTPSA id w6sm8942501pfj.17.2019.09.18.01.25.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Sep 2019 01:25:36 -0700 (PDT)
From: Cheng-Yi Chiang <cychiang@chromium.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v6 2/4] drm: dw-hdmi-i2s: Use fixed id for codec device
Date: Wed, 18 Sep 2019 16:24:58 +0800
Message-Id: <20190918082500.209281-3-cychiang@chromium.org>
X-Mailer: git-send-email 2.23.0.237.gc6a4ce50a0-goog
In-Reply-To: <20190918082500.209281-1-cychiang@chromium.org>
References: <20190918082500.209281-1-cychiang@chromium.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 19 Sep 2019 07:35:45 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2Eb5XL2gtr4lJ5rnXLq6hKn2qsGsu9ixzGW23+oXREM=;
 b=PEfuM16PUwPuQWzTuJ9LxpdpmgZ6yikA7V4SMd2igAchZPFDw/qlLw/9mjo+liS0Ey
 0SEbcZEIRPFhPz4OACoNmUiypiHYUEK8SIZ1LvINDI/mYFIxaGWYG4hPXg2ev+B/kh+j
 kMMjde0JRZO+y1mz50zH/LklJuMwbFR6Kbb48=
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

VGhlIHByb2JsZW0gb2YgdXNpbmcgYXV0byBJRCBpcyB0aGF0IHRoZSBkZXZpY2UgbmFtZSB3aWxs
IGJlIGxpa2UKaGRtaS1hdWRpby1jb2RlYy48aWQgbnVtYmVyPi5hdXRvLgoKVGhlIG51bWJlciBt
aWdodCBiZSBjaGFuZ2VkIHdoZW4gdGhlcmUgYXJlIG90aGVyIHBsYXRmb3JtIGRldmljZXMgYmVp
bmcKY3JlYXRlZCBiZWZvcmUgaGRtaS1hdWRpby1jb2RlYyBkZXZpY2UuClVzZSBhIGZpeGVkIG5h
bWUgc28gbWFjaGluZSBkcml2ZXIgY2FuIHNldCBjb2RlYyBuYW1lIG9uIHRoZSBEQUkgbGluay4K
ClVzaW5nIHRoZSBmaXhlZCBuYW1lIHNob3VsZCBiZSBmaW5lIGJlY2F1c2UgdGhlcmUgd2lsbCBv
bmx5IGJlIG9uZQpoZG1pLWF1ZGlvLWNvZGVjIGRldmljZS4KCkZpeCB0aGUgY29kZWMgbmFtZSBp
biByb2NrY2hpcCByazMyODhfaGRtaV9hbmFsb2cgbWFjaGluZSBkcml2ZXIuCgpTaWduZWQtb2Zm
LWJ5OiBDaGVuZy1ZaSBDaGlhbmcgPGN5Y2hpYW5nQGNocm9taXVtLm9yZz4KLS0tCiBkcml2ZXJz
L2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWktaTJzLWF1ZGlvLmMgfCAyICstCiBzb3Vu
ZC9zb2Mvcm9ja2NoaXAvcmszMjg4X2hkbWlfYW5hbG9nLmMgICAgICAgICAgICAgfCAzICsrLQog
MiBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1pLWkycy1hdWRpby5j
IGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1pLWkycy1hdWRpby5jCmlu
ZGV4IGQ3ZTY1Yzg2OTQxNS4uODZiZDQ4MmI5Zjk0IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWktaTJzLWF1ZGlvLmMKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1pLWkycy1hdWRpby5jCkBAIC0xOTMsNyArMTkzLDcg
QEAgc3RhdGljIGludCBzbmRfZHdfaGRtaV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpw
ZGV2KQogCiAJbWVtc2V0KCZwZGV2aW5mbywgMCwgc2l6ZW9mKHBkZXZpbmZvKSk7CiAJcGRldmlu
Zm8ucGFyZW50CQk9IHBkZXYtPmRldi5wYXJlbnQ7Ci0JcGRldmluZm8uaWQJCT0gUExBVEZPUk1f
REVWSURfQVVUTzsKKwlwZGV2aW5mby5pZAkJPSBQTEFURk9STV9ERVZJRF9OT05FOwogCXBkZXZp
bmZvLm5hbWUJCT0gSERNSV9DT0RFQ19EUlZfTkFNRTsKIAlwZGV2aW5mby5kYXRhCQk9ICZwZGF0
YTsKIAlwZGV2aW5mby5zaXplX2RhdGEJPSBzaXplb2YocGRhdGEpOwpkaWZmIC0tZ2l0IGEvc291
bmQvc29jL3JvY2tjaGlwL3JrMzI4OF9oZG1pX2FuYWxvZy5jIGIvc291bmQvc29jL3JvY2tjaGlw
L3JrMzI4OF9oZG1pX2FuYWxvZy5jCmluZGV4IDc2NzcwMGMzNGVlMi4uODI4NjAyNWE4NzQ3IDEw
MDY0NAotLS0gYS9zb3VuZC9zb2Mvcm9ja2NoaXAvcmszMjg4X2hkbWlfYW5hbG9nLmMKKysrIGIv
c291bmQvc29jL3JvY2tjaGlwL3JrMzI4OF9oZG1pX2FuYWxvZy5jCkBAIC0xNSw2ICsxNSw3IEBA
CiAjaW5jbHVkZSA8bGludXgvZ3Bpby5oPgogI2luY2x1ZGUgPGxpbnV4L29mX2dwaW8uaD4KICNp
bmNsdWRlIDxzb3VuZC9jb3JlLmg+CisjaW5jbHVkZSA8c291bmQvaGRtaS1jb2RlYy5oPgogI2lu
Y2x1ZGUgPHNvdW5kL2phY2suaD4KICNpbmNsdWRlIDxzb3VuZC9wY20uaD4KICNpbmNsdWRlIDxz
b3VuZC9wY21fcGFyYW1zLmg+CkBAIC0xNDIsNyArMTQzLDcgQEAgc3RhdGljIGNvbnN0IHN0cnVj
dCBzbmRfc29jX29wcyBya19vcHMgPSB7CiBTTkRfU09DX0RBSUxJTktfREVGUyhhdWRpbywKIAlE
QUlMSU5LX0NPTVBfQVJSQVkoQ09NUF9FTVBUWSgpKSwKIAlEQUlMSU5LX0NPTVBfQVJSQVkoQ09N
UF9DT0RFQyhOVUxMLCBOVUxMKSwKLQkJCSAgIENPTVBfQ09ERUMoImhkbWktYXVkaW8tY29kZWMu
Mi5hdXRvIiwgImkycy1oaWZpIikpLAorCQkJICAgQ09NUF9DT0RFQyhIRE1JX0NPREVDX0RSVl9O
QU1FLCAiaTJzLWhpZmkiKSksCiAJREFJTElOS19DT01QX0FSUkFZKENPTVBfRU1QVFkoKSkpOwog
CiBzdGF0aWMgc3RydWN0IHNuZF9zb2NfZGFpX2xpbmsgcmtfZGFpbGluayA9IHsKLS0gCjIuMjMu
MC4yMzcuZ2M2YTRjZTUwYTAtZ29vZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
