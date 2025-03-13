Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34C9BA5E900
	for <lists+dri-devel@lfdr.de>; Thu, 13 Mar 2025 01:33:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 793C110E176;
	Thu, 13 Mar 2025 00:33:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="O0WDE/Mk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7876010E176
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Mar 2025 00:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
 Message-ID; bh=AB2GUHSL2k8vU974ZJtogILKP8rhMHvKGHGeZ+pVxWQ=; b=O
 0WDE/MkX+VL2kULTxRHxI8f5O4zX5KcccF9Pc75nJE9dAr7HoUTj3oFSdOD0ipfV
 4mdv68a85oNF7bxNT+HMz5mO+Lu3lOrxPRloYrptfdCaX8JY9J90WwXlAi+rj5eI
 Sof4FTDtSOcod0qqa92c9KE1osByLNkUtqztGxcNi8=
Received: from andyshrk$163.com ( [58.22.7.114] ) by
 ajax-webmail-wmsvr-40-123 (Coremail) ; Thu, 13 Mar 2025 08:32:55 +0800
 (CST)
X-Originating-IP: [58.22.7.114]
Date: Thu, 13 Mar 2025 08:32:55 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: "Dmitry Baryshkov" <lumag@kernel.org>
Cc: heiko@sntech.de, hjc@rock-chips.com, mripard@kernel.org,
 cristian.ciocaltea@collabora.com, neil.armstrong@linaro.org,
 yubing.zhang@rock-chips.com, krzk+dt@kernel.org,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, robh@kernel.org,
 sebastian.reichel@collabora.com, "Andy Yan" <andy.yan@rock-chips.com>,
 "stephen@radxa.com" <stephen@radxa.com>
Subject: Re:Re: [PATCH v2 7/7] arm64: dts: rockchip: Enable DP2HDMI for ROCK
 5 ITX
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2025 www.mailtech.cn 163com
In-Reply-To: <q3y36jgswj4xa2g3hnptc6kgzphbqfg675r5paa2lwvdseytio@jysj4f2i6osu>
References: <20250312104214.525242-1-andyshrk@163.com>
 <20250312104214.525242-8-andyshrk@163.com>
 <q3y36jgswj4xa2g3hnptc6kgzphbqfg675r5paa2lwvdseytio@jysj4f2i6osu>
X-NTES-SC: AL_Qu2fA/SZukEs4yKdYOlSyjNW+7xfHKv6+qRChMQvQtsqqTHr9T0KcVtuP1XR3//r4kRAiu7dpbs5Jch8KvJm
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <5858d492.44b.1958ceb23dd.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: eygvCgD3H4e3J9JnFCt9AA--.21925W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbBkAMPXmfSI2pHYgACsZ
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

CkhpIERtaXRyeSwKCkF0IDIwMjUtMDMtMTIgMjA6Mzk6MTcsICJEbWl0cnkgQmFyeXNoa292IiA8
bHVtYWdAa2VybmVsLm9yZz4gd3JvdGU6Cj5PbiBXZWQsIE1hciAxMiwgMjAyNSBhdCAwNjo0Mjow
OFBNICswODAwLCBBbmR5IFlhbiB3cm90ZToKPj4gRnJvbTogQW5keSBZYW4gPGFuZHkueWFuQHJv
Y2stY2hpcHMuY29tPgo+PiAKPj4gVGhlIEhETUkgUG9ydCBuZXh0IHRvIEhlYWRwaG9uZSBKYWNr
IGlzIGRyaXZlZCBieQo+PiBEUDEgb24gcmszNTg4IHZpYSBhIGRwMmhkbWkgY29udmVydGVyLgo+
PiAKPj4gQWRkIHJlbGF0ZWQgZHQgbm9kZXMgdG8gZW5hYmxlIGl0Lgo+PiAKPj4gTm90ZTogUk9D
S0NISVBfVk9QMl9FUF9EUDEgaXMgZGVmaW5lZCBhcyAxMSBpbiBkdC1iaW5kaW5nIGhlYWRlciwK
Pj4gYnV0IGl0IHdpbGwgdHJpZ2dlciBhIGR0YyB3YXJuaW5nIGxpa2UgImdyYXBoIG5vZGUgdW5p
dCBhZGRyZXNzCj4+IGVycm9yLCBleHBlY3RlZCAiYiIiIGlmIHdlIHVzZSBpdCBkaXJlY3RseSBh
ZnRlciBlbmRwb2ludCwgc28gd2UKPj4gdXNlICJiIiBpbnN0ZWFkIGhlcmUuCj4+IAo+PiBTaWdu
ZWQtb2ZmLWJ5OiBBbmR5IFlhbiA8YW5keS55YW5Acm9jay1jaGlwcy5jb20+Cj4+IC0tLQo+PiAK
Pj4gKG5vIGNoYW5nZXMgc2luY2UgdjEpCj4+IAo+PiAgLi4uL2Jvb3QvZHRzL3JvY2tjaGlwL3Jr
MzU4OC1yb2NrLTUtaXR4LmR0cyAgIHwgMzcgKysrKysrKysrKysrKysrKysrKwo+PiAgMSBmaWxl
IGNoYW5nZWQsIDM3IGluc2VydGlvbnMoKykKPj4gCj4+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0
L2Jvb3QvZHRzL3JvY2tjaGlwL3JrMzU4OC1yb2NrLTUtaXR4LmR0cyBiL2FyY2gvYXJtNjQvYm9v
dC9kdHMvcm9ja2NoaXAvcmszNTg4LXJvY2stNS1pdHguZHRzCj4+IGluZGV4IDY3Yjg4NjMyOTI0
OC4uMjlmMTBlYzlmMGMxIDEwMDY0NAo+PiAtLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL3JvY2tj
aGlwL3JrMzU4OC1yb2NrLTUtaXR4LmR0cwo+PiArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL3Jv
Y2tjaGlwL3JrMzU4OC1yb2NrLTUtaXR4LmR0cwo+PiBAQCAtNTcsNiArNTcsMTggQEAgYW5hbG9n
LXNvdW5kIHsKPj4gIAkJCSAgIkhlYWRwaG9uZSIsICJIZWFkcGhvbmVzIjsKPj4gIAl9Owo+PiAg
Cj4+ICsJZHAtY29uIHsKPj4gKwkJY29tcGF0aWJsZSA9ICJkcC1jb25uZWN0b3IiOwo+Cj5Zb3Un
dmUgd3JpdHRlbiB0aGF0IGl0IGlzIGFuIEhETUkgY29ubmVjdG9yLiBDb3VsZCB5b3UgcG9zc2li
bHkgY2xhcmlmeSwKPndoeSBpcyBpdCBiZWluZyByZWdpc3RlcmVkIGFzIGEgRFAgY29ubmVjdG9y
PyBJcyB0aGVyZSBhbnkga2luZCBvZgo+YSBicmlkZ2UgYmV0d2VlbiB0aGUgRFAgY29udHJvbGxl
ciBhbmQgdGhlIEhETUkgY29ubmVjdG9yPwoKV2hlbiBJIHdhcyBwcmVwYXJpbmcgdGhpcyBwYXRj
aCBhdCB0aGF0IHRpbWUsIEkgYWxzbyBoYWQgc29tZSBkb3VidHMuIApXaGV0aGVyIGl0IHNob3Vs
ZCBiZSByZWdpc3RlcmVkIGFzIGEgRFAgY29ubmVjdG9yIG9yIGFuIEhETUkgY29ubmVjdG9yLiAK
VGhlcmUgaXMgYSBEUDJIRE1JIGNvbnZlcnNpb24gY2hpcCBiZXR3ZWVuIHRoZSBEUCBvZiBSSzM1
ODggYW5kIHRoaXMgaGRtaSAKaW50ZXJmYWNlLCBidXQgdGhpcyBjb252ZXJzaW9uIGNoaXAgZG9l
cyBub3QgcmVxdWlyZSBhIHNvZnR3YXJlIGRyaXZlci4gCklmIHRoZSBjdXJyZW50IHdyaXRpbmcg
aXMgaW5jb3JyZWN0LCBJIHdpbGwgY2hhbmdlIGl0IHRvIGhkbWktY29ubmVjdG9yIGluIHRoZSBu
ZXh0IHZlcnNpb24uCgpUaGFua3MKPgo+PiArCQlsYWJlbCA9ICJEUCBPVVQiOwo+PiArCQl0eXBl
ID0gImZ1bGwtc2l6ZSI7Cj4+ICsKPj4gKwkJcG9ydCB7Cj4+ICsJCQlkcF9jb25faW46IGVuZHBv
aW50IHsKPj4gKwkJCQlyZW1vdGUtZW5kcG9pbnQgPSA8JmRwMV9vdXRfY29uPjsKPj4gKwkJCX07
Cj4+ICsJCX07Cj4+ICsJfTsKPj4gKwo+PiAgCWdwaW8tbGVkcyB7Cj4+ICAJCWNvbXBhdGlibGUg
PSAiZ3Bpby1sZWRzIjsKPj4gIAkJcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IjsKPj4gQEAgLTI2
OCw2ICsyODAsMjQgQEAgJmNwdV9sMyB7Cj4+ICAJY3B1LXN1cHBseSA9IDwmdmRkX2NwdV9saXRf
czA+Owo+PiAgfTsKPj4gIAo+PiArJmRwMSB7Cj4+ICsJc3RhdHVzID0gIm9rYXkiOwo+PiArCXBp
bmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7Cj4+ICsJcGluY3RybC0wID0gPCZkcDFtMF9waW5zPjsK
Pj4gK307Cj4+ICsKPj4gKyZkcDFfaW4gewo+PiArCWRwMV9pbl92cDI6IGVuZHBvaW50IHsKPj4g
KwkJcmVtb3RlLWVuZHBvaW50ID0gPCZ2cDJfb3V0X2RwMT47Cj4+ICsJfTsKPj4gK307Cj4+ICsK
Pj4gKyZkcDFfb3V0IHsKPj4gKwlkcDFfb3V0X2NvbjogZW5kcG9pbnQgewo+PiArCQlyZW1vdGUt
ZW5kcG9pbnQgPSA8JmRwX2Nvbl9pbj47Cj4+ICsJfTsKPj4gK307Cj4+ICsKPj4gICZncHUgewo+
PiAgCW1hbGktc3VwcGx5ID0gPCZ2ZGRfZ3B1X3MwPjsKPj4gIAlzdGF0dXMgPSAib2theSI7Cj4+
IEBAIC0xMjYyLDMgKzEyOTIsMTAgQEAgdnAxX291dF9oZG1pMTogZW5kcG9pbnRAUk9DS0NISVBf
Vk9QMl9FUF9IRE1JMSB7Cj4+ICAJCXJlbW90ZS1lbmRwb2ludCA9IDwmaGRtaTFfaW5fdnAxPjsK
Pj4gIAl9Owo+PiAgfTsKPj4gKwo+PiArJnZwMiB7Cj4+ICsJdnAyX291dF9kcDE6IGVuZHBvaW50
QGIgewo+PiArCQlyZWcgPSA8Uk9DS0NISVBfVk9QMl9FUF9EUDE+Owo+PiArCQlyZW1vdGUtZW5k
cG9pbnQgPSA8JmRwMV9pbl92cDI+Owo+PiArCX07Cj4+ICt9Owo+PiAtLSAKPj4gMi4zNC4xCj4+
IAo+Cj4tLSAKPldpdGggYmVzdCB3aXNoZXMKPkRtaXRyeQo=
