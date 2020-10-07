Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E35B28557E
	for <lists+dri-devel@lfdr.de>; Wed,  7 Oct 2020 02:43:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED4226E846;
	Wed,  7 Oct 2020 00:43:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4679F6E846
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Oct 2020 00:43:17 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id B6F481452;
 Wed,  7 Oct 2020 02:43:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1602031394;
 bh=Fz/gNwuZM6o+ijfta4jObivmjg6DcDL11Y35o/Zp5Yk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RbQuMgPHbvZpLAYnd/YmrlcbecWRETti1+wp/tZGsaUaYmuP7OsM7V8rA1mZUTPy9
 mkmvPs0anZnNNRUeHRwz9XY3xMx4QfsuRMeLqcotl61nXkEcXBNKmmmO0h3wiOkpk/
 LpdUEY9l7xp2zSe+3wpRzAVLPlVwO7lehQ3C6TNE=
Date: Wed, 7 Oct 2020 03:42:33 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH] dt-bindings: mxsfb: Add compatible for i.MX8MM
Message-ID: <20201007004233.GA30598@pendragon.ideasonboard.com>
References: <20201003224801.164112-1-marex@denx.de>
 <20201006211508.GA2853753@bogus>
 <16d91fb6-608f-a199-e3bf-99c5d7b85497@denx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <16d91fb6-608f-a199-e3bf-99c5d7b85497@denx.de>
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
Cc: devicetree@vger.kernel.org,
 Guido =?utf-8?Q?G=C3=BCnther?= <agx@sigxcpu.org>,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>, Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTWFyZWssCgpPbiBXZWQsIE9jdCAwNywgMjAyMCBhdCAxMjozODo1MEFNICswMjAwLCBNYXJl
ayBWYXN1dCB3cm90ZToKPiBPbiAxMC82LzIwIDExOjE1IFBNLCBSb2IgSGVycmluZyB3cm90ZToK
PiA+IE9uIFN1biwgMDQgT2N0IDIwMjAgMDA6NDg6MDEgKzAyMDAsIE1hcmVrIFZhc3V0IHdyb3Rl
Ogo+ID4+IE5YUCdzIGkuTVg4TU0gaGFzIGFuIExDRElGIGFzIHdlbGwuCj4gPj4KPiA+PiBTaWdu
ZWQtb2ZmLWJ5OiBNYXJlayBWYXN1dCA8bWFyZXhAZGVueC5kZT4KPiA+PiBDYzogRmFiaW8gRXN0
ZXZhbSA8ZmVzdGV2YW1AZ21haWwuY29tPgo+ID4+IENjOiBHdWlkbyBHw7xudGhlciA8YWd4QHNp
Z3hjcHUub3JnPgo+ID4+IENjOiBMdWNhcyBTdGFjaCA8bC5zdGFjaEBwZW5ndXRyb25peC5kZT4K
PiA+PiBDYzogTlhQIExpbnV4IFRlYW0gPGxpbnV4LWlteEBueHAuY29tPgo+ID4+IENjOiBSb2Ig
SGVycmluZyA8cm9iaCtkdEBrZXJuZWwub3JnPgo+ID4+IENjOiBTaGF3biBHdW8gPHNoYXduZ3Vv
QGtlcm5lbC5vcmc+Cj4gPj4gLS0tCj4gPj4gIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9kaXNwbGF5L214c2ZiLnR4dCB8IDEgKwo+ID4+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKykKPiA+Pgo+ID4gCj4gPiBBY2tlZC1ieTogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVs
Lm9yZz4KPiA+IAo+ID4gVGhvdWdoIExhdXJlbnQgcG9zdGVkIGNvbnZlcnRpbmcgdGhpcyB0byBz
Y2hlbWEuLi4KPiAKPiBEbyB5b3Ugd2FudCBtZSB0byByZWJhc2UgdGhpcyBvbiB0b3Agb2YgaXQg
b3IgdGhlIG90aGVyIHdheSBhcm91bmQgPwoKV291bGQgaXQgYmUgT0sgaWYgSSByZWJhc2VkIHRo
aXMgb24gdG9wIG9mIHRoZSBjb252ZXJzaW9uLCBhbmQgaW5jbHVkZWQKaXQgaW4gdGhlIHYyIG9m
IHRoZSBteHNmYiBzZXJpZXMgPwoKLS0gClJlZ2FyZHMsCgpMYXVyZW50IFBpbmNoYXJ0Cl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
