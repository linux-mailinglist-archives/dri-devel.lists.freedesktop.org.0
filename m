Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14980C22E0
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2019 16:12:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF3E56E44A;
	Mon, 30 Sep 2019 14:12:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48E006E44C
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2019 14:12:39 +0000 (UTC)
Received: by mail-io1-xd43.google.com with SMTP id v2so38566324iob.10
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2019 07:12:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TwbrL/89iwEv92jYm3+TvZslhh9l3A55aKvB6WQE0Aw=;
 b=eN/8zaCPs65KO3Kqy9fx6yfGe3uXhZ5M0FgT39ju5DwUzXVbrrbWnju6aUI9GADymC
 Cxz6v1rfqYvIbd2G4ibM++nYJ500Nh+rr02nT4h3uHtzgJyTCR8YJquzB/NfvbiN50u9
 c3Ty/wXTZe8ahCWSFskcqwEVM0JyRjukZZ+H7zBlkFApyrL4b2cr9xb/LjExsIJq/gxe
 2aBIsaGMa48TvY8xMXR6KM2+HxH3rFenwGdWv6buqVeej6zU2GxV9KUdYERrkXKll27k
 1onn5TlD4XqgWlFcUClm0+9g1dv5Zix6TZWtXYT4ybGaoNTz1htAW1jVFI5YHMTj0kA3
 Yvpg==
X-Gm-Message-State: APjAAAWwKBSG/1bvw1mFF7R81HJjsUbv+VU4pJxlDJj86hSznXBRpO6o
 +wDpnHn9Icd2exzshFYBYdYxt1x7RsKo30ackBw=
X-Google-Smtp-Source: APXvYqzT4cmcRSDdeDHW9AaSxk6Y6BgQ1h4b2jWej/Uuk9wxv1qZFa5nMO4xL5BbZ4DoqS0rAqEMZmS6f+9SegZrRyk=
X-Received: by 2002:a5d:9c4c:: with SMTP id 12mr2054950iof.276.1569852758297; 
 Mon, 30 Sep 2019 07:12:38 -0700 (PDT)
MIME-Version: 1.0
References: <20190510194229.20628-1-aford173@gmail.com>
 <af325707-3e42-493d-e858-77878ef06138@ti.com>
 <CAHCN7xLzoCNW6q5yDCsqMHeNvdNegkGhd0N+q9+Gd8JUGbG=_g@mail.gmail.com>
 <7ada0752-6f65-2906-cb29-a47c9490fd57@ti.com>
 <CAHCN7xJexJvh71vyb31ETgo=n_y_CupHH-AZwVK9mZe3GzJfEQ@mail.gmail.com>
 <845055e2-8182-de74-2077-629fdf50ac6c@ti.com>
 <CAHCN7xJFrTLOnbqrnH2W_T2whR8Xji0EMNR_cy8GYkDV-JDodQ@mail.gmail.com>
 <854f6130-c8a8-81cb-aa76-4830f218ae54@ti.com>
 <CAHCN7xKocdiWOdmoWQV3POr84qte6WNt0QbQRAwxKSvU8COB_w@mail.gmail.com>
 <0473526e-df0a-94a5-5c22-debd0084ab16@ti.com>
 <36369388-e9c8-22cd-8c19-e2bdf2d0389b@ti.com>
 <eb2eb1f6-3c9b-7ecb-667e-819033af9c14@ti.com>
 <23eba53a-9304-2ceb-d97e-01891ec0b3ed@ti.com>
 <cb028b1e-05ca-9b22-be5d-c63f5fd56cc4@ti.com>
 <F3335195-6EB7-4D44-B884-2F29D9238011@goldelico.com>
 <CAHCN7xL9bFxO=2i1DzmRj6A3XwUNdt=DZeJ2a0EZ0f9gcFTy6g@mail.gmail.com>
 <CAHCN7x+vCfPTRE+zzYUwAXdbBzRotTP2hSOgsHB0FdgBhZV5zA@mail.gmail.com>
In-Reply-To: <CAHCN7x+vCfPTRE+zzYUwAXdbBzRotTP2hSOgsHB0FdgBhZV5zA@mail.gmail.com>
From: Adam Ford <aford173@gmail.com>
Date: Mon, 30 Sep 2019 09:12:26 -0500
Message-ID: <CAHCN7xJDV=R9Ysjhff7=mEXdciwPP_5LQbHwaUT8KvhSkLKw8A@mail.gmail.com>
Subject: Re: [PATCH] drm/omap: Migrate minimum FCK/PCK ratio from Kconfig to
 dts
To: "H. Nikolaus Schaller" <hns@goldelico.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=TwbrL/89iwEv92jYm3+TvZslhh9l3A55aKvB6WQE0Aw=;
 b=SRxCdHIK0riL2quHsjY50cpVIhRrFISodAZa537ifi6d7h07jLLeY4wUb1BpAcwAkj
 /PrzUswmM/rzM4rc/0QziHmYRfJRbM0sAR5PGPmCrDseIo6laabFzzPkxywUDwdr06eC
 VYxuyeDUt+2Uj425owP+L2qYUH5v6rxPWSsNoUkFm2t2t3OPEjYfiss73xCadi1J8Bj+
 b0oiZiG5WYANrMjalqsJfzT5IFOirXaTPfXNnIrM/u+FSbe8+Q3KUH89GrWeU235hIpn
 kf0sWTELgjeIqEfsUZ2fGb1+Bjyk/wY03XAse6vpmGCwkWdi9xspJrKomVk/qCaNAYar
 /ODg==
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
Cc: devicetree <devicetree@vger.kernel.org>, Tony Lindgren <tony@atomide.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Tero Kristo <t-kristo@ti.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
 Linux-OMAP <linux-omap@vger.kernel.org>, Adam Ford <adam.ford@logicpd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBTZXAgMzAsIDIwMTkgYXQgOTowNCBBTSBBZGFtIEZvcmQgPGFmb3JkMTczQGdtYWls
LmNvbT4gd3JvdGU6Cj4KPiBPbiBNb24sIFNlcCAzMCwgMjAxOSBhdCA4OjU0IEFNIEFkYW0gRm9y
ZCA8YWZvcmQxNzNAZ21haWwuY29tPiB3cm90ZToKPiA+Cj4gPiBPbiBNb24sIFNlcCAzMCwgMjAx
OSBhdCA4OjM5IEFNIEguIE5pa29sYXVzIFNjaGFsbGVyIDxobnNAZ29sZGVsaWNvLmNvbT4gd3Jv
dGU6Cj4gPiA+Cj4gPiA+Cj4gPiA+ID4gQW0gMzAuMDkuMjAxOSB1bSAxMDo1MyBzY2hyaWViIFRl
cm8gS3Jpc3RvIDx0LWtyaXN0b0B0aS5jb20+Ogo+ID4gPiA+Cj4gPiA+ID4gVGhlIGJlc3QgYWN0
aW9uIGhlcmUgaXMgcHJvYmFibHkgdG8gZHJvcCB0aGUgbWF4LWRpdiB2YWx1ZSBmb3IgdGhpcyBj
bG9jayB0byAxNi4gQ2FuIHNvbWVvbmUgY2hlY2sgdGhpcyB3aXRoIHRoZWlyIGRpc3BsYXkgc2V0
dXAgYW5kIHNlZSB3aGF0IGhhcHBlbnM/IEF0dGFjaGVkIHBhdGNoIHNob3VsZCBkbyB0aGUgdHJp
Y2suCj4gPiA+Cj4gPiA+IEkgaGF2ZSBjaGVja2VkIG9uIEdUQTA0IGFuZCBPcGVuUGFuZG9yYSAo
RE0zNzMwIHJlc3AuIE9NQVAzNDMwKSBhbmQgZGlkIG5vdCBub3RpY2UgYSBuZWdhdGl2ZSBlZmZl
Y3QuCj4gPiA+Cj4gPiA+IChXZWxsLCB3ZSBuZXZlciBzZWUgdGhlIHByb2JsZW0gdGhhdCBpcyBk
aXNjdXNzZWQgaGVyZSBhbmQgaGF2ZSBidWlsdCB3aXRoIENPTkZJR19PTUFQMl9EU1NfTUlOX0ZD
S19QRVJfUENLPTApLgo+ID4KPiA+IEkgaGF2ZSBuZXZlciBiZWVuIGFibGUgdG8gdXNlIENPTkZJ
R19PTUFQMl9EU1NfTUlOX0ZDS19QRVJfUENLPTAsIGJ1dAo+ID4gSSBhc3N1bWUgaXQncyBlaXRo
ZXIgYSBmdW5jdGlvbiBvZiBwY2sgb3IgYSBjb21iaW5hdGlvbiBvZiBwY2sgd2l0aAo+ID4gdGhl
IHJlc29sdXRpb24uCj4gPgo+ID4gQmFzZWQgb24gVG9taSdzIGNvbW1lbnQsIEkgYXNzdW1lIGhl
J3Mgd29ya2luZyBvbiB0aGUgZm9sbG93aW5nLiAgQ2FuCj4gPiB5b3UgYWxzbyB0cnk6Cj4gPgo+
ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL2Rzcy9kc3MuYwo+ID4gYi9k
cml2ZXJzL2dwdS9kcm0vb21hcGRybS9kc3MvZHNzLmMKPiA+IGluZGV4IDU3MTFiN2E3MjBlNi4u
NWU1ODRmMzJlYTZhIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vZHNz
L2Rzcy5jCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vb21hcGRybS9kc3MvZHNzLmMKPiA+IEBA
IC0xMDkwLDcgKzEwOTAsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGRzc19mZWF0dXJlcyBvbWFw
MzR4eF9kc3NfZmVhdHMgPSB7Cj4gPgo+ID4gIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHNzX2ZlYXR1
cmVzIG9tYXAzNjMwX2Rzc19mZWF0cyA9IHsKPiA+ICAgICAgICAgLm1vZGVsICAgICAgICAgICAg
ICAgICAgPSAgICAgICBEU1NfTU9ERUxfT01BUDMsCj4gPiAtICAgICAgIC5mY2tfZGl2X21heCAg
ICAgICAgICAgID0gICAgICAgMzIsCj4gPiArICAgICAgIC5mY2tfZGl2X21heCAgICAgICAgICAg
ID0gICAgICAgMTYsCj4gPiAgICAgICAgIC5mY2tfZnJlcV9tYXggICAgICAgICAgID0gICAgICAg
MTczMDAwMDAwLAo+ID4gICAgICAgICAuZHNzX2Zja19tdWx0aXBsaWVyICAgICA9ICAgICAgIDEs
Cj4gPiAgICAgICAgIC5wYXJlbnRfY2xrX25hbWUgICAgICAgID0gICAgICAgImRwbGw0X2NrIiwK
PiA+Cj4gPgo+ID4gSG9wZWZ1bGx5IGl0IGRvZXNuJ3QgYnJlYWsgdGhlIDM2MzAgZm9yIHlvdSwg
YnV0IGl0IGZpeGVkIG15IGlzc3VlCj4gPiB3aXRoIG5vIGJhY2sgdHJhY2U6Cj4gPgo+ID4gWyAg
ICA5LjkxNTU4OF0gRFNTOiBzZXQgZmNrIHRvIDU0MDAwMDAwCj4gPiBbICAgIDkuOTE1NjE4XSBE
SVNQQzogbGNrID0gNTQwMDAwMDAgKDEpCj4gPiBbICAgIDkuOTE1NjQ5XSBESVNQQzogcGNrID0g
OTAwMDAwMCAoNikKPiA+IFsgICAgOS45MTc2MzNdIERJU1BDOiBjaGFubmVsIDAgeHJlcyA0ODAg
eXJlcyAyNzIKPiA+IFsgICAgOS45MTc2NjNdIERJU1BDOiBwY2sgOTAwMDAwMAo+ID4KPiA+IEkg
ZG8gd29uZGVyLCBob3dldmVyIGlmIHRoZXJlIGlzIGEgZGl2aWRlciB0aGF0IGlzIGhpZ2hlciB0
aGFuIDE2LCBidXQKPiA+IGxvd2VyIHRoYW4gMzIuCj4gPiBJIHdhcyBhYmxlIHRvIHJ1biBmY2sg
YXQgMzZNSHogYmVmb3JlIHdpdGggZGl2aWRlIGJ5IDQgdG8gOU1Ieiwgc28gSQo+ID4gYW0gaG9w
aW5nIHRoYXQgYnkgcnVubmluZyBhdCA1NE1IeiAvIDYgZG9lc24ndCBkcmF3IG1vcmUgcG93ZXIu
ICBJIHdhcwo+ID4gcmVhZGluZyB0aHJvdWdoIHRoZSBkYXRhc2hlZXQsIGJ1dCBJIGNvdWxkIG5v
dCBmaW5kIGFueSByZWZlcmVuY2UgdG8KPiA+IHRoZSBtYXggZGl2aWRlci4KPiA+Cj4KPiBGb3Ig
cnVuLCBJIHRlc3RlZCBhIG1heCBkaXZpZGVyIG9mIDI3LCBhbmQgSSB3YXMgYWJsZSB0byBnZXQg
aXQKPiBmdW5jdGlvbmFsIHdpdGggYSBzbG93ZXIgZmNrCj4KPiBbICAgIDkuOTM5MDU2XSBEU1M6
IHNldCBmY2sgdG8gMzYwMDAwMDAKPiBbICAgIDkuOTM5MDg2XSBESVNQQzogbGNrID0gMzYwMDAw
MDAgKDEpCj4gWyAgICA5LjkzOTA4Nl0gRElTUEM6IHBjayA9IDkwMDAwMDAgKDQpCj4gWyAgICA5
Ljk0MTMxNF0gRElTUEM6IGNoYW5uZWwgMCB4cmVzIDQ4MCB5cmVzIDI3Mgo+IFsgICAgOS45NDEz
MTRdIERJU1BDOiBwY2sgOTAwMDAwMAo+IFsgICAgOS45NDEzMTRdIERJU1BDOiBoc3luY19sZW4g
NDIgaGZwIDMgaGJwIDIgdnN3IDExIHZmcCAyIHZicCAzCj4gWyAgICA5Ljk0MTMxNF0gRElTUEM6
IHZzeW5jX2xldmVsIDEgaHN5bmNfbGV2ZWwgMSBkYXRhX3BjbGtfZWRnZSAxCj4gZGVfbGV2ZWwg
MSBzeW5jX3BjbGtfZWRnZSAtMQo+IFsgICAgOS45NDEzNDVdIERJU1BDOiBoc3luYyAxNzA3N0h6
LCB2c3luYyA1OUh6Cj4KPgo+IEkgZG9uJ3Qga25vdyB0aGUgaW1wbGljYXRpb25zLCBzbyBpZiB0
aGUgcGVvcGxlIGZyb20gVEkgc2F5IHN0aWNrIHdpdGgKPiAxNiwgSSdtIGZpbmUgd2l0aCB0aGF0
LCBidXQgYXQgbGVhc3QgdGhlcmUgaXMgc29tZSBldmlkZW5jZSB0aGF0IGl0Cj4gY2FuIGJlIGhp
Z2hlciB0aGFuIDE2LCBidXQgbG93ZXIgdGhhbiAzMi4KPgoKU29ycnkgZm9yIGFsbCB0aGUgc3Bh
bSwgYnV0IEkgbW92ZWQgYm90aCBvZiB0aGVtIHRvIDMxIGZyb20gMzIsIGFuZCBpdAphbHNvIHNl
ZW1zIHRvIHdvcmsgc3VjY2Vzc2Z1bGx5IGF0IDMxLgoKWyAgIDI2LjkyMzAwNF0gRFNTOiBzZXQg
ZmNrIHRvIDM2MDAwMDAwClsgICAyNi45MjMwMzRdIERJU1BDOiBsY2sgPSAzNjAwMDAwMCAoMSkK
WyAgIDI2LjkyMzAzNF0gRElTUEM6IHBjayA9IDkwMDAwMDAgKDQpClsgICAyNi45MjUwNDhdIERJ
U1BDOiBjaGFubmVsIDAgeHJlcyA0ODAgeXJlcyAyNzIKWyAgIDI2LjkyNTA0OF0gRElTUEM6IHBj
ayA5MDAwMDAwClsgICAyNi45MjUwNDhdIERJU1BDOiBoc3luY19sZW4gNDIgaGZwIDMgaGJwIDIg
dnN3IDExIHZmcCAyIHZicCAzClsgICAyNi45MjUwNzldIERJU1BDOiB2c3luY19sZXZlbCAxIGhz
eW5jX2xldmVsIDEgZGF0YV9wY2xrX2VkZ2UgMQpkZV9sZXZlbCAxIHN5bmNfcGNsa19lZGdlIC0x
ClsgICAyNi45MjUwNzldIERJU1BDOiBoc3luYyAxNzA3N0h6LCB2c3luYyA1OUh6ClsgICAyNy4z
ODQ2MTNdIERJU1BDOiBkaXNwY19ydW50aW1lX3B1dAoKSXMgaXQgcG9zc2libGUgdG8gdXNlIDMx
PwoKYWRhbQoKPiBhZGFtCj4KPiA+IGFkYW0KPiA+ID4KPiA+ID4gQlIsCj4gPiA+IE5pa29sYXVz
Cj4gPiA+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
