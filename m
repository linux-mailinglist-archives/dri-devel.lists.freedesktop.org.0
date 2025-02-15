Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B238DA36CAF
	for <lists+dri-devel@lfdr.de>; Sat, 15 Feb 2025 09:53:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09CD410E068;
	Sat, 15 Feb 2025 08:53:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="gmrEmFMc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
 by gabe.freedesktop.org (Postfix) with ESMTP id CF71110E068
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Feb 2025 08:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
 Message-ID; bh=N3TP0XibWw2sSwmbnWxyiBXX521K29MQWltvdhdqFko=; b=g
 mrEmFMcIQTVpIkMt/OeTHqV6Js/AAZNIgPYFRAZ/+TE/ak6p5CflJqLdcDvSQaCz
 q7pFx+7umEdrTjjrrUI2WMusdTQlGQIinES4+R13rSmXVGGtxwxPSzb30jXxgUYt
 caarbArFJVBCV2UL2iPE5shDqH91gvYNNyW9QksY0Y=
Received: from andyshrk$163.com ( [58.22.7.114] ) by
 ajax-webmail-wmsvr-40-141 (Coremail) ; Sat, 15 Feb 2025 16:53:50 +0800
 (CST)
X-Originating-IP: [58.22.7.114]
Date: Sat, 15 Feb 2025 16:53:50 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: "Lucas Stach" <l.stach@pengutronix.de>
Cc: "Sandy Huang" <hjc@rock-chips.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 "Andy Yan" <andy.yan@rock-chips.com>,
 "Damon Ding" <damon.ding@rock-chips.com>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, kernel@pengutronix.de,
 patchwork-lst@pengutronix.de
Subject: Re:[PATCH 1/2] drm/rockchip: vop: remove redundant condition check
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2025 www.mailtech.cn 163com
In-Reply-To: <20250207182247.215537-1-l.stach@pengutronix.de>
References: <20250207182247.215537-1-l.stach@pengutronix.de>
X-NTES-SC: AL_Qu2YC/qbtk4o5iKdbekfmkcVgOw9UcO5v/Qk3oZXOJF8jCrr9gYOYUFMLFHZ4OeODhqPrheYUAFq0M9dZ69DWLMbMhyTfrz/fSbtNYlGctFb7Q==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <64ed50b3.23b5.19508d0663a.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: jSgvCgDXPwAeVrBnwGJpAA--.21151W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbB0hT0XmewSqmjvQABsH
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

CkhpIEx1Y2Fz77yMCgpBdCAyMDI1LTAyLTA4IDAyOjIyOjQ2LCAiTHVjYXMgU3RhY2giIDxsLnN0
YWNoQHBlbmd1dHJvbml4LmRlPiB3cm90ZToKPkluc3RlYWQgb2YgY2hlY2tpbmcgdGhlIHNhbWUg
dGhpbmcgdHdpY2UgaW4gYSByb3csIGZvbGQgdGhlIHNlY29uZAo+Y29uZGl0aW9uIGludG8gdGhl
IGZpcnN0IGNsYXVzZS4KPgo+U2lnbmVkLW9mZi1ieTogTHVjYXMgU3RhY2ggPGwuc3RhY2hAcGVu
Z3V0cm9uaXguZGU+CgogIFJldmlld2VkLWJ5OiBBbmR5IFlhbiA8YW5keXNocmtAMTYzLmNvbT4K
CgpUaGFua3MKCj4tLS0KPiBkcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvcm9ja2NoaXBfZHJtX3Zv
cC5jIHwgNSArKy0tLQo+IDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDMgZGVsZXRp
b25zKC0pCj4KPmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvcm9ja2NoaXBf
ZHJtX3ZvcC5jIGIvZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL3JvY2tjaGlwX2RybV92b3AuYwo+
aW5kZXggNTc3NDdmMWNmZjI2Li43ZjVmYmVhMzQ5NTEgMTAwNjQ0Cj4tLS0gYS9kcml2ZXJzL2dw
dS9kcm0vcm9ja2NoaXAvcm9ja2NoaXBfZHJtX3ZvcC5jCj4rKysgYi9kcml2ZXJzL2dwdS9kcm0v
cm9ja2NoaXAvcm9ja2NoaXBfZHJtX3ZvcC5jCj5AQCAtNzMzLDExICs3MzMsMTAgQEAgc3RhdGlj
IHZvaWQgdm9wX2NydGNfYXRvbWljX2Rpc2FibGUoc3RydWN0IGRybV9jcnRjICpjcnRjLAo+IAo+
IAlXQVJOX09OKHZvcC0+ZXZlbnQpOwo+IAo+LQlpZiAoY3J0Yy0+c3RhdGUtPnNlbGZfcmVmcmVz
aF9hY3RpdmUpCj4rCWlmIChjcnRjLT5zdGF0ZS0+c2VsZl9yZWZyZXNoX2FjdGl2ZSkgewo+IAkJ
cm9ja2NoaXBfZHJtX3NldF93aW5fZW5hYmxlZChjcnRjLCBmYWxzZSk7Cj4tCj4tCWlmIChjcnRj
LT5zdGF0ZS0+c2VsZl9yZWZyZXNoX2FjdGl2ZSkKPiAJCWdvdG8gb3V0Owo+Kwl9Cj4gCj4gCW11
dGV4X2xvY2soJnZvcC0+dm9wX2xvY2spOwo+IAo+Cj5iYXNlLWNvbW1pdDogMjAxNGM5NWFmZWNl
ZTNlNzZjYTRhNTY5NTZhOTM2ZTIzMjgzZjA1Ygo+LS0gCj4yLjQ4LjEKPgo=
