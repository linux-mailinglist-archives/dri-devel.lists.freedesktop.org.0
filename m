Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 413D660263
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jul 2019 10:41:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 904806E437;
	Fri,  5 Jul 2019 08:41:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8A346E3FC
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jul 2019 04:26:32 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id u14so2535781pfn.2
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Jul 2019 21:26:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ensoF4e5rXwj74hLBAIVZsxBBZL6nZ0Z+cRMEnh3LdU=;
 b=F7uzk/TB5A+eH5iMtFiCRb8R6i6J9xO1p1pkKVXZMZ8Kw6drwGUpeM5U/LZa6b+g93
 MZA0u5KcyIIXFI5atO8xZOggA3G6hAziKiUb3g11YBy81VFNvPtpTVj+iuw9ezO1AOaZ
 ix92NOhdNSKt+4pC/ibeBtQipnaRoxEx9wn9A2T6NIh3SqXcvTAUub3kEB0um/PYwQEn
 X+n0iwklqihmysQMpT5eqDweabkknxEg/klj60NxzDx8TOrLUughLFaT5DxlxGn/J7jn
 JVlll4hC6r4pR9aUujRjqj9iMHEL2V2bI9P0hha2y1Lde5vgs9XzK3YrPM/S2rYhHlwp
 VXRQ==
X-Gm-Message-State: APjAAAUofWIwXsqNdhBfRaPYKI+N/AEkd2jB/eEKOgbx/kCh3Hyobgv0
 /kifQozC7KHa0Tg9xuDmWaCahw==
X-Google-Smtp-Source: APXvYqyf2nrb7RrUXLJ76qJyQDgKtq5/C+VLUCT/21TfLnfPJ/m2mK68NmzbeQqbgUJDJTJaH+v/mQ==
X-Received: by 2002:a17:90a:e38f:: with SMTP id
 b15mr2098527pjz.85.1562300791713; 
 Thu, 04 Jul 2019 21:26:31 -0700 (PDT)
Received: from localhost ([2401:fa00:1:b:e688:dfd2:a1a7:2956])
 by smtp.gmail.com with ESMTPSA id q3sm6050507pgv.21.2019.07.04.21.26.27
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 04 Jul 2019 21:26:30 -0700 (PDT)
From: Cheng-Yi Chiang <cychiang@chromium.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] Add HDMI jack support on RK3288
Date: Fri,  5 Jul 2019 12:26:19 +0800
Message-Id: <20190705042623.129541-1-cychiang@chromium.org>
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 05 Jul 2019 08:41:21 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ensoF4e5rXwj74hLBAIVZsxBBZL6nZ0Z+cRMEnh3LdU=;
 b=FH7xwm41hWZcz/bAm+ebH7WH/5qVUe7aIauNjE+VqhgU4DONdUYDjR6z3/jLVCpfFL
 +ZyqOEs/+VQDuVAKFfcSwZkA8O1zp5vb1wdIIFfnHLEfwZVUyvh2eD1eewv/HY0dGTZy
 hOrcbDsGJEEK2DJUNTWxd/2vDfa0hfcJ7qHBs=
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

VGhpcyBwYXRjaCBzZXJpZXMgc3VwcG9ydHMgSERNSSBqYWNrIHJlcG9ydGluZyBvbiBSSzMyODgs
IHdoaWNoIHVzZXMKRFJNIGR3LWhkbWkgZHJpdmVyIGFuZCBoZG1pLWNvZGVjIGNvZGVjIGRyaXZl
ci4KClRoZSBwcmV2aW91cyBkaXNjdXNzaW9uIGFib3V0IHJlcG9ydGluZyBqYWNrIHN0YXR1cyB1
c2luZyBoZG1pLW5vdGlmaWVyCmFuZCBkcm1fYXVkaW9fY29tcG9uZW50IGlzIGF0CgpodHRwczov
L2xvcmUua2VybmVsLm9yZy9wYXRjaHdvcmsvcGF0Y2gvMTA4MzAyNy8KClRoZSBuZXcgYXBwcm9h
Y2ggaXMgdG8gdXNlIGEgY2FsbGJhY2sgbWVjaGFuaXNtIHRoYXQgaXMKc3BlY2lmaWMgdG8gaGRt
aS1jb2RlYy4KCkNoZW5nLVlpIENoaWFuZyAoNCk6CiAgQVNvQzogaGRtaS1jb2RlYzogQWRkIGFu
IG9wIHRvIHNldCBjYWxsYmFjayBmdW5jdGlvbiBmb3IgcGx1ZyBldmVudAogIGRybTogYnJpZGdl
OiBkdy1oZG1pOiBSZXBvcnQgY29ubmVjdG9yIHN0YXR1cyB1c2luZyBjYWxsYmFjawogIEFTb0M6
IHJvY2tjaGlwX21heDk4MDkwOiBBZGQgZGFpX2xpbmsgZm9yIEhETUkKICBBU29DOiByb2NrY2hp
cF9tYXg5ODA5MDogQWRkIEhETUkgamFjayBzdXBwb3J0CgogLi4uL2dwdS9kcm0vYnJpZGdlL3N5
bm9wc3lzL2R3LWhkbWktYXVkaW8uaCAgIHwgICAzICsKIC4uLi9kcm0vYnJpZGdlL3N5bm9wc3lz
L2R3LWhkbWktaTJzLWF1ZGlvLmMgICB8ICAxMCArKwogZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9z
eW5vcHN5cy9kdy1oZG1pLmMgICAgIHwgIDMyICsrKystCiBpbmNsdWRlL3NvdW5kL2hkbWktY29k
ZWMuaCAgICAgICAgICAgICAgICAgICAgfCAgMTYgKysrCiBzb3VuZC9zb2MvY29kZWNzL2hkbWkt
Y29kZWMuYyAgICAgICAgICAgICAgICAgfCAgNTIgKysrKysrKysKIHNvdW5kL3NvYy9yb2NrY2hp
cC9yb2NrY2hpcF9tYXg5ODA5MC5jICAgICAgICB8IDExMiArKysrKysrKysrKysrKy0tLS0KIDYg
ZmlsZXMgY2hhbmdlZCwgMjAxIGluc2VydGlvbnMoKyksIDI0IGRlbGV0aW9ucygtKQoKLS0gCjIu
MjIuMC40MTAuZ2Q4ZmRiZTIxYjUtZ29vZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
