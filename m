Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E2F934EC92
	for <lists+dri-devel@lfdr.de>; Tue, 30 Mar 2021 17:35:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53CB46E924;
	Tue, 30 Mar 2021 15:35:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mengyan1223.wang (mengyan1223.wang [89.208.246.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DCF66E924;
 Tue, 30 Mar 2021 15:35:11 +0000 (UTC)
Received: from xry111-X57S1.. (unknown
 [IPv6:240e:35a:1037:8a00:70b2:e35d:833c:af3e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
 (Client did not present a certificate)
 (Authenticated sender: xry111@mengyan1223.wang)
 by mengyan1223.wang (Postfix) with ESMTPSA id 4833965C14;
 Tue, 30 Mar 2021 11:34:58 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mengyan1223.wang;
 s=mail; t=1617118510;
 bh=xJ1gBuhyT9YFSqyyP3dR34G+tKbCjl47M9fIBJWEhP4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=nNuEvw7jfD7BiHtgdTD0pBrp2f6S96v0UAaS384nzTVt7iqz4b3f50RR76fanHxBu
 vtThlDtrWvudCRJDAWp+caryNPii4t5iXGTkjCd/8NLA7SfQGhr9w0KlS61/yp5TVM
 d984Bqv/oz2Rvt0GNVrkhsSIVTuVDmy1MoWR3ZANv4Dk7WkStaOH7GYjPPwzDi+Gjg
 cP7reWq4ayypxOeHajV2fUN0vtQWK0wAzYogIeDWT+2ppf2CGxYC6C4he4af+L4Ohl
 aEZLHvIuqJpnJ+LHRPOxcf+wnVwQdsyo4lRtyNnAadsVbLmhbefZCp3s7mN4GsHX4A
 xOxZiaknAURnw==
From: =?UTF-8?q?X=E2=84=B9=20Ruoyao?= <xry111@mengyan1223.wang>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 1/2] drm/amdgpu: Set a suitable dev_info.gart_page_size
Date: Tue, 30 Mar 2021 23:33:33 +0800
Message-Id: <20210330153334.44570-2-xry111@mengyan1223.wang>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210330153334.44570-1-xry111@mengyan1223.wang>
References: <20210330153334.44570-1-xry111@mengyan1223.wang>
MIME-Version: 1.0
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
Cc: Rui Wang <wangr@lemote.com>, =?UTF-8?q?Dan=20Hor=C3=A1k?= <dan@danny.cz>,
 Huacai Chen <chenhuacai@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Xi Ruoyao <xry111@mengyan1223.wang>, Alex Deucher <alexander.deucher@amd.com>,
 Huacai Chen <chenhc@lemote.com>, stable@vger.kernel.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogSHVhY2FpIENoZW4gPGNoZW5oY0BsZW1vdGUuY29tPgoKSW4gTWVzYSwgZGV2X2luZm8u
Z2FydF9wYWdlX3NpemUgaXMgdXNlZCBmb3IgYWxpZ25tZW50IGFuZCBpdCB3YXMKc2V0IHRvIEFN
REdQVV9HUFVfUEFHRV9TSVpFKDRLQikuIEhvd2V2ZXIsIHRoZSBwYWdlIHRhYmxlIG9mIEFNREdQ
VQpkcml2ZXIgcmVxdWlyZXMgYW4gYWxpZ25tZW50IG9uIENQVSBwYWdlcy4gIFNvLCBmb3Igbm9u
LTRLQiBwYWdlIHN5c3RlbSwKZ2FydF9wYWdlX3NpemUgc2hvdWxkIGJlIG1heF90KHUzMiwgUEFH
RV9TSVpFLCBBTURHUFVfR1BVX1BBR0VfU0laRSkuCgpTaWduZWQtb2ZmLWJ5OiBSdWkgV2FuZyA8
d2FuZ3JAbGVtb3RlLmNvbT4KU2lnbmVkLW9mZi1ieTogSHVhY2FpIENoZW4gPGNoZW5oY0BsZW1v
dGUuY29tPgpMaW5rOiBodHRwczovL2dpdGh1Yi5jb20vbG9vbmdzb24tY29tbXVuaXR5L2xpbnV4
LXN0YWJsZS9jb21taXQvY2FhOWMwYTEKW1hpOiByZWJhc2VkIGZvciBkcm0tbmV4dCwgdXNlIG1h
eF90IGZvciBjaGVja3BhdGNoLAogICAgIGFuZCByZXdvcmRlZCBjb21taXQgbWVzc2FnZS5dClNp
Z25lZC1vZmYtYnk6IFhpIFJ1b3lhbyA8eHJ5MTExQG1lbmd5YW4xMjIzLndhbmc+CkJ1Z0xpbms6
IGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9kcm0vYW1kLy0vaXNzdWVzLzE1NDkKVGVz
dGVkLWJ5OiBEYW4gSG9yw6FrIDxkYW5AZGFubnkuY3o+CkNjOiBzdGFibGVAdmdlci5rZXJuZWwu
b3JnCi0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2ttcy5jIHwgNCArKy0t
CiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9rbXMuYyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9rbXMuYwppbmRleCA4NmVlZWI0ZjM1MTMuLjNiMGJl
NjRlNDYzOCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2tt
cy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9rbXMuYwpAQCAtNzkx
LDkgKzc5MSw5IEBAIGludCBhbWRncHVfaW5mb19pb2N0bChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2
LCB2b2lkICpkYXRhLCBzdHJ1Y3QgZHJtX2ZpbGUgKmZpbHApCiAJCQlkZXZfaW5mby0+aGlnaF92
YV9vZmZzZXQgPSBBTURHUFVfR01DX0hPTEVfRU5EOwogCQkJZGV2X2luZm8tPmhpZ2hfdmFfbWF4
ID0gQU1ER1BVX0dNQ19IT0xFX0VORCB8IHZtX3NpemU7CiAJCX0KLQkJZGV2X2luZm8tPnZpcnR1
YWxfYWRkcmVzc19hbGlnbm1lbnQgPSBtYXgoKGludClQQUdFX1NJWkUsIEFNREdQVV9HUFVfUEFH
RV9TSVpFKTsKKwkJZGV2X2luZm8tPnZpcnR1YWxfYWRkcmVzc19hbGlnbm1lbnQgPSBtYXhfdCh1
MzIsIFBBR0VfU0laRSwgQU1ER1BVX0dQVV9QQUdFX1NJWkUpOwogCQlkZXZfaW5mby0+cHRlX2Zy
YWdtZW50X3NpemUgPSAoMSA8PCBhZGV2LT52bV9tYW5hZ2VyLmZyYWdtZW50X3NpemUpICogQU1E
R1BVX0dQVV9QQUdFX1NJWkU7Ci0JCWRldl9pbmZvLT5nYXJ0X3BhZ2Vfc2l6ZSA9IEFNREdQVV9H
UFVfUEFHRV9TSVpFOworCQlkZXZfaW5mby0+Z2FydF9wYWdlX3NpemUgPSBtYXhfdCh1MzIsIFBB
R0VfU0laRSwgQU1ER1BVX0dQVV9QQUdFX1NJWkUpOwogCQlkZXZfaW5mby0+Y3VfYWN0aXZlX251
bWJlciA9IGFkZXYtPmdmeC5jdV9pbmZvLm51bWJlcjsKIAkJZGV2X2luZm8tPmN1X2FvX21hc2sg
PSBhZGV2LT5nZnguY3VfaW5mby5hb19jdV9tYXNrOwogCQlkZXZfaW5mby0+Y2VfcmFtX3NpemUg
PSBhZGV2LT5nZnguY2VfcmFtX3NpemU7Ci0tIAoyLjMxLjEKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
