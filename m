Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C0BEBA22E
	for <lists+dri-devel@lfdr.de>; Sun, 22 Sep 2019 14:04:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 294086E055;
	Sun, 22 Sep 2019 12:04:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1219 seconds by postgrey-1.36 at gabe;
 Sat, 21 Sep 2019 06:49:32 UTC
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50A326E04A
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Sep 2019 06:49:32 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,531,1559512800"; d="scan'208";a="320165449"
Received: from ip-215.net-89-2-7.rev.numericable.fr (HELO hadrien)
 ([89.2.7.215])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 Sep 2019 08:19:05 +0200
Date: Sat, 21 Sep 2019 08:19:05 +0200 (CEST)
From: Julia Lawall <julia.lawall@lip6.fr>
X-X-Sender: jll@hadrien
To: Lucas Stach <l.stach@pengutronix.de>
Subject: [PATCH] UNCLEAN: fix semicolon.cocci warnings
Message-ID: <alpine.DEB.2.21.1909210817090.3303@hadrien>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Ezequiel Garcia <ezequiel@collabora.com>, kbuild-all@01.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbToga2J1aWxkIHRlc3Qgcm9ib3QgPGxrcEBpbnRlbC5jb20+CgogUmVtb3ZlIHVubmVlZGVk
IHNlbWljb2xvbnMuCgpHZW5lcmF0ZWQgYnk6IHNjcmlwdHMvY29jY2luZWxsZS9taXNjL3NlbWlj
b2xvbi5jb2NjaQoKRml4ZXM6IDg0MWIwNDc1MWRjMCAoIlVOQ0xFQU46IGFkZCBIRE1JIFRYIGRy
aXZlciIpCkNDOiBMdWNhcyBTdGFjaCA8bC5zdGFjaEBwZW5ndXRyb25peC5kZT4KU2lnbmVkLW9m
Zi1ieToga2J1aWxkIHRlc3Qgcm9ib3QgPGxrcEBpbnRlbC5jb20+ClNpZ25lZC1vZmYtYnk6IEp1
bGlhIExhd2FsbCA8anVsaWEubGF3YWxsQGxpcDYuZnI+Ci0tLQoKdHJlZTogICBnaXQ6Ly9naXQu
aW5mcmFkZWFkLm9yZy91c2Vycy9lemVxdWllbGcvbGludXggaGFudHJvLXZwdS1wb3N0cHJvYy1m
b3ItNS41LTIKaGVhZDogICA1NGVkNjE2ZmI5MDE2Yjg5YjdiY2RiOWM4YzhiZDVmMDUzMmMwZGVm
CmNvbW1pdDogODQxYjA0NzUxZGMwYTY3Y2NiZGMwN2I0NDY1NWQ5YWQzNWU2MWFlNyBbMzU4LzUx
MV0gVU5DTEVBTjogYWRkIEhETUkgVFggZHJpdmVyCjo6Ojo6OiBicmFuY2ggZGF0ZTogNSBob3Vy
cyBhZ28KOjo6Ojo6IGNvbW1pdCBkYXRlOiAzIGRheXMgYWdvCgogQVBJX0RQVFguYyB8ICAgIDYg
KysrLS0tCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9jZG4taGRwL21haWxib3gtaWYvQVBJX0RQVFgu
YworKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2Nkbi1oZHAvbWFpbGJveC1pZi9BUElfRFBU
WC5jCkBAIC02MDYsNyArNjA2LDcgQEAgQ0ROX0FQSV9TVEFUVVMgQ0ROX0FQSV9EUFRYX1NldF9W
SUMoc3RhdAogCQlicmVhazsKIAlkZWZhdWx0OgogCQljb2xvckRlcHRoID0gQkNTXzg7Ci0JfTsK
Kwl9CgogCURQX0ZSQU1FUl9QWExfUkVQUl9QYXJhbSA9IChweGxlbmNmb3JtYXQgPDwgOCkgKyBj
b2xvckRlcHRoOwoKQEAgLTYyOSw3ICs2MjksNyBAQCBDRE5fQVBJX1NUQVRVUyBDRE5fQVBJX0RQ
VFhfU2V0X1ZJQyhzdGF0CiAJCWJyZWFrOwogCWRlZmF1bHQ6CiAJCXRlbXBGb3JNaXNjID0gMDsK
LQl9OworCX0KCiAJc3dpdGNoIChiaXRzUGVyUGl4ZWwpIHsKIAljYXNlIDY6CkBAIC02NTQsNyAr
NjU0LDcgQEAgQ0ROX0FQSV9TVEFUVVMgQ0ROX0FQSV9EUFRYX1NldF9WSUMoc3RhdAogCWRlZmF1
bHQ6CiAJCXRlbXBGb3JNaXNjMiA9IDE7CgotCX07CisJfQoKIAlvZGRFdmVuVl9Ub3RhbCA9IHZp
Y190YWJsZVt2aWNNb2RlXVtWX1RPVEFMXSAlIDI7CiAJb2RkRXZlblZfVG90YWwgPSAxIC0gb2Rk
RXZlblZfVG90YWw7Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
