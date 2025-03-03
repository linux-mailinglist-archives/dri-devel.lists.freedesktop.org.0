Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE5B4A4B7D0
	for <lists+dri-devel@lfdr.de>; Mon,  3 Mar 2025 07:18:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C31D10E209;
	Mon,  3 Mar 2025 06:18:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="o4i/l6LA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5FD9910E209
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Mar 2025 06:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
 Message-ID; bh=c7wgwg7trkS2FEbermFL5uZykFzbYFprUh1vZsPcxAQ=; b=o
 4i/l6LAsls14OIcmvtqwwOM4Ex0xrFvPBFf5MGMz0Eq9wk3/SUITXGV1+IEVLCjN
 NzZgqff57nxwW40y0t2X8iVPvNU1auHQzK30CfapTI2VEmITd7NRc79C32nUiscC
 /WSexSSVSihNMlz3yKp9cH/z/L/seSW/G+69ExL+Es=
Received: from andyshrk$163.com ( [58.22.7.114] ) by
 ajax-webmail-wmsvr-40-100 (Coremail) ; Mon, 3 Mar 2025 14:17:50 +0800 (CST)
X-Originating-IP: [58.22.7.114]
Date: Mon, 3 Mar 2025 14:17:50 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: hjc@rock-chips.com, krzk+dt@kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, derek.foreman@collabora.com,
 detlev.casanova@collabora.com, daniel@fooishbar.org, robh@kernel.org,
 sebastian.reichel@collabora.com, "Andy Yan" <andy.yan@rock-chips.com>,
 "Michael Riesch" <michael.riesch@wolfvision.net>
Subject: Re:Re: [PATCH v15 07/13] drm/rockchip: vop2: Register the primary
 plane and overlay plane separately
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2025 www.mailtech.cn 163com
In-Reply-To: <2759797.BddDVKsqQX@diego>
References: <20250218112744.34433-1-andyshrk@163.com>
 <20250218112744.34433-8-andyshrk@163.com> <2759797.BddDVKsqQX@diego>
X-NTES-SC: AL_Qu2fAvWTvU4s5iaaZOkfmkcVgOw9UcO5v/Qk3oZXOJF8jCrp+T4yXHBTF1zd3fCDBzi2nQiHVRZJ0dhgcY1zcacMWFawtM+gPlh8AAO8w94NRQ==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <1c3ed06d.5e89.1955aa75521.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: ZCgvCgDHjF6OScVn0j4aAA--.17223W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiqBwFXmfFRICUNwADsp
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

CkhpIEhlaWtvLAoKQXQgMjAyNS0wMy0wMyAwMjo1Nzo1MCwgIkhlaWtvIFN0w7xibmVyIiA8aGVp
a29Ac250ZWNoLmRlPiB3cm90ZToKPkhpIEFuZHksCj4KPkFtIERpZW5zdGFnLCAxOC4gRmVicnVh
ciAyMDI1LCAxMjoyNzozNCBNRVogc2NocmllYiBBbmR5IFlhbjoKPj4gRnJvbTogQW5keSBZYW4g
PGFuZHkueWFuQHJvY2stY2hpcHMuY29tPgo+PiAKPj4gSW4gdGhlIHVwY29taW5nIFZPUCBvZiBy
azM1NzYsIGEgV2luZG93IGNhbm5vdCBhdHRhY2ggdG8gYWxsIFZpZGVvIFBvcnRzLAo+PiBzbyBt
YWtlIHN1cmUgYWxsIFZQIGZpbmQgaXQncyBzdWl0YWJsZSBwcmltYXJ5IHBsYW5lLCB0aGVuIHJl
Z2lzdGVyIHRoZQo+PiByZW1haW4gd2luZG93cyBhcyBvdmVybGF5IHBsYW5lIHdpbGwgbWFrZSBj
b2RlIGVhc2llci4KPj4gCj4+IFNpZ25lZC1vZmYtYnk6IEFuZHkgWWFuIDxhbmR5LnlhbkByb2Nr
LWNoaXBzLmNvbT4KPj4gVGVzdGVkLWJ5OiBNaWNoYWVsIFJpZXNjaCA8bWljaGFlbC5yaWVzY2hA
d29sZnZpc2lvbi5uZXQ+ICMgb24gUkszNTY4Cj4+IFRlc3RlZC1ieTogRGV0bGV2IENhc2Fub3Zh
IDxkZXRsZXYuY2FzYW5vdmFAY29sbGFib3JhLmNvbT4KPj4gCj4+IC0tLQo+Cj5wYXRjaGVzIDct
OSBsb29rIGdvb2QgdG8gZ28sIGJ1dCAuLi4KPgo+dGhpcyBuZWVkcyBhIHJlYmFzZSB0byBhZGFw
dCB0bwo+ImRybS9yb2NrY2hpcDogdm9wMjogQ29uc2lzdGVudGx5IHVzZSBkZXZfZXJyX3Byb2Jl
KCkiIFswXQo+Cj5bMF0gaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL2RybS9taXNjL2tl
cm5lbC8tL2NvbW1pdC9iMDZkMWVmMzM1NTU3MTM4M2NkYjQ2M2NmMDE5NWI3YTAyZWZkZmJmCgoK
VGhhbmsgeW91LgpJIHNlbnQgVjE2IHdpdGggdGhlIHJlbWFpbmluZyBwYXRjaGVzIHJlYmFzZWQg
b24gZHJtLW1pc2MtbmV4dCwgYW5kIGZpeCB0aGUgc3R5bGUgaXNzdWVzLgoKCj4KPgo+PiAtCQlp
ZiAod2luLT50eXBlID09IERSTV9QTEFORV9UWVBFX1BSSU1BUlkpIHsKPj4gLQkJCXZwID0gZmlu
ZF92cF93aXRob3V0X3ByaW1hcnkodm9wMik7Cj4+IC0JCQlpZiAodnApIHsKPj4gKwkJCWlmICh2
b3AyX2lzX21pcnJvcl93aW4od2luKSkKPj4gKwkJCQljb250aW51ZTsKPj4gKwo+PiArCQkJaWYg
KHdpbi0+dHlwZSA9PSBEUk1fUExBTkVfVFlQRV9QUklNQVJZKSB7Cj4+ICAJCQkJcG9zc2libGVf
Y3J0Y3MgPSBCSVQobnZwKTsKPj4gIAkJCQl2cC0+cHJpbWFyeV9wbGFuZSA9IHdpbjsKPj4gKwkJ
CQlyZXQgPSB2b3AyX3BsYW5lX2luaXQodm9wMiwgd2luLCBwb3NzaWJsZV9jcnRjcyk7Cj4+ICsJ
CQkJaWYgKHJldCkgewo+PiArCQkJCQlkcm1fZXJyKHZvcDItPmRybSwgImZhaWxlZCB0byBpbml0
IHByaW1hcnkgcGxhbmUgJXM6ICVkXG4iLAo+PiArCQkJCQkJd2luLT5kYXRhLT5uYW1lLCByZXQp
Owo+Cj5zaG91bGQgYWxzbyB1c2UgZGV2X2Vycl9wcm9iZQo+Cj4KPkhlaWtvCj4KPgo=
