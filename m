Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F40D5B742B
	for <lists+dri-devel@lfdr.de>; Thu, 19 Sep 2019 09:35:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D74186ECB3;
	Thu, 19 Sep 2019 07:35:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BDC96EE4B
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Sep 2019 08:25:15 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id t11so2790302plo.0
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Sep 2019 01:25:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VKl0NI5uuTzXRMlZIfLK2DJ9dA76CcXi+wvYjjhfeJ4=;
 b=k5MkdE2tU9AAdoMOFLBLhx6W9gnpfwpILa6a/v8q4HkKs3qWeQfqz0z+HkKQlOsLSa
 fR+M3c5YlpXm83BOMGSeE008X7UaFRHsQuZZm2a+WEvkUiQdaDFotfISoakMeV96ZYLa
 ItPC6OY7dpOCgSnisMiL/ectbGrAjwHml2K+h9x0aNNi7AEZa9t1u1wP8Jqa2S+HhmLK
 sGz35coxgGQXMt9qYwcY28rRo/7i+Rv/i1Xv9pHLARVprR1QE+6FdjEKzi0UMOweFC9S
 I/V5mVZJmVsX+B9tPS8dfh34cgxwlZ7lEWYZzndOP+1p/93e6laCcw0D9DHdWwPt0Egx
 ah4w==
X-Gm-Message-State: APjAAAUbOAabar5XhP8gaapIqJvG4h/LLxfG78+bHZpoFNnghxw5ESL4
 cuEVyh0TM5aZCG2PfFFkQChgoQ==
X-Google-Smtp-Source: APXvYqzayEko5q8A495MmFMU31IxcUPuZcsYT8Q3ERIy5jSSRpRvbSnJkE1FFghYilaSJdpwBGfTCA==
X-Received: by 2002:a17:902:ba95:: with SMTP id
 k21mr3061713pls.80.1568795114731; 
 Wed, 18 Sep 2019 01:25:14 -0700 (PDT)
Received: from localhost ([2401:fa00:1:10:79b4:bd83:e4a5:a720])
 by smtp.gmail.com with ESMTPSA id y28sm8689470pfq.48.2019.09.18.01.25.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Sep 2019 01:25:13 -0700 (PDT)
From: Cheng-Yi Chiang <cychiang@chromium.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v6 0/4] Add HDMI jack support on RK3288
Date: Wed, 18 Sep 2019 16:24:56 +0800
Message-Id: <20190918082500.209281-1-cychiang@chromium.org>
X-Mailer: git-send-email 2.23.0.237.gc6a4ce50a0-goog
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 19 Sep 2019 07:35:45 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VKl0NI5uuTzXRMlZIfLK2DJ9dA76CcXi+wvYjjhfeJ4=;
 b=QjtMNatKQcwth+X0GKHkr+Z2zJz6zbi9oKCgR26mEnXpfoUjWiImm9bASZSwNJTdA7
 2sYwbfAxoZKJIti+khkPv+rHKQ/aqRnzVaaVyCAV9sxHcFnNpVTLVkNumDYo8RwYrBU6
 qQ5EfggIIMUwE/rxyvwKGoh69y/Hl9FmhmtWE=
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

VGhpcyBwYXRjaCBzZXJpZXMgc3VwcG9ydHMgSERNSSBqYWNrIHJlcG9ydGluZyBvbiBSSzMyODgs
IHdoaWNoIHVzZXMKRFJNIGR3LWhkbWkgZHJpdmVyIGFuZCBoZG1pLWNvZGVjIGNvZGVjIGRyaXZl
ci4KClRoZSBwcmV2aW91cyBkaXNjdXNzaW9uIGFib3V0IHJlcG9ydGluZyBqYWNrIHN0YXR1cyB1
c2luZyBoZG1pLW5vdGlmaWVyCmFuZCBkcm1fYXVkaW9fY29tcG9uZW50IGlzIGF0CgpodHRwczov
L2xvcmUua2VybmVsLm9yZy9wYXRjaHdvcmsvcGF0Y2gvMTA4MzAyNy8KClRoZSBuZXcgYXBwcm9h
Y2ggaXMgdG8gdXNlIGEgY2FsbGJhY2sgbWVjaGFuaXNtIHRoYXQgaXMKc3BlY2lmaWMgdG8gaGRt
aS1jb2RlYy4KClRoZSBkZXBlbmRlbnQgY2hhbmdlIG9uIGhkbWktY29kZWMuYwoKaHR0cHM6Ly9w
YXRjaHdvcmsua2VybmVsLm9yZy9wYXRjaC8xMTA0NzQ0NwoKaGFzIGJlZW4gcGlja2VkIHVwIGJ5
IE1hcmsgQnJvd24gaW4gQVNvQyB0cmVlIGZvci01LjQgYnJhbmNoLgoKQ2hhbmdlcyBmcm9tIHY1
IHRvIHY2OgoKMS4gUmVtb3ZlIHRoZSBwYXRjaCBmb3Igc291bmQvc29jL2NvZGVjcy9oZG1pLWNv
ZGVjLmMgYmVjYXVzZSBpdCBpcyBhY2NlcHRlZC4KMi4gUmViYXNlIHRoZSByZXN0IG9mIHBhdGNo
ZXMgYmFzZWQgb24gZHJtLW1pc2MtbmV4dCB0cmVlLgoKQ2hlbmctWWkgQ2hpYW5nICg0KToKICBk
cm06IGJyaWRnZTogZHctaGRtaTogUmVwb3J0IGNvbm5lY3RvciBzdGF0dXMgdXNpbmcgY2FsbGJh
Y2sKICBkcm06IGR3LWhkbWktaTJzOiBVc2UgZml4ZWQgaWQgZm9yIGNvZGVjIGRldmljZQogIEFT
b0M6IHJvY2tjaGlwX21heDk4MDkwOiBBZGQgZGFpX2xpbmsgZm9yIEhETUkKICBBU29DOiByb2Nr
Y2hpcF9tYXg5ODA5MDogQWRkIEhETUkgamFjayBzdXBwb3J0CgogLi4uL2RybS9icmlkZ2Uvc3lu
b3BzeXMvZHctaGRtaS1pMnMtYXVkaW8uYyAgIHwgIDEzICstCiBkcml2ZXJzL2dwdS9kcm0vYnJp
ZGdlL3N5bm9wc3lzL2R3LWhkbWkuYyAgICAgfCAgNDEgKysrKysrLQogaW5jbHVkZS9kcm0vYnJp
ZGdlL2R3X2hkbWkuaCAgICAgICAgICAgICAgICAgIHwgICA0ICsKIHNvdW5kL3NvYy9yb2NrY2hp
cC9LY29uZmlnICAgICAgICAgICAgICAgICAgICB8ICAgMyArLQogc291bmQvc29jL3JvY2tjaGlw
L3JrMzI4OF9oZG1pX2FuYWxvZy5jICAgICAgIHwgICAzICstCiBzb3VuZC9zb2Mvcm9ja2NoaXAv
cm9ja2NoaXBfbWF4OTgwOTAuYyAgICAgICAgfCAxMTYgKysrKysrKysrKysrKystLS0tCiA2IGZp
bGVzIGNoYW5nZWQsIDE1MyBpbnNlcnRpb25zKCspLCAyNyBkZWxldGlvbnMoLSkKCi0tIAoyLjIz
LjAuMjM3LmdjNmE0Y2U1MGEwLWdvb2cKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
