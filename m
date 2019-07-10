Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BEB1642C7
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2019 09:26:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E742989CD9;
	Wed, 10 Jul 2019 07:25:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC589899E7
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2019 07:08:11 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id c73so625825pfb.13
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2019 00:08:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=l6Pj1C/JhLO9pIuL0o6GitOicJcsYgk0aas0LOHb1To=;
 b=f3FZ26Zsblg7iltgsM1JlRvzNnP9NGSFdFme8zl3IDGm/hFp0zQ8s+Zy/Xvigxz/80
 uBTuxM0TUUp04zS47gU7p27aht9OCyLF1GwMrumnyNHeCmpb9toAvP54QPeI/leerGg2
 kNzkfI0kDDS+VE1v25A7E9TKb/h4jmQzTUR1EAqpMtlSN2QCs5Gv1u0OOa0rWgRYFkld
 MeGfAp8AoGAhAVFBVkHGWQJpu2VXSwgWSXz6yQWeOwJSbKbvU9LrkMrY6FJ4htbcHsJj
 a7cmuTdjrl57lfL/KZwKrZJTtKt+F4XQQ4dLWvKZKW9MVjGu0ZSaBEvUeFgpZy6dW85d
 i7ig==
X-Gm-Message-State: APjAAAVPlTFZLx5cMxFf7GHqQvn2ndaA90ChH70IsNqVB6BLAm9kiXZZ
 YvuU1qAMyKs3MmNZJhtZQLfWzw==
X-Google-Smtp-Source: APXvYqyptBK3QFmyTbtCBUlG3BZ20BDJXUXcje4pWPJB6gSPNpTgfvwvrkqkt0izgOTaBRL2tpwJwQ==
X-Received: by 2002:a65:500d:: with SMTP id f13mr34874390pgo.151.1562742491443; 
 Wed, 10 Jul 2019 00:08:11 -0700 (PDT)
Received: from localhost ([2401:fa00:1:b:e688:dfd2:a1a7:2956])
 by smtp.gmail.com with ESMTPSA id h9sm1150976pgk.10.2019.07.10.00.08.07
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 10 Jul 2019 00:08:10 -0700 (PDT)
From: Cheng-Yi Chiang <cychiang@chromium.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/4] Add HDMI jack support on RK3288
Date: Wed, 10 Jul 2019 15:07:47 +0800
Message-Id: <20190710070751.260061-1-cychiang@chromium.org>
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 10 Jul 2019 07:25:19 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=l6Pj1C/JhLO9pIuL0o6GitOicJcsYgk0aas0LOHb1To=;
 b=QvHVOdXMpWGBXu6BQw2jb5hQWR/4IGqs4UNl0MT4bqGhu5Iajbok3zWGlXLBLlAlA9
 262x1usDPZZzrmJK/3Rcc1CmfG+FofUbFhNMjNYCW/5S2inZrI0tZc+5f/Yr3ArqOg1U
 UezUTifar1c9zaRSMgeuuMvYvOFH23m9ls4vM=
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
aS1jb2RlYy4KCkNoYW5nZXMgZnJvbSB2MSB0byB2MjoKLSBoZG1pLWNvZGVjLmM6IGNsZWFudXAg
dGhlIHNlcXVlbmNlIG9mIGhkbWlfY29kZWNfamFja19yZXBvcnQgYW5kCiAgaGRtaV9jb2RlY19z
ZXRfamFja19kZXRlY3QuCi0gZHctaGRtaS5jOiBjaGFuZ2UgYXJndW1lbnQgb2YgaGRtaV9jb2Rl
Y19wbHVnZ2VkX2NiIHNvIGl0IHRha2VzIGEgZ2VuZXJpYwogIGRldmljZSB3aGljaCBoYXMgaGRt
aV9jb2RlY19wcml2IGluIGl0cyBkcnZkYXRhLgotIGR3LWhkbWkuYzogYWRkIGEgaGVscGVyIGZ1
bmN0aW9uIGhhbmRsZV9wbHVnZ2VkX2NoYW5nZSB0byBjaGVjayBhdWRpbwogIHBsYXRmb3JtIGRl
dmljZSBhbmQgY29kZWMgcGxhdGZvcm0gZGV2aWNlIGJlZm9yZSBjYWxsaW5nIGNhbGxiYWNrLgot
IGR3LWhkbWktYzogYXZvaWQgc2V0dGluZyBjYWxsYmFjayBmdW5jdGlvbiBpZiBhdWRpbyBwbGF0
Zm9ybSBkZXZpY2Ugb3IKICBjb2RlYyBwbGF0Zm9ybSBkZXZpY2UgaXMgbWlzc2luZy4KLSByb2Nr
Y2hpcF9tYXg5ODA5MDogZml4IHRoZSBjaGVja2luZyBvZiByZXR1cm4gY29kZSB3aGVuIHNldHRp
bmcgc3lzY2xrCiAgb24gY3B1X2RhaSBhbmQgY29kZWNfZGFpLiBjcHVfZGFpIGVycm9yIHNob3Vs
ZCBiZSByZXBvcnRlZC4gRm9yIEhETUkKICBjb2RlY19kYWksIHRoZXJlIGlzIG5vIG5lZWQgdG8g
c2V0IHN5c2Nsay4KCkNoZW5nLVlpIENoaWFuZyAoNCk6CiAgQVNvQzogaGRtaS1jb2RlYzogQWRk
IGFuIG9wIHRvIHNldCBjYWxsYmFjayBmdW5jdGlvbiBmb3IgcGx1ZyBldmVudAogIGRybTogYnJp
ZGdlOiBkdy1oZG1pOiBSZXBvcnQgY29ubmVjdG9yIHN0YXR1cyB1c2luZyBjYWxsYmFjawogIEFT
b0M6IHJvY2tjaGlwX21heDk4MDkwOiBBZGQgZGFpX2xpbmsgZm9yIEhETUkKICBBU29DOiByb2Nr
Y2hpcF9tYXg5ODA5MDogQWRkIEhETUkgamFjayBzdXBwb3J0CgogLi4uL2dwdS9kcm0vYnJpZGdl
L3N5bm9wc3lzL2R3LWhkbWktYXVkaW8uaCAgIHwgICAzICsKIC4uLi9kcm0vYnJpZGdlL3N5bm9w
c3lzL2R3LWhkbWktaTJzLWF1ZGlvLmMgICB8ICAxMCArKwogZHJpdmVycy9ncHUvZHJtL2JyaWRn
ZS9zeW5vcHN5cy9kdy1oZG1pLmMgICAgIHwgIDU1ICsrKysrKysrLQogaW5jbHVkZS9zb3VuZC9o
ZG1pLWNvZGVjLmggICAgICAgICAgICAgICAgICAgIHwgIDE2ICsrKwogc291bmQvc29jL2NvZGVj
cy9oZG1pLWNvZGVjLmMgICAgICAgICAgICAgICAgIHwgIDQ1ICsrKysrKysKIHNvdW5kL3NvYy9y
b2NrY2hpcC9yb2NrY2hpcF9tYXg5ODA5MC5jICAgICAgICB8IDExNiArKysrKysrKysrKysrKy0t
LS0KIDYgZmlsZXMgY2hhbmdlZCwgMjIxIGluc2VydGlvbnMoKyksIDI0IGRlbGV0aW9ucygtKQoK
LS0gCjIuMjIuMC40MTAuZ2Q4ZmRiZTIxYjUtZ29vZwoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
