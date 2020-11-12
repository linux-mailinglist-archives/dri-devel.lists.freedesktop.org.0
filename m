Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26FE02B0E18
	for <lists+dri-devel@lfdr.de>; Thu, 12 Nov 2020 20:31:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50A156E405;
	Thu, 12 Nov 2020 19:31:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 139B06E405
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Nov 2020 19:31:16 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 55E4320026;
 Thu, 12 Nov 2020 20:31:14 +0100 (CET)
Date: Thu, 12 Nov 2020 20:31:13 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 01/30] drm/savage/savage_bci: Remove set but never used
 'aper_rsrc' and 'fb_rsrc'
Message-ID: <20201112193113.GD3287572@ravnborg.org>
References: <20201112190039.2785914-1-lee.jones@linaro.org>
 <20201112190039.2785914-2-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201112190039.2785914-2-lee.jones@linaro.org>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VbvZwmh9 c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=IkcTkHD0fZMA:10 a=e5mUnYsNAAAA:8 a=KKAkSRfTAAAA:8
 a=lw-3Ehi1VaNlIoHz8JQA:9 a=QEXdDO2ut3YA:10 a=Vxmtnl_E_bksehYqCbjh:22
 a=cvBusfyB2V15izCimMoJ:22
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

T24gVGh1LCBOb3YgMTIsIDIwMjAgYXQgMDc6MDA6MTBQTSArMDAwMCwgTGVlIEpvbmVzIHdyb3Rl
Ogo+IFRoZSBjb21tZW50IGFib3V0IHRoZW0gKGFsc28gcmVtb3ZlZCkgc2F5czoKPiAKPiAgLyog
ZmJfcnNyYyBhbmQgYXBlcl9yc3JjIGFyZW4ndCByZWFsbHkgdXNlZCBjdXJyZW50bHksIGJ1dCBz
dGlsbCBleGlzdAo+ICAgKiBpbiBjYXNlIHdlIGRlY2lkZSB3ZSBuZWVkIGluZm9ybWF0aW9uIG9u
IHRoZSBCQVIgZm9yIEJTRCBpbiB0aGUKPiAgICogZnV0dXJlLgo+ICAgKi8KPiAKPiBXZWxsIHRo
YXQgd2FzIHdyaXR0ZW4gMTIgeWVhcnMgYWdvIGluIDIwMDguICBXZSBhcmUgbm93IGluIHRoZSBm
dXR1cmUKPiBhbmQgdGhleSBhcmUgc3RpbGwgc3VwZXJmbHVvdXMuICBXZSBjYW4gYWx3YXlzIGFk
ZCB0aGVtIGFnYWluIGF0IGEKPiBsYXRlciBkYXRlIGlmIHRoZXkgYXJlIGV2ZXIgcmVxdWlyZWQu
Cj4gCj4gRml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6Cj4g
Cj4gIGRyaXZlcnMvZ3B1L2RybS9zYXZhZ2Uvc2F2YWdlX2JjaS5jOiBJbiBmdW5jdGlvbiDigJhz
YXZhZ2VfZHJpdmVyX2ZpcnN0b3BlbuKAmToKPiAgZHJpdmVycy9ncHUvZHJtL3NhdmFnZS9zYXZh
Z2VfYmNpLmM6NTgwOjI0OiB3YXJuaW5nOiB2YXJpYWJsZSDigJhhcGVyX3JzcmPigJkgc2V0IGJ1
dCBub3QgdXNlZCBbLVd1bnVzZWQtYnV0LXNldC12YXJpYWJsZV0KPiAgZHJpdmVycy9ncHUvZHJt
L3NhdmFnZS9zYXZhZ2VfYmNpLmM6NTgwOjE1OiB3YXJuaW5nOiB2YXJpYWJsZSDigJhmYl9yc3Jj
4oCZIHNldCBidXQgbm90IHVzZWQgWy1XdW51c2VkLWJ1dC1zZXQtdmFyaWFibGVdCj4gCj4gQ2M6
IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KPiBDYzogRGFuaWVsIFZldHRlciA8ZGFu
aWVsQGZmd2xsLmNoPgo+IENjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gU2ln
bmVkLW9mZi1ieTogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4KPiAtLS0KClRoYW5r
cywgYXBwbGllZCB0byBkcm0tbWlzYy1uZXh0LgoKICAgICAgICBTYW0KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
