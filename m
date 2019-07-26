Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2403676454
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jul 2019 13:27:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F0BA6ED20;
	Fri, 26 Jul 2019 11:27:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69CC06ED20
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jul 2019 11:27:31 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 56D6A8044E;
 Fri, 26 Jul 2019 13:27:26 +0200 (CEST)
Date: Fri, 26 Jul 2019 13:27:25 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Daniel Thompson <daniel.thompson@linaro.org>
Subject: Re: [PATCH v1 1/1] backlight: drop EARLY_EVENT_BLANK support
Message-ID: <20190726112724.GB20065@ravnborg.org>
References: <20190725143224.GB31803@ravnborg.org>
 <20190726095016.wsj7jnni5zdh37dl@holly.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190726095016.wsj7jnni5zdh37dl@holly.lan>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=IkcTkHD0fZMA:10 a=7gkXJVJtAAAA:8
 a=KKAkSRfTAAAA:8 a=pGLkceISAAAA:8 a=hD80L64hAAAA:8 a=QyXUC8HyAAAA:8
 a=20KFwNOVAAAA:8 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=7YeqhBcuM1RsynUEvrIA:9
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
Cc: linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
 Gerd Hoffmann <kraxel@redhat.com>, Jingoo Han <jingoohan1@gmail.com>,
 Lee Jones <lee.jones@linaro.org>, Peter Rosin <peda@axentia.se>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRGFuaWVsLgoKT24gRnJpLCBKdWwgMjYsIDIwMTkgYXQgMTA6NTA6MTZBTSArMDEwMCwgRGFu
aWVsIFRob21wc29uIHdyb3RlOgo+IE9uIFRodSwgSnVsIDI1LCAyMDE5IGF0IDA0OjMyOjI0UE0g
KzAyMDAsIFNhbSBSYXZuYm9yZyB3cm90ZToKPiA+IFRoZXJlIHdhcyBubyB1c2VycyBsZWZ0IC0g
c28gZHJvcCB0aGUgY29kZSB0byBzdXBwb3J0IEVBUkxZX0ZCX0JMQU5LLgo+IAo+IFdoeSBhcmUg
d2UgdXNpbmcgYSBkaWZmZXJlbnQgbm91biBmb3IgdGhlIHN1YmplY3QgYW5kIGRlc2NyaXB0aW9u
PwpJIGZhdC1maW5nZXJlZCB0aGUgZGVzY3JpcHRpb24uCldpbGwgZml4IHdoZW4gSSBhcHBseSAt
IG9yIHNlbmQgb3V0IGEgdjIgaWYgcmVxdWVzdGVkLgoKLi4uCgo+ID4gCj4gPiBTaWduZWQtb2Zm
LWJ5OiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+Cj4gPiBDYzogTGVlIEpvbmVzIDxs
ZWUuam9uZXNAbGluYXJvLm9yZz4KPiA+IENjOiBEYW5pZWwgVGhvbXBzb24gPGRhbmllbC50aG9t
cHNvbkBsaW5hcm8ub3JnPgo+ID4gQ2M6IEppbmdvbyBIYW4gPGppbmdvb2hhbjFAZ21haWwuY29t
Pgo+ID4gQ2M6IEJhcnRsb21pZWogWm9sbmllcmtpZXdpY3ogPGIuem9sbmllcmtpZUBzYW1zdW5n
LmNvbT4KPiA+IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgo+ID4g
Q2M6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KPiA+IENjOiBNYWFydGVuIExhbmto
b3JzdCA8bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPgo+ID4gQ2M6ICJNaWNoYcWC
IE1pcm9zxYJhdyIgPG1pcnEtbGludXhAcmVyZS5xbXFtLnBsPgo+ID4gQ2M6IFBldGVyIFJvc2lu
IDxwZWRhQGF4ZW50aWEuc2U+Cj4gPiBDYzogR2VyZCBIb2ZmbWFubiA8a3JheGVsQHJlZGhhdC5j
b20+Cj4gPiBDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+ID4gQ2M6IGxpbnV4
LWZiZGV2QHZnZXIua2VybmVsLm9yZwo+IAo+IE90aGVyIHRoYW4gdGhlIHF1aWJibGUgYWJvdXQg
dGhlIGRlc2NyaXB0aW9uLi4uCj4gCj4gQWNrZWQtYnk6IERhbmllbCBUaG9tcHNvbiA8ZGFuaWVs
LnRob21wc29uQGxpbmFyby5vcmc+CgpUaGFua3MsCgoJU2FtCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
