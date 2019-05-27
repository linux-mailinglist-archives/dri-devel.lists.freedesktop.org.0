Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 871B72AEF4
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2019 08:52:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B696D8976D;
	Mon, 27 May 2019 06:52:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 689278976D;
 Mon, 27 May 2019 06:52:49 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id A76FB8046D;
 Mon, 27 May 2019 08:52:47 +0200 (CEST)
Date: Mon, 27 May 2019 08:52:46 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: LKML <linux-kernel@vger.kernel.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 DRI Development <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 11/33] fbdev/sh_mobile: remove
 sh_mobile_lcdc_display_notify
Message-ID: <20190527065246.GB8648@ravnborg.org>
References: <20190524085354.27411-1-daniel.vetter@ffwll.ch>
 <20190524085354.27411-12-daniel.vetter@ffwll.ch>
 <20190525150159.GA27341@ravnborg.org>
 <20190527061306.GG21222@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190527061306.GG21222@phenom.ffwll.local>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=IkcTkHD0fZMA:10 a=7gkXJVJtAAAA:8
 a=cnA9valBEamFauFJ_BIA:9 a=QEXdDO2ut3YA:10 a=E9Po1WZjFZOl8hwRPBS3:22
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBNYXkgMjcsIDIwMTkgYXQgMDg6MTM6MDZBTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBPbiBTYXQsIE1heSAyNSwgMjAxOSBhdCAwNTowMTo1OVBNICswMjAwLCBTYW0gUmF2
bmJvcmcgd3JvdGU6Cj4gPiBIaSBEYW5pZWwKPiA+IAo+ID4gPiBJdCdzIGRlYWQgY29kZSwgYW5k
IHJlbW92aW5nIGl0IGF2b2lkcyBtZSBoYXZpbmcgdG8gdW5kZXJzdGFuZAo+ID4gPiB3aGF0IGl0
J3MgZG9pbmcgd2l0aCBsb2NrX2ZiX2luZm8uCj4gPiAKPiA+IEkgcHVzaGVkIHRoZSBzZXJpZXMg
dGhyb3VnaCBteSBidWlsZCB0ZXN0cyB3aGljaCBpbmNsdWRlIHRoZSBzaAo+ID4gYXJjaGl0ZWN0
dXJlLgo+ID4gCj4gPiBPbmUgZXJyb3IgYW5kIG9uZSB3YXJuaW5nIHdhcyB0cmlnZ2VyZWQgZnJv
bSBzaF9tb2JpbGVfbGNkY2ZiLmMuCj4gPiBUaGUgcmVzdCB3YXMgZmluZS4KPiA+IAo+ID4gVGhl
IHBhdGNoIGJlbG93IHJlbW92ZWQgdGhlIHNvbGUgdXNlciBvZgo+ID4gc2hfbW9iaWxlX2xjZGNf
bXVzdF9yZWNvbmZpZ3VyZSgpIHNvIHRoaXMgdHJpZ2dlcnMgYSB3YXJuaW5nLgo+ID4gCj4gPiBB
bmQgSSBhbHNvIGdldCB0aGUgZm9sbG93aW5nIGVycm9yOgo+ID4gZHJpdmVycy92aWRlby9mYmRl
di9zaF9tb2JpbGVfbGNkY2ZiLmM6IEluIGZ1bmN0aW9uIOKAmHNoX21vYmlsZV9mYl9yZWNvbmZp
Z+KAmToKPiA+IGRyaXZlcnMvdmlkZW8vZmJkZXYvc2hfbW9iaWxlX2xjZGNmYi5jOjE4MDA6Mjog
ZXJyb3I6IGltcGxpY2l0IGRlY2xhcmF0aW9uIG9mIGZ1bmN0aW9uIOKAmGZiY29uX3VwZGF0ZV92
Y3PigJk7IGRpZCB5b3UgbWVhbiDigJhmaWxlX3VwZGF0ZV90aW1l4oCZPyBbLVdlcnJvcj1pbXBs
aWNpdC1mdW5jdGlvbi1kZWNsYXJhdGlvbl0KPiA+ICAgZmJjb25fdXBkYXRlX3ZjcyhpbmZvLCB0
cnVlKTsKPiA+ICAgXn5+fn5+fn5+fn5+fn5+fgo+ID4gICBmaWxlX3VwZGF0ZV90aW1lCj4gPiAK
PiA+IEkgZGlkIG5vdCBjaGVjayBidXQgYXNzdW1lIHRoZSBlcnJvciB3YXMgdHJpZ2dlcmVkIGlu
IHBhdGNoIDI4IHdoZXJlCj4gPiBmYmNvbl91cGRhdGVfdmNzKCkgaW4gaW50cm9kdWNlZC4KPiAK
PiBPb3BzLiBDYW4gSSBoYXZlIHlvdXIgc29iIHNvIEkgY2FuIHNxdWFzaCB0aGlzIGluPwpZZXMs
IGhlcmUgd2UgZ28uIChJdCB3YXMgdHJpdmlhbCBzbyBJIHRob3VnaHQgbm90IG5lZWRlZCwgc29y
cnkpClNpZ25lZC1vZmYtYnk6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
