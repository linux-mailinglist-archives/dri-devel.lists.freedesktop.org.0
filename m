Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38C34BCDB0
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2019 18:49:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F6C16EAB0;
	Tue, 24 Sep 2019 16:49:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2B7F6EAAB;
 Tue, 24 Sep 2019 16:49:15 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9F8D020673;
 Tue, 24 Sep 2019 16:49:14 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 16/50] drm/amd/display: reprogram VM config when
 system resume
Date: Tue, 24 Sep 2019 12:48:13 -0400
Message-Id: <20190924164847.27780-16-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190924164847.27780-1-sashal@kernel.org>
References: <20190924164847.27780-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1569343755;
 bh=ZW7DZIoYB8ha0qMnMTt72e6WQLNti6SiK+zXWEE454I=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=kmXs9Ity0b9XlYyrF1OPjhl8X+S4fpIjeiv4Br20BCCdEsb30SrTsB/cW8wA1bOza
 QhiEFjh4B/iOAl9AKUdCKv5g9R3Jgx2LTD1xRNfaQFIT1NZ/1XN5LZJcMwqYIVkQ3q
 LxvJa8NyoIcgj1VCVV0dfryYLn8mh3KAVYprZDms=
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
Cc: Sasha Levin <sashal@kernel.org>, Lewis Huang <Lewis.Huang@amd.com>,
 Eric Yang <eric.yang2@amd.com>, Leo Li <sunpeng.li@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, Jun Lei <Jun.Lei@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogTGV3aXMgSHVhbmcgPExld2lzLkh1YW5nQGFtZC5jb20+CgpbIFVwc3RyZWFtIGNvbW1p
dCBlNTM4MjcwMWMzNTIwYjNlZDY2MTY5YTZlNGFhNmNlNWRmOGM1NmUwIF0KCltXaHldClRoZSB2
bSBjb25maWcgd2lsbCBiZSBjbGVhciB0byAwIHdoZW4gc3lzdGVtIGVudGVyIFM0LiBJdCB3aWxs
CmNhdXNlIGh1YmJ1YiBkaWRuJ3Qga25vdyBob3cgdG8gZmV0Y2ggZGF0YSB3aGVuIHN5c3RlbSBy
ZXN1bWUuClRoZSBmbGlwIGFsd2F5cyBwZW5kaW5nIGJlY2F1c2UgZWFybGllc3RfaW51c2VfYWRk
cmVzcyBhbmQKcmVxdWVzdF9hZGRyZXNzIGFyZSBkaWZmZXJlbnQuCgpbSG93XQpSZXByb2dyYW0g
Vk0gY29uZmlnIHdoZW4gc3lzdGVtIHJlc3VtZQoKU2lnbmVkLW9mZi1ieTogTGV3aXMgSHVhbmcg
PExld2lzLkh1YW5nQGFtZC5jb20+ClJldmlld2VkLWJ5OiBKdW4gTGVpIDxKdW4uTGVpQGFtZC5j
b20+CkFja2VkLWJ5OiBFcmljIFlhbmcgPGVyaWMueWFuZzJAYW1kLmNvbT4KQWNrZWQtYnk6IExl
byBMaSA8c3VucGVuZy5saUBhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFs
ZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IFNhc2hhIExldmluIDxzYXNo
YWxAa2VybmVsLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9k
Yy5jIHwgOCArKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjLmMgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kYy5jCmluZGV4IGY0Yjg5ZDFlYTZmNmYuLjJi
MmVmZTQ0M2MzNmQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9j
b3JlL2RjLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGMuYwpA
QCAtMTU4NSw2ICsxNTg1LDE0IEBAIHZvaWQgZGNfc2V0X3Bvd2VyX3N0YXRlKAogCQlkY19yZXNv
dXJjZV9zdGF0ZV9jb25zdHJ1Y3QoZGMsIGRjLT5jdXJyZW50X3N0YXRlKTsKIAogCQlkYy0+aHdz
cy5pbml0X2h3KGRjKTsKKworI2lmZGVmIENPTkZJR19EUk1fQU1EX0RDX0RDTjJfMAorCQlpZiAo
ZGMtPmh3c3MuaW5pdF9zeXNfY3R4ICE9IE5VTEwgJiYKKwkJCWRjLT52bV9wYV9jb25maWcudmFs
aWQpIHsKKwkJCWRjLT5od3NzLmluaXRfc3lzX2N0eChkYy0+aHdzZXEsIGRjLCAmZGMtPnZtX3Bh
X2NvbmZpZyk7CisJCX0KKyNlbmRpZgorCiAJCWJyZWFrOwogCWRlZmF1bHQ6CiAKLS0gCjIuMjAu
MQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
