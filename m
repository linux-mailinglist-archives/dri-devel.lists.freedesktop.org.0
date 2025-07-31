Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF99EB16A8D
	for <lists+dri-devel@lfdr.de>; Thu, 31 Jul 2025 04:53:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9BBC10E151;
	Thu, 31 Jul 2025 02:53:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="FnjEUdBt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1237C10E151
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Jul 2025 02:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
 Message-ID; bh=i4q4vAwvrtsGAsI2xJ7dj3RYSF+Dg7GuGqgKNXJO4wI=; b=F
 njEUdBtGApk+zvVvFqcr6uTdp/npFHFGLFq8t6Cn+qEL3yS2KCDI/mWC3+4QABJY
 HrkbBl8I8G3XhbXttd/LUU33EaLcbS+gvRgZNwocdkfN+gM4SERQ4Ua1lb4FcLs1
 M+//3d+SnyZYE8VIzBXv6YdIZPn8fr/90WhAd8jbVo=
Received: from andyshrk$163.com ( [103.29.142.67] ) by
 ajax-webmail-wmsvr-40-100 (Coremail) ; Thu, 31 Jul 2025 10:52:49 +0800
 (CST)
X-Originating-IP: [103.29.142.67]
Date: Thu, 31 Jul 2025 10:52:49 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: dmitry.baryshkov@oss.qualcomm.com, neil.armstrong@linaro.org,
 heiko@sntech.de, stephen@radxa.com, dri-devel@lists.freedesktop.org,
 hjc@rock-chips.com, mripard@kernel.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
 yubing.zhang@rock-chips.com, naoki@radxa.com,
 Laurent.pinchart@ideasonboard.com,
 "Andy Yan" <andy.yan@rock-chips.com>, krzk+dt@kernel.org,
 robh@kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re:Re:Re: [PATCH v6 09/10] arm64: dts: rockchip: Enable DisplayPort
 for rk3588s Cool Pi 4B
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20250519(9504565a)
 Copyright (c) 2002-2025 www.mailtech.cn 163com
In-Reply-To: <5deac95c.8ec2.1985b428b0b.Coremail.andyshrk@163.com>
References: <20250728082846.3811429-1-andyshrk@163.com>
 <20250728082846.3811429-10-andyshrk@163.com>
 <hbvwlucm5mnjpve6hb6h7dusgrokvdxzbpq5zrwib4yesrdakp@v77ofq7u2vv2>
 <5deac95c.8ec2.1985b428b0b.Coremail.andyshrk@163.com>
X-NTES-SC: AL_Qu2eAfWYv0st7yeQZekfmkcVgOw9UcO5v/Qk3oZXOJF8jCrp+T8Sd2ZaF1DE/tCJOQeHiwGOexp84/ZoY4N9R58oT+R9drh8m7TZL7FtHtaLMA==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <6c84556c.29cb.1985e658afb.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: ZCgvCgDnTyGB2opoljMKAA--.20578W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbB0gObXmiK0YynmQADsW
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

CkhlbGxvIFNlYmFzdGlhbu+8jAoK5ZyoIDIwMjUtMDctMzAgMjA6MTU6NDTvvIwiQW5keSBZYW4i
IDxhbmR5c2hya0AxNjMuY29tPiDlhpnpgZPvvJoKPgo+Cj5IZWxsbyBTZWJhc3RpYW7vvIwKPgo+
QXQgMjAyNS0wNy0zMCAwMTowOTo0MSwgIlNlYmFzdGlhbiBSZWljaGVsIiA8c2ViYXN0aWFuLnJl
aWNoZWxAY29sbGFib3JhLmNvbT4gd3JvdGU6Cj4+SGksCj4+Cj4+T24gTW9uLCBKdWwgMjgsIDIw
MjUgYXQgMDQ6Mjg6MzRQTSArMDgwMCwgQW5keSBZYW4gd3JvdGU6Cj4+PiBGcm9tOiBBbmR5IFlh
biA8YW5keS55YW5Acm9jay1jaGlwcy5jb20+Cj4+PiAKPj4+IEVuYWJsZSB0aGUgTWluaSBEaXNw
bGF5UG9ydCBvbiB0aGlzIGJvYXJkLgo+Pj4gTm90ZSB0aGF0IFJPQ0tDSElQX1ZPUDJfRVBfRFAw
IGlzIGRlZmluZWQgYXMgMTAgaW4gZHQtYmluZGluZyBoZWFkZXIsCj4+PiBidXQgaXQgd2lsbCB0
cmlnZ2VyIGEgZHRjIHdhcm5pbmcgbGlrZSAiZ3JhcGggbm9kZSB1bml0IGFkZHJlc3MgZXJyb3Is
Cj4+PiBleHBlY3RlZCAiYSIiIGlmIHdlIHVzZSBpdCBkaXJlY3RseSBhZnRlciBlbmRwb2ludCwg
c28gd2UgdXNlICJhIgo+Pj4gaW5zdGVhZCBoZXJlLgo+Pj4gCj4+PiBTaWduZWQtb2ZmLWJ5OiBB
bmR5IFlhbiA8YW5keS55YW5Acm9jay1jaGlwcy5jb20+Cj4+PiBSZXZpZXdlZC1ieTogRG1pdHJ5
IEJhcnlzaGtvdiA8ZG1pdHJ5LmJhcnlzaGtvdkBvc3MucXVhbGNvbW0uY29tPgo+Pj4gLS0tCj4+
Cj4+VGhlIGdyYXBoIGN1cnJlbnRseSBsb29rcyBsaWtlIHRoaXM6Cj4+Cj4+Vk9QIDwtPiBEUCBj
b250cm9sbGVyIDwtPiBEUCBDb25uZWN0b3IKPj4KPj5JSVVJQyB0aGlzIGRvZXMgbm90IHdvcmsg
Zm9yIFVTQi1DIGFuZCBuZWVkcyB0byBsb29rIGxpa2UgdGhpcywKPj5iZWNhdXNlIHRoZSBVU0JE
UCBQSFkgaGFuZGxlcyB0aGUgbGFuZSBtdXhpbmcgYW5kIHRodXMgbXVzdCBiZQo+PnRoZSB0aGlu
ZyBjb25uZWN0ZWQgdG8gdGhlIFVTQi1DIGNvbnRyb2xsZXIvY29ubmVjdG9yOgo+Cj5JIHByZXZp
b3VzbHkgdGVzdHMgVVNCLUMgQWx0bW9kZSBvbiBMaW51eCA1LjE1IHVzaW5nIFJvY2sgNWIsICB0
aGlzIGZ1bmN0aW9uIHdvcmtzIHdlbGwuIAo+SG93ZXZlciwgd2hlbiB0aGUgc2FtZSBkdHMgY29u
ZmlndXJhdGlvbiBpcyB1c2VkIG9uIExpbnV4IDYuMTYgYW5kIHRlc3RlZCB3aXRoIFJvY2sgNWIg
aW4gVVNCLUMgQWx0bW9kZSwgCj50aGUgSFBEIGludGVycnVwdCBvZiBEUCBjYW5ub3QgYmUgdHJp
Z2dlcmVkLiBJJ20gbm90IHN1cmUgeWV0IHdoYXQgY2hhbmdlcyBoYXZlIG9jY3VycmVkIGJldHdl
ZW4gdGhlbS4KPk1vcmVvdmVyLCBJIG5vdGljZWQgdGhhdCBvbiB5b3VyIHRlc3QgYnJhbmNoWzFd
LCB0aGUgRFRTIGNvbmZpZ3VyYXRpb24gaGFzIGFsc28gY2hhbmdlZCBjb21wYXJlZCB0byBiZWZv
cmUuCj5JIHdvdWxkIGdyZWF0bHkgYXBwcmVjaWF0ZSBpdCBpZiB5b3UgY291bGQgc2hhcmUgc29t
ZSBkZXRhaWxzLgoKU29tZSB1cGRhdGVzOgogICAgICBBZnRlciBjb21tZW50IG91dCBwZC12ZXJz
aW9uKFlvdXIgcHJldmlvdXMgRFRTIGRpZG4ndCBpbmNsdWRlIHRoaXMgcHJvcGVydHkuKSBvbiBs
aW51eCA2LjE2WzJdCiAgICAgLy9wZC1yZXZpc2lvbiA9IC9iaXRzLyA4IDwweDIgMHgwIDB4MSAw
eDI+OwogICAgVGhlIFVTQi1DIEFsdCBNb2RlIG91dHB1dCBjYW4gd29yayBhcyBiZWZvcmXjgIIK
ICAgIEkgc3RpbGwgaGF2ZSByZWxhdGl2ZWx5IGxpbWl0ZWQga25vd2xlZGdlIGFib3V0IFVTQi1D
LCBzbyBJIGhvcGUgdG8gaGVhciBtb3JlIG9mIHlvdXIgb3BpbmlvbnMuCgoKPgo+Cj4KPlswXWh0
dHBzOi8vZ2l0aHViLmNvbS9hbmR5c2hyay9saW51eC9jb21taXQvYjlmODdhNTYyZDQzMWZiNTli
NjY0YjdhZWQ0MTg2OWE4ZjE4NGRlMwo+WzFdaHR0cHM6Ly9naXRsYWIuY29sbGFib3JhLmNvbS9o
YXJkd2FyZS1lbmFibGVtZW50L3JvY2tjaGlwLTM1ODgvbGludXgvLS9jb21taXQvMGU3ZTkwNDk0
NDgyY2Y3N2Q1YmIwNThhNDc1ODNiNjc0N2IxNDBmNAogIFsyXWh0dHBzOi8vZ2l0aHViLmNvbS9h
bmR5c2hyay9saW51eC90cmVlL3JrMzU4OC1kcC11cHN0cmVhbS12NgoKPj4KPj5WT1AgPC0+IERQ
IGNvbnRyb2xsZXIgPC0+IFVTQkRQIFBIWSA8LT4gVVNCLUMgQ29ubmVjdG9yCj4+Cj4+SSB3b25k
ZXIgaWYgdGhlIHNpbXBsZSBjYXNlIG5vdCBpbnZvbHZpbmcgVVNCLUMgc2hvdWxkIGFsc28gaGF2
ZQo+PnRoZSBVU0JEUCBQSFkgZGVzY3JpYmVkIGluIHRoZSBncmFwaCBhcyBhIHRyYW5zcGFyZW50
IGJyaWRnZT8KPj5Ob3RlLCB0aGF0IHRoZSBVU0JEUCBQSFkgRFQgYmluZGluZyBpcyBjdXJyZW50
bHkgbm90IHJlYWR5IGZvcgo+PnRoaXMgKHRoaXMgYWxzbyBhZmZlY3RzIHRoZSBuZXh0IHBhdGNo
LCBidXQgc2hvdWxkIGJlIGVub3VnaCB0bwo+PmRpc2N1c3MgdGhpcyBvbmNlIDopKS4KPj4KPj5H
cmVldGluZ3MsCj4+Cj4+LS0gU2ViYXN0aWFuCj4+Cj4+PiAKPj4+IChubyBjaGFuZ2VzIHNpbmNl
IHYyKQo+Pj4gCj4+PiBDaGFuZ2VzIGluIHYyOgo+Pj4gLSBTb3J0IGluIGFscGhhYmV0aWNhbCBv
cmRlcgo+Pj4gCj4+PiAgLi4uL2Jvb3QvZHRzL3JvY2tjaGlwL3JrMzU4OHMtY29vbHBpLTRiLmR0
cyAgIHwgMzcgKysrKysrKysrKysrKysrKysrKwo+Pj4gIDEgZmlsZSBjaGFuZ2VkLCAzNyBpbnNl
cnRpb25zKCspCj4+PiAKPj4+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL3JvY2tj
aGlwL3JrMzU4OHMtY29vbHBpLTRiLmR0cyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvcm9ja2NoaXAv
cmszNTg4cy1jb29scGktNGIuZHRzCj4+PiBpbmRleCA4YjcxN2M0MDE3YTQ2Li41MzkzYzZjYzQ5
M2MzIDEwMDY0NAo+Pj4gLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9yb2NrY2hpcC9yazM1ODhz
LWNvb2xwaS00Yi5kdHMKPj4+ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvcm9ja2NoaXAvcmsz
NTg4cy1jb29scGktNGIuZHRzCj4+PiBAQCAtMzksNiArMzksMTggQEAgY2hvc2VuIHsKPj4+ICAJ
CXN0ZG91dC1wYXRoID0gInNlcmlhbDI6MTUwMDAwMG44IjsKPj4+ICAJfTsKPj4+ICAKPj4+ICsJ
ZHAtY29uIHsKPj4+ICsJCWNvbXBhdGlibGUgPSAiZHAtY29ubmVjdG9yIjsKPj4+ICsJCWxhYmVs
ID0gIkRQIE9VVCI7Cj4+PiArCQl0eXBlID0gIm1pbmkiOwo+Pj4gKwo+Pj4gKwkJcG9ydCB7Cj4+
PiArCQkJZHBfY29uX2luOiBlbmRwb2ludCB7Cj4+PiArCQkJCXJlbW90ZS1lbmRwb2ludCA9IDwm
ZHAwX291dF9jb24+Owo+Pj4gKwkJCX07Cj4+PiArCQl9Owo+Pj4gKwl9Owo+Pj4gKwo+Pj4gIAlo
ZG1pLWNvbiB7Cj4+PiAgCQljb21wYXRpYmxlID0gImhkbWktY29ubmVjdG9yIjsKPj4+ICAJCXR5
cGUgPSAiZCI7Cj4+PiBAQCAtMjE1LDYgKzIyNywyNCBAQCAmY3B1X2IyIHsKPj4+ICAJY3B1LXN1
cHBseSA9IDwmdmRkX2NwdV9iaWcxX3MwPjsKPj4+ICB9Owo+Pj4gIAo+Pj4gKyZkcDAgewo+Pj4g
KwlzdGF0dXMgPSAib2theSI7Cj4+PiArCXBpbmN0cmwtMCA9IDwmZHAwbTBfcGlucz47Cj4+PiAr
CXBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7Cj4+PiArfTsKPj4+ICsKPj4+ICsmZHAwX2luIHsK
Pj4+ICsJZHAwX2luX3ZwMjogZW5kcG9pbnQgewo+Pj4gKwkJcmVtb3RlLWVuZHBvaW50ID0gPCZ2
cDJfb3V0X2RwMD47Cj4+PiArCX07Cj4+PiArfTsKPj4+ICsKPj4+ICsmZHAwX291dCB7Cj4+PiAr
CWRwMF9vdXRfY29uOiBlbmRwb2ludCB7Cj4+PiArCQlyZW1vdGUtZW5kcG9pbnQgPSA8JmRwX2Nv
bl9pbj47Cj4+PiArCX07Cj4+PiArfTsKPj4+ICsKPj4+ICAmZ3B1IHsKPj4+ICAJbWFsaS1zdXBw
bHkgPSA8JnZkZF9ncHVfczA+Owo+Pj4gIAlzdGF0dXMgPSAib2theSI7Cj4+PiBAQCAtODg5LDMg
KzkxOSwxMCBAQCB2cDBfb3V0X2hkbWkwOiBlbmRwb2ludEBST0NLQ0hJUF9WT1AyX0VQX0hETUkw
IHsKPj4+ICAJCXJlbW90ZS1lbmRwb2ludCA9IDwmaGRtaTBfaW5fdnAwPjsKPj4+ICAJfTsKPj4+
ICB9Owo+Pj4gKwo+Pj4gKyZ2cDIgewo+Pj4gKwl2cDJfb3V0X2RwMDogZW5kcG9pbnRAYSB7Cj4+
PiArCQlyZWcgPSA8Uk9DS0NISVBfVk9QMl9FUF9EUDA+Owo+Pj4gKwkJcmVtb3RlLWVuZHBvaW50
ID0gPCZkcDBfaW5fdnAyPjsKPj4+ICsJfTsKPj4+ICt9Owo+Pj4gLS0gCj4+PiAyLjQzLjAKPj4+
IAo+X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPkxpbnV4
LXJvY2tjaGlwIG1haWxpbmcgbGlzdAo+TGludXgtcm9ja2NoaXBAbGlzdHMuaW5mcmFkZWFkLm9y
Zwo+aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yb2Nr
Y2hpcAo=
