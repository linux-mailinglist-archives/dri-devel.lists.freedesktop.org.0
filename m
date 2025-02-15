Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F9ACA36C73
	for <lists+dri-devel@lfdr.de>; Sat, 15 Feb 2025 08:35:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9577891D1;
	Sat, 15 Feb 2025 07:35:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="YG5i1RGl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
 by gabe.freedesktop.org (Postfix) with ESMTP id 081FA891D1
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Feb 2025 07:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
 Message-ID; bh=1EL9bFgToVEuBS6aPe0qceOXgXPkbk9N2MGTIJk/rp0=; b=Y
 G5i1RGlF0yT2MC1JsIaESD5w0SrbSLiQFYc6VR1TkOYBgxezgzEKdo01jUbZsTIt
 rFvOyiKL9BdAK8kLpCr5rkOt4sLj1Y+FbiJ+ZAakrQ3aGiKbigXa4qAFtuqT+sMZ
 pz8OfHGFndM7ghj+qIwpGGP6rTLmSJurgzwLsm5QE8=
Received: from andyshrk$163.com ( [58.22.7.114] ) by
 ajax-webmail-wmsvr-40-141 (Coremail) ; Sat, 15 Feb 2025 15:34:31 +0800
 (CST)
X-Originating-IP: [58.22.7.114]
Date: Sat, 15 Feb 2025 15:34:31 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: hjc@rock-chips.com, krzk+dt@kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, derek.foreman@collabora.com,
 detlev.casanova@collabora.com, daniel@fooishbar.org, robh@kernel.org,
 sebastian.reichel@collabora.com, "Andy Yan" <andy.yan@rock-chips.com>
Subject: Re:Re: [PATCH v14 04/13] drm/rockchip: vop2: Merge
 vop2_cluster/esmart_init function
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2025 www.mailtech.cn 163com
In-Reply-To: <8686639.gsGJI6kyIV@diego>
References: <20250212093530.52961-1-andyshrk@163.com>
 <20250212093530.52961-5-andyshrk@163.com> <8686639.gsGJI6kyIV@diego>
X-NTES-SC: AL_Qu2YC/qbu0As5yKeZukfmkcVgOw9UcO5v/Qk3oZXOJF8jCrr9gYOYUFMLFHZ4OeODhqPrheYUAFq0M9dZ69DWLMb8aThq5gl6h0v6I3OmQHGpg==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <44c247c5.1dcc.1950887c866.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: jSgvCgCX3+aHQ7BnKltpAA--.20851W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiqBv0XmewMliNfQABsV
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

CgpIaSBIZWlrbywKCkF0IDIwMjUtMDItMTUgMDY6MjQ6MTcsICJIZWlrbyBTdMO8Ym5lciIgPGhl
aWtvQHNudGVjaC5kZT4gd3JvdGU6Cj5BbSBNaXR0d29jaCwgMTIuIEZlYnJ1YXIgMjAyNSwgMTA6
MzQ6NTkgTUVaIHNjaHJpZWIgQW5keSBZYW46Cj4+IEZyb206IEFuZHkgWWFuIDxhbmR5LnlhbkBy
b2NrLWNoaXBzLmNvbT4KPj4gCj4+IE5vdyB0aGVzZSB0d28gZnVuY3Rpb24gc2hhcmUgdGhlIHNh
bWUgbG9naWMsIHRoZSBjYW4KPj4gYmUgbWVyZ2VkIGFzIG9uZS4KPj4gCj4+IFNpZ25lZC1vZmYt
Ynk6IEFuZHkgWWFuIDxhbmR5LnlhbkByb2NrLWNoaXBzLmNvbT4KPj4gLS0tCj4+IAo+PiAobm8g
Y2hhbmdlcyBzaW5jZSB2MSkKPj4gCj4+ICBkcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvcm9ja2No
aXBfZHJtX3ZvcDIuYyB8IDQyICsrKysrLS0tLS0tLS0tLS0tLS0tCj4+ICAxIGZpbGUgY2hhbmdl
ZCwgMTEgaW5zZXJ0aW9ucygrKSwgMzEgZGVsZXRpb25zKC0pCj4+IAo+PiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL3JvY2tjaGlwX2RybV92b3AyLmMgYi9kcml2ZXJzL2dw
dS9kcm0vcm9ja2NoaXAvcm9ja2NoaXBfZHJtX3ZvcDIuYwo+PiBpbmRleCBhMGQ5NjFjYjVkMjEu
Ljg0NGRmNDAwMTE1OSAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL3Jv
Y2tjaGlwX2RybV92b3AyLmMKPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL3JvY2tj
aGlwX2RybV92b3AyLmMKPj4gQEAgLTI0MjQsMTggKzI0MjQsMTggQEAgc3RhdGljIGludCB2b3Ay
X2ZpbmRfcmdiX2VuY29kZXIoc3RydWN0IHZvcDIgKnZvcDIpCj4+ICAJcmV0dXJuIC1FTk9FTlQ7
Cj4+ICB9Cj4+ICAKPj4gLXN0YXRpYyBpbnQgdm9wMl9jbHVzdGVyX2luaXQoc3RydWN0IHZvcDJf
d2luICp3aW4pCj4+ICtzdGF0aWMgaW50IHZvcDJfcmVnbWFwX2luaXQoc3RydWN0IHZvcDJfd2lu
ICp3aW4sIGNvbnN0IHN0cnVjdCByZWdfZmllbGQgKnJlZ3MsCj4+ICsJCQkgICAgaW50IG5yX3Jl
Z3MpCj4+ICB7Cj4+ICAJc3RydWN0IHZvcDIgKnZvcDIgPSB3aW4tPnZvcDI7Cj4+ICAJaW50IGk7
Cj4+ICAKPj4gLQlmb3IgKGkgPSAwOyBpIDwgdm9wMi0+ZGF0YS0+bnJfY2x1c3Rlcl9yZWdzOyBp
KyspIHsKPj4gKwlmb3IgKGkgPSAwOyBpIDwgbnJfcmVnczsgaSsrKSB7Cj4+ICAJCWNvbnN0IHN0
cnVjdCByZWdfZmllbGQgZmllbGQgPSB7Cj4+IC0JCQkucmVnID0gKHZvcDItPmRhdGEtPmNsdXN0
ZXJfcmVnW2ldLnJlZyAhPSAweGZmZmZmZmZmKSA/Cj4+IC0JCQkJdm9wMi0+ZGF0YS0+Y2x1c3Rl
cl9yZWdbaV0ucmVnICsgd2luLT5vZmZzZXQgOgo+PiAtCQkJCXZvcDItPmRhdGEtPmNsdXN0ZXJf
cmVnW2ldLnJlZywKPj4gLQkJCS5sc2IgPSB2b3AyLT5kYXRhLT5jbHVzdGVyX3JlZ1tpXS5sc2Is
Cj4+IC0JCQkubXNiID0gdm9wMi0+ZGF0YS0+Y2x1c3Rlcl9yZWdbaV0ubXNiCj4+ICsJCQkucmVn
ID0gKHJlZ3NbaV0ucmVnICE9IDB4ZmZmZmZmZmYpID8KPj4gKwkJCQlyZWdzW2ldLnJlZyArIHdp
bi0+b2Zmc2V0IDogcmVnc1tpXS5yZWcsCj4+ICsJCQkubHNiID0gcmVnc1tpXS5sc2IsCj4+ICsJ
CQkubXNiID0gcmVnc1tpXS5tc2IKPj4gIAkJfTsKPj4gIAo+PiAgCQl3aW4tPnJlZ1tpXSA9IGRl
dm1fcmVnbWFwX2ZpZWxkX2FsbG9jKHZvcDItPmRldiwgdm9wMi0+bWFwLCBmaWVsZCk7Cj4+IEBA
IC0yNDQ2LDI4ICsyNDQ2LDYgQEAgc3RhdGljIGludCB2b3AyX2NsdXN0ZXJfaW5pdChzdHJ1Y3Qg
dm9wMl93aW4gKndpbikKPj4gIAlyZXR1cm4gMDsKPj4gIH07Cj4+ICAKPj4gLXN0YXRpYyBpbnQg
dm9wMl9lc21hcnRfaW5pdChzdHJ1Y3Qgdm9wMl93aW4gKndpbikKPj4gLXsKPj4gLQlzdHJ1Y3Qg
dm9wMiAqdm9wMiA9IHdpbi0+dm9wMjsKPj4gLQlpbnQgaTsKPj4gLQo+PiAtCWZvciAoaSA9IDA7
IGkgPCB2b3AyLT5kYXRhLT5ucl9zbWFydF9yZWdzOyBpKyspIHsKPj4gLQkJY29uc3Qgc3RydWN0
IHJlZ19maWVsZCBmaWVsZCA9IHsKPj4gLQkJCS5yZWcgPSAodm9wMi0+ZGF0YS0+c21hcnRfcmVn
W2ldLnJlZyAhPSAweGZmZmZmZmZmKSA/Cj4+IC0JCQkJdm9wMi0+ZGF0YS0+c21hcnRfcmVnW2ld
LnJlZyArIHdpbi0+b2Zmc2V0IDoKPj4gLQkJCQl2b3AyLT5kYXRhLT5zbWFydF9yZWdbaV0ucmVn
LAo+PiAtCQkJLmxzYiA9IHZvcDItPmRhdGEtPnNtYXJ0X3JlZ1tpXS5sc2IsCj4+IC0JCQkubXNi
ID0gdm9wMi0+ZGF0YS0+c21hcnRfcmVnW2ldLm1zYgo+PiAtCQl9Owo+PiAtCj4+IC0JCXdpbi0+
cmVnW2ldID0gZGV2bV9yZWdtYXBfZmllbGRfYWxsb2Modm9wMi0+ZGV2LCB2b3AyLT5tYXAsIGZp
ZWxkKTsKPj4gLQkJaWYgKElTX0VSUih3aW4tPnJlZ1tpXSkpCj4+IC0JCQlyZXR1cm4gUFRSX0VS
Uih3aW4tPnJlZ1tpXSk7Cj4+IC0JfQo+PiAtCj4+IC0JcmV0dXJuIDA7Cj4+IC19Cj4+IC0KPj4g
IHN0YXRpYyBpbnQgdm9wMl93aW5faW5pdChzdHJ1Y3Qgdm9wMiAqdm9wMikKPj4gIHsKPj4gIAlj
b25zdCBzdHJ1Y3Qgdm9wMl9kYXRhICp2b3AyX2RhdGEgPSB2b3AyLT5kYXRhOwo+PiBAQCAtMjQ4
NCw5ICsyNDYyLDExIEBAIHN0YXRpYyBpbnQgdm9wMl93aW5faW5pdChzdHJ1Y3Qgdm9wMiAqdm9w
MikKPj4gIAkJd2luLT53aW5faWQgPSBpOwo+PiAgCQl3aW4tPnZvcDIgPSB2b3AyOwo+PiAgCQlp
ZiAodm9wMl9jbHVzdGVyX3dpbmRvdyh3aW4pKQo+PiAtCQkJcmV0ID0gdm9wMl9jbHVzdGVyX2lu
aXQod2luKTsKPj4gKwkJCXJldCA9IHZvcDJfcmVnbWFwX2luaXQod2luLCB2b3AyLT5kYXRhLT5j
bHVzdGVyX3JlZywKPj4gKwkJCQkJICAgICAgIHZvcDItPmRhdGEtPm5yX2NsdXN0ZXJfcmVncyk7
Cj4+ICAJCWVsc2UKPj4gLQkJCXJldCA9IHZvcDJfZXNtYXJ0X2luaXQod2luKTsKPj4gKwkJCXJl
dCA9IHZvcDJfcmVnbWFwX2luaXQod2luLCB2b3AyLT5kYXRhLT5zbWFydF9yZWcsCj4+ICsJCQkJ
CSAgICAgICB2b3AyLT5kYXRhLT5ucl9jbHVzdGVyX3JlZ3MpOwo+Cj4JCQkJCQleXiBucl9zbWFy
dF9yZWdzCj5JIHRoaW5rCgpZZXMsIHRoYW5rcyBmb3IgY2F0Y2hpbmcgaXQsICB3aWxsIGJlIGZp
eGVkIGluIFYxNS4KCj4KPgo+Cj4K
