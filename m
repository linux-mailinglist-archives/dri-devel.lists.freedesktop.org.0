Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1775BC229D
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2019 16:04:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FDDF8909F;
	Mon, 30 Sep 2019 14:04:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FA298909F
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2019 14:04:31 +0000 (UTC)
Received: by mail-io1-xd42.google.com with SMTP id b19so10510096iob.4
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2019 07:04:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jw2BmP5yAP0WIosdHUXg7b2dakGh/ZFsEzhCPT0aSTY=;
 b=KdPUTr+Wkm3SF2XRPAgEc1zI25ydzG2ZNtb5T/5nzN6ipxd7W6YA5SkKkPJOyBi39K
 cvrZ2Ocj0BVjZG2mE1tszGnd96pcG1WD1eqJfv7Uj1SOVtalIJZONK/n7F9qpfYIs68k
 wylbAcLcu6YgOtqe5QxnKKJwOyVn27TTu0o1xXGOiYIFfjEvKwsq/zT+Xnn9WkTh1+F4
 FSUVipSo9z++wfOuF6n3q3on/j0jP2ivIy8E6a9QMNkaODHZDbuU89fI/+InP4ywpDcc
 68B6jWcmcJMcgi+T9qBP4JpFekboQ3X1QEJaB69UwB33Xu0IJoEUx8Xxr0rt79hx4ibi
 gpYQ==
X-Gm-Message-State: APjAAAVVye2CmklSO3FVytgYXf0WyUGVXvT6zJXcItRdOgZissee1SeU
 a3BBzG1uDeDGOt3WM8xqgVoXTWS5R6MWjnwO7fI=
X-Google-Smtp-Source: APXvYqy5GqHyiuPTz1Bll8seY6c2CREX2eQo4WThC1YG88GiMLmoaGhJGfMPnuan5jClXADZCCq/ma5FNq9RDBtc71Y=
X-Received: by 2002:a92:3314:: with SMTP id a20mr19714009ilf.276.1569852270674; 
 Mon, 30 Sep 2019 07:04:30 -0700 (PDT)
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
In-Reply-To: <CAHCN7xL9bFxO=2i1DzmRj6A3XwUNdt=DZeJ2a0EZ0f9gcFTy6g@mail.gmail.com>
From: Adam Ford <aford173@gmail.com>
Date: Mon, 30 Sep 2019 09:04:18 -0500
Message-ID: <CAHCN7x+vCfPTRE+zzYUwAXdbBzRotTP2hSOgsHB0FdgBhZV5zA@mail.gmail.com>
Subject: Re: [PATCH] drm/omap: Migrate minimum FCK/PCK ratio from Kconfig to
 dts
To: "H. Nikolaus Schaller" <hns@goldelico.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=jw2BmP5yAP0WIosdHUXg7b2dakGh/ZFsEzhCPT0aSTY=;
 b=hEbiamxPCTcn/ohyF9QMFLMPKiB5S3lXi7jcR41Yh2WGNf3hbnh0ceuN2lJMuOmTpp
 mndYJHfjEEs3ef8tSbz9USe7+z9BikHN2mkRU4nsN114Es+ntSUJpOb4dwB4yFaIu5gb
 Qep/mbad6GXN8UZnQn6AHpWL32X3nbNq8xeDIjRjhFAbqOTVH6viJLxsgkrj2mwTsep8
 w0Cj9CkmegC6rXTJRUohiVwggPN+WQn+gaD7cDVOE9u6mN0vV17XOOXxBrPP265y2aoL
 0S8oS3lU4GQ/MWDyL4t95nSroNILfMPOeV8hpjSRDF8CPoJdjqt68E4LTHT5/Jl1M2ga
 GTWw==
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

T24gTW9uLCBTZXAgMzAsIDIwMTkgYXQgODo1NCBBTSBBZGFtIEZvcmQgPGFmb3JkMTczQGdtYWls
LmNvbT4gd3JvdGU6Cj4KPiBPbiBNb24sIFNlcCAzMCwgMjAxOSBhdCA4OjM5IEFNIEguIE5pa29s
YXVzIFNjaGFsbGVyIDxobnNAZ29sZGVsaWNvLmNvbT4gd3JvdGU6Cj4gPgo+ID4KPiA+ID4gQW0g
MzAuMDkuMjAxOSB1bSAxMDo1MyBzY2hyaWViIFRlcm8gS3Jpc3RvIDx0LWtyaXN0b0B0aS5jb20+
Ogo+ID4gPgo+ID4gPiBUaGUgYmVzdCBhY3Rpb24gaGVyZSBpcyBwcm9iYWJseSB0byBkcm9wIHRo
ZSBtYXgtZGl2IHZhbHVlIGZvciB0aGlzIGNsb2NrIHRvIDE2LiBDYW4gc29tZW9uZSBjaGVjayB0
aGlzIHdpdGggdGhlaXIgZGlzcGxheSBzZXR1cCBhbmQgc2VlIHdoYXQgaGFwcGVucz8gQXR0YWNo
ZWQgcGF0Y2ggc2hvdWxkIGRvIHRoZSB0cmljay4KPiA+Cj4gPiBJIGhhdmUgY2hlY2tlZCBvbiBH
VEEwNCBhbmQgT3BlblBhbmRvcmEgKERNMzczMCByZXNwLiBPTUFQMzQzMCkgYW5kIGRpZCBub3Qg
bm90aWNlIGEgbmVnYXRpdmUgZWZmZWN0Lgo+ID4KPiA+IChXZWxsLCB3ZSBuZXZlciBzZWUgdGhl
IHByb2JsZW0gdGhhdCBpcyBkaXNjdXNzZWQgaGVyZSBhbmQgaGF2ZSBidWlsdCB3aXRoIENPTkZJ
R19PTUFQMl9EU1NfTUlOX0ZDS19QRVJfUENLPTApLgo+Cj4gSSBoYXZlIG5ldmVyIGJlZW4gYWJs
ZSB0byB1c2UgQ09ORklHX09NQVAyX0RTU19NSU5fRkNLX1BFUl9QQ0s9MCwgYnV0Cj4gSSBhc3N1
bWUgaXQncyBlaXRoZXIgYSBmdW5jdGlvbiBvZiBwY2sgb3IgYSBjb21iaW5hdGlvbiBvZiBwY2sg
d2l0aAo+IHRoZSByZXNvbHV0aW9uLgo+Cj4gQmFzZWQgb24gVG9taSdzIGNvbW1lbnQsIEkgYXNz
dW1lIGhlJ3Mgd29ya2luZyBvbiB0aGUgZm9sbG93aW5nLiAgQ2FuCj4geW91IGFsc28gdHJ5Ogo+
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL2Rzcy9kc3MuYwo+IGIvZHJp
dmVycy9ncHUvZHJtL29tYXBkcm0vZHNzL2Rzcy5jCj4gaW5kZXggNTcxMWI3YTcyMGU2Li41ZTU4
NGYzMmVhNmEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vZHNzL2Rzcy5j
Cj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vZHNzL2Rzcy5jCj4gQEAgLTEwOTAsNyAr
MTA5MCw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHNzX2ZlYXR1cmVzIG9tYXAzNHh4X2Rzc19m
ZWF0cyA9IHsKPgo+ICBzdGF0aWMgY29uc3Qgc3RydWN0IGRzc19mZWF0dXJlcyBvbWFwMzYzMF9k
c3NfZmVhdHMgPSB7Cj4gICAgICAgICAubW9kZWwgICAgICAgICAgICAgICAgICA9ICAgICAgIERT
U19NT0RFTF9PTUFQMywKPiAtICAgICAgIC5mY2tfZGl2X21heCAgICAgICAgICAgID0gICAgICAg
MzIsCj4gKyAgICAgICAuZmNrX2Rpdl9tYXggICAgICAgICAgICA9ICAgICAgIDE2LAo+ICAgICAg
ICAgLmZja19mcmVxX21heCAgICAgICAgICAgPSAgICAgICAxNzMwMDAwMDAsCj4gICAgICAgICAu
ZHNzX2Zja19tdWx0aXBsaWVyICAgICA9ICAgICAgIDEsCj4gICAgICAgICAucGFyZW50X2Nsa19u
YW1lICAgICAgICA9ICAgICAgICJkcGxsNF9jayIsCj4KPgo+IEhvcGVmdWxseSBpdCBkb2Vzbid0
IGJyZWFrIHRoZSAzNjMwIGZvciB5b3UsIGJ1dCBpdCBmaXhlZCBteSBpc3N1ZQo+IHdpdGggbm8g
YmFjayB0cmFjZToKPgo+IFsgICAgOS45MTU1ODhdIERTUzogc2V0IGZjayB0byA1NDAwMDAwMAo+
IFsgICAgOS45MTU2MThdIERJU1BDOiBsY2sgPSA1NDAwMDAwMCAoMSkKPiBbICAgIDkuOTE1NjQ5
XSBESVNQQzogcGNrID0gOTAwMDAwMCAoNikKPiBbICAgIDkuOTE3NjMzXSBESVNQQzogY2hhbm5l
bCAwIHhyZXMgNDgwIHlyZXMgMjcyCj4gWyAgICA5LjkxNzY2M10gRElTUEM6IHBjayA5MDAwMDAw
Cj4KPiBJIGRvIHdvbmRlciwgaG93ZXZlciBpZiB0aGVyZSBpcyBhIGRpdmlkZXIgdGhhdCBpcyBo
aWdoZXIgdGhhbiAxNiwgYnV0Cj4gbG93ZXIgdGhhbiAzMi4KPiBJIHdhcyBhYmxlIHRvIHJ1biBm
Y2sgYXQgMzZNSHogYmVmb3JlIHdpdGggZGl2aWRlIGJ5IDQgdG8gOU1Ieiwgc28gSQo+IGFtIGhv
cGluZyB0aGF0IGJ5IHJ1bm5pbmcgYXQgNTRNSHogLyA2IGRvZXNuJ3QgZHJhdyBtb3JlIHBvd2Vy
LiAgSSB3YXMKPiByZWFkaW5nIHRocm91Z2ggdGhlIGRhdGFzaGVldCwgYnV0IEkgY291bGQgbm90
IGZpbmQgYW55IHJlZmVyZW5jZSB0bwo+IHRoZSBtYXggZGl2aWRlci4KPgoKRm9yIHJ1biwgSSB0
ZXN0ZWQgYSBtYXggZGl2aWRlciBvZiAyNywgYW5kIEkgd2FzIGFibGUgdG8gZ2V0IGl0CmZ1bmN0
aW9uYWwgd2l0aCBhIHNsb3dlciBmY2sKClsgICAgOS45MzkwNTZdIERTUzogc2V0IGZjayB0byAz
NjAwMDAwMApbICAgIDkuOTM5MDg2XSBESVNQQzogbGNrID0gMzYwMDAwMDAgKDEpClsgICAgOS45
MzkwODZdIERJU1BDOiBwY2sgPSA5MDAwMDAwICg0KQpbICAgIDkuOTQxMzE0XSBESVNQQzogY2hh
bm5lbCAwIHhyZXMgNDgwIHlyZXMgMjcyClsgICAgOS45NDEzMTRdIERJU1BDOiBwY2sgOTAwMDAw
MApbICAgIDkuOTQxMzE0XSBESVNQQzogaHN5bmNfbGVuIDQyIGhmcCAzIGhicCAyIHZzdyAxMSB2
ZnAgMiB2YnAgMwpbICAgIDkuOTQxMzE0XSBESVNQQzogdnN5bmNfbGV2ZWwgMSBoc3luY19sZXZl
bCAxIGRhdGFfcGNsa19lZGdlIDEKZGVfbGV2ZWwgMSBzeW5jX3BjbGtfZWRnZSAtMQpbICAgIDku
OTQxMzQ1XSBESVNQQzogaHN5bmMgMTcwNzdIeiwgdnN5bmMgNTlIegoKCkkgZG9uJ3Qga25vdyB0
aGUgaW1wbGljYXRpb25zLCBzbyBpZiB0aGUgcGVvcGxlIGZyb20gVEkgc2F5IHN0aWNrIHdpdGgK
MTYsIEknbSBmaW5lIHdpdGggdGhhdCwgYnV0IGF0IGxlYXN0IHRoZXJlIGlzIHNvbWUgZXZpZGVu
Y2UgdGhhdCBpdApjYW4gYmUgaGlnaGVyIHRoYW4gMTYsIGJ1dCBsb3dlciB0aGFuIDMyLgoKYWRh
bQoKPiBhZGFtCj4gPgo+ID4gQlIsCj4gPiBOaWtvbGF1cwo+ID4KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
