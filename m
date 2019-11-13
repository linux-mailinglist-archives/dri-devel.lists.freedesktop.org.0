Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B553AFB535
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2019 17:35:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C1E16E38A;
	Wed, 13 Nov 2019 16:35:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 174666E38A
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2019 16:35:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: aratiu) with ESMTPSA id 388EA28E964
From: Adrian Ratiu <adrian.ratiu@collabora.com>
To: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [PATCH v2 1/4] drm: bridge: dw_mipi_dsi: access registers via a
 regmap
In-Reply-To: <CACvgo51sNzSHCcix89giYEq=iGJa_-nYbgpOKY-MxPRGCM_cRQ@mail.gmail.com>
References: <20191106163031.808061-1-adrian.ratiu@collabora.com>
 <20191106163031.808061-2-adrian.ratiu@collabora.com>
 <CACvgo51sNzSHCcix89giYEq=iGJa_-nYbgpOKY-MxPRGCM_cRQ@mail.gmail.com>
Date: Wed, 13 Nov 2019 18:35:30 +0200
Message-ID: <87r22bhgz1.fsf@iwork.i-did-not-set--mail-host-address--so-tickle-me>
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, "Linux-Kernel@Vger. Kernel.
 Org" <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 linux-rockchip <linux-rockchip@lists.infradead.org>,
 Boris Brezillon <boris.brezillon@collabora.com>, kernel@collabora.com,
 linux-stm32@st-md-mailman.stormreply.com,
 LAKML <linux-arm-kernel@lists.infradead.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAxMyBOb3YgMjAxOSwgRW1pbCBWZWxpa292IDxlbWlsLmwudmVsaWtvdkBnbWFpbC5j
b20+IAp3cm90ZToKPiBPbiBXZWQsIDYgTm92IDIwMTkgYXQgMTY6MzAsIEFkcmlhbiBSYXRpdSAK
PiA8YWRyaWFuLnJhdGl1QGNvbGxhYm9yYS5jb20+IHdyb3RlOiAKPj4gCj4+IENvbnZlcnQgdGhl
IGNvbW1vbiBicmlkZ2UgY29kZSBhbmQgdGhlIHR3byByb2NrY2hpcCAmIHN0bSAKPj4gZHJpdmVy
cyB3aGljaCBjdXJyZW50bHkgdXNlIGl0IHRvIHRoZSByZWdtYXAgQVBJIGluIAo+PiBhbnRpY2lw
YXRpb24gZm9yIGZ1cnRoZXIgY2hhbmdlcyB0byBtYWtlIGl0IG1vcmUgZ2VuZXJpYyBhbmQgCj4+
IGFkZCBvbGRlciBEU0kgaG9zdCBjb250cm9sbGVyIHN1cHBvcnQgYXMgZm91bmQgb24gaS5teDYg
YmFzZWQgCj4+IGRldmljZXMuIAo+PiAKPj4gVGhlIHJlZ21hcCBiZWNvbWVzIGFuIGludGVybmFs
IHN0YXRlIG9mIHRoZSBicmlkZ2UuIE5vIAo+PiBmdW5jdGlvbmFsIGNoYW5nZXMgb3RoZXIgdGhh
biByZXF1aXJpbmcgdGhlIHBsYXRmb3JtIGRyaXZlcnMgdG8gCj4+IHVzZSB0aGUgcHJlLWNvbmZp
Z3VyZWQgcmVnbWFwIHN1cHBsaWVkIGJ5IHRoZSBicmlkZ2UgYWZ0ZXIgaXRzIAo+PiBwcm9iZSgp
IGNhbGwgaW5zdGVhZCBvZiBpb3JlbXAnaW5nIHRoZSByZWdpc3RlcnMgdGhlbXNlbHZlcy4gCj4+
IAo+PiBJbiBzdWJzZXF1ZW50IGNvbW1pdHMgdGhlIGJyaWRnZSB3aWxsIGJlY29tZSBhYmxlIHRv
IGRldGVjdCB0aGUgCj4+IERTSSBob3N0IGNvcmUgdmVyc2lvbiBhbmQgaW5pdCB0aGUgcmVnbWFw
IHdpdGggZGlmZmVyZW50IAo+PiByZWdpc3RlciBsYXlvdXRzLiBUaGUgcGxhdGZvcm0gZHJpdmVy
cyB3aWxsIGNvbnRpbnVlIHRvIHVzZSB0aGUgCj4+IHJlZ21hcCB3aXRob3V0IG1vZGlmaWNhdGlv
bnMgb3Igd29ycnlpbmcgYWJvdXQgdGhlIHNwZWNpZmljIAo+PiBsYXlvdXQgaW4gdXNlIChpbiBv
dGhlciB3b3JkcyB0aGUgbGF5b3V0IGlzIGFic3RyYWN0ZWQgYXdheSB2aWEgCj4+IHRoZSByZWdt
YXApLiAKPj4gCj4+IFN1Z2dlc3RlZC1ieTogQm9yaXMgQnJlemlsbG9uIDxib3Jpcy5icmV6aWxs
b25AY29sbGFib3JhLmNvbT4gCj4+IFJldmlld2VkLWJ5OiBOZWlsIEFybXN0cm9uZyA8bmFybXN0
cm9uZ0BiYXlsaWJyZS5jb20+IAo+PiBSZXZpZXdlZC1ieTogRW1pbCBWZWxpa292IDxlbWlsLmwu
dmVsaWtvdkBnbWFpbC5jb20+IAo+IAo+IEkgc2hvdWxkIGhhdmUgYmVlbiBjbGVhcmVyIGVhcmxp
ZXIgLSBJIGRpZG4ndCBxdWl0ZSByZXZpZXcgdGhlIAo+IHBhdGNoLiAgSXMgaXMgbm93IHRob3Vn
aC4gIFJldmlld2VkLWJ5OiBFbWlsIFZlbGlrb3YgCj4gPGVtaWwudmVsaWtvdkBjb2xsYWJvcmEu
Y29tPgoKU29ycnkgYWJvdXQgdGhhdCwgSSBnb3QgY29uZnVzZWQgYW5kIHRob3VnaHQgeW91IHJl
dmlld2VkIGl0IGFsbC4KIAo+IAo+IEFkbWl0dGVkbHkgYSBjb3VwbGUgb2Ygbml0cGlja3MgKERS
SVZFUl9OQU1FLCB6ZXJvIGluaXRpYWxpemUgb2YgCj4gdmFsKSBjb3VsZCBoYXZlIGJlZW4gbGVm
dCBvdXQuICBJdCdzIG5vdCBhIGJpZyBkZWFsLCB0aGVyZSdzIG5vIAo+IG5lZWQgdG8gcG9saXNo
IHRob3NlLgoKSSdsbCBhZGRyZXNzIHRoZW0gaW4gdjMgYXMgd2VsbCBhcyB1cGRhdGluZyB5b3Vy
IG1haWwgYWRkcmVzcy4KClRoYW5rcyBmb3IgcmV2aWV3aW5nIQoKPgo+IC1FbWlsCj4KPiBfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGxpbnV4LWFybS1r
ZXJuZWwgbWFpbGluZyBsaXN0Cj4gbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3Jn
Cj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hcm0t
a2VybmVsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
