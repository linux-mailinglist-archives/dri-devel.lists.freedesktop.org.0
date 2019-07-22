Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 712B771272
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2019 09:15:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E4928919B;
	Tue, 23 Jul 2019 07:14:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pokefinder.org (sauhun.de [88.99.104.3])
 by gabe.freedesktop.org (Postfix) with ESMTP id 52C8A89CF5
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 17:26:10 +0000 (UTC)
Received: from localhost (p54B33E22.dip0.t-ipconnect.de [84.179.62.34])
 by pokefinder.org (Postfix) with ESMTPSA id 9521C4A1493;
 Mon, 22 Jul 2019 19:26:09 +0200 (CEST)
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Subject: [PATCH 0/1] gpu: convert subsystem to i2c_new_dummy_device()
Date: Mon, 22 Jul 2019 19:26:08 +0200
Message-Id: <20190722172609.3731-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 23 Jul 2019 07:14:10 +0000
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
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBzZXJpZXMgaXMgcGFydCBvZiBhIHRyZWUtd2lkZSBtb3ZlbWVudCB0byByZXBsYWNlIHRo
ZSBJMkMgQVBJIGNhbGwKJ2kyY19uZXdfZHVtbXknIHdoaWNoIHJldHVybnMgTlVMTCB3aXRoIGl0
cyBuZXcgY291bnRlcnBhcnQgcmV0dXJuaW5nIGFuCkVSUlBUUi4KClRoZSBzZXJpZXMgd2FzIGdl
bmVyYXRlZCB3aXRoIGNvY2NpbmVsbGUgKGF1ZGl0ZWQgYWZ0ZXJ3YXJkcywgb2YgY291cnNlKSBh
bmQKYnVpbGQgdGVzdGVkIGJ5IG1lIGFuZCBieSBidWlsZGJvdC4gTm8gdGVzdHMgb24gSFcgaGF2
ZSBiZWVuIHBlcmZvcm1lZC4KClRoZSBicmFuY2ggaXMgYmFzZWQgb24gdjUuMy1yYzEuIEEgYnJh
bmNoICh3aXRoIHNvbWUgbW9yZSBzdHVmZiBpbmNsdWRlZCkgY2FuCmJlIGZvdW5kIGhlcmU6Cgpn
aXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvd3NhL2xpbnV4Lmdp
dCByZW5lc2FzL2kyYy9uZXdfZHVtbXkKClNvbWUgZHJpdmVycyBzdGlsbCBuZWVkIHRvIGJlIG1h
bnVhbGx5IGNvbnZlcnRlZC4gUGF0Y2hlcyBmb3IgdGhvc2Ugd2lsbCBiZQpzZW50IG91dCBpbmRp
dmlkdWFsbHkuCgoKV29sZnJhbSBTYW5nICgxKToKICBncHU6IGRybTogYnJpZGdlOiBhbmFsb2dp
eC1hbng3OHh4OiBjb252ZXJ0IHRvIGkyY19uZXdfZHVtbXlfZGV2aWNlCgogZHJpdmVycy9ncHUv
ZHJtL2JyaWRnZS9hbmFsb2dpeC1hbng3OHh4LmMgfCA2ICsrKy0tLQogMSBmaWxlIGNoYW5nZWQs
IDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCi0tIAoyLjIwLjEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
