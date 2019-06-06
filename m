Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 145DF3858B
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2019 09:46:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBCD889BF5;
	Fri,  7 Jun 2019 07:44:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 076BF89780
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2019 14:22:26 +0000 (UTC)
X-Originating-IP: 2.224.242.101
Received: from uno.lan (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
 (Authenticated sender: jacopo@jmondi.org)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 1F63A20005;
 Thu,  6 Jun 2019 14:22:22 +0000 (UTC)
From: Jacopo Mondi <jacopo+renesas@jmondi.org>
To: laurent.pinchart@ideasonboard.com, kieran.bingham+renesas@ideasonboard.com,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH 19/20] drm: rcar-du: crtc: Register GAMMA_LUT properties
Date: Thu,  6 Jun 2019 16:22:19 +0200
Message-Id: <20190606142220.1392-20-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190606142220.1392-1-jacopo+renesas@jmondi.org>
References: <20190606142220.1392-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 07 Jun 2019 07:43:40 +0000
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
 Harsha.ManjulaMallikarjun@in.bosch.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RW5hYmxlIHRoZSBHQU1NQV9MVVQgS01TIHByb3BlcnR5IHVzaW5nIHRoZSBmcmFtZXdvcmsgaGVs
cGVycyB0bwpyZWdpc3RlciB0aGUgcHJvZXBydHkgYW5kIHRoZSBhc3NvY2lhdGVkIGdhbW1hIHRh
YmxlIHNpemUgbWF4aW11bSBzaXplLgoKU2lnbmVkLW9mZi1ieTogSmFjb3BvIE1vbmRpIDxqYWNv
cG8rcmVuZXNhc0BqbW9uZGkub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJf
ZHVfY3J0Yy5jIHwgMyArKysKIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcmNhci1kdS9yY2FyX2R1X2NydGMuYyBiL2RyaXZlcnMv
Z3B1L2RybS9yY2FyLWR1L3JjYXJfZHVfY3J0Yy5jCmluZGV4IGU2ZDNkZjM3YzgyNy4uYzkyMGZi
NWRiYTY1IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcmNhci1kdS9yY2FyX2R1X2NydGMu
YworKysgYi9kcml2ZXJzL2dwdS9kcm0vcmNhci1kdS9yY2FyX2R1X2NydGMuYwpAQCAtMTIwNyw2
ICsxMjA3LDkgQEAgaW50IHJjYXJfZHVfY3J0Y19jcmVhdGUoc3RydWN0IHJjYXJfZHVfZ3JvdXAg
KnJncnAsIHVuc2lnbmVkIGludCBzd2luZGV4LAogCSAgICByY2R1LT5jbW1zW3N3aW5kZXhdKSB7
CiAJCXJjcnRjLT5jbW0gPSByY2R1LT5jbW1zW3N3aW5kZXhdOwogCQlyZ3JwLT5jbW1zX21hc2sg
fD0gQklUKGh3aW5kZXggJSAyKTsKKworCQlkcm1fbW9kZV9jcnRjX3NldF9nYW1tYV9zaXplKGNy
dGMsIENNTV9HQU1NQV9MVVRfU0laRSk7CisJCWRybV9jcnRjX2VuYWJsZV9jb2xvcl9tZ210KGNy
dGMsIDAsIGZhbHNlLCBDTU1fR0FNTUFfTFVUX1NJWkUpOwogCX0KIAogCWRybV9jcnRjX2hlbHBl
cl9hZGQoY3J0YywgJmNydGNfaGVscGVyX2Z1bmNzKTsKLS0gCjIuMjEuMAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
