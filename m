Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 668B99E911
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2019 15:20:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFE0D898BF;
	Tue, 27 Aug 2019 13:20:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BDD6898BF
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2019 13:20:18 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 22D45283C8B;
 Tue, 27 Aug 2019 14:20:16 +0100 (BST)
Date: Tue, 27 Aug 2019 15:20:13 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v2 17/21] drm/imx: pd: Use bus format/flags provided by
 the bridge when available
Message-ID: <20190827152013.0d7aff4e@collabora.com>
In-Reply-To: <1566910280.4102.10.camel@pengutronix.de>
References: <20190826152649.13820-1-boris.brezillon@collabora.com>
 <20190826152649.13820-18-boris.brezillon@collabora.com>
 <1566893719.4102.1.camel@pengutronix.de>
 <20190827104353.1447e5ba@collabora.com>
 <1566897782.4102.6.camel@pengutronix.de>
 <20190827115706.1e172a63@collabora.com>
 <1566910280.4102.10.camel@pengutronix.de>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
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
Cc: Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, dri-devel@lists.freedesktop.org,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>, Chris Healy <Chris.Healy@zii.aero>,
 kernel@collabora.com, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAyNyBBdWcgMjAxOSAxNDo1MToyMCArMDIwMApQaGlsaXBwIFphYmVsIDxwLnphYmVs
QHBlbmd1dHJvbml4LmRlPiB3cm90ZToKIAo+IFsuLi5dCj4gPiA+ID4gSSBjYW4gZG8gdGhhdCBp
ZiB5b3UgbGlrZS4gTm90ZSB0aGF0IHdlIGFyZSBmb3J3YXJkaW5nCj4gPiA+ID4gdGhlIC0+b3V0
cHV0X2J1c19jZmcuZm10IHZhbHVlIHRvIHRoZSBJUFUgREksIG5vdCAtPmlucHV0X2J1c19jZmcu
Zm10Lgo+ID4gPiA+IEkganVzdCBhc3N1bWVkIHRoYXQgaW5wdXQgZm9ybWF0IHdvdWxkbid0IGJl
IHVzZWQgaW4gdGhlIGR1bW15IGJyaWRnZQo+ID4gPiA+IGVsZW1lbnQgKHRoZSBvbmUgZW1iZWRk
ZWQgaW4gdGhlIGVuY29kZXIpIHNpbmNlIGVuY29kZXJzIG9ubHkgaGF2ZSBhbgo+ID4gPiA+IG91
dHB1dCBlbmQgKGlucHV0IHBvcnQgaXMgbGlrZWx5IHRvIGJlIGEgU29DIHNwZWNpZmljIGxpbmsg
YmV0d2VlbiB0aGUKPiA+ID4gPiBDUlRDIGFuZCB0aGUgZW5jb2RlciB3aGljaCB3ZSBwcm9iYWJs
eSBkb24ndCBuZWVkL3dhbnQgdG8gZXhwb3NlKS4gICAgCj4gPiA+IAo+ID4gPiBUaGVuIHdoeSAo
d291bGQgdGhpcyBkcml2ZXIgaGF2ZSB0bykgaW1wbGVtZW50IGdldF9pbnB1dF9mbXRzIGF0IGFs
bD8gIAo+ID4gCj4gPiBUaGF0J3MgdGhlIG9ubHkgd2F5IHdlIGNhbiBjaGVjayBpZiBhbiBvdXRw
dXQgZm9ybWF0IGlzIHN1cHBvcnRlZDogYnVzCj4gPiBmb3JtYXQgbmVnb3RpYXRpb24gaXMgYmFz
ZWQgb24gYSB0cmlhbCBhbmQgZXJyb3IgbG9naWMgdGhhdCBzdGFydHMgZnJvbQo+ID4gdGhlIGVu
ZCBvZiB0aGUgcGlwZWxpbmUgKGxhc3QgYnJpZGdlIGVsZW1lbnQpIGFuZCBnb2VzIGJhY2t3YXJk
IHVudGlsCj4gPiBpdCByZWFjaGVzIHRoZSBmaXJzdCBicmlkZ2UgKHRoZSBkdW1teSBlbmNvZGVy
IGJyaWRnZSkuIEEgYnVzIGZvcm1hdAo+ID4gc2V0dGluZyBpcyB2YWxpZGF0ZWQgd2hlbiBhbGwg
LT5nZXRfaW5wdXRfYnVzX2ZtdHMoKSBob29rcyByZXR1cm5lZCBhdAo+ID4gbGVhc3Qgb25lIHBv
c3NpYmxlIGZvcm1hdCAoKm51bV9pbnB1dF9mb3JtYXRzID4gMCkgZm9yIHRoZSBvdXRwdXQgZm9y
bWF0Cj4gPiBiZWluZyB0ZXN0ZWQgYnkgdGhlIG5leHQgZWxlbWVudCBpbiB0aGUgY2hhaW4uIEFu
ZCB0aGF0J3Mgd2h5IGV2ZW4gdGhlCj4gPiBkdW1teSBlbmNvZGVyIGJyaWRnZSBoYXMgdG8gaW1w
bGVtZW50IHRoaXMgaG9vayB1bmxlc3MgaXQgb25seSBzdXBwb3J0cwo+ID4gb25lIG91dHB1dCBm
b3JtYXQgKHRoZSBjb3JlIHJldHVybnMgTUVESUFfQlVTX0ZNVF9GSVhFRCB3aGVuICAKPiA+IC0+
Z2V0X2lucHV0X2J1c19mbXRzIGlzIE5VTEwpLiAgCj4gCj4gVGhpcyBmdW5jdGlvbiAoY3VycmVu
dGx5KSBhbHNvIG9ubHkgcmV0dXJucyBNRURJQV9CVVNfRk1UX0ZJWEVELCBzbwo+IHRoZXJlIGlz
IG5vIGRpZmZlcmVuY2UgaW4gcmV0dXJuIHZhbHVlIChpZiBxdWVyaWVkIHdpdGggYSBzdXBwb3J0
ZWQKPiBvdXRwdXRfZm10KS4KClRoZXJlJ3MgYSBzbWFsbCBkaWZmZXJlbmNlIGFjdHVhbGx5OiB3
aGVuIG91dHB1dF9mbXQgIT0KTUVESUFfQlVTX0ZNVF9GSVhFRCwgd2UgbWFrZSBzdXJlIG91dHB1
dF9mbXQgaXMgc29tZXRoaW5nIHdlIHN1cHBvcnQuIElmCnlvdSBkb24ndCBpbXBsZW1lbnQgLT5n
ZXRfaW5wdXRfYnVzX2ZtdHMoKSB5b3UnbGwganVzdCBhY2NlcHQgYW55IGZvcm1hdApyZXF1ZXN0
ZWQgYnkgdGhlIG5leHQgZWxlbWVudCBpbiB0aGUgcGlwZWxpbmUuCgo+IHNlbGVjdF9idXNfZm10
X3JlY3Vyc2l2ZSBjb3VsZCBqdXN0IGNoZWNrIGF0b21pY19nZXRfb3V0cHV0X2J1c19mbXRzIGlm
Cj4gdGhhdCBpcyBpbXBsZW1lbnRlZCwgYnV0IGF0b21pY19nZXRfaW5wdXRfYnVzX2ZtdHMgaXNu
J3QuCgpJJ2QgbGlrZSB0byB1c2UgLT5nZXRfb3V0cHV0X2J1c19mbXRzKCkgb25seSB0byByZXRy
aWV2ZSBzdXBwb3J0ZWQKb3V0cHV0IGZvcm1hdHMgb24gdGhlIGxhc3QgYnJpZGdlIGVsZW1lbnQs
IG90aGVyd2lzZSBpdCBtYWtlcyB0aGUKd2hvbGUgdGhpbmcgZXZlbiBtb3JlIGNvbXBsZXguCgo+
IAo+IFRoYXQgcG9pbnQgaXMgbW9vdCB0aG91Z2gsIGlmIHdlIHByb3BhZ2F0ZSB0aGUgb3V0cHV0
IGZvcm1hdCB0byB0aGUKPiBpbnB1dCBmb3JtYXQuCgpJJ2xsIGRvIHRoYXQgdGhlbiAoYW5kIG1h
bmRhdGUgdGhhdCBhbGwgZW5jb2RlciBkcml2ZXJzIGRvIHRoZSBzYW1lKS4KCj4gCj4gWy4uLl0K
PiA+ID4gPiBBcyBzYWlkIGFib3ZlLCB3ZSBuZWVkIGEgd2F5IHRvIHN1cHBvcnQgYnJpZGdlIGNo
YWlucyB3aGVyZSBub3QgYWxsCj4gPiA+ID4gZWxlbWVudHMgc3VwcG9ydCBuZWdvdGlhdGluZyB0
aGUgYnVzIGZvcm1hdCwgdGhhdCdzIHdoYXQgdGhpcyBmYWxsYmFjawo+ID4gPiA+IGlzIGZvciwg
YnV0IG1heWJlIDAgaXMgbm90IGFuIGFwcHJvcHJpYXRlIHZhbHVlIHRvIG1lYW4gJ3BpY2sgdGhl
Cj4gPiA+ID4gZGVmYXVsdCBmb3JtYXQnLiAgICAKPiA+ID4gCj4gPiA+IFdlJ2QgYWN0dWFsbHkg
aGF2ZSB0byBwaWNrIG9uZSBoZXJlLiBJZiBzZXQsIHRoYXQgc2hvdWxkIGJlCj4gPiA+IGlteHBk
LT5idXNfZm9ybWF0LiAgCj4gPiAKPiA+IFdoYXQgaWYgaW14cGQtPmJ1c19mb3JtYXQgaXMgMD8g
U2hvdWxkIEkgcmV0dXJuIC1FSU5WQUw/ICAKPiAKPiBJIHRoaW5rIHNvLiBUaGF0IHdvdWxkIGNl
cnRhaW5seSBiZSBlYXNpZXIgdG8gZGVidWcgdGhhbiAic3RyYW5nZQo+IGNvbG91cnMiIHdoZW4g
aG9va2luZyB1cCBhIGJyaWRnZSB0aGF0IGlzIGluY29tcGF0aWJsZSB3aXRoIHdoYXRldmVyCj4g
d2UnZCBjaG9vc2UuCgpPa2F5LgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
