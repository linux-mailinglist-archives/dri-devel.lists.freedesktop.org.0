Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7359E6025F
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jul 2019 10:41:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A0266E436;
	Fri,  5 Jul 2019 08:41:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C96526E402
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jul 2019 04:27:03 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id r1so3706147pfq.12
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Jul 2019 21:27:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Mt+OhzkdZXuABUeOm3oIQQxV+A0uMRzmq60uCRJmAJE=;
 b=OfiTxWm47z16yGZ01AWs1cVms3TCEyRVojnrQqQBL1Am33RtgEh+S9Ghct841tuJsW
 678Dctj+XJlsoXwIDb0rV2EIB/s0L/dUqQqmr+JtHv73swqLnKSSSp721iNXynJqjIH4
 O3UWifKfHzYr4zbRLVOtUevsICEIj0s4co/VqMCgREmWqC/a0Dz8JkSsk3OQ8KVZtTtO
 XyofaR4nzsDyC96hOwbmJ1wQTE8IxsJr8pY/TfAjkjrZBalAIhUOPJ0X1PXdD5dk3VyM
 gKiwikz7LyefB7WHvFa5BqbK/OaxDNPzGFAF2TFWHwvdxoU2/BJ6yCCSuEhl8CnKeZkW
 0vLQ==
X-Gm-Message-State: APjAAAWcaEjSeYBmRxvezT3klU1mwrqUv6aWEegR25KA07N/69MesxbD
 kj60JONiBf0GOWW1X0fzKsGT3g==
X-Google-Smtp-Source: APXvYqywd4tkamYO1Fai6BvXNjXkhsYojIRkBX4/rKYkl5GdlfV7TnbJIDpy2ZVfWAPldm8d1RwzHA==
X-Received: by 2002:a17:90a:8d86:: with SMTP id
 d6mr2081909pjo.94.1562300823498; 
 Thu, 04 Jul 2019 21:27:03 -0700 (PDT)
Received: from localhost ([2401:fa00:1:b:e688:dfd2:a1a7:2956])
 by smtp.gmail.com with ESMTPSA id t10sm6811920pjr.13.2019.07.04.21.27.00
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 04 Jul 2019 21:27:02 -0700 (PDT)
From: Cheng-Yi Chiang <cychiang@chromium.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] ASoC: rockchip_max98090: Add HDMI jack support
Date: Fri,  5 Jul 2019 12:26:23 +0800
Message-Id: <20190705042623.129541-5-cychiang@chromium.org>
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
In-Reply-To: <20190705042623.129541-1-cychiang@chromium.org>
References: <20190705042623.129541-1-cychiang@chromium.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 05 Jul 2019 08:41:21 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Mt+OhzkdZXuABUeOm3oIQQxV+A0uMRzmq60uCRJmAJE=;
 b=Hbexc+aCBum/RZ12dI3r5/XyzyiK+MvJQgQ2XO3/HVioP3PM/nCddAlz1xrMohN7M1
 S0TUfchH1at/5Y1i17XhZAcSUqCKCip2aybO7YsuTVjIwJXSYImaa+d0n/+JHH0FYNkL
 NI0/aW8eXuQCvg6kpGPrNaIfIBqJ7QUDBMvFM=
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

SW4gbWFjaGluZSBkcml2ZXIsIGNyZWF0ZSBhIGphY2sgYW5kIGxldCBoZG1pLWNvZGVjIHJlcG9y
dCBqYWNrIHN0YXR1cy4KClNpZ25lZC1vZmYtYnk6IENoZW5nLVlpIENoaWFuZyA8Y3ljaGlhbmdA
Y2hyb21pdW0ub3JnPgotLS0KIHNvdW5kL3NvYy9yb2NrY2hpcC9yb2NrY2hpcF9tYXg5ODA5MC5j
IHwgMjEgKysrKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMjEgaW5zZXJ0aW9u
cygrKQoKZGlmZiAtLWdpdCBhL3NvdW5kL3NvYy9yb2NrY2hpcC9yb2NrY2hpcF9tYXg5ODA5MC5j
IGIvc291bmQvc29jL3JvY2tjaGlwL3JvY2tjaGlwX21heDk4MDkwLmMKaW5kZXggMTk1MzA5ZDEy
MjVhLi5jMGU0MzBjYTRkMTIgMTAwNjQ0Ci0tLSBhL3NvdW5kL3NvYy9yb2NrY2hpcC9yb2NrY2hp
cF9tYXg5ODA5MC5jCisrKyBiL3NvdW5kL3NvYy9yb2NrY2hpcC9yb2NrY2hpcF9tYXg5ODA5MC5j
CkBAIC0xNSw2ICsxNSw3IEBACiAjaW5jbHVkZSA8c291bmQvcGNtLmg+CiAjaW5jbHVkZSA8c291
bmQvcGNtX3BhcmFtcy5oPgogI2luY2x1ZGUgPHNvdW5kL3NvYy5oPgorI2luY2x1ZGUgPHNvdW5k
L2hkbWktY29kZWMuaD4KIAogI2luY2x1ZGUgInJvY2tjaGlwX2kycy5oIgogI2luY2x1ZGUgIi4u
L2NvZGVjcy90czNhMjI3ZS5oIgpAQCAtMTI5LDYgKzEzMCwyNSBAQCBlbnVtIHsKIAlEQUlMSU5L
X0hETUksCiB9OwogCitzdGF0aWMgc3RydWN0IHNuZF9zb2NfamFjayBya19oZG1pX2phY2s7CisK
K3N0YXRpYyBpbnQgcmtfaGRtaV9pbml0KHN0cnVjdCBzbmRfc29jX3BjbV9ydW50aW1lICpydW50
aW1lKQoreworCXN0cnVjdCBzbmRfc29jX2NhcmQgKmNhcmQgPSBydW50aW1lLT5jYXJkOworCXN0
cnVjdCBzbmRfc29jX2NvbXBvbmVudCAqY29tcG9uZW50ID0gcnVudGltZS0+Y29kZWNfZGFpLT5j
b21wb25lbnQ7CisJaW50IHJldDsKKworCS8qIGVuYWJsZSBqYWNrIGRldGVjdGlvbiAqLworCXJl
dCA9IHNuZF9zb2NfY2FyZF9qYWNrX25ldyhjYXJkLCAiSERNSSBKYWNrIiwgU05EX0pBQ0tfTElO
RU9VVCwKKwkJCQkgICAgJnJrX2hkbWlfamFjaywgTlVMTCwgMCk7CisJaWYgKHJldCkgeworCQlk
ZXZfZXJyKGNhcmQtPmRldiwgIkNhbid0IG5ldyBIRE1JIEphY2sgJWRcbiIsIHJldCk7CisJCXJl
dHVybiByZXQ7CisJfQorCisJcmV0dXJuIGhkbWlfY29kZWNfc2V0X2phY2tfZGV0ZWN0KGNvbXBv
bmVudCwgJnJrX2hkbWlfamFjayk7Cit9CisKIC8qIG1heDk4MDkwIGFuZCBIRE1JIGNvZGVjIGRh
aV9saW5rICovCiBzdGF0aWMgc3RydWN0IHNuZF9zb2NfZGFpX2xpbmsgcmtfZGFpbGlua3NbXSA9
IHsKIAlbREFJTElOS19NQVg5ODA5MF0gPSB7CkBAIC0xNDYsNiArMTY2LDcgQEAgc3RhdGljIHN0
cnVjdCBzbmRfc29jX2RhaV9saW5rIHJrX2RhaWxpbmtzW10gPSB7CiAJCS5vcHMgPSAmcmtfYWlm
MV9vcHMsCiAJCS5kYWlfZm10ID0gU05EX1NPQ19EQUlGTVRfSTJTIHwgU05EX1NPQ19EQUlGTVRf
TkJfTkYgfAogCQkJU05EX1NPQ19EQUlGTVRfQ0JTX0NGUywKKwkJLmluaXQgPSBya19oZG1pX2lu
aXQsCiAJCVNORF9TT0NfREFJTElOS19SRUcoaGRtaSksCiAJfQogfTsKLS0gCjIuMjIuMC40MTAu
Z2Q4ZmRiZTIxYjUtZ29vZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
