Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96EFB357E3
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2019 09:34:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94E12896B5;
	Wed,  5 Jun 2019 07:33:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD2E1892C6
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2019 07:05:46 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id e5so7608378pls.13
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Jun 2019 00:05:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rbPIQS9Fmw5oTtgndIQLG4f4C7zxyYTux8kyKub57FA=;
 b=pTUPdblfiJFbdRKzeviQCz/suJWqPtUACISJbig36PdL6IBzCBNj3ouRB6DQQYnVA+
 MlranoVd+XjRCitmpW6Sxhh5++w5IDMB3mu1ycLu7ARJLjEcz1WxjQnsE7+Kyzs9+4Fg
 Aalic0T8spSZFj99dcajkTWfOygmR4l0+L/XvmEi3NS+3OSs/GWwfAvRxIJ7ZEwhYxdH
 RtRErME7B0ilk48mgjMPE/QbJC0AyPitGg3q2lonmVK6dASTpn1QwWRxHvT2GKJvN15f
 4I8w0LY9iG1IrFZUIKyK/JnNfHrP1I50HqbM3YX91pO90YRNdBLZ0rogTlzE6/xnov4M
 YHUA==
X-Gm-Message-State: APjAAAX2vqvODmwdi/2zrouCsplgOEZqm2h0cdtdQSXHgTcsy//0xx5Y
 lMbEbYPgp3uq4X+G7kIwZeFADgLBWHc=
X-Google-Smtp-Source: APXvYqwwtx7cLpi6/3SbzLxsfe67iwSRMqCZtxpzZk6fJB29m0FN0KYAyk+OHByP79AIhNJLX7RDzw==
X-Received: by 2002:a17:902:542:: with SMTP id
 60mr19568359plf.68.1559718346021; 
 Wed, 05 Jun 2019 00:05:46 -0700 (PDT)
Received: from localhost.lan (c-24-22-235-96.hsd1.wa.comcast.net.
 [24.22.235.96])
 by smtp.gmail.com with ESMTPSA id d132sm6527348pfd.61.2019.06.05.00.05.44
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 05 Jun 2019 00:05:45 -0700 (PDT)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 15/15] drm/bridge: tc358767: Replace magic number in
 tc_main_link_enable()
Date: Wed,  5 Jun 2019 00:05:07 -0700
Message-Id: <20190605070507.11417-16-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190605070507.11417-1-andrew.smirnov@gmail.com>
References: <20190605070507.11417-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 05 Jun 2019 07:33:23 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rbPIQS9Fmw5oTtgndIQLG4f4C7zxyYTux8kyKub57FA=;
 b=rV/FZ2k5ROTiwaU+QXmT18Q1X1XIfCyR4CuDNLomAL9GmG0K/H7k/bXUWOVlmzuxqr
 be68f1Qm8zwGc69LlLEY8vyoyGxmNKq55wQVgKt/VXliZaiPk3mV99UE1jVCCM/B4cPI
 /asHO2RFXQmPBlhXRY1iQpScW0QI69rG+4BevPUvNLGUIghl/BgY3M/rh1h2aFLGD26y
 Bs7o/6pdZ6XOABeOEynE65OpxMzLv1sFJd9kv0B8TCA770G1lPRQLoTCyzumG331Alzb
 0TSoxYTi5nJSmy51QGVkT8NUpMW7xCNmhtz+ulFHyySALZYnIobgPOCHzNk7YNdEOqoM
 Vudg==
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
Cc: Cory Tusar <cory.tusar@zii.aero>, Archit Taneja <architt@codeaurora.org>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Andrey Gusakov <andrey.gusakov@cogentembedded.com>,
 linux-kernel@vger.kernel.org, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Chris Healy <cphealy@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2UgZG9uJ3QgbmVlZCA4IGJ5dGUgYXJyYXksIERQX0xJTktfU1RBVFVTX1NJWkUgKDYpIHNob3Vs
ZCBiZQplbm91Z2guIFRoaXMgYWxzbyBnZXRzIHJpZCBvZiBhIG1hZ2ljIG51bWJlciBhcyBhIGJv
bnVzLgoKU2lnbmVkLW9mZi1ieTogQW5kcmV5IFNtaXJub3YgPGFuZHJldy5zbWlybm92QGdtYWls
LmNvbT4KQ2M6IEFyY2hpdCBUYW5lamEgPGFyY2hpdHRAY29kZWF1cm9yYS5vcmc+CkNjOiBBbmRy
emVqIEhhamRhIDxhLmhhamRhQHNhbXN1bmcuY29tPgpDYzogTGF1cmVudCBQaW5jaGFydCA8TGF1
cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPgpDYzogVG9taSBWYWxrZWluZW4gPHRvbWku
dmFsa2VpbmVuQHRpLmNvbT4KQ2M6IEFuZHJleSBHdXNha292IDxhbmRyZXkuZ3VzYWtvdkBjb2dl
bnRlbWJlZGRlZC5jb20+CkNjOiBQaGlsaXBwIFphYmVsIDxwLnphYmVsQHBlbmd1dHJvbml4LmRl
PgpDYzogQ29yeSBUdXNhciA8Y29yeS50dXNhckB6aWkuYWVybz4KQ2M6IENocmlzIEhlYWx5IDxj
cGhlYWx5QGdtYWlsLmNvbT4KQ2M6IEx1Y2FzIFN0YWNoIDxsLnN0YWNoQHBlbmd1dHJvbml4LmRl
PgpDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpDYzogbGludXgta2VybmVsQHZn
ZXIua2VybmVsLm9yZwotLS0KIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGMzNTg3NjcuYyB8IDIg
Ky0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGMzNTg3NjcuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9icmlkZ2UvdGMzNTg3NjcuYwppbmRleCA0MWE5NzZkZmYxM2IuLmNmMzhmOTQzZTY1NiAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90YzM1ODc2Ny5jCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS9icmlkZ2UvdGMzNTg3NjcuYwpAQCAtODkzLDcgKzg5Myw3IEBAIHN0YXRpYyBpbnQg
dGNfbWFpbl9saW5rX2VuYWJsZShzdHJ1Y3QgdGNfZGF0YSAqdGMpCiAJdTMyIGRwX3BoeV9jdHJs
OwogCXUzMiB2YWx1ZTsKIAlpbnQgcmV0OwotCXU4IHRtcFs4XTsKKwl1OCB0bXBbRFBfTElOS19T
VEFUVVNfU0laRV07CiAKIAlkZXZfZGJnKHRjLT5kZXYsICJsaW5rIGVuYWJsZVxuIik7CiAKLS0g
CjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
