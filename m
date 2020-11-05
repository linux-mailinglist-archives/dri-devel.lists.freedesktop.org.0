Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8580C2A88DC
	for <lists+dri-devel@lfdr.de>; Thu,  5 Nov 2020 22:21:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E6106E329;
	Thu,  5 Nov 2020 21:21:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 185C46E329
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Nov 2020 21:21:27 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 8FD482006C;
 Thu,  5 Nov 2020 22:21:24 +0100 (CET)
Date: Thu, 5 Nov 2020 22:21:23 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 12/19] gpu: drm: bridge: analogix: analogix_dp_reg:
 Remove unused function 'analogix_dp_write_byte_to_dpcd'
Message-ID: <20201105212123.GE216923@ravnborg.org>
References: <20201105144517.1826692-1-lee.jones@linaro.org>
 <20201105144517.1826692-13-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201105144517.1826692-13-lee.jones@linaro.org>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VbvZwmh9 c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=IkcTkHD0fZMA:10 a=hD80L64hAAAA:8 a=IpJZQVW2AAAA:8 a=P1BnusSwAAAA:8
 a=RwHePtW7AAAA:8 a=i0EeH86SAAAA:8 a=7gkXJVJtAAAA:8 a=e5mUnYsNAAAA:8
 a=KKAkSRfTAAAA:8 a=wOZaIO4e_DUmNJ9mob8A:9 a=QEXdDO2ut3YA:10
 a=IawgGOuG5U0WyFbmm1f5:22 a=D0XLA9XvdZm18NrgonBM:22
 a=FqraQwd7dyEg5dwJgZJs:22 a=E9Po1WZjFZOl8hwRPBS3:22
 a=Vxmtnl_E_bksehYqCbjh:22 a=cvBusfyB2V15izCimMoJ:22
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Jingoo Han <jg1.han@samsung.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jason Yan <yanaijie@huawei.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTGVlCgpPbiBUaHUsIE5vdiAwNSwgMjAyMCBhdCAwMjo0NToxMFBNICswMDAwLCBMZWUgSm9u
ZXMgd3JvdGU6Cj4gRml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmco
cyk6Cj4gCj4gIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYW5hbG9naXgvYW5hbG9naXhfZHBfcmVn
LmM6NTcxOjU6IHdhcm5pbmc6IG5vIHByZXZpb3VzIHByb3RvdHlwZSBmb3Ig4oCYYW5hbG9naXhf
ZHBfd3JpdGVfYnl0ZV90b19kcGNk4oCZIFstV21pc3NpbmctcHJvdG90eXBlc10KPiAKPiBDYzog
QW5kcnplaiBIYWpkYSA8YS5oYWpkYUBzYW1zdW5nLmNvbT4KPiBDYzogTmVpbCBBcm1zdHJvbmcg
PG5hcm1zdHJvbmdAYmF5bGlicmUuY29tPgo+IENjOiBMYXVyZW50IFBpbmNoYXJ0IDxMYXVyZW50
LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+Cj4gQ2M6IEpvbmFzIEthcmxtYW4gPGpvbmFzQGt3
aWJvby5zZT4KPiBDYzogSmVybmVqIFNrcmFiZWMgPGplcm5lai5za3JhYmVjQHNpb2wubmV0Pgo+
IENjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+Cj4gQ2M6IERhbmllbCBWZXR0ZXIg
PGRhbmllbEBmZndsbC5jaD4KPiBDYzogSmFzb24gWWFuIDx5YW5haWppZUBodWF3ZWkuY29tPgo+
IENjOiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+Cj4gQ2M6IEppbmdvbyBIYW4gPGpn
MS5oYW5Ac2Ftc3VuZy5jb20+Cj4gQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
PiBTaWduZWQtb2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgoKSSBmb2xk
ZWQgaW4gdGhlIG90aGVyIGFuYWxvZ2l4X2RwX3JlZy5jIHBhdGNoIHdoZW4gSSBhcHBsaWVkIHRo
aXMuClNvIHdlIGhhdmUgdGhlIGZ1bGwgcmVtb3ZhbCBpbiBvbmUgcGF0Y2guCgoJU2FtCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
