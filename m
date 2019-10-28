Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 510BFE6E27
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2019 09:25:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F0756E4A5;
	Mon, 28 Oct 2019 08:25:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 114EA6E0FB
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2019 07:19:40 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id v4so6283910pff.6
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2019 00:19:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1kARxN4zXqzFWFi9Hzge3EGrR8GY2GeJ7Yqz9IBjLtM=;
 b=PCUypPJYYS6U9smbFBau1gAOW8DCvZijbe3W9gvYPPaFRoGqymvMAUlBRDoIIwuZbi
 ShMdHFgpY8Z08u2S7SKbJCC2UCk1Ttm7pVTIv+HYBQnHz0zA/cA86tXh52u+EjnFC3SW
 3LkF66OWd5ZG5E50YCKZLExVSqEp1RVAWAIsK45uTJLjNwlLJ2/W27XbfWCnrwZJnVVH
 UroBZ9LakqWN4sn4Ra2vr5NZW6QTCY9kLKq7G8YrCDTks/9ZyL+c4Mx5wwuWdHu5zwoy
 A+xwABuDinHYrh6Cjhx7mwhr4Vga51x3GH0A1rGkjOfgn0w84eGrHizZG3RyGclReHx6
 mqEg==
X-Gm-Message-State: APjAAAXuZMUmYNpb8P//hzMWFPXUjwS8tEQ4e8KEuIB23WybgYApRCVZ
 EcOOWlckWFb9XSEXKtlCSWZmuA==
X-Google-Smtp-Source: APXvYqyQ6aIEt1WbaZMUGlnrW1jFW16UZAwHLIo+j1unzlK77i3d3XcL512n21QVNwPfdFP+R7kEQQ==
X-Received: by 2002:a63:ff56:: with SMTP id s22mr19089316pgk.44.1572247179560; 
 Mon, 28 Oct 2019 00:19:39 -0700 (PDT)
Received: from localhost ([2401:fa00:1:10:79b4:bd83:e4a5:a720])
 by smtp.gmail.com with ESMTPSA id h28sm12513742pgn.14.2019.10.28.00.19.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Oct 2019 00:19:38 -0700 (PDT)
From: Cheng-Yi Chiang <cychiang@chromium.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v9 0/6] Add HDMI jack support on RK3288
Date: Mon, 28 Oct 2019 15:19:24 +0800
Message-Id: <20191028071930.145899-1-cychiang@chromium.org>
X-Mailer: git-send-email 2.24.0.rc0.303.g954a862665-goog
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 28 Oct 2019 08:23:53 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1kARxN4zXqzFWFi9Hzge3EGrR8GY2GeJ7Yqz9IBjLtM=;
 b=P4SRp8hsDD5IeFRKKfwF24MUFSYWQUG8Pifned/ZXWMMwEDxyNi2fo2IBqSZemeTIr
 YXzLkF57dbipVFhFy74e+kfK6A+vvnGLJ9qcYvXjfL/f0CZKSBWPERoIjFznbevPjcKy
 2Yr0AWo8FKDfZP5ZaXkh/LIexFunlbxZ+g2ns=
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
Cc: Mark Rutland <mark.rutland@arm.com>, alsa-devel@alsa-project.org,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Liam Girdwood <lgirdwood@gmail.com>,
 Hans Verkuil <hverkuil@xs4all.nl>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Takashi Iwai <tiwai@suse.com>,
 linux-rockchip@lists.infradead.org, dgreid@chromium.org,
 Cheng-Yi Chiang <cychiang@chromium.org>, devicetree@vger.kernel.org,
 tzungbi@chromium.org, Jonas Karlman <jonas@kwiboo.se>,
 Russell King <rmk+kernel@armlinux.org.uk>, Rob Herring <robh+dt@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, linux-arm-kernel@lists.infradead.org,
 Jernej Skrabec <jernej.skrabec@siol.net>, dianders@chromium.org,
 Mark Brown <broonie@kernel.org>
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
aS1jb2RlYy4KClRoZSBkZXBlbmRlbnQgY2hhbmdlIG9uIGhkbWktY29kZWMuYwoKY29tbWl0IDZm
YTU5NjNjMzdhMiAoIkFTb0M6IGhkbWktY29kZWM6IEFkZCBhbiBvcCB0byBzZXQgY2FsbGJhY2sg
ZnVuY3Rpb24gZm9yIHBsdWcgZXZlbnQiKQoKaGFzIGJlZW4gbWVyZ2VkIHRvIHVwc3RyZWFtLgoK
Q2hhbmdlcyBmcm9tIHY4IHRvIHY5OgoKMS4gcm9ja2NoaXBfbWF4OTgwOTA6CiAgIFVzZSB0aGUg
cHJlc2VuY2Ugb2Ygcm9ja2NoaXAsYXVkaW8tY29kZWMgdG8gZGV0ZXJtaW5lIHRoZSBwcmVzZW5z
ZSBvZiBtYXg5ODA5MAogICBpbiBzb3VuZCBjYXJkLgogICBVc2UgdGhlIHByZXNlbmNlIG9mIHJv
Y2tjaGlwLGhkbWktY29kZWMgdG8gZGV0ZXJtaW5lIHRoZSBwcmVzZW5jZSBvZiBIRE1JIGluCiAg
IHNvdW5kIGNhcmQuCiAgIFJlbW92ZSB0aGUgY29tcGF0aWJsZSBzdHJpbmdzIGFkZGVkIGluIHY4
LgoKMi4gI2luY2x1ZGUgPHNvdW5kL2hkbWktY29kZWMuaD4gc2hvdWxkIGJlIGluIHRoZSBwYXRj
aCBvZiBhZGRpbmcgSERNSSBqYWNrIHN1cHBvcnQuCgpDaGVuZy1ZaSBDaGlhbmcgKDYpOgogIGRy
bTogYnJpZGdlOiBkdy1oZG1pOiBSZXBvcnQgY29ubmVjdG9yIHN0YXR1cyB1c2luZyBjYWxsYmFj
awogIEFTb0M6IHJvY2tjaGlwLW1heDk4MDkwOiBTdXBwb3J0IHVzYWdlIHdpdGggYW5kIHdpdGhv
dXQgSERNSQogIEFTb0M6IHJvY2tjaGlwX21heDk4MDkwOiBPcHRpb25hbGx5IHN1cHBvcnQgSERN
SSB1c2UgY2FzZQogIEFTb0M6IHJvY2tjaGlwX21heDk4MDkwOiBBZGQgSERNSSBqYWNrIHN1cHBv
cnQKICBBUk06IGR0czogcm9ja2NoaXA6IEFkZCBIRE1JIHN1cHBvcnQgdG8gcmszMjg4LXZleXJv
bi1hbmFsb2ctYXVkaW8KICBBUk06IGR0czogcm9ja2NoaXA6IEFkZCBIRE1JIGF1ZGlvIHN1cHBv
cnQgdG8gcmszMjg4LXZleXJvbi1taWNrZXkuZHRzCgogLi4uL2JpbmRpbmdzL3NvdW5kL3JvY2tj
aGlwLW1heDk4MDkwLnR4dCAgICAgIHwgIDI3ICstCiAuLi4vYm9vdC9kdHMvcmszMjg4LXZleXJv
bi1hbmFsb2ctYXVkaW8uZHRzaSAgfCAgIDEgKwogYXJjaC9hcm0vYm9vdC9kdHMvcmszMjg4LXZl
eXJvbi1taWNrZXkuZHRzICAgIHwgICA3ICsKIC4uLi9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhk
bWktaTJzLWF1ZGlvLmMgICB8ICAxMSArCiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lz
L2R3LWhkbWkuYyAgICAgfCAgNDEgKystCiBpbmNsdWRlL2RybS9icmlkZ2UvZHdfaGRtaS5oICAg
ICAgICAgICAgICAgICAgfCAgIDQgKwogc291bmQvc29jL3JvY2tjaGlwL0tjb25maWcgICAgICAg
ICAgICAgICAgICAgIHwgICAzICstCiBzb3VuZC9zb2Mvcm9ja2NoaXAvcm9ja2NoaXBfbWF4OTgw
OTAuYyAgICAgICAgfCAzMTMgKysrKysrKysrKysrKystLS0tCiA4IGZpbGVzIGNoYW5nZWQsIDMz
OCBpbnNlcnRpb25zKCspLCA2OSBkZWxldGlvbnMoLSkKCi0tIAoyLjI0LjAucmMwLjMwMy5nOTU0
YTg2MjY2NS1nb29nCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
