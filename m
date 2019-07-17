Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC37E6BD9A
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jul 2019 15:50:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ACEA89AE6;
	Wed, 17 Jul 2019 13:50:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F08326E180
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jul 2019 08:33:54 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id i2so11603887plt.1
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jul 2019 01:33:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Iwx8d0RGJRMbsUh5MH2Q2PhdCBXrR+QSvVmkF9EObNI=;
 b=f0M0YhFIuRdinLSneBgpKT+b4frlQCXHAz8fdt0DdKWnn71+SEIvzOhfN5HkCHJbtg
 mIikf8WllklRRmLOe/bZurDRfigi10pdZl76Mx9FUbA68We+3U2+IO8bgCaQfOFWQQin
 yFokBruUxJb9qChYssaUIYzjj7TfJLTCGmWacEOAVh9+ShNJz/suWXBmF7v/fr+EJQLz
 lDWgchBn6ujWjSHAGNyadIFQMk3UU1oWUWb+uvOPD7pWBzLTrqk7yPWr1sMGKOYA1stW
 6Gjtd1M5t5WDTaHKmriTe375O4fsYwjmQqvR+TbQmrt7EWe/8Y2uDwjFBILgH+mIbnk+
 VgGw==
X-Gm-Message-State: APjAAAVZ8e8wnP7Bs9xbh11vtGKpUfSS95YAT1FB3agGddnMQb/FGJC0
 f3HZ47u4SBpJE7bKm+HTebTU6Q==
X-Google-Smtp-Source: APXvYqwca1yGfzgDVKjSr7q4qrti7DaSd7VKgHhWePyggYEHnIDdCbOEu9LujfkOwBuEBZ2NWDHJFA==
X-Received: by 2002:a17:902:3181:: with SMTP id
 x1mr40824727plb.135.1563352434649; 
 Wed, 17 Jul 2019 01:33:54 -0700 (PDT)
Received: from localhost ([2401:fa00:1:b:e688:dfd2:a1a7:2956])
 by smtp.gmail.com with ESMTPSA id b1sm22020443pfi.91.2019.07.17.01.33.51
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 17 Jul 2019 01:33:54 -0700 (PDT)
From: Cheng-Yi Chiang <cychiang@chromium.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v5 3/5] drm: dw-hdmi-i2s: Use fixed id for codec device
Date: Wed, 17 Jul 2019 16:33:25 +0800
Message-Id: <20190717083327.47646-4-cychiang@chromium.org>
X-Mailer: git-send-email 2.22.0.510.g264f2c817a-goog
In-Reply-To: <20190717083327.47646-1-cychiang@chromium.org>
References: <20190717083327.47646-1-cychiang@chromium.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 17 Jul 2019 13:50:42 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Iwx8d0RGJRMbsUh5MH2Q2PhdCBXrR+QSvVmkF9EObNI=;
 b=F73HcBqrBdoliIS0TswjZsyoSTqV3pr2Ql2l/+xRVG6vho0qliFDVTHs//UMlQounu
 kEc4t3ESghyIZxz4hI2DjAdn2PYy6Oil5zMAepaL1RrirWnjneNK4E+B4sYNLYJgquCv
 S4jUygxjiyQWrQTWl4lWN1R5b/Et1sgk6xOm8=
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
ZGV4IGNhNTY3ODNmYWU0Ny4uYmM2MDhmOTI1OGJlIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWktaTJzLWF1ZGlvLmMKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1pLWkycy1hdWRpby5jCkBAIC0xMzUsNyArMTM1LDcg
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
CiBzdGF0aWMgc3RydWN0IHNuZF9zb2NfZGFpX2xpbmsgcmtfZGFpbGluayA9IHsKLS0gCjIuMjIu
MC41MTAuZzI2NGYyYzgxN2EtZ29vZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
