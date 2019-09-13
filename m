Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D7AAEB2842
	for <lists+dri-devel@lfdr.de>; Sat, 14 Sep 2019 00:20:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E3AC6F47D;
	Fri, 13 Sep 2019 22:20:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f66.google.com (mail-vs1-f66.google.com
 [209.85.217.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3517D6F47A;
 Fri, 13 Sep 2019 22:20:37 +0000 (UTC)
Received: by mail-vs1-f66.google.com with SMTP id b123so19645950vsb.5;
 Fri, 13 Sep 2019 15:20:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3ltRJY4t6aZ+8Y8iUEUcLfwwWLnNXssGvbScXo986/0=;
 b=n4CiQynRxY7vj8vBLD9uyUzv6jB8nZy3nyjG4zGqez87rmIk/JVeUJTFMU6+OxfC1M
 /4HDnNTwLgx7ILJiAthMry9yTJAiF+zIFCmm5xZgMkIPHB/lIDILUetc3CYA0gogGsvW
 jn+agBi6p9y6t3WgTl4xTLkKGRFXZGDY0j9OlRtmDKsUFt9AW29DD3sn9iGYyZc7vS1F
 h2HsCzt3bRCLTKukeM9OEaQfQKb1yKdlS/t4pBJ8/xKQoGGq1MyWZ5aowAwFR3CFsgVp
 1XwJi3h4h6adPRBH7qF/uuc90nivttebubJTzkjoTLnfgLtMRdDqY/uVYRicKW+gEMB3
 2d/Q==
X-Gm-Message-State: APjAAAU3hnl1BUOVVvEhSDRf3UFNPHN2t8kGvxrsvAT76HRb0N4SjLB3
 Gks90MX+EfMuGUtaiEsncmRjVTc5uvUs3lnI94E=
X-Google-Smtp-Source: APXvYqzoXpTZC7xF9ayZaVWto3HDJIBUg3jJxJtNZLaddNjhgg2l9CdLOPu3mZ8Jmj/YXqP1gu1EJiyVZPTrZ9587Kc=
X-Received: by 2002:a67:f451:: with SMTP id r17mr7077490vsn.207.1568413236113; 
 Fri, 13 Sep 2019 15:20:36 -0700 (PDT)
MIME-Version: 1.0
References: <20190913220355.6883-1-lyude@redhat.com>
 <20190913220355.6883-2-lyude@redhat.com>
In-Reply-To: <20190913220355.6883-2-lyude@redhat.com>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Fri, 13 Sep 2019 18:20:24 -0400
Message-ID: <CAKb7UvgQE0UDTvvhbq4FgtgOWjvXDDKSZs8RSLA-ECa2YZiFLA@mail.gmail.com>
Subject: Re: [PATCH 2/4] drm/nouveau: dispnv50: Remove nv50_mstc_best_encoder()
To: Lyude Paul <lyude@redhat.com>
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
Cc: David Airlie <airlied@linux.ie>, nouveau <nouveau@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBTZXAgMTMsIDIwMTkgYXQgNjowNSBQTSBMeXVkZSBQYXVsIDxseXVkZUByZWRoYXQu
Y29tPiB3cm90ZToKPgo+IFdoZW4gZHJtX2Nvbm5lY3Rvcl9oZWxwZXJfZnVuY3MtPmF0b21pY19i
ZXN0X2VuY29kZXIgaXMgZGVmaW5lZCwKPiAtPmJlc3RfZW5jb2RlciBpcyBpZ25vcmVkIGJvdGgg
YnkgdGhlIGF0b21pYyBtb2Rlc2V0dGluZyBoZWxwZXJzLiBUaGF0CgpCeSBib3RoIHRoZSBhdG9t
aWMgbW9kZXNldHRpbmcgaGVscGVycyBhbmQgLi4uICh1c3VhbGx5ICJib3RoIiBpbXBsaWVzIDIg
dGhpbmdzKQoKPiBiZWluZyBzYWlkLCB0aGlzIGhvb2sgaXMgY29tcGxldGVseSBicm9rZW4gYW55
d2F5IC0gaXQgYWx3YXlzIHJldHVybnMKPiB0aGUgZmlyc3QgbXN0byBmb3IgYSBnaXZlbiBtc3Rj
LCBkZXNwaXRlIHRoZSBmYWN0IGl0IG1pZ2h0IGFscmVhZHkgYmUgaW4KPiB1c2UuCj4KPiBTbywg
anVzdCBnZXQgcmlkIG9mIGl0LiBXZSdsbCBuZWVkIHRoaXMgaW4gYSBtb21lbnQgYW55d2F5LCB3
aGVuIHdlIG1ha2UKPiBtc3RvcyBwZXItaGVhZCBhcyBvcHBvc2VkIHRvIHBlci1jb25uZWN0b3Iu
Cj4KPiBTaWduZWQtb2ZmLWJ5OiBMeXVkZSBQYXVsIDxseXVkZUByZWRoYXQuY29tPgo+IC0tLQo+
ICBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNwbnY1MC9kaXNwLmMgfCA5IC0tLS0tLS0tLQo+
ICAxIGZpbGUgY2hhbmdlZCwgOSBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vbm91dmVhdS9kaXNwbnY1MC9kaXNwLmMgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVh
dS9kaXNwbnY1MC9kaXNwLmMKPiBpbmRleCBiNDZiZThhMDkxZTkuLmEzZjM1MGZkZmE4YyAxMDA2
NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNwbnY1MC9kaXNwLmMKPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNwbnY1MC9kaXNwLmMKPiBAQCAtOTIwLDE0ICs5
MjAsNiBAQCBudjUwX21zdGNfYXRvbWljX2Jlc3RfZW5jb2RlcihzdHJ1Y3QgZHJtX2Nvbm5lY3Rv
ciAqY29ubmVjdG9yLAo+ICAgICAgICAgcmV0dXJuICZtc3RjLT5tc3RtLT5tc3RvW2hlYWQtPmJh
c2UuaW5kZXhdLT5lbmNvZGVyOwo+ICB9Cj4KPiAtc3RhdGljIHN0cnVjdCBkcm1fZW5jb2RlciAq
Cj4gLW52NTBfbXN0Y19iZXN0X2VuY29kZXIoc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3Rv
cikKPiAtewo+IC0gICAgICAgc3RydWN0IG52NTBfbXN0YyAqbXN0YyA9IG52NTBfbXN0Yyhjb25u
ZWN0b3IpOwo+IC0KPiAtICAgICAgIHJldHVybiAmbXN0Yy0+bXN0bS0+bXN0b1swXS0+ZW5jb2Rl
cjsKPiAtfQo+IC0KPiAgc3RhdGljIGVudW0gZHJtX21vZGVfc3RhdHVzCj4gIG52NTBfbXN0Y19t
b2RlX3ZhbGlkKHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IsCj4gICAgICAgICAgICAg
ICAgICAgICAgc3RydWN0IGRybV9kaXNwbGF5X21vZGUgKm1vZGUpCj4gQEAgLTk5MCw3ICs5ODIs
NiBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9jb25uZWN0b3JfaGVscGVyX2Z1bmNzCj4gIG52
NTBfbXN0Y19oZWxwID0gewo+ICAgICAgICAgLmdldF9tb2RlcyA9IG52NTBfbXN0Y19nZXRfbW9k
ZXMsCj4gICAgICAgICAubW9kZV92YWxpZCA9IG52NTBfbXN0Y19tb2RlX3ZhbGlkLAo+IC0gICAg
ICAgLmJlc3RfZW5jb2RlciA9IG52NTBfbXN0Y19iZXN0X2VuY29kZXIsCj4gICAgICAgICAuYXRv
bWljX2Jlc3RfZW5jb2RlciA9IG52NTBfbXN0Y19hdG9taWNfYmVzdF9lbmNvZGVyLAo+ICAgICAg
ICAgLmF0b21pY19jaGVjayA9IG52NTBfbXN0Y19hdG9taWNfY2hlY2ssCj4gIH07Cj4gLS0KPiAy
LjIxLjAKPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
