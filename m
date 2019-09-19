Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98515B8BD7
	for <lists+dri-devel@lfdr.de>; Fri, 20 Sep 2019 09:52:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DAF56F54A;
	Fri, 20 Sep 2019 07:51:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC9CF6F662
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Sep 2019 13:55:04 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id q5so2369050pfg.13
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Sep 2019 06:55:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QcejNC9fZ/NTUQ3FSm9GGJHJUw8LFfPEgVCIpwJsA9I=;
 b=WC8cUUMlFUGyYF9gp4ngGYtoZS1ABFAN8+IzqRKhvHbcvi/Db6/vvxNS0wkFDKRBUZ
 KRSwWnQG3QeO5MYMifGe9oC9BjXloYHfB996sXlQl+7Iy07ZCikOBYrfrT3O6spDd2pb
 6u0EhaxKj2tiOuXjTX7GvEWQ023nTvqftinfPSzG+kAQ4wEgLZVaor1PlOIYmUbAm3tX
 nfpRG+1+mGuIUL/hOwZt3iqsHwefifAHEF8MzJ4xQtvWoCYMekr2FAm2P8NA9zbJtkb6
 Lh3HBeO8gmqDv+zXeUxrSjYyhjrzuRnmXCDCaE5OIbHLfBbhUfzTEWnBG4kAQFZ6ssZ1
 SkTg==
X-Gm-Message-State: APjAAAXp+Kzmy6dLxF1QAWEc98F7YlOS+d50TGPhk8N9Cj1eToPxCkWG
 eK1+mWFVt44VZkYz1vr3T8RdSA==
X-Google-Smtp-Source: APXvYqwzVnj7vxmA6CmoajQ5DhGoNUc4s8peBeQOyXU+7fwt6n3lmQmFbq+8zRi0BN2hVeUmT9gckw==
X-Received: by 2002:a17:90a:9dc1:: with SMTP id
 x1mr3790773pjv.98.1568901304488; 
 Thu, 19 Sep 2019 06:55:04 -0700 (PDT)
Received: from localhost ([2401:fa00:1:10:79b4:bd83:e4a5:a720])
 by smtp.gmail.com with ESMTPSA id o195sm13065184pfg.21.2019.09.19.06.55.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Sep 2019 06:55:03 -0700 (PDT)
From: Cheng-Yi Chiang <cychiang@chromium.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v7 0/4] Add HDMI jack support on RK3288
Date: Thu, 19 Sep 2019 21:54:46 +0800
Message-Id: <20190919135450.62309-1-cychiang@chromium.org>
X-Mailer: git-send-email 2.23.0.237.gc6a4ce50a0-goog
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 20 Sep 2019 07:51:39 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QcejNC9fZ/NTUQ3FSm9GGJHJUw8LFfPEgVCIpwJsA9I=;
 b=FmYK84RyOgnliQ31WHT/B2X1rhvCHXNKlvyGmlVRO6Gpnzh/yL+0IWnFuePQCs0YK7
 +EYn5B+vPDFY2t1doWxyw/Wd/JDH+PBoa7As7ehNNs/LaWfDv5hH9QpdJZvm+Yb2diYP
 DvCuozGD+FhcOyRrTAaTNxWnzHPNP9l0BEObg=
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
IE1hcmsgQnJvd24gaW4gQVNvQyB0cmVlIGZvci01LjQgYnJhbmNoLgoKQ2hhbmdlcyBmcm9tIHY2
IHRvIHY3OgoKMS4gcm9ja2NoaXBfbWF4OTgwOTA6IFVzZSBwaGFuZGxlIG9mIEhETUkgZnJvbSBE
VFMgdG8gZmluZAogICBjb2RlY19kYWkuIFdpdGggdGhpcyB3ZSBkb24ndCBuZWVkIHRvIHNldCBm
aXhlZCBpZCBmb3IgdGhlCiAgIGNyZWF0ZWQgaGRtaS1hdWRpby1jb2RlYyBkZXZpY2UuCgpDaGVu
Zy1ZaSBDaGlhbmcgKDQpOgogIGRybTogYnJpZGdlOiBkdy1oZG1pOiBSZXBvcnQgY29ubmVjdG9y
IHN0YXR1cyB1c2luZyBjYWxsYmFjawogIEFTb0M6IHJvY2tjaGlwLW1heDk4MDkwOiBBZGQgZGVz
Y3JpcHRpb24gZm9yIHJvY2tjaGlwLGhkbWktY29kZWMKICBBU29DOiByb2NrY2hpcF9tYXg5ODA5
MDogQWRkIGRhaV9saW5rIGZvciBIRE1JCiAgQVNvQzogcm9ja2NoaXBfbWF4OTgwOTA6IEFkZCBI
RE1JIGphY2sgc3VwcG9ydAoKIC4uLi9iaW5kaW5ncy9zb3VuZC9yb2NrY2hpcC1tYXg5ODA5MC50
eHQgICAgICB8ICAgMiArCiAuLi4vYm9vdC9kdHMvcmszMjg4LXZleXJvbi1hbmFsb2ctYXVkaW8u
ZHRzaSAgfCAgIDEgKwogLi4uL2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS1pMnMtYXVkaW8u
YyAgIHwgIDExICsrCiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWkuYyAg
ICAgfCAgNDEgKysrKy0KIGluY2x1ZGUvZHJtL2JyaWRnZS9kd19oZG1pLmggICAgICAgICAgICAg
ICAgICB8ICAgNCArCiBzb3VuZC9zb2Mvcm9ja2NoaXAvS2NvbmZpZyAgICAgICAgICAgICAgICAg
ICAgfCAgIDMgKy0KIHNvdW5kL3NvYy9yb2NrY2hpcC9yb2NrY2hpcF9tYXg5ODA5MC5jICAgICAg
ICB8IDE0OSArKysrKysrKysrKysrKy0tLS0KIDcgZmlsZXMgY2hhbmdlZCwgMTgyIGluc2VydGlv
bnMoKyksIDI5IGRlbGV0aW9ucygtKQoKLS0gCjIuMjMuMC4yMzcuZ2M2YTRjZTUwYTAtZ29vZwoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
