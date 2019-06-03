Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 720F133FA8
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2019 09:15:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82F2289650;
	Tue,  4 Jun 2019 07:14:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb41.google.com (mail-yb1-xb41.google.com
 [IPv6:2607:f8b0:4864:20::b41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3E35892AC
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jun 2019 17:28:03 +0000 (UTC)
Received: by mail-yb1-xb41.google.com with SMTP id v1so4087383ybi.12
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Jun 2019 10:28:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=/CnmclOqeFitdxQUE9bLrTl+THj0klsLpLvs2FULiUc=;
 b=czc3RXRkMGqY2a1/MOhgPhsmOf4G2qSLq1ZKAwuhKnsUvDgNhNuE17jTgkHzPXpcKT
 im2SkBBdewFvpK8RjJwlzprvR20Q7DsyraIu/8tVMV5V0F4QVzlPZ+7IKFuFVchwKeXT
 ubOiUJbaEQgafudIQuko+FwZvMN2PAOfTIgbu1hUsHVe0O3aHxAZrKZFc8GXr52jsA+H
 iPBhqm9NDoUqq9dviG75s74MTER9iAEHbDF4C+BfxSTj4CPbt/g0SJjzNJF2mDJCQwPh
 jHylZhQhlOOP4uC5WlWPZa5GXfwfgJfvqnNtx3uvva3/I4YnDH4O6YqnHJtfXDQNcUbn
 T0DA==
X-Gm-Message-State: APjAAAXiArQxCWaSXj79b8X1iRUIacohVVTXolfhFXmE7SFbI6UqZT2Y
 Zq/19HW3Q7gQ2RUzgKmuLmEEDz7G/Kt1OJSXgIU=
X-Google-Smtp-Source: APXvYqwv36MV1EgjPM95jwDVnT/xOnPPHBe6w8IiRRT+qX6s8O/bgXKCVn5NKbfL9AQHj/f+E9bKbWM0yveHM2T4UZ4=
X-Received: by 2002:a25:ca8d:: with SMTP id a135mr9276509ybg.438.1559582882942; 
 Mon, 03 Jun 2019 10:28:02 -0700 (PDT)
MIME-Version: 1.0
References: <20190521161102.29620-1-peron.clem@gmail.com>
 <CAL_Jsq+86nNEBzjbf_GLWWrAN91jwU+JQ7zrEoFaT_dxUzVv4A@mail.gmail.com>
In-Reply-To: <CAL_Jsq+86nNEBzjbf_GLWWrAN91jwU+JQ7zrEoFaT_dxUzVv4A@mail.gmail.com>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Mon, 3 Jun 2019 19:27:51 +0200
Message-ID: <CAJiuCcchRZZ-Wwy3_fo_aq=GuCaCW8RHS8nBtB2br4n5Qtu-MA@mail.gmail.com>
Subject: Re: [PATCH v6 0/6] Allwinner H6 Mali GPU support
To: Maxime Ripard <maxime.ripard@bootlin.com>, Joerg Roedel <joro@8bytes.org>
X-Mailman-Approved-At: Tue, 04 Jun 2019 07:14:23 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=/CnmclOqeFitdxQUE9bLrTl+THj0klsLpLvs2FULiUc=;
 b=SAN+/Qb9AVqYn57ZhyRBvnABldr92BWgtJKUyDxZUVDegfg6Hg/wW2NTGAgFOnyE63
 dBdT9OM2aaDM6qQbtrdiPqk5pTS3O2IHLuGjFcdRja7a7i0/c34FEWldCJTns/IJpvML
 LM23y4Y5Aq2EIIUcvbR+MqqHW/tZb2ggEG5WnbMne3zHqowjYDxINP5TEoXckHWZzHwa
 JpOWMO78/dyuTFrkYsvQNXInVy8WqA6UHCjTZOT8K68WVsNdiGHozgliJY4ZTHfHdMni
 eq8JyMQ5/LtpsQeMS5Kn6VTelTQadx7VXG9B3JGK4unIGTZaycj9jjsTvfUEz89TGvAa
 2ZQw==
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Will Deacon <will.deacon@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>, Chen-Yu Tsai <wens@csie.org>,
 Linux IOMMU <iommu@lists.linux-foundation.org>,
 Robin Murphy <robin.murphy@arm.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTWF4aW1lLCBKb2VyZywKCk9uIFdlZCwgMjIgTWF5IDIwMTkgYXQgMjE6MjcsIFJvYiBIZXJy
aW5nIDxyb2JoK2R0QGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gVHVlLCBNYXkgMjEsIDIwMTkg
YXQgMTE6MTEgQU0gQ2zDqW1lbnQgUMOpcm9uIDxwZXJvbi5jbGVtQGdtYWlsLmNvbT4gd3JvdGU6
Cj4gPgo+ID4gSGksCj4gPgo+ID4gVGhlIEFsbHdpbm5lciBINiBoYXMgYSBNYWxpLVQ3MjAgTVAy
IHdoaWNoIHNob3VsZCBiZSBzdXBwb3J0ZWQgYnkKPiA+IHRoZSBuZXcgcGFuZnJvc3QgZHJpdmVy
LiBUaGlzIHNlcmllcyBmaXggdHdvIGlzc3VlcyBhbmQgaW50cm9kdWNlIHRoZQo+ID4gZHQtYmlu
ZGluZ3MgYnV0IGEgc2ltcGxlIGJlbmNobWFyayBzaG93IHRoYXQgaXQncyBzdGlsbCBOT1QgV09S
S0lORy4KPiA+Cj4gPiBJJ20gcHVzaGluZyBpdCBpbiBjYXNlIHNvbWVvbmUgd2FudCB0byBjb250
aW51ZSB0aGUgd29yay4KPiA+Cj4gPiBUaGlzIGhhcyBiZWVuIHRlc3RlZCB3aXRoIE1lc2EzRCAx
OS4xLjAtUkMyIGFuZCBhIEdQVSBiaXRuZXNzIHBhdGNoWzFdLgo+ID4KPiA+IE9uZSBwYXRjaCBp
cyBmcm9tIEljZW5vd3kgWmhlbmcgd2hlcmUgSSBjaGFuZ2VkIHRoZSBvcmRlciBhcyByZXF1aXJl
ZAo+ID4gYnkgUm9iIEhlcnJpbmdbMl0uCj4gPgo+ID4gVGhhbmtzLAo+ID4gQ2xlbWVudAo+ID4K
PiA+IFsxXSBodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcva3N6YXEvbWVzYS90cmVlL3Bh
bmZyb3N0XzY0XzMyCj4gPiBbMl0gaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wYXRjaC8x
MDY5OTgyOS8KPiA+Cj4gPgo+ID4gWyAgMzQ1LjIwNDgxM10gcGFuZnJvc3QgMTgwMDAwMC5ncHU6
IG1tdSBpcnEgc3RhdHVzPTEKPiA+IFsgIDM0NS4yMDk2MTddIHBhbmZyb3N0IDE4MDAwMDAuZ3B1
OiBVbmhhbmRsZWQgUGFnZSBmYXVsdCBpbiBBUzAgYXQgVkEKPiA+IDB4MDAwMDAwMDAwMjQwMDQw
MAo+ID4gWyAgMzQ1LjIwOTYxN10gUmVhc29uOiBUT0RPCj4gPiBbICAzNDUuMjA5NjE3XSByYXcg
ZmF1bHQgc3RhdHVzOiAweDgwMDAwMkMxCj4gPiBbICAzNDUuMjA5NjE3XSBkZWNvZGVkIGZhdWx0
IHN0YXR1czogU0xBVkUgRkFVTFQKPiA+IFsgIDM0NS4yMDk2MTddIGV4Y2VwdGlvbiB0eXBlIDB4
QzE6IFRSQU5TTEFUSU9OX0ZBVUxUX0xFVkVMMQo+ID4gWyAgMzQ1LjIwOTYxN10gYWNjZXNzIHR5
cGUgMHgyOiBSRUFECj4gPiBbICAzNDUuMjA5NjE3XSBzb3VyY2UgaWQgMHg4MDAwCj4gPiBbICAz
NDUuNzI5OTU3XSBwYW5mcm9zdCAxODAwMDAwLmdwdTogZ3B1IHNjaGVkIHRpbWVvdXQsIGpzPTAs
Cj4gPiBzdGF0dXM9MHg4LCBoZWFkPTB4MjQwMDQwMCwgdGFpbD0weDI0MDA0MDAsIHNjaGVkX2pv
Yj0wMDAwMDAwMDllMjA0ZGU5Cj4gPiBbICAzNDYuMDU1ODc2XSBwYW5mcm9zdCAxODAwMDAwLmdw
dTogbW11IGlycSBzdGF0dXM9MQo+ID4gWyAgMzQ2LjA2MDY4MF0gcGFuZnJvc3QgMTgwMDAwMC5n
cHU6IFVuaGFuZGxlZCBQYWdlIGZhdWx0IGluIEFTMCBhdCBWQQo+ID4gMHgwMDAwMDAwMDAyQzAw
QTAwCj4gPiBbICAzNDYuMDYwNjgwXSBSZWFzb246IFRPRE8KPiA+IFsgIDM0Ni4wNjA2ODBdIHJh
dyBmYXVsdCBzdGF0dXM6IDB4ODEwMDAyQzEKPiA+IFsgIDM0Ni4wNjA2ODBdIGRlY29kZWQgZmF1
bHQgc3RhdHVzOiBTTEFWRSBGQVVMVAo+ID4gWyAgMzQ2LjA2MDY4MF0gZXhjZXB0aW9uIHR5cGUg
MHhDMTogVFJBTlNMQVRJT05fRkFVTFRfTEVWRUwxCj4gPiBbICAzNDYuMDYwNjgwXSBhY2Nlc3Mg
dHlwZSAweDI6IFJFQUQKPiA+IFsgIDM0Ni4wNjA2ODBdIHNvdXJjZSBpZCAweDgxMDAKPiA+IFsg
IDM0Ni41NjE5NTVdIHBhbmZyb3N0IDE4MDAwMDAuZ3B1OiBncHUgc2NoZWQgdGltZW91dCwganM9
MSwKPiA+IHN0YXR1cz0weDgsIGhlYWQ9MHgyYzAwYTAwLCB0YWlsPTB4MmMwMGEwMCwgc2NoZWRf
am9iPTAwMDAwMDAwYjU1YTlhODUKPiA+IFsgIDM0Ni41NzM5MTNdIHBhbmZyb3N0IDE4MDAwMDAu
Z3B1OiBtbXUgaXJxIHN0YXR1cz0xCj4gPiBbICAzNDYuNTc4NzA3XSBwYW5mcm9zdCAxODAwMDAw
LmdwdTogVW5oYW5kbGVkIFBhZ2UgZmF1bHQgaW4gQVMwIGF0IFZBCj4gPiAweDAwMDAwMDAwMDJD
MDBCODAKPiA+Cj4gPiBDaGFuZ2UgaW4gdjU6Cj4gPiAgLSBSZW1vdmUgZml4IGluZGVudAo+ID4K
PiA+IENoYW5nZXMgaW4gdjQ6Cj4gPiAgLSBBZGQgYnVzX2Nsb2NrIHByb2JlCj4gPiAgLSBGaXgg
c2FuaXR5IGNoZWNrIGluIGlvLXBndGFibGUKPiA+ICAtIEFkZCB2cmFtcC1kZWxheQo+ID4gIC0g
TWVyZ2UgYWxsIGJvYXJkcyBpbnRvIG9uZSBwYXRjaAo+ID4gIC0gUmVtb3ZlIHVwc3RyZWFtZWQg
TmVpbCBBLiBwYXRjaAo+ID4KPiA+IENoYW5nZSBpbiB2MyAoVGhhbmtzIHRvIE1heGltZSBSaXBh
cmQpOgo+ID4gIC0gUmVhdXRob3IgSWNlbm93eSBmb3IgaGVyIHBhdGgKPiA+Cj4gPiBDaGFuZ2Vz
IGluIHYyIChUaGFua3MgdG8gTWF4aW1lIFJpcGFyZCk6Cj4gPiAgLSBEcm9wIEdQVSBPUFAgVGFi
bGUKPiA+ICAtIEFkZCBjbG9ja3MgYW5kIGNsb2NrLW5hbWVzIGluIHJlcXVpcmVkCj4gPgo+ID4g
Q2zDqW1lbnQgUMOpcm9uICg1KToKPiA+ICAgZHJtOiBwYW5mcm9zdDogYWRkIG9wdGlvbmFsIGJ1
c19jbG9jawo+ID4gICBpb21tdTogaW8tcGd0YWJsZTogZml4IHNhbml0eSBjaGVjayBmb3Igbm9u
IDQ4LWJpdCBtYWxpIGlvbW11Cj4gPiAgIGR0LWJpbmRpbmdzOiBncHU6IG1hbGktbWlkZ2FyZDog
QWRkIEg2IG1hbGkgZ3B1IGNvbXBhdGlibGUKPiA+ICAgYXJtNjQ6IGR0czogYWxsd2lubmVyOiBB
ZGQgQVJNIE1hbGkgR1BVIG5vZGUgZm9yIEg2Cj4gPiAgIGFybTY0OiBkdHM6IGFsbHdpbm5lcjog
QWRkIG1hbGkgR1BVIHN1cHBseSBmb3IgSDYgYm9hcmRzCj4gPgo+ID4gSWNlbm93eSBaaGVuZyAo
MSk6Cj4gPiAgIGR0LWJpbmRpbmdzOiBncHU6IGFkZCBidXMgY2xvY2sgZm9yIE1hbGkgTWlkZ2Fy
ZCBHUFVzCj4KPiBJJ3ZlIGFwcGxpZWQgcGF0Y2hlcyAxIGFuZCAzIHRvIGRybS1taXNjLiBJIHdh
cyBnb2luZyB0byBkbyBwYXRjaCA0Cj4gdG9vLCBidXQgaXQgZG9lc24ndCBhcHBseS4KPgo+IFBh
dGNoIDIgY2FuIGdvIGluIHZpYSB0aGUgaW9tbXUgdHJlZSBhbmQgdGhlIHJlc3QgdmlhIHRoZSBh
bGx3aW5uZXIgdHJlZS4KCklzIHRoaXMgT0sgZm9yIHlvdSB0byBwaWNrIHVwIHRoaXMgc2VyaWVz
PwoKVGhhbmtzLApDbMOpbWVudAoKPgo+IFJvYgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
