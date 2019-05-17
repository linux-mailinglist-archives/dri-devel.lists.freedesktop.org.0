Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1201721F88
	for <lists+dri-devel@lfdr.de>; Fri, 17 May 2019 23:21:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50565896F7;
	Fri, 17 May 2019 21:20:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F028896F7
 for <dri-devel@lists.freedesktop.org>; Fri, 17 May 2019 21:20:57 +0000 (UTC)
Received: from localhost.localdomain
 (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4429B2F3;
 Fri, 17 May 2019 23:20:55 +0200 (CEST)
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-renesas-soc@vger.kernel.org
Subject: [PATCH] drm: rcar-du: writeback: include interface header
Date: Fri, 17 May 2019 22:20:49 +0100
Message-Id: <20190517212050.3561-1-kieran.bingham+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1558128055;
 bh=+VAz6nhSz+PL5Syoez/pqa6yJEk2vBBqAJ3QhZ+uFNE=;
 h=From:To:Cc:Subject:Date:From;
 b=a10CaXWHLAXqVCpAwAZ8OQHTEU6f5U/GJXdrNHwE9RA1L09OtORcXfEDPLsbp+W2L
 3dor29IbQkOiCkBnrxRv7WQCmPIYeXNo+7NmiTLMwjo3r+F2DVsG1pTLr+QXTEJaPi
 CoXXGmWu90rZg452O/kQ3LJNqSDm/oMwy3bOsPnk=
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
Cc: David Airlie <airlied@linux.ie>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 "open list:DRM DRIVERS FOR RENESAS" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIG5ldyB3cml0ZWJhY2sgZmVhdHVyZSBpcyBleHBvcnRzIGZ1bmN0aW9ucyBzbyB0aGF0IHRo
ZXkgY2FuCmludGVncmF0ZSBpbnRvIHRoZSByY2FyX2R1X2ttcyBtb2R1bGUuCgpUaGUgaW50ZXJm
YWNlIGZ1bmN0aW9ucyBhcmUgZGVmaW5lZCBpbiB0aGUgcmNhcl9kdV93cml0ZWJhY2sgaGVhZGVy
LCBidXQKaXQgaXMgbm90IGluY2x1ZGVkIGluIHRoZSBvYmplY3QgZmlsZSBpdHNlbGYgbGVhZGlu
ZyB0byBjb21waWxlcgp3YXJuaW5ncyBmb3IgbWlzc2luZyBwcm90b3R5cGVzLgoKSW5jbHVkZSB0
aGUgaGVhZGVyIGFzIGFwcHJvcHJpYXRlLgoKU2lnbmVkLW9mZi1ieTogS2llcmFuIEJpbmdoYW0g
PGtpZXJhbi5iaW5naGFtK3JlbmVzYXNAaWRlYXNvbmJvYXJkLmNvbT4KLS0tCiBkcml2ZXJzL2dw
dS9kcm0vcmNhci1kdS9yY2FyX2R1X3dyaXRlYmFjay5jIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcmNhci1kdS9yY2Fy
X2R1X3dyaXRlYmFjay5jIGIvZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9kdV93cml0ZWJh
Y2suYwppbmRleCA5ODlhMGJlOTQxMzEuLmFlMDcyOTBiYmE2YSAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL3JjYXItZHUvcmNhcl9kdV93cml0ZWJhY2suYworKysgYi9kcml2ZXJzL2dwdS9k
cm0vcmNhci1kdS9yY2FyX2R1X3dyaXRlYmFjay5jCkBAIC0xNCw2ICsxNCw3IEBACiAjaW5jbHVk
ZSAicmNhcl9kdV9jcnRjLmgiCiAjaW5jbHVkZSAicmNhcl9kdV9kcnYuaCIKICNpbmNsdWRlICJy
Y2FyX2R1X2ttcy5oIgorI2luY2x1ZGUgInJjYXJfZHVfd3JpdGViYWNrLmgiCiAKIC8qKgogICog
c3RydWN0IHJjYXJfZHVfd2JfY29ubl9zdGF0ZSAtIERyaXZlci1zcGVjaWZpYyB3cml0ZWJhY2sg
Y29ubmVjdG9yIHN0YXRlCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
