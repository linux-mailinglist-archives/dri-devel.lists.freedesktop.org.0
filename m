Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E3F3A6E83
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2019 18:27:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BDF289728;
	Tue,  3 Sep 2019 16:27:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38A2589728
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2019 16:27:49 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 701D3238C6;
 Tue,  3 Sep 2019 16:27:48 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 083/167] drm: add __user attribute to
 ptr_to_compat()
Date: Tue,  3 Sep 2019 12:23:55 -0400
Message-Id: <20190903162519.7136-83-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190903162519.7136-1-sashal@kernel.org>
References: <20190903162519.7136-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1567528069;
 bh=krAUKclN5zuG1oCarZQF52J+e248ke7MQqKEOMq6egk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=uS7PmZ9YH8yfjYHHeRe+aV4VqFPg6QQxiyde4g/BbA6OQdZ9DvvN6RYooZUsa54DW
 9C9r6o+dPk5AKQPQWkNmv3WKIaW5KZ/WD1Df8DOBX6FVSOvhi3TMDbkOB6XsH++ve3
 LFFk7xJAbmp92sqmE2sATw+plEpSWPJdO5z+tVO8=
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
Cc: Sasha Levin <sashal@kernel.org>, Ben Dooks <ben.dooks@codethink.co.uk>,
 Sean Paul <seanpaul@chromium.org>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogQmVuIERvb2tzIDxiZW4uZG9va3NAY29kZXRoaW5rLmNvLnVrPgoKWyBVcHN0cmVhbSBj
b21taXQgZTU1MmYwODUxMDcwZmU0OTc1ZDYxMGE5OTkxMGJlNGU5YmY1ZDdiZCBdCgpUaGUgcHRy
X3RvX2NvbXBhdCgpIGNhbGwgdGFrZXMgYSAidm9pZCBfX3VzZXIgKiIsIHNvIGNhc3QKdGhlIGNv
bXBhdCBkcm0gY2FsbHMgdGhhdCB1c2UgaXQgdG8gYXZvaWQgdGhlIGZvbGxvd2luZwp3YXJuaW5n
cyBmcm9tIHNwYXJzZToKCmRyaXZlcnMvZ3B1L2RybS9kcm1faW9jMzIuYzoxODg6Mzk6IHdhcm5p
bmc6IGluY29ycmVjdCB0eXBlIGluIGFyZ3VtZW50IDEgKGRpZmZlcmVudCBhZGRyZXNzIHNwYWNl
cykKZHJpdmVycy9ncHUvZHJtL2RybV9pb2MzMi5jOjE4ODozOTogICAgZXhwZWN0ZWQgdm9pZCBb
bm9kZXJlZl0gPGFzbjoxPip1cHRyCmRyaXZlcnMvZ3B1L2RybS9kcm1faW9jMzIuYzoxODg6Mzk6
ICAgIGdvdCB2b2lkICpbYWRkcmVzc2FibGVdIFthc3NpZ25lZF0gaGFuZGxlCmRyaXZlcnMvZ3B1
L2RybS9kcm1faW9jMzIuYzo1Mjk6NDE6IHdhcm5pbmc6IGluY29ycmVjdCB0eXBlIGluIGFyZ3Vt
ZW50IDEgKGRpZmZlcmVudCBhZGRyZXNzIHNwYWNlcykKZHJpdmVycy9ncHUvZHJtL2RybV9pb2Mz
Mi5jOjUyOTo0MTogICAgZXhwZWN0ZWQgdm9pZCBbbm9kZXJlZl0gPGFzbjoxPip1cHRyCmRyaXZl
cnMvZ3B1L2RybS9kcm1faW9jMzIuYzo1Mjk6NDE6ICAgIGdvdCB2b2lkICpbYWRkcmVzc2FibGVd
IFthc3NpZ25lZF0gaGFuZGxlCgpDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwpTaWduZWQtb2Zm
LWJ5OiBCZW4gRG9va3MgPGJlbi5kb29rc0Bjb2RldGhpbmsuY28udWs+ClNpZ25lZC1vZmYtYnk6
IFNlYW4gUGF1bCA8c2VhbnBhdWxAY2hyb21pdW0ub3JnPgpMaW5rOiBodHRwczovL3BhdGNod29y
ay5mcmVlZGVza3RvcC5vcmcvcGF0Y2gvbXNnaWQvMjAxOTAzMDExMjAwNDYuMjY5NjEtMS1iZW4u
ZG9va3NAY29kZXRoaW5rLmNvLnVrClNpZ25lZC1vZmYtYnk6IFNhc2hhIExldmluIDxzYXNoYWxA
a2VybmVsLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2lvYzMyLmMgfCA2ICsrKy0tLQog
MSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2lvYzMyLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2lv
YzMyLmMKaW5kZXggMTM4NjgwYjM3YzcwOS4uZjg2NzIyMzhkNDQ0YiAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2RybV9pb2MzMi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1faW9jMzIu
YwpAQCAtMTg1LDcgKzE4NSw3IEBAIHN0YXRpYyBpbnQgY29tcGF0X2RybV9nZXRtYXAoc3RydWN0
IGZpbGUgKmZpbGUsIHVuc2lnbmVkIGludCBjbWQsCiAJbTMyLnNpemUgPSBtYXAuc2l6ZTsKIAlt
MzIudHlwZSA9IG1hcC50eXBlOwogCW0zMi5mbGFncyA9IG1hcC5mbGFnczsKLQltMzIuaGFuZGxl
ID0gcHRyX3RvX2NvbXBhdChtYXAuaGFuZGxlKTsKKwltMzIuaGFuZGxlID0gcHRyX3RvX2NvbXBh
dCgodm9pZCBfX3VzZXIgKiltYXAuaGFuZGxlKTsKIAltMzIubXRyciA9IG1hcC5tdHJyOwogCWlm
IChjb3B5X3RvX3VzZXIoYXJncCwgJm0zMiwgc2l6ZW9mKG0zMikpKQogCQlyZXR1cm4gLUVGQVVM
VDsKQEAgLTIxNiw3ICsyMTYsNyBAQCBzdGF0aWMgaW50IGNvbXBhdF9kcm1fYWRkbWFwKHN0cnVj
dCBmaWxlICpmaWxlLCB1bnNpZ25lZCBpbnQgY21kLAogCiAJbTMyLm9mZnNldCA9IG1hcC5vZmZz
ZXQ7CiAJbTMyLm10cnIgPSBtYXAubXRycjsKLQltMzIuaGFuZGxlID0gcHRyX3RvX2NvbXBhdCht
YXAuaGFuZGxlKTsKKwltMzIuaGFuZGxlID0gcHRyX3RvX2NvbXBhdCgodm9pZCBfX3VzZXIgKilt
YXAuaGFuZGxlKTsKIAlpZiAobWFwLmhhbmRsZSAhPSBjb21wYXRfcHRyKG0zMi5oYW5kbGUpKQog
CQlwcl9lcnJfcmF0ZWxpbWl0ZWQoImNvbXBhdF9kcm1fYWRkbWFwIHRydW5jYXRlZCBoYW5kbGUg
JXAgZm9yIHR5cGUgJWQgb2Zmc2V0ICV4XG4iLAogCQkJCSAgIG1hcC5oYW5kbGUsIG0zMi50eXBl
LCBtMzIub2Zmc2V0KTsKQEAgLTUyOSw3ICs1MjksNyBAQCBzdGF0aWMgaW50IGNvbXBhdF9kcm1f
Z2V0c2FyZWFjdHgoc3RydWN0IGZpbGUgKmZpbGUsIHVuc2lnbmVkIGludCBjbWQsCiAJaWYgKGVy
cikKIAkJcmV0dXJuIGVycjsKIAotCXJlcTMyLmhhbmRsZSA9IHB0cl90b19jb21wYXQocmVxLmhh
bmRsZSk7CisJcmVxMzIuaGFuZGxlID0gcHRyX3RvX2NvbXBhdCgodm9pZCBfX3VzZXIgKilyZXEu
aGFuZGxlKTsKIAlpZiAoY29weV90b191c2VyKGFyZ3AsICZyZXEzMiwgc2l6ZW9mKHJlcTMyKSkp
CiAJCXJldHVybiAtRUZBVUxUOwogCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
