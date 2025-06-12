Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EA68AD67AE
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 08:11:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D9FB10E387;
	Thu, 12 Jun 2025 06:11:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="CcLJrhIV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3ADD610E387
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jun 2025 06:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
 Message-ID; bh=uqsR+yBXJaeE7Gc/RSa8YhyVSpecmvVTUqnfn/mFK0k=; b=C
 cLJrhIVjF8wuN2+QsJ1M6HPkdsCWjG/xaKOhP6mySJWs7itSwCEKfpzaxPPYmU2z
 abGKCLAUZAb6MqeVwYAbmjnbu3LIhs6m+VzFcMBNtBAc0WYI23PimHBp/g6wSUXX
 cc37VpOttrVx/HfAp1WGwvCVZdlABqwEfFReyhHXzA=
Received: from andyshrk$163.com ( [58.22.7.114] ) by
 ajax-webmail-wmsvr-40-106 (Coremail) ; Thu, 12 Jun 2025 14:11:37 +0800
 (CST)
X-Originating-IP: [58.22.7.114]
Date: Thu, 12 Jun 2025 14:11:37 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: "Heiko Stuebner" <heiko@sntech.de>
Cc: hjc@rock-chips.com, andy.yan@rock-chips.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re:[PATCH] drm/rockchip: vop2: fail cleanly if missing a primary
 plane for a video-port
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2025 www.mailtech.cn 163com
In-Reply-To: <20250610212748.1062375-1-heiko@sntech.de>
References: <20250610212748.1062375-1-heiko@sntech.de>
X-NTES-SC: AL_Qu2fC/ubt04i4SmdZ+kfmkcVgOw9UcO5v/Qk3oZXOJF8jCDp5y4hcHpTPUXy9sWDKyGinQiHTBd1y8NDfahcdIMob9tkaclLAvXdvK0Y9HVFTw==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <4a19525.4f96.19762c3f163.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: aigvCgD3H3Oab0pooEUaAA--.55529W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiqB9qXmhKaNasWgABso
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

CkhpIEhlaWtv77yMCkF0IDIwMjUtMDYtMTEgMDU6Mjc6NDgsICJIZWlrbyBTdHVlYm5lciIgPGhl
aWtvQHNudGVjaC5kZT4gd3JvdGU6Cj5FYWNoIHdpbmRvdyBvZiBhIHZvcDIgaXMgdXNhYmxlIGJ5
IGEgc3BlY2lmaWMgc2V0IG9mIHZpZGVvIHBvcnRzLCBzbyB3aGlsZQo+YmluZGluZyB0aGUgdm9w
Miwgd2UgbG9vayB0aHJvdWdoIHRoZSBsaXN0IG9mIGF2YWlsYWJsZSB3aW5kb3dzIHRyeWluZyB0
bwo+ZmluZCBvbmUgZGVzaWduYXRlZCBhcyBwcmltYXJ5LXBsYW5lIGFuZCB1c2FibGUgYnkgdGhh
dCBzcGVjaWZpYyBwb3J0Lgo+Cj5UaGUgY29kZSBsYXRlciB3YW50cyB0byB1c2UgZHJtX2NydGNf
aW5pdF93aXRoX3BsYW5lcyB3aXRoIHRoYXQgZm91bmQKPnByaW1hcnkgcGxhbmUsIGJ1dCBub3Ro
aW5nIGhhcyBjaGVja2VkIHNvIGZhciBpZiBhIHByaW1hcnkgcGxhbmUgd2FzCj5hY3R1YWxseSBm
b3VuZC4KPgo+Rm9yIHdoYXRldmVyIHJlYXNvbiwgdGhlIHJrMzU3NiB2cDIgZG9lcyBub3QgaGF2
ZSBhIHVzYWJsZSBwcmltYXJ5IHdpbmRvdwo+KGlmIHZwMCBpcyBhbHNvIGluIHVzZSkgd2hpY2gg
YnJvdWdodCB0aGUgaXNzdWUgdG8gbGlnaHQgYW5kIGVuZGVkIGluIGEKPm51bGwtcG9pbnRlciBk
ZXJlZmVyZW5jZSBmdXJ0aGVyIGRvd24uCj4KPkFzIHdlIGV4cGVjdCBhIHByaW1hcnktcGxhbmUg
dG8gZXhpc3QgZm9yIGEgdmlkZW8tcG9ydCwgYWRkIGEgY2hlY2sgYXQKPnRoZSBlbmQgb2YgdGhl
IHdpbmRvdy1pdGVyYXRpb24gYW5kIGZhaWwgcHJvYmluZyBpZiBub25lIHdhcyBmb3VuZC4KPgo+
Rml4ZXM6IDYwNGJlODU1NDdjZSAoImRybS9yb2NrY2hpcDogQWRkIFZPUDIgZHJpdmVyIikKPlNp
Z25lZC1vZmYtYnk6IEhlaWtvIFN0dWVibmVyIDxoZWlrb0BzbnRlY2guZGU+CgpSZXZpZXdlZC1i
eTogQW5keSBZYW4gPGFuZHkueWFuQHJvY2stY2hpcHMuY29tPgoKVGhhbmtzCgoKPi0tLQo+IGRy
aXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9kcm1fdm9wMi5jIHwgNCArKysrCj4gMSBm
aWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQo+Cj5kaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL3JvY2tjaGlwL3JvY2tjaGlwX2RybV92b3AyLmMgYi9kcml2ZXJzL2dwdS9kcm0vcm9ja2No
aXAvcm9ja2NoaXBfZHJtX3ZvcDIuYwo+aW5kZXggN2RkZjMxMWIzOGM2Li5hOGRjMmU1NTgxMmEg
MTAwNjQ0Cj4tLS0gYS9kcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvcm9ja2NoaXBfZHJtX3ZvcDIu
Ywo+KysrIGIvZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL3JvY2tjaGlwX2RybV92b3AyLmMKPkBA
IC0yNDI1LDYgKzI0MjUsMTAgQEAgc3RhdGljIGludCB2b3AyX2NyZWF0ZV9jcnRjcyhzdHJ1Y3Qg
dm9wMiAqdm9wMikKPiAJCQkJYnJlYWs7Cj4gCQkJfQo+IAkJfQo+Kwo+KwkJaWYgKCF2cC0+cHJp
bWFyeV9wbGFuZSkKPisJCQlyZXR1cm4gZGV2X2Vycl9wcm9iZShkcm0tPmRldiwgLUVOT0VOVCwK
PisJCQkJCSAgICAgIm5vIHByaW1hcnkgcGxhbmUgZm9yIHZwICVkXG4iLCBpKTsKPiAJfQo+IAo+
IAkvKiBSZWdpc3RlciBhbGwgdW51c2VkIHdpbmRvdyBhcyBvdmVybGF5IHBsYW5lICovCj4tLSAK
PjIuNDcuMgo+Cg==
