Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 639599856B3
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2024 11:55:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D419410E2DA;
	Wed, 25 Sep 2024 09:54:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="Q+0rU5Z9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3AA1C10E2DA
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2024 09:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
 Message-ID; bh=NhZ6iwwwuVk4Lk7eKD+fvfCc6FOuugx2njYSOk4fgrM=; b=Q
 +0rU5Z9VVZziCAs7mZ1sYnWQMVZQghNmJJTDW8EynLomZj8qqokySGfJeyL1vkls
 q/Ws5jUGv0a2DDJpOCrKFRrbYW2DqZq5g9GvgPjjCiOE/K1sl6dLkS1wPjyT4j13
 4LUIa2b4cSQ2ePZTiaKn6bu/xRs56z1MW0KKq5iGeg=
Received: from andyshrk$163.com ( [58.22.7.114] ) by
 ajax-webmail-wmsvr-40-111 (Coremail) ; Wed, 25 Sep 2024 17:54:26 +0800
 (CST)
X-Originating-IP: [58.22.7.114]
Date: Wed, 25 Sep 2024 17:54:26 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: "Michael Riesch" <michael.riesch@wolfvision.net>
Cc: heiko@sntech.de, hjc@rock-chips.com, krzk+dt@kernel.org, robh@kernel.org, 
 conor+dt@kernel.org, s.hauer@pengutronix.de, 
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, derek.foreman@collabora.com, 
 minhuadotchen@gmail.com, detlev.casanova@collabora.com, 
 "Andy Yan" <andy.yan@rock-chips.com>
Subject: Re:Re: [PATCH v3 00/15] VOP Support for rk3576
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2024 www.mailtech.cn 163com
In-Reply-To: <3dfe0855-3f58-432f-922d-4c936f36c731@wolfvision.net>
References: <20240920081626.6433-1-andyshrk@163.com>
 <3dfe0855-3f58-432f-922d-4c936f36c731@wolfvision.net>
X-NTES-SC: AL_Qu2ZBf6et0gt4CmcYOlS+zN027ZZGIPiw4tinfIOfuALgRno+Sw7QGRAAUPr2/tGWAP6ZpXDzX0y08JzZZGP
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <75a13dbb.acb8.192289a8005.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: bygvCgDnz43X3fNmpBQBAA--.7172W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiqQtlXmbz2h1NcgACs2
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

CkhpIE1pY2hhZWzvvIwKCkF0IDIwMjQtMDktMjQgMTc6MzQ6NTIsICJNaWNoYWVsIFJpZXNjaCIg
PG1pY2hhZWwucmllc2NoQHdvbGZ2aXNpb24ubmV0PiB3cm90ZToKPkhpIEFuZHksCj4KPk9uIDkv
MjAvMjQgMTA6MTYsIEFuZHkgWWFuIHdyb3RlOgo+PiBbLi4uXQo+Cj5BIGZldyBtaW5vciBuaXRw
aWNrczoKPgo+PiBBbmR5IFlhbiAoMTUpOgo+PiAgIGRybS9yb2NrY2hpcDogdm9wMjogQWRkIGRl
YnVnZnMgc3VwcG9ydAo+Cj5UaGVyZSBpcyBhbiBleHRyYSBzcGFjZSBpbiB0aGUgZXh0ZW5kZWQg
Y29tbWl0IG1lc3NhZ2UgKCIuLi5zdW1tYXJ5Ogo+ZHVtcC4uLiIgLT4gIi4uLnN1bW1hcnk6IGR1
bXAuLi4iLgo+Cj4+ICAgZHJtL3JvY2tjaGlwOiBTZXQgZG1hIG1hc2sgdG8gNjQgYml0Cj4+ICAg
ZHJtL3JvY2tjaGlwOiB2b3AyOiBGaXggY2x1c3RlciB3aW5kb3dzIGFscGhhIGN0cmwgcmVnc2l0
ZXJzIG9mZnNldAo+Cj5UeXBvICJyZWdzaXRlcnMiIC0+ICJyZWdpc3RlcnMiLgo+Cj4+ICAgZHJt
L3JvY2tjaGlwOiB2b3AyOiBGaXggdGhlIG1peGVyIGFscGhhIHNldHVwIGZvciBsYXllciAwCj4+
ICAgZHJtL3JvY2tjaGlwOiB2b3AyOiBGaXggdGhlIHdpbmRvd3Mgc3dpdGNoIGJldHdlZW4gZGlm
ZmVyZW50IGxheWVycwo+PiAgIGRybS9yb2NrY2hpcDogdm9wMjogaW5jbHVkZSByb2NrY2hpcF9k
cm1fZHJ2LmgKPj4gICBkcm0vcm9ja2NoaXA6IHZvcDI6IFN1cHBvcnQgMzJ4OCBzdXBlcmJsb2Nr
IGFmYmMKPj4gICBkcm0vcm9ja2NoaXA6IHZvcDI6IEFkZCBwbGF0Zm9ybSBzcGVjaWZpYyBjYWxs
YmFjawo+PiAgIGRybS9yb2NrY2hpcDogdm9wMjogU3VwcG9ydCBmb3IgZGlmZmVyZW50IGxheWVy
IHNlbGV0IGNvbmZpZ3VyYXRpb24KPgo+VHlwbyAic2VsZXQiIC0+ICJzZWxlY3QiPwoKVGhhbmtz
77yMIGFsbCB0eXBvcyB3aWxsIGJlIGZpeGVkIGluIG5leHQgdmVyc2lvbi4KCj4KPj4gICAgIGJl
dHdlZW4gVlBzCj4+ICAgZHJtL3JvY2tjaGlwOiB2b3AyOiBJbnRyb2R1Y2Ugdm9wIGhhcmR3YXJl
IHZlcnNpb24KPj4gICBkcm0vcm9ja2NoaXA6IHZvcDI6IFJlZ2lzdGVyIHRoZSBwcmltYXJ5IHBs
YW5lIGFuZCBvdmVybGF5IHBsYW5lCj4+ICAgICBzZXBhcmF0ZWx5Cj4+ICAgZHJtL3JvY2tjaGlw
OiB2b3AyOiBTZXQgcGxhbmUgcG9zc2libGUgY3J0Y3MgYnkgcG9zc2libGUgdnAgbWFzawo+PiAg
IGRybS9yb2NrY2hpcDogdm9wMjogQWRkIHV2IHN3YXAgZm9yIGNsdXN0ZXIgd2luZG93Cj4+ICAg
ZHQtYmluZGluZ3M6IGRpc3BsYXk6IHZvcDI6IEFkZCByazM1NzYgc3VwcG9ydAo+PiAgIGRybS9y
b2NrY2hpcDogdm9wMjogQWRkIHN1cHBvcnQgZm9yIHJrMzU3Ngo+PiAKPj4gIC4uLi9kaXNwbGF5
L3JvY2tjaGlwL3JvY2tjaGlwLXZvcDIueWFtbCAgICAgICB8ICAgMTMgKy0KPj4gIGRyaXZlcnMv
Z3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9kcm1fZHJ2LmMgICB8ICAgIDQgKy0KPj4gIGRyaXZl
cnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9kcm1fdm9wMi5jICB8IDE1NzIgKysrKy0tLS0t
LS0tLQo+PiAgZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL3JvY2tjaGlwX2RybV92b3AyLmggIHwg
IDI3NCArKy0KPj4gIGRyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF92b3AyX3JlZy5j
ICB8IDE5NDggKysrKysrKysrKysrKysrKy0KPj4gIDUgZmlsZXMgY2hhbmdlZCwgMjY4MyBpbnNl
cnRpb25zKCspLCAxMTI4IGRlbGV0aW9ucygtKQo+Cj5JIGdhdmUgeW91ciBjaGFuZ2VzIGEgcXVp
Y2sgdGVzdCBvbiBteSBSSzM1NjggZGV2aWNlIGFuZCBkaWQgbm90IGZpbmQKPmFueSByZWdyZXNz
aW9ucyAtPgoKVGhhbmtzIGFnYWlu77yMIEkgYWxzbyB0ZXN0ZWQgIHRoaXMgc2VyaWVzIG9uIHJr
MzU2Ni9yazM1ODguCgo+Cj5UZXN0ZWQtYnk6IE1pY2hhZWwgUmllc2NoIDxtaWNoYWVsLnJpZXNj
aEB3b2xmdmlzaW9uLm5ldD4gIyBvbiBSSzM1NjgKPgo+VGhhbmtzIGFuZCBiZXN0IHJlZ2FyZHMs
Cj5NaWNoYWVsCg==
