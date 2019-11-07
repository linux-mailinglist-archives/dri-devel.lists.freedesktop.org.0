Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A37DF41CE
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2019 09:13:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E909F6F86F;
	Fri,  8 Nov 2019 08:12:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo6-p04-ob.smtp.rzone.de (mo6-p04-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5304::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1532B6E40C
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Nov 2019 11:06:27 +0000 (UTC)
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1OAA2UNf2M7PR5/L9P0"
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box by smtp.strato.de (RZmta 44.29.0 DYNA|AUTH)
 with ESMTPSA id L09db3vA7B6Gdh5
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with
 521 ECDH bits, eq. 15360 bits RSA))
 (Client did not present a certificate);
 Thu, 7 Nov 2019 12:06:16 +0100 (CET)
From: "H. Nikolaus Schaller" <hns@goldelico.com>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
 Tony Lindgren <tony@atomide.com>, Paul Cercueil <paul@crapouillou.net>,
 Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paulburton@kernel.org>,
 James Hogan <jhogan@kernel.org>
Subject: [PATCH v2 7/8] ARM: DTS: omap5: add sgx gpu child node
Date: Thu,  7 Nov 2019 12:06:10 +0100
Message-Id: <b71f5c9be8db254d6c0bedaaa3c94122137bd232.1573124770.git.hns@goldelico.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <cover.1573124770.git.hns@goldelico.com>
References: <cover.1573124770.git.hns@goldelico.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 08 Nov 2019 08:12:31 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 t=1573124786; 
 s=strato-dkim-0002; d=goldelico.com;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=V4tJDHqvWbqdzKwfz6qUe3xDpoCXtYHplW9v6qCJKW4=;
 b=JjFgHpp7yt2Pkg+AJLvi6IxlgbkWq/eB0Z9mhJqUm1qap2XVEqDxXWsQV48I3euTnq
 ydkJAV2Zp2RkcRLeO8TqPUTdB51cmYXwgRi8ls70l1zGfZI7Bbqi9ahMNNdikX27PE3T
 9rmm7Z8VtZKG+RmkMpVBAU5TKIZ6OXq0/qeQe8KA++Dv7j3lUklPrQIiuo+3MtpAnQR1
 UVwmrJ7G/OEAB+CwsjKqISJ5kZN3Nrc3nOPdCqEZwhXTEMbiNzwWayrdVup8J0py+geZ
 9xmMLq+Y3oMGfOtIuz2DLWFx/kzoM+GmM/zGj3rtpbN1rKvHUr4nnA3rSGgnwOMJzgxF
 bgzA==
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
Cc: devicetree@vger.kernel.org, linux-omap@vger.kernel.org,
 "H. Nikolaus Schaller" <hns@goldelico.com>, openpvrsgx-devgroup@letux.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mips@vger.kernel.org, kernel@pyra-handheld.com,
 letux-kernel@openphoenux.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

YW5kIGFkZCBpbnRlcnJ1cHQuCgpUZXN0ZWQgb24gUHlyYS1IYW5kaGVsZC4KClNpZ25lZC1vZmYt
Ynk6IEguIE5pa29sYXVzIFNjaGFsbGVyIDxobnNAZ29sZGVsaWNvLmNvbT4KLS0tCiBhcmNoL2Fy
bS9ib290L2R0cy9vbWFwNS5kdHNpIHwgOSArKysrKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA1IGlu
c2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vYm9vdC9k
dHMvb21hcDUuZHRzaSBiL2FyY2gvYXJtL2Jvb3QvZHRzL29tYXA1LmR0c2kKaW5kZXggMWZiNzkz
NzYzOGYwLi4zMzNkYTQ3ODgwODggMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtL2Jvb3QvZHRzL29tYXA1
LmR0c2kKKysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvb21hcDUuZHRzaQpAQCAtMjc0LDEwICsyNzQs
MTEgQEAKIAkJCSNzaXplLWNlbGxzID0gPDE+OwogCQkJcmFuZ2VzID0gPDAgMHg1NjAwMDAwMCAw
eDIwMDAwMDA+OwogCi0JCQkvKgotCQkJICogQ2xvc2VkIHNvdXJjZSBQb3dlclZSIGRyaXZlciwg
bm8gY2hpbGQgZGV2aWNlCi0JCQkgKiBiaW5kaW5nIG9yIGRyaXZlciBpbiBtYWlubGluZQotCQkJ
ICovCisJCQlzZ3g6IGdwdUAwIHsKKwkJCQljb21wYXRpYmxlID0gInRpLG9tYXA1LXNneDU0NC0x
MTYiLCAiaW1nLHNneDU0NC0xMTYiLCAiaW1nLHNneDU0NCI7CisJCQkJcmVnID0gPDB4MCAweDEw
MDAwPjsKKwkJCQlpbnRlcnJ1cHRzID0gPEdJQ19TUEkgMjEgSVJRX1RZUEVfTEVWRUxfSElHSD47
CisJCQl9OwogCQl9OwogCiAJCWRzczogZHNzQDU4MDAwMDAwIHsKLS0gCjIuMjMuMAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
