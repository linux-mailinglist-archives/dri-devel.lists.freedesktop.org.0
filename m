Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 781D1EB7CB
	for <lists+dri-devel@lfdr.de>; Thu, 31 Oct 2019 20:10:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 114176E127;
	Thu, 31 Oct 2019 19:10:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CF526E127
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2019 19:10:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: aratiu) with ESMTPSA id 5E60A290B9B
From: Adrian Ratiu <adrian.ratiu@collabora.com>
To: Emil Velikov <emil.l.velikov@gmail.com>, Adrian Ratiu
 <adrian.ratiu@collabora.com>
Subject: Re: [PATCH 0/4] Genericize DW MIPI DSI bridge and add i.MX 6 driver
In-Reply-To: <CACvgo50NmofJrCvADOTxJqJqKEWDsy8qD-1B6R356vFMcmdbWA@mail.gmail.com>
References: <20191031142633.12460-1-adrian.ratiu@collabora.com>
 <CACvgo50NmofJrCvADOTxJqJqKEWDsy8qD-1B6R356vFMcmdbWA@mail.gmail.com>
Date: Thu, 31 Oct 2019 21:10:48 +0200
Message-ID: <87y2x091dz.fsf@iwork.i-did-not-set--mail-host-address--so-tickle-me>
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
Cc: "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 linux-rockchip <linux-rockchip@lists.infradead.org>, kernel@collabora.com,
 linux-stm32@st-md-mailman.stormreply.com,
 LAKML <linux-arm-kernel@lists.infradead.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAzMSBPY3QgMjAxOSwgRW1pbCBWZWxpa292IDxlbWlsLmwudmVsaWtvdkBnbWFpbC5j
b20+IAp3cm90ZToKPiBIaSBBZHJpYW4sIAoKSGkgRW1pbCEKCj4gCj4gT24gVGh1LCAzMSBPY3Qg
MjAxOSBhdCAxNDoyNiwgQWRyaWFuIFJhdGl1IAo+IDxhZHJpYW4ucmF0aXVAY29sbGFib3JhLmNv
bT4gd3JvdGU6IAo+PiAKPj4gSGF2aW5nIGEgZ2VuZXJpYyBTeW5vcHNpcyBEZXNpZ25XYXJlIE1J
UEktRFNJIGhvc3QgY29udHJvbGxlciAKPj4gYnJpZGdlIGRyaXZlciBpcyBhIHZlcnkgZ29vZCBp
ZGVhLCBob3dldmVyIHRoZSBjdXJyZW50IAo+PiBpbXBsZW1lbnRhdGlvbiBoYXMgaGFyZGNvZGVk
IHF1aXRlIGEgbG90IG9mIHRoZSByZWdpc3RlciAKPj4gbGF5b3V0cyB1c2VkIGJ5IHRoZSB0d28g
c3VwcG9ydGVkIFNvQyB2ZW5kb3JzLCBTVE0gYW5kIAo+PiBSb2NrY2hpcCwgd2hpY2ggdXNlIElQ
IGNvcmVzIHYxLjMwIGFuZCB2MS4zMS4gCj4+IAo+PiBUaGlzIG1ha2VzIGl0IGhhcmQgdG8gc3Vw
cG9ydCBvdGhlciBTb0MgdmVuZG9ycyBsaWtlIHRoZSAKPj4gRlNML05YUCBpLk1YIDYgd2hpY2gg
dXNlIG9sZGVyIHYxLjAxIGNvcmVzIG9yIGZ1dHVyZSB2ZXJzaW9ucyAKPj4gYmVjYXVzZSwgYmFz
ZWQgb24gaGlzdG9yeSwgbGF5b3V0IGNoYW5nZXMgc2hvdWxkIGFsc28gYmUgCj4+IGV4cGVjdGVk
IGluIG5ldyBEU0kgdmVyc2lvbnMgLyBTb0NzLiAKPj4gCj4+IFRoaXMgcGF0Y2ggc2VyaWVzIGNv
bnZlcnRzIHRoZSBicmlkZ2UgYW5kIHBsYXRmb3JtIGRyaXZlcnMgdG8gCj4+IGFjY2VzcyByZWdp
c3RlcnMgdmlhIGdlbmVyaWMgcmVnbWFwIEFQSXMgYW5kIGFsbG93cyBlYWNoIAo+PiBwbGF0Zm9y
bSBkcml2ZXIgdG8gY29uZmlndXJlIGl0cyByZWdpc3RlciBsYXlvdXQgdmlhIHN0cnVjdCAKPj4g
cmVnX2ZpZWxkcywgdGhlbiBhZGRzIHN1cHBvcnQgZm9yIHRoZSBob3N0IGNvbnRyb2xsZXIgZm91
bmQgb24gCj4+IGkuTVggNi4gCj4+IAo+IEhhdmUgeW91IGNvbnNpZGVyZWQga2VlcGluZyB0aGUg
ZGlmZmVyZW5jZSBpbnRlcm5hbCB0byB0aGUgCj4gZHctbWlwaS1kc2kgZHJpdmVyPyAgU2F5IGhh
dmluZyB0aGUgaU1YNiBtb2R1bGUgInJlcXVlc3QiIHRoZSAKPiB2MS4wMSByZWdtYXAgZnJvbSB0
aGUgYnJpZGdlIGRyaXZlciwgd2hpbGUgcm9ja2NoaXAvb3RoZXJzIGRvaW5nIAo+IHRoZSBlcXVp
dmFsZW50LgoKTm8sIEkgaGF2ZW4ndC4gSXQgc291bmRzIGxpa2UgYSBnb29kIGlkZWEgdGhvdWdo
IGFuZCBJIHRoaW5rIGl0J3MgCmRvYWJsZS4gVGhhbmsgeW91IQogCj4gCj4+ICAuLi4vYmluZGlu
Z3MvZGlzcGxheS9pbXgvbWlwaS1kc2kudHh0ICAgICAgICAgfCAgNTYgKysgCj4+ICBkcml2ZXJz
L2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LW1pcGktZHNpLmMgfCA1MTggCj4+ICArKysrKysr
KystLS0tLS0tLS0gZHJpdmVycy9ncHUvZHJtL2lteC9LY29uZmlnIAo+PiAgfCAgIDcgKyBkcml2
ZXJzL2dwdS9kcm0vaW14L01ha2VmaWxlICAgICAgICAgICAgICAgICAgfCAgIDEgKyAKPj4gIGRy
aXZlcnMvZ3B1L2RybS9pbXgvZHdfbWlwaV9kc2ktaW14LmMgICAgICAgICB8IDUwMiAKPj4gICsr
KysrKysrKysrKysrKysrIC4uLi9ncHUvZHJtL3JvY2tjaGlwL2R3LW1pcGktZHNpLXJvY2tjaGlw
LmMgCj4+ICB8IDE1NCArKysrKy0gZHJpdmVycy9ncHUvZHJtL3N0bS9kd19taXBpX2RzaS1zdG0u
YyAgICAgICAgIHwgCj4+ICAxNjAgKysrKystIGluY2x1ZGUvZHJtL2JyaWRnZS9kd19taXBpX2Rz
aS5oICAgICAgICAgICAgICB8ICA2MCAKPj4gICstIDggZmlsZXMgY2hhbmdlZCwgMTE4NSBpbnNl
cnRpb25zKCspLCAyNzMgZGVsZXRpb25zKC0pIAo+PiAgY3JlYXRlIG1vZGUgMTAwNjQ0IAo+PiAg
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvaW14L21pcGktZHNpLnR4
dCAKPj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vaW14L2R3X21pcGlfZHNp
LWlteC5jIAo+PiAKPiAKPiBUaGlzIHNob3VsZCBtYWtlIHRoZSBkZWx0YSBhIGxvdCBzbWFsbGVy
LCBhdm9pZGluZyB0aGUgCj4gdW5uZWNlc3NhcnkgY29weSBvZiByZWdpc3RlciBmaWVsZHMgYW5k
IHJlZ21hcC4gIFBsdXMgcGx1Z2dpbmcgCj4gZnV0dXJlIHVzZXJzIHdpbGwgYmUgZGVhZCB0cml2
aWFsLgoKQWdyZWVkLiBJJ2xsIGRvIHRoaXMgaW4gdjIgdW5sZXNzIHNvbWVvbmUgb2JqZWN0cyBv
ciBwcm9wb3NlcyBhIApiZXR0ZXIgYWx0ZXJuYXRpdmUuCgpJJ2xsIGxldCB0aGlzIHNlcmllcyBz
aXQgYSBsaXR0bGUgbW9yZSBvbiByZXZpZXcgc28gb3RoZXJzIGhhdmUgYSAKY2hhbmNlIHRvIHNl
ZSBhbmQgcmV2aWV3OyB3aWxsIGFkZHJlc3MgYWxsIGZlZWRiYWNrIGluIHYyLgoKPgo+IC1FbWls
Cj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IExp
bnV4LXJvY2tjaGlwIG1haWxpbmcgbGlzdAo+IExpbnV4LXJvY2tjaGlwQGxpc3RzLmluZnJhZGVh
ZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJvY2tjaGlwCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
