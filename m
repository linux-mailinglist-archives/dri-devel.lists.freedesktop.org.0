Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D5B55F6CD
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2019 12:45:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A2C86E2B4;
	Thu,  4 Jul 2019 10:45:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEBAF6E2B4
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jul 2019 10:45:22 +0000 (UTC)
Received: from lupine.hi.pengutronix.de
 ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1hizEu-0000lO-S1; Thu, 04 Jul 2019 12:45:20 +0200
Received: from pza by lupine with local (Exim 4.89)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1hizEt-0001HC-EP; Thu, 04 Jul 2019 12:45:19 +0200
Message-ID: <1562237119.6641.16.camel@pengutronix.de>
Subject: [GIT PULL] drm/imx: fix stale vblank timestamp after a modeset
From: Philipp Zabel <p.zabel@pengutronix.de>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 04 Jul 2019 12:45:19 +0200
X-Mailer: Evolution 3.22.6-1+deb9u2 
Mime-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: kernel@pengutronix.de, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRGF2ZSwgRGFuaWVsLAoKcGxlYXNlIGNvbnNpZGVyIG1lcmdpbmcgdGhlc2UgaW14LWRybSBm
aXhlcyBmb3IgdjUuMi4KCnJlZ2FyZHMKUGhpbGlwcAoKVGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNp
bmNlIGNvbW1pdCA0Yjk3MmEwMWE3ZGE2MTRiNDc5NjQ3NWY5MzMwOTQ3NTFhMjk1YTJmOgoKICBM
aW51eCA1LjItcmM2ICgyMDE5LTA2LTIyIDE2OjAxOjM2IC0wNzAwKQoKYXJlIGF2YWlsYWJsZSBp
biB0aGUgZ2l0IHJlcG9zaXRvcnkgYXQ6CgogIGdpdDovL2dpdC5wZW5ndXRyb25peC5kZS9naXQv
cHphL2xpbnV4LmdpdCB0YWdzL2lteC1kcm0tZml4ZXMtMjAxOS0wNy0wNAoKZm9yIHlvdSB0byBm
ZXRjaCBjaGFuZ2VzIHVwIHRvIDVhZWFiMmJmYzlmZmE3MmQzY2E3MzQxNjYzNWNiMzc4NWRmYzA3
NmY6CgogIGRybS9pbXg6IG9ubHkgc2VuZCBldmVudCBvbiBjcnRjIGRpc2FibGUgaWYga2VwdCBk
aXNhYmxlZCAoMjAxOS0wNy0wNCAxMjoyMToyNSArMDIwMCkKCi0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KZHJtL2lteDogZml4
IHN0YWxlIHZibGFuayB0aW1lc3RhbXAgYWZ0ZXIgYSBtb2Rlc2V0CgpUaGlzIHNlcmllcyBmaXhl
cyBzdGFsZSB2YmxhbmsgdGltZXN0YW1wcyBpbiB0aGUgZmlyc3QgZXZlbnQgc2VudCBhZnRlcgph
IGNydGMgd2FzIGRpc2FibGVkLiBUaGUgY29yZSBub3cgaXMgbm90aWZpZWQgdmlhIGRybV9jcnRj
X3ZibGFua19vZmYKYmVmb3JlIHNlbmRpbmcgdGhlIGxhc3QgcGVuZGluZyBldmVudCBpbiBhdG9t
aWNfZGlzYWJsZS4gSWYgdGhlIGNydGMgaXMKcmVlbmFibGVkIHJpZ2h0IGF3YXkgZHVyaW5nIHRv
IGEgbW9kZXNldCwgdGhlIGV2ZW50IGlzIG5vdCBzZW50IGF0IGFsbCwKYXMgdGhlIG5leHQgdmJs
YW5rIHdpbGwgdGFrZSBjYXJlIG9mIGl0LgoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpSb2JlcnQgQmVja2V0dCAoMik6CiAg
ICAgIGRybS9pbXg6IG5vdGlmeSBkcm0gY29yZSBiZWZvcmUgc2VuZGluZyBldmVudCBkdXJpbmcg
Y3J0YyBkaXNhYmxlCiAgICAgIGRybS9pbXg6IG9ubHkgc2VuZCBldmVudCBvbiBjcnRjIGRpc2Fi
bGUgaWYga2VwdCBkaXNhYmxlZAoKIGRyaXZlcnMvZ3B1L2RybS9pbXgvaXB1djMtY3J0Yy5jIHwg
NiArKystLS0KIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0p
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
