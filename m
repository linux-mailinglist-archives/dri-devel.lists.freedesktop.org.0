Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C67A21E8DC
	for <lists+dri-devel@lfdr.de>; Wed, 15 May 2019 09:22:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A25289590;
	Wed, 15 May 2019 07:21:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.siol.net (mailoutvs11.siol.net [185.57.226.202])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A93C18929B
 for <dri-devel@lists.freedesktop.org>; Tue, 14 May 2019 20:43:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.siol.net (Postfix) with ESMTP id 3FA7C521E73;
 Tue, 14 May 2019 22:43:45 +0200 (CEST)
X-Virus-Scanned: amavisd-new at psrvmta09.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
 by localhost (psrvmta09.zcs-production.pri [127.0.0.1]) (amavisd-new,
 port 10032)
 with ESMTP id H35XG354VjHa; Tue, 14 May 2019 22:43:44 +0200 (CEST)
Received: from mail.siol.net (localhost [127.0.0.1])
 by mail.siol.net (Postfix) with ESMTPS id ABA0E521E15;
 Tue, 14 May 2019 22:43:44 +0200 (CEST)
Received: from localhost.localdomain (cpe-86-58-52-202.static.triera.net
 [86.58.52.202]) (Authenticated sender: 031275009)
 by mail.siol.net (Postfix) with ESMTPSA id F0885521DDF;
 Tue, 14 May 2019 22:43:43 +0200 (CEST)
From: Jernej Skrabec <jernej.skrabec@siol.net>
To: maxime.ripard@bootlin.com,
	wens@csie.org
Subject: [PATCH 0/2] drm/sun4i: Fix sun8i HDMI PHY initialization
Date: Tue, 14 May 2019 22:43:35 +0200
Message-Id: <20190514204337.11068-1-jernej.skrabec@siol.net>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 15 May 2019 07:21:53 +0000
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-sunxi@googlegroups.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SSByZWNlaXZlZCBhIHJlcG9ydCB0aGF0IDRLIHJlc29sdXRpb24gZG9lc24ndCB3b3JrIGlmIFUt
Qm9vdCB2aWRlbwpkcml2ZXIgaXMgZGlzYWJsZWQuIEl0IHR1cm5zIG91dCB0aGF0IEhETUkgUEhZ
IGNsb2NrIGRyaXZlciB3YXMKaW5pdGlhbGl6ZWQgcHJlbWF0dXJlbHksIGJlZm9yZSByZXNldCBs
aW5lIHdhcyBkZWFzc2VydGVkIGFuZCBjbG9ja3MKZW5hYmxlZC4gVS1Cb290IHZpZGVvIGRyaXZl
ciBtYXNrZWQgdGhlIGlzc3VlIGJlY2F1c2UgaXQgc2V0IHBpeGVsCmNsb2NrIGNvcnJlY3RseS4K
CkluIHRoZSBwcm9jZXNzIG9mIHJlc2VhcmNoaW5nIHRoZSBidWcsIEkgYWxzbyBmb3VuZCBvdXQg
dGhhdCBmZXcgYml0cwppbiBIRE1JIFBIWSByZWdpc3RlcnMgd2VyZSBub3Qgc2V0IGNvcnJlY3Rs
eS4gV2hpbGUgdGhlcmUgaXMgbm8Kbm90aWNlYWJsZSBjaGFuZ2UgKDRLIHJlc29sdXRpb24gd29y
a3Mgd2l0aCBib3RoIHNldHRpbmdzKSwgSSd2ZQphZGRlZCBmaXggYW55d2F5LCB0byBiZSBjb25m
b3JtYW50IHdpdGggdmVuZG9yIGRvY3VtZW50YXRpb24uCgpQbGVhc2UgY2hlY2sgaXQgb3V0LgoK
QmVzdCByZWdhcmRzLApKZXJuZWoKCkplcm5laiBTa3JhYmVjICgyKToKICBkcm0vc3VuNGk6IEZp
eCBzdW44aSBIRE1JIFBIWSBjbG9jayBpbml0aWFsaXphdGlvbgogIGRybS9zdW40aTogRml4IHN1
bjhpIEhETUkgUEhZIGNvbmZpZ3VyYXRpb24gZm9yID4gMTQ4LjUgTUh6CgogZHJpdmVycy9ncHUv
ZHJtL3N1bjRpL3N1bjhpX2hkbWlfcGh5LmMgfCAyOSArKysrKysrKysrKysrKy0tLS0tLS0tLS0t
LQogMSBmaWxlIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKyksIDEzIGRlbGV0aW9ucygtKQoKLS0g
CjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
