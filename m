Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7E85329CD
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jun 2019 09:40:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A47BE8928F;
	Mon,  3 Jun 2019 07:40:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43534898BF
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jun 2019 04:33:13 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id d21so6469838plr.3
 for <dri-devel@lists.freedesktop.org>; Sun, 02 Jun 2019 21:33:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gbBoXtkybCih+d0Fl03vwDQsITr3snGAAM8qh+nRjII=;
 b=tjBxYtsja0J6Emn/0HGiqWVBawXHURyTFRmooNZbHqPI8kajY7AVtyA/HffscIagpj
 EPqK7YE/dKfpYU2EuAwlIvIDVgigs5LGRFK/NFT7Sh5B/FK2tcBaZhr+EKQ7z2pDROtc
 ufN5Z9cLe2CG2jKzTCvQSS+iJMNqn1oFYoPOWb29tJzC8MP2pxWPF57CgODYd/2KpCKu
 R51Y/SoekVA29v4RhjxVkfbjRHn1LigNxlSJwi0pOAkHhcY6ccerLbZ/ARYT76sFoKuu
 WO0TwOlRP+rYiX/gTFo07W+fDNck3qRSjDlCFgAL8LQDRWNjniGOMab5AYheQwrgpdP3
 3Rlg==
X-Gm-Message-State: APjAAAX2En/Ml3n6iGQ/Z6Yt/i/+uTO1iGRqc5iMb7A8Rlc7S6B6zIW6
 OoSzyz+FEa22FihauzgSlR1P3w==
X-Google-Smtp-Source: APXvYqwHPRACAb2NVy4vT95TjNhB37pT6HfXrPSfjEO5DvIiqn/QoGGQisMAL1weRQlGa/4txReURQ==
X-Received: by 2002:a17:902:54f:: with SMTP id
 73mr27187074plf.246.1559536392351; 
 Sun, 02 Jun 2019 21:33:12 -0700 (PDT)
Received: from localhost ([2401:fa00:1:b:e688:dfd2:a1a7:2956])
 by smtp.gmail.com with ESMTPSA id d19sm11382053pjs.22.2019.06.02.21.33.07
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 02 Jun 2019 21:33:11 -0700 (PDT)
From: Cheng-Yi Chiang <cychiang@chromium.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 0/7] Add HDMI audio support on RK3288 veyron board
Date: Mon,  3 Jun 2019 12:32:44 +0800
Message-Id: <20190603043251.226549-1-cychiang@chromium.org>
X-Mailer: git-send-email 2.22.0.rc1.257.g3120a18244-goog
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 03 Jun 2019 07:40:43 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gbBoXtkybCih+d0Fl03vwDQsITr3snGAAM8qh+nRjII=;
 b=VeaP4rlcKfdj36YiD4gQN5PLFZoAC42M84KJTEVRE31jLss30T+2akFEYuIFscw/ch
 osRR3hmV4eFkOymM8RI/dzrIeWeqmeCdj51ANhdIi8KizrDsWOPaglP+WSVFVgD9Tnl7
 MddyM0pP/JzICG9T/EMHkZSnnKGiIZeN7crL8=
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
Cc: alsa-devel@alsa-project.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Liam Girdwood <lgirdwood@gmail.com>,
 Hans Verkuil <hverkuil@xs4all.nl>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Cheng-Yi Chiang <cychiang@chromium.org>, Takashi Iwai <tiwai@suse.com>,
 linux-rockchip@lists.infradead.org, dgreid@chromium.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, tzungbi@chromium.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Russell King <rmk+kernel@armlinux.org.uk>, Rob Herring <robh+dt@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, linux-arm-kernel@lists.infradead.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, dianders@chromium.org,
 Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBwYXRjaCBzZXJpZXMgaXMgdG8gc3VwcG9ydCBIRE1JIGF1ZGlvIG9uIFJLMzI4OCB2ZXly
b24gYm9hcmQuCgpUbyBzdXBwb3J0IGphY2sgcmVwb3J0aW5nLCB0aGVyZSBhcmUgdHdvIG9sZCBw
YXRjaGVzOgoKdmlkZW86IGFkZCBIRE1JIHN0YXRlIG5vdGlmaWVyIHN1cHBvcnQKCjxodHRwczov
L2xvcmUua2VybmVsLm9yZy9saW51eC1tZWRpYS8yMDE2MTIxMzE1MDgxMy4zNzk2Ni0yLWh2ZXJr
dWlsQHhzNGFsbC5ubC8+CgpBU29DOiBoZG1pLWNvZGVjOiB1c2UgSERNSSBzdGF0ZSBub3RpZmll
ciB0byBhZGQgamFjayBzdXBwb3J0Cgo8aHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wYXRj
aC85NDMwMzU1Lz4KClRoZXkgYXJlIG1vZGlmaWVkIHRvIHBhc3MgY2hlY2twYXRjaCBjaGVja2lu
ZyBiYXNlZCBvbiBsYXRlc3QgQVNvQyB0cmVlCgpodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9z
Y20vbGludXgva2VybmVsL2dpdC9icm9vbmllL3NvdW5kLmdpdAoKZm9yLW5leHQgYnJhbmNoLgoK
V2l0aCB0aGVzZSB0d28gcGF0Y2hlcyBhdCBoYW5kLCBoZG1pLW5vdGlmaWVyIHN1cHBvcnQgaXMg
dGhlbiBhZGRlZCB0byBkdy1oZG1pCmRyaXZlciBzbyB0aGUgcGx1Zy91bnBsdWcgZXZlbnQgY2Fu
IGJlIHBhc3NlZCB0byBjb2RlYyBkcml2ZXIuCgpUaGUgcmVzdCBwYXRjaGVzIGFyZSBhYm91dCBt
YWNoaW5lIGRyaXZlciByb2NrY2hpcF9tYXg5ODA5MC4KQSBIRE1JIERBSSBsaW5rIGlzIGFkZGVk
IGZvciBIRE1JIHBsYXliYWNrIHNvIHRoZXJlIHdpbGwgYmUgdHdvIGRldmljZXMgb24KdGhpcyBz
b3VuZCBjYXJkLiBPbmUgZm9yIG1heDk4MDkwIGFuZCBvbmUgZm9yIEhETUkuClRoZSBIRE1JIG5v
ZGUgaXMgcGFzc2VkIGZyb20gRFRTIHNvIG1hY2hpbmUgZHJpdmVyIGNhbiBzZXQgdGhlIGNvcnJl
Y3QKaGRtaS1ub3RpZmllciBvbiBjb2RlYyBkcml2ZXIuCgpDaGVuZy1ZaSBDaGlhbmcgKDUpOgog
IGRybS9icmlkZ2Uvc3lub3BzeXM6IGR3LWhkbWk6IEFkZCBIRE1JIG5vdGlmaWVyIHN1cHBvcnQK
ICBBU29DOiByb2NrY2hpcF9tYXg5ODA5MDogQWRkIGRhaV9saW5rIGZvciBIRE1JCiAgQVNvQzog
cm9ja2NoaXA6IHJvY2tjaGlwLW1heDk4MDkwOiBBZGQgbm9kZSBmb3IgSERNSQogIEFTb0M6IHJv
Y2tjaGlwX21heDk4MDkwOiBBZGQgSERNSSBqYWNrIHN1cHBvcnQKICBBUk06IGR0czogcm9ja2No
aXA6IFNwZWNpZnkgSERNSSBub2RlIHRvIHNvdW5kIGNhcmQgbm9kZQoKSGFucyBWZXJrdWlsICgx
KToKICB2aWRlbzogYWRkIEhETUkgc3RhdGUgbm90aWZpZXIgc3VwcG9ydAoKUGhpbGlwcCBaYWJl
bCAoMSk6CiAgQVNvQzogaGRtaS1jb2RlYzogdXNlIEhETUkgc3RhdGUgbm90aWZpZXIgdG8gYWRk
IGphY2sgc3VwcG9ydAoKIC4uLi9iaW5kaW5ncy9zb3VuZC9yb2NrY2hpcC1tYXg5ODA5MC50eHQg
ICAgICB8ICAgMiArCiBNQUlOVEFJTkVSUyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgfCAgIDYgKwogLi4uL2Jvb3QvZHRzL3JrMzI4OC12ZXlyb24tYW5hbG9nLWF1ZGlvLmR0c2kg
IHwgICAxICsKIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvS2NvbmZpZyAgICAgICB8
ICAgMSArCiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWkuYyAgICAgfCAg
MjggKysrLQogZHJpdmVycy92aWRlby9LY29uZmlnICAgICAgICAgICAgICAgICAgICAgICAgIHwg
ICAzICsKIGRyaXZlcnMvdmlkZW8vTWFrZWZpbGUgICAgICAgICAgICAgICAgICAgICAgICB8ICAg
MSArCiBkcml2ZXJzL3ZpZGVvL2hkbWktbm90aWZpZXIuYyAgICAgICAgICAgICAgICAgfCAxNDUg
KysrKysrKysrKysrKysrKysrCiBpbmNsdWRlL2xpbnV4L2hkbWktbm90aWZpZXIuaCAgICAgICAg
ICAgICAgICAgfCAxMTIgKysrKysrKysrKysrKysKIGluY2x1ZGUvc291bmQvaGRtaS1jb2RlYy5o
ICAgICAgICAgICAgICAgICAgICB8ICAgNyArCiBzb3VuZC9zb2MvY29kZWNzL0tjb25maWcgICAg
ICAgICAgICAgICAgICAgICAgfCAgIDEgKwogc291bmQvc29jL2NvZGVjcy9oZG1pLWNvZGVjLmMg
ICAgICAgICAgICAgICAgIHwgMTA0ICsrKysrKysrKysrKy0KIHNvdW5kL3NvYy9yb2NrY2hpcC9y
b2NrY2hpcF9tYXg5ODA5MC5jICAgICAgICB8IDEyMyArKysrKysrKysrKystLS0KIDEzIGZpbGVz
IGNoYW5nZWQsIDUwOCBpbnNlcnRpb25zKCspLCAyNiBkZWxldGlvbnMoLSkKIGNyZWF0ZSBtb2Rl
IDEwMDY0NCBkcml2ZXJzL3ZpZGVvL2hkbWktbm90aWZpZXIuYwogY3JlYXRlIG1vZGUgMTAwNjQ0
IGluY2x1ZGUvbGludXgvaGRtaS1ub3RpZmllci5oCgotLSAKMi4yMi4wLnJjMS4yNTcuZzMxMjBh
MTgyNDQtZ29vZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
