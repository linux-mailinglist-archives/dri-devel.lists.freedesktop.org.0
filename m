Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DFED03556E1
	for <lists+dri-devel@lfdr.de>; Tue,  6 Apr 2021 16:43:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93039898E8;
	Tue,  6 Apr 2021 14:43:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from vps.xff.cz (vps.xff.cz [195.181.215.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74591898E8
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Apr 2021 14:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=megous.com; s=mail;
 t=1617720185; bh=yfn/2Ls2uZcier/kQtma6DwvPfmcADTWwB6MXMslfV8=;
 h=Date:From:To:Cc:Subject:X-My-GPG-KeyId:References:From;
 b=mVp0tVUUyb64KaQajTBwe8gR/Fkxq1TKrg5TXyaXPVxRpMInsYEeoS/orGGE7utkh
 Zz4WmqjDNDzSv2XGqzRTZbf0ohqSKODpJwhsd7xhYeHY/q6JPu5Cv4gGgfL2nfrUbJ
 FwmQDMj6wTQMPLrA9YVmfb0Jc6oWA99Rp8eNLryI=
Date: Tue, 6 Apr 2021 16:43:04 +0200
From: =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>
To: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Subject: Re: [PATCH v5 1/2] dt-bindings: usb: add analogix,anx7688.yaml
Message-ID: <20210406144304.u2flatne2bxn5t3g@core>
X-My-GPG-KeyId: EBFBDDE11FB918D44D1F56C1F9F0A873BE9777ED
 <https://xff.cz/key.txt>
References: <20210305124351.15079-1-dafna.hirschfeld@collabora.com>
 <20210305124351.15079-2-dafna.hirschfeld@collabora.com>
 <YEJBgEPO4J5+/HhD@pendragon.ideasonboard.com>
 <35f505ee-d939-4b42-490b-321b961bdec3@collabora.com>
 <20210305172437.meu45ol7d4c3w2lr@core.my.home>
 <f90401b1-471b-c936-6661-d3d9c52abb2e@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f90401b1-471b-c936-6661-d3d9c52abb2e@collabora.com>
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
Cc: devicetree@vger.kernel.org, jernej.skrabec@siol.net, drinkcat@chromium.org,
 narmstrong@baylibre.com, airlied@linux.ie, enric.balletbo@collabora.com,
 linux-usb@vger.kernel.org, dri-devel@lists.freedesktop.org,
 a.hajda@samsung.com, jonas@kwiboo.se, robh+dt@kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, hsinyi@chromium.org,
 chunkuang.hu@kernel.org, kernel@collabora.com, dafna3@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBNYXIgMzEsIDIwMjEgYXQgMDc6MTY6NDBQTSArMDIwMCwgRGFmbmEgSGlyc2NoZmVs
ZCB3cm90ZToKPiBIaSwKPiAKPiBPbiAwNS4wMy4yMSAxODoyNCwgT25kxZllaiBKaXJtYW4gd3Jv
dGU6Cj4gPiBIZWxsbyBEYWZuYSwKPiA+IAoKWy4uLl0KCj4gPiA+ID4gPiArICB2Y29ubi1lbjEt
Z3Bpb3M6Cj4gPiA+ID4gPiArICAgIGRlc2NyaXB0aW9uOiBDb250cm9scyB0aGUgVkNPTk4gc3dp
dGNoIG9uIHRoZSBDQzEgcGluLgo+ID4gPiA+ID4gKyAgICBtYXhJdGVtczogMQo+ID4gPiA+ID4g
Kwo+ID4gPiA+ID4gKyAgdmNvbm4tZW4yLWdwaW9zOgo+ID4gPiA+ID4gKyAgICBkZXNjcmlwdGlv
bjogQ29udHJvbHMgdGhlIFZDT05OIHN3aXRjaCBvbiB0aGUgQ0MyIHBpbi4KPiA+ID4gPiA+ICsg
ICAgbWF4SXRlbXM6IDEKPiA+IAo+ID4gVkNPTk4gaXMgYSB2b2x0YWdlIHJlZ3VsYXRvciB0aGF0
IGNhbiBiZSBlbmFibGVkIGVpdGhlciBvbiBDQzEgb3IgQ0MyCj4gPiBwaW4sIG9yIGRpc2FibGVk
IGNvbXBsZXRlbHkuIFRoaXMgY29udHJvbCBpcyAqcGFydGlhbGx5KiBwZXJmb3JtZWQgaW4gcmVm
ZXJlbmNlCj4gPiBkZXNpZ24gZGlyZWN0bHkgYnkgdGhlIE9DTS4gT0NNIG9ubHkgZGVjaWRlcyB3
aGljaCBDQyBwaW4gdG8gc3dpdGNoCj4gPiB0aGUgVkNPTk4gcmVndWxhdG9yIHRvLCBhbmQgaW5m
b3JtcyB0aGUgU29DIHdoZW4gdGhlIGJhc2UgVkNPTk4gcmVndWxhdG9yCj4gPiBmb3IgdGhlIHN3
aXRjaGVzIG5lZWRzIHRvIGJlIGVuYWJsZWQuCj4gPiAKPiA+IFNvIHZjb25uLWVuMS8yIGdwaW9z
IGFyZSBpcnJlbGV2YW50IHRvIHRoZSBkcml2ZXIsIGJ1dCB0aGUgZHJpdmVyIG5lZWRzCj4gPiB0
byBjb250cm9sIFZDT05OIHBvd2VyIHN1cHBseSBzb21laG93IGFuZCBkZWZlciBjb250cm9sIG92
ZXIgaXQgdG8gdGhlIE9DTS4KPiA+IAo+ID4gSSBkb24ndCBrbm93IGhvdyB0byBleHByZXNzIGl0
IGluIHRoZSBiaW5kaW5ncy4gTWF5YmUgYSB2Y29ubi1zdXBwbHkgaGVyZQo+ID4gb24gdGhlIGFu
eDc2ODggbm9kZT8KPiA+IAo+ID4gSXQgbWF5IGFsc28gYmUgcGFydCBvZiB0aGUgdXNiLWNvbm5l
Y3RvciBiaW5kaW5nLCBidXQgdGhpcyBpcyByZWFsbHkgd2hlbiBpdAo+ID4gY29tZXMgdG8gYW54
NzY4OCBhIHBhcmVudCByZWd1bGF0b3IgZm9yIHRoZSBzd2l0Y2hlcywgYW5kIHN3aXRjaGVzIGFy
ZSBub3QKPiA+IGNvbnRyb2xsZWQgYnkgdGhpcyBkcml2ZXIsIGp1c3QgdGhlaXIgcGFyZW50IHJl
Z3VsYXRvciBpcy4KPiA+IAo+ID4gQW55IGlkZWFzPwo+IAo+IExvb2tpbmcgYXQgdGhlIGRpYWdy
YW0gaW4gdGhlIHNjaGVtYXRpY3MsIEkgc2VlIHRoYXQgYm90aCB2YnVzLXN1cHBseSBhbmQgdmNv
bm4tc3VwcGx5Cj4gY29tZSBkaXJlY3RseSBmcm9tIHRoZSBQTUlDIHNvIHNpbWlsYXJseSB0byB0
aGUgdmJ1cy1zdXBwbHksIHRoZSB2Y29ubi1zdXBwbHkKPiBjYW4gYmUgcGFydCBvZiB0aGUgdXNi
LWNvbm5lY3Rvci4gVGhlbiBhIGRyaXZlciBjYW4gYWNjZXNzIHRoZSB2Y29ubi1zdXBwbHkgZnJv
bSB0aGUgcmVtb3RlIHVzYgo+IGNvbm5lY3Rvci4gSXMgdGhlcmUgYSBwcm9ibGVtIHdpdGggdGhh
dD8KCk5vIHByb2JsZW0gd2l0aCB0aGF0LiB1c2ItYy1jb25uZWN0b3IgYmluZGluZyB3b3VsZCBq
dXN0IGhhdmUgdG8gYmUgZXh0ZW5kZWQuCgpJIGp1c3QgZG9uJ3Qgc2VlIGFueSBuZWVkIGZvciB0
aGVzZSBgdmNvbm4tZW4qLWdwaW9zYCwgYmVjYXVzZSB0aGUgY29udHJvbAppcyBwZXJmb3JtZWQg
ZGlyZWN0bHkgYnkgdGhlIE9DTSBmaXJtd2FyZSB2aWEgR1BJT3MgaW4gdGhlIEFOWDc2ODggY2hp
cCwKb3V0c2lkZSBvZiB0aGUgY29udHJvbCBvZiB0aGUgTGludXggZHJpdmVyLCBhbmQgdGhlIGRy
aXZlciBkb2Vzbid0IGV2ZW4gY2FyZQphYm91dCB0aGUgc3RhdHVzIG9mIHRoZXNlIHBpbnMuIEFu
ZCBpZiBpdCB3aWxsIGV2ZXIgY2FyZSwgdGhlIHN0YXR1cyBjYW4gYmUKcmVhZCB2aWEgSTJDIGZy
b20gdGhlIEFOWDc2ODggY2hpcCBkaXJlY3RseS4KCmtpbmQgcmVnYXJkcywKCW8uCgo+IFRoYW5r
cyBhIGxvdCBmb3IgdGhlIHJldmlldywgSSBhbSBub3QgdmVyeSBmYW1pbGlhciB3aXRoIHVzYiBh
bmQgdHlwZS1jLCBzbyB5b3VyIHJldmlldyBoZWxwcyBhIGxvdC4KPiBJIHdpbGwgc2VuZCB2NiBz
b29uLgo+IAo+IFRoYW5rcywKPiBEYWZuYQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVsCg==
