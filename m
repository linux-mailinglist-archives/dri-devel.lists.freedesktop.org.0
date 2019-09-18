Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 95731B6EDB
	for <lists+dri-devel@lfdr.de>; Wed, 18 Sep 2019 23:30:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D397973D00;
	Wed, 18 Sep 2019 21:30:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5345A73D22
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Sep 2019 21:30:45 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id e17so1355793ljf.13
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Sep 2019 14:30:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DgXcHi6LumSKsXK0wFWEwwduH7TINsc4eJamWRt8yTs=;
 b=EEYct8ufmELENK5t9tMLfgKb7QePmR7f4Mn1IKF3G6UCBv0dNi7o0xwXC74iv6qWNr
 UZvirzRWi2cLLBp2csI4gW2Ya7a57RcnelqAdXMETcqDYpHVP+ldHcEHFat0bF5KkjX4
 aEpU54GgaY+AsGt11uXrhuow5LvQVmEveEJQjS8eSMgfLYpOM1efGGuSsepkyNqxtiln
 n9ZNiz5cdnskkeOZ2Gd/J87T2HGHjmFTv8M4vV3atu+Ci1ik4YYfHuPyD0wdakItFW3z
 bV7GNL7DGwFpTK2OYOFv8Rnt9lr9WHFTC/ubHMs6/TJfEI+9RbvJLTB07uQNJjkfOaEB
 QKFw==
X-Gm-Message-State: APjAAAVtwrJyGnVDAJpl9k+O2IXRpS/egUQesXcgLRili1d7imxwnOHz
 2awQ/slxzUvT8kXnrAHPL6HZuFin0jbbe5oqlwkMpw==
X-Google-Smtp-Source: APXvYqyePKGlRziWEiHqR1qCoWiek3z/Uuv9JUuFQfSQKcMTIWc0oHevPua7uJ+FXlrkyvhPX4Ql7ZnUm8YdPD30Qh8=
X-Received: by 2002:a2e:5b9a:: with SMTP id m26mr3392352lje.90.1568842243447; 
 Wed, 18 Sep 2019 14:30:43 -0700 (PDT)
MIME-Version: 1.0
References: <20190909134241.23297-1-ayan.halder@arm.com>
 <20190917125301.GQ3958@phenom.ffwll.local>
 <CAPj87rPKp1ogZhk_fMrsX885zkAh1PB4usNQUd4KxNFUv4vsFw@mail.gmail.com>
 <20190918120406.2ylkxx2rqsbhn2te@e110455-lin.cambridge.arm.com>
In-Reply-To: <20190918120406.2ylkxx2rqsbhn2te@e110455-lin.cambridge.arm.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Wed, 18 Sep 2019 22:30:12 +0100
Message-ID: <CAPj87rOc3MvkjrX1qHpGuVUaGLuZiC7QYBO9v3T2NS+dicLC1g@mail.gmail.com>
Subject: Re: [RFC PATCH] drm:- Add a modifier to denote 'protected' framebuffer
To: Liviu Dudau <Liviu.Dudau@arm.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=DgXcHi6LumSKsXK0wFWEwwduH7TINsc4eJamWRt8yTs=;
 b=vNFdVJ4Cy7O0KvtSmfLAMZIlx2ACs+W2rohq5rc57FADo2r7TLRP84H/5yLIk1n/Oo
 CE0vwxDAWySlGwvp3ZH3lB7X7IhP1ItywFul3J7t1n0hC3aFEVhMziVOVXy5T2lxNYp4
 aUeIYCDF0Rl3JX/RHpOKkLexC2a1tk5adVMrwXwY1OEEDJ5m2+ueFrAWaRE0+ciFjNaJ
 m8E+XeqK4nA+wVkO7ZOI8PoQhq3lL4wA4nl7Ra5LQ+LTW4lkE8EYhhLACASslmWDs/e2
 Fhh0x6XH4xpO1dwZ/8OOwmNFDdND6qrL2s0hlSGUSSq5wGQFKc/nd3NYm3ch7OVcMTV4
 mwXA==
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
Cc: nd <nd@arm.com>, "maxime.ripard@bootlin.com" <maxime.ripard@bootlin.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "airlied@linux.ie" <airlied@linux.ie>, Ayan Halder <Ayan.Halder@arm.com>,
 "sean@poorly.run" <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTGl2aXUsCgpPbiBXZWQsIDE4IFNlcCAyMDE5IGF0IDEzOjA0LCBMaXZpdSBEdWRhdSA8TGl2
aXUuRHVkYXVAYXJtLmNvbT4gd3JvdGU6Cj4gT24gV2VkLCBTZXAgMTgsIDIwMTkgYXQgMDk6NDk6
NDBBTSArMDEwMCwgRGFuaWVsIFN0b25lIHdyb3RlOgo+ID4gSSB0b3RhbGx5IGFncmVlLiBGcmFt
ZWJ1ZmZlcnMgYXJlbid0IGFib3V0IHRoZSB1bmRlcmx5aW5nIG1lbW9yeSB0aGV5Cj4gPiBwb2lu
dCB0bywgYnV0IGFib3V0IGhvdyB0byBfaW50ZXJwcmV0XyB0aGF0IG1lbW9yeTogaXQgZGVjb3Jh
dGVzIGEKPiA+IHBvaW50ZXIgd2l0aCB3aWR0aCwgaGVpZ2h0LCBzdHJpZGUsIGZvcm1hdCwgZXRj
LCB0byBhbGxvdyB5b3UgdG8gbWFrZQo+ID4gc2Vuc2Ugb2YgdGhhdCBtZW1vcnkuIEkgc2VlIGNv
bnRlbnQgcHJvdGVjdGlvbiBhcyBiZWluZyB0aGUgc2FtZSBhcwo+ID4gcGh5c2ljYWwgY29udGln
dWl0eSwgd2hpY2ggaXMgYSBwcm9wZXJ0eSBvZiB0aGUgdW5kZXJseWluZyBtZW1vcnkKPiA+IGl0
c2VsZi4gUmVnYXJkbGVzcyBvZiB0aGUgd2lkdGgsIGhlaWdodCwgb3IgZm9ybWF0LCB5b3UganVz
dCBjYW5ub3QKPiA+IGFjY2VzcyB0aGF0IG1lbW9yeSB1bmxlc3MgaXQncyB1bmRlciB0aGUgYXBw
cm9wcmlhdGUgKCdzZWN1cmUgZW5vdWdoJykKPiA+IGNvbmRpdGlvbnMuCj4gPgo+ID4gU28gSSB0
aGluayBhIGRtYWJ1ZiBhdHRyaWJ1dGUgd291bGQgYmUgbW9zdCBhcHByb3ByaWF0ZSwgc2luY2Ug
dGhhdCdzCj4gPiB3aGVyZSB5b3UgaGF2ZSB0byBkbyBhbGwgeW91ciBNTVUgaGFuZGxpbmcsIGFu
ZCBldmVyeXRoaW5nIGVsc2UgeW91Cj4gPiBuZWVkIHRvIGRvIHRvIGFsbG93IGFjY2VzcyB0byB0
aGF0IGJ1ZmZlciwgYW55d2F5Lgo+Cj4gSXNuJ3QgaXQgaG93IEFNRCBjdXJyZW50bHkgaW1wbGVt
ZW50cyBwcm90ZWN0ZWQgYnVmZmVycyBhcyB3ZWxsPwoKTm8gaWRlYSB0byBiZSBob25lc3QsIEkg
aGF2ZW4ndCBzZWVuIGFueXRoaW5nIHVwc3RyZWFtLgoKPiA+IFRoZXJlJ3MgYSBsb3Qgb2YgY29t
cGxleGl0eSBiZXlvbmQganVzdCAnaXQncyBwcm90ZWN0ZWQnOyBmb3IKPiA+IGluc3RhbmNlLCBz
b21lIENQIHByb3ZpZGVycyBtYW5kYXRlIHRoYXQgdGhlaXIgY29udGVudCBjYW4gb25seSBiZQo+
ID4gc3RyZWFtZWQgb3ZlciBIRENQIDIuMiBUeXBlLTEgd2hlbiBnb2luZyB0aHJvdWdoIGFuIGV4
dGVybmFsCj4gPiBjb25uZWN0aW9uLiBPbmUgd2F5IHlvdSBjb3VsZCBkbyB0aGF0IGlzIHRvIHVz
ZSBhIHNlY3VyZSB3b3JsZAo+ID4gKGV4dGVybmFsIGNvbnRyb2xsZXIgbGlrZSBJbnRlbCdzIE1F
LCBvciBDUFUtaW50ZXJuYWwgZW5jbGF2ZSBsaWtlIFNHWAo+ID4gb3IgVEVFKSB0byBleGFtaW5l
IHRoZSBkaXNwbGF5IHBpcGUgY29uZmlndXJhdGlvbiwgYW5kIG9ubHkgdGhlbiBhbGxvdwo+ID4g
YWNjZXNzIHRvIHRoZSBidWZmZXJzIGFuZC9vciBrZXlzLiBTdHVmZiBsaWtlIHRoYXQgaXMgYWx3
YXlzIGdvaW5nIHRvCj4gPiBiZSBvdXQgaW4gdGhlIHJlYWxtIG9mIHZlbmRvciAmIHByb2R1Y3Qt
cG9saWN5LXNwZWNpZmljIGFkZC1vbnMsIGJ1dAo+ID4gaXQgc2hvdWxkIGJlIHBvc3NpYmxlIHRv
IGFncmVlIG9uIGF0IGxlYXN0IHRoZSBiYXNpYyBtZWNoYW5pY3MgYW5kCj4gPiBleHBlY3RhdGlv
bnMgb2YgYSBzZWN1cmUgcGF0aCB3aXRob3V0IHRoaW5ncyBsaWtlIHRoYXQuCj4KPiBJIGFsc28g
ZXhwZWN0IHRoYXQgZ29pbmcgdGhyb3VnaCB0aGUgc2VjdXJlIHdvcmxkIHdpbGwgYmUgcHJldHR5
IG11Y2ggdHJhbnNwYXJlbnQgZm9yCj4gdGhlIGtlcm5lbCBkcml2ZXIsIGFzIHRoZSBtb3N0IGxp
a2VseSBoYXJkd2FyZSBpbXBsZW1lbnRhdGlvbnMgd291bGQgZW5hYmxlCj4gYWRkaXRpb25hbCBz
aWduYWxpbmcgdGhhdCB3aWxsIGdldCB0cmFwcGVkIGFuZCBoYW5kbGVkIGJ5IHRoZSBzZWN1cmUg
T1MuIEknbSBub3QKPiB0cnlpbmcgdG8gc2ltcGxpZnkgdGhpbmdzLCBqdXN0IHRha2luZyB0aGUg
c3RhbmNlIHRoYXQgaXQgaXMgdXNlcnNwYWNlIHRoYXQgaXMKPiBjb29yZGluYXRpbmcgYWxsIHRo
aXMsIHdlJ3JlIHRyeWluZyBvbmx5IHRvIGZpbmQgYSBjb21tb24gZ3JvdW5kIG9uIGhvdyB0byBo
YW5kbGUKPiB0aGlzIGluIHRoZSBrZXJuZWwuCgpZZWFoLCBtYWtlcyBzZW5zZS4KCkFzIGEgc3Ry
YXdtYW4sIGhvdyBhYm91dCBhIG5ldyBmbGFnIHRvIGRybVByaW1lSGFuZGxlVG9GRCgpIHdoaWNo
IHNldHMKdGhlICdwcm90ZWN0ZWQnIGZsYWcgb24gdGhlIHJlc3VsdGluZyBkbWFidWY/CgpDaGVl
cnMsCkRhbmllbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
