Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E900519E722
	for <lists+dri-devel@lfdr.de>; Sat,  4 Apr 2020 20:41:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1616F6E261;
	Sat,  4 Apr 2020 18:41:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A74476E25D;
 Sat,  4 Apr 2020 18:41:01 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id cw6so13499524edb.9;
 Sat, 04 Apr 2020 11:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=e+aeJlzfNqTRvnzH/JXrM5gIcyNiXC+s0oifJMqeaGE=;
 b=lLWjapZbjQVwxCQRGEuaZtfduP8p9VaHyv/OfpqukEDB2HpUNZ28GNdfw3EQutnhs0
 sMRiWDIQPPG87+jxQOmJH6ckMg9Hzj7k2r74K2dDB+w+kQoHa0wHHE1oXQadgL8a67QW
 un5mpcLbYM24b6SXs1YtectYtTD6g+ciaRdWTTSadh5s5eVbZNsAKPrRxgpKtHQKsbXh
 2EzcmfLelsZ4Sej+bXAitQ73zZKfwZWRnYDWYgkizyGeCGhZANBf5SiZA8fSLj4BLCei
 5xA10A3XH1kgtE9TsSWDBIBsxRwBn/UzgkAMUF+aOHJ1dyUGgKPvNAPUJkX0kquSd6Xp
 JKXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=e+aeJlzfNqTRvnzH/JXrM5gIcyNiXC+s0oifJMqeaGE=;
 b=nI3dVJZDjh97Z0hIHrihGCZKDmWDfuu/S1GSIj6bwmOQK6xqBtDpeZmeo1/bV9vG3v
 imXuTBv2hoyeRqv2O60/lPHat9hQneW6MWf0kCOqGOTA4+CE5nU7dkJTDYFxM2JRvfP9
 eD3AAroNdWNQz/qNSKA8rUpwphcUuYAd46lIonvJmVATYwMGiKWheHFQSuq5YFG1vjV6
 i7MN8ixImQhiKMbWGhCTWkqwoxpxfp6sPrLYrbyZX4hBmTDq+B5T1FMjVQCQFI4dht2s
 ciOiIFLGQl077tLdZdVDx6CPmOS/5ncVycYMGpSomjAMD0xCyFAMDQkIYKWP1K4BomgR
 gHGQ==
X-Gm-Message-State: AGi0PuaB1ubzqb2Bny7ZhN0kitczEKk6yqJrJvibpdXUudXRE69HnZIr
 jR0n3h7eMME9bG/Y2hbNhoidHdnbpxfSHneT3s7aWg==
X-Google-Smtp-Source: APiQypL60LymPVJY/cUkTkzR2kLucrftx+g3k5W6ti3YM0INhc3n1T6ylo0KBK3EJzZxT/reO3dimBNHfnY+QxCoTNE=
X-Received: by 2002:a17:906:8243:: with SMTP id
 f3mr13843402ejx.166.1586025660210; 
 Sat, 04 Apr 2020 11:41:00 -0700 (PDT)
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
In-Reply-To: <CAF6AEGuVzvO_wkrsuxahme-9AHOH7D+2yXJXiuRh_e825t_K6w@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Sat, 4 Apr 2020 11:41:00 -0700
Message-ID: <CAF6AEGu8JW+uCmDu3QW3jO4RvkYL3BqkQ_9QRcwvaCW4Mb-XXg@mail.gmail.com>
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

T24gU2F0LCBBcHIgNCwgMjAyMCBhdCAxMToxNiBBTSBSb2IgQ2xhcmsgPHJvYmRjbGFya0BnbWFp
bC5jb20+IHdyb3RlOgo+Cj4gT24gU2F0LCBBcHIgNCwgMjAyMCBhdCAxMDo0NyBBTSBOaWNvbGFz
IER1ZnJlc25lIDxuaWNvbGFzQG5kdWZyZXNuZS5jYT4gd3JvdGU6Cj4gPgo+ID4gTGUgc2FtZWRp
IDA0IGF2cmlsIDIwMjAgw6AgMDg6MTEgLTA3MDAsIFJvYiBDbGFyayBhIMOpY3JpdCA6Cj4gPiA+
IE9uIEZyaSwgQXByIDMsIDIwMjAgYXQgNzoxMiBBTSBNaWNoZWwgRMOkbnplciA8bWljaGVsQGRh
ZW56ZXIubmV0PiB3cm90ZToKPiA+ID4gPiBPbiAyMDIwLTAzLTAxIDY6NDYgYS5tLiwgTWFyZWsg
T2zFocOhayB3cm90ZToKPiA+ID4gPiA+IEZvciBNZXNhLCB3ZSBjb3VsZCBydW4gQ0kgb25seSB3
aGVuIE1hcmdlIHB1c2hlcywgc28gdGhhdCBpdCdzIGEgc3RyaWN0bHkKPiA+ID4gPiA+IHByZS1t
ZXJnZSBDSS4KPiA+ID4gPgo+ID4gPiA+IFRoYW5rcyBmb3IgdGhlIHN1Z2dlc3Rpb24hIEkgaW1w
bGVtZW50ZWQgc29tZXRoaW5nIGxpa2UgdGhpcyBmb3IgTWVzYToKPiA+ID4gPgo+ID4gPiA+IGh0
dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9tZXNhL21lc2EvLS9tZXJnZV9yZXF1ZXN0cy80
NDMyCj4gPiA+ID4KPiA+ID4KPiA+ID4gSSB3b3VsZG4ndCBtaW5kIG1hbnVhbGx5IHRyaWdnZXJp
bmcgcGlwZWxpbmVzLCBidXQgdW5sZXNzIHRoZXJlIGlzCj4gPiA+IHNvbWUgdHJpY2sgSSdtIG5v
dCByZWFsaXppbmcsIGl0IGlzIHN1cGVyIGN1bWJlcnNvbWUuICBJZS4geW91IGhhdmUgdG8KPiA+
ID4gY2xpY2sgZmlyc3QgdGhlIGNvbnRhaW5lciBqb2JzLi4gdGhlbiB3YWl0Li4gdGhlbiB0aGUg
YnVpbGQgam9icy4uCj4gPiA+IHRoZW4gd2FpdCBzb21lIG1vcmUuLiBhbmQgdGhlbiBmaW5hbGx5
IHRoZSBhY3R1YWwgcnVubmVycy4gIFRoYXQgd291bGQKPiA+ID4gYmUgYSByZWFsIHN0ZXAgYmFj
ayBpbiB0ZXJtcyBvZiB1c2VmdWxuZXNzIG9mIENJLi4gb25lIG1pZ2h0IGNhbGwgaXQgYQo+ID4g
PiByZWdyZXNzaW9uIDotKAo+ID4KPiA+IE9uIEdTdHJlYW1lciBzaWRlIHdlIGhhdmUgbW92ZWQg
c29tZSBleGlzdGluZyBwaXBlbGluZSB0byBtYW51YWwgbW9kZS4KPiA+IEFzIHdlIHVzZSBuZWVk
czogYmV0d2VlbiBqb2JzLCB3ZSBjb3VsZCBzaW1wbHkgc2V0IHRoZSBmaXJzdCBqb2IgdG8KPiA+
IG1hbnVhbCAoaW4gb3VyIGNhc2UgaXQncyBhIHNpbmdsZSBqb2IgY2FsbGVkIG1hbmlmZXN0IGlu
IHlvdXIgY2FzZSBpdAo+ID4gd291bGQgYmUgdGhlIE4gY29udGFpbmVyIGpvYnMpLiBUaGlzIHdh
eSB5b3UgY2FuIGhhdmUgYSBtYW51YWwgcGlwZWxpbmUKPiA+IHRoYXQgaXMgdHJpZ2dlcmVkIGlu
IHNpbmdsZSAob3IgZmV3ZXIpIGNsaWNrcy4gSGVyZSdzIGFuIGV4YW1wbGU6Cj4gPgo+ID4gaHR0
cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL2dzdHJlYW1lci9nc3RyZWFtZXIvcGlwZWxpbmVz
LzEyODI5Mgo+ID4KPiA+IFRoYXQgb3VyIHBvc3QtbWVyZ2UgcGlwZWxpbmVzLCB3ZSBvbmx5IHRy
aWdnZXIgdGhlbiBpZiB3ZSBzdXNwZWN0IGEKPiA+IHByb2JsZW0uCj4gPgo+Cj4gSSdtIG5vdCBz
dXJlIHRoYXQgd291bGQgd29yayBmb3IgbWVzYSBzaW5jZSB0aGUgaGllcmFyY2h5IG9mIGpvYnMK
PiBicmFuY2hlcyBvdXQgcHJldHR5IGZhci4uIGllLiBpZiBJIGp1c3QgY2xpY2tlZCB0aGUgYXJt
NjQgYnVpbGQgKyB0ZXN0Cj4gY29udGFpbmVyIGpvYnMsIGFuZCBldmVyeXRoaW5nIGVsc2UgcmFu
IGF1dG9tYXRpY2FsbHkgYWZ0ZXIgdGhhdCwgaXQKPiB3b3VsZCBlbmQgdXAgcnVubmluZyBhbGwg
dGhlIENJIGpvYnMgZm9yIGFsbCB0aGUgYXJtIGRldmljZXMgKG9yIGF0Cj4gbGVhc3QgYWxsIHRo
ZSA2NGIgb25lcykKCnVwZGF0ZTogcGVwcCBwb2ludGVkIG91dCBvbiAjZHJpLWRldmVsIHRoYXQg
dGhlIHBhdGgtYmFzZWQgcnVsZXMKc2hvdWxkIHN0aWxsIGFwcGx5IHRvIHBydW5lIG91dCBodyBD
SSBqb2JzIGZvciBodyBub3QgYWZmZWN0ZWQgYnkgdGhlCk1SLiAgSWYgdGhhdCBpcyB0aGUgY2Fz
ZSwgYW5kIHdlIG9ubHkgbmVlZCB0byBjbGljayB0aGUgY29udGFpbmVyIGpvYnMKKHdpdGhvdXQg
dGhlbiBkb2luZyB0aGUgd2FpdCZjbGljayBkYW5jZSksIHRoZW4gdGhpcyBkb2Vzbid0IHNvdW5k
IGFzCmJhZCBhcyBJIGZlYXJlZC4KCkJSLAotUgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWwK
