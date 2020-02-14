Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A011D15E2BF
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2020 17:25:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A78B96FB43;
	Fri, 14 Feb 2020 16:25:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A39FF6FB3A;
 Fri, 14 Feb 2020 16:24:56 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B16C3247A9;
 Fri, 14 Feb 2020 16:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581697496;
 bh=pDZYNfZ6e+2lGkF820EqJ0gQxy6sw5tEScQC/CtWeCA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=kQ+WmcMF8mQV53cVSiLKMt3yPXTOg3jRkC6ae4zpcB/omL0r7GEcWRjqKUYIBWkQv
 VsqnB2NXB6wadmoEXnnK6DUHrArpNeXch5uMQ8mv/f7MRCHNbiZBvjYj1NGQMez2hn
 YTu4PQEa2JUr8aO45p2nmk6SbjCnLF8n2OviTrgg=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.4 025/100] drm/amdgpu: remove set but not used
 variable 'mc_shared_chmap'
Date: Fri, 14 Feb 2020 11:23:09 -0500
Message-Id: <20200214162425.21071-25-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200214162425.21071-1-sashal@kernel.org>
References: <20200214162425.21071-1-sashal@kernel.org>
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
Cc: Alex Deucher <alexander.deucher@amd.com>, yu kuai <yukuai3@huawei.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Sasha Levin <sashal@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogeXUga3VhaSA8eXVrdWFpM0BodWF3ZWkuY29tPgoKWyBVcHN0cmVhbSBjb21taXQgZTk4
MDQyZGIyY2I4ZDBiNzI4Y2Q3NmUwNWI5YzJlMWM4NGI3ZjcyYiBdCgpGaXhlcyBnY2MgJy1XdW51
c2VkLWJ1dC1zZXQtdmFyaWFibGUnIHdhcm5pbmc6Cgpkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9nZnhfdjhfMC5jOiBJbiBmdW5jdGlvbgrigJhnZnhfdjhfMF9ncHVfZWFybHlfaW5pdOKAmToK
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y4XzAuYzoxNzEzOjY6IHdhcm5pbmc6IHZh
cmlhYmxlCuKAmG1jX3NoYXJlZF9jaG1hcOKAmSBzZXQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1i
dXQtc2V0LXZhcmlhYmxlXQoKRml4ZXM6IDBiZGUzYTk1ZWFhOSAoImRybS9hbWRncHU6IHNwbGl0
IGdmeDggZ3B1IGluaXQgaW50byBzdyBhbmQgaHcgcGFydHMiKQpTaWduZWQtb2ZmLWJ5OiB5dSBr
dWFpIDx5dWt1YWkzQGh1YXdlaS5jb20+ClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxl
eGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogU2FzaGEgTGV2aW4gPHNhc2hh
bEBrZXJuZWwub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OF8wLmMg
fCAzICstLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAyIGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OF8wLmMgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjhfMC5jCmluZGV4IGQxMDU0MDM0ZDE0YjEuLjY1
ZDBhM2U0ZjFmMDAgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92
OF8wLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y4XzAuYwpAQCAtOTY3
LDcgKzk2Nyw3IEBAIHN0YXRpYyBpbnQgZ2Z4X3Y4XzBfbWVjX2luaXQoc3RydWN0IGFtZGdwdV9k
ZXZpY2UgKmFkZXYpCiBzdGF0aWMgdm9pZCBnZnhfdjhfMF9ncHVfZWFybHlfaW5pdChzdHJ1Y3Qg
YW1kZ3B1X2RldmljZSAqYWRldikKIHsKIAl1MzIgZ2JfYWRkcl9jb25maWc7Ci0JdTMyIG1jX3No
YXJlZF9jaG1hcCwgbWNfYXJiX3JhbWNmZzsKKwl1MzIgbWNfYXJiX3JhbWNmZzsKIAl1MzIgZGlt
bTAwX2FkZHJfbWFwLCBkaW1tMDFfYWRkcl9tYXAsIGRpbW0xMF9hZGRyX21hcCwgZGltbTExX2Fk
ZHJfbWFwOwogCXUzMiB0bXA7CiAKQEAgLTExMzEsNyArMTEzMSw2IEBAIHN0YXRpYyB2b2lkIGdm
eF92OF8wX2dwdV9lYXJseV9pbml0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogCQlicmVh
azsKIAl9CiAKLQltY19zaGFyZWRfY2htYXAgPSBSUkVHMzIobW1NQ19TSEFSRURfQ0hNQVApOwog
CWFkZXYtPmdmeC5jb25maWcubWNfYXJiX3JhbWNmZyA9IFJSRUczMihtbU1DX0FSQl9SQU1DRkcp
OwogCW1jX2FyYl9yYW1jZmcgPSBhZGV2LT5nZnguY29uZmlnLm1jX2FyYl9yYW1jZmc7CiAKLS0g
CjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
