Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50D102B4098
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 11:17:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FC8689DA6;
	Mon, 16 Nov 2020 10:17:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0781489DA6
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 10:17:40 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id CC65B804C8;
 Mon, 16 Nov 2020 11:17:35 +0100 (CET)
Date: Mon, 16 Nov 2020 11:17:34 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 12/40] drm/pl111/pl111_display: Make local function static
Message-ID: <20201116101734.GA65688@ravnborg.org>
References: <20201113134938.4004947-1-lee.jones@linaro.org>
 <20201113134938.4004947-13-lee.jones@linaro.org>
 <20201114191127.GB3797389@ravnborg.org>
 <20201116084023.GL3718728@dell>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201116084023.GL3718728@dell>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VafZwmh9 c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=IkcTkHD0fZMA:10 a=-VAfIpHNAAAA:8 a=e5mUnYsNAAAA:8 a=KKAkSRfTAAAA:8
 a=uGS4jb_diw1687yx55MA:9 a=QEXdDO2ut3YA:10 a=srlwD-8ojaedGGhPAyx8:22
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTGVlLApPbiBNb24sIE5vdiAxNiwgMjAyMCBhdCAwODo0MDoyM0FNICswMDAwLCBMZWUgSm9u
ZXMgd3JvdGU6Cj4gT24gU2F0LCAxNCBOb3YgMjAyMCwgU2FtIFJhdm5ib3JnIHdyb3RlOgo+IAo+
ID4gSGkgTGVlLAo+ID4gT24gRnJpLCBOb3YgMTMsIDIwMjAgYXQgMDE6NDk6MTBQTSArMDAwMCwg
TGVlIEpvbmVzIHdyb3RlOgo+ID4gPiBGaXhlcyB0aGUgZm9sbG93aW5nIFc9MSBrZXJuZWwgYnVp
bGQgd2FybmluZyhzKToKPiA+ID4gCj4gPiA+ICBkcml2ZXJzL2dwdS9kcm0vcGwxMTEvcGwxMTFf
ZGlzcGxheS5jOjM1Njo2OiB3YXJuaW5nOiBubyBwcmV2aW91cyBwcm90b3R5cGUgZm9yIOKAmHBs
MTExX2Rpc3BsYXlfZGlzYWJsZeKAmSBbLVdtaXNzaW5nLXByb3RvdHlwZXNdCj4gPiA+IAo+ID4g
PiBDYzogRXJpYyBBbmhvbHQgPGVyaWNAYW5ob2x0Lm5ldD4KPiA+ID4gQ2M6IERhdmlkIEFpcmxp
ZSA8YWlybGllZEBsaW51eC5pZT4KPiA+ID4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZnds
bC5jaD4KPiA+ID4gQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiA+ID4gU2ln
bmVkLW9mZi1ieTogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4KPiA+IAo+ID4gRXJp
YydzIHdhcyBub3QgY29waWVkIG9uIHRoaXMgb3IgdGhlIG90aGVyIHBsMTExIHBhdGNoLgo+ID4g
QWRkZWQgRXJpYyBzbyBoZSBjYW4gYmUgYXdhcmUgb2YgdGhpcyBmaXguCj4gCj4gRXJpYyBBbmhv
bHQ/Cj4gCj4gSGUncyBvbiBDYz8KTm90IG9uIHRoZSBvcmlnaW5hbCBtYWlsIEkgcmVjZWl2ZWQu
CgoJU2FtCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
