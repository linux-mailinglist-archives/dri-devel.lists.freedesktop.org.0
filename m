Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AD538E67E
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2019 10:35:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DAA86E8D2;
	Thu, 15 Aug 2019 08:34:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 285956E4FF
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2019 12:07:35 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id g67so11547354wme.1
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2019 05:07:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1wxGGO+eJqHNHPL320ZApEdBEJuHkt1WmWaw3TLqcWg=;
 b=jcaQv3skudqlizn+Ma3j+asXuUMa2osqCaxH2YoY4A/WxIsvjG9Yl4y70EoP7/Orih
 k+jpHcxOGZtrm8UXFsWCtN7NuYw8ThTaEaWM2nTWyZX3df+PQ/VKx/FYeP1IbFtFn9fh
 3O55p1D38NqU/npo6zwltkUN2Lr+NmqulA8RLdOQfUlTSRGDEpbcDIdMrqqI6AKUa9hF
 ls4uITNIQYk/iZQS/XhzE6xYpaalleq6Gft1uE07zosI8jpsap2i1/vhyM7jbApgx50r
 hjtXLEgnKyV2hm8EUSezEJ/65rppj3BMH55iH04Sd9LqOQdDh7YdONbeQVBaJGS5k69i
 b8XA==
X-Gm-Message-State: APjAAAWutIXtutvCtgUEj8zP/PxGwj+95DTTkKVIggLLZhJSdgShsy5C
 Plrehqcv+xcTEbyIhsjUP3aHmA==
X-Google-Smtp-Source: APXvYqx9z2jQLFkDizV87BtrLYpHzdRxjWMpEtJKKyo9UUrpvSaOAgtLfuCnUIKtDmf5rpfXp8NLWA==
X-Received: by 2002:a1c:9d8c:: with SMTP id g134mr7473128wme.174.1565611653536; 
 Mon, 12 Aug 2019 05:07:33 -0700 (PDT)
Received: from starbuck.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id j9sm1883415wrx.66.2019.08.12.05.07.32
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 12 Aug 2019 05:07:33 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v2 4/8] drm/bridge: dw-hdmi-i2s: enable lpcm multi channels
Date: Mon, 12 Aug 2019 14:07:22 +0200
Message-Id: <20190812120726.1528-5-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190812120726.1528-1-jbrunet@baylibre.com>
References: <20190812120726.1528-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-Mailman-Approved-At: Thu, 15 Aug 2019 08:34:55 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1wxGGO+eJqHNHPL320ZApEdBEJuHkt1WmWaw3TLqcWg=;
 b=mj7VPqoP3QaypYZk5wdhlVro9KJGAVFvrtL+ktS1443PAbjOUKqGny5CD/pIW5bwl3
 By1MKtNas4S3X0b1lwcmcLVPc6255JAMYCn2iAraSMcyV4K1BbTH0G1SSb5cO4QVt+hD
 7bo0J0Rjcv/ydPYjs+WmXR64f7gXNpqVUx/3b6/+ynaviRLMmGPtlmvf6dyKfzSU3KPx
 yca4gQRCBh1PJ6440JPgr8bKQwOzWTbTmuRNmO1rdoCENmZzHLT6Wp2piNEN5PPokr0Q
 Kv9ujN38fe+RAP8cys4QHft3PyKqgD//+9PLkzVbz8jj/GxP+gsIN4pIpWPsAdxDKmtn
 WG9Q==
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

UHJvcGVybHkgc2V0dXAgdGhlIGNoYW5uZWwgY291bnQgYW5kIGxheW91dCBpbiBkdy1oZG1pIGky
cyBkcml2ZXIgc28Kd2UgYXJlIG5vdCBsaW1pdGVkIHRvIDIgY2hhbm5lbHMuCgpBbHNvIGNvcnJl
Y3QgdGhlIG1heGltdW0gY2hhbm5lbCByZXBvcnRlZCBieSB0aGUgREFJIGZyb20gNiB0byA4IGNo
CgpSZXZpZXdlZC1ieTogSm9uYXMgS2FybG1hbiA8am9uYXNAa3dpYm9vLnNlPgpTaWduZWQtb2Zm
LWJ5OiBKZXJvbWUgQnJ1bmV0IDxqYnJ1bmV0QGJheWxpYnJlLmNvbT4KLS0tCiBkcml2ZXJzL2dw
dS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWktaTJzLWF1ZGlvLmMgfCAzICsrLQogMSBmaWxl
IGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS1pMnMtYXVkaW8uYyBiL2RyaXZl
cnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS1pMnMtYXVkaW8uYwppbmRleCAyYjYy
NGNmZjU0MWQuLmNhZjhhZWQ3OGZlYSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRn
ZS9zeW5vcHN5cy9kdy1oZG1pLWkycy1hdWRpby5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlk
Z2Uvc3lub3BzeXMvZHctaGRtaS1pMnMtYXVkaW8uYwpAQCAtODQsNiArODQsNyBAQCBzdGF0aWMg
aW50IGR3X2hkbWlfaTJzX2h3X3BhcmFtcyhzdHJ1Y3QgZGV2aWNlICpkZXYsIHZvaWQgKmRhdGEs
CiAJfQogCiAJZHdfaGRtaV9zZXRfc2FtcGxlX3JhdGUoaGRtaSwgaHBhcm1zLT5zYW1wbGVfcmF0
ZSk7CisJZHdfaGRtaV9zZXRfY2hhbm5lbF9jb3VudChoZG1pLCBocGFybXMtPmNoYW5uZWxzKTsK
IAogCWhkbWlfd3JpdGUoYXVkaW8sIGlucHV0Y2xrZnMsIEhETUlfQVVEX0lOUFVUQ0xLRlMpOwog
CWhkbWlfd3JpdGUoYXVkaW8sIGNvbmYwLCBIRE1JX0FVRF9DT05GMCk7CkBAIC0xMzksNyArMTQw
LDcgQEAgc3RhdGljIGludCBzbmRfZHdfaGRtaV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNl
ICpwZGV2KQogCiAJcGRhdGEub3BzCQk9ICZkd19oZG1pX2kyc19vcHM7CiAJcGRhdGEuaTJzCQk9
IDE7Ci0JcGRhdGEubWF4X2kyc19jaGFubmVscwk9IDY7CisJcGRhdGEubWF4X2kyc19jaGFubmVs
cwk9IDg7CiAJcGRhdGEuZGF0YQkJPSBhdWRpbzsKIAogCW1lbXNldCgmcGRldmluZm8sIDAsIHNp
emVvZihwZGV2aW5mbykpOwotLSAKMi4yMS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
