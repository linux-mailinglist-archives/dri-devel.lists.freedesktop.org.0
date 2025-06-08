Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5C71AD11F9
	for <lists+dri-devel@lfdr.de>; Sun,  8 Jun 2025 14:11:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3554B10E1DE;
	Sun,  8 Jun 2025 12:11:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="DI//GBP0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3800A10E1DE
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Jun 2025 12:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
 Message-ID; bh=6ID2jv7IpjaXZzgsAbSl29cz1HomlrbIYorhudp6eMU=; b=D
 I//GBP0/zif9lnNfCP7BuGJRcw1TxfVyga3LEDmTvpP74hDNGvNaX2iC/TWbrDUF
 H7sxr2Oszcp5sixfUheml85vsz4M/NuTUUl+qsUjrzZK6h4iJYHr7LX49vDq5DbI
 OfjttHtMwKqR3WXViX68QEBBJM05wWy/wu6BTtoXzU=
Received: from andyshrk$163.com ( [103.29.142.67] ) by
 ajax-webmail-wmsvr-40-123 (Coremail) ; Sun, 8 Jun 2025 20:10:35 +0800 (CST)
X-Originating-IP: [103.29.142.67]
Date: Sun, 8 Jun 2025 20:10:35 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: "Diederik de Haas" <didi.debian@cknow.org>
Cc: "Piotr Zalewski" <pZ010001011111@proton.me>, hjc@rock-chips.com,
 heiko@sntech.de, andy.yan@rock-chips.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 "Dang Huynh" <danct12@riseup.net>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re:Re: [PATCH drm-misc-next] rockchip/drm: vop2: don't check
 color_mgmt_changed in atomic_enable
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2025 www.mailtech.cn 163com
In-Reply-To: <DAH3S8O66J47.3NT18EJCXWKL9@cknow.org>
References: <20241206192013.342692-3-pZ010001011111@proton.me>
 <DAEVDSTMWI1E.J454VZN0R9MA@cknow.org>
 <mArHDRo5bhIAjG8sDOR-kM7DsVdbXxxcC8hfuEEPfUWIdMwNnSUy8ZFoLis66DFSuIEq8TrnAxUGkyo5IUTGw3AG4k3vuVVz0fsoI27BAms=@proton.me>
 <DAH3S8O66J47.3NT18EJCXWKL9@cknow.org>
X-NTES-SC: AL_Qu2fC/+Tu04o4yeZYekfmkcVgOw9UcO5v/Qk3oZXOJF8jAnp/T0CbXlFHVfO8eidIg6+nh6RWQNCz8Zhe5Z8T5o5HoaUcXQ50738KpYJAcUkaw==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <47773829.1fce.1974f732545.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: eygvCgDnT8i7fUVoqngWAA--.39866W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbBkBFmXmhFcczhegACsw
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

CkhlbGxv77yMCgpBdCAyMDI1LTA2LTA4IDE5OjA4OjUwLCAiRGllZGVyaWsgZGUgSGFhcyIgPGRp
ZGkuZGViaWFuQGNrbm93Lm9yZz4gd3JvdGU6Cj5IaSBQaW90ciwKPgo+T24gU2F0IEp1biA3LCAy
MDI1IGF0IDU6MzIgUE0gQ0VTVCwgUGlvdHIgWmFsZXdza2kgd3JvdGU6Cj4+IE9uIFRodXJzZGF5
LCBKdW5lIDV0aCwgMjAyNSBhdCAxMDoxMyBQTSwgRGllZGVyaWsgZGUgSGFhcyA8ZGlkaS5kZWJp
YW5AY2tub3cub3JnPiB3cm90ZToKPj4+IFNpbmNlIGtlcm5lbCA2LjE0LXJjMSBJIGhhdmUgdGhl
IHByb2JsZW0gdGhhdCB2aXN1YWwgb3V0cHV0IGlzIG5vIGxvbmdlcgo+Pj4gc2hvd24gb24gbXkg
UGluZVRhYjIgYW5kIGEgYGdpdCBiaXNlY3RgIHBvaW50ZWQgdG8gdGhpcyBwYXRjaC9jb21taXQK
Pj4+IGFzIHRoZSBjdWxwcml0LiBXaGF0IGlzIGltcG9ydGFudCB0byBub3RlIGlzIHRoYXQgYENP
TkZJR19EUk09bWAgc2VlbXMKPj4+IHRvIGJlIHJlcXVpcmVkIGFzIHRoZSBwcm9ibGVtIGRvZXMg
bm90IG9jY3VyIHdpdGggYENPTkZJR19EUk09eWAuCj4+PiAKPj4+IE5lYXIgdGhlIGVuZCBvZiBt
eSBiaXNlY3Qgc2Vzc2lvbiwgc29tZXRoaW5nIGludGVyZXN0aW5nIG9jY3VycmVkLgo+Pj4gSSB3
YXMgYm9vdGVkIGludG8gYSAnYmFkJyBrZXJuZWwgKGllIG5vIHZpc3VhbCBvdXRwdXQpIGFuZCB3
aGVuIEkKPj4+IHN0YXJ0ZWQgdG8gYnVpbGQgbXkgZmluYWwga2VybmVsLCBJIGNsb3NlZCB0aGUg
bGlkIG9mIHRoZSBQaW5lVGFiMiB3aGljaAo+Pj4gbWFkZSBpdCBnbyBpbnRvIHN1c3BlbmQuIFdo
ZW4gbXkgZmluYWwga2VybmVsIHdhcyBidWlsdCwgSSBvcGVuZWQgdGhlCj4+PiBsaWQgYWdhaW4s
IHdoaWNoIG1hZGUgaXQgcmVzdW1lLCB0byB0cmFuc2ZlciBteSBmaW5hbCBrZXJuZWwgdG8gaXQu
Cj4+PiBBbmQgbXVjaCB0byBteSBzdXJwcmlzZSwgSSB0aGVuIGRpZCBoYXZlIHZpc3VhbCBvdXRw
dXQuCj4+PiBXaGVuIEkgcmVhZCB0aGUgKGJlbG93KSBjb21taXQgbWVzc2FnZSBvZiB0aGUgJ29m
ZmVuZGluZycgY29tbWl0LCBpdCBtYXkKPj4+IG5vdCBiZSBzdWNoIGEgc3VycHJpc2UgYWZ0ZXIg
YWxsLgo+Pj4gCj4+PiBJIGRpZCB0cnkgaXQgb24gYSBRdWFydHo2NC1CIChhbHNvIHJrMzU2Nikg
YW5kIGl0IGRpZCBub3QgaGF2ZSBhbnkgaXNzdWUKPj4+IChvdXRwdXQgdmlhIEhETUkpLgo+Pj4g
SSBkb24ndCBrbm93IHdoYXQgdGhlIGNhdXNlIGZvciB0aGlzIGlzc3VlIGlzLCBob3BlZnVsbHkg
eW91IGRvLgo+Pgo+PiBJIHRlc3RlZCBhbmQgY29uZmlybWVkIHRoYXQgdGhpcyBoYXBwZW5zIHdp
dGggZHJtPW0gYnV0IGFsc28gaW4gbXkgY2FzZSAKPj4gaXQgaGFwcGVuZWQgd2hlbiBkcm09eS4g
QWZ0ZXIgc29tZSB0ZXN0aW5nIEkgZm91bmQgb3V0IHRoYXQgYXQgYm9vdCBtb2Rlc2V0Cj4KPklu
dGVyZXN0aW5nIHRoYXQgaXQgYWxzbyBoYXBwZW5lZCB3aXRoIGRybT15Lgo+QXMgeW91J3JlIG1v
cmUga25vd2xlZGdlYWJsZSB0aGVuIEkgYW0gd2l0aCB0aGlzLCBtYXliZSBsb29rIHRocm91Z2gK
Pmh0dHBzOi8vbGlzdHMuc3IuaHQvfmRpZWRlcmlrL3BpbmU2NC1kaXNjdXNzLzxEOUFNMk9PTFJF
TzAuMkpNQUk0MkowNlRXMEBja25vdy5vcmc+Cj4KPnRvIHNlZSBpZiB5b3UgbWF5IHNwb3Qgc29t
ZXRoaW5nIHJlbGV2YW50Pwo+Cj4+IGhhcHBlbmVkIHR3aWNlIGFuZCBhdCBzaG9ydCBpbnRlcnZh
bCBhbmQgc2luY2UgdGhpcyBwYXRjaCBhbGxvd3MgZm9yIGdhbW1hIAo+PiBMVVQgdXBkYXRlIHJl
Z2FyZGxlc3Mgb2YgY29sb3JfbWdtdF9jaGFuZ2VkIHN0YXRlIHRoaXMgbWFrZXMgRFNQIENUUkwg
R0FNTUEgCj4+IExVVCBFTiBiaXQgdG8gYmUgdW5zZXQgdHdpY2UgdG9vLiBJdCBzZWVtcyB0aGF0
IFZPUCBkb2VzIG5vdCBsaWtlIGl0LiBJIAo+Cj5IYXBweSB0byBzZWUgeW91IGZvdW5kIHRoZSBj
YXVzZSA6LSkKPkRvIHlvdSBoYXBwZW4gdG8ga25vdyB3aHkgaXQgd2FzIHVuc2V0IHR3aWNlPyBU
aGF0IHNvdW5kcyBzdWJvcHRpbWFsLgo+QnV0IChJSVVDKSBzZXR0aW5nIGEgYml0IHRvIGEgdmFs
dWUgaXQgYWxyZWFkeSBoYXMgY2F1c2luZyBpc3N1ZXMsCj5zb3VuZHMgc3VycHJpc2luZyBhcyB3
ZWxsLgoKCkkgaGF2ZSBjb25kdWN0ZWQgdGVzdHMgb24gYm90aCByazM1NjYtYm94LWRlbW8gKHdp
dGggZHJtIHNldCB0byB5KSBhbmQgcmszNTY4LWx1YmFuY2F0LTIgKHdpdGggZHJtIHNldCB0byBt
KSwgCmJ1dCBJIHdhcyB1bmFibGUgdG8gcmVwcm9kdWNlIHRoaXMgaXNzdWUuIENvdWxkIHlvdSB0
d28gcGxlYXNlIHNoYXJlIHlvdXIga2VybmVsIGRlZmNvbmZpZyBhbmQgdGhlIGNvcnJlc3BvbmRp
bmcga2VybmVsIHN0YXJ0dXAgbG9ncz8gCkFkZGl0aW9uYWxseSwgYm90aCBvZiBteSB0d28gYm9h
cmRzIHRlc3RlZCB3aXRoIEhETUkgb3V0cHV0LiBXaGF0IGtpbmQgb2YgZGlzcGxheSBpbnRlcmZh
Y2UgZG9lcyB5b3VyIGJvYXJkIHVzZSBmb3Igb3V0cHV0PwoKPgo+PiBwYXRjaGVkIHZvcDJfdnBf
ZHNwX2x1dF9kaXNhYmxlIGZ1bmN0aW9uIHNvIHRoYXQgZHNwX2N0cmwgaXMgc2V0IG9ubHkgaWYg
Cj4+IEdBTU1BIExVVCBFTiBiaXQgaXMgc2V0LiBJIGNoZWNrZWQgdGhhdCB0aGlzIGFsc28gZG9l
cyBub3QgYnJlYWsgdGhlIGdhbW1hIAo+PiBsdXQgZnVuY3Rpb25hbGl0eSB3aXRoIGVtcGhhc2lz
IG9uIG91dC1vZi9pbnRvIHN1c3BlbmQgYmVoYXZpb3IuCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vcm9ja2NoaXAvcm9ja2NoaXBfZHJtX3ZvcDIuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9yb2NrY2hpcC9yb2NrY2hpcF9kcm1fdm9wMi5jCj4+IGluZGV4IGQwZjVmZWExNWUyMS4uN2Rk
ZjMxMWIzOGM2IDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvcm9ja2No
aXBfZHJtX3ZvcDIuYwo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvcm9ja2NoaXBf
ZHJtX3ZvcDIuYwo+PiBAQCAtODk3LDYgKzg5Nyw5IEBAIHN0YXRpYyB2b2lkIHZvcDJfdnBfZHNw
X2x1dF9kaXNhYmxlKHN0cnVjdCB2b3AyX3ZpZGVvX3BvcnQgKnZwKQo+PiAgewo+PiAgCXUzMiBk
c3BfY3RybCA9IHZvcDJfdnBfcmVhZCh2cCwgUkszNTY4X1ZQX0RTUF9DVFJMKTsKPj4gIAo+PiAr
CWlmICgoZHNwX2N0cmwgJiBSSzM1NjhfVlBfRFNQX0NUUkxfX0RTUF9MVVRfRU4pID09IDApCj4+
ICsJCXJldHVybjsKPj4gKwo+PiAgCWRzcF9jdHJsICY9IH5SSzM1NjhfVlBfRFNQX0NUUkxfX0RT
UF9MVVRfRU47Cj4+ICAJdm9wMl92cF93cml0ZSh2cCwgUkszNTY4X1ZQX0RTUF9DVFJMLCBkc3Bf
Y3RybCk7Cj4+ICB9Cj4KPkkgYnVpbHQgYSBrZXJuZWwgd2l0aCA2LjE0LXJjMSArIHRoaXMgcGF0
Y2ggYW5kIGNhbiBjb25maXJtIHRoZSBzY3JlZW4KPmhhcyBvdXRwdXQgYWdhaW4gOi0pCj4KPj4g
SSB3aWxsIHdhaXQgd2l0aCBzZW5kaW5nIGEgcGF0Y2ggYmVjYXVzZSBtYXliZSBBbmR5IGhhcyBz
b21ldGhpbmcgdG8gYWRkIAo+PiB0byB0aGlzLgo+Cj5Tb3VuZHMgbGlrZSBhIHBsYW4uIEl0IGNv
dWxkIGJlIHRoYXQgdGhpcyBpc3N1ZSBzdXJmYWNlZCBhbiB1bmRlcmxheWluZwo+aXNzdWUgYW5k
IGlmIHNvLCBmaXhpbmcgdGhhdCB3b3VsZCBiZSBldmVuIGJldHRlci4KPgo+PiBCZXN0IHJlZ2Fy
ZHMsIFBpb3RyIFphbGV3c2tpCj4KPlRoYW5rcyBhIGxvdCEKPgo+Q2hlZXJzLAo+ICBEaWVkZXJp
awo=
