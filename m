Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBFE86B729
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jul 2019 09:08:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17E8E6E261;
	Wed, 17 Jul 2019 07:08:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B24689BF8
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2019 11:57:36 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id f5so502732pgu.5
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2019 04:57:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IeXE1WNIbLgZbuXjaQOxWA+uaePxQPbUYQ3+kYNaWMc=;
 b=hPLafqTMG4e8sedER33PsQDturl+aJ6fWsBQzMfoCKQ1hX/15KcYaifbC4UDrU0n3I
 xZH3JrQOJ9OE/IvMycZS4pzEDWMhfuez25VPMuzM42+l50gkWpvruKb9BNkHonmhSuPK
 JoxO6tzDRN/63RrdZV6VAyhC8smIYKx2dDzo+ZJ/mE+Yc+AWjLWEY7SAzJqjVY3v1n/F
 i6nuZPRiRyIiv/BzSp8vdVtdROy3H2tNw5PzvVSJ2DX0bGkfRHAbs+WmzTTXqq9zCoEh
 XXI8i7tQG04FZSpU36CckVJereaFIEE8hHJ22BwPpiLZA5GW/RmPotT0Z2UzqJ4RNPa3
 Jf3Q==
X-Gm-Message-State: APjAAAWxXjen1rMFuSqt0WdD+esCgVRDa7XWRBQuDUz0xDaV9rPOUmPz
 n7GMvT8Oa6uP96HPoHMVXilnfQ==
X-Google-Smtp-Source: APXvYqxZI85uD2GdvaU3cmn0bFXHmYYOfFV7BJ7eG6YxMTU8Do/1HOLml+Z27bIuOXPOuQu/8HZpFg==
X-Received: by 2002:a63:1215:: with SMTP id h21mr33096297pgl.221.1563278255748; 
 Tue, 16 Jul 2019 04:57:35 -0700 (PDT)
Received: from localhost ([2401:fa00:1:b:e688:dfd2:a1a7:2956])
 by smtp.gmail.com with ESMTPSA id e10sm21197516pfi.173.2019.07.16.04.57.31
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 16 Jul 2019 04:57:34 -0700 (PDT)
From: Cheng-Yi Chiang <cychiang@chromium.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/5] Add HDMI jack support on RK3288
Date: Tue, 16 Jul 2019 19:57:20 +0800
Message-Id: <20190716115725.66558-1-cychiang@chromium.org>
X-Mailer: git-send-email 2.22.0.510.g264f2c817a-goog
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 17 Jul 2019 07:08:01 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IeXE1WNIbLgZbuXjaQOxWA+uaePxQPbUYQ3+kYNaWMc=;
 b=ktGe9+lAGPHwFi/wlz8lD76+AeIaTQtERkWK4VsGnh1JYg9WPux230jP1y7OvF1kD+
 ZXbjD8fqqdXuMjOOoKBf0pLRsxEuM6VZC4+OvbNncs/GBXHHvW2rt6ldjj/ebR3ZDpu+
 XNugwN2hk34e+scqI+o0eCXzJhj5hbsMCDaiw=
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
aS1jb2RlYy4KCkNoYW5nZXMgZnJvbSB2MyB0byB2NDoKLSBoZG1pLWNvZGVjLmg6IE1vZGlmeSB0
aGUgaG9va19wbHVnZ2VkX2NiIG9wcyB0byB0YWtlIGFuIGFkZGl0aW9uYWwgYXJndW1lbnQsCiAg
dGhhdCBpcywgdGhlIHBvaW50ZXIgdG8gc3RydWN0IGRldmljZSBmb3IgY29kZWMgZGV2aWNlLgot
IGR3LWhkbWktaTJzLWF1ZGlvLmM6IFNpbXBsaWZ5IHRoZSByZWdpc3RyYXRpb24gb2YgY2FsbGJh
Y2sgc28gaXQgdXNlcwogIGR3X2hkbWlfc2V0X3BsdWdnZWRfY2IgZXhwb3J0ZWQgYnkgZHctaGRt
aS5jLgotIGR3LWhkbWkuYzogU2ltcGxpZnkgdGhlIGZsb3cgdG8gaW52b2tlIGNhbGxiYWNrIHNp
bmNlIG5vdyBkd19oZG1pIGhhcyBhCiAgcG9pbnRlciB0byBjb2RlYyBkZXZpY2UgYXMgY2FsbGJh
Y2sgYXJndW1lbnQuIFRoZXJlIGlzIG5vIG5lZWQgdG8gcmVseQogIG9uIGRyaXZlciBkYXRhIG9m
IG90aGVyIGRyaXZlci4KLSBkdy1oZG1pLmM6IE1pbm9yIGNoYW5nZSBmb3IgcmVhZGFiaWxpdHku
Ci0gc3lub3BzeXMvS2NvbmZpZzogRml4IHRoZSBkZXBlbmRlbmN5IG9mIGhkbWktY29kZWMgaW4g
S2NvbmZpZy4KLSBGaXhlZCB0aGUgaW5jb3JyZWN0IEZST01MSVNUIHRpdGxlIG9mIHBhdGNoIDUv
NS4KCkNoZW5nLVlpIENoaWFuZyAoNSk6CiAgQVNvQzogaGRtaS1jb2RlYzogQWRkIGFuIG9wIHRv
IHNldCBjYWxsYmFjayBmdW5jdGlvbiBmb3IgcGx1ZyBldmVudAogIGRybTogYnJpZGdlOiBkdy1o
ZG1pOiBSZXBvcnQgY29ubmVjdG9yIHN0YXR1cyB1c2luZyBjYWxsYmFjawogIGRybTogZHctaGRt
aS1pMnM6IFVzZSBmaXhlZCBpZCBmb3IgY29kZWMgZGV2aWNlCiAgQVNvQzogcm9ja2NoaXBfbWF4
OTgwOTA6IEFkZCBkYWlfbGluayBmb3IgSERNSQogIEFTb0M6IHJvY2tjaGlwX21heDk4MDkwOiBB
ZGQgSERNSSBqYWNrIHN1cHBvcnQKCiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL0tj
b25maWcgICAgICAgfCAgIDIgKy0KIC4uLi9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWktaTJz
LWF1ZGlvLmMgICB8ICAxMyArLQogZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1o
ZG1pLmMgICAgIHwgIDQxICsrKysrKy0KIGluY2x1ZGUvZHJtL2JyaWRnZS9kd19oZG1pLmggICAg
ICAgICAgICAgICAgICB8ICAgNCArCiBpbmNsdWRlL3NvdW5kL2hkbWktY29kZWMuaCAgICAgICAg
ICAgICAgICAgICAgfCAgMTcgKysrCiBzb3VuZC9zb2MvY29kZWNzL2hkbWktY29kZWMuYyAgICAg
ICAgICAgICAgICAgfCAgNDYgKysrKysrKwogc291bmQvc29jL3JvY2tjaGlwL0tjb25maWcgICAg
ICAgICAgICAgICAgICAgIHwgICAzICstCiBzb3VuZC9zb2Mvcm9ja2NoaXAvcmszMjg4X2hkbWlf
YW5hbG9nLmMgICAgICAgfCAgIDMgKy0KIHNvdW5kL3NvYy9yb2NrY2hpcC9yb2NrY2hpcF9tYXg5
ODA5MC5jICAgICAgICB8IDExNiArKysrKysrKysrKysrKy0tLS0KIDkgZmlsZXMgY2hhbmdlZCwg
MjE3IGluc2VydGlvbnMoKyksIDI4IGRlbGV0aW9ucygtKQoKLS0gCjIuMjIuMC41MTAuZzI2NGYy
YzgxN2EtZ29vZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
