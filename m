Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 773FD15DE63
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2020 17:04:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F209C6FA34;
	Fri, 14 Feb 2020 16:04:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5BD26FA2D;
 Fri, 14 Feb 2020 16:04:32 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D899B24698;
 Fri, 14 Feb 2020 16:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581696272;
 bh=zkF00PFKw4jdc9xqM6DX1laf6UmRyAUc5QscprQHLwE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Tjrgq6T3KSl1hFshdlagIWD0QZksoMAZ5e9JqIWpPqvZhbHqHEDGN7IMLDffHyZs+
 owp5DzS2HCunbQiqP74aEtmuu5HzCKMK91kuQKKDVtxMX4CAEDUyZX5Gs1+sOPYEWn
 iY4UmpPfolhFhoYU2+GFwhylpiw63yFi3JM1w7NI=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 123/459] drm/amdgpu: remove set but not used
 variable 'mc_shared_chmap'
Date: Fri, 14 Feb 2020 10:56:13 -0500
Message-Id: <20200214160149.11681-123-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200214160149.11681-1-sashal@kernel.org>
References: <20200214160149.11681-1-sashal@kernel.org>
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
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjhfMC5jCmluZGV4IGNjODhiYTc2YThkNGEuLmI4
ZDVlN2Q1YjQ4YTggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92
OF8wLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y4XzAuYwpAQCAtMTcx
MCw3ICsxNzEwLDcgQEAgc3RhdGljIGludCBnZnhfdjhfMF9kb19lZGNfZ3ByX3dvcmthcm91bmRz
KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogc3RhdGljIGludCBnZnhfdjhfMF9ncHVfZWFy
bHlfaW5pdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKIHsKIAl1MzIgZ2JfYWRkcl9jb25m
aWc7Ci0JdTMyIG1jX3NoYXJlZF9jaG1hcCwgbWNfYXJiX3JhbWNmZzsKKwl1MzIgbWNfYXJiX3Jh
bWNmZzsKIAl1MzIgZGltbTAwX2FkZHJfbWFwLCBkaW1tMDFfYWRkcl9tYXAsIGRpbW0xMF9hZGRy
X21hcCwgZGltbTExX2FkZHJfbWFwOwogCXUzMiB0bXA7CiAJaW50IHJldDsKQEAgLTE4NTAsNyAr
MTg1MCw2IEBAIHN0YXRpYyBpbnQgZ2Z4X3Y4XzBfZ3B1X2Vhcmx5X2luaXQoc3RydWN0IGFtZGdw
dV9kZXZpY2UgKmFkZXYpCiAJCWJyZWFrOwogCX0KIAotCW1jX3NoYXJlZF9jaG1hcCA9IFJSRUcz
MihtbU1DX1NIQVJFRF9DSE1BUCk7CiAJYWRldi0+Z2Z4LmNvbmZpZy5tY19hcmJfcmFtY2ZnID0g
UlJFRzMyKG1tTUNfQVJCX1JBTUNGRyk7CiAJbWNfYXJiX3JhbWNmZyA9IGFkZXYtPmdmeC5jb25m
aWcubWNfYXJiX3JhbWNmZzsKIAotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWwK
