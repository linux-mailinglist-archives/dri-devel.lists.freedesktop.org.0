Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 103D044B31
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 20:53:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67C058984C;
	Thu, 13 Jun 2019 18:53:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEBBB8984C
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 18:53:46 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id bi6so8129139plb.12
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 11:53:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=F8d7m1DDnqH/bUU0S136tJmuahNrjwjbhZ2wXcmIkdw=;
 b=t250G5o0RXMXEcesjJgfbyh+r2YS9afr7ez5Knl007eMutmob5hiwGUjifbf6DEIKd
 rx1JfC/hvq3OzgAJGMBLUeuQVjwjG1A+D79aQagy/LnWmSZvWjQpTEuXs0SBEkBKT5yv
 oxb/mrGwnbTP4jIQztxX6ObQGzs8BeL0KVym3dTqaS26OPyiWdVdDEk67MYKi25aYqj3
 uA841MmElOL1zWaUbqWSsMehak3tExU61VZ+RI2kJWloGhbJXhCXKbSQk/agLkNpuymy
 68mJGAucPJ609k58j5mOgzb1eQbzDpl/Qhzs4ifu1rVk2uscdkoG6tdQWUvkzoYCxikf
 kaCw==
X-Gm-Message-State: APjAAAULgYh2nS48PflfCj3BM8HAIbpg4n8CJJqM/hLLJtHXgAZd5YxN
 ks+D9Joq/8bW/RvNOA5+3zjXh+o2uiM=
X-Google-Smtp-Source: APXvYqxKp7XuhbcSPIGuqB4Br4J+FEyezdRc8LcQCzcSqRvzjXK5pGpx+EH6W3hDqkSMxv54g7UEGQ==
X-Received: by 2002:a17:902:a5c5:: with SMTP id
 t5mr90864681plq.288.1560452026080; 
 Thu, 13 Jun 2019 11:53:46 -0700 (PDT)
Received: from localhost.localdomain ([115.97.180.18])
 by smtp.gmail.com with ESMTPSA id p43sm946314pjp.4.2019.06.13.11.53.40
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 13 Jun 2019 11:53:45 -0700 (PDT)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Maxime Ripard <maxime.ripard@bootlin.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Chen-Yu Tsai <wens@csie.org>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@siol.net>
Subject: [PATCH 0/9] drm/sun4i: Allwinner R40 MIPI-DSI support
Date: Fri, 14 Jun 2019 00:22:32 +0530
Message-Id: <20190613185241.22800-1-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=F8d7m1DDnqH/bUU0S136tJmuahNrjwjbhZ2wXcmIkdw=;
 b=XYnYivhjrL8PvMkvcXOzIdoB8lf1mxtbUYycZaEG3qDzZOBTZW8NEM4v6Fq3KNpMR1
 V9M4+v2ssLCBbmr5ZhabNGscBCasuvkwnhUqZ54hKPn1YDbi6BS99GW/25z7RJoSLomS
 zMZ0+g/bDTm+xsqCnr1Clt8/yhkTCEp0Kf8g8=
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
Cc: linux-sunxi@googlegroups.com,
 Michael Trimarchi <michael@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, Jagan Teki <jagan@amarulasolutions.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBpcyBpbml0aWFsIHZlcnNpb24gZm9yIHN1cHBvcnRpbmcgTUlQSS1EU0kgb24gQWxsd2lu
bmVyIFI0MC4KClRoZSBjb250cm9sbGVyIGxvb2sgc2ltaWxhciBsaWtlLCBBbGx3aW5ud2UgQTY0
IHNvIGl0IGhhcwpkZXBlbmRlbmNpZXMgd2l0aCBBNjQgTUlQSSBEU0kgY2hhbmdlcywgRFNJIGZp
eGVzIGFuZCBSNDAgcHdtIApkcml2ZXIgWzFdIFsyXSBbM10gCgpQTEwtTUlQSSwgZGNsayBkaXZk
ZXJzIGxvZ2ljIGJwcC9sYW5lcyBhcmUgcHJvcGVybHkgd29yayBmb3IgUjQwLApsaWtlIEEzMSwg
QTY0LgoKcGF0Y2ggMSwgMjogVENPTiBMQ0Qgc3VwcG9ydAoKcGF0Y2ggMywgNDogVXNlIGNsb2Nr
IGluZGV4IG1hY3JvcyBpbnN0ZWFkIG9mIG51bWJlcnMKCnBhdGNoIDU6IEFkZCB0Y29uIHRvcCBs
Y2QgY2xvY2tpbmcKCnBhdGNoIDYsIDc6IEFkZCBkdC1iaW5kaW5ncyBmb3IgcjQwIGRzaSwgZHBo
eQoKcGF0Y2ggODogQWRkIFI0MCBNSVBJIERTSSBwaXBlbGluZQoKcGF0Y2ggOTogT3ZlcmxheSBw
YXRjaCB0byB0ZXN0IGl0IG9uIEJQSS1NMlUKClsxXSBodHRwczovL3BhdGNod29yay5mcmVlZGVz
a3RvcC5vcmcvc2VyaWVzLzYxMzEwLwpbMl0gaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Au
b3JnL3Nlcmllcy82MDg0Ny8gClszXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9wYXRjaHdvcmsv
Y292ZXIvODYyNzY2LyAKCkphZ2FuIFRla2kgKDkpOgogIGR0LWJpbmRpbmdzOiBkaXNwbGF5OiBB
ZGQgVENPTiBMQ0QgY29tcGF0aWJsZSBmb3IgUjQwCiAgZHJtL3N1bjRpOiB0Y29uOiBBZGQgVENP
TiBMQ0Qgc3VwcG9ydCBmb3IgUjQwCiAgQVJNOiBkdHM6IHN1bjhpOiByNDA6IFVzZSB0Y29uIHRv
cCBjbG9jayBpbmRleCBtYWNyb3MKICBkcm0vc3VuNGk6IHRjb25fdG9wOiBVc2UgY2xvY2sgbmFt
ZSBpbmRleCBtYWNyb3MKICBBUk06IGR0czogc3VuOGk6IHI0MDogQWRkIFRDT04gVE9QIExDRCBj
bG9ja2luZwogIGR0LWJpbmRpbmdzOiBzdW42aS1kc2k6IEFkZCBSNDAgTUlQSS1EU0kgY29tcGF0
aWJsZSAody8gQTY0IGZhbGxiYWNrKQogIGR0LWJpbmRpbmdzOiBzdW42aS1kc2k6IEFkZCBSNDAg
RFBIWSBjb21wYXRpYmxlICh3LyBBMzEgZmFsbGJhY2spCiAgQVJNOiBkdHM6IHN1bjhpOiByNDA6
IEFkZCBNSVBJIERTSSBwaXBlbGluZQogIFtETyBOT1QgTUVSR0VdIEFSTTogZHRzOiBzdW44aS1y
NDA6IGJhbmFuYXBpLW0yLXVsdHJhOiBFbmFibGUgQmFuYW5hcGkgUzA3MFdWMjAtQ1QxNiBEU0kg
cGFuZWwKCiAuLi4vYmluZGluZ3MvZGlzcGxheS9zdW54aS9zdW40aS1kcm0udHh0ICAgICAgfCAg
MSArCiAuLi4vYmluZGluZ3MvZGlzcGxheS9zdW54aS9zdW42aS1kc2kudHh0ICAgICAgfCAgMiAr
CiAuLi4vYm9vdC9kdHMvc3VuOGktcjQwLWJhbmFuYXBpLW0yLXVsdHJhLmR0cyAgfCAzNiArKysr
KysrKwogYXJjaC9hcm0vYm9vdC9kdHMvc3VuOGktcjQwLmR0c2kgICAgICAgICAgICAgIHwgODQg
KysrKysrKysrKysrKysrKystLQogZHJpdmVycy9ncHUvZHJtL3N1bjRpL3N1bjRpX3Rjb24uYyAg
ICAgICAgICAgIHwgIDcgKysKIGRyaXZlcnMvZ3B1L2RybS9zdW40aS9zdW44aV90Y29uX3RvcC5j
ICAgICAgICB8IDEzICstLQogaW5jbHVkZS9kdC1iaW5kaW5ncy9jbG9jay9zdW44aS10Y29uLXRv
cC5oICAgIHwgIDIgKy0KIDcgZmlsZXMgY2hhbmdlZCwgMTM0IGluc2VydGlvbnMoKyksIDExIGRl
bGV0aW9ucygtKQoKLS0gCjIuMTguMC4zMjEuZ2ZmYzZmYTBlMwoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
