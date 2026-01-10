Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8117D0CE6B
	for <lists+dri-devel@lfdr.de>; Sat, 10 Jan 2026 05:01:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EC1310E1AE;
	Sat, 10 Jan 2026 04:01:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="YuCFIpWb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 891FD10E1AE
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Jan 2026 04:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
 Message-ID; bh=uJw+3ZdwBbSa8teUYANcpQWcF0bmDMpDc83cDbgBKU4=; b=Y
 uCFIpWbq/DdRKb0D5uc1W81M2k1Jk8FbyeTUulR0E6Qb4wbxOOXfJu5snoR2V1qq
 jXFgWbKWrG7bjnWo0eB67lpw4rQW0smzixZm8mcLFEzg+muGrjNEZ0bco6FW6OQi
 vpgEB44lNyMDz9ncDepx24h9iCDP+cMTaflLqswS7M=
Received: from andyshrk$163.com ( [110.83.51.2] ) by
 ajax-webmail-wmsvr-40-122 (Coremail) ; Sat, 10 Jan 2026 12:00:46 +0800
 (CST)
X-Originating-IP: [110.83.51.2]
Date: Sat, 10 Jan 2026 12:00:46 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>
Cc: "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
 "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>,
 "David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 "Sandy Huang" <hjc@rock-chips.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 "Andy Yan" <andy.yan@rock-chips.com>,
 "Louis Chauvet" <louis.chauvet@bootlin.com>,
 "Haneen Mohammed" <hamohammed.sa@gmail.com>,
 "Melissa Wen" <melissa.srw@gmail.com>,
 "Robert Mader" <robert.mader@collabora.com>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Subject: Re:[PATCH v4 4/4] drm/rockchip: vop2: Support setting custom
 background color
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20251222(83accb85) Copyright (c) 2002-2026 www.mailtech.cn 163com
In-Reply-To: <20251219-rk3588-bgcolor-v4-4-2ff1127ea757@collabora.com>
References: <20251219-rk3588-bgcolor-v4-0-2ff1127ea757@collabora.com>
 <20251219-rk3588-bgcolor-v4-4-2ff1127ea757@collabora.com>
X-CM-CTRLMSGS: 5ZzECHBsdXM9MTc2ODAxNzY0NTQ4Ml85NjY2YTdlNmUzMTU5YjMzMDY5MjI0Y
 jUwNWFiOGQxMw==
X-NTES-SC: AL_Qu2dCvyauE4v4CKfZOkfmUgWjuw/WsG1v/Ul1YBSP556jDHp1iAZf2VtDGbH9sONKwKRoDS2SzJr1e5Bba1lUIstoztJ/FfiVZoVRBEe9pb7Eg==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <2750b73.10b0.19ba61052c8.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: eigvCgB3X+TuzmFp99NTAA--.28833W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbCxg6hAGlhzu5EOwAA3+
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

CgpIZWxsbyBDcmlzdGlhbiwKQXQgMjAyNS0xMi0yMCAwNTo0NzowMSwgIkNyaXN0aWFuIENpb2Nh
bHRlYSIgPGNyaXN0aWFuLmNpb2NhbHRlYUBjb2xsYWJvcmEuY29tPiB3cm90ZToKPlRoZSBSb2Nr
Y2hpcCBWT1AyIGRpc3BsYXkgY29udHJvbGxlciBhbGxvd3MgY29uZmlndXJpbmcgdGhlIGJhY2tn
cm91bmQKPmNvbG9yIG9mIGVhY2ggdmlkZW8gb3V0cHV0IHBvcnQuCj4KPlNpbmNlIGEgcHJldmlv
dXMgcGF0Y2ggaW50cm9kdWNlZCB0aGUgQkFDS0dST1VORF9DT0xPUiBDUlRDIHByb3BlcnR5LAo+
d2hpY2ggZGVmYXVsdHMgdG8gc29saWQgYmxhY2ssIG1ha2UgdXNlIG9mIGl0IHdoZW4gcHJvZ3Jh
bW1pbmcgdGhlCj5oYXJkd2FyZS4KPgo+Tm90ZSB0aGUgbWF4aW11bSBwcmVjaXNpb24gYWxsb3dl
ZCBieSB0aGUgZGlzcGxheSBjb250cm9sbGVyIGlzIDEwYnBjLAo+d2hpbGUgdGhlIGFscGhhIGNv
bXBvbmVudCBpcyBub3Qgc3VwcG9ydGVkLCBoZW5jZSBpZ25vcmVkLgo+Cj5TaWduZWQtb2ZmLWJ5
OiBDcmlzdGlhbiBDaW9jYWx0ZWEgPGNyaXN0aWFuLmNpb2NhbHRlYUBjb2xsYWJvcmEuY29tPgo+
LS0tCj4gZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL3JvY2tjaGlwX2RybV92b3AyLmMgfCAxMyAr
KysrKysrKysrKystCj4gZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL3JvY2tjaGlwX2RybV92b3Ay
LmggfCAgNCArKysrCj4gMiBmaWxlcyBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspLCAxIGRlbGV0
aW9uKC0pCj4KPmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvcm9ja2NoaXBf
ZHJtX3ZvcDIuYyBiL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9kcm1fdm9wMi5j
Cj5pbmRleCA0OThkZjBjZTQ2ODAuLjNhMjMyZDBkNGFjYiAxMDA2NDQKPi0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9kcm1fdm9wMi5jCj4rKysgYi9kcml2ZXJzL2dwdS9k
cm0vcm9ja2NoaXAvcm9ja2NoaXBfZHJtX3ZvcDIuYwo+QEAgLTE1NTQsNiArMTU1NCw3IEBAIHN0
YXRpYyB2b2lkIHZvcDJfcG9zdF9jb25maWcoc3RydWN0IGRybV9jcnRjICpjcnRjKQo+IAlzdHJ1
Y3Qgdm9wMl92aWRlb19wb3J0ICp2cCA9IHRvX3ZvcDJfdmlkZW9fcG9ydChjcnRjKTsKPiAJc3Ry
dWN0IHZvcDIgKnZvcDIgPSB2cC0+dm9wMjsKPiAJc3RydWN0IGRybV9kaXNwbGF5X21vZGUgKm1v
ZGUgPSAmY3J0Yy0+c3RhdGUtPmFkanVzdGVkX21vZGU7Cj4rCXU2NCBiZ2NvbG9yID0gY3J0Yy0+
c3RhdGUtPmJhY2tncm91bmRfY29sb3I7Cj4gCXUxNiB2dG90YWwgPSBtb2RlLT5jcnRjX3Z0b3Rh
bDsKPiAJdTE2IGhkaXNwbGF5ID0gbW9kZS0+Y3J0Y19oZGlzcGxheTsKPiAJdTE2IGhhY3Rfc3Qg
PSBtb2RlLT5jcnRjX2h0b3RhbCAtIG1vZGUtPmNydGNfaHN5bmNfc3RhcnQ7Cj5AQCAtMTU5OSw3
ICsxNjAwLDExIEBAIHN0YXRpYyB2b2lkIHZvcDJfcG9zdF9jb25maWcoc3RydWN0IGRybV9jcnRj
ICpjcnRjKQo+IAkJdm9wMl92cF93cml0ZSh2cCwgUkszNTY4X1ZQX1BPU1RfRFNQX1ZBQ1RfSU5G
T19GMSwgdmFsKTsKPiAJfQo+IAo+LQl2b3AyX3ZwX3dyaXRlKHZwLCBSSzM1NjhfVlBfRFNQX0JH
LCAwKTsKPisJLyogQmFja2dyb3VuZCBjb2xvciBpcyBwcm9ncmFtbWVkIHdpdGggMTAgYml0cyBv
ZiBwcmVjaXNpb24gKi8KPisJdmFsID0gRklFTERfUFJFUChSSzM1NjhfVlBfRFNQX0JHX19EU1Bf
QkdfUkVELCBEUk1fQVJHQjY0X0dFVFIoYmdjb2xvcikgPj4gNik7Cj4rCXZhbCB8PSBGSUVMRF9Q
UkVQKFJLMzU2OF9WUF9EU1BfQkdfX0RTUF9CR19HUkVFTiwgRFJNX0FSR0I2NF9HRVRHKGJnY29s
b3IpID4+IDYpOwoKPisJdmFsIHw9IEZJRUxEX1BSRVAoUkszNTY4X1ZQX0RTUF9CR19fRFNQX0JH
X0JMVUUsIERSTV9BUkdCNjRfR0VUQihiZ2NvbG9yKSA+PiA2KTsKCgogICAgICAgIHRoZSBiaXQz
MSBvZiAgUkszNTY4X1ZQX0RTUF9CRyAgaXMgYmdfZGlzcGxheV9lbu+8jCB0aGF0IG1lYW5zIHdo
ZW4gd2Ugc2V0IGEgCmJhY2tncm91bmQgY29sb3IsIHdlIHNob3VsZCBzZXQgdGhpcyBiZ19kaXNw
bGF5X2VuIGJpdC4KICAgICAgIFRoZSBkZWZhdWx0IHZhbHVlIG9mIHRoaXMgYml0IGlzIDEsIHdo
aWNoIGV4cGxhaW5zIHdoeSB0aGUgcGF0Y2ggY3VycmVudGx5IHdvcmtzIHByb3Blcmx5IGV2ZW4g
dGhvdWdoIGl0IGRvZXNuJ3Qgc2V0IGJpdDMxLgoKPisJdm9wMl92cF93cml0ZSh2cCwgUkszNTY4
X1ZQX0RTUF9CRywgdmFsKTsKPiB9Cj4gCj4gc3RhdGljIGludCB1c190b192ZXJ0aWNhbF9saW5l
KHN0cnVjdCBkcm1fZGlzcGxheV9tb2RlICptb2RlLCBpbnQgdXMpCj5AQCAtMTk4NCw2ICsxOTg5
LDEwIEBAIHN0YXRpYyBpbnQgdm9wMl9jcnRjX3N0YXRlX2R1bXAoc3RydWN0IGRybV9jcnRjICpj
cnRjLCBzdHJ1Y3Qgc2VxX2ZpbGUgKnMpCj4gCQkgICBkcm1fZ2V0X2J1c19mb3JtYXRfbmFtZSh2
Y3N0YXRlLT5idXNfZm9ybWF0KSk7Cj4gCXNlcV9wcmludGYocywgIlx0b3V0cHV0X21vZGVbJXhd
IiwgdmNzdGF0ZS0+b3V0cHV0X21vZGUpOwo+IAlzZXFfcHJpbnRmKHMsICIgY29sb3Jfc3BhY2Vb
JWRdXG4iLCB2Y3N0YXRlLT5jb2xvcl9zcGFjZSk7Cj4rCXNlcV9wcmludGYocywgIlx0YmFja2dy
b3VuZCBjb2xvciAoMTBicGMpOiByPTB4JXggZz0weCV4IGI9MHgleFxuIiwKPisJCSAgIERSTV9B
UkdCNjRfR0VUUihjc3RhdGUtPmJhY2tncm91bmRfY29sb3IpID4+IDYsCj4rCQkgICBEUk1fQVJH
QjY0X0dFVEcoY3N0YXRlLT5iYWNrZ3JvdW5kX2NvbG9yKSA+PiA2LAo+KwkJICAgRFJNX0FSR0I2
NF9HRVRCKGNzdGF0ZS0+YmFja2dyb3VuZF9jb2xvcikgPj4gNik7Cj4gCXNlcV9wcmludGYocywg
IiAgICBEaXNwbGF5IG1vZGU6ICVkeCVkJXMlZFxuIiwKPiAJCSAgIG1vZGUtPmhkaXNwbGF5LCBt
b2RlLT52ZGlzcGxheSwgaW50ZXJsYWNlZCA/ICJpIiA6ICJwIiwKPiAJCSAgIGRybV9tb2RlX3Zy
ZWZyZXNoKG1vZGUpKTsKPkBAIC0yNDczLDYgKzI0ODIsOCBAQCBzdGF0aWMgaW50IHZvcDJfY3Jl
YXRlX2NydGNzKHN0cnVjdCB2b3AyICp2b3AyKQo+IAkJCXJldHVybiBkZXZfZXJyX3Byb2JlKGRy
bS0+ZGV2LCByZXQsCj4gCQkJCQkgICAgICJjcnRjIGluaXQgZm9yIHZpZGVvX3BvcnQlZCBmYWls
ZWRcbiIsIGkpOwo+IAo+KwkJZHJtX2NydGNfYXR0YWNoX2JhY2tncm91bmRfY29sb3JfcHJvcGVy
dHkoJnZwLT5jcnRjKTsKPisKPiAJCWRybV9jcnRjX2hlbHBlcl9hZGQoJnZwLT5jcnRjLCAmdm9w
Ml9jcnRjX2hlbHBlcl9mdW5jcyk7Cj4gCQlpZiAodm9wMi0+bHV0X3JlZ3MpIHsKPiAJCQljb25z
dCBzdHJ1Y3Qgdm9wMl92aWRlb19wb3J0X2RhdGEgKnZwX2RhdGEgPSAmdm9wMl9kYXRhLT52cFt2
cC0+aWRdOwo+ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9k
cm1fdm9wMi5oIGIvZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL3JvY2tjaGlwX2RybV92b3AyLmgK
PmluZGV4IDkxMjQxOTE4OTliYS4uMzc3MjI2NTI4NDRhIDEwMDY0NAo+LS0tIGEvZHJpdmVycy9n
cHUvZHJtL3JvY2tjaGlwL3JvY2tjaGlwX2RybV92b3AyLmgKPisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9yb2NrY2hpcC9yb2NrY2hpcF9kcm1fdm9wMi5oCj5AQCAtNjU4LDYgKzY1OCwxMCBAQCBlbnVt
IGRzdF9mYWN0b3JfbW9kZSB7Cj4gI2RlZmluZSBSSzM1ODhfVlBfQ0xLX0NUUkxfX0RDTEtfT1VU
X0RJVgkJR0VOTUFTSygzLCAyKQo+ICNkZWZpbmUgUkszNTg4X1ZQX0NMS19DVFJMX19EQ0xLX0NP
UkVfRElWCQlHRU5NQVNLKDEsIDApCj4gCj4rI2RlZmluZSBSSzM1NjhfVlBfRFNQX0JHX19EU1Bf
QkdfUkVECQkJR0VOTUFTSygyOSwgMjApCj4rI2RlZmluZSBSSzM1NjhfVlBfRFNQX0JHX19EU1Bf
QkdfR1JFRU4JCQlHRU5NQVNLKDE5LCAxMCkKPisjZGVmaW5lIFJLMzU2OF9WUF9EU1BfQkdfX0RT
UF9CR19CTFVFCQkJR0VOTUFTSyg5LCAwKQo+Kwo+ICNkZWZpbmUgUkszNTY4X1ZQX1BPU1RfU0NM
X0NUUkxfX1ZTQ0FMRURPV04JCUJJVCgxKQo+ICNkZWZpbmUgUkszNTY4X1ZQX1BPU1RfU0NMX0NU
UkxfX0hTQ0FMRURPV04JCUJJVCgwKQo+IAo+Cj4tLSAKPjIuNTEuMgo=
