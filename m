Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C7CE41B583E
	for <lists+dri-devel@lfdr.de>; Thu, 23 Apr 2020 11:33:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E63EC89FF6;
	Thu, 23 Apr 2020 09:33:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1076 seconds by postgrey-1.36 at gabe;
 Thu, 23 Apr 2020 09:33:13 UTC
Received: from ivry12.wolfpond.org (ivry12.wolfpond.org [95.128.40.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3E1289FF6
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Apr 2020 09:33:13 +0000 (UTC)
Received: from cube.wolfpond.org (localhost [127.0.0.1])
 by ivry12.wolfpond.org (8.15.2/8.15.2) with ESMTP id 03N9Drch799220;
 Thu, 23 Apr 2020 11:13:59 +0200 (CEST)
 (envelope-from ftigeot@wolfpond.org)
X-Authentication-Warning: ivry12.wolfpond.org: Host localhost [127.0.0.1]
 claimed to be cube.wolfpond.org
From: =?UTF-8?q?Fran=C3=A7ois=20Tigeot?= <ftigeot@wolfpond.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH libdrm] tests/nouveau/threaded: adapt ioctl signature for
 DragonFly
Date: Thu, 23 Apr 2020 11:13:52 +0200
Message-Id: <20200423091352.107553-1-ftigeot@wolfpond.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.6.2
 (ivry12.wolfpond.org [127.0.0.1]); Thu, 23 Apr 2020 11:13:59 +0200 (CEST)
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: =?UTF-8?q?Fran=C3=A7ois=20Tigeot?= <ftigeot@wolfpond.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RHJhZ29uRmx5IHVzZXMgKGludCwgdW5zaWduZWQgbG9uZyBpbnQsIC4uLikgbGlrZSBHTElCQyBh
bmQgRnJlZUJTRC4KClNpZ25lZC1vZmYtYnk6IEZyYW7Dp29pcyBUaWdlb3QgPGZ0aWdlb3RAd29s
ZnBvbmQub3JnPgotLS0KIHRlc3RzL25vdXZlYXUvdGhyZWFkZWQuYyB8IDIgKy0KIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3Rlc3Rz
L25vdXZlYXUvdGhyZWFkZWQuYyBiL3Rlc3RzL25vdXZlYXUvdGhyZWFkZWQuYwppbmRleCBkZGJh
Yzc0ZS4uNmExMmMxZjMgMTAwNjQ0Ci0tLSBhL3Rlc3RzL25vdXZlYXUvdGhyZWFkZWQuYworKysg
Yi90ZXN0cy9ub3V2ZWF1L3RocmVhZGVkLmMKQEAgLTM2LDcgKzM2LDcgQEAgc3RhdGljIGludCBm
YWlsZWQ7CiAKIHN0YXRpYyBpbnQgaW1wb3J0X2ZkOwogCi0jaWYgZGVmaW5lZChfX0dMSUJDX18p
IHx8IGRlZmluZWQoX19GcmVlQlNEX18pCisjaWYgZGVmaW5lZChfX0dMSUJDX18pIHx8IGRlZmlu
ZWQoX19GcmVlQlNEX18pIHx8IGRlZmluZWQoX19EcmFnb25GbHlfXykKIGludCBpb2N0bChpbnQg
ZmQsIHVuc2lnbmVkIGxvbmcgcmVxdWVzdCwgLi4uKQogI2Vsc2UKIGludCBpb2N0bChpbnQgZmQs
IGludCByZXF1ZXN0LCAuLi4pCi0tIAoyLjI1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbAo=
