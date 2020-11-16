Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D33A32B4273
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 12:18:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13D7C89E1B;
	Mon, 16 Nov 2020 11:18:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E070989E1B
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 11:18:53 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 86E0720056;
 Mon, 16 Nov 2020 12:18:51 +0100 (CET)
Date: Mon, 16 Nov 2020 12:18:50 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 12/40] drm/pl111/pl111_display: Make local function static
Message-ID: <20201116111850.GA68743@ravnborg.org>
References: <20201113134938.4004947-1-lee.jones@linaro.org>
 <20201113134938.4004947-13-lee.jones@linaro.org>
 <20201114191127.GB3797389@ravnborg.org>
 <20201116084023.GL3718728@dell>
 <20201116101734.GA65688@ravnborg.org>
 <20201116102530.GN3718728@dell>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201116102530.GN3718728@dell>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VbvZwmh9 c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=IkcTkHD0fZMA:10 a=-VAfIpHNAAAA:8 a=e5mUnYsNAAAA:8 a=KKAkSRfTAAAA:8
 a=VwQbUJbxAAAA:8 a=xQzvdHlxAAAA:20 a=YYAp68AnUQjD0k_29DoA:9
 a=QEXdDO2ut3YA:10 a=srlwD-8ojaedGGhPAyx8:22 a=Vxmtnl_E_bksehYqCbjh:22
 a=cvBusfyB2V15izCimMoJ:22 a=AjGcO6oz07-iQ99wixmX:22
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

SGkgTGVlLApPbiBNb24sIE5vdiAxNiwgMjAyMCBhdCAxMDoyNTozMEFNICswMDAwLCBMZWUgSm9u
ZXMgd3JvdGU6Cj4gT24gTW9uLCAxNiBOb3YgMjAyMCwgU2FtIFJhdm5ib3JnIHdyb3RlOgo+IAo+
ID4gSGkgTGVlLAo+ID4gT24gTW9uLCBOb3YgMTYsIDIwMjAgYXQgMDg6NDA6MjNBTSArMDAwMCwg
TGVlIEpvbmVzIHdyb3RlOgo+ID4gPiBPbiBTYXQsIDE0IE5vdiAyMDIwLCBTYW0gUmF2bmJvcmcg
d3JvdGU6Cj4gPiA+IAo+ID4gPiA+IEhpIExlZSwKPiA+ID4gPiBPbiBGcmksIE5vdiAxMywgMjAy
MCBhdCAwMTo0OToxMFBNICswMDAwLCBMZWUgSm9uZXMgd3JvdGU6Cj4gPiA+ID4gPiBGaXhlcyB0
aGUgZm9sbG93aW5nIFc9MSBrZXJuZWwgYnVpbGQgd2FybmluZyhzKToKPiA+ID4gPiA+IAo+ID4g
PiA+ID4gIGRyaXZlcnMvZ3B1L2RybS9wbDExMS9wbDExMV9kaXNwbGF5LmM6MzU2OjY6IHdhcm5p
bmc6IG5vIHByZXZpb3VzIHByb3RvdHlwZSBmb3Ig4oCYcGwxMTFfZGlzcGxheV9kaXNhYmxl4oCZ
IFstV21pc3NpbmctcHJvdG90eXBlc10KPiA+ID4gPiA+IAo+ID4gPiA+ID4gQ2M6IEVyaWMgQW5o
b2x0IDxlcmljQGFuaG9sdC5uZXQ+Cj4gPiA+ID4gPiBDYzogRGF2aWQgQWlybGllIDxhaXJsaWVk
QGxpbnV4LmllPgo+ID4gPiA+ID4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4K
PiA+ID4gPiA+IENjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gPiA+ID4gPiBT
aWduZWQtb2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgo+ID4gPiA+IAo+
ID4gPiA+IEVyaWMncyB3YXMgbm90IGNvcGllZCBvbiB0aGlzIG9yIHRoZSBvdGhlciBwbDExMSBw
YXRjaC4KPiA+ID4gPiBBZGRlZCBFcmljIHNvIGhlIGNhbiBiZSBhd2FyZSBvZiB0aGlzIGZpeC4K
PiA+ID4gCj4gPiA+IEVyaWMgQW5ob2x0Pwo+ID4gPiAKPiA+ID4gSGUncyBvbiBDYz8KPiA+IE5v
dCBvbiB0aGUgb3JpZ2luYWwgbWFpbCBJIHJlY2VpdmVkLgo+IAo+IExvb2tzIGZpbmUgdG8gbWU6
Cj4gCj4gRGF0ZTogRnJpLCAxMyBOb3YgMjAyMCAxMzo0OToxMCArMDAwMAo+IEZyb206IExlZSBK
b25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+Cj4gVG86IGxlZS5qb25lc0BsaW5hcm8ub3JnCj4g
Q2M6IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcsIEVyaWMgQW5ob2x0IDxlcmljQGFuaG9s
dC5uZXQ+LCBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+LCBEYW5pZWwgVmV0dGVyIDxk
YW5pZWxAZmZ3bGwuY2g+LCBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gU3ViamVj
dDogW1BBVENIIDEyLzQwXSBkcm0vcGwxMTEvcGwxMTFfZGlzcGxheTogTWFrZSBsb2NhbCBmdW5j
dGlvbiBzdGF0aWMKPiAKPiBBbHNvIHJlZmxlY3RlZCBpbiBHbWFpbDoKPiAKPiAgaHR0cHM6Ly9p
LmltZ3VyLmNvbS9kNjlZVHp6LnBuZwoKU3RyYW5nZSBpbmRlZWQuIEluIGxvcmUgRXJpYyBpcyBu
b3QgaW5jbHVkZWQ6Cmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2RyaS1kZXZlbC8yMDIwMTExMzEz
NDkzOC40MDA0OTQ3LTEzLWxlZS5qb25lc0BsaW5hcm8ub3JnLwoKSSBjb25zaWRlciB0aGlzIGEg
Zmx1a2UgaW4gdGhlIGZvcmNlLCBhbmQgd2lsbCBub3Qgd29ycnkgbW9yZSBhYm91dCBpdC4KCglT
YW0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
