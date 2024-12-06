Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 583EC9E6DD0
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2024 13:09:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67CC610E3F7;
	Fri,  6 Dec 2024 12:09:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="hg1ELVI/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
 by gabe.freedesktop.org (Postfix) with ESMTP id B2CFF10E3F7
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2024 12:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
 Message-ID; bh=n4hW/V/Xu2dnjj6AYJ4WjJceT096qx6cfGkMAL+BDWw=; b=h
 g1ELVI/I4z/oSYqyoWt4/Rca5z33HAmc9Rb1shux5Yco08X9sw16uhdQKUvbaLqJ
 H2nL1hi88EublB7N7C0MKLBzGFPJb3+6zsnyuJQH5K4zple2nEyCaCzlKGlmlajc
 qtknFjry0sJ/KJMuGlVEtTkEu/IdPwBe0lqJSyfrA0=
Received: from andyshrk$163.com ( [58.22.7.114] ) by
 ajax-webmail-wmsvr-40-118 (Coremail) ; Fri, 6 Dec 2024 20:08:47 +0800 (CST)
X-Originating-IP: [58.22.7.114]
Date: Fri, 6 Dec 2024 20:08:47 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: "Guoqing Jiang" <guoqing.jiang@canonical.com>
Cc: hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org
Subject: Re:[PATCH] drm/rockchip: Remove unnecessary checking
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2024 www.mailtech.cn 163com
In-Reply-To: <20241206114233.1270989-1-guoqing.jiang@canonical.com>
References: <20241206114233.1270989-1-guoqing.jiang@canonical.com>
X-NTES-SC: AL_Qu2YAfiTuUEp4SSeY+lS8zNM9K56MKvt5LljqcQFePgqqTHL3g4cZnlBM0vW6uJQJuqD7OHbXn3B2mnPVyPr
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <6db9676.aa57.1939bdf5e6e.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: digvCgDXfwdP6VJnmyI5AA--.11968W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbB0hetXmdS4Imk1gABsZ
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

SGkgR3VvcWluZywKCkF0IDIwMjQtMTItMDYgMTk6NDI6MzMsICJHdW9xaW5nIEppYW5nIiA8Z3Vv
cWluZy5qaWFuZ0BjYW5vbmljYWwuY29tPiB3cm90ZToKPkl0IGlzIG5vdCBuZWVkZWQgc2luY2Ug
ZHJtX2F0b21pY19oZWxwZXJfc2h1dGRvd24gY2hlY2tzIGl0Lgo+Cj5TaWduZWQtb2ZmLWJ5OiBH
dW9xaW5nIEppYW5nIDxndW9xaW5nLmppYW5nQGNhbm9uaWNhbC5jb20+CgogICBBY2tlZC1ieTog
QW5keSBZYW48YW5keXNocmtAMTYzLmNvbT4KClRoYW5rcwoKPi0tLQo+IGRyaXZlcnMvZ3B1L2Ry
bS9yb2NrY2hpcC9yb2NrY2hpcF9kcm1fZHJ2LmMgfCAzICstLQo+IDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKSwgMiBkZWxldGlvbnMoLSkKPgo+ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9kcm1fZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vcm9ja2No
aXAvcm9ja2NoaXBfZHJtX2Rydi5jCj5pbmRleCA1ODUzNTVkZTY5NmIuLjY0ZjVmNTQ3ZmI3YSAx
MDA2NDQKPi0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9kcm1fZHJ2LmMK
PisrKyBiL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9kcm1fZHJ2LmMKPkBAIC00
ODgsOCArNDg4LDcgQEAgc3RhdGljIHZvaWQgcm9ja2NoaXBfZHJtX3BsYXRmb3JtX3NodXRkb3du
KHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gewo+IAlzdHJ1Y3QgZHJtX2RldmljZSAq
ZHJtID0gcGxhdGZvcm1fZ2V0X2RydmRhdGEocGRldik7Cj4gCj4tCWlmIChkcm0pCj4tCQlkcm1f
YXRvbWljX2hlbHBlcl9zaHV0ZG93bihkcm0pOwo+Kwlkcm1fYXRvbWljX2hlbHBlcl9zaHV0ZG93
bihkcm0pOwo+IH0KPiAKPiBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCByb2NrY2hp
cF9kcm1fZHRfaWRzW10gPSB7Cj4tLSAKPjIuMzUuMwo+Cj4KPl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCj5MaW51eC1yb2NrY2hpcCBtYWlsaW5nIGxpc3QK
PkxpbnV4LXJvY2tjaGlwQGxpc3RzLmluZnJhZGVhZC5vcmcKPmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcm9ja2NoaXAK
