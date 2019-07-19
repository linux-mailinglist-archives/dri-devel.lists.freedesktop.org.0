Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC0C86D9B5
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jul 2019 05:57:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 812536E4B0;
	Fri, 19 Jul 2019 03:57:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C34496E4AB;
 Fri, 19 Jul 2019 03:57:51 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BF38121852;
 Fri, 19 Jul 2019 03:57:50 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.2 025/171] drm/amdgpu/sriov: Need to initialize the
 HDP_NONSURFACE_BAStE
Date: Thu, 18 Jul 2019 23:54:16 -0400
Message-Id: <20190719035643.14300-25-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190719035643.14300-1-sashal@kernel.org>
References: <20190719035643.14300-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1563508671;
 bh=pzZwZKV6SoH7ske+1l+sxR65sfGTlz7DnnGQW+Z0Dk8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RN0KCMJCABsDrW0aayJb6wMQmf4qXktpO7Ox0bmZPvXzosmnhN6c9jFU4wbw5I+xc
 pwbMrPz9ryidCulXgBF/4q3AA7VOVhZtuKs/zTxvQeY89Avjov86NTSFQtDJphZ1ob
 hZXPjgiQkXw9qCDHVPAy7eR7tHzlmyPc1D9S+PF8=
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
LmMKaW5kZXggNzI4MzdiOGM3MDMxLi5jMjA4NmViMDA1NTUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8wLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvZ21jX3Y5XzAuYwpAQCAtMTE2Myw2ICsxMTYzLDkgQEAgc3RhdGljIGludCBnbWNfdjlf
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
