Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 05C8651927
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2019 18:54:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 204BE89D4A;
	Mon, 24 Jun 2019 16:54:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.178])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1A56D89CD9;
 Mon, 24 Jun 2019 16:54:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id 74C322A6045;
 Mon, 24 Jun 2019 18:54:09 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id BgCcVeKurUI5; Mon, 24 Jun 2019 18:54:09 +0200 (CEST)
Received: from thor (116.245.63.188.dynamic.wline.res.cust.swisscom.ch
 [188.63.245.116])
 by netline-mail3.netline.ch (Postfix) with ESMTPSA id 77E7D2A604D;
 Mon, 24 Jun 2019 18:54:07 +0200 (CEST)
Received: from daenzer by thor with local (Exim 4.92)
 (envelope-from <michel@daenzer.net>)
 id 1hfSEI-0003Zv-Ra; Mon, 24 Jun 2019 18:54:06 +0200
From: =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel@daenzer.net>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH mesa 9/9] winsys/amdgpu: Use amdgpu_bo_handle_type_kms_user
 for API KMS handles
Date: Mon, 24 Jun 2019 18:54:06 +0200
Message-Id: <20190624165406.13682-10-michel@daenzer.net>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190624165406.13682-1-michel@daenzer.net>
References: <20190624165406.13682-1-michel@daenzer.net>
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
Cc: Emil Velikov <emil.l.velikov@gmail.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogTWljaGVsIETDpG56ZXIgPG1pY2hlbC5kYWVuemVyQGFtZC5jb20+CgpHYWxsaXVtIEFQ
SSBjYWxsZXJzIGV4cGVjdCB0aGUgcmV0dXJuZWQgaGFuZGxlcyB0byBiZSB2YWxpZCBmb3IgdGhl
CkRSTSBmaWxlIGRlc2NyaXB0b3IgcGFzc2VkIHRvIHRoZSBkcml2ZXIgZHVyaW5nIGluaXRpYWxp
emF0aW9uLCB3aGljaAptYXkgbm90IGJlIHRoZSBjYXNlIHdpdGggYW1kZ3B1X2JvX2hhbmRsZV90
eXBlX2ttcy4KCkJ1Z3ppbGxhOiBodHRwczovL2J1Z3MuZnJlZWRlc2t0b3Aub3JnLzExMDkwMwpT
aWduZWQtb2ZmLWJ5OiBNaWNoZWwgRMOkbnplciA8bWljaGVsLmRhZW56ZXJAYW1kLmNvbT4KLS0t
CiBzcmMvZ2FsbGl1bS93aW5zeXMvYW1kZ3B1L2RybS9hbWRncHVfYm8uYyB8IDIgKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3Ny
Yy9nYWxsaXVtL3dpbnN5cy9hbWRncHUvZHJtL2FtZGdwdV9iby5jIGIvc3JjL2dhbGxpdW0vd2lu
c3lzL2FtZGdwdS9kcm0vYW1kZ3B1X2JvLmMKaW5kZXggMzcwOThhYjMwNWYuLmQ0ZjdlMWM3YTk1
IDEwMDY0NAotLS0gYS9zcmMvZ2FsbGl1bS93aW5zeXMvYW1kZ3B1L2RybS9hbWRncHVfYm8uYwor
KysgYi9zcmMvZ2FsbGl1bS93aW5zeXMvYW1kZ3B1L2RybS9hbWRncHVfYm8uYwpAQCAtMTU0NCw3
ICsxNTQ0LDcgQEAgc3RhdGljIGJvb2wgYW1kZ3B1X2JvX2dldF9oYW5kbGUoc3RydWN0IHBiX2J1
ZmZlciAqYnVmZmVyLAogICAgICAgdHlwZSA9IGFtZGdwdV9ib19oYW5kbGVfdHlwZV9kbWFfYnVm
X2ZkOwogICAgICAgYnJlYWs7CiAgICBjYXNlIFdJTlNZU19IQU5ETEVfVFlQRV9LTVM6Ci0gICAg
ICB0eXBlID0gYW1kZ3B1X2JvX2hhbmRsZV90eXBlX2ttczsKKyAgICAgIHR5cGUgPSBhbWRncHVf
Ym9faGFuZGxlX3R5cGVfa21zX3VzZXI7CiAgICAgICBicmVhazsKICAgIGRlZmF1bHQ6CiAgICAg
ICByZXR1cm4gZmFsc2U7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
