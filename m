Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 929FDD7BEB
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2019 18:38:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3F6E6E850;
	Tue, 15 Oct 2019 16:38:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A0FC6E359
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2019 10:45:16 +0000 (UTC)
X-Originating-IP: 2.224.242.101
Received: from uno.lan (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
 (Authenticated sender: jacopo@jmondi.org)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id F0D4BC0004;
 Tue, 15 Oct 2019 10:45:11 +0000 (UTC)
From: Jacopo Mondi <jacopo+renesas@jmondi.org>
To: laurent.pinchart@ideasonboard.com, kieran.bingham+renesas@ideasonboard.com,
 geert@linux-m68k.org, horms@verge.net.au, uli+renesas@fpond.eu,
 VenkataRajesh.Kalakodima@in.bosch.com
Subject: [PATCH v5 8/8] drm: rcar-du: kms: Expand comment in vsps parsing
 routine
Date: Tue, 15 Oct 2019 12:46:21 +0200
Message-Id: <20191015104621.62514-9-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191015104621.62514-1-jacopo+renesas@jmondi.org>
References: <20191015104621.62514-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 15 Oct 2019 16:38:12 +0000
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
 seanpaul@chromium.org, Harsha.ManjulaMallikarjun@in.bosch.com,
 ezequiel@collabora.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RXhwYW5kIGNvbW1lbnQgaW4gdGhlICd2c3BzJyBwYXJzaW5nIHJvdXRpbmUgdG8gc3BlY2lmeSB0
aGUgTElGCmNoYW5uZWwgaW5kZXggZGVmYXVsdHMgdG8gMCBpbiBjYXNlIHRoZSBzZWNvbmQgY2Vs
bCBvZiB0aGUgcHJvcGVydHkKaXMgbm90IHNwZWNpZmllZCB0byByZW1haW4gY29tcGF0aWJsZSB3
aXRoIG9sZGVyIERUIGJpbmRpbmdzLgoKUmV2aWV3ZWQtYnk6IExhdXJlbnQgUGluY2hhcnQgPGxh
dXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4KU2lnbmVkLW9mZi1ieTogSmFjb3BvIE1v
bmRpIDxqYWNvcG8rcmVuZXNhc0BqbW9uZGkub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9yY2Fy
LWR1L3JjYXJfZHVfa21zLmMgfCA2ICsrKysrLQogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9u
cygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yY2FyLWR1
L3JjYXJfZHVfa21zLmMgYi9kcml2ZXJzL2dwdS9kcm0vcmNhci1kdS9yY2FyX2R1X2ttcy5jCmlu
ZGV4IDdjOWZiNTg2MGU1NC4uMTg2NDIyYWM1NTJiIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vcmNhci1kdS9yY2FyX2R1X2ttcy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L3Jj
YXJfZHVfa21zLmMKQEAgLTU4Nyw3ICs1ODcsMTEgQEAgc3RhdGljIGludCByY2FyX2R1X3ZzcHNf
aW5pdChzdHJ1Y3QgcmNhcl9kdV9kZXZpY2UgKnJjZHUpCiAKIAkJdnNwc1tqXS5jcnRjc19tYXNr
IHw9IEJJVChpKTsKIAotCQkvKiBTdG9yZSB0aGUgVlNQIHBvaW50ZXIgYW5kIHBpcGUgaW5kZXgg
aW4gdGhlIENSVEMuICovCisJCS8qCisJCSAqIFN0b3JlIHRoZSBWU1AgcG9pbnRlciBhbmQgcGlw
ZSBpbmRleCBpbiB0aGUgQ1JUQy4gSWYgdGhlCisJCSAqIHNlY29uZCBjZWxsIG9mIHRoZSAndnNw
cycgc3BlY2lmaWVyIGlzbid0IHByZXNlbnQsIGRlZmF1bHQKKwkJICogdG8gMCB0byByZW1haW4g
Y29tcGF0aWJsZSB3aXRoIG9sZGVyIERUIGJpbmRpbmdzLgorCQkgKi8KIAkJcmNkdS0+Y3J0Y3Nb
aV0udnNwID0gJnJjZHUtPnZzcHNbal07CiAJCXJjZHUtPmNydGNzW2ldLnZzcF9waXBlID0gY2Vs
bHMgPj0gMSA/IGFyZ3MuYXJnc1swXSA6IDA7CiAJfQotLSAKMi4yMy4wCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
