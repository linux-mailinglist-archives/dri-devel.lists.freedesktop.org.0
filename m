Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C64176EA2
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jul 2019 18:10:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09EA56EDBE;
	Fri, 26 Jul 2019 16:09:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6FD06EDBE
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jul 2019 16:09:57 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id ED4A0805B4;
 Fri, 26 Jul 2019 18:09:54 +0200 (CEST)
Date: Fri, 26 Jul 2019 18:09:53 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v1 1/1] backlight: drop EARLY_EVENT_BLANK support
Message-ID: <20190726160953.GA25708@ravnborg.org>
References: <20190725143224.GB31803@ravnborg.org>
 <20190725143934.GH15868@phenom.ffwll.local>
 <20190725150629.GN23883@dell>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190725150629.GN23883@dell>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=IkcTkHD0fZMA:10 a=7gkXJVJtAAAA:8
 a=KKAkSRfTAAAA:8 a=pGLkceISAAAA:8 a=hD80L64hAAAA:8 a=QyXUC8HyAAAA:8
 a=20KFwNOVAAAA:8 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=czWnBFgr41Ue61ZtJ1UA:9
 a=QEXdDO2ut3YA:10 a=E9Po1WZjFZOl8hwRPBS3:22 a=cvBusfyB2V15izCimMoJ:22
 a=Vxmtnl_E_bksehYqCbjh:22 a=AjGcO6oz07-iQ99wixmX:22
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
 Gerd Hoffmann <kraxel@redhat.com>, Jingoo Han <jingoohan1@gmail.com>,
 Peter Rosin <peda@axentia.se>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTGVlLgoKT24gVGh1LCBKdWwgMjUsIDIwMTkgYXQgMDQ6MDY6MjlQTSArMDEwMCwgTGVlIEpv
bmVzIHdyb3RlOgo+IE9uIFRodSwgMjUgSnVsIDIwMTksIERhbmllbCBWZXR0ZXIgd3JvdGU6Cj4g
Cj4gPiBPbiBUaHUsIEp1bCAyNSwgMjAxOSBhdCAwNDozMjoyNFBNICswMjAwLCBTYW0gUmF2bmJv
cmcgd3JvdGU6Cj4gPiA+IFRoZXJlIHdhcyBubyB1c2VycyBsZWZ0IC0gc28gZHJvcCB0aGUgY29k
ZSB0byBzdXBwb3J0IEVBUkxZX0ZCX0JMQU5LLgo+ID4gPiBUaGlzIHBhdGNoIHJlbW92ZXMgdGhl
IHN1cHBvcnQgaW4gYmFja2xpZ2h0LAo+ID4gPiBhbmQgZHJvcCB0aGUgbm90aWZpZXIgaW4gZmJt
ZW0uCj4gPiA+IAo+ID4gPiBUaGF0IEVBUkxZX0ZCX0JMQU5LIGlzIG5vdCB1c2VkIGNhbiBiZSB2
ZXJpZmllZCB0aGF0IG5vIGRyaXZlciBzZXQgYW55IG9mOgo+ID4gPiAKPiA+ID4gICAgIGxjZF9v
cHMuZWFybHlfc2V0X3Bvd2VyKCkKPiA+ID4gICAgIGxjZF9vcHMucl9lYXJseV9zZXRfcG93ZXIo
KQo+ID4gPiAKPiA+ID4gTm90aWNlZCB3aGlsZSBicm93c2luZyBiYWNrbGlnaHQgY29kZSBmb3Ig
b3RoZXIgcmVhc29ucy4KPiA+IAo+ID4gQWggSSBkaWRuJ3QgZ3JlcCBoYXJkIGVub3VnaCwgSSBk
aWRuJ3QgcmVhbGl6ZSB0aGF0IG5vIG9uZSBzZXRzIHRoZQo+ID4gbGNkX29wcy0+KHJfKWVhcmx5
X3NldF9wb3dlciBob29rcy4gTmljZSBmaW5kIQo+ID4gCj4gPiBSZXZpZXdlZC1ieTogRGFuaWVs
IFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KPiA+IAo+ID4gPiBTaWduZWQtb2ZmLWJ5
OiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+Cj4gPiA+IENjOiBMZWUgSm9uZXMgPGxl
ZS5qb25lc0BsaW5hcm8ub3JnPgo+ID4gPiBDYzogRGFuaWVsIFRob21wc29uIDxkYW5pZWwudGhv
bXBzb25AbGluYXJvLm9yZz4KPiA+ID4gQ2M6IEppbmdvbyBIYW4gPGppbmdvb2hhbjFAZ21haWwu
Y29tPgo+ID4gPiBDYzogQmFydGxvbWllaiBab2xuaWVya2lld2ljeiA8Yi56b2xuaWVya2llQHNh
bXN1bmcuY29tPgo+ID4gPiBDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5j
aD4KPiA+ID4gQ2M6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KPiA+ID4gQ2M6IE1h
YXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+Cj4gPiA+
IENjOiAiTWljaGHFgiBNaXJvc8WCYXciIDxtaXJxLWxpbnV4QHJlcmUucW1xbS5wbD4KPiA+ID4g
Q2M6IFBldGVyIFJvc2luIDxwZWRhQGF4ZW50aWEuc2U+Cj4gPiA+IENjOiBHZXJkIEhvZmZtYW5u
IDxrcmF4ZWxAcmVkaGF0LmNvbT4KPiA+ID4gQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKPiA+ID4gQ2M6IGxpbnV4LWZiZGV2QHZnZXIua2VybmVsLm9yZwo+ID4gPiAtLS0KPiA+
ID4gCj4gPiA+IEJ1aWxkIHRlc3RlZCB3aXRoIHZhcmlvdXMgYXJjaGl0ZWN0dXJlcywgY29uZmln
cy4KPiA+ID4gCj4gPiA+IExlZSwgRGFuaWVsIC0gT0sgdG8gY29tbWl0IHRvIGRybS1taXNjLW5l
eHQgd2hlcmUgZmJkZXYgc3R1ZmYgaXMKPiA+ID4gbWFpbnRhaW5lZCB0b2RheT8KPiA+IAo+ID4g
YmFja2xpZ2h0IGlzIHNlcGFyYXRlIGZyb20gZmJkZXYgaW4gTGVlJ3Mgb3duIHRyZWUsIG5vdCBp
biBkcm0tbWlzYy4gSQo+ID4gdGhpbmsgYXQgbGVhc3QuCj4gCj4gVGhhdCdzIGNvcnJlY3QuICBX
ZSdsbCBzb3J0IHRoYXQgb25jZSB3ZSBoYXZlIGFsbCB0aGUgQWNrcy4KCldlIGhhdmUgYWNrcyBh
bGwgYXJvdW5kIG5vdy4KT0sgdGhhdCBJIGNvbW1pdCB0aGlzIHRvIGRybS1taXNjLW5leHQ/CgpU
aGlzIGlzIHdoZXJlIHdlIG1haW50YWluIGZiZGV2IHRoZXNlIGRheXMuIE9yIHlvdSBjb3VsZCBh
cHBseSBpdCB0bwp5b3VyIGJhY2tsaWdodCB0cmVlLgoKQm90aCBzb2x1dGlucyB3b3VsZCBiZSBm
aW5lIGFzIHRoZSByaXNrIG9mIGludHJvZHVjaW5nIG1lcmdlIGNvbmZsaWN0cwppbiB0aGVzZSBj
b2RlIHBhdGhzIGFyZSBtaW5pbWFsLgoKCVNhbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
