Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EE7367A7D
	for <lists+dri-devel@lfdr.de>; Sat, 13 Jul 2019 16:24:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAA266E3E7;
	Sat, 13 Jul 2019 14:24:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.siol.net (mailoutvs19.siol.net [185.57.226.210])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BCAA6E3CE
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Jul 2019 12:03:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.siol.net (Zimbra) with ESMTP id 03A5D520796;
 Sat, 13 Jul 2019 14:03:57 +0200 (CEST)
X-Virus-Scanned: amavisd-new at psrvmta12.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
 by localhost (psrvmta12.zcs-production.pri [127.0.0.1]) (amavisd-new,
 port 10032)
 with ESMTP id GZJ1_W8SsO1t; Sat, 13 Jul 2019 14:03:56 +0200 (CEST)
Received: from mail.siol.net (localhost [127.0.0.1])
 by mail.siol.net (Zimbra) with ESMTPS id A7A2452059A;
 Sat, 13 Jul 2019 14:03:56 +0200 (CEST)
Received: from localhost.localdomain (cpe-194-152-11-237.cable.triera.net
 [194.152.11.237]) (Authenticated sender: 031275009)
 by mail.siol.net (Zimbra) with ESMTPSA id AB370520796;
 Sat, 13 Jul 2019 14:03:52 +0200 (CEST)
From: Jernej Skrabec <jernej.skrabec@siol.net>
To: maxime.ripard@bootlin.com,
	wens@csie.org
Subject: [PATCH 0/3] drm/sun4i: Add support for color encoding and range
Date: Sat, 13 Jul 2019 14:03:43 +0200
Message-Id: <20190713120346.30349-1-jernej.skrabec@siol.net>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 13 Jul 2019 14:24:23 +0000
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

SW4gb3JkZXIgdG8gY29ycmVjdGx5IGNvbnZlcnQgaW1hZ2UgYmV0d2VlbiBZVVYgYW5kIFJHQiwg
eW91IGhhdmUgdG8Ka25vdyBjb2xvciBlbmNvZGluZyBhbmQgY29sb3IgcmFuZ2UuIFRoaXMgcGF0
Y2ggc2V0IGFkZHMgYXBwcm9wcmlhdGUKcHJvcGVydGllcyBhbmQgY29uc2lkZXJzIHRoZW0gd2hl
biBjaG9vc2luZyBDU0MgY29udmVyc2lvbiBtYXRyaXggZm9yCkRFMiBhbmQgREUzLgoKTm90ZSB0
aGF0IHRoaXMgaXMgb25seSB0aGUgaGFsZiBvZiBuZWVkZWQgY2hhbmdlcyB3aGVuIHVzaW5nIEhE
TUkgb3V0cHV0LgpEVyBIRE1JIGJyaWRnZSBkcml2ZXIgaGFzIHRvIGJlIGV4dGVuZGVkIHRvIGhh
dmUgYSBwcm9wZXJ0eSB0byBzZWxlY3QKbGltaXRlZCAoVFZzKSBvciBmdWxsIChQQyBtb25pdG9y
cykgcmFuZ2UuIEJ1dCB0aGF0IHdpbGwgYmUgZG9uZSBhdCBhCmxhdGVyIHRpbWUuCgpQbGVhc2Ug
dGFrZSBhIGxvb2suCgpCZXN0IHJlZ2FyZHMsCkplcm5lagoKSmVybmVqIFNrcmFiZWMgKDMpOgog
IGRybS9zdW40aTogSW50cm9kdWNlIGNvbG9yIGVuY29kaW5nIGFuZCByYW5nZSBwcm9wZXJ0aWVz
CiAgZHJtL3N1bjRpOiBzdW44aV9jc2M6IFNpbXBsaWZ5IHJlZ2lzdGVyIHdyaXRlcwogIGRybS9z
dW40aTogc3VuOGktY3NjOiBBZGQgc3VwcG9ydCBmb3IgY29sb3IgZW5jb2RpbmcgYW5kIHJhbmdl
CgogZHJpdmVycy9ncHUvZHJtL3N1bjRpL3N1bjhpX2NzYy5jICAgICAgfCAxNTUgKysrKysrKysr
KysrKysrKysrKy0tLS0tLQogZHJpdmVycy9ncHUvZHJtL3N1bjRpL3N1bjhpX2NzYy5oICAgICAg
fCAgIDYgKy0KIGRyaXZlcnMvZ3B1L2RybS9zdW40aS9zdW44aV92aV9sYXllci5jIHwgIDIxICsr
Ky0KIDMgZmlsZXMgY2hhbmdlZCwgMTQ2IGluc2VydGlvbnMoKyksIDM2IGRlbGV0aW9ucygtKQoK
LS0gCjIuMjIuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
