Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B3987C3AD
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2019 15:36:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E15E89D84;
	Wed, 31 Jul 2019 13:35:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com
 [IPv6:2607:f8b0:4864:20::e41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F2BB89D84
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2019 13:35:57 +0000 (UTC)
Received: by mail-vs1-xe41.google.com with SMTP id v6so46198692vsq.4
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2019 06:35:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=MIMw5H6iIxpIbcRt4La7mYyvxB24NeD4JH6pH3etDNg=;
 b=Lo6SC31PSpgaVKfQeXeD2IdHyNG923bY1rysvRdUfdc3LVagwFTTKgz99eK5aLZ/2B
 JFHkVanDETxYpvG1jHjntmKhl5XJNpsMfzIXBauTxxtPu4Le4QNX/x5cCrPGcvzGvfSl
 wZx2X1nbtPPmUgGqYybCPaAuazbcLs837AnnQOC7BnpPJJjmCkT/KO4DaqbahBzS9Mfs
 53B+Qe75qO86Txsb2ZJCJt7xQDnJZwo3Lf4VsGDSCs+ax971fH/T3Pvpls2QS/91CNdv
 z2jrAFTVkx0jXvnPGU3Jyn3BidK4OMrJ+roE4jrk/jZpCqDIG1NOa2tnV95yWaR08A4J
 Vckw==
X-Gm-Message-State: APjAAAUbLHz0D3Y0uWrQ5XJ3NgfB99Wkgw1XBzbgqj++pBnuAENMo2lV
 mxzxV7NRWXwi67Ye1uEBG3vz1DeyVkFW7yRGAJFh21zR
X-Google-Smtp-Source: APXvYqx8mIrrxbVpXBs/X9EgLFRxu7Afm7Q3tIsaBfv3Gg5ciWZ/5uExXboQ3RsOBuv8zwnwym8BsxqQJMkfomvdk+M=
X-Received: by 2002:a67:ebcb:: with SMTP id y11mr66997667vso.138.1564580156222; 
 Wed, 31 Jul 2019 06:35:56 -0700 (PDT)
MIME-Version: 1.0
References: <20190729195526.13337-1-noralf@tronnes.org>
 <20190729195526.13337-5-noralf@tronnes.org>
 <ae0a000f-df7e-6c08-9a50-a5ed22a2845e@tronnes.org>
 <CAKMK7uH8S9xZNFNJkmrEjSasb0v6tnL5OMZRC-KyXiNiJj2U9A@mail.gmail.com>
 <20190730171245.GE14551@arch-x1c3>
 <86b74e21-8a86-3c7b-9d32-2e6613004715@tronnes.org>
In-Reply-To: <86b74e21-8a86-3c7b-9d32-2e6613004715@tronnes.org>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Wed, 31 Jul 2019 14:35:16 +0100
Message-ID: <CACvgo515hKjBU6NyGFTA+qGY2FXcE1DyZmFNJNM-f4J4HVOfMw@mail.gmail.com>
Subject: Re: [RFC 4/4] drm/panel/ili9341: Support mi0283qt
To: =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=MIMw5H6iIxpIbcRt4La7mYyvxB24NeD4JH6pH3etDNg=;
 b=dWtpxWCNrRMKUILQ4S+QEm2tnXiIKj/2c/1XIR8oq/LI1hFFB/H0Sn4trXn/MZHibp
 NcKS2eOYfEKtlG/RsbBMdn+FwBRxCvPot8zjXYz8i9A/z6XdgySUYGZT93bVx7aRiM0+
 pOZSSYj6Zoz2RMYJQCo0wMnEzz5oPaPSjdlNXeDeHqdWbPcYQiW4SV//8xnMAMaQv7j1
 AZnmQejbf/gExw13t7ldJFGxLk+EGfK3FCMtYdwAO2k9NjSS9FU3hK4Y7+dt6UNEx7Xt
 qM+/5s8zWQ3O/B8+0oFiq04wJqOYfGSirIjWtpTkGffacOvB65eCY7CxtFBw1DZXja/6
 nQ9g==
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Josef Lusticky <josef@lusticky.cz>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAzMCBKdWwgMjAxOSBhdCAxODozMywgTm9yYWxmIFRyw7hubmVzIDxub3JhbGZAdHJv
bm5lcy5vcmc+IHdyb3RlOgo+IERlbiAzMC4wNy4yMDE5IDE5LjEyLCBza3JldiBFbWlsIFZlbGlr
b3Y6Cj4gPiBPbiAyMDE5LzA3LzMwLCBEYW5pZWwgVmV0dGVyIHdyb3RlOgo+ID4+IE9uIFR1ZSwg
SnVsIDMwLCAyMDE5IGF0IDQ6MzAgUE0gTm9yYWxmIFRyw7hubmVzIDxub3JhbGZAdHJvbm5lcy5v
cmc+IHdyb3RlOgo+ID4+Pgo+ID4+Pgo+ID4+Pgo+ID4+PiBEZW4gMjkuMDcuMjAxOSAyMS41NSwg
c2tyZXYgTm9yYWxmIFRyw7hubmVzOgo+ID4+Pj4gU2lnbmVkLW9mZi1ieTogTm9yYWxmIFRyw7hu
bmVzIDxub3JhbGZAdHJvbm5lcy5vcmc+Cj4gPj4+PiAtLS0KPiA+Pj4+ICBkcml2ZXJzL2dwdS9k
cm0vcGFuZWwvcGFuZWwtaWxpdGVrLWlsaTkzNDEuYyB8IDE3OSArKysrKysrKysrKysrKysrKyst
Cj4gPj4+PiAgMSBmaWxlIGNoYW5nZWQsIDE3MCBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygt
KQo+ID4+Pj4KPiA+Pj4KPiA+Pj4gSSBoYXZlIHJlYWxpc2VkIHRoYXQgdGhpcyB3aWxsIGNoYW5n
ZSB0aGUgRFJNIGRyaXZlciBuYW1lIGZyb20gbWkwMjgzcXQKPiA+Pj4gdG8gZHJtX21pcGlfZGJp
LiBUaGlzIG1lYW5zIHRoYXQgdGhpcyBwYW5lbCB3aWxsIGxvb3NlIGl0cyBNRVNBIGttc3JvWzFd
Cj4gPj4+IHN1cHBvcnQuIEkgaGF2ZW4ndCB0cmllZCBpdCwgYnV0IHRoaXMgaXMgdGhlIGZpcnN0
IHRoaW5nIHRoYXQgZ2l2ZXMgdGhpcwo+ID4+PiBkcml2ZXIgYW55IHJlYWwgYWR2YW50YWdlIG92
ZXIgaXRzIGZiZGV2IGNvdW50ZXJwYXJ0IGluCj4gPj4+IGRyaXZlcnMvc3RhZ2luZy9mYnRmdCwg
c28gSSBkb24ndCB3YW50IHRvIGxvb3NlIHRoYXQuCj4gPj4+IFNvIGV2ZW4gaWYgTUlQSSBEQkkg
cGFuZWwgc3VwcG9ydCBpcyBpbXBsZW1lbnRlZCBpbiBzb21lIGZvcm0sIEkgd2lsbAo+ID4+PiB3
YWl0IHdpdGggY29udmVydGluZyBtaTAyODNxdCB1bnRpbCBzb21lb25lIGhhcyB1cGRhdGVkIHRo
ZSBrbXNybyBkcml2ZXIuCj4gPj4KPiA+PiBXaHkgZG9lcyBpdCBjaGFuZ2U/IFlvdSBzaG91bGQg
YmUgYWJsZSB0byBzdHVmZiB3aGF0ZXZlciB5b3UgZmVlbCBsaWtlCj4gPj4gaW50byB0aGUgZHJt
IGRyaXZlciBuYW1lLCB0aGlzIGRvZXNuJ3QgaGF2ZSB0byBtYXRjaCBlaXRoZXIgeW91cgo+ID4+
IHBsYXRmb3JtL3NwaS93aGF0ZXZlciBkcml2ZXIgbmFtZSBub3IgdGhlIG1vZHVsZSBvcHRpb24u
Cj4gPgo+ID4gTGFzdCB0aW1lIGkndmUgbG9va2VkIERSTSBkcml2ZXJzIHVzaW5nIHRoZSBtaXBp
IGRzaSBoZWxwZXJzIGRvIF9ub3RfCj4gPiBoYXZlICJkcm1fbWlwaV9kc2kiIGFzIHRoZWlyIGRy
aXZlciBuYW1lLiBIZW5jZSBkcml2ZXJzIHVzaW5nIHRoZSBtaXBpCj4gPiBkYmkgc2hvdWxkIG5v
dCBoYXZlICJkcm1fbWlwaV9kYmkiLgo+ID4KPgo+IFdoYXQgcHVycG9zZSBkb2VzIHRoZSBEUk0g
ZHJpdmVyIG5hbWUgc2VydmUgZm9yIHVzZXJzcGFjZT8KPiBXaHkgY2FuJ3QgaXQgYmUgY2FsbGVk
IGRybV9taXBpX2RiaT8gQmVjYXVzZSBtdWx0aXBsZSBwYW5lbCBkcml2ZXJzIHdpbGwKPiB1c2Ug
dGhlIHNhbWUgbmFtZT8gWW91J3JlIHN0YXRlbWVudCBpbXBsaWVzIHRoYXQgdGhlcmUgYXJlIHNv
bWUgcnVsZXMKPiByZWdhcmRpbmcgRFJNIGRyaXZlciBuYW1pbmcuCj4KQXMgeW91IHBvaW50IG91
dCBpbiB0aGUga21zcm8gY2FzZSAtIHdlIHVzZSB0aG9zZSB0byAicGFpciIgS01TIHdpdGggR1BV
IGRldmljZS4KV2UgY291bGQgdXNlIGFub3RoZXIsIG1vcmUgcm9idXN0IHNvbHV0aW9uLCB5ZXQg
RVRJTUUgc28gdGhpcyB3aWxsIGRvIGZvciBub3cuCgo+ID4gVGhhdCBzYWlkLCB3ZSBzaG91bGQg
cHJvYmFibHkgaGlnaGxpZ2h0IGV2ZW4gbW9yZSB0aGF0IHRoZSBkcml2ZXIgbmFtZQo+ID4gaXMg
YW4gQUJJLgo+ID4KPgo+IFRoaXMgSSBkaWRuJ3Qga25vdy4KPgpPbmUgc2ltcGxlIGV4YW1wbGUg
dGhhdCBoYXMgZXhpc3RlZCBmb3IgeWVhcnMgaXMgYW1kZ3B1IHZzIHJhZGVvbiBkaXN0aW5jdGlv
bi4KSW4gTWVzYSB0aGUgcmFkZW9uc2kgZHJpdmVyIGNvdWxkIHVzZSBlaXRoZXIgZHJpdmVyLiBB
bHRob3VnaAppbnRlcmFjdGluZyB3aXRoIGVhY2ggb25lIGhhcHBlbnMgdmlhIGEgZGlmZmVyZW50
IHNldCBvZiBpb2N0bHMuCkFkZGl0aW9uYWxseSwgYSBkaWZmZXJlbnQgc2V0IG9mIGZlYXR1cmVz
IChhbmQgd29ya2Fyb3VuZHMpIGlzIHVzZWQKZGVwZW5kaW5nIG9uIHRoZSB2ZXJzaW9uIGV4cG9z
ZWQgYnkgdGhlIGRyaXZlci4KCkFsbCB0aGVzZSBmaWVsZHMgKGFuZCBhIGJpdCBtb3JlKSBhcmUg
ZXhwb3NlZCB0byB1c2Vyc3BhY2UgdmlhIHRoZQpkcm1fdmVyc2lvbigpIGZ1bmN0aW9uL2lvY3Rs
LgoKSFRICkVtaWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
