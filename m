Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F9336DB35
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jul 2019 06:08:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98CD76E524;
	Fri, 19 Jul 2019 04:08:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C06E6E524;
 Fri, 19 Jul 2019 04:08:02 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3763021849;
 Fri, 19 Jul 2019 04:08:01 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 011/101] drm/amdgpu/sriov: Need to initialize the
 HDP_NONSURFACE_BAStE
Date: Fri, 19 Jul 2019 00:06:02 -0400
Message-Id: <20190719040732.17285-11-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190719040732.17285-1-sashal@kernel.org>
References: <20190719040732.17285-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1563509282;
 bh=ryHAMkpvySFnwAvOSwZoHnsoul6TqjxB1N4HpedNgZY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CRDIBXA6rAmGzcQiigrDGOsFRprK68ds6jc+CAqjpgA18vkkKqY514vsLwiCgtqq3
 G9vm2R0VuK0u5+z/fwJBmfgTLKszin1fdPXJcuU0J6Xdw/wAP/0ZOC7fiLUpqOkEMJ
 CFoya/avW0X1ztD9uHCbFzn62SYhf19/ei+vB2Xw=
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
Cc: Sasha Levin <sashal@kernel.org>, Emily Deng <Emily.Deng@amd.com>,
 amd-gfx@lists.freedesktop.org, Tiecheng Zhou <Tiecheng.Zhou@amd.com>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVGllY2hlbmcgWmhvdSA8VGllY2hlbmcuWmhvdUBhbWQuY29tPgoKWyBVcHN0cmVhbSBj
b21taXQgZmUyYjUzMjNkMmMzY2VkYWEzYmY5NDNkYzdhMGQyMzNjODUzYzkxNCBdCgppdCByZXF1
aXJlcyB0byBpbml0aWFsaXplIEhEUF9OT05TVVJGQUNFX0JBU0UsIHNvIGFzIHRvIGF2b2lkCnVz
aW5nIHRoZSB2YWx1ZSBsZWZ0IGJ5IGEgcHJldmlvdXMgVk0gdW5kZXIgc3Jpb3Ygc2NlbmFyaW8u
Cgp2MjogaXQgc2hvdWxkIG5vdCBodXJ0IGJhcmVtZXRhbCwgZ2VuZXJhbGl6ZSBpdCBmb3IgYm90
aCBzcmlvdgphbmQgYmFyZW1ldGFsCgpTaWduZWQtb2ZmLWJ5OiBFbWlseSBEZW5nIDxFbWlseS5E
ZW5nQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IFRpZWNoZW5nIFpob3UgPFRpZWNoZW5nLlpob3VA
YW1kLmNvbT4KUmV2aWV3ZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdA
YW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBh
bWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBTYXNoYSBMZXZpbiA8c2FzaGFsQGtlcm5lbC5vcmc+Ci0t
LQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y5XzAuYyB8IDMgKysrCiAxIGZpbGUg
Y2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvZ21jX3Y5XzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8w
LmMKaW5kZXggNzJmODAxOGZhMmE4Li5lZGUyN2RhYjY3NWYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8wLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvZ21jX3Y5XzAuYwpAQCAtMTAzNyw2ICsxMDM3LDkgQEAgc3RhdGljIGludCBnbWNfdjlf
MF9nYXJ0X2VuYWJsZShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKIAl0bXAgPSBSUkVHMzJf
U09DMTUoSERQLCAwLCBtbUhEUF9IT1NUX1BBVEhfQ05UTCk7CiAJV1JFRzMyX1NPQzE1KEhEUCwg
MCwgbW1IRFBfSE9TVF9QQVRIX0NOVEwsIHRtcCk7CiAKKwlXUkVHMzJfU09DMTUoSERQLCAwLCBt
bUhEUF9OT05TVVJGQUNFX0JBU0UsIChhZGV2LT5nbWMudnJhbV9zdGFydCA+PiA4KSk7CisJV1JF
RzMyX1NPQzE1KEhEUCwgMCwgbW1IRFBfTk9OU1VSRkFDRV9CQVNFX0hJLCAoYWRldi0+Z21jLnZy
YW1fc3RhcnQgPj4gNDApKTsKKwogCS8qIEFmdGVyIEhEUCBpcyBpbml0aWFsaXplZCwgZmx1c2gg
SERQLiovCiAJYWRldi0+bmJpb19mdW5jcy0+aGRwX2ZsdXNoKGFkZXYsIE5VTEwpOwogCi0tIAoy
LjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
