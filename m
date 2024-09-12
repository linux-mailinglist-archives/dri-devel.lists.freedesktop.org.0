Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64E8E9761C6
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2024 08:44:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF1D210EAE4;
	Thu, 12 Sep 2024 06:44:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="HnW07QIC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3EB4210EAE4
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2024 06:44:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
 Message-ID; bh=NSwbv3RzHztwGPofv8zYBn4+43JFyZKE9ZUFMN8oMh4=; b=H
 nW07QICKXXut+YBsNqTjAUIFJk7IOEZnb/oYIBT+OLIBG/M5hj1YhVqW7+plXLKp
 WbbJSugLri166py19CGEVjhKXPaKUY/T8SN2WMd/t5l6EJ+XnpeExaTkkvloFxiX
 B7d84LVqW9CbUXTekuTFpkLRmDbj/fJ5UhGiNXiXm0=
Received: from andyshrk$163.com ( [58.22.7.114] ) by
 ajax-webmail-wmsvr-40-118 (Coremail) ; Thu, 12 Sep 2024 14:44:11 +0800
 (CST)
X-Originating-IP: [58.22.7.114]
Date: Thu, 12 Sep 2024 14:44:11 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: "Diederik de Haas" <didi.debian@cknow.org>
Cc: "Sascha Hauer" <s.hauer@pengutronix.de>, detlev.casanova@collabora.com, 
 heiko@sntech.de, devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, hjc@rock-chips.com, 
 mripard@kernel.org, sebastian.reichel@collabora.com, 
 linux-rockchip@lists.infradead.org, sjoerd@collabora.com, 
 "Andy Yan" <andy.yan@rock-chips.com>, krzk+dt@kernel.org, robh@kernel.org
Subject: Re:Re: [PATCH v2 05/11] drm/rockchip: vop2: Introduce vop hardware
 version
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2024 www.mailtech.cn 163com
In-Reply-To: <D41NH5VO0A7T.26F04WDY1UTCR@cknow.org>
References: <20240904120238.3856782-1-andyshrk@163.com>
 <20240904120238.3856782-6-andyshrk@163.com>
 <ZtlZgKcDQFF_WnCn@pengutronix.de>
 <2326e2ea.8264.191c13bab93.Coremail.andyshrk@163.com>
 <Zt68U6hnPA0KrxXB@pengutronix.de> <D41NH5VO0A7T.26F04WDY1UTCR@cknow.org>
X-NTES-SC: AL_Qu2ZBP2ZvEwu5yGZYOkZnEobh+Y5UcK2s/ki2YFXN5k0qCTV5jkBWWZDIkXN6NmkFCKFqQG+fRRj0uF4R4BKeJxW9ZfBu/1qh3H8Yn4m2E6B
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <56a02879.5ff0.191e4f9a2ef.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: _____wD3H2i7jeJmxCURAA--.1379W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiMxpYXmXAnzzHHwABsw
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

CgpIaSDvvIwKQXQgMjAyNC0wOS0wOSAxNzozNjoxNCwgIkRpZWRlcmlrIGRlIEhhYXMiIDxkaWRp
LmRlYmlhbkBja25vdy5vcmc+IHdyb3RlOgo+T24gTW9uIFNlcCA5LCAyMDI0IGF0IDExOjEzIEFN
IENFU1QsIFNhc2NoYSBIYXVlciB3cm90ZToKPj4gT24gVGh1LCBTZXAgMDUsIDIwMjQgYXQgMDQ6
MDk6NThQTSArMDgwMCwgQW5keSBZYW4gd3JvdGU6Cj4+ID4gIEF0IDIwMjQtMDktMDUgMTU6MTA6
NTYsICJTYXNjaGEgSGF1ZXIiIDxzLmhhdWVyQHBlbmd1dHJvbml4LmRlPiB3cm90ZToKPj4gPiAg
Pk9uIFdlZCwgU2VwIDA0LCAyMDI0IGF0IDA4OjAyOjMyUE0gKzA4MDAsIEFuZHkgWWFuIHdyb3Rl
Ogo+PiA+ICA+PiBGcm9tOiBBbmR5IFlhbiA8YW5keS55YW5Acm9jay1jaGlwcy5jb20+Cj4+ID4g
ID4+Cj4+ID4gID4+IFRoZXJlIGlzIGEgdmVyc2lvbiBudW1iZXIgaGFyZGNvZGVkIGluIHRoZSBW
T1AgVkVSU0lPTl9JTkZPCj4+ID4gID4+IHJlZ2lzdGVyLCBhbmQgdGhlIHZlcnNpb24gbnVtYmVy
IGluY3JlbWVudHMgc2VxdWVudGlhbGx5IGJhc2VkCj4+ID4gID4+IG9uIHRoZSBwcm9kdWN0aW9u
IG9yZGVyIG9mIHRoZSBTT0MuCj4+ID4gID4+Cj4+ID4gID4+IFNvIHVzaW5nIHRoaXMgdmVyc2lv
biBudW1iZXIgdG8gZGlzdGluZ3Vpc2ggZGlmZmVyZW50IFZPUCBmZWF0dXJlcwo+PiA+ICA+PiB3
aWxsIHNpbXBsaWZ5IHRoZSBjb2RlLgo+PiA+ICA+Pgo+PiA+ICA+PiBTaWduZWQtb2ZmLWJ5OiBB
bmR5IFlhbiA8YW5keS55YW5Acm9jay1jaGlwcy5jb20+Cj4+ID4gID4+Cj4+ID4gID4+IC0tLQo+
PiA+ICA+Pgo+PiA+ICA+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL3Jv
Y2tjaGlwX2RybV92b3AyLmggYi9kcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvcm9ja2NoaXBfZHJt
X3ZvcDIuaAo+PiA+ICA+PiBpbmRleCA5YjI2OWY2ZTU3NmUuLjg3MWQ5YmNkMWQ4MCAxMDA2NDQK
Pj4gPiAgPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL3JvY2tjaGlwX2RybV92b3Ay
LmgKPj4gPiAgPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL3JvY2tjaGlwX2RybV92
b3AyLmgKPj4gPiAgPj4gQEAgLTEzLDYgKzEzLDE1IEBACj4+ID4gID4+ICAjaW5jbHVkZSAicm9j
a2NoaXBfZHJtX2Rydi5oIgo+PiA+ICA+PiAgI2luY2x1ZGUgInJvY2tjaGlwX2RybV92b3AuaCIK
Pj4gPiAgPj4KPj4gPiAgPj4gKyNkZWZpbmUgVk9QMl9WRVJTSU9OKG1ham9yLCBtaW5vciwgYnVp
bGQpICAgICAoKG1ham9yKSA8PCAyNCB8IChtaW5vcikgPDwgMTYgfCAoYnVpbGQpKQo+PiA+ICA+
PiArCj4+ID4gID4+ICsvKiBUaGUgbmV3IFNPQyBWT1AgdmVyc2lvbiBpcyBiaWdnZXIgdGhhbiB0
aGUgb2xkICovCj4+ID4gID4+ICsjZGVmaW5lIFZPUF9WRVJTSU9OX1JLMzU2OCAgICBWT1AyX1ZF
UlNJT04oMHg0MCwgMHgxNSwgMHg4MDIzKQo+PiA+ICA+PiArI2RlZmluZSBWT1BfVkVSU0lPTl9S
SzM1ODggICAgVk9QMl9WRVJTSU9OKDB4NDAsIDB4MTcsIDB4Njc4NikKPj4gPiAgPj4gKyNkZWZp
bmUgVk9QX1ZFUlNJT05fUkszNTI4ICAgIFZPUDJfVkVSU0lPTigweDUwLCAweDE3LCAweDEyNjMp
Cj4+ID4gID4+ICsjZGVmaW5lIFZPUF9WRVJTSU9OX1JLMzU2MiAgICBWT1AyX1ZFUlNJT04oMHg1
MCwgMHgxNywgMHg0MzUwKQo+PiA+ICA+PiArI2RlZmluZSBWT1BfVkVSU0lPTl9SSzM1NzYgICAg
Vk9QMl9WRVJTSU9OKDB4NTAsIDB4MTksIDB4OTc2NSkKPj4gPiAgPgo+PiA+ICA+V2hhdCBhYm91
dCB0aGUgUkszNTY2PyBEb2VzIGl0IGhhdmUgdGhlIHNhbWUgdmVyc2lvbiBjb2RlIGFzIHRoZSBS
SzM1Njg/Cj4+ID4gID4KPj4gPiAgPlRoaXMgbmV3IHZlcnNpb24gZmllbGQgcmVwbGFjZXMgdGhl
IHNvY19pZCBtZWNoYW5pc20gd2UgaGFkIGJlZm9yZSB0bwo+PiA+ICA+OTklLiBZb3Uga2VlcCB0
aGUgc29jX2lkIGFyb3VuZCBqdXN0IGZvciBkaXN0aW5ndWlzaGluZyBiZXR3ZWVuIFJLMzU2Ngo+
PiA+ICA+YW5kIFJLMzU2OC4gSXQgd291bGQgYmUgbmljZSB0byBmdWxseSByZXBsYWNlIGl0Lgo+
PiA+ICA+Cj4+ID4gID5JIHNlZSB0aGF0IHRoZSBWT1BfVkVSU0lPTl9SSyogbnVtYmVycyBhcmUg
dGhlIHNhbWUgYXMgZm91bmQgaW4gdGhlCj4+ID4gID5WT1AyX1NZU19WRVJTSU9OX0lORiByZWdp
c3RlcnMuIE9uIHRoZSBvdGhlciBoYW5kIHlvdSBuZXZlciByZWFkIHRoZQo+PiA+ICA+dmFsdWUg
ZnJvbSB0aGUgcmVnaXN0ZXIgd2hpY2ggbWFrZSB0aGUgVk9QX1ZFUlNJT05fUksqIGp1c3QgYXJi
aXRyYXJ5Cj4+ID4gID5udW1iZXJzLiBXb3VsZG4ndCBpdCBiZSBwb3NzaWJsZSB0byBtYWtlIHNv
bWV0aGluZyB1cCBmb3IgUkszNTY2LCBsaWtlCj4+ID4gID5WT1AyX1ZFUlNJT04oMHg0MCwgMHgx
NSwgMHg4MDIyKSB0byBnZXQgcmlkIG9mIHRoZSBzb2NfaWQgdGhpbmd5Pwo+PiA+ICBZZXPvvIxS
SzM1NjYgYW5kIFJLMzU2OCBzaGFyZSB0aGUgc2FtZSBWT1AgSVAgYmxvY2vvvIwgc28gdGhlIHZl
cnNpb24gY29kZSBhdCBWRVJTSU9OX1JFR0lTVEVSIGlzCj4+ID4gIHRoZSBzYW1lLCB0aGUgZGlm
ZmVyZW5jZSBiZXR3ZWVuIHJrMzU2OCBhbmQgcmszMzU2NiBhcmUgaW50cm9kdWNlZCBhdCBzb2Mg
SW50ZWdyYXRpb27jgIIKPj4gPiAgU28gaSB3b3VsZCBzdGlsbCBsaWtlIHRvIGtlZXAgdGhlIHNv
Y19pZCB0byAgaGFuZGxlIHNpdHVhdGlvbiBsaWtlIHRoaXPjgIJBcyB3ZSBhbHdheXMgaGF2ZSBz
dWNoICBjYXVzZe+8jCBvbmUKPj4gPiAgc2FtZSBJUCBibG9ja++8jCBidXQgdGhlcmUgYXJlIHNv
bWUgc3VidGxlIGRpZmZlcmVuY2VzIGluIGZlYXR1cmVzIGFjcm9zcyBkaWZmZXJlbnQgU09Dcy4K
Pj4KPj4gRmluZSB3aXRoIG1lLiBZb3UgY291bGQgbGVhdmUgYSBjb21tZW50IGluIHRoZSBjb2Rl
IG9yIGNvbW1pdAo+PiBtZXNzYWdlIHRoYXQgZXhwbGFpbnMgd2h5IHdlIG5lZWQgYm90aC4KPgo+
QWxzbyAob3IgZXNwZWNpYWxseT8pIGFkZCB0aGF0IHRvIHRoZSBjb21taXQgbWVzc2FnZSBvZiBw
YXRjaCA2IG9mIHRoaXMKPnNlcmllcy4gUGF0Y2ggNidzIGNvbW1pdCBtZXNzYWdlIHRhbGtzIGFi
b3V0IFJLMzU3NiB3aGlsZSBpdCBjaGFuZ2VzCj5jb2RlIHJlbGF0ZWQgdG8gUkszNTY2IGFuZCBJ
ICh0b28/KSB0aG91Z2h0IHRoYXQgbm90IHVzaW5nIFZPUF9WRVJTSU9OCgo+d2FzIGFuIG92ZXJz
aWdodCwgd2hpbGUgaXQgdHVybnMgb3V0IHRvIGJlIGRlbGliZXJhdGUuCgoKT0vvvIwgd2lsbCBk
byBpbiB2My4+Cj5DaGVlcnMsCj4gIERpZWRlcmlrCg==
