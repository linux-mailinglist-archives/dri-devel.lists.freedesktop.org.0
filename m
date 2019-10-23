Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D412BE1CA9
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2019 15:33:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FCB66EAC6;
	Wed, 23 Oct 2019 13:33:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com
 [209.85.217.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 846E46EAC8
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2019 13:33:06 +0000 (UTC)
Received: by mail-vs1-f50.google.com with SMTP id v10so13773227vsc.7
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2019 06:33:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=mCiaOIaorrKIQCtsVp6aHwzekWggpzvfq7s6sW3erXo=;
 b=GYHTVyKD2UlOqmngzo4XF6VUJoGDl3HMvWJG2PLDYGUVsuH4Or6yhlj9tSuGK6AdWY
 FKPocpr6ISEkLIUN1fAD0klKx3Ec19ftntDeTjHvlJlMEY73WtyimayU8jXAum3qH58S
 StgoIv0DgrvSfoCCPdXAGZObkKfY+W6/oFjvvwVJZEpdbW6+vtFgbI0pSazNKlqCYC2g
 aJMj3/H6XGra+WFoVybTHV6Dl6AlyaGUErLO8Gyzzp7cIW3kIsikjYND7huvUmrvJZhP
 BoWigM15HUlNXC0CB6giV0jeXiKRc2P0GhwpY5pEUrr0G7yMQ2/kkG9+5290S9Ahh+ys
 DD7w==
X-Gm-Message-State: APjAAAU1M7xYsZcLoVvscr33pj8L/3J+iIBPJn0kgW+tTuCa0UptTcfc
 GM3W714cg5cTqMcYGduCjWR2j51pl00kziaVjYXR/zTq
X-Google-Smtp-Source: APXvYqyVpz5glbgymuzq7luK+CIT6R7DpJChJHggpptTQeHi3O8hdcXEOKNXluIg6XmwK3nVh6PC4SA2j0NWZCF7fQs=
X-Received: by 2002:a67:f852:: with SMTP id b18mr5246778vsp.210.1571837585210; 
 Wed, 23 Oct 2019 06:33:05 -0700 (PDT)
MIME-Version: 1.0
References: <536af56f-924d-f089-a2d8-180f4dee1613@pr.hu>
 <CAKb7UvhZ9VR_X5Nqv01EDvnWF2RXXt5fCdYEa5KUy8owKh4CwQ@mail.gmail.com>
 <35cdaafe-461e-56ec-d3d3-47fdd6468251@pr.hu>
In-Reply-To: <35cdaafe-461e-56ec-d3d3-47fdd6468251@pr.hu>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Wed, 23 Oct 2019 09:32:53 -0400
Message-ID: <CAKb7Uvh2L0oHMwNss-h1BFXGYeEXOUDLHB9TnaNEm4-oNhjMRw@mail.gmail.com>
Subject: Re: UDL device cannot get its own screen
To: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@pr.hu>
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
Cc: xorg@lists.x.org,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBPY3QgMjMsIDIwMTkgYXQgMjo0MSBBTSBCw7ZzesO2cm3DqW55aSBab2x0w6FuIDx6
Ym9zem9yQHByLmh1PiB3cm90ZToKPgo+IDIwMTkuIDEwLiAyMi4gMjI6NTcga2VsdGV6w6lzc2Vs
LCBJbGlhIE1pcmtpbiDDrXJ0YToKPiA+IE9uIFR1ZSwgT2N0IDIyLCAyMDE5IGF0IDExOjUwIEFN
IELDtnN6w7ZybcOpbnlpIFpvbHTDoW4gPHpib3N6b3JAcHIuaHU+IHdyb3RlOgo+ID4+IFNlY3Rp
b24gIkRldmljZSIKPiA+PiAgICAgICAgICBJZGVudGlmaWVyICAgICAgIlVETCIKPiA+PiAgICAg
ICAgICBEcml2ZXIgICAgICAgICAgIm1vZGVzZXR0aW5nIgo+ID4+ICAgICAgICAgIE9wdGlvbiAg
ICAgICAgICAia21zZGV2IiAiL2Rldi9kcmkvY2FyZDAiCj4gPj4gICAgICAgICAgU2NyZWVuICAg
ICAgICAgIDIKPiA+PiAgICAgICAgICBPcHRpb24gICAgICAgICAgIk1vbml0b3ItRFZJLUktMS0x
IiAiRFZJLUktMS0xIgo+ID4KPiA+IEkgdGhpbmsgeW91IGhhdmUgYW4gZXh0cmEgLTEgaW4gaGVy
ZSAoYW5kIHRoZSBtb25pdG9yIG5hbWUgZG9lc24ndAo+ID4gZXhpc3QgYXMgcGVyIGFib3ZlKS4g
QW5kIEkgdGhpbmsgdGhlICJTY3JlZW4iIGluZGV4IGlzIHdyb25nIC0tIGl0J3MKPiA+IG5vdCB3
aGF0IG9uZSB0ZW5kcyB0byB0aGluayBpdCBpcywgYXMgSSByZWNhbGwuIEkgdGhpbmsgeW91IGNh
biBqdXN0Cj4gPiBkcm9wIHRoZXNlIGxpbmVzIHRob3VnaC4KPgo+IFdpdGhvdXQgIlNjcmVlbiBO
IiBsaW5lcywgYWxsIHRoZSBvdXRwdXRzIGFyZSBhc3NpZ25lZCB0byA6MAo+IHNvIHRoZSBzY3Jl
ZW4gbGF5b3V0IHNldHVwIGluIHRoZSBTZXJ2ZXJMYXlvdXQgc2VjdGlvbiBpcyBub3QKPiBhcHBs
aWVkIHByb3Blcmx5Lgo+CgpBcyBJIHJlbWVtYmVyIGl0LCB0aGUgU2NyZWVuIGhlcmUgaXMgZm9y
IFphcGhvZEhlYWRzLXR5cGUKY29uZmlndXJhdGlvbnMsIGFuZCBpdCBpbmRpY2F0ZXMgd2hpY2gg
aGVhZCB5b3UncmUgc3VwcG9zZWQgdG8gdXNlIG9mCnRoZSB1bmRlcmx5aW5nIGRldmljZS4gTXkg
c3VnZ2VzdGlvbiB3YXMgdG8gb25seSByZW1vdmUgaXQgaGVyZSwgbm90CmV2ZXJ5d2hlcmUuCgog
IC1pbGlhCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
