Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9DC51A5457
	for <lists+dri-devel@lfdr.de>; Sun, 12 Apr 2020 01:05:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 052DE6E2E6;
	Sat, 11 Apr 2020 23:05:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51DE76E311;
 Sat, 11 Apr 2020 23:05:21 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4F24D214D8;
 Sat, 11 Apr 2020 23:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586646321;
 bh=aOg7yz/O9sc4pMrxXz59A+WsZv+fsfV4MvjWc2Ckh/Y=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=lY9goaorNI/gGLE6DD+ws56+XmdPk0PtO9NBS34y7hTdTSuE5Ee7YFyh3otoC9WJ4
 762cTx4C2c9VbYwoaJknmvs1XYiwX3gRv7CSWBnxFHqeRRayixxPK7Erwg3FX/s8Oc
 UTGVTKJ1YY/tnGEADR6mZaAvd1BfZKkHuvWdGPS4=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.6 075/149] drm/amdgpu: fix parentheses in
 amdgpu_vm_update_ptes
Date: Sat, 11 Apr 2020 19:02:32 -0400
Message-Id: <20200411230347.22371-75-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200411230347.22371-1-sashal@kernel.org>
References: <20200411230347.22371-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Tom St Denis <tom.stdenis@amd.com>, Sasha Levin <sashal@kernel.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgoKWyBVcHN0
cmVhbSBjb21taXQgYmZjZDZjNjllNGMzZjczZjJmOTJiOTk3OTgzNTM3ZjlhM2FjM2IyOSBdCgpG
b3IgdGhlIHJvb3QgUEQgbWFzayBjYW4gYmUgMHhmZmZmZmZmZiBhcyB3ZWxsIHdoaWNoIHdvdWxk
Cm92ZXJydW4gdG8gMCBpZiB3ZSBkb24ndCBjYXN0IGl0IGJlZm9yZSB3ZSBhZGQgb25lLgoKU2ln
bmVkLW9mZi1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgpU
ZXN0ZWQtYnk6IFRvbSBTdCBEZW5pcyA8dG9tLnN0ZGVuaXNAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6
IEZlbGl4IEt1ZWhsaW5nIDxGZWxpeC5LdWVobGluZ0BhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBB
bGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IFNh
c2hhIExldmluIDxzYXNoYWxAa2VybmVsLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfdm0uYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwg
MSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV92bS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtLmMKaW5kZXgg
ZDE2MjMxZDZhNzkwYi4uNjdlNzQyMjAzMjI2NSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X3ZtLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X3ZtLmMKQEAgLTE0OTgsNyArMTQ5OCw3IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X3ZtX3Vw
ZGF0ZV9wdGVzKHN0cnVjdCBhbWRncHVfdm1fdXBkYXRlX3BhcmFtcyAqcGFyYW1zLAogCQlpbmNy
ID0gKHVpbnQ2NF90KUFNREdQVV9HUFVfUEFHRV9TSVpFIDw8IHNoaWZ0OwogCQltYXNrID0gYW1k
Z3B1X3ZtX2VudHJpZXNfbWFzayhhZGV2LCBjdXJzb3IubGV2ZWwpOwogCQlwZV9zdGFydCA9ICgo
Y3Vyc29yLnBmbiA+PiBzaGlmdCkgJiBtYXNrKSAqIDg7Ci0JCWVudHJ5X2VuZCA9ICh1aW50NjRf
dCkobWFzayArIDEpIDw8IHNoaWZ0OworCQllbnRyeV9lbmQgPSAoKHVpbnQ2NF90KW1hc2sgKyAx
KSA8PCBzaGlmdDsKIAkJZW50cnlfZW5kICs9IGN1cnNvci5wZm4gJiB+KGVudHJ5X2VuZCAtIDEp
OwogCQllbnRyeV9lbmQgPSBtaW4oZW50cnlfZW5kLCBlbmQpOwogCi0tIAoyLjIwLjEKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
