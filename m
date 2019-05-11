Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F35A51A7CE
	for <lists+dri-devel@lfdr.de>; Sat, 11 May 2019 14:32:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C94F989E01;
	Sat, 11 May 2019 12:32:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A9FC89E01;
 Sat, 11 May 2019 12:31:59 +0000 (UTC)
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.76) (envelope-from <colin.king@canonical.com>)
 id 1hPRAR-0007va-5C; Sat, 11 May 2019 12:31:55 +0000
From: Colin King <colin.king@canonical.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Zhou <David1.Zhou@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/amd/display: remove redundant assignment to variable
 actual_clock
Date: Sat, 11 May 2019 13:31:54 +0100
Message-Id: <20190511123154.2708-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.20.1
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogQ29saW4gSWFuIEtpbmcgPGNvbGluLmtpbmdAY2Fub25pY2FsLmNvbT4KClRoZSB2YXJp
YWJsZSBhY3R1YWxfY2xvY2sgaXMgYmVpbmcgaW5pdGlhbGl6ZWQgaG93ZXZlciB0aGlzIGlzIG5l
dmVyCnJlYWQgYW5kIGxhdGVyIGl0IGlzIGJlaW5nIHJlYXNzaWduZWQgdG8gYSBuZXcgdmFsdWUu
IFRoZSBpbml0aWFsaXphdGlvbgppcyByZWR1bmRhbnQgYW5kIGhlbmNlIGNhbiBiZSByZW1vdmVk
LgoKQWRkcmVzc2VzLUNvdmVyaXR5OiAoIlVudXNlZCBWYWx1ZSIpClNpZ25lZC1vZmYtYnk6IENv
bGluIElhbiBLaW5nIDxjb2xpbi5raW5nQGNhbm9uaWNhbC5jb20+Ci0tLQogZHJpdmVycy9ncHUv
ZHJtL2FtZC9kaXNwbGF5L2RjL2RjZS9kY2VfY2xrX21nci5jIHwgMiArLQogMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZS9kY2VfY2xrX21nci5jIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9kaXNwbGF5L2RjL2RjZS9kY2VfY2xrX21nci5jCmluZGV4IDZiMmUyMDc3NzdmMC4uZmRk
OTczYzAzZGNhIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNl
L2RjZV9jbGtfbWdyLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZS9k
Y2VfY2xrX21nci5jCkBAIC0zNDQsNyArMzQ0LDcgQEAgaW50IGRjZTExMl9zZXRfZGlzcGNsayhz
dHJ1Y3QgY2xrX21nciAqY2xrX21nciwgaW50IHJlcXVlc3RlZF9jbGtfa2h6KQogCXN0cnVjdCBk
Y19iaW9zICpicCA9IGNsa19tZ3ItPmN0eC0+ZGNfYmlvczsKIAlzdHJ1Y3QgZGMgKmNvcmVfZGMg
PSBjbGtfbWdyLT5jdHgtPmRjOwogCXN0cnVjdCBkbWN1ICpkbWN1ID0gY29yZV9kYy0+cmVzX3Bv
b2wtPmRtY3U7Ci0JaW50IGFjdHVhbF9jbG9jayA9IHJlcXVlc3RlZF9jbGtfa2h6OworCWludCBh
Y3R1YWxfY2xvY2s7CiAJLyogUHJlcGFyZSB0byBwcm9ncmFtIGRpc3BsYXkgY2xvY2sqLwogCW1l
bXNldCgmZGNlX2Nsa19wYXJhbXMsIDAsIHNpemVvZihkY2VfY2xrX3BhcmFtcykpOwogCi0tIAoy
LjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
