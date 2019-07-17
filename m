Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A0BD6BDA0
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jul 2019 15:50:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3F976E19C;
	Wed, 17 Jul 2019 13:50:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBC036E180
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jul 2019 08:33:34 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id i189so10479407pfg.10
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jul 2019 01:33:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xi/I3CroR7sIGb/RSMeX63hsRQQZqTXzOZE3S6HZ8ZY=;
 b=gLYi+jDNVa9xz230+zJt7vjhYYnwJp2NeYsICLEvemJYm/U6ziONYSIsyfwkO0dA75
 CQWxuwmjblEgXuRTv5Tqg6Ja1+uRqQxk6JVu7QjkyP1Z1n2yZU016HtSU9VAwP/5y+i7
 GOf5hLiY421kjnQDxrzCHPyKU1gslvzlWSNia1rT/oiOFms4oBp9g+sDrixWrhJALyhD
 RSzBoBHZnvlpQ+yhjDiLLKXdrgiVu/j/0z+nVPTQwfACLMgrKsHNVJE25D8aorA5Qg4y
 mkajP0ghHeyhjF91OKrLe/Slk/lB/e0r4sbJqYAtnBRHoqDQbrIykmsGjECIT0UMizSN
 EypA==
X-Gm-Message-State: APjAAAXO+T0GHkVZ/ktZg+1QhrhB8xfQlqyifh5w2+pRUZpNphqHz4sK
 UUphgNxvwtx7kvzi54y0hijdpg==
X-Google-Smtp-Source: APXvYqzYyxaOAPwCDczy1nF4W7TyzTBcE11lWgiyzwF6LECNndF7weCTc6ymyZwVNBlIDSpFxsBrbA==
X-Received: by 2002:a63:506:: with SMTP id 6mr39061533pgf.434.1563352414509;
 Wed, 17 Jul 2019 01:33:34 -0700 (PDT)
Received: from localhost ([2401:fa00:1:b:e688:dfd2:a1a7:2956])
 by smtp.gmail.com with ESMTPSA id r2sm33193385pfl.67.2019.07.17.01.33.30
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 17 Jul 2019 01:33:33 -0700 (PDT)
From: Cheng-Yi Chiang <cychiang@chromium.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/5] Add HDMI jack support on RK3288
Date: Wed, 17 Jul 2019 16:33:22 +0800
Message-Id: <20190717083327.47646-1-cychiang@chromium.org>
X-Mailer: git-send-email 2.22.0.510.g264f2c817a-goog
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 17 Jul 2019 13:50:42 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xi/I3CroR7sIGb/RSMeX63hsRQQZqTXzOZE3S6HZ8ZY=;
 b=RD8M6nunAIi1kjnoYpVPNjZL741NzPqIoh1uWt5E5r6urvKBD5w/QXtHFHOWkKP7rU
 eDsE9C26mS+c6F9BsjN7Sldy2EKwIdp+wSVCSX2fTTKK8nRLbbtA6GlxK16zRW/fm06H
 NZfy1y4+ZGSX3EopmPRAj88diV1ho2PkxjqX8=
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
aS1jb2RlYy4KCkNoYW5nZXMgZnJvbSB2NCB0byB2NToKLSBzeW5vcHN5cy9LY29uZmlnOiBSZW1v
dmUgdGhlIGluY29ycmVjdCBkZXBlbmRlbmN5IGNoYW5nZSBpbiB2NC4KLSByb2NrY2hpcC9LY29u
ZmlnOiBBZGQgZGVwZW5kZW5jeSBvZiBoZG1pLWNvZGVjIHdoZW4gaXQgaXMgcmVhbGx5IG5lZWQK
ICBmb3IgamFjayBzdXBwb3J0LgoKQ2hlbmctWWkgQ2hpYW5nICg1KToKICBBU29DOiBoZG1pLWNv
ZGVjOiBBZGQgYW4gb3AgdG8gc2V0IGNhbGxiYWNrIGZ1bmN0aW9uIGZvciBwbHVnIGV2ZW50CiAg
ZHJtOiBicmlkZ2U6IGR3LWhkbWk6IFJlcG9ydCBjb25uZWN0b3Igc3RhdHVzIHVzaW5nIGNhbGxi
YWNrCiAgZHJtOiBkdy1oZG1pLWkyczogVXNlIGZpeGVkIGlkIGZvciBjb2RlYyBkZXZpY2UKICBB
U29DOiByb2NrY2hpcF9tYXg5ODA5MDogQWRkIGRhaV9saW5rIGZvciBIRE1JCiAgQVNvQzogcm9j
a2NoaXBfbWF4OTgwOTA6IEFkZCBIRE1JIGphY2sgc3VwcG9ydAoKIC4uLi9kcm0vYnJpZGdlL3N5
bm9wc3lzL2R3LWhkbWktaTJzLWF1ZGlvLmMgICB8ICAxMyArLQogZHJpdmVycy9ncHUvZHJtL2Jy
aWRnZS9zeW5vcHN5cy9kdy1oZG1pLmMgICAgIHwgIDQxICsrKysrKy0KIGluY2x1ZGUvZHJtL2Jy
aWRnZS9kd19oZG1pLmggICAgICAgICAgICAgICAgICB8ICAgNCArCiBpbmNsdWRlL3NvdW5kL2hk
bWktY29kZWMuaCAgICAgICAgICAgICAgICAgICAgfCAgMTcgKysrCiBzb3VuZC9zb2MvY29kZWNz
L2hkbWktY29kZWMuYyAgICAgICAgICAgICAgICAgfCAgNDYgKysrKysrKwogc291bmQvc29jL3Jv
Y2tjaGlwL0tjb25maWcgICAgICAgICAgICAgICAgICAgIHwgICAzICstCiBzb3VuZC9zb2Mvcm9j
a2NoaXAvcmszMjg4X2hkbWlfYW5hbG9nLmMgICAgICAgfCAgIDMgKy0KIHNvdW5kL3NvYy9yb2Nr
Y2hpcC9yb2NrY2hpcF9tYXg5ODA5MC5jICAgICAgICB8IDExNiArKysrKysrKysrKysrKy0tLS0K
IDggZmlsZXMgY2hhbmdlZCwgMjE2IGluc2VydGlvbnMoKyksIDI3IGRlbGV0aW9ucygtKQoKLS0g
CjIuMjIuMC41MTAuZzI2NGYyYzgxN2EtZ29vZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
