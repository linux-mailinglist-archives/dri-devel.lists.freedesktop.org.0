Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0637682CB4
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2019 09:25:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 563BC6E2F7;
	Tue,  6 Aug 2019 07:25:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F2266E43A
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2019 13:41:07 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id l2so73025256wmg.0
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Aug 2019 06:41:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=o3FggyWEk7iag/gjHOv9EP41vPE6V1cAArTG8uYr8XE=;
 b=gcxjfCRKBSVHRHFjrmb4ucmgfohQezrKdeKiDM2iogDYH9V7DVdRWQWqGuG3O45HTT
 juhkmZa69McDbjQM55TZBwrDIekR6hARhEGPK+tqwqIBX7JOp5lU9BKcPWM5VWOhwEbI
 GhAts8G1go2yT4F/UujpmKScRVEqbD/jXn7am2xMB7g9gy+L24qLsypLOT4N0bg8nrC0
 1CfiEBW8XtnFSbaLDk25J3GSeuliD0vcZEgb8rxUbjrVBSz9uQ7pkgxBNCqSwKXZuTAO
 KRn35yBvHgMm5H/W8RhhXpd5wTZSZZxtyIuRnnDP30rtKov0hz9qdWIIq93fc+TzzVMZ
 cdJQ==
X-Gm-Message-State: APjAAAWMm5zt865S3wwqMbUKaH8JueZWRHmxvU3UQNdgE8vdq9ZCtLi1
 Lv+/U/dsRdCEVCBQV+aLF6fePA==
X-Google-Smtp-Source: APXvYqwF6PGarFPBjk3nNJY6M7XmmSODW9OY5CMXn6Qo4jDotnjtLtsU/m8nGsyE18j0hM+jq4UcTA==
X-Received: by 2002:a1c:5f09:: with SMTP id t9mr19859634wmb.112.1565012466102; 
 Mon, 05 Aug 2019 06:41:06 -0700 (PDT)
Received: from starbuck.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id w7sm99040534wrn.11.2019.08.05.06.41.05
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 05 Aug 2019 06:41:05 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 0/8] drm/bridge: dw-hdmi: improve i2s support
Date: Mon,  5 Aug 2019 15:40:54 +0200
Message-Id: <20190805134102.24173-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-Mailman-Approved-At: Tue, 06 Aug 2019 07:24:35 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=o3FggyWEk7iag/gjHOv9EP41vPE6V1cAArTG8uYr8XE=;
 b=VKzwCZsY5ujaTHwBT2AdabMwz/1j90BaDaa/VIhk7cwlJO/n264xa2vUQOchFf6hn1
 iu24xUGNF3exhSvC8sOfcU/WP7MHEpYz/JQi5vY4N0rpFRQ82yUIc7fT6QjSg4sLApfW
 AFtp86CS+jmu0DbCb5QFeDCGFqmNTB0si0PY8C4SC39LwW5U15uabg5vrEjne46KEZIn
 L0vhnpzT/HAVWyLSZ88RB448nF5GfiMbcwdmRxymXqDL7tAB/BT8Bp2NaS+NI1QbEYFg
 5zNSN1uU0r3p79VVyvXzjFIKCtqRQOHtpk4qkXtx1dPs1l1ks7l5kqR4qlp9VVFwooHF
 yjJA==
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
Cc: Jonas Karlman <jonas@kwiboo.se>, Kevin Hilman <khilman@baylibre.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIHB1cnBvc2Ugb2YgdGhpcyBwYXRjaHNldCBpcyB0byBpbXByb3ZlIHRoZSBzdXBwb3J0IG9m
IHRoZSBpMnMKaW50ZXJmYWNlIG9mIHRoZSBzeW5vcHN5cyBoZG1pIGNvbnRyb2xsZXIuCgpPbmNl
IGFwcGxpZWQsIHRoZSBpbnRlcmZhY2Ugc2hvdWxkIHN1cHBvcnQgYWxsIHRoZSB1c3VhbCBpMnMg
YnVzIGZvcm1hdHMsCjggY2hhbm5lbHMgcGxheWJhY2sgYW5kIHByb3Blcmx5IHNldHVwIHRoZSBj
aGFubmVsIG51bWJlciBhbmQgYWxsb2NhdGlvbgppbiB0aGUgaW5mb2ZyYW1lcy4KCkFsc28sIHRo
ZSBkdy1oZG1pIGkycyBpbnRlcmZhY2Ugd2lsbCBub3cgcHJvdmlkZSB0aGUgZWxkIHRvIHRoZSBn
ZW5lcmljCmhkbWktY29kZWMgc28gaXQgY2FuIGV4cG9zZSB0aGUgcmVsYXRlZCBjb250cm9scyB0
byB1c2VyIHNwYWNlLgoKVGhpcyB3b3JrIHdhcyBpbnNwaXJlZCBieSBKb25hcyBLYXJsbWFuJ3Mg
d29yaywgYXZhaWxhYmxlIGhlcmUgWzBdLgoKVGhpcyB3YXMgdGVzdGVkIHRoZSBBbWxvZ2ljIG1l
c29uLWcxMmEtc2VpNTEwIHBsYXRmb3JtLgpGb3IgdGhpcyBzcGVjaWZpYyBwbGF0Zm9ybSwgd2hp
Y2ggdXNlcyBjb2RlYzJjb2RlYyBsaW5rcywgdGhlcmUgaXMgYQpydW50aW1lIGRlcGVuZGVuY3kg
Zm9yIHBhdGNoIDggb24gdGhpcyBBU29DIHNlcmllcyBbMV0uCgpbMF06IGh0dHBzOi8vZ2l0aHVi
LmNvbS9Ld2lib28vbGludXgtcm9ja2NoaXAvY29tbWl0cy9yb2NrY2hpcC01LjItZm9yLWxpYnJl
ZWxlYy12NS4yLjMKWzFdOiBodHRwczovL2xrbWwua2VybmVsLm9yZy9yLzIwMTkwNzI1MTY1OTQ5
LjI5Njk5LTEtamJydW5ldEBiYXlsaWJyZS5jb20KCkplcm9tZSBCcnVuZXQgKDgpOgogIGRybS9i
cmlkZ2U6IGR3LWhkbWktaTJzOiBzdXBwb3J0IG1vcmUgaTJzIGZvcm1hdAogIGRybS9icmlkZ2U6
IGR3LWhkbWk6IG1vdmUgYXVkaW8gY2hhbm5lbCBzZXR1cCBvdXQgb2YgYWhiCiAgZHJtL2JyaWRn
ZTogZHctaGRtaTogc2V0IGNoYW5uZWwgY291bnQgaW4gdGhlIGluZm9mcmFtZXMKICBkcm0vYnJp
ZGdlOiBkdy1oZG1pLWkyczogZW5hYmxlIGxwY20gbXVsdGkgY2hhbm5lbHMKICBkcm0vYnJpZGdl
OiBkdy1oZG1pLWkyczogc2V0IHRoZSBjaGFubmVsIGFsbG9jYXRpb24KICBkcm0vYnJpZGdlOiBk
dy1oZG1pLWkyczogcmVzZXQgYXVkaW8gZmlmbyBiZWZvcmUgYXBwbHlpbmcgbmV3IHBhcmFtcwog
IGRybS9icmlkZ2U6IGR3LWhkbWktaTJzOiBlbmFibGUgb25seSB0aGUgcmVxdWlyZWQgaTJzIGxh
bmVzCiAgZHJtL2JyaWRnZTogZHctaGRtaS1pMnM6IGFkZCAuZ2V0X2VsZCBzdXBwb3J0CgogLi4u
L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS1haGItYXVkaW8uYyAgIHwgMjAgKystLS0tLQog
Li4uL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWktYXVkaW8uaCAgIHwgIDEgKwogLi4u
L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS1pMnMtYXVkaW8uYyAgIHwgNTkgKysrKysrKysr
KysrKysrKystLQogZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1pLmMgICAg
IHwgMzcgKysrKysrKysrKysrCiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhk
bWkuaCAgICAgfCAxMyArKystCiBpbmNsdWRlL2RybS9icmlkZ2UvZHdfaGRtaS5oICAgICAgICAg
ICAgICAgICAgfCAgMiArCiA2IGZpbGVzIGNoYW5nZWQsIDEwNyBpbnNlcnRpb25zKCspLCAyNSBk
ZWxldGlvbnMoLSkKCi0tIAoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
