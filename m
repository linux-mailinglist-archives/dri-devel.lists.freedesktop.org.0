Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C7996E6E8
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2024 02:43:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F53610E166;
	Fri,  6 Sep 2024 00:43:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="klXiBzH2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
 by gabe.freedesktop.org (Postfix) with ESMTP id A9F0410E166
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Sep 2024 00:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
 Message-ID; bh=sWKETyqbCy/oU45Avlbw42IlnMoezBn1N7HKMujWHB8=; b=k
 lXiBzH2S1mGIO5ZZxNawojacfCxB5NSZKiQRJg0curicGTespE6vt/mZWQ0lXU96
 lO8nKFpOcQjdXbMm7+BR8ZNLn1ruRCo3VKrW9Zd88I1Ui2yy0s4hI0QC6C7PJlpZ
 TsbcQKL5VH3xWf8KdpSZq58ccRzDRJQr+aZigBpE0I=
Received: from andyshrk$163.com ( [58.22.7.114] ) by
 ajax-webmail-wmsvr-40-129 (Coremail) ; Fri, 6 Sep 2024 08:42:41 +0800 (CST)
X-Originating-IP: [58.22.7.114]
Date: Fri, 6 Sep 2024 08:42:41 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: "Min-Hua Chen" <minhuadotchen@gmail.com>
Cc: "Sandy Huang" <hjc@rock-chips.com>, 
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 "Andy Yan" <andy.yan@rock-chips.com>, 
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, 
 "Maxime Ripard" <mripard@kernel.org>, 
 "Thomas Zimmermann" <tzimmermann@suse.de>, 
 "David Airlie" <airlied@gmail.com>, 
 "Daniel Vetter" <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re:[PATCH] drm/rockchip: include rockchip_drm_drv.h
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2024 www.mailtech.cn 163com
In-Reply-To: <20240905223852.188355-1-minhuadotchen@gmail.com>
References: <20240905223852.188355-1-minhuadotchen@gmail.com>
X-NTES-SC: AL_Qu2ZB/mTvEst5ymeYOkZnEobh+Y5UcK2s/ki2YFXN5k0mCTU0SYHcVtZP2PS1cyiLhihlDywfDNM9slef49ob7AfQ5yEURwOay+wzTF7eCuj
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <6f07603.7f9.191c4c887b1.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: _____wD3H70CUNpmYjNOAA--.33708W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiMxJSXmXAnqv04QACsq
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

CkhpICBNaW4gSHVh77yMCiAgIFRoYW5rcyBmb3IgeW91ciB3b3JrCgpBdCAyMDI0LTA5LTA2IDA2
OjM4OjUwLCAiTWluLUh1YSBDaGVuIiA8bWluaHVhZG90Y2hlbkBnbWFpbC5jb20+IHdyb3RlOgo+
SW5jbHVkZSByb2NrY2hpcF9kcm1fZHJ2LmggdG8gZml4IHRoZSBmb2xsb3cgc3BhcnNlIHdhcm5p
bmc6Cj4KPmRyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF92b3AyX3JlZy5jOjUwMjoy
NDogc3BhcnNlOgo+d2FybmluZzogc3ltYm9sICd2b3AyX3BsYXRmb3JtX2RyaXZlcicgd2FzIG5v
dCBkZWNsYXJlZC4KPlNob3VsZCBpdCBiZSBzdGF0aWM/Cj4KPk5vIGZ1bmN0aW9uYWwgY2hhbmdl
IGludGVuZGVkLgo+Cj5TaWduZWQtb2ZmLWJ5OiBNaW4tSHVhIENoZW4gPG1pbmh1YWRvdGNoZW5A
Z21haWwuY29tPgo+LS0tCj4gZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL3JvY2tjaGlwX3ZvcDJf
cmVnLmMgfCAxICsKPiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPgo+ZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF92b3AyX3JlZy5jIGIvZHJpdmVy
cy9ncHUvZHJtL3JvY2tjaGlwL3JvY2tjaGlwX3ZvcDJfcmVnLmMKPmluZGV4IDE4ZWZiM2ZlMWMw
MC4uYzY3OGQxYjBmZDdjIDEwMDY0NAo+LS0tIGEvZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL3Jv
Y2tjaGlwX3ZvcDJfcmVnLmMKPisrKyBiL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hp
cF92b3AyX3JlZy5jCj5AQCAtMTQsNiArMTQsNyBAQAo+ICNpbmNsdWRlIDxkcm0vZHJtX3ByaW50
Lmg+Cj4gCj4gI2luY2x1ZGUgInJvY2tjaGlwX2RybV92b3AyLmgiCj4rI2luY2x1ZGUgInJvY2tj
aGlwX2RybV9kcnYuaCIKPiAKCldlIGFscmVhZHkgaGF2ZSBhIHBhdGNoWzBdIGluY2x1ZGUgcm9j
a2NoaXBfZHJtX2Rydi5oIGluIHJvY2tjaGlwX2RybV92b3AyLmgKClswXWh0dHBzOi8vcGF0Y2h3
b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC1yb2NrY2hpcC9wYXRjaC8yMDI0MDkwNDEyMDIz
OC4zODU2NzgyLTMtYW5keXNocmtAMTYzLmNvbS8gCgo+IHN0YXRpYyBjb25zdCB1aW50MzJfdCBm
b3JtYXRzX2NsdXN0ZXJbXSA9IHsKPiAJRFJNX0ZPUk1BVF9YUkdCMjEwMTAxMCwKPi0tIAo+Mi40
My4wCj4KPgo+X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
PkxpbnV4LXJvY2tjaGlwIG1haWxpbmcgbGlzdAo+TGludXgtcm9ja2NoaXBAbGlzdHMuaW5mcmFk
ZWFkLm9yZwo+aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yb2NrY2hpcAo=
