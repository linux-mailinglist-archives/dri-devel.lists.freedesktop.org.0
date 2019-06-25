Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A2DC55158
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2019 16:15:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FE586E115;
	Tue, 25 Jun 2019 14:15:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E47916E115
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 14:15:30 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com
 [209.85.222.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9665E215EA
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 14:15:30 +0000 (UTC)
Received: by mail-qk1-f173.google.com with SMTP id b18so12672055qkc.9
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 07:15:30 -0700 (PDT)
X-Gm-Message-State: APjAAAVdpa0kvAVH82dfPjMMj/jU0BvbcMFLEpm/E7GOhFt4sYS6buX8
 ruU21so0kiaPcq74UxbV/IoTOrdMzohyqetF7g==
X-Google-Smtp-Source: APXvYqxa6TVufszE/k5zs2VqtcN0LZDhjRXpJC1lxui07oIGK8cq4yrxwm2/cWvAG89bDUtj9YcBt3/wHOVAhSm8bTM=
X-Received: by 2002:a37:a48e:: with SMTP id
 n136mr55002727qke.223.1561472129808; 
 Tue, 25 Jun 2019 07:15:29 -0700 (PDT)
MIME-Version: 1.0
References: <20190624215649.8939-1-robh@kernel.org>
 <20190624215649.8939-7-robh@kernel.org>
 <20190625075542.u5kzex4cbrcss5ga@flea>
In-Reply-To: <20190625075542.u5kzex4cbrcss5ga@flea>
From: Rob Herring <robh@kernel.org>
Date: Tue, 25 Jun 2019 08:15:18 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+OgNgS7yVgZaVLEo6=OeS9R9ebgBpUbPxz609C7G9oOw@mail.gmail.com>
Message-ID: <CAL_Jsq+OgNgS7yVgZaVLEo6=OeS9R9ebgBpUbPxz609C7G9oOw@mail.gmail.com>
Subject: Re: [PATCH v2 06/15] dt-bindings: display: Convert dlc,dlc0700yzg-1
 panel to DT schema
To: Maxime Ripard <maxime.ripard@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1561472130;
 bh=CSPPQvXxxLJHjaf7mkYaItL0XCi+kuQqJ8aFZvaSQm4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=V8WtBeSoOtEfNzciSHEA3eF3ej1jkECegr5DZ2OYjOzIPhWsp2Qh/VZPOSVHXnl1s
 l4cBB1coaSY9tOZx5+pqs2pK4cFlxPurht3JDscmUVkCZchTb663MaJM8pc/6EROaj
 vN1AoNoU+XADmmdcbUoLpBqIrw9UguN76bgTpxog=
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
Cc: devicetree@vger.kernel.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdW4gMjUsIDIwMTkgYXQgMTo1NSBBTSBNYXhpbWUgUmlwYXJkIDxtYXhpbWUucmlw
YXJkQGJvb3RsaW4uY29tPiB3cm90ZToKPgo+IEhpLAo+Cj4gT24gTW9uLCBKdW4gMjQsIDIwMTkg
YXQgMDM6NTY6NDBQTSAtMDYwMCwgUm9iIEhlcnJpbmcgd3JvdGU6Cj4gPiBDb252ZXJ0IHRoZSBk
bGMsZGxjMDcwMHl6Zy0xIHBhbmVsIGJpbmRpbmcgdG8gRFQgc2NoZW1hLgo+ID4KPiA+IENjOiBQ
aGlsaXBwIFphYmVsIDxwLnphYmVsQHBlbmd1dHJvbml4LmRlPgo+ID4gQ2M6IFRoaWVycnkgUmVk
aW5nIDx0aGllcnJ5LnJlZGluZ0BnbWFpbC5jb20+Cj4gPiBDYzogU2FtIFJhdm5ib3JnIDxzYW1A
cmF2bmJvcmcub3JnPgo+ID4gQ2M6IE1heGltZSBSaXBhcmQgPG1heGltZS5yaXBhcmRAYm9vdGxp
bi5jb20+Cj4gPiBDYzogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29u
Ym9hcmQuY29tPgo+ID4gQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiA+IFNp
Z25lZC1vZmYtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+Cj4gPiAtLS0KPiA+ICAu
Li4vZGlzcGxheS9wYW5lbC9kbGMsZGxjMDcwMHl6Zy0xLnR4dCAgICAgICAgfCAxMyAtLS0tLS0t
LS0KPiA+ICAuLi4vZGlzcGxheS9wYW5lbC9kbGMsZGxjMDcwMHl6Zy0xLnlhbWwgICAgICAgfCAy
OCArKysrKysrKysrKysrKysrKysrCj4gPiAgMiBmaWxlcyBjaGFuZ2VkLCAyOCBpbnNlcnRpb25z
KCspLCAxMyBkZWxldGlvbnMoLSkKPiA+ICBkZWxldGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvZGxjLGRsYzA3MDB5emctMS50eHQK
PiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L2Rpc3BsYXkvcGFuZWwvZGxjLGRsYzA3MDB5emctMS55YW1sCj4gPgo+ID4gZGlmZiAtLWdpdCBh
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL2RsYyxkbGMw
NzAweXpnLTEudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkv
cGFuZWwvZGxjLGRsYzA3MDB5emctMS50eHQKPiA+IGRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAo+
ID4gaW5kZXggYmYwNmJiMDI1YjA4Li4wMDAwMDAwMDAwMDAKPiA+IC0tLSBhL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL2RsYyxkbGMwNzAweXpnLTEudHh0
Cj4gPiArKysgL2Rldi9udWxsCj4gPiBAQCAtMSwxMyArMCwwIEBACj4gPiAtRExDIERpc3BsYXkg
Q28uIERMQzA3MDBZWkctMSA3LjAiIFdTVkdBIFRGVCBMQ0QgcGFuZWwKPiA+IC0KPiA+IC1SZXF1
aXJlZCBwcm9wZXJ0aWVzOgo+ID4gLS0gY29tcGF0aWJsZTogc2hvdWxkIGJlICJkbGMsZGxjMDcw
MHl6Zy0xIgo+ID4gLS0gcG93ZXItc3VwcGx5OiBTZWUgc2ltcGxlLXBhbmVsLnR4dAo+ID4gLQo+
ID4gLU9wdGlvbmFsIHByb3BlcnRpZXM6Cj4gPiAtLSByZXNldC1ncGlvczogU2VlIHBhbmVsLWNv
bW1vbi50eHQKPiA+IC0tIGVuYWJsZS1ncGlvczogU2VlIHNpbXBsZS1wYW5lbC50eHQKPiA+IC0t
IGJhY2tsaWdodDogU2VlIHNpbXBsZS1wYW5lbC50eHQKPiA+IC0KPiA+IC1UaGlzIGJpbmRpbmcg
aXMgY29tcGF0aWJsZSB3aXRoIHRoZSBzaW1wbGUtcGFuZWwgYmluZGluZywgd2hpY2ggaXMgc3Bl
Y2lmaWVkCj4gPiAtaW4gc2ltcGxlLXBhbmVsLnR4dCBpbiB0aGlzIGRpcmVjdG9yeS4KPiA+IGRp
ZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5l
bC9kbGMsZGxjMDcwMHl6Zy0xLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvZGlzcGxheS9wYW5lbC9kbGMsZGxjMDcwMHl6Zy0xLnlhbWwKPiA+IG5ldyBmaWxlIG1vZGUg
MTAwNjQ0Cj4gPiBpbmRleCAwMDAwMDAwMDAwMDAuLjFiMGI2M2Q0NmYzZQo+ID4gLS0tIC9kZXYv
bnVsbAo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkv
cGFuZWwvZGxjLGRsYzA3MDB5emctMS55YW1sCj4gPiBAQCAtMCwwICsxLDI4IEBACj4gPiArIyBT
UERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMAo+ID4gKyVZQU1MIDEuMgo+ID4gKy0tLQo+
ID4gKyRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvZGlzcGxheS9wYW5lbC9kbGMs
ZGxjMDcwMHl6Zy0xLnlhbWwjCj4gPiArJHNjaGVtYTogaHR0cDovL2RldmljZXRyZWUub3JnL21l
dGEtc2NoZW1hcy9jb3JlLnlhbWwjCj4gPiArCj4gPiArdGl0bGU6IERMQyBEaXNwbGF5IENvLiBE
TEMwNzAwWVpHLTEgNy4wIiBXU1ZHQSBURlQgTENEIHBhbmVsCj4gPiArCj4gPiArbWFpbnRhaW5l
cnM6Cj4gPiArICAtIFBoaWxpcHAgWmFiZWwgPHAuemFiZWxAcGVuZ3V0cm9uaXguZGU+Cj4gPiAr
ICAtIFRoaWVycnkgUmVkaW5nIDx0aGllcnJ5LnJlZGluZ0BnbWFpbC5jb20+Cj4gPiArCj4gPiAr
YWxsT2Y6Cj4gPiArICAtICRyZWY6IHBhbmVsLWNvbW1vbi55YW1sIwo+ID4gKwo+ID4gK3Byb3Bl
cnRpZXM6Cj4gPiArICBjb21wYXRpYmxlOgo+ID4gKyAgICBjb25zdDogZGxjLGRsYzA3MDB5emct
MQo+ID4gKwo+ID4gKyAgcmVzZXQtZ3Bpb3M6IHRydWUKPiA+ICsgIGVuYWJsZS1ncGlvczogdHJ1
ZQo+ID4gKyAgYmFja2xpZ2h0OiB0cnVlCj4KPiBEbyB3ZSBuZWVkIHRvIGxpc3QgdGhlbT8KPgo+
IFNpbmNlIHdlIGRvbid0IGhhdmUgYWRkaXRpb25hbEl0ZW1zLCBpdCBkb2Vzbid0IHJlYWxseSBj
aGFuZ2UgYW55dGhpbmcKPiBzaW5jZSBpdCB3aWxsIGJlIHZhbGlkYXRlZCBieSBwYW5lbC1jb21t
b24uCgpJJ3ZlIGdvbmUgYmFjayBhbmQgZm9ydGggb24gaXQuIEkgdGhpbmsgd2UgbmVlZCB0byBl
eHByZXNzIHdoYXQKcHJvcGVydGllcyBmcm9tIHRoZSBjb21tb24gcHJvcGVydGllcyBhcHBseSBm
b3IgYSBwYXJ0aWN1bGFyIHBhbmVsLgpJJ3ZlIGJlZW4gcmVxdWlyaW5nIHBhbmVsIGJpbmRpbmdz
IHRvIGJlIGV4cGxpY2l0IGhlcmUgcmF0aGVyIHRoYW4KanVzdCBzYXkgInVzZXMgdGhlIHNpbXBs
ZS1wYW5lbCBiaW5kaW5nLiIgRm9yIGV4YW1wbGUsIGlmCidwb3dlci1zdXBwbHknIGlzIG5vdCBs
aXN0ZWQsIGRvZXMgdGhlIHBhbmVsIGhhdmUgYSBzaW5nbGUgc3VwcGx5IG9yCm11bHRpcGxlIHN1
cHBsaWVzIHRoYXQgaGF2ZW4ndCBoYXZlbid0IGJlZW4gY29uc2lkZXJlZD8KCj4gRWl0aGVyIHdh
eSwgaXQgc2hvdWxkIGJlIGNvbnNpc3RlbnQgYmV0d2VlbiB5b3VyIHBhdGNoZXMsIGFuZCB0aGUK
PiBwcmV2aW91cyBwYXRjaGVzIGluIHRoaXMgc2VyaWVzIGRpZG4ndCBsaXN0IGFsbCB0aGUgcHJv
cGVydGllcyBpbiB0aGUKPiBiaW5kaW5nLgoKSW5kZWVkLgoKUm9iCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
