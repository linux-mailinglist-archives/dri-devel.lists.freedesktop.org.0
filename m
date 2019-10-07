Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48BC2CDC0D
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2019 09:02:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BED536E463;
	Mon,  7 Oct 2019 07:01:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from onstation.org (onstation.org [52.200.56.107])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4E5289C88;
 Mon,  7 Oct 2019 01:45:22 +0000 (UTC)
Received: from localhost.localdomain (c-98-239-145-235.hsd1.wv.comcast.net
 [98.239.145.235])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: masneyb)
 by onstation.org (Postfix) with ESMTPSA id D22D93E993;
 Mon,  7 Oct 2019 01:45:20 +0000 (UTC)
From: Brian Masney <masneyb@onstation.org>
To: robdclark@gmail.com,
	sean@poorly.run
Subject: [PATCH RFC v2 0/5] drm/msm: external HDMI support for Nexus 5 phone
Date: Sun,  6 Oct 2019 21:45:04 -0400
Message-Id: <20191007014509.25180-1-masneyb@onstation.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 07 Oct 2019 07:01:50 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=onstation.org; s=default; t=1570412721;
 bh=2LFYD1AbGmqiPuHcwwZO5b7nowKRrVSD+MvHYSK0LXw=;
 h=From:To:Cc:Subject:Date:From;
 b=cZey47tp1WKt/0iGdl5Ym462saWPW/DMHEgcki0YsqTp+o4/1AqpwfSfN8Ujv7vQy
 m/mR3NGN0yq9puJCU5gVXNbckacCqNZ9aCqWzzi8WQZAi22vGpMgh8YAOtWSYd8J69
 51HZMu4MN5aNJvLtaMbPn9RIfsjm5S66Gw9sYBnY=
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
Cc: jonathan@marek.ca, airlied@linux.ie, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 bjorn.andersson@linaro.org, Laurent.pinchart@ideasonboard.com,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SSBhbSB1c2luZyBhbiBBbmFsb2dpeCBTUDYwMDEgU2xpbVBvcnQgTWljcm8tVVNCIHRvIDRLIEhE
TUkgQWRhcHRlciB0bwpjb25uZWN0IG15IE5leHVzIDUgcGhvbmUgdG8gYW4gZXh0ZXJuYWwgZGlz
cGxheS4gVGhlIGV4dGVybmFsIGRpc3BsYXkgaXMKbm90IGZ1bGx5IHdvcmtpbmcgeWV0IGhvd2V2
ZXIgSSB0aGluayBJJ20gY2xvc2UuIFdoZW4gSSBwbHVnIHRoZSBjYWJsZQppbnRvIHRoZSBwaG9u
ZSwgdGhlIGludGVycnVwdCBmb3IgdGhlIGhvdCBwbHVnIGRldGVjdCBHUElPIGZvciB0aGUgSERN
SQpicmlkZ2UgKEFuYWxvZ2l4IEFOWDc4MDgpIGZpcmVzIGFuZCBhbng3OHh4X2hhbmRsZV9jb21t
b25faW50XzQoKSBzaG93cwp0aGF0IHRoZSBpbnRlcnJ1cHQgc3RhdHVzIGJpdCBpcyBzZXQgdG8g
U1BfSFBEX0VTWU5DX0VSUi4KClRoZSBzZWNvbmQgaG90IHBsdWcgZGV0ZWN0IHBpbiAoZm9yIHFj
b20saGRtaS10eC04OTc0IGZvciB0aGUgTVNNCktNUy9EUk0gZHJpdmVyKSBkb2VzIG5vdCBmaXJl
LCBhbmQgdGhlIGNsb2NrcyBhcmUgbm90IGNvbmZpZ3VyZWQgdmlhCm1zbV9oZG1pX3BoeV9wbGxf
aW5pdCgpLiBJIHN1c3BlY3QgdGhhdCB0aGlzIGlzIHRoZSBpc3N1ZSB0aGF0IEkgbmVlZCB0bwpz
b2x2ZSBuZXh0LgoKSSB2ZXJpZmllZCBpbiB0aGUgZG93bnN0cmVhbSBNU00gc291cmNlcyB0aGF0
IElSUSA4IG9uIHRoZSBtZHNzIGlzIHRoZQpjb3JyZWN0IElSUSBudW1iZXIgZm9yIGhkbWktdHgu
IEhlcmUncyB0aGUgcmVsZXZhbnQgbGluZSBmcm9tCi9wcm9jL2ludGVycnVwdHMgc2hvd2luZyB0
aGF0IG5vIGludGVycnVwdHMgYXJlIHRyaWdnZXJlZDoKOTM6IDAgMCAwIDAgbWRzcyA4IEVkZ2Ug
aGRtaV9pc3IuCgpJJ20gZ29pbmcgdG8gY29udGludWUgZGlnZ2luZyB0aHJvdWdoIHRoZSBjb2Rl
IGJ1dCBJJ2QgYXBwcmVjaWF0ZSBhbnkKc3VnZ2VzdGlvbnMgZm9yIHRoaW5ncyB0byBjaGVjay4g
SSBhc3N1bWUgdGhhdCB0aGUgSVJRcyBmb3IgYm90aCBob3QKcGx1ZyBkZXRlY3QgcGlucyBzaG91
bGQgZmlyZSB3aGVuIEkgcGx1ZyB0aGUgY2FibGUgaW4uIFVuZm9ydHVuYXRlbHksCnRoZSBkaXNw
bGF5IGRvZXNuJ3Qgd29yayBmb3IgbWUgd2l0aCB0aGUgZG93bnN0cmVhbSBrZXJuZWwgYW5kIEkg
b25seQpoYXZlIGFjY2VzcyB0byBhIHJ1bm5pbmcgZG93bnN0cmVhbSBrZXJuZWwgb3ZlciB0aGUg
c2VyaWFsIGNvbnNvbGUuCgpIaWdoLWxldmVsIGNoYW5nZXMgc2luY2UgdjE6Ci0gSG90IHBsdWcg
ZGV0ZWN0IGludGVycnVwdCBub3cgd29ya2luZyBwcm9wZXJseSBvbiBIRE1JIGJyaWRnZQotIElu
dHJvZHVjZSBtc204OTc0IFBMTCBzdXBwb3J0CgpJJ3ZlIGhlbGQgYmFjayBzb21lIGNvc21ldGlj
IGNoYW5nZXMgdG8gdGhlIGRyaXZlcnMgYW5kIG9ubHkgaW5jbHVkZWQKdGhlIG5lY2Vzc2FyeSBj
aGFuZ2VzIHJlcXVpcmVkIHRvIGdldCB0aGlzIGZ1bmN0aW9uYWwuIFRoaXMgcmVxdWlyZXMKdGhl
IGZvbGxvd2luZyBwYXRjaCBJIHNlbnQgb3V0IG9uIDIwMTktMDktMjIgdG8gYW5hbG9naXgtYW54
Nzh4eCB0aGF0CmNvcnJlY3RzIGFuIGkyYyBhZGRyZXNzOgpodHRwczovL2xvcmUua2VybmVsLm9y
Zy9sa21sLzIwMTkwOTIyMTc1OTQwLjUzMTEtMS1tYXNuZXliQG9uc3RhdGlvbi5vcmcvCgpCcmlh
biBNYXNuZXkgKDUpOgogIGRybS9icmlkZ2U6IGFuYWxvZ2l4LWFueDc4eHg6IGFkZCBzdXBwb3J0
IGZvciBhdmRkMzMgcmVndWxhdG9yCiAgZHJtL21zbS9oZG1pOiBhZGQgbXNtODk3NCBQTEwgc3Vw
cG9ydAogIEFSTTogZHRzOiBxY29tOiBwbTg5NDE6IGFkZCA1dnMyIHJlZ3VsYXRvciBub2RlCiAg
QVJNOiBkdHM6IHFjb206IG1zbTg5NzQ6IGFkZCBIRE1JIG5vZGVzCiAgQVJNOiBkdHM6IHFjb206
IG1zbTg5NzQtaGFtbWVyaGVhZDogYWRkIHN1cHBvcnQgZm9yIGV4dGVybmFsIGRpc3BsYXkKCiAu
Li4vcWNvbS1tc204OTc0LWxnZS1uZXh1czUtaGFtbWVyaGVhZC5kdHMgICAgfCAxNDIgKysrKwog
YXJjaC9hcm0vYm9vdC9kdHMvcWNvbS1tc204OTc0LmR0c2kgICAgICAgICAgIHwgIDc4ICsrCiBh
cmNoL2FybS9ib290L2R0cy9xY29tLXBtODk0MS5kdHNpICAgICAgICAgICAgfCAgMTAgKwogZHJp
dmVycy9ncHUvZHJtL2JyaWRnZS9hbmFsb2dpeC1hbng3OHh4LmMgICAgIHwgIDMzICsKIGRyaXZl
cnMvZ3B1L2RybS9tc20vTWFrZWZpbGUgICAgICAgICAgICAgICAgICB8ICAgMSArCiBkcml2ZXJz
L2dwdS9kcm0vbXNtL2hkbWkvaGRtaS5oICAgICAgICAgICAgICAgfCAgIDYgKwogZHJpdmVycy9n
cHUvZHJtL21zbS9oZG1pL2hkbWlfcGh5LmMgICAgICAgICAgIHwgICA0ICstCiBkcml2ZXJzL2dw
dS9kcm0vbXNtL2hkbWkvaGRtaV9wbGxfODk3NC5jICAgICAgfCA2ODQgKysrKysrKysrKysrKysr
KysrCiA4IGZpbGVzIGNoYW5nZWQsIDk1NyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCiBj
cmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL21zbS9oZG1pL2hkbWlfcGxsXzg5NzQu
YwoKLS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
