Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66EDEE6E0B
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2019 09:24:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 883D36E457;
	Mon, 28 Oct 2019 08:23:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D5156EA30
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2019 13:30:22 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id 23so1570221pgk.3
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2019 06:30:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pgk2VpYDvWxnQGOn4CatnKUbEjzqifjDf+V5kplLk3Y=;
 b=OJBYACoI7yF5AXKmaeU2UPRaKNSbrlfnk0+srqQa4PIoCx+Wi0+Bg437twoWuBigrW
 3GaoripBIPA+HdxeuwN4mpCQj22vDUbgFjij+bixT5ugDDeqErx+oSfpI6rMS3yiFTDW
 AN772FIUN7bYQndNCIafqMnKsWkEtqxIona5T8alMEuAKbChzSCCy1hrDMbLBN2t6Kh9
 7e3Js/jjJIBfuz23dCEUD+JVGrjrM6yYOGa2svY6cO37iQGfeYyRPF9oeVW1JZlBCk6j
 AzbhQO0TDt/p+IL2WDhExUzT85dTeA/HDFKPIRksw2jXq1PrKchBVrwAc1LTZ6qhE6JJ
 og9g==
X-Gm-Message-State: APjAAAW07bZjdBWV2v9YPj+fuWSwb3i7y3+kpFzAKADCZ3NaZ9kQ92ye
 vJ5AIHDNxiGgsQZvvmCwer7zVw==
X-Google-Smtp-Source: APXvYqzpgx+nnjFmllOVgEw2I1Zze+v/IxDlqkvyVnWJ0/LUdRWU4MyQ5DhY20Cz7S6cmMoKn0X/FQ==
X-Received: by 2002:a65:4bc3:: with SMTP id p3mr4465303pgr.188.1572010221995; 
 Fri, 25 Oct 2019 06:30:21 -0700 (PDT)
Received: from localhost ([2401:fa00:1:10:79b4:bd83:e4a5:a720])
 by smtp.gmail.com with ESMTPSA id q20sm2534518pfl.79.2019.10.25.06.30.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Oct 2019 06:30:20 -0700 (PDT)
From: Cheng-Yi Chiang <cychiang@chromium.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v8 0/6] Add HDMI jack support on RK3288
Date: Fri, 25 Oct 2019 21:30:01 +0800
Message-Id: <20191025133007.11190-1-cychiang@chromium.org>
X-Mailer: git-send-email 2.24.0.rc0.303.g954a862665-goog
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 28 Oct 2019 08:23:53 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pgk2VpYDvWxnQGOn4CatnKUbEjzqifjDf+V5kplLk3Y=;
 b=hkoiNtYvvdlvP8l6YHJ0NAcOrbqzyTeM8GV5/CrfA0sqk7Un42PZnP+hIk4FRUHCIp
 uJrYQ2nf1MsX5xGpT+4LwiS2I3HKNvMGsveUyU2msEa+qqz8o7Wpw53WLVf2C//dpdWz
 NESc7oSR3+f7btvnpogS3AxngiEYpeuPmaTk8=
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
aS1jb2RlYy4KClRoZSBkZXBlbmRlbnQgY2hhbmdlIG9uIGhkbWktY29kZWMuYwoKNmZhNTk2M2Mz
N2EyIEFTb0M6IGhkbWktY29kZWM6IEFkZCBhbiBvcCB0byBzZXQgY2FsbGJhY2sgZnVuY3Rpb24g
Zm9yIHBsdWcgZXZlbnQKCmhhcyBiZWVuIG1lcmdlZCB0byB1cHN0cmVhbS4KCkNoYW5nZXMgZnJv
bSB2NyB0byB2ODoKCjEuIHJvY2tjaGlwX21heDk4MDkwOiBBbGxvdyB0aHJlZSBkaWZmZXJlbnQg
dXNlIGNhc2VzOgogICBtYXg5ODA5MC1vbmx5OiBGb3IgYmFja3dhcmQgY29tcGF0aWJpbGl0eSB3
aGVyZSBEVFMgZG9lcyBub3Qgc3BlY2lmeSBIRE1JIG5vZGUuCiAgIEhETUktb25seTogRm9yIEhE
TUktb25seSBib2FyZCBsaWtlIHZleXJvbi1taWNrZXkuCiAgIG1heDk4MDkwICsgSERNSTogRm9y
IG90aGVyIHZleXJvbiBib2FyZHMuCiAgIFBhc3MgZGlmZmVyZW50IGNvbXBhdGlibGUgc3RyaW5n
IHRvIHNwZWNpZnkgdGhlIHVzZSBjYXNlLgoKMi4gQWRkIG1vcmUgbWFpbnRhaW5lcnMgdG8gY2Mt
bGlzdCBmb3IgbmV3IGRldmljZSBwcm9wZXJ0eSByZXZpZXdpbmcuCgpDaGVuZy1ZaSBDaGlhbmcg
KDYpOgogIGRybTogYnJpZGdlOiBkdy1oZG1pOiBSZXBvcnQgY29ubmVjdG9yIHN0YXR1cyB1c2lu
ZyBjYWxsYmFjawogIEFTb0M6IHJvY2tjaGlwLW1heDk4MDkwOiBTdXBwb3J0IHVzYWdlIHdpdGgg
YW5kIHdpdGhvdXQgSERNSQogIEFTb0M6IHJvY2tjaGlwX21heDk4MDkwOiBPcHRpb25hbGx5IHN1
cHBvcnQgSERNSSB1c2UgY2FzZQogIEFTb0M6IHJvY2tjaGlwX21heDk4MDkwOiBBZGQgSERNSSBq
YWNrIHN1cHBvcnQKICBBUk06IGR0czogcm9ja2NoaXA6IEFkZCBIRE1JIHN1cHBvcnQgdG8gcmsz
Mjg4LXZleXJvbi1hbmFsb2ctYXVkaW8KICBBUk06IGR0czogcm9ja2NoaXA6IEFkZCBIRE1JIGF1
ZGlvIHN1cHBvcnQgdG8gcmszMjg4LXZleXJvbi1taWNrZXkuZHRzCgogLi4uL2JpbmRpbmdzL3Nv
dW5kL3JvY2tjaGlwLW1heDk4MDkwLnR4dCAgICAgIHwgIDM4ICstCiAuLi4vYm9vdC9kdHMvcmsz
Mjg4LXZleXJvbi1hbmFsb2ctYXVkaW8uZHRzaSAgfCAgIDMgKy0KIGFyY2gvYXJtL2Jvb3QvZHRz
L3JrMzI4OC12ZXlyb24tbWlja2V5LmR0cyAgICB8ICAgNyArCiAuLi4vZHJtL2JyaWRnZS9zeW5v
cHN5cy9kdy1oZG1pLWkycy1hdWRpby5jICAgfCAgMTEgKwogZHJpdmVycy9ncHUvZHJtL2JyaWRn
ZS9zeW5vcHN5cy9kdy1oZG1pLmMgICAgIHwgIDQxICstCiBpbmNsdWRlL2RybS9icmlkZ2UvZHdf
aGRtaS5oICAgICAgICAgICAgICAgICAgfCAgIDQgKwogc291bmQvc29jL3JvY2tjaGlwL0tjb25m
aWcgICAgICAgICAgICAgICAgICAgIHwgICAzICstCiBzb3VuZC9zb2Mvcm9ja2NoaXAvcm9ja2No
aXBfbWF4OTgwOTAuYyAgICAgICAgfCAzOTIgKysrKysrKysrKysrKysrLS0tCiA4IGZpbGVzIGNo
YW5nZWQsIDQyNSBpbnNlcnRpb25zKCspLCA3NCBkZWxldGlvbnMoLSkKCi0tIAoyLjI0LjAucmMw
LjMwMy5nOTU0YTg2MjY2NS1nb29nCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
