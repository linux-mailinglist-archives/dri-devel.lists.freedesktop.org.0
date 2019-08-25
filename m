Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C55A59C6B2
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2019 02:19:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E9A36E15A;
	Mon, 26 Aug 2019 00:19:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9DBF6E101
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Aug 2019 13:51:16 +0000 (UTC)
X-Originating-IP: 87.18.63.98
Received: from uno.homenet.telecomitalia.it (unknown [87.18.63.98])
 (Authenticated sender: jacopo@jmondi.org)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 6957EC0005;
 Sun, 25 Aug 2019 13:51:12 +0000 (UTC)
From: Jacopo Mondi <jacopo+renesas@jmondi.org>
To: laurent.pinchart@ideasonboard.com, kieran.bingham+renesas@ideasonboard.com,
 geert@linux-m68k.org, horms@verge.net.au, uli@fpond.eu, airlied@linux.ie,
 daniel@ffwll.ch
Subject: [PATCH v3 12/14] drm: rcar-du: crtc: Register GAMMA_LUT properties
Date: Sun, 25 Aug 2019 15:51:52 +0200
Message-Id: <20190825135154.11488-13-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190825135154.11488-1-jacopo+renesas@jmondi.org>
References: <20190825135154.11488-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 26 Aug 2019 00:18:57 +0000
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
Cc: muroya@ksk.co.jp, koji.matsuoka.xm@renesas.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, VenkataRajesh.Kalakodima@in.bosch.com,
 Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Harsha.ManjulaMallikarjun@in.bosch.com, Ulrich Hecht <uli+renesas@fpond.eu>
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
L2dwdS9kcm0vcmNhci1kdS9yY2FyX2R1X2NydGMuYwppbmRleCAzZGFjNjA1YzNhNjcuLjIyMmNj
YzIwZDZkOCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9kdV9jcnRj
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
cm1fbW9kZV9jcnRjX3NldF9nYW1tYV9zaXplKGNydGMsIENNTV9HQU1NQV9MVVRfU0laRSk7CisJ
CWRybV9jcnRjX2VuYWJsZV9jb2xvcl9tZ210KGNydGMsIDAsIGZhbHNlLCBDTU1fR0FNTUFfTFVU
X1NJWkUpOwogCX0KIAogCWRybV9jcnRjX2hlbHBlcl9hZGQoY3J0YywgJmNydGNfaGVscGVyX2Z1
bmNzKTsKLS0gCjIuMjIuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
