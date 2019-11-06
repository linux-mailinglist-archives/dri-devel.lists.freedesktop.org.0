Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB47EF12DC
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2019 10:51:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EDFA6EC91;
	Wed,  6 Nov 2019 09:51:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mslow2.mail.gandi.net (mslow2.mail.gandi.net [217.70.178.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 241686EC8C
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Nov 2019 09:51:23 +0000 (UTC)
Received: from relay10.mail.gandi.net (unknown [217.70.178.230])
 by mslow2.mail.gandi.net (Postfix) with ESMTP id 43F413B5696
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Nov 2019 09:44:32 +0000 (UTC)
Received: from localhost.localdomain (lfbn-1-17395-211.w86-250.abo.wanadoo.fr
 [86.250.200.211])
 (Authenticated sender: paul.kocialkowski@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 3BBEE240016;
 Wed,  6 Nov 2019 09:44:09 +0000 (UTC)
From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] drm/gma500: Add missing call to allow enabling vblank on
 psb/cdv
Date: Wed,  6 Nov 2019 10:43:59 +0100
Message-Id: <20191106094400.445834-2-paul.kocialkowski@bootlin.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191106094400.445834-1-paul.kocialkowski@bootlin.com>
References: <20191106094400.445834-1-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
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
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBhZGRzIGEgbWlzc2luZyBjYWxsIHRvIGRybV9jcnRjX3ZibGFua19vbiB0byB0aGUgY29t
bW9uIERQTVMgaGVscGVyCih1c2VkIGJ5IHBvdWxzYm8gYW5kIGNlZGFydHJhaWwpLCB3aGljaCBp
cyBjYWxsZWQgaW4gdGhlIENSVEMgZW5hYmxlIHBhdGguCgpXaXRoIHRoYXQgY2FsbCwgaXQgYmVj
b21lcyBwb3NzaWJsZSB0byBlbmFibGUgdmJsYW5rIHdoZW4gbmVlZGVkLgpJdCBpcyBhbHJlYWR5
IGJhbGFuY2VkIGJ5IGEgZHJtX2NydGNfdmJsYW5rX29mZiBjYWxsIGluIHRoZSBoZWxwZXIuCgpP
dGhlciBwbGF0Zm9ybXMgKG9ha3RyYWlsIGFuZCBtZWRmaWVsZCkgdXNlIGEgZGVkaWNhdGVkIERQ
TVMgaGVscGVyIHRoYXQKZG9lcyBub3QgaGF2ZSB0aGUgcHJvcGVyIHZibGFuayBvbi9vZmYgaG9v
a3MuIFRoZXkgYXJlIG5vdCBhZGRlZCBpbiB0aGlzCmNvbW1pdCBkdWUgdG8gbGFjayBvZiBoYXJk
d2FyZSB0byB0ZXN0IGl0IHdpdGguCgpTaWduZWQtb2ZmLWJ5OiBQYXVsIEtvY2lhbGtvd3NraSA8
cGF1bC5rb2NpYWxrb3dza2lAYm9vdGxpbi5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2dtYTUw
MC9nbWFfZGlzcGxheS5jIHwgMiArKwogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9nbWE1MDAvZ21hX2Rpc3BsYXkuYyBiL2RyaXZl
cnMvZ3B1L2RybS9nbWE1MDAvZ21hX2Rpc3BsYXkuYwppbmRleCBlMjBjY2I1ZDEwZmQuLmJjMDdh
ZTJhOWExZCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2dtYTUwMC9nbWFfZGlzcGxheS5j
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9nbWE1MDAvZ21hX2Rpc3BsYXkuYwpAQCAtMjU1LDYgKzI1
NSw4IEBAIHZvaWQgZ21hX2NydGNfZHBtcyhzdHJ1Y3QgZHJtX2NydGMgKmNydGMsIGludCBtb2Rl
KQogCQkvKiBHaXZlIHRoZSBvdmVybGF5IHNjYWxlciBhIGNoYW5jZSB0byBlbmFibGUKIAkJICog
aWYgaXQncyBvbiB0aGlzIHBpcGUgKi8KIAkJLyogcHNiX2ludGVsX2NydGNfZHBtc192aWRlbyhj
cnRjLCB0cnVlKTsgVE9ETyAqLworCisJCWRybV9jcnRjX3ZibGFua19vbihjcnRjKTsKIAkJYnJl
YWs7CiAJY2FzZSBEUk1fTU9ERV9EUE1TX09GRjoKIAkJaWYgKCFnbWFfY3J0Yy0+YWN0aXZlKQot
LSAKMi4yMy4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
