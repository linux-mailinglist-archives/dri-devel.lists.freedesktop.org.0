Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A21F3C084
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2019 02:29:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B7B389143;
	Tue, 11 Jun 2019 00:29:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20857890E9
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2019 09:27:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id AE1E227DF85
Subject: Re: [PATCH] drm/bridge: analogix-anx78xx: Drop of_gpio.h include
To: Linus Walleij <linus.walleij@linaro.org>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
References: <20190609223254.8523-1-linus.walleij@linaro.org>
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Message-ID: <42ee6735-20f4-8b48-abac-d88a1f0db7ec@collabora.com>
Date: Mon, 10 Jun 2019 11:27:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190609223254.8523-1-linus.walleij@linaro.org>
Content-Language: en-GB
X-Mailman-Approved-At: Tue, 11 Jun 2019 00:29:12 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpPbiAxMC82LzE5IDA6MzIsIExpbnVzIFdhbGxlaWogd3JvdGU6Cj4gVGhpcyBpbmNsdWRl
IGlzIG9ubHkgdXNlZCBmb3Igc29tZSBncGlvIGRyaXZlcnMgYW5kIGNvbnN1bWVycwo+IHRoYXQg
bG9vayB1cCBHUElPIG51bWJlcnMgZGlyZWN0bHkgZnJvbSB0aGUgZGV2aWNlIHRyZWUuCj4gVGhp
cyBkcml2ZXIgZG9lcyBub3QgdXNlIGl0IGFuZCBvbmx5IG5lZWRzIDxsaW51eC9ncGlvL2NvbnN1
bWVyLmg+Lgo+IERlbGV0ZSB0aGUgdW51c2VkIGluY2x1ZGUuCj4gCj4gQ2M6IEVucmljIEJhbGxl
dGJvIGkgU2VycmEgPGVucmljLmJhbGxldGJvQGNvbGxhYm9yYS5jb20+Cj4gQ2M6IEpvc2UgQWJy
ZXUgPEpvc2UuQWJyZXVAc3lub3BzeXMuY29tPgo+IFNpZ25lZC1vZmYtYnk6IExpbnVzIFdhbGxl
aWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz4KClJldmlld2VkLWJ5OiBFbnJpYyBCYWxsZXRi
byBpIFNlcnJhIDxlbnJpYy5iYWxsZXRib0Bjb2xsYWJvcmEuY29tPgoKPiAtLS0KPiAgZHJpdmVy
cy9ncHUvZHJtL2JyaWRnZS9hbmFsb2dpeC1hbng3OHh4LmMgfCAxIC0KPiAgMSBmaWxlIGNoYW5n
ZWQsIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2JyaWRn
ZS9hbmFsb2dpeC1hbng3OHh4LmMgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2FuYWxvZ2l4LWFu
eDc4eHguYwo+IGluZGV4IGMwOWFhZjkzYWUxYi4uNjFiNTEyMmU1YTUyIDEwMDY0NAo+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYW5hbG9naXgtYW54Nzh4eC5jCj4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2JyaWRnZS9hbmFsb2dpeC1hbng3OHh4LmMKPiBAQCAtMjAsNyArMjAsNiBAQAo+
ICAjaW5jbHVkZSA8bGludXgvaTJjLmg+Cj4gICNpbmNsdWRlIDxsaW51eC9rZXJuZWwuaD4KPiAg
I2luY2x1ZGUgPGxpbnV4L21vZHVsZS5oPgo+IC0jaW5jbHVkZSA8bGludXgvb2ZfZ3Bpby5oPgo+
ICAjaW5jbHVkZSA8bGludXgvb2ZfaXJxLmg+Cj4gICNpbmNsdWRlIDxsaW51eC9vZl9wbGF0Zm9y
bS5oPgo+ICAjaW5jbHVkZSA8bGludXgvcmVnbWFwLmg+Cj4gCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
