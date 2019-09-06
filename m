Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECBB1ABA06
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2019 15:56:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F2956E2A6;
	Fri,  6 Sep 2019 13:56:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x943.google.com (mail-ua1-x943.google.com
 [IPv6:2607:f8b0:4864:20::943])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47F6D6E2A3;
 Fri,  6 Sep 2019 13:56:42 +0000 (UTC)
Received: by mail-ua1-x943.google.com with SMTP id n6so2077626uaq.3;
 Fri, 06 Sep 2019 06:56:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SVwLoKFGJVfcjABY8Xi3p3pFjRGmeX18r5sBIch+nMo=;
 b=WafbSTbsVT3JQptELnCS1aKkmtMivIfgAEh+e598vTDgM96L5BdxLGu+XJaNjsWQbz
 OI+pTg6Kn7bgazzVTSWDmwAa9jlu8ozzVV8o7LWbSbKLh5xz0XdlFwTIdSWNqEVHEvWr
 My3vrH2LlDSXq3x+HIOtu5N3pzeEXuIFYrDuziDWhekJeXD5LP0ohzNrN7cFr/N5tZcK
 vxGfOvKRb9CgiZMzcDTz9UR/o7wos2J7EARy74nuHd+0KRjdpaGd7U8nIZr11j47aHzZ
 tn6TMPKgdQT9h7aKQfDsXmh4tXiVPV61AJm8p5AAE1NLTPiD66fepeAeBbFHLk9EMknP
 0/5Q==
X-Gm-Message-State: APjAAAUHUPz20PzU2QvYWBCsqPafab/9Op35/3Q7ojmrlzQe/H7kbo5k
 Xc1R6oYuWdMiMBWjKhc1irefUlQ+u3ABmg2p20qmu1UV
X-Google-Smtp-Source: APXvYqwDkpjGaWq550N4eQTYzyYQxdXHHVNUKzvZmugr2+zcpNkGtPSyi2F5zyxnChWe7lU3svqt14VR5TAenQ34fP0=
X-Received: by 2002:ab0:60ae:: with SMTP id f14mr4202973uam.124.1567778201170; 
 Fri, 06 Sep 2019 06:56:41 -0700 (PDT)
MIME-Version: 1.0
References: <20190906100308.15341-1-christian.gmeiner@gmail.com>
 <20190906100308.15341-2-christian.gmeiner@gmail.com>
 <86049d234394fca91d571e624ec93d2302fd6c82.camel@pengutronix.de>
In-Reply-To: <86049d234394fca91d571e624ec93d2302fd6c82.camel@pengutronix.de>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Fri, 6 Sep 2019 15:57:26 +0200
Message-ID: <CAH9NwWcf1kHGHk7JZY2XQJSq+whmw20Ep1f=LAowH_=xZE5PUQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/etnaviv: print MMU exception cause
To: Lucas Stach <l.stach@pengutronix.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=SVwLoKFGJVfcjABY8Xi3p3pFjRGmeX18r5sBIch+nMo=;
 b=o0w3a8BBnEJeHDtZ7j75RgUNse5Q70DKVjqJlfvJS3ISwTlJQbXw6wRB+3kLwpR6b+
 Uqgqse4lSy4srMQekb8jE3fihodGC3nMpJa1O8YxP4e3Y7iCgwtwFE9d9md1eYU8EmAG
 I7GMfrEiMPOyChB4YfGQifeHZm7p5fKH+NlrrBFrlVHyr81zJlZ2wVZGx/4AzPS4xqQh
 HCb/Q5GM3gtoJYEJKonvbrof8Xh/88rzqMMZfuALrB9C6NEQKNlp0u05qZqduh13oZMl
 CaNYLBDTBe1ZIY/4auH6XNhOK9IdtLW47EVgX2/zFTwIzYUKdgELnqDKwuTu38+PWDrB
 k2uA==
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
Cc: The etnaviv authors <etnaviv@lists.freedesktop.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gRnIuLCA2LiBTZXB0LiAyMDE5IHVtIDEyOjU1IFVociBzY2hyaWViIEx1Y2FzIFN0YWNoIDxs
LnN0YWNoQHBlbmd1dHJvbml4LmRlPjoKPgo+IE9uIEZyLCAyMDE5LTA5LTA2IGF0IDEyOjAzICsw
MjAwLCBDaHJpc3RpYW4gR21laW5lciB3cm90ZToKPiA+IE1pZ2h0IGJlIHVzZWZ1bCB3aGVuIGRl
YnVnZ2luZyBNTVUgZXhjZXB0aW9ucy4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4g
R21laW5lciA8Y2hyaXN0aWFuLmdtZWluZXJAZ21haWwuY29tPgo+ID4gLS0tCj4gPiAgZHJpdmVy
cy9ncHUvZHJtL2V0bmF2aXYvZXRuYXZpdl9ncHUuYyB8IDI2Cj4gPiArKysrKysrKysrKysrKysr
KysrKysrKysrKwo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAyNiBpbnNlcnRpb25zKCspCj4gPgo+ID4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9ldG5hdml2L2V0bmF2aXZfZ3B1LmMKPiA+IGIv
ZHJpdmVycy9ncHUvZHJtL2V0bmF2aXYvZXRuYXZpdl9ncHUuYwo+ID4gaW5kZXggZDQ3ZDFhOGUw
MjE5Li5hYTg3OGRkMDU4NjAgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZXRuYXZp
di9ldG5hdml2X2dwdS5jCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZXRuYXZpdi9ldG5hdml2
X2dwdS5jCj4gPiBAQCAtMTM2NCwxMCArMTM2NCwzNiBAQCBzdGF0aWMgdm9pZCBkdW1wX21tdV9m
YXVsdChzdHJ1Y3QgZXRuYXZpdl9ncHUKPiA+ICpncHUpCj4gPgo+ID4gICAgICAgZm9yIChpID0g
MDsgaSA8IDQ7IGkrKykgewo+ID4gICAgICAgICAgICAgICB1MzIgYWRkcmVzc19yZWc7Cj4gPiAr
ICAgICAgICAgICAgIGNvbnN0IGNoYXIgKmVycm9yOwo+ID4KPiA+ICAgICAgICAgICAgICAgaWYg
KCEoc3RhdHVzICYgKFZJVlNfTU1VdjJfU1RBVFVTX0VYQ0VQVElPTjBfX01BU0sgPDwKPiA+IChp
ICogNCkpKSkKPiA+ICAgICAgICAgICAgICAgICAgICAgICBjb250aW51ZTsKPiA+Cj4gPiArICAg
ICAgICAgICAgIHN3aXRjaCAoc3RhdHVzKSB7Cj4gPiArICAgICAgICAgICAgIGNhc2UgTU1VX0VY
Q0VQVElPTl9TTEFWRV9OT1RfUFJFU0VOVDoKPiA+ICsgICAgICAgICAgICAgICAgICAgICBlcnJv
ciA9ICJzbGF2ZSBub3QgcHJlc2VudCI7Cj4gPiArICAgICAgICAgICAgICAgICAgICAgYnJlYWs7
Cj4gPiArICAgICAgICAgICAgIGNhc2UgTU1VX0VYQ0VQVElPTl9QQUdFX05PVF9QUkVTRU5UOgo+
ID4gKyAgICAgICAgICAgICAgICAgICAgIGVycm9yID0gInBhZ2Ugbm90IHByZXNlbnQiOwo+ID4g
KyAgICAgICAgICAgICAgICAgICAgIGJyZWFrOwo+ID4gKyAgICAgICAgICAgICBjYXNlIE1NVV9F
WENFUFRJT05fV1JJVEVfVklPTEFUSU9OOgo+ID4gKyAgICAgICAgICAgICAgICAgICAgIGVycm9y
ID0gIndyaXRlIHZpb2xhdGlvbiI7Cj4gPiArICAgICAgICAgICAgICAgICAgICAgYnJlYWs7Cj4g
PiArICAgICAgICAgICAgIGNhc2UgTU1VX0VYQ0VQVElPTl9PVVRfT0ZfQk9VTkQ6Cj4gPiArICAg
ICAgICAgICAgICAgICAgICAgZXJyb3IgPSAib3V0IG9mIGJvdW5kIjsKPiA+ICsgICAgICAgICAg
ICAgICAgICAgICBicmVhazsKPiA+ICsgICAgICAgICAgICAgY2FzZSBNTVVfRVhDRVBUSU9OX1JF
QURfU0VDVVJJVFlfVklPTEFUSU9OOgo+ID4gKyAgICAgICAgICAgICAgICAgICAgIGVycm9yID0g
InJlYWQgc2VjdXJpdHkgdmlvbGF0aW9uIjsKPiA+ICsgICAgICAgICAgICAgICAgICAgICBicmVh
azsKPiA+ICsgICAgICAgICAgICAgY2FzZSBNTVVfRVhDRVBUSU9OX1dSSVRFX1NFQ1VSSVRZX1ZJ
T0xBVElPTjoKPiA+ICsgICAgICAgICAgICAgICAgICAgICBlcnJvciA9ICJ3cml0ZSBzZWN1cml0
eSB2aW9sYXRpb24iOwo+ID4gKyAgICAgICAgICAgICAgICAgICAgIGJyZWFrOwo+ID4gKyAgICAg
ICAgICAgICBkZWZhdWx0Ogo+ID4gKyAgICAgICAgICAgICAgICAgICAgIGVycm9yID0gInVua25v
d24gc3RhdGUiOwo+ID4gKyAgICAgICAgICAgICAgICAgICAgIGJyZWFrOwo+ID4gKyAgICAgICAg
ICAgICB9Cj4KPiBBcyB0aGUgZXhjZXB0aW9uIHN0YXR1cyBpcyBhIG5pY2UgY29udGlndW91cyBz
ZXQgb2YgYml0cywgSSB0aGluayB0aGlzCj4gY291bGQgYmUgc2ltcGxpZmllZCBpbnRvIGEgc3Rh
dGljIGFycmF5IG9mIHN0cmluZ3MuIFRoZSBlcnJvciBtZXNzYWdlCj4gY291bGQgdGhlbiBqdXN0
IHVzZSB0aGUgYml0IHBvc2l0aW9uIHRvIGluZGV4IGludG8gdGhlIGFycmF5Lgo+CgpJIGxpa2Ug
dGhlIGlkZWEgLi4gd2lsbCBiZSBkb25lIGluIFYyLiBUaGFua3MgZm9yIHlvdXIgcXVpY2sgcmV2
aWV3IQoKLS0gCmdyZWV0cwotLQpDaHJpc3RpYW4gR21laW5lciwgTVNjCgpodHRwczovL2Nocmlz
dGlhbi1nbWVpbmVyLmluZm8vcHJpdmFjeXBvbGljeQpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
