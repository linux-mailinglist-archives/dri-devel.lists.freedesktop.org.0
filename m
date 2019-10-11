Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0C8DD3844
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2019 06:20:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59DC36E3F4;
	Fri, 11 Oct 2019 04:20:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C379989D83
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2019 04:20:25 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id j19so8435113lja.1
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2019 21:20:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=p/y+eZ0SBr4xm3O9rFqi2YzJGJp7sMLZ557jYo54bX8=;
 b=KrhKYvmhefWUB7P4jXod5UAOaRxIi32LkdhsAQF1otzkuJiOqsm3faFq6lPOmDPGdE
 7rGocr6B3N/dGqsrt4d08bhyEKeYicIc2RvlKJoQQmbUL0zCSmgmHwqMYWzftcvbN4z0
 aUadxGKYIAKm2xT6P2BS+jwVPcsClmwHvooAP435jbvMC0YIGwwPrX/Mr9P10ARk9KfS
 xylsEtzYvJLK0AhF5boocGRYsCE2oTGPyTewrjuRmIm16An1wJJXNgyEW8qMvUvwARMI
 lACekb0H1YCFj9u1eI3fbbUJYa2s6tpdftq39XGRgnbr7oqT663bTZDHUQJkZAwJ4wAA
 yzBw==
X-Gm-Message-State: APjAAAVJYxM5Mu8rjHDN80Tus7lxUPbs5Y608kiX4dLsqRC4MOQFct8r
 WwjVH2qk6JLBTu6b3Mp5SvH6kFiAgRidDvi8/sk=
X-Google-Smtp-Source: APXvYqwsxRlluNd/lAkXeZDINxku06pwtwIbr+3UqH8ZniOE8rAWV5qojKxtE2LV5Zt2rxXHkA/EzCyzJhcBCCj4cB0=
X-Received: by 2002:a2e:9dc5:: with SMTP id x5mr7793614ljj.31.1570767623762;
 Thu, 10 Oct 2019 21:20:23 -0700 (PDT)
MIME-Version: 1.0
References: <1eba1bc0-ba0c-b948-6a3d-51a98f4e5c27@gmail.com>
 <CAPM=9tyivSLW_DUJuZo9XQ8-0DsdCuPxrzqLUC-1u9riihqLSg@mail.gmail.com>
 <eb4fe229-8f8d-baca-7bc5-93bcefa63ed1@amd.com>
 <CADnq5_O0QjK0gecUiO0K6Tm7UVY7aF4uuBcj_uvHPKJBtAyEPQ@mail.gmail.com>
 <20191009074700.ieujxt3ueads2cbt@ahiler-desk1.fi.intel.com>
 <55cad18c-b69f-226c-182e-cdaf743822e3@amd.com>
In-Reply-To: <55cad18c-b69f-226c-182e-cdaf743822e3@amd.com>
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 11 Oct 2019 14:20:11 +1000
Message-ID: <CAPM=9tyYAhYhDKWxthJCVur-7Goqyj4xor6xOUeWjALBdeQjgw@mail.gmail.com>
Subject: Re: [pull] ttm drm-fixes-5.4
To: "Koenig, Christian" <Christian.Koenig@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=p/y+eZ0SBr4xm3O9rFqi2YzJGJp7sMLZ557jYo54bX8=;
 b=ZEfWpYGvRyITal2aWsjRweKUlsST1pq8WwaBZNRLyyJmyF6VXaFmbrIhjgAq1QUTSP
 fFXvG6M9o7rdPSWo2Tf1PvkMEPOUze6HKZ9JdoWnBUQcyipad5SvAb89blh1PUTj3mIP
 kenV02ATLS7DAI0i0XxYYTfUmXbRHgKOSak5U+z0kOCasuog+tKkkEHdnnZKaMeupHKP
 dNc08otDUHHPWy5yTLaz67cpmJ4aiUYM2YlgqQ71i7CFL+xvauK0ejV4Y9Ltf3bK7dmT
 Elf9qcygLhwK6q4AlwvK44jYmlWc3fHZ/DAlQVnz/eb/oekaQJER+aLbUCknmHSFmcRy
 ZMkw==
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Huang, Ray" <Ray.Huang@amd.com>,
 Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAxMCBPY3QgMjAxOSBhdCAyMTo1OCwgS29lbmlnLCBDaHJpc3RpYW4KPENocmlzdGlh
bi5Lb2VuaWdAYW1kLmNvbT4gd3JvdGU6Cj4KPiBBbSAwOS4xMC4xOSB1bSAwOTo0NyBzY2hyaWVi
IEFya2FkaXVzeiBIaWxlcjoKPiA+IE9uIFR1ZSwgT2N0IDA4LCAyMDE5IGF0IDA5OjEzOjQxQU0g
LTA0MDAsIEFsZXggRGV1Y2hlciB3cm90ZToKPiA+PiBPbiBUdWUsIE9jdCA4LCAyMDE5IGF0IDQ6
MDQgQU0gS29lbmlnLCBDaHJpc3RpYW4KPiA+PiA8Q2hyaXN0aWFuLktvZW5pZ0BhbWQuY29tPiB3
cm90ZToKPiA+Pj4gTXkgZ2l0IHZlcnNpb24gc2hvdWxkIGJlIHJlbGF0aXZlIG5ldywgYnV0IEkn
bSB1c3VhbGx5IHVzaW5nIHRodW5kZXJiaXJkCj4gPj4+IHRvIHNlbmQgcHVsbCByZXF1ZXN0cyBu
b3QgZ2l0IGl0c2VsZiBzaW5jZSBJIHdhbnQgdG8gZWRpdCB0aGUgbWVzc2FnZQo+ID4+PiBiZWZv
cmUgc2VuZGluZy4KPiA+Pj4KPiA+Pj4gSG93IHdvdWxkIEkgZG8gdGhpcyBpbiBhIHdheSBwYXRj
aHdvcmsgbGlrZXMgaXQgd2l0aCBnaXQ/Cj4gPj4gRldJVywgSSB1c3VhbGx5IGdlbmVyYXRlIHRo
ZSBlbWFpbCBmaXJzdCBhbmQgdGhlbiB1c2UgZ2l0LXNlbmQtZW1haWwKPiA+PiB0byBhY3R1YWxs
eSBzZW5kIGl0Lgo+ID4+Cj4gPj4gQWxleAo+ID4gSGV5LAo+ID4KPiA+IEZETyBwYXRjaHdvcmsg
bWFpbnRhaW5lciBoZXJlLgo+ID4KPiA+IEkgaGF2ZSB0cmllZCBmZXcgdGhpbmdzIHF1aWNrbHkg
d2l0aCBubyBsdWNrLiBUaGVyZSBpcyBzb21ldGhpbmcgZmlzaHkKPiA+IGFib3V0IEZETyBkZXBs
b3ltZW50IG9mIHBhdGNod29yayAtIHlvdSBlbWFpbCB3b3JrcyBqdXN0IGZpbmUgb24gbXkKPiA+
IGRldmVsb3BtZW50IGluc3RhbmNlLgo+ID4KPiA+IEkgaGF2ZSBjcmVhdGVkIGlzc3VlIGZvciB0
aGlzOgo+ID4gaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL3BhdGNod29yay1mZG8vcGF0
Y2h3b3JrLWZkby9pc3N1ZXMvMjgKPiA+Cj4gPiBTb3JyeSBmb3IgdGhlIGluY29udmVuaWVuY2Uu
Cj4KPiBNYXliZSBpdCdzIHRoZSBub24tTGF0aW4gbGV0dGVyIGluIG15IGxhc3QgbmFtZT8gQW55
d2F5IHdlIG5lZWQgdG8gZ2V0Cj4gdGhlIFRUTSBmaXhlcyB1cHN0cmVhbSBmb3IgNS40Lgo+Cj4g
RGF2ZS9EYW5pZWwgYW55IG9iamVjdGlvbnMgdGhhdCBJIHB1c2ggdGhvc2UgZGlyZWN0bHkgdG8g
ZHJtLW1pc2MtZml4ZXM/CgpEb24ndCBib3RoZXIsIEkgY2FuIG1hbnVhbGx5IHByb2Nlc3MgaXQs
IGp1c3QgdGFrZXMgYSBiaXQgbW9yZSBlZmZvcnQuCgpEYXZlLgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
