Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E7242384B
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2019 15:38:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56DF189295;
	Mon, 20 May 2019 13:37:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BB308928D
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2019 13:37:58 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id f8so8259026wrt.1
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2019 06:37:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=I6G0MyMU3h5OB0O4nHOQOZaH9nZxvNQnPCN8hItt310=;
 b=q/V8Dw+rwnuaRd/cUKqcWGG7eVhEcys7SllGQWcUeLkiUiuLwzAR+rda8OTBNWlt1u
 EsvVNTZ5069peFmzTCjL9uojQ1efU1hPXwyedHBl2CZ2zamqvGMrjYST/XTKmUkwIUTF
 0ziU1SBI1BIGqTkuvA2IM4bUKHvCM9lC76ENUDjBDFioVQmSzLJm/X+ZzrAKzIb1i3uQ
 I87Jh5GSrRmP8XJlpbOXKR9H5OF9x1T11I0wHbFcvJkYgkO1WMwxlk4xntA24Ung/Iiq
 Dxc8+WzXOVuhdR+JRgcDuUN6x4jEvfbwsQ7OeAycwtKnY7nktQD2m2jeo/26ft6OmVvO
 0S7g==
X-Gm-Message-State: APjAAAXZyGlJZs6MqCXP3DT4LD8DB5ny46mBwd6MfqfjDK0o3rDLcfVp
 s9ZbDE8uTHO89LgbYGJ3fM8FVA==
X-Google-Smtp-Source: APXvYqyUsx6BWDMbs6M/qDpPzB1MW+xaQ5meKg2UcdD2zHeFLRipUXrqqBZ2pzKqNcgOvybYHGCFKA==
X-Received: by 2002:adf:e845:: with SMTP id d5mr18649788wrn.154.1558359476773; 
 Mon, 20 May 2019 06:37:56 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id t19sm12167059wmi.42.2019.05.20.06.37.55
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 20 May 2019 06:37:56 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: a.hajda@samsung.com,
	Laurent.pinchart@ideasonboard.com
Subject: [PATCH 0/5] drm/meson: Add support for HDMI2.0 YUV420 4k60
Date: Mon, 20 May 2019 15:37:48 +0200
Message-Id: <20190520133753.23871-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=I6G0MyMU3h5OB0O4nHOQOZaH9nZxvNQnPCN8hItt310=;
 b=Wu/evQfLtHMDRV7nVLyUt9S+NgZOjI0Xpdpf7vk+eLfcfhsI4H8ZD8fg/9is2Heb83
 1iECSj30NX8xy9OQXoOApX7n+lsgz70UoK4txOLhlg2cWvAabO88f0mo/itWsp5Oo1Fo
 k25caGap24naJPEvMoSo1VfTPA6broJ53cy3iY0rnatOlDLOjH5554AZ3HLVlmiN+v+T
 ZEb4p9IPO/9/a+EPo9C7EAAvscMQnIeLCYseDB+rJWbqOf0kbvHXrSKDwbJt2YDDcv5p
 +JPVRDikhVtu9pGNIN/Zill4tpS+6swH5OKWVdyV3M1SGFo0V6NELkfibFcjUaJveo0b
 W+hQ==
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
Cc: jernej.skrabec@siol.net, Neil Armstrong <narmstrong@baylibre.com>,
 maxime.ripard@bootlin.com, jonas@kwiboo.se, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, hverkuil@xs4all.nl,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIFN5bm9wc3lzIERXLUhETUkgQ1NDIGRvZXMgbm90IHN1cHBvcnQgZG93bnNhbXBsaW5nIHRv
IFlVVjQyMCwgc28KdGhlIGVuY29kZXIgbXVzdCBkb3duc2FtbGUgYmVmb3JlLCBmZWVkaW5nIHRo
ZSBjb250cm9sbGVyIHdpdGggYSBZVVY0MjAKcGl4ZWwgc3RyZWFtLgoKVGhlIGVuY29kZXIgbXVz
dCBkZWNsYXJlIHRoZSBuZXcgYnVzIGZvcm1hdCBlbmMgZW5jb2RpbmcgdGhlIGJyaWRnZSwgaW4K
b3JkZXIgdG8gdGFrZSBpdCBpbiBhY2NvdW50LgoKVG8gc29sdmUgdGhpcywgYSBuZXcgZm9ybWF0
X3NldCgpIGJyaWRnZSBvcCBpcyBhZGRlZCwgcGVybWl0dGluZyBzZXR0aW5nCmEgbmV3IGlucHV0
IGJ1cyBmb3JtYXQgYW5kIGVuY29kaW5nIHRvIHRoZSBicmlkZ2UgY2hhaW4uCgpUaGlzIHNvbHZl
cyBZVVY0MjAgc2V0dXAsIGJ1dCBhbHNvIHNvbHZlZCBzZXR0aW5nIDEwYml0LCAxMmJpdCBvciAx
NmJpdAppbnB1dCBidXMgZm9ybWF0IGluIG9yZGVyIHRvIHN1cHBvcnQgSERNSSA+OGJpdCBkZXB0
aHMuCgpUaGUgRFctSERNSSBjb250cm9sbGVyIGlzIHVwZGF0ZWQgdG8gZHluYW1pY2FsbHkgc2Vs
ZWN0IGEgY29oZXJlbnQgb3V0cHV0CmJ1cyBmb3JtYXQgZGVwZW5kaW5nIG9uIHRoZSBpbnB1dCBi
dXMgZm9ybWF0IGFuZCBvbiB0aGUgaW50ZXJuYWwgQ1NDCnN1cHBvcnRlZCBtb2Rlcy4KClRoZSBE
Vy1IRE1JIGlzIGFsc28gdXBkYXRlZCB0byBzdXBwb3J0IHRoZSBjb25uZWN0b3IgZGlzcGxheV9p
bmZvIGJ1c19mb3JtYXRzCmVudHJ5IHRvIHBlcm1pdCBmb3JjaW5nIGEgc3BlY2lmaWMgb3V0cHV0
IGJ1cyBmb3JtYXQgdG8gZm9yY2UsIGZvciBleGFtcGxlLAphbiBZVVY0NDQgb3V0cHV0IGZvcm1h
dCBpbnN0ZWFkIG9mIHRoZSBkZWZhdWx0IFJHQiBvdXRwdXQgYnVzIGZvcm1hdC4KCk9ubHkgdGhl
IG1lc29uIERSTSBkd19oZG1pIGdsdWUgYWxsb3dzIHljYmNyNDIwIG1vZGVzLCBzbyBubyBicmVh
a2FnZQppcyBleHBlY3RlZCBoZXJlLgoKVGhlIHJlbWFpbmluZyBwYXRjaGVzIGFkZHMgc3VwcG9y
dCBmb3IgNDoyOjAgb3V0cHV0IGFuZCBjbG9jayBzZXR1cCBmb3IKdGhlIG1lc29uIERXLUhETUkg
Z2x1ZSwgYW5kIGhvdyBZVVY0NDQgb3V0cHV0IGNhbiBiZSBmb3JjZWQuCgpDaGFuZ2VzIHNpbmNl
IHJmYzoKKiBGaXhlZCBzbWFsbCBsb2dpYyBlcnJvciBpbiBkcm1fYnJpZGdlX2Zvcm1hdF9zZXQo
KQoqIHJlYmFzZWQgb24gdjUuMi1yYzEKCk5laWwgQXJtc3Ryb25nICg1KToKICBkcm0vYnJpZGdl
OiBkdy1oZG1pOiBhbGxvdyB5Y2JjcjQyMCBtb2RlcyBmb3IgPj0gMHgyMDBhCiAgZHJtL2JyaWRn
ZTogYWRkIGVuY29kZXIgc3VwcG9ydCB0byBzcGVjaWZ5IGJyaWRnZSBpbnB1dCBmb3JtYXQKICBk
cm0vYnJpZGdlOiBkdy1oZG1pOiBBZGQgc3VwcG9ydCBmb3IgZHluYW1pYyBvdXRwdXQgZm9ybWF0
IHNldHVwCiAgZHJtL21lc29uOiBBZGQgWVVWNDIwIG91dHB1dCBzdXBwb3J0CiAgZHJtL21lc29u
OiBPdXRwdXQgaW4gWVVWNDQ0IGlmIHNpbmsgc3VwcG9ydHMgaXQKCiBkcml2ZXJzL2dwdS9kcm0v
YnJpZGdlL3N5bm9wc3lzL2R3LWhkbWkuYyB8IDEyNyArKysrKysrKysrKysrKysrKysrKy0tCiBk
cml2ZXJzL2dwdS9kcm0vZHJtX2JyaWRnZS5jICAgICAgICAgICAgICB8ICAzNSArKysrKysKIGRy
aXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl9kd19oZG1pLmMgICAgIHwgMTExICsrKysrKysrKysr
KysrKystLS0KIGRyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl92Y2xrLmMgICAgICAgIHwgIDkz
ICsrKysrKysrKysrKy0tLS0KIGRyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl92Y2xrLmggICAg
ICAgIHwgICA3ICstCiBkcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fdmVuYy5jICAgICAgICB8
ICAgNiArLQogZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29uX3ZlbmMuaCAgICAgICAgfCAgMTEg
KysKIGRyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl92ZW5jX2N2YnMuYyAgIHwgICAzICstCiBp
bmNsdWRlL2RybS9icmlkZ2UvZHdfaGRtaS5oICAgICAgICAgICAgICB8ICAgMSArCiBpbmNsdWRl
L2RybS9kcm1fYnJpZGdlLmggICAgICAgICAgICAgICAgICB8ICAxOSArKysrCiAxMCBmaWxlcyBj
aGFuZ2VkLCAzNTggaW5zZXJ0aW9ucygrKSwgNTUgZGVsZXRpb25zKC0pCgotLSAKMi4yMS4wCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
