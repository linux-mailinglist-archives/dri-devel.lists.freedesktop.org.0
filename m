Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DBD0819E72F
	for <lists+dri-devel@lfdr.de>; Sat,  4 Apr 2020 20:47:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EF916E282;
	Sat,  4 Apr 2020 18:47:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D3B16E0BF;
 Sat,  4 Apr 2020 18:47:23 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id e5so13562921edq.5;
 Sat, 04 Apr 2020 11:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=7ba+faWHgcTSB7ijO2r9eE+fTehcHcT5wLhaZNEk8oo=;
 b=Xu5Hi9GvWSeiHO8LG7GSVLRbER9v4ZnSSmSuN75mLWpvGKqa3hAa28w/kDmUyoYz3z
 Xdrqto2EJdDJM4FmcgJP1gq6exjIkR0NPJ09k3aclIzJEK+r8Sk/E2zrtf1iwku23LCE
 agRLCeXpNdFeM4JKYMFNDLiLBqmetukwI7hbFdO4UT7zYTCh26dfqKG+eKuwQEUzhYXQ
 Uqul6mBseabAU/g3j+3uDNIvj4FzHNaG4XmW0iYlAS1WnrBWifhYKQDZDHu4+5QbMoT0
 iEwrZVUYrAMeQGpLwlNO3sLyrObT+/SWFbWA1wmGMaP2o4ctnieoCjLfHiTxf6TdQB5X
 73OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=7ba+faWHgcTSB7ijO2r9eE+fTehcHcT5wLhaZNEk8oo=;
 b=W06nPURyjCEDVrVPZUhfpwppar0YuOwhpeXn91KgubcEoTTudRHRwlZ/zKtHq0eqzj
 PwXTTZxwwfYnQeB+97xuKUfExL4KqSXxTxM/P0AfTPBbZ3bIO8NFz2VKl0xh9lkahOzA
 QJujU08NLNRQSVafIjU3u0Q5HoyBMzRL2eFra3c5Sz+l/BMgk2rlrb+KZLlMPs8kUlRk
 NO6qr7C8divbwT/XESMQFAHzqrQs8yh15vjmC4t2ERwZMyVv+mHtttNlP4rvCWFDWUpE
 Tnq1Rk0G4QJyWm0oqb4aUM2dj4eDaX0+7vOsghesm+YIhTwBpzMmrslZ52s8SH8IYU1U
 rd7A==
X-Gm-Message-State: AGi0Pub9VAMILRPleMXXjnokceFM8tezNQOKajBKnskdKbjMJ38ynsZ9
 ZPS0olFhH9fBt6cyx3EkjaYXdCGKucM+8e3iSTk=
X-Google-Smtp-Source: APiQypIFkodzPRI0FOW8fEwcYs/PH99i2sejgSxQrH2Rzku5O2JYcTN3JoTeUWzCiBPLpjI4yxNBZOGVJjBSk8lhQbU=
X-Received: by 2002:a17:906:eddb:: with SMTP id
 sb27mr14665446ejb.207.1586026042122; 
 Sat, 04 Apr 2020 11:47:22 -0700 (PDT)
MIME-Version: 1.0
References: <CAKMK7uHHK2SsCfpmZwEUyTJJHsoccKoadoko3cEBOoYDFkmeAw@mail.gmail.com>
 <CAPM=9txcGPvFdSzMtYZXyqLKnWyacSMuHdoXdV63M53fLFVFpw@mail.gmail.com>
 <b398161ff7d0268454413058dc6c194cf93f5990.camel@collabora.com>
 <ece8ebe3-40ec-2457-02da-4fef19cbe8f6@intel.com>
 <6d2ec570f957b4504fb70e0b1f0632712a99dc0c.camel@collabora.com>
 <CAPj87rO7BuKQj2Kei3T7RdkFq5=TiuShBvtrPU2sn0iqMfXSTg@mail.gmail.com>
 <59f4ea1f13a9a9d37f7801b93061b4ae7dd595e2.camel@gmail.com>
 <d0ef47e45c83b342494e6781b808b4831a008836.camel@ndufresne.ca>
 <d9dca12759fd6a549dc4cd71b5f210a4dced01cd.camel@gmail.com>
 <CAOFGe96WqRTagf=Lhp6j9aMnB6hxwog7t93t=4r6QE_4f+HpeQ@mail.gmail.com>
 <5551426acf99f73d3ce8234c14c176c1c7a1fe44.camel@ndufresne.ca>
 <CAAxE2A5zSy7Rh6xyPW8NCqj3q0_8F7yw8tAXx=_z8+mJ-u2uWw@mail.gmail.com>
 <3cddf1aa-5072-af7c-c51e-c16039176f6c@daenzer.net>
 <CAF6AEGuNTtHfNm_nRhPFX5wPRmKkjnFEKqTdTSBDjpLkaiN8Fw@mail.gmail.com>
 <3e5bc9f9416c3f8b2ec52436b40b82cafb717586.camel@ndufresne.ca>
 <CAF6AEGuVzvO_wkrsuxahme-9AHOH7D+2yXJXiuRh_e825t_K6w@mail.gmail.com>
 <CAF6AEGu8JW+uCmDu3QW3jO4RvkYL3BqkQ_9QRcwvaCW4Mb-XXg@mail.gmail.com>
In-Reply-To: <CAF6AEGu8JW+uCmDu3QW3jO4RvkYL3BqkQ_9QRcwvaCW4Mb-XXg@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Sat, 4 Apr 2020 11:47:22 -0700
Message-ID: <CAF6AEGt7yYEL9CE8v--baUOEx-s08X4z5xNvD=Vpx3v+AjhedA@mail.gmail.com>
Subject: Re: [Mesa-dev] [Intel-gfx] gitlab.fd.o financial situation and impact
 on services
To: Nicolas Dufresne <nicolas@ndufresne.ca>
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
Cc: Erik Faye-Lund <erik.faye-lund@collabora.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>,
 =?UTF-8?Q?Timur_Krist=C3=B3f?= <timur.kristof@gmail.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>,
 "X.Org development" <xorg-devel@lists.x.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 wayland <wayland-devel@lists.freedesktop.org>,
 "X.Org Foundation Board" <board@foundation.x.org>,
 Xorg Members List <members@x.org>, Jason Ekstrand <jason@jlekstrand.net>,
 Mesa Dev <mesa-dev@lists.freedesktop.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Discussion of the development of and with GStreamer
 <gstreamer-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU2F0LCBBcHIgNCwgMjAyMCBhdCAxMTo0MSBBTSBSb2IgQ2xhcmsgPHJvYmRjbGFya0BnbWFp
bC5jb20+IHdyb3RlOgo+Cj4gT24gU2F0LCBBcHIgNCwgMjAyMCBhdCAxMToxNiBBTSBSb2IgQ2xh
cmsgPHJvYmRjbGFya0BnbWFpbC5jb20+IHdyb3RlOgo+ID4KPiA+IE9uIFNhdCwgQXByIDQsIDIw
MjAgYXQgMTA6NDcgQU0gTmljb2xhcyBEdWZyZXNuZSA8bmljb2xhc0BuZHVmcmVzbmUuY2E+IHdy
b3RlOgo+ID4gPgo+ID4gPiBMZSBzYW1lZGkgMDQgYXZyaWwgMjAyMCDDoCAwODoxMSAtMDcwMCwg
Um9iIENsYXJrIGEgw6ljcml0IDoKPiA+ID4gPiBPbiBGcmksIEFwciAzLCAyMDIwIGF0IDc6MTIg
QU0gTWljaGVsIETDpG56ZXIgPG1pY2hlbEBkYWVuemVyLm5ldD4gd3JvdGU6Cj4gPiA+ID4gPiBP
biAyMDIwLTAzLTAxIDY6NDYgYS5tLiwgTWFyZWsgT2zFocOhayB3cm90ZToKPiA+ID4gPiA+ID4g
Rm9yIE1lc2EsIHdlIGNvdWxkIHJ1biBDSSBvbmx5IHdoZW4gTWFyZ2UgcHVzaGVzLCBzbyB0aGF0
IGl0J3MgYSBzdHJpY3RseQo+ID4gPiA+ID4gPiBwcmUtbWVyZ2UgQ0kuCj4gPiA+ID4gPgo+ID4g
PiA+ID4gVGhhbmtzIGZvciB0aGUgc3VnZ2VzdGlvbiEgSSBpbXBsZW1lbnRlZCBzb21ldGhpbmcg
bGlrZSB0aGlzIGZvciBNZXNhOgo+ID4gPiA+ID4KPiA+ID4gPiA+IGh0dHBzOi8vZ2l0bGFiLmZy
ZWVkZXNrdG9wLm9yZy9tZXNhL21lc2EvLS9tZXJnZV9yZXF1ZXN0cy80NDMyCj4gPiA+ID4gPgo+
ID4gPiA+Cj4gPiA+ID4gSSB3b3VsZG4ndCBtaW5kIG1hbnVhbGx5IHRyaWdnZXJpbmcgcGlwZWxp
bmVzLCBidXQgdW5sZXNzIHRoZXJlIGlzCj4gPiA+ID4gc29tZSB0cmljayBJJ20gbm90IHJlYWxp
emluZywgaXQgaXMgc3VwZXIgY3VtYmVyc29tZS4gIEllLiB5b3UgaGF2ZSB0bwo+ID4gPiA+IGNs
aWNrIGZpcnN0IHRoZSBjb250YWluZXIgam9icy4uIHRoZW4gd2FpdC4uIHRoZW4gdGhlIGJ1aWxk
IGpvYnMuLgo+ID4gPiA+IHRoZW4gd2FpdCBzb21lIG1vcmUuLiBhbmQgdGhlbiBmaW5hbGx5IHRo
ZSBhY3R1YWwgcnVubmVycy4gIFRoYXQgd291bGQKPiA+ID4gPiBiZSBhIHJlYWwgc3RlcCBiYWNr
IGluIHRlcm1zIG9mIHVzZWZ1bG5lc3Mgb2YgQ0kuLiBvbmUgbWlnaHQgY2FsbCBpdCBhCj4gPiA+
ID4gcmVncmVzc2lvbiA6LSgKPiA+ID4KPiA+ID4gT24gR1N0cmVhbWVyIHNpZGUgd2UgaGF2ZSBt
b3ZlZCBzb21lIGV4aXN0aW5nIHBpcGVsaW5lIHRvIG1hbnVhbCBtb2RlLgo+ID4gPiBBcyB3ZSB1
c2UgbmVlZHM6IGJldHdlZW4gam9icywgd2UgY291bGQgc2ltcGx5IHNldCB0aGUgZmlyc3Qgam9i
IHRvCj4gPiA+IG1hbnVhbCAoaW4gb3VyIGNhc2UgaXQncyBhIHNpbmdsZSBqb2IgY2FsbGVkIG1h
bmlmZXN0IGluIHlvdXIgY2FzZSBpdAo+ID4gPiB3b3VsZCBiZSB0aGUgTiBjb250YWluZXIgam9i
cykuIFRoaXMgd2F5IHlvdSBjYW4gaGF2ZSBhIG1hbnVhbCBwaXBlbGluZQo+ID4gPiB0aGF0IGlz
IHRyaWdnZXJlZCBpbiBzaW5nbGUgKG9yIGZld2VyKSBjbGlja3MuIEhlcmUncyBhbiBleGFtcGxl
Ogo+ID4gPgo+ID4gPiBodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvZ3N0cmVhbWVyL2dz
dHJlYW1lci9waXBlbGluZXMvMTI4MjkyCj4gPiA+Cj4gPiA+IFRoYXQgb3VyIHBvc3QtbWVyZ2Ug
cGlwZWxpbmVzLCB3ZSBvbmx5IHRyaWdnZXIgdGhlbiBpZiB3ZSBzdXNwZWN0IGEKPiA+ID4gcHJv
YmxlbS4KPiA+ID4KPiA+Cj4gPiBJJ20gbm90IHN1cmUgdGhhdCB3b3VsZCB3b3JrIGZvciBtZXNh
IHNpbmNlIHRoZSBoaWVyYXJjaHkgb2Ygam9icwo+ID4gYnJhbmNoZXMgb3V0IHByZXR0eSBmYXIu
LiBpZS4gaWYgSSBqdXN0IGNsaWNrZWQgdGhlIGFybTY0IGJ1aWxkICsgdGVzdAo+ID4gY29udGFp
bmVyIGpvYnMsIGFuZCBldmVyeXRoaW5nIGVsc2UgcmFuIGF1dG9tYXRpY2FsbHkgYWZ0ZXIgdGhh
dCwgaXQKPiA+IHdvdWxkIGVuZCB1cCBydW5uaW5nIGFsbCB0aGUgQ0kgam9icyBmb3IgYWxsIHRo
ZSBhcm0gZGV2aWNlcyAob3IgYXQKPiA+IGxlYXN0IGFsbCB0aGUgNjRiIG9uZXMpCj4KPiB1cGRh
dGU6IHBlcHAgcG9pbnRlZCBvdXQgb24gI2RyaS1kZXZlbCB0aGF0IHRoZSBwYXRoLWJhc2VkIHJ1
bGVzCj4gc2hvdWxkIHN0aWxsIGFwcGx5IHRvIHBydW5lIG91dCBodyBDSSBqb2JzIGZvciBodyBu
b3QgYWZmZWN0ZWQgYnkgdGhlCj4gTVIuICBJZiB0aGF0IGlzIHRoZSBjYXNlLCBhbmQgd2Ugb25s
eSBuZWVkIHRvIGNsaWNrIHRoZSBjb250YWluZXIgam9icwo+ICh3aXRob3V0IHRoZW4gZG9pbmcg
dGhlIHdhaXQmY2xpY2sgZGFuY2UpLCB0aGVuIHRoaXMgZG9lc24ndCBzb3VuZCBhcwo+IGJhZCBh
cyBJIGZlYXJlZC4KCgpQUy4gSSBzaG91bGQgYWRkLCB0aGF0IGluIHRoZXNlIHdmaCBkYXlzLCBJ
J20gcmVseWluZyBvbiBDSSB0byBiZSBhYmxlCnRvIHRlc3QgY2hhbmdlcyBvbiBzb21lIGdlbmVy
YXRpb25zIG9mIGh3IHRoYXQgSSBkb24ndCBwaHlzaWNhbGx5IGhhdmUKd2l0aCBtZS4gIEl0J3Mg
ZWFzeSB0byB0YWtlIGZvciBncmFudGVkLCBJIGRpZCB1bnRpbCBJIHRob3VnaHQgYWJvdXQKd2hh
dCBJJ2QgZG8gd2l0aG91dCBDSS4gIFNvIGJpZyB0aGFua3MgdG8gYWxsIHRoZSBwZW9wbGUgd2hv
IGFyZQp3b3JraW5nIG9uIENJLCBpdCdzIG1vcmUgaW1wb3J0YW50IHRoZXNlIGRheXMgdGhhbiB5
b3UgbWlnaHQgcmVhbGl6ZQo6LSkKCkJSLAotUgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWwK
