Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A5F6245658
	for <lists+dri-devel@lfdr.de>; Sun, 16 Aug 2020 09:13:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 728B66E10F;
	Sun, 16 Aug 2020 07:13:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6A526E0F4
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Aug 2020 07:13:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id 88F7FFB05;
 Sun, 16 Aug 2020 09:13:45 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id obmw7upeefIK; Sun, 16 Aug 2020 09:13:44 +0200 (CEST)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id C38CE457CC; Sun, 16 Aug 2020 09:13:43 +0200 (CEST)
From: =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Ondrej Jirman <megi@xff.cz>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] Modernize rocktech,jh057n00900 bindings a bit
Date: Sun, 16 Aug 2020 09:13:41 +0200
Message-Id: <cover.1597561897.git.agx@sigxcpu.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyB3YXMgcHJvbXB0ZWQgYnkgU2FtJ3MgcmV2aWV3IGluCmh0dHBzOi8vbG9yZS5rZXJuZWwu
b3JnL2RyaS1kZXZlbC8yMDIwMDgxNTIxMDgwMi5HQTEyNDI4MzFAcmF2bmJvcmcub3JnLwphbmQg
eWFtbGxpbnQuIEkgYWxzbyBhZGRlZCBteXNlbGYgYXMgbWFpbnRhaW5lciwgaG9wZSB0aGF0J3Mg
by5rLgoKR3VpZG8gR8O8bnRoZXIgKDIpOgogIGR0LWJpbmRpbmdzOiBwYW5lbDogcm9ja3RlY2gs
amgwNTduMDA5MDA6IE1vZGVybml6ZQogIGR0LWJpbmRpbmdzOiBwYW5lbDogcm9ja3RlY2gsamgw
NTduMDA5MDA6IEFkZCBteXNlbGYgYXMgbWFpbnRhaW5lcgoKIC4uLi9kaXNwbGF5L3BhbmVsL3Jv
Y2t0ZWNoLGpoMDU3bjAwOTAwLnlhbWwgICB8IDQwICsrKysrKysrKy0tLS0tLS0tLS0KIDEgZmls
ZSBjaGFuZ2VkLCAxOSBpbnNlcnRpb25zKCspLCAyMSBkZWxldGlvbnMoLSkKCi0tIAoyLjI2LjIK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
