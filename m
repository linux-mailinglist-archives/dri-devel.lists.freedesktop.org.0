Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDED9AD3BB
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2019 09:23:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D423589831;
	Mon,  9 Sep 2019 07:23:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C058389190
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Sep 2019 13:53:45 +0000 (UTC)
X-Originating-IP: 2.224.242.101
Received: from uno.lan (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
 (Authenticated sender: jacopo@jmondi.org)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id C06E5FF819;
 Fri,  6 Sep 2019 13:53:41 +0000 (UTC)
From: Jacopo Mondi <jacopo+renesas@jmondi.org>
To: laurent.pinchart@ideasonboard.com, kieran.bingham+renesas@ideasonboard.com,
 geert@linux-m68k.org, horms@verge.net.au, uli+renesas@fpond.eu,
 VenkataRajesh.Kalakodima@in.bosch.com
Subject: [PATCH v4 7/9] drm: rcar-du: crtc: Register GAMMA_LUT properties
Date: Fri,  6 Sep 2019 15:54:34 +0200
Message-Id: <20190906135436.10622-8-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190906135436.10622-1-jacopo+renesas@jmondi.org>
References: <20190906135436.10622-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 09 Sep 2019 07:23:02 +0000
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
Cc: muroya@ksk.co.jp, airlied@linux.ie, koji.matsuoka.xm@renesas.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Harsha.ManjulaMallikarjun@in.bosch.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RW5hYmxlIHRoZSBHQU1NQV9MVVQgS01TIHByb3BlcnR5IHVzaW5nIHRoZSBmcmFtZXdvcmsgaGVs
cGVycyB0bwpyZWdpc3RlciB0aGUgcHJvcGVydHkgYW5kIHNldCB0aGUgYXNzb2NpYXRlZCBnYW1t
YSB0YWJsZSBtYXhpbXVtIHNpemUuCgpSZXZpZXdlZC1ieTogVWxyaWNoIEhlY2h0IDx1bGkrcmVu
ZXNhc0BmcG9uZC5ldT4KUmV2aWV3ZWQtYnk6IExhdXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGlu
Y2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4KU2lnbmVkLW9mZi1ieTogSmFjb3BvIE1vbmRpIDxqYWNv
cG8rcmVuZXNhc0BqbW9uZGkub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJf
ZHVfY3J0Yy5jIHwgNCArKysrCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9kdV9jcnRjLmMgYi9kcml2ZXJz
L2dwdS9kcm0vcmNhci1kdS9yY2FyX2R1X2NydGMuYwppbmRleCAzZGFjNjA1YzNhNjcuLmRjNTll
ZWVjOTkwYyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9kdV9jcnRj
LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9kdV9jcnRjLmMKQEAgLTEwODIs
NiArMTA4Miw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2NydGNfZnVuY3MgY3J0Y19mdW5j
c19nZW4zID0gewogCS5zZXRfY3JjX3NvdXJjZSA9IHJjYXJfZHVfY3J0Y19zZXRfY3JjX3NvdXJj
ZSwKIAkudmVyaWZ5X2NyY19zb3VyY2UgPSByY2FyX2R1X2NydGNfdmVyaWZ5X2NyY19zb3VyY2Us
CiAJLmdldF9jcmNfc291cmNlcyA9IHJjYXJfZHVfY3J0Y19nZXRfY3JjX3NvdXJjZXMsCisJLmdh
bW1hX3NldCA9IGRybV9hdG9taWNfaGVscGVyX2xlZ2FjeV9nYW1tYV9zZXQsCiB9OwogCiAvKiAt
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLQpAQCAtMTIwNSw2ICsxMjA2LDkgQEAgaW50IHJjYXJfZHVfY3J0
Y19jcmVhdGUoc3RydWN0IHJjYXJfZHVfZ3JvdXAgKnJncnAsIHVuc2lnbmVkIGludCBzd2luZGV4
LAogCWlmIChyY2R1LT5jbW1zW3N3aW5kZXhdKSB7CiAJCXJjcnRjLT5jbW0gPSByY2R1LT5jbW1z
W3N3aW5kZXhdOwogCQlyZ3JwLT5jbW1zX21hc2sgfD0gQklUKGh3aW5kZXggJSAyKTsKKworCQlk
cm1fbW9kZV9jcnRjX3NldF9nYW1tYV9zaXplKGNydGMsIENNMl9MVVRfU0laRSk7CisJCWRybV9j
cnRjX2VuYWJsZV9jb2xvcl9tZ210KGNydGMsIDAsIGZhbHNlLCBDTTJfTFVUX1NJWkUpOwogCX0K
IAogCWRybV9jcnRjX2hlbHBlcl9hZGQoY3J0YywgJmNydGNfaGVscGVyX2Z1bmNzKTsKLS0gCjIu
MjMuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
