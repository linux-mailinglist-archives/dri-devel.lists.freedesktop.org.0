Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AD44A93599
	for <lists+dri-devel@lfdr.de>; Fri, 18 Apr 2025 11:51:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B85B610E96E;
	Fri, 18 Apr 2025 09:51:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="A8865jdi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0BB9E10E96E
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Apr 2025 09:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
 Message-ID; bh=/lz4kzDd+Ofx/tYRxsAmzeEQiMcP0P6DAZ6wk+IAMqs=; b=A
 8865jdie+Au4JHglYjTkQ0ldqnWZIR0oMh3m5Aq/jB2eTyOPM8AyGa1VWuNqhcUD
 B7FesdBs1MfaNnT9h2TYICN4dqOb0tOTn9Cg9v1bBk91R7PgLB64tSazJSStNfou
 663VV4GGjYsCwW1VpVVnNniDfMaUqKkXTBnrn3+3lI=
Received: from andyshrk$163.com ( [58.22.7.114] ) by
 ajax-webmail-wmsvr-40-120 (Coremail) ; Fri, 18 Apr 2025 17:50:55 +0800
 (CST)
X-Originating-IP: [58.22.7.114]
Date: Fri, 18 Apr 2025 17:50:55 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: "Daniel Stone" <daniel@fooishbar.org>
Cc: "Konstantin Shabanov" <mail@etehtsea.me>,
 "Sandy Huang" <hjc@rock-chips.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 "Andy Yan" <andy.yan@rock-chips.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
 "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>,
 "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Dan Callaghan" <djc@djc.id.au>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re:Re: [PATCH v4] drm/rockchip: Disable AFBC for res >2560 on rk3399
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2025 www.mailtech.cn 163com
In-Reply-To: <CAPj87rNDsyBfy=P=0SzTm7u6Na6BpeZSpEt1mRPhLCd6rHXzTA@mail.gmail.com>
References: <20250414095332.9674-1-mail@etehtsea.me>
 <20250417065759.5948-1-mail@etehtsea.me>
 <17402f2e.360.1964640c3d3.Coremail.andyshrk@163.com>
 <CAPj87rNDsyBfy=P=0SzTm7u6Na6BpeZSpEt1mRPhLCd6rHXzTA@mail.gmail.com>
X-NTES-SC: AL_Qu2fBvWdtkAu4yadYOkfmkcVgOw9UcO5v/Qk3oZXOJF8jDLp/j0HdmVSAWfk9OO0GyOzmgmGQhZw7+16UYtfUYcQTnngy+GPTIlCzbjsNbhLSQ==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <a893834.9206.196484ef2ab.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: eCgvCgD3P7Z_IAJowZyaAA--.49852W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbB0hkzXmgCGhqq-gACsa
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

CkhpIApBdCAyMDI1LTA0LTE4IDE3OjQzOjE5LCAiRGFuaWVsIFN0b25lIiA8ZGFuaWVsQGZvb2lz
aGJhci5vcmc+IHdyb3RlOgo+SGkgQW5keSwKPgo+T24gRnJpLCAxOCBBcHIgMjAyNSBhdCAwMTox
NiwgQW5keSBZYW4gPGFuZHlzaHJrQDE2My5jb20+IHdyb3RlOgo+PiBJIHByZWZlciB0aGUgVjEg
dmVyc2lvbiBQQVRDSFswXS4gVGhpcyBpcyBiZWNhdXNlIHdlIGRvIG5vdCBkZWFsIHdpdGggaGFy
ZHdhcmUtcmVsYXRlZAo+PiBkaWZmZXJlbmNlcyBhdCB0aGlzIGxldmVsLiAgSXQgaW52b2x2ZXMg
YSBWT1AtcmVsYXRlZCByZXN0cmljdGlvbiBhbmQgd2UgYWx3YXlzICBoYW5kbGUKPj4gbGltaXRp
YXRpb24gbGlrZSB0aGlzICB3aXRoaW4gdGhlIFZPUCBkcml2ZXIgLgo+Cj5BcyBzYWlkIGluIHRo
ZSByZXZpZXcgZm9yIHYxLCB0aGlzIGlzIG5vdCBlbm91Z2ggZm9yIGdlbmVyaWMgdXNlcnNwYWNl
Lgo+Cj5JZiBkcm1Nb2RlQWRkRkIyV2l0aE1vZGlmaWVycygpIGZhaWxzLCB1c2Vyc3BhY2Uga25v
d3MgdGhhdCB0aGUgYnVmZmVyCj5jYW4gbmV2ZXIgd29yayBpbiB0aGF0IGNvbmZpZ3VyYXRpb24s
IGFuZCBpdCBzaG91bGQgZmFsbCBiYWNrLiBJZgo+ZHJtTW9kZUF0b21pY0NvbW1pdChEUk1fTU9E
RV9BVE9NSUNfVEVTVF9PTkxZKSBmYWlscywgdXNlcnNwYWNlIGRvZXMKPm5vdCBrbm93IHRoYXQg
dGhlIGJ1ZmZlciBjYW4gX25ldmVyXyB3b3JrLCBiZWNhdXNlIHRoZSBmYWlsdXJlIG1heSBiZQo+
dHJhbnNpZW50IG9yIGR1ZSB0byBhIGNvbWJpbmF0aW9uIG9mIHRoaW5ncy4KPgo+UmV0dXJuaW5n
IHRoZSBtb3JlIGxvY2FsaXNlZCBlcnJvciBzYXZlcyB1c2Vyc3BhY2UgYSBsb3Qgb2Ygd29yayBh
bmQKPmVuYWJsZXMgYSBtb3JlIG9wdGltYWwgc3lzdGVtLgoKT2theSwgIGZpbmUsIEFDSy4KCj4K
PkNoZWVycywKPkRhbmllbAo=
