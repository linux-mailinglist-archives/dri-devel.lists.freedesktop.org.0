Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B614AF8B14
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 10:20:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9DDE10E2B0;
	Fri,  4 Jul 2025 08:20:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="g3kz60z3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0F0D310E2B0
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Jul 2025 08:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
 Message-ID; bh=mibiWF16hdn0bP5qO7tnSAg+k3n38sdVq+w+Ms8wFHY=; b=g
 3kz60z3AYDuGu9PCSO3ovTsSFZsx7LxoJhDEdAEQB7JO4VMWzGp0zDd3E49U+zbe
 X08CMairuKKEg26hx1rGIyGKoUol6qlAcwd9nsI9a0qz029u1yGd2fyT0RcyuePt
 zIAphFeNyGFbC4q7Kf3U8svfzq5icHNxXiTn33wuv4=
Received: from andyshrk$163.com ( [58.22.7.114] ) by
 ajax-webmail-wmsvr-40-143 (Coremail) ; Fri, 4 Jul 2025 16:19:30 +0800 (CST)
X-Originating-IP: [58.22.7.114]
Date: Fri, 4 Jul 2025 16:19:30 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: "Piotr Zalewski" <pZ010001011111@proton.me>
Cc: hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 "Diederik de Haas" <didi.debian@cknow.org>
Subject: Re:[PATCH] rockchip/drm: vop2: make vp registers nonvolatile
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2025 www.mailtech.cn 163com
In-Reply-To: <20250628180914.1177177-2-pZ010001011111@proton.me>
References: <20250628180914.1177177-2-pZ010001011111@proton.me>
X-NTES-SC: AL_Qu2eA/qauEks5iWbYOkfmkcVgOw9UcO5v/Qk3oZXOJF8jC/rxCoxfntMEmPnyfOOFCWcrheYUhhh58BWV4JgQoINVNPLzzTi97dc2ZFl3s1NsQ==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <9947ce4.7929.197d484ec6b.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: jygvCgD3V2KSjmdo0I0CAA--.22062W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbBEhSAXmhnjU0l2AABsr
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

SGVsbG8gUGlvdHIsCgpBdCAyMDI1LTA2LTI5IDAyOjExOjAwLCAiUGlvdHIgWmFsZXdza2kiIDxw
WjAxMDAwMTAxMTExMUBwcm90b24ubWU+IHdyb3RlOgo+TWFrZSB2aWRlbyBwb3J0IHJlZ2lzdGVy
cyBub252b2xhdGlsZS4gQXMgRFNQX0NUUkwgcmVnaXN0ZXIgaXMgd3JpdHRlbgo+dG8gdHdpY2Ug
ZHVlIHRvIGdhbW1hIExVVCBlbmFibGUgYml0IHdoaWNoIGlzIHNldCBvdXRzaWRlIG9mIHRoZSBt
YWluCj5EU1BfQ1RSTCBpbml0aWFsaXphdGlvbiB3aXRoaW4gYXRvbWljX2VuYWJsZSAoZm9yIHJr
MzU2eCBjYXNlIGl0IGlzIGFsc28KPm5lY2VzYXJyeSB0byBhbHdheXMgZGlzYWJsZSBnYW1tYSBM
VVQgYmVmb3JlIHdyaXRpbmcgYSBuZXcgTFVUKSB0aGVyZSBpcwo+YSBjaGFuY2UgdGhhdCBEU1Bf
Q1RSTCB2YWx1ZSByZWFkLW91dCBpbiBnYW1tYSBMVVQgaW5pdC91cGRhdGUgY29kZSBpcwo+bm90
IHRoZSBvbmUgd2hpY2ggd2FzIHdyaXR0ZW4gYnkgdGhlIHByZWNlZGluZyBEU1BfQ1RSTCBpbml0
aWFsaXphdGlvbgo+Y29kZSB3aXRoaW4gYXRvbWljX2VuYWJsZS4gVGhpcyBtaWdodCByZXN1bHQg
aW4gbWlzY29uZmlndXJlZCBEU1BfQ1RSTAo+d2hpY2ggbGVhZHMgdG8gbm8gdmlzdWFsIG91dHB1
dFsxXS4gU2luY2UgRFNQX0NUUkwgd3JpdGUgdGFrZXMgZWZmZWN0Cj5hZnRlciBWU1lOQ1sxXSB0
aGUgaXNzdWUgaXMgbm90IGFsd2F5cyBwcmVzZW50LiBXaGVuIHRlc3RlZCBvbiBQaW5ldGFiMgo+
d2l0aCBrZXJuZWwgNi4xNCBpdCBoYXBwZW5lcyBvbmx5IHdoZW4gRFJNIGlzIGNvbXBpbGVkIGFz
IGEgbW9kdWxlWzFdLgo+SW4gb3JkZXIgdG8gY29uZmlybSB0aGF0IGl0IGlzIGJlY2F1c2Ugb2Yg
dGltaW5nIEkgaW5zZXJ0ZWQgMThtcyB1ZGVsYXkKPmJlZm9yZSB2b3AyX2NydGNfYXRvbWljX3Ry
eV9zZXRfZ2FtbWEgaW4gYXRvbWljIGVuYWJsZSBhbmQgY29tcGlsZWQgRFJNCj5hcyBtb2R1bGUg
LSB0aGlzIGhhcyBhbHNvIGZpeGVkIHRoZSBpc3N1ZSBvbiBQaW5ldGFiMi4KPgo+WzFdIGh0dHBz
Oi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJvY2tjaGlwLzU2MmIzOGU1LmE0OTYuMTk3NWYwOWY5
ODMuQ29yZW1haWwuYW5keXNocmtAMTYzLmNvbS8KPgo+UmVwb3J0ZWQtYnk6IERpZWRlcmlrIGRl
IEhhYXMgPGRpZGkuZGViaWFuQGNrbm93Lm9yZz4KPkNsb3NlczogaHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcvbGludXgtcm9ja2NoaXAvREFFVkRTVE1XSTFFLko0NTRWWk4wUjlNQUBja25vdy5vcmcv
Cj5TdWdnZXN0ZWQtYnk6IEFuZHkgWWFuIDxhbmR5LnlhbkByb2NrLWNoaXBzLmNvbT4KPlNpZ25l
ZC1vZmYtYnk6IFBpb3RyIFphbGV3c2tpIDxwWjAxMDAwMTAxMTExMUBwcm90b24ubWU+Cj4tLS0K
PiBkcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvcm9ja2NoaXBfZHJtX3ZvcDIuYyB8IDkgKysrKyst
LS0tCj4gMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPgo+
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9kcm1fdm9wMi5j
IGIvZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL3JvY2tjaGlwX2RybV92b3AyLmMKPmluZGV4IGQw
ZjVmZWExNWUyMS4uMjQxMDYwY2MyNGNiIDEwMDY0NAo+LS0tIGEvZHJpdmVycy9ncHUvZHJtL3Jv
Y2tjaGlwL3JvY2tjaGlwX2RybV92b3AyLmMKPisrKyBiL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hp
cC9yb2NrY2hpcF9kcm1fdm9wMi5jCj5AQCAtMjU4OSwxMiArMjU4OSwxMyBAQCBzdGF0aWMgaW50
IHZvcDJfd2luX2luaXQoc3RydWN0IHZvcDIgKnZvcDIpCj4gfQo+IAo+IC8qCj4tICogVGhlIHdp
bmRvdyByZWdpc3RlcnMgYXJlIG9ubHkgdXBkYXRlZCB3aGVuIGNvbmZpZyBkb25lIGlzIHdyaXR0
ZW4uCj4tICogVW50aWwgdGhhdCB0aGV5IHJlYWQgYmFjayB0aGUgb2xkIHZhbHVlLiBBcyB3ZSBy
ZWFkLW1vZGlmeS13cml0ZQo+LSAqIHRoZXNlIHJlZ2lzdGVycyBtYXJrIHRoZW0gYXMgbm9uLXZv
bGF0aWxlLiBUaGlzIG1ha2VzIHN1cmUgd2UgcmVhZAo+LSAqIHRoZSBuZXcgdmFsdWVzIGZyb20g
dGhlIHJlZ21hcCByZWdpc3RlciBjYWNoZS4KPisgKiBUaGUgd2luZG93IGFuZCB2aWRlbyBwb3J0
IHJlZ2lzdGVycyBhcmUgb25seSB1cGRhdGVkIHdoZW4gY29uZmlnCj4rICogZG9uZSBpcyB3cml0
dGVuLiBVbnRpbCB0aGF0IHRoZXkgcmVhZCBiYWNrIHRoZSBvbGQgdmFsdWUuIEFzIHdlCj4rICog
cmVhZC1tb2RpZnktd3JpdGUgdGhlc2UgcmVnaXN0ZXJzIG1hcmsgdGhlbSBhcyBub24tdm9sYXRp
bGUuIFRoaXMKPisgKiBtYWtlcyBzdXJlIHdlIHJlYWQgdGhlIG5ldyB2YWx1ZXMgZnJvbSB0aGUg
cmVnbWFwIHJlZ2lzdGVyIGNhY2hlLgo+ICAqLwo+IHN0YXRpYyBjb25zdCBzdHJ1Y3QgcmVnbWFw
X3JhbmdlIHZvcDJfbm9udm9sYXRpbGVfcmFuZ2VbXSA9IHsKPisJcmVnbWFwX3JlZ19yYW5nZShS
SzM1NjhfVlAwX0NUUkxfQkFTRSwgUkszNTg4X1ZQM19DVFJMX0JBU0UrMjU1KSwKClNtYWxsIG5p
dDogdGhlcmUgc2hvdWxkIGJlIHNwYWNlcyBiZWZvcmUgYW5kIGFmdGVyIHRoZSAgKyAKCj4gCXJl
Z21hcF9yZWdfcmFuZ2UoMHgxMDAwLCAweDIzZmYpLAo+IH07Cj4gCj4tLSAKPjIuNTAuMAo+Cj4K

