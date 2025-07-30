Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A48B9B16009
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jul 2025 14:16:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F099210E05A;
	Wed, 30 Jul 2025 12:16:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="J8VTz1+H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
 by gabe.freedesktop.org (Postfix) with ESMTP id 49D4310E05A
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jul 2025 12:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
 Message-ID; bh=ElSFpxyOTNVE1T0z8YDlqpPg0MdkDgeazT0leojoLgA=; b=J
 8VTz1+HWGwyksH1/J3ahk6RCPqjfMpSDLn90iaX6A8LonsefGzYkgdwZyg/S2Iv/
 244T//fOex0i3VyLcvwv+LMGmgcIywmvr/lx2eMlJ5WZURL8yWd4dAdyj4hoNAw6
 iggBi2/1NoI1spucI2nYfSxdcoxI/xXByO6kNAO4SI=
Received: from andyshrk$163.com ( [58.22.7.114] ) by
 ajax-webmail-wmsvr-40-100 (Coremail) ; Wed, 30 Jul 2025 20:15:44 +0800
 (CST)
X-Originating-IP: [58.22.7.114]
Date: Wed, 30 Jul 2025 20:15:44 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: dmitry.baryshkov@oss.qualcomm.com, heiko@sntech.de, hjc@rock-chips.com,
 mripard@kernel.org, naoki@radxa.com, stephen@radxa.com,
 cristian.ciocaltea@collabora.com, neil.armstrong@linaro.org,
 Laurent.pinchart@ideasonboard.com, yubing.zhang@rock-chips.com,
 krzk+dt@kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, robh@kernel.org,
 "Andy Yan" <andy.yan@rock-chips.com>
Subject: Re:Re: [PATCH v6 09/10] arm64: dts: rockchip: Enable DisplayPort
 for rk3588s Cool Pi 4B
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20250519(9504565a)
 Copyright (c) 2002-2025 www.mailtech.cn 163com
In-Reply-To: <hbvwlucm5mnjpve6hb6h7dusgrokvdxzbpq5zrwib4yesrdakp@v77ofq7u2vv2>
References: <20250728082846.3811429-1-andyshrk@163.com>
 <20250728082846.3811429-10-andyshrk@163.com>
 <hbvwlucm5mnjpve6hb6h7dusgrokvdxzbpq5zrwib4yesrdakp@v77ofq7u2vv2>
X-NTES-SC: AL_Qu2eAfScuE8v4iOQZOkfmkcVgOw9UcO5v/Qk3oZXOJF8jCrp+T8Sd2ZaF1DE/tCJOQeHiwGOexp84/ZoY4N9R58oIPqZyitgPF4yMudd86PcBQ==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <5deac95c.8ec2.1985b428b0b.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: ZCgvCgDnTyHwDIpok+cJAA--.18121W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiMwqaXmiKBmCJrQACsf
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

CgpIZWxsbyBTZWJhc3RpYW7vvIwKCkF0IDIwMjUtMDctMzAgMDE6MDk6NDEsICJTZWJhc3RpYW4g
UmVpY2hlbCIgPHNlYmFzdGlhbi5yZWljaGVsQGNvbGxhYm9yYS5jb20+IHdyb3RlOgo+SGksCj4K
Pk9uIE1vbiwgSnVsIDI4LCAyMDI1IGF0IDA0OjI4OjM0UE0gKzA4MDAsIEFuZHkgWWFuIHdyb3Rl
Ogo+PiBGcm9tOiBBbmR5IFlhbiA8YW5keS55YW5Acm9jay1jaGlwcy5jb20+Cj4+IAo+PiBFbmFi
bGUgdGhlIE1pbmkgRGlzcGxheVBvcnQgb24gdGhpcyBib2FyZC4KPj4gTm90ZSB0aGF0IFJPQ0tD
SElQX1ZPUDJfRVBfRFAwIGlzIGRlZmluZWQgYXMgMTAgaW4gZHQtYmluZGluZyBoZWFkZXIsCj4+
IGJ1dCBpdCB3aWxsIHRyaWdnZXIgYSBkdGMgd2FybmluZyBsaWtlICJncmFwaCBub2RlIHVuaXQg
YWRkcmVzcyBlcnJvciwKPj4gZXhwZWN0ZWQgImEiIiBpZiB3ZSB1c2UgaXQgZGlyZWN0bHkgYWZ0
ZXIgZW5kcG9pbnQsIHNvIHdlIHVzZSAiYSIKPj4gaW5zdGVhZCBoZXJlLgo+PiAKPj4gU2lnbmVk
LW9mZi1ieTogQW5keSBZYW4gPGFuZHkueWFuQHJvY2stY2hpcHMuY29tPgo+PiBSZXZpZXdlZC1i
eTogRG1pdHJ5IEJhcnlzaGtvdiA8ZG1pdHJ5LmJhcnlzaGtvdkBvc3MucXVhbGNvbW0uY29tPgo+
PiAtLS0KPgo+VGhlIGdyYXBoIGN1cnJlbnRseSBsb29rcyBsaWtlIHRoaXM6Cj4KPlZPUCA8LT4g
RFAgY29udHJvbGxlciA8LT4gRFAgQ29ubmVjdG9yCj4KPklJVUlDIHRoaXMgZG9lcyBub3Qgd29y
ayBmb3IgVVNCLUMgYW5kIG5lZWRzIHRvIGxvb2sgbGlrZSB0aGlzLAo+YmVjYXVzZSB0aGUgVVNC
RFAgUEhZIGhhbmRsZXMgdGhlIGxhbmUgbXV4aW5nIGFuZCB0aHVzIG11c3QgYmUKPnRoZSB0aGlu
ZyBjb25uZWN0ZWQgdG8gdGhlIFVTQi1DIGNvbnRyb2xsZXIvY29ubmVjdG9yOgoKSSBwcmV2aW91
c2x5IHRlc3RzIFVTQi1DIEFsdG1vZGUgb24gTGludXggNS4xNSB1c2luZyBSb2NrIDViLCAgdGhp
cyBmdW5jdGlvbiB3b3JrcyB3ZWxsLiAKSG93ZXZlciwgd2hlbiB0aGUgc2FtZSBkdHMgY29uZmln
dXJhdGlvbiBpcyB1c2VkIG9uIExpbnV4IDYuMTYgYW5kIHRlc3RlZCB3aXRoIFJvY2sgNWIgaW4g
VVNCLUMgQWx0bW9kZSwgCnRoZSBIUEQgaW50ZXJydXB0IG9mIERQIGNhbm5vdCBiZSB0cmlnZ2Vy
ZWQuIEknbSBub3Qgc3VyZSB5ZXQgd2hhdCBjaGFuZ2VzIGhhdmUgb2NjdXJyZWQgYmV0d2VlbiB0
aGVtLgpNb3Jlb3ZlciwgSSBub3RpY2VkIHRoYXQgb24geW91ciB0ZXN0IGJyYW5jaFsxXSwgdGhl
IERUUyBjb25maWd1cmF0aW9uIGhhcyBhbHNvIGNoYW5nZWQgY29tcGFyZWQgdG8gYmVmb3JlLgpJ
IHdvdWxkIGdyZWF0bHkgYXBwcmVjaWF0ZSBpdCBpZiB5b3UgY291bGQgc2hhcmUgc29tZSBkZXRh
aWxzLgoKCgpbMF1odHRwczovL2dpdGh1Yi5jb20vYW5keXNocmsvbGludXgvY29tbWl0L2I5Zjg3
YTU2MmQ0MzFmYjU5YjY2NGI3YWVkNDE4NjlhOGYxODRkZTMKWzFdaHR0cHM6Ly9naXRsYWIuY29s
bGFib3JhLmNvbS9oYXJkd2FyZS1lbmFibGVtZW50L3JvY2tjaGlwLTM1ODgvbGludXgvLS9jb21t
aXQvMGU3ZTkwNDk0NDgyY2Y3N2Q1YmIwNThhNDc1ODNiNjc0N2IxNDBmNAo+Cj5WT1AgPC0+IERQ
IGNvbnRyb2xsZXIgPC0+IFVTQkRQIFBIWSA8LT4gVVNCLUMgQ29ubmVjdG9yCj4KPkkgd29uZGVy
IGlmIHRoZSBzaW1wbGUgY2FzZSBub3QgaW52b2x2aW5nIFVTQi1DIHNob3VsZCBhbHNvIGhhdmUK
PnRoZSBVU0JEUCBQSFkgZGVzY3JpYmVkIGluIHRoZSBncmFwaCBhcyBhIHRyYW5zcGFyZW50IGJy
aWRnZT8KPk5vdGUsIHRoYXQgdGhlIFVTQkRQIFBIWSBEVCBiaW5kaW5nIGlzIGN1cnJlbnRseSBu
b3QgcmVhZHkgZm9yCj50aGlzICh0aGlzIGFsc28gYWZmZWN0cyB0aGUgbmV4dCBwYXRjaCwgYnV0
IHNob3VsZCBiZSBlbm91Z2ggdG8KPmRpc2N1c3MgdGhpcyBvbmNlIDopKS4KPgo+R3JlZXRpbmdz
LAo+Cj4tLSBTZWJhc3RpYW4KPgo+PiAKPj4gKG5vIGNoYW5nZXMgc2luY2UgdjIpCj4+IAo+PiBD
aGFuZ2VzIGluIHYyOgo+PiAtIFNvcnQgaW4gYWxwaGFiZXRpY2FsIG9yZGVyCj4+IAo+PiAgLi4u
L2Jvb3QvZHRzL3JvY2tjaGlwL3JrMzU4OHMtY29vbHBpLTRiLmR0cyAgIHwgMzcgKysrKysrKysr
KysrKysrKysrKwo+PiAgMSBmaWxlIGNoYW5nZWQsIDM3IGluc2VydGlvbnMoKykKPj4gCj4+IGRp
ZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL3JvY2tjaGlwL3JrMzU4OHMtY29vbHBpLTRi
LmR0cyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvcm9ja2NoaXAvcmszNTg4cy1jb29scGktNGIuZHRz
Cj4+IGluZGV4IDhiNzE3YzQwMTdhNDYuLjUzOTNjNmNjNDkzYzMgMTAwNjQ0Cj4+IC0tLSBhL2Fy
Y2gvYXJtNjQvYm9vdC9kdHMvcm9ja2NoaXAvcmszNTg4cy1jb29scGktNGIuZHRzCj4+ICsrKyBi
L2FyY2gvYXJtNjQvYm9vdC9kdHMvcm9ja2NoaXAvcmszNTg4cy1jb29scGktNGIuZHRzCj4+IEBA
IC0zOSw2ICszOSwxOCBAQCBjaG9zZW4gewo+PiAgCQlzdGRvdXQtcGF0aCA9ICJzZXJpYWwyOjE1
MDAwMDBuOCI7Cj4+ICAJfTsKPj4gIAo+PiArCWRwLWNvbiB7Cj4+ICsJCWNvbXBhdGlibGUgPSAi
ZHAtY29ubmVjdG9yIjsKPj4gKwkJbGFiZWwgPSAiRFAgT1VUIjsKPj4gKwkJdHlwZSA9ICJtaW5p
IjsKPj4gKwo+PiArCQlwb3J0IHsKPj4gKwkJCWRwX2Nvbl9pbjogZW5kcG9pbnQgewo+PiArCQkJ
CXJlbW90ZS1lbmRwb2ludCA9IDwmZHAwX291dF9jb24+Owo+PiArCQkJfTsKPj4gKwkJfTsKPj4g
Kwl9Owo+PiArCj4+ICAJaGRtaS1jb24gewo+PiAgCQljb21wYXRpYmxlID0gImhkbWktY29ubmVj
dG9yIjsKPj4gIAkJdHlwZSA9ICJkIjsKPj4gQEAgLTIxNSw2ICsyMjcsMjQgQEAgJmNwdV9iMiB7
Cj4+ICAJY3B1LXN1cHBseSA9IDwmdmRkX2NwdV9iaWcxX3MwPjsKPj4gIH07Cj4+ICAKPj4gKyZk
cDAgewo+PiArCXN0YXR1cyA9ICJva2F5IjsKPj4gKwlwaW5jdHJsLTAgPSA8JmRwMG0wX3BpbnM+
Owo+PiArCXBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7Cj4+ICt9Owo+PiArCj4+ICsmZHAwX2lu
IHsKPj4gKwlkcDBfaW5fdnAyOiBlbmRwb2ludCB7Cj4+ICsJCXJlbW90ZS1lbmRwb2ludCA9IDwm
dnAyX291dF9kcDA+Owo+PiArCX07Cj4+ICt9Owo+PiArCj4+ICsmZHAwX291dCB7Cj4+ICsJZHAw
X291dF9jb246IGVuZHBvaW50IHsKPj4gKwkJcmVtb3RlLWVuZHBvaW50ID0gPCZkcF9jb25faW4+
Owo+PiArCX07Cj4+ICt9Owo+PiArCj4+ICAmZ3B1IHsKPj4gIAltYWxpLXN1cHBseSA9IDwmdmRk
X2dwdV9zMD47Cj4+ICAJc3RhdHVzID0gIm9rYXkiOwo+PiBAQCAtODg5LDMgKzkxOSwxMCBAQCB2
cDBfb3V0X2hkbWkwOiBlbmRwb2ludEBST0NLQ0hJUF9WT1AyX0VQX0hETUkwIHsKPj4gIAkJcmVt
b3RlLWVuZHBvaW50ID0gPCZoZG1pMF9pbl92cDA+Owo+PiAgCX07Cj4+ICB9Owo+PiArCj4+ICsm
dnAyIHsKPj4gKwl2cDJfb3V0X2RwMDogZW5kcG9pbnRAYSB7Cj4+ICsJCXJlZyA9IDxST0NLQ0hJ
UF9WT1AyX0VQX0RQMD47Cj4+ICsJCXJlbW90ZS1lbmRwb2ludCA9IDwmZHAwX2luX3ZwMj47Cj4+
ICsJfTsKPj4gK307Cj4+IC0tIAo+PiAyLjQzLjAKPj4gCg==
