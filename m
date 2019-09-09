Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBB85AE11F
	for <lists+dri-devel@lfdr.de>; Tue, 10 Sep 2019 00:36:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E99A189022;
	Mon,  9 Sep 2019 22:36:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0986289022
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Sep 2019 22:36:05 +0000 (UTC)
Received: from pendragon.ideasonboard.com (unknown [88.214.160.167])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 97E3D4FE;
 Tue, 10 Sep 2019 00:36:02 +0200 (CEST)
Date: Tue, 10 Sep 2019 01:35:56 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] drm/tilcdc: include linux/pinctrl/consumer.h again
Message-ID: <20190909223556.GB15652@pendragon.ideasonboard.com>
References: <20190909203409.652308-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190909203409.652308-1-arnd@arndb.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1568068562;
 bh=ytpDKk/iTXIZzQdXuSLQiM1Plw/tdurNCuOlF0kQUBo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Oh/81Sl2yegYqXREdFzqny3O9/0MXoaO0hhHQz8Uaf+i1uVY7Hcea6+AOc82SUsr/
 6wDS8y9xBfUdzP8pzfY83cphRhLjI4YfGqyYIjZqo6U99uPv64UjVENczPxqJetUQD
 D/8XptB8PPpCjvPrnoWa98HtKYrkgF/IpQEm1Qww=
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Jyri Sarha <jsarha@ti.com>, Alexios Zavras <alexios.zavras@intel.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, dri-devel@lists.freedesktop.org,
 Sam Ravnborg <sam@ravnborg.org>, Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQXJuZCwKClRoYW5rIHlvdSBmb3IgdGhlIHBhdGNoLgoKT24gTW9uLCBTZXAgMDksIDIwMTkg
YXQgMTA6MzM6NTdQTSArMDIwMCwgQXJuZCBCZXJnbWFubiB3cm90ZToKPiBUaGlzIHdhcyBhcHBh
cmVudGx5IGRyb3BwZWQgYnkgYWNjaWRlbnQgaW4gYSByZWNlbnQKPiBjbGVhbnVwLCBjYXVzaW5n
IGEgYnVpbGQgZmFpbHVyZSBpbiBzb21lIGNvbmZpZ3VyYXRpb25zIG5vdzoKPiAKPiBkcml2ZXJz
L2dwdS9kcm0vdGlsY2RjL3RpbGNkY190ZnA0MTAuYzoyOTY6MTI6IGVycm9yOiBpbXBsaWNpdCBk
ZWNsYXJhdGlvbiBvZiBmdW5jdGlvbiAnZGV2bV9waW5jdHJsX2dldF9zZWxlY3RfZGVmYXVsdCcg
Wy1XZXJyb3IsLVdpbXBsaWNpdC1mdW5jdGlvbi1kZWNsYXJhdGlvbl0KPiAKPiBGaXhlczogZmNi
NTc2NjQxNzJlICgiZHJtL3RpbGNkYzogZHJvcCB1c2Ugb2YgZHJtUC5oIikKPiBTaWduZWQtb2Zm
LWJ5OiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9k
cm0vdGlsY2RjL3RpbGNkY190ZnA0MTAuYyB8IDEgKwo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKykKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3RpbGNkYy90aWxjZGNf
dGZwNDEwLmMgYi9kcml2ZXJzL2dwdS9kcm0vdGlsY2RjL3RpbGNkY190ZnA0MTAuYwo+IGluZGV4
IDUyNWRjMWMwZjFjMS4uOWVkY2RkN2YyYjk2IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS90aWxjZGMvdGlsY2RjX3RmcDQxMC5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3RpbGNkYy90
aWxjZGNfdGZwNDEwLmMKPiBAQCAtOCw2ICs4LDcgQEAKPiAgI2luY2x1ZGUgPGxpbnV4L21vZF9k
ZXZpY2V0YWJsZS5oPgo+ICAjaW5jbHVkZSA8bGludXgvb2ZfZ3Bpby5oPgo+ICAjaW5jbHVkZSA8
bGludXgvcGxhdGZvcm1fZGV2aWNlLmg+Cj4gKyNpbmNsdWRlIDxsaW51eC9waW5jdHJsL2NvbnN1
bWVyLmg+CgpJJ2QgcHV0IHRoaXMgYmVmb3JlIHBsYXRmb3JtX2RldmljZS5oIHRvIGtlZXAgdGhl
IGhlYWRlcnMgYWxwaGFiZXRpY2FsbHkKb3JkZXJlZC4gQXBhcnQgZnJvbSB0aGF0LAoKUmV2aWV3
ZWQtYnk6IExhdXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNv
bT4KCj4gICNpbmNsdWRlIDxkcm0vZHJtX2F0b21pY19oZWxwZXIuaD4KPiAgI2luY2x1ZGUgPGRy
bS9kcm1fZW5jb2Rlci5oPgoKLS0gClJlZ2FyZHMsCgpMYXVyZW50IFBpbmNoYXJ0Cl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
