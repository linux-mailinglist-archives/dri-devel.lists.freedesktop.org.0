Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5B1B1EDCAA
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jun 2020 07:19:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 781696E187;
	Thu,  4 Jun 2020 05:19:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
 [209.85.167.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C6B86E175
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jun 2020 05:19:46 +0000 (UTC)
Received: by mail-lf1-f67.google.com with SMTP id u16so2763761lfl.8
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Jun 2020 22:19:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=CDYCwrGwgyePOxlS0CraEvHzE1DftCgl+yxJsEBFx8c=;
 b=atIEcv+xI6f62olzVqdW5s3vxer9UWUKRc3mhGpO9FppQrK+UCHj4oy2lieC8rHN2w
 jXKb4ZzIo8/rTus4cjyPqSg0N8n6BYn2+AHoxgLbnZ6hu++lr11DVcW7AZXeg3tch/QB
 n+3+QG/17k29zv9iBx3gOYMC8rNW3HMO/zXPGtg7xg8ZPHS94hl97ZLjWxEt53Acq95g
 ZcsoDzyhNgjdNuPyHCyftVKJ+eYzqmpjTbFhZuaYwN99aZHuAdM5s8kH6iwiR6Sg+5Qq
 /rlKFQvX1F9BmIVoOSD4L+xkx5Ey49fa8GLKErDjH9QCj1V+zuNMJQYf2i8K1If+2NoO
 jCIA==
X-Gm-Message-State: AOAM531hEEFd13o3Nyhs6Dx+l2Vg4OV8wFC12DshONSsOy8WjSLA8tTm
 0+gmjNwUqvnb/cR2F523ugvHS5vken4=
X-Google-Smtp-Source: ABdhPJwybh8rnBYzfQfFDtOitXcTWIAcdTtFu/tcqhTrC79CwCCIxZbOUptybUIU0uNn/e48h1ECNg==
X-Received: by 2002:a19:6e0e:: with SMTP id j14mr1490566lfc.155.1591247983791; 
 Wed, 03 Jun 2020 22:19:43 -0700 (PDT)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com.
 [209.85.208.181])
 by smtp.gmail.com with ESMTPSA id h26sm1164553lja.0.2020.06.03.22.19.43
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Jun 2020 22:19:43 -0700 (PDT)
Received: by mail-lj1-f181.google.com with SMTP id n24so5605760lji.10
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Jun 2020 22:19:43 -0700 (PDT)
X-Received: by 2002:a2e:9246:: with SMTP id v6mr1269112ljg.47.1591247982979;
 Wed, 03 Jun 2020 22:19:42 -0700 (PDT)
MIME-Version: 1.0
References: <20200413095457.1176754-1-jernej.skrabec@siol.net>
 <1742537.tdWV9SEqCh@jernej-laptop>
 <20200415104214.ndkkxfnufkxgu53r@gilmour.lan>
 <1785843.taCxCBeP46@jernej-laptop>
 <20200422092300.444wcaurdwyrorow@gilmour.lan>
In-Reply-To: <20200422092300.444wcaurdwyrorow@gilmour.lan>
From: Chen-Yu Tsai <wens@csie.org>
Date: Thu, 4 Jun 2020 13:19:32 +0800
X-Gmail-Original-Message-ID: <CAGb2v64++4rxcwdQXgz30vNbRRR5+tXehP-CFu9T7Lx7K_QOOw@mail.gmail.com>
Message-ID: <CAGb2v64++4rxcwdQXgz30vNbRRR5+tXehP-CFu9T7Lx7K_QOOw@mail.gmail.com>
Subject: Re: [PATCH] drm/sun4i: hdmi ddc clk: Fix size of m divider
To: Maxime Ripard <maxime@cerno.tech>,
 =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@siol.net>
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
Cc: David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBBcHIgMjIsIDIwMjAgYXQgNToyMyBQTSBNYXhpbWUgUmlwYXJkIDxtYXhpbWVAY2Vy
bm8udGVjaD4gd3JvdGU6Cj4KPiBIaSwKPgo+IE9uIFdlZCwgQXByIDE1LCAyMDIwIGF0IDA3OjUy
OjI4UE0gKzAyMDAsIEplcm5laiDFoGtyYWJlYyB3cm90ZToKPiA+IERuZSBzcmVkYSwgMTUuIGFw
cmlsIDIwMjAgb2IgMTI6NDI6MTQgQ0VTVCBqZSBNYXhpbWUgUmlwYXJkIG5hcGlzYWwoYSk6Cj4g
PiA+IE9uIE1vbiwgQXByIDEzLCAyMDIwIGF0IDA2OjA5OjA4UE0gKzAyMDAsIEplcm5laiDFoGty
YWJlYyB3cm90ZToKPiA+ID4gPiBEbmUgcG9uZWRlbGplaywgMTMuIGFwcmlsIDIwMjAgb2IgMTY6
MTI6MzkgQ0VTVCBqZSBDaGVuLVl1IFRzYWkKPiA+IG5hcGlzYWwoYSk6Cj4gPiA+ID4gPiBPbiBN
b24sIEFwciAxMywgMjAyMCBhdCA2OjExIFBNIENoZW4tWXUgVHNhaSA8d2Vuc0Bjc2llLm9yZz4g
d3JvdGU6Cj4gPiA+ID4gPiA+IE9uIE1vbiwgQXByIDEzLCAyMDIwIGF0IDU6NTUgUE0gSmVybmVq
IFNrcmFiZWMKPiA+ID4gPiA+ID4gPGplcm5lai5za3JhYmVjQHNpb2wubmV0Pgo+ID4gPiA+Cj4g
PiA+ID4gd3JvdGU6Cj4gPiA+ID4gPiA+ID4gbSBkaXZpZGVyIGluIEREQyBjbG9jayByZWdpc3Rl
ciBpcyA0IGJpdHMgd2lkZS4gRml4IHRoYXQuCj4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiBG
aXhlczogOWM1NjgxMDExYTBjICgiZHJtL3N1bjRpOiBBZGQgSERNSSBzdXBwb3J0IikKPiA+ID4g
PiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBKZXJuZWogU2tyYWJlYyA8amVybmVqLnNrcmFiZWNAc2lv
bC5uZXQ+Cj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IFJldmlld2VkLWJ5OiBDaGVuLVl1IFRzYWkg
PHdlbnNAY3NpZS5vcmc+Cj4gPiA+ID4gPgo+ID4gPiA+ID4gQ2Mgc3RhYmxlPwo+ID4gPiA+Cj4g
PiA+ID4gSSBkb24ndCB0aGluayBpdCdzIG5lY2Vzc2FyeToKPiA+ID4gPiAxLiBJdCBkb2Vzbid0
IGNoYW5nZSBtdWNoIChhbnl0aGluZz8pIGZvciBtZSB3aGVuIHJlYWRpbmcgRURJRC4gSSBkb24n
dAo+ID4gPiA+IHRoaW5rIGl0J3Mgc3VwZXIgaW1wb3J0YW50IHRvIGhhdmUgcHJlY2lzZSBEREMg
Y2xvY2sgaW4gb3JkZXIgdG8gcHJvcGVybHkKPiA+ID4gPiByZWFkIEVESUQuIDIuIE5vIG1hdHRl
ciBpZiBpdCBoYXMgIkNjIHN0YWJsZSIgdGFnIG9yIG5vdCwgaXQgd2lsbCBiZQo+ID4gPiA+IGV2
ZW50dWFsbHkgcGlja2VkIGZvciBzdGFibGUgZHVlIHRvIGZpeGVzIHRhZy4KPiA+ID4gPgo+ID4g
PiA+IFRoaXMgd2FzIG9ubHkgc21hbGwgb2JzZXJ2YXRpb24gd2hlbiBJIHdhcyByZXNlYXJjaGlu
ZyBFRElEIHJlYWRvdXQgaXNzdWUKPiA+ID4gPiBvbiBBMjAgYm9hcmQsIGJ1dCBzYWRseSwgSSB3
YXNuJ3QgYWJsZSB0byBmaWd1cmUgb3V0IHdoeSByZWFkaW5nIGl0Cj4gPiA+ID4gc29tZXRpbWVz
IGZhaWxzLiBJIG5vdGljZWQgc2ltaWxhciBpc3N1ZSBvbiBTb0NzIHdpdGggREUyIChtb3N0Cj4g
PiA+ID4gcHJvbWluZW50bHkgb24gT3JhbmdlUGkgUEMyIC0gSDUpLCBidXQgdGhlcmUgd2FzIGVh
c3kgd29ya2Fyb3VuZCAtIEkganVzdAo+ID4gPiA+IGRpc2FibGVkIHZpZGVvIGRyaXZlciBpbiBV
LSBCb290LiBIb3dldmVyLCBpZiBBMjAgZGlzcGxheSBkcml2ZXIgZ2V0cwo+ID4gPiA+IGRpc2Fi
bGVkIGluIFUtQm9vdCwgaXQgdG90YWxseSBicmVha3MgdmlkZW8gb3V0cHV0IG9uIG15IFRWIHdo
ZW4gTGludXgKPiA+ID4gPiBib290cyAobm8gb3V0cHV0KS4gSSBndWVzcyB0aGVyZSBpcyBtb3Jl
IGZ1bmRhbWVudGFsIHByb2JsZW0gd2l0aCBjbG9ja3MKPiA+ID4gPiB0aGFuIGp1c3QgZmllbGQg
c2l6ZS4gSSB0aGluayB3ZSBzaG91bGQgYWRkIG1vcmUgY29uc3RyYWludHMgaW4gY2xvY2sKPiA+
ID4gPiBkcml2ZXIsIGxpa2UgcHJlc2V0IHNvbWUgY2xvY2sgcGFyZW50cyBhbmQgbm90IGFsbG93
IHRvIGNoYW5nZSBwYXJlbnRzCj4gPiA+ID4gd2hlbiBzZXR0aW5nIHJhdGUsIGJ1dCBjYXJlZnVs
bHksIHNvIHNpbXBsZWZiIGRvZXNuJ3QgYnJlYWsuIFN1Y2gKPiA+ID4gPiBjb25zdHJhaW50cyBz
aG91bGQgYWxzbyBzb2x2ZSBwcm9ibGVtcyB3aXRoIGR1YWwgaGVhZCBzZXR1cHMuCj4gPiA+IEkg
ZGlzYWdyZWUgaGVyZS4gRG9pbmcgYWxsIHNvcnRzIG9mIHNwZWNpYWwgY2FzZSBqdXN0IGRvZXNu
J3Qgc2NhbGUsCj4gPiA+IGFuZCB3ZSdsbCBuZXZlciBoYXZlIHRoZSBzcGVjaWFsIGNhc2VzIHNv
cnRlZCBvdXQgb24gYWxsIHRoZSBib2FyZHMKPiA+ID4gKGFuZCBpdCdzIGEgbmlnaHRtYXJlIHRv
IG1haW50YWluKS4KPiA+ID4KPiA+ID4gRXNwZWNpYWxseSBzaW5jZSBpdCdzIGJhc2ljYWxseSBw
dXR0aW5nIGEgYmxhbmtldCBvdmVyIHRoZSBhY3R1YWwKPiA+ID4gaXNzdWUgYW5kIGxvb2tpbmcg
dGhlIG90aGVyIHdheS4gSWYgdGhlcmUncyBzb21ldGhpbmcgd3Jvbmcgd2l0aCBob3cKPiA+ID4g
d2UgZGVhbCB3aXRoIChyZSlwYXJlbnRpbmcsIHdlIHNob3VsZCBmaXggdGhhdC4gSXQgaW1wYWN0
cyBtb3JlIHRoYW4KPiA+ID4ganVzdCBEUk0sIGFuZCBhbGwgdGhlIFNvQ3MuCj4gPgo+ID4gSSBh
Z3JlZSB3aXRoIHlvdSB0aGF0IGF1dG9tYXRpYyBzb2x1dGlvbiB3b3VsZCBiZSBiZXN0LCBidXQg
SSBqdXN0IGRvbid0IHNlZQo+ID4gaXQgaG93IGl0IHdvdWxkIGJlIGRvbmUuCj4KPiA+IER1YWwg
aGVhZCBkaXNwbGF5IHBpcGVsaW5lIGlzIHByZXR0eSBjb21wbGV4IGZvciBjbG9jayBkcml2ZXIg
dG8gZ2V0IGl0IHJpZ2h0Cj4gPiBvbiBpdCdzIG93bi4gVGhlcmUgYXJlIGRpZmZlcmVudCBwb3Nz
aWJsZSBzZXR1cHMgYW5kIHNvbWUgb2YgdGhlbSBhcmUgaG90Cj4gPiBwbHVnZ2FibGUsIGxpa2Ug
SERNSS4KPgo+IERvIHlvdSBoYXZlIGFuIGFjdHVhbCBzY2VuYXJpbyB0aGF0IGlzIGJyb2tlbiBy
aWdodCBub3c/Cj4KPiA+IEFuZCB0aGVyZSBhcmUgYWxzbyBTb0Mgc3BlY2lmaWMgcXVpcmtzLCBs
aWtlIEE2NCwgd2hlcmUgZm9yIHNvbWUgcmVhc29uLCBNSVBJCj4gPiBEUEhZIGFuZCBIRE1JIFBI
WSBzaGFyZSBzYW1lIGNsb2NrIHBhcmVudCAtIFBMTF9WSURFTzAuIFRlY2huaWNhbGx5LCBNSVBJ
IERQSFkKPiA+IGNhbiBiZSBjbG9ja2VkIGZyb20gUExMX1BFUklQSDAgKGZpeGVkIHRvIDYwMCBN
SHopLCBidXQgdGhhdCdzIG5vdCByZWFsbHkKPiA+IGhlbHBmdWwuIEknbSBub3QgZXZlbiBzdXJl
IGlmIHRoZXJlIGlzIGFueSBnb29kIHNvbHV0aW9uIHRvIHRoaXMgLSBjZXJ0YWlubHkKPiA+IEhE
TUkgYW5kIE1JUEkgY2FuJ3QgY2xhaW0gZXhjbHVzaXZpdHkgYW5kIHNvbWVob3cgYmVzdCBjb21t
b24gcmF0ZSBtdXN0IGJlCj4gPiBmb3VuZCBmb3IgUExMX1ZJREVPMCwgaWYgdGhhdCdzIGV2ZW4g
cG9zc2libGUuCj4KPiBJSVJDIHRoZSBEU0kgRFBIWSBuZWVkcyBhIGNsb2NrIHJ1bm5pbmcgYXQg
Mjk3TUh6LCB3aGljaCBpcyBwcmV0dHkgbXVjaCB3aGF0IHRoZQo+IEhETUkgUEhZIHNob3VsZCBu
ZWVkIHRvbyAob3IgMTQ4LjUsIGJ1dCB0aGF0J3MgcHJldHR5IGVhc3kgdG8gZ2VuZXJhdGUgZnJv
bQo+IDI5NykuIFNvIHdoaWNoIHByb2JsZW0gZG8gd2UgaGF2ZSB0aGVyZT8KPgo+ID4gSSB3YXMg
c3VyZSB0aGF0IEhETUkgUEhZIG9uIEE2NCBjYW4gYmUgY2xvY2tlZCBmcm9tIFBMTF9WSURFTzEs
IHdoaWNoIHdvdWxkCj4gPiBzb2x2ZSBtYWluIGlzc3VlLCBidXQgdG8gZGF0ZSwgSSBkaWRuJ3Qg
ZmluZCBhbnkgd2F5IHRvIGRvIHRoYXQuCj4gPgo+ID4gVGhhdCdzIHByZXR0eSBvZmYgdG9waWMs
IHNvIEkgaG9wZSBvcmlnaW5hbCBwYXRjaCBjYW4gYmUgbWVyZ2VkIGFzLWlzLgo+Cj4gSXQgZG9l
cywgc29ycnkKPgo+IEFja2VkLWJ5OiBNYXhpbWUgUmlwYXJkIDxtYXhpbWVAY2Vybm8udGVjaD4K
Ckxvb2tzIGxpa2UgdGhpcyBoYXNuJ3QgbGFuZGVkIHlldC4KCkNoZW5ZdQpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
