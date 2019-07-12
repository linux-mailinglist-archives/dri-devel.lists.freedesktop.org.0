Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5F3B67A78
	for <lists+dri-devel@lfdr.de>; Sat, 13 Jul 2019 16:24:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19D3E89F45;
	Sat, 13 Jul 2019 14:24:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 449306E33D
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jul 2019 10:04:56 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id r7so4104249pfl.3
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jul 2019 03:04:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9+TShMWhLwN8SmBiAr6bXkiOWeqpu2JFdqFTK8VDDlU=;
 b=ns6tSQPnhIlk/HXFEUsx9+trdfMWskUsS0dooipk6A4Z8MLTWEzYAaT1EkgvUSKzN2
 dmbvlMXY0Sbll8B6SflkZ8RAo6cXh4OaZNH9oDnppKfhTxWMMycr3zXHok4684RBQh9I
 MrwYo1WxbVfISkCOJFRhWlLJm2FlLcDA+GAbn64dq5uenqEILbKxV0FE5ABMMShvR9zt
 HClcV2XLDkEJVWWKh063s4+QjZ9C33Ty3g4eoVOszfTrfOSi4BA3HOynNaP0IjwIxl3r
 uCJ1LshRxs+Zde2G8vHZ0J+xcE1lP2YYgK0HAmAQ9Wu4Go+ZPgPUbIrPkceNwS5k8UYW
 5wlg==
X-Gm-Message-State: APjAAAUUOaZc+DnLRENO9BwqChglcmSvLpc47JOoHJKUS9iKITgrtK2e
 ROxJpzceFdOqKvYNeQ429SSLXQ==
X-Google-Smtp-Source: APXvYqwATmqfXzDCdurIM9yTmyaXPTBgWhe7CgwnZbiAoCvMtazQjnDbkVjRZW0J7jvst+vKxiVZOQ==
X-Received: by 2002:a63:e807:: with SMTP id s7mr9495461pgh.194.1562925895786; 
 Fri, 12 Jul 2019 03:04:55 -0700 (PDT)
Received: from localhost ([2401:fa00:1:b:e688:dfd2:a1a7:2956])
 by smtp.gmail.com with ESMTPSA id v3sm7501412pfm.188.2019.07.12.03.04.51
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 12 Jul 2019 03:04:54 -0700 (PDT)
From: Cheng-Yi Chiang <cychiang@chromium.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/5] Add HDMI jack support on RK3288
Date: Fri, 12 Jul 2019 18:04:38 +0800
Message-Id: <20190712100443.221322-1-cychiang@chromium.org>
X-Mailer: git-send-email 2.22.0.510.g264f2c817a-goog
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 13 Jul 2019 14:24:23 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9+TShMWhLwN8SmBiAr6bXkiOWeqpu2JFdqFTK8VDDlU=;
 b=h5gkWOale1JKC7q3JJ5JGsYnwMF4rXg9ycUc8TyqSYhtPfDqhRXMww1hVtAmCVuclM
 LrU9dKHZvAhoV+SbdlPevRw4Qlz2t+djP0eaF314TPHOrJvU4wceLVI+L6oX3xV1R5CI
 ZLa7NiOko2q8t5XjCYGa2NgeIkOrLKeiErpTU=
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
aS1jb2RlYy4KCkNoYW5nZXMgZnJvbSB2MiB0byB2MzoKLSBkdy1oZG1pLWkycy1hdWRpby5jOiBV
c2UgZml4ZWQgSUQgaW5zdGVhZCBvZiBhdXRvIElELgotIHJrMzI4OF9oZG1pX2FuYWxvZy5jOiBV
c2UgdGhlIGZpeGVkIG5hbWUgaGRtaS1hdWRpby1jb2RlYyBmb3IgY29kZWMgZGV2aWNlLgotIHJv
Y2tjaGlwX21heDk4MDkwOiBVc2UgdGhlIGZpeGVkIG5hbWUgaGRtaS1hdWRpby1jb2RlYyBmb3Ig
Y29kZWMgZGV2aWNlLgotIHJvY2tjaGlwX21heDk4MDkwOiBGaXggdGhlIGRlcGVuZGVuY3kgb2Yg
aGRtaS1jb2RlYyBpbiBLY29uZmlnLgoKQ2hlbmctWWkgQ2hpYW5nICg1KToKICBBU29DOiBoZG1p
LWNvZGVjOiBBZGQgYW4gb3AgdG8gc2V0IGNhbGxiYWNrIGZ1bmN0aW9uIGZvciBwbHVnIGV2ZW50
CiAgZHJtOiBicmlkZ2U6IGR3LWhkbWk6IFJlcG9ydCBjb25uZWN0b3Igc3RhdHVzIHVzaW5nIGNh
bGxiYWNrCiAgZHJtOiBkdy1oZG1pLWkyczogVXNlIGZpeGVkIGlkIGZvciBjb2RlYyBkZXZpY2UK
ICBBU29DOiByb2NrY2hpcF9tYXg5ODA5MDogQWRkIGRhaV9saW5rIGZvciBIRE1JCiAgRlJPTUxJ
U1Q6IEFTb0M6IHJvY2tjaGlwX21heDk4MDkwOiBBZGQgSERNSSBqYWNrIHN1cHBvcnQKCiAuLi4v
Z3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS1hdWRpby5oICAgfCAgIDMgKwogLi4uL2Ry
bS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS1pMnMtYXVkaW8uYyAgIHwgIDEyICstCiBkcml2ZXJz
L2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWkuYyAgICAgfCAgNTUgKysrKysrKystCiBp
bmNsdWRlL3NvdW5kL2hkbWktY29kZWMuaCAgICAgICAgICAgICAgICAgICAgfCAgMTYgKysrCiBz
b3VuZC9zb2MvY29kZWNzL2hkbWktY29kZWMuYyAgICAgICAgICAgICAgICAgfCAgNDUgKysrKysr
Kwogc291bmQvc29jL3JvY2tjaGlwL0tjb25maWcgICAgICAgICAgICAgICAgICAgIHwgICAzICst
CiBzb3VuZC9zb2Mvcm9ja2NoaXAvcmszMjg4X2hkbWlfYW5hbG9nLmMgICAgICAgfCAgIDMgKy0K
IHNvdW5kL3NvYy9yb2NrY2hpcC9yb2NrY2hpcF9tYXg5ODA5MC5jICAgICAgICB8IDExNiArKysr
KysrKysrKysrKy0tLS0KIDggZmlsZXMgY2hhbmdlZCwgMjI2IGluc2VydGlvbnMoKyksIDI3IGRl
bGV0aW9ucygtKQoKLS0gCjIuMjIuMC41MTAuZzI2NGYyYzgxN2EtZ29vZwoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
