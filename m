Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD0C7979EA8
	for <lists+dri-devel@lfdr.de>; Mon, 16 Sep 2024 11:45:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC60610E1E1;
	Mon, 16 Sep 2024 09:45:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="ILGixXNO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
 by gabe.freedesktop.org (Postfix) with ESMTP id 811DF10E1E1
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Sep 2024 09:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
 Message-ID; bh=4yrTVGgIy8ST+hf/b9VptZkzz6CVN2HRxPnjWXf8szk=; b=I
 LGixXNOnXrB2EpN6VeQmeGc0D2LktLGIlPpcho0GRaVdesWzd6jOd6TJC3EY1k1r
 Hbj3Gmk/ghkkY6VZXktwzY91FAVp512FsrLDeYg6xaytOTmdLUKwpPL+88U3C3nb
 FROqoIDnuIj17la+odVaWE860fVCaPdtJHLEdQORjI=
Received: from andyshrk$163.com ( [58.22.7.114] ) by
 ajax-webmail-wmsvr-40-132 (Coremail) ; Mon, 16 Sep 2024 17:44:37 +0800
 (CST)
X-Originating-IP: [58.22.7.114]
Date: Mon, 16 Sep 2024 17:44:37 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: "Andrew Kreimer" <algonell@gmail.com>
Cc: "Sandy Huang" <hjc@rock-chips.com>, 
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 "Andy Yan" <andy.yan@rock-chips.com>, 
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, 
 "Maxime Ripard" <mripard@kernel.org>, 
 "Thomas Zimmermann" <tzimmermann@suse.de>, 
 "David Airlie" <airlied@gmail.com>, 
 "Simona Vetter" <simona@ffwll.ch>, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel-janitors@vger.kernel.org, "Matthew Wilcox" <willy@infradead.org>
Subject: Re:[PATCH] drm/rockchip: Fix a typo
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2024 www.mailtech.cn 163com
In-Reply-To: <20240915123943.105118-1-algonell@gmail.com>
References: <20240915123943.105118-1-algonell@gmail.com>
X-NTES-SC: AL_Qu2ZBPictkAs4SmebOkXn0kXhec2W8Czvvgg34JRP5k0myXQ+AYEbXByEX7m/uioBASPvxeqVAdHxud8X7RnUJjQG8iUxgAelyfrXp/vh0iD
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <3516596d.2131.191fa38475a.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: _____wDn7_QG_udmDhYPAA--.10499W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiqRdcXmVOC6kEnAACsv
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ckhp77yMCgpBdCAyMDI0LTA5LTE1IDIwOjM5OjQzLCAiQW5kcmV3IEtyZWltZXIiIDxhbGdvbmVs
bEBnbWFpbC5jb20+IHdyb3RlOgo+Rml4IGEgdHlwbyBpbiBjb21tZW50cy4KPgo+UmVwb3J0ZWQt
Ynk6IE1hdHRoZXcgV2lsY294IDx3aWxseUBpbmZyYWRlYWQub3JnPgo+U2lnbmVkLW9mZi1ieTog
QW5kcmV3IEtyZWltZXIgPGFsZ29uZWxsQGdtYWlsLmNvbT4KCkFja2VkLWJ5OiAgQW5keSBZYW48
YW5keXNocmtAMTYzLmNvbT4KClRoYW5rcy4KCgo+LS0tCj4gZHJpdmVycy9ncHUvZHJtL3JvY2tj
aGlwL2Nkbi1kcC1yZWcuaCB8IDIgKy0KPiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyks
IDEgZGVsZXRpb24oLSkKPgo+ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9j
ZG4tZHAtcmVnLmggYi9kcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvY2RuLWRwLXJlZy5oCj5pbmRl
eCA0NDEyNDhiN2E3OWUuLmM3NzgwYWUzMjcyYSAxMDA2NDQKPi0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9yb2NrY2hpcC9jZG4tZHAtcmVnLmgKPisrKyBiL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9j
ZG4tZHAtcmVnLmgKPkBAIC03Nyw3ICs3Nyw3IEBACj4gI2RlZmluZSBTT1VSQ0VfUElGX1BLVF9B
TExPQ19XUl9FTgkweDMwODMwCj4gI2RlZmluZSBTT1VSQ0VfUElGX1NXX1JFU0VUCQkweDMwODM0
Cj4gCj4tLyogYmVsbG93IHJlZ2lzdGVycyBuZWVkIGFjY2VzcyBieSBtYWlsYm94ICovCj4rLyog
YmVsb3cgcmVnaXN0ZXJzIG5lZWQgYWNjZXNzIGJ5IG1haWxib3ggKi8KPiAvKiBzb3VyY2UgY2Fy
IGFkZHIgKi8KPiAjZGVmaW5lIFNPVVJDRV9IRFRYX0NBUgkJCTB4MDkwMAo+ICNkZWZpbmUgU09V
UkNFX0RQVFhfQ0FSCQkJMHgwOTA0Cj4tLSAKPjIuMzkuNQo=
