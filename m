Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B8E619FA2E
	for <lists+dri-devel@lfdr.de>; Mon,  6 Apr 2020 18:34:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FBED6E439;
	Mon,  6 Apr 2020 16:34:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA0006E436;
 Mon,  6 Apr 2020 16:34:16 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id m12so213251edl.12;
 Mon, 06 Apr 2020 09:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=TnA8Rk8wwqcheP60jcz2928dl0ycXm9Stb7I95Ppam0=;
 b=qJQXDntKajQ9aUJb6B8NaA6ANsEQ2bY8Pd+kDwCS7yz8tbD0a5bfC6UYaU7vxCK35R
 Ew+Zbher9NacqM3abuh2cSG9iQDSksEyzoBFiE8E+F3lzET0EJepP5GNIbeH6jLj0k1I
 f6D6eRszMCmYxeAXj1B/cWWKxkOgHUqAsNDag4puxIe4fcHBgVlj1doNj6Kp75EvLxym
 EUtJ41/pVIBz4xJSeTT1iOCDGKjepWVYkMbpcrafMqqYpUbILIYdpjoVfYFcL6eJ7UNg
 SlCFBpE7OUVm3NwskEhV5KtC65iNda2xqDIXyxOOcevjHwr8kIWfAnAZ1iTokgFsdojq
 6PrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=TnA8Rk8wwqcheP60jcz2928dl0ycXm9Stb7I95Ppam0=;
 b=QWOs4vSEjgC/1hXKPtyXqofPL/UHSGtyAxGjfleXpJKmhtYMGlAxZR555hyKH6GhDP
 GF14y0j9FEwjK1uJxuH1ouh6hq3LZgXOEmfcsgyxLDnOrrL0bXZoMHl0fs2iSJVpu9Dx
 N1/PWmg6fbshwurNodD0kwxlYKaxHAerWmqGByk8HECa8/8yOBuL/8uOKDwuiz1sHkFD
 4rH09wei0wA0sYL2oe5TkTmXvifRbs9cmMm65BkJ/8QryDS1j1uXOgoxmg4zzsRQ9bSj
 xu+Edcci6V6Rqwvv2VkuxYO/Mwmw0dBnF58rsibHcPVvb75fKSsIOb4I6OZTUzi9+PtF
 dz8Q==
X-Gm-Message-State: AGi0PubpYKdla/37EHAxo4X/9Ee0VFG+tGnn4YuEK9T4hakUG3IsyJtg
 IfFSGJAgBFQn4ry5ddTSUM/b/lFSXXrjouZ8570=
X-Google-Smtp-Source: APiQypI0HpHTiW/l9sVL/Pqetal/Dr+wgJ/U6WAKjCm0zcULQpr2QBfSPLfAisM7AgESMo/ktOmYM1jc32Kd4m9/i3A=
X-Received: by 2002:a17:906:eddb:: with SMTP id
 sb27mr316213ejb.207.1586190855228; 
 Mon, 06 Apr 2020 09:34:15 -0700 (PDT)
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
 <f4d856925111b77012cabb255d6a880ae5637b41.camel@redhat.com>
In-Reply-To: <f4d856925111b77012cabb255d6a880ae5637b41.camel@redhat.com>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 6 Apr 2020 09:34:15 -0700
Message-ID: <CAF6AEGtnxmCCakT65zJ7BY=11E_+DgttamBggD10SahtsXuxEQ@mail.gmail.com>
Subject: Re: [Mesa-dev] [Intel-gfx] gitlab.fd.o financial situation and impact
 on services
To: Adam Jackson <ajax@redhat.com>
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
Cc: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>,
 "X.Org development" <xorg-devel@lists.x.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 wayland <wayland-devel@lists.freedesktop.org>,
 "X.Org Foundation Board" <board@foundation.x.org>,
 Xorg Members List <members@x.org>, dri-devel <dri-devel@lists.freedesktop.org>,
 Mesa Dev <mesa-dev@lists.freedesktop.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Discussion of the development of and with GStreamer
 <gstreamer-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBBcHIgNiwgMjAyMCBhdCA4OjQzIEFNIEFkYW0gSmFja3NvbiA8YWpheEByZWRoYXQu
Y29tPiB3cm90ZToKPgo+IE9uIFNhdCwgMjAyMC0wNC0wNCBhdCAwODoxMSAtMDcwMCwgUm9iIENs
YXJrIHdyb3RlOgo+ID4gT24gRnJpLCBBcHIgMywgMjAyMCBhdCA3OjEyIEFNIE1pY2hlbCBEw6Ru
emVyIDxtaWNoZWxAZGFlbnplci5uZXQ+IHdyb3RlOgo+ID4gPiBPbiAyMDIwLTAzLTAxIDY6NDYg
YS5tLiwgTWFyZWsgT2zFocOhayB3cm90ZToKPiA+ID4gPiBGb3IgTWVzYSwgd2UgY291bGQgcnVu
IENJIG9ubHkgd2hlbiBNYXJnZSBwdXNoZXMsIHNvIHRoYXQgaXQncyBhIHN0cmljdGx5Cj4gPiA+
ID4gcHJlLW1lcmdlIENJLgo+ID4gPgo+ID4gPiBUaGFua3MgZm9yIHRoZSBzdWdnZXN0aW9uISBJ
IGltcGxlbWVudGVkIHNvbWV0aGluZyBsaWtlIHRoaXMgZm9yIE1lc2E6Cj4gPiA+Cj4gPiA+IGh0
dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9tZXNhL21lc2EvLS9tZXJnZV9yZXF1ZXN0cy80
NDMyCj4gPgo+ID4gSSB3b3VsZG4ndCBtaW5kIG1hbnVhbGx5IHRyaWdnZXJpbmcgcGlwZWxpbmVz
LCBidXQgdW5sZXNzIHRoZXJlIGlzCj4gPiBzb21lIHRyaWNrIEknbSBub3QgcmVhbGl6aW5nLCBp
dCBpcyBzdXBlciBjdW1iZXJzb21lLiAgSWUuIHlvdSBoYXZlIHRvCj4gPiBjbGljayBmaXJzdCB0
aGUgY29udGFpbmVyIGpvYnMuLiB0aGVuIHdhaXQuLiB0aGVuIHRoZSBidWlsZCBqb2JzLi4KPiA+
IHRoZW4gd2FpdCBzb21lIG1vcmUuLiBhbmQgdGhlbiBmaW5hbGx5IHRoZSBhY3R1YWwgcnVubmVy
cy4gIFRoYXQgd291bGQKPiA+IGJlIGEgcmVhbCBzdGVwIGJhY2sgaW4gdGVybXMgb2YgdXNlZnVs
bmVzcyBvZiBDSS4uIG9uZSBtaWdodCBjYWxsIGl0IGEKPiA+IHJlZ3Jlc3Npb24gOi0oCj4KPiBJ
IHRoaW5rIHRoYXQncyBtb3N0bHkgYSBjb21wbGFpbnQgYWJvdXQgdGhlIGNvbmRpdGlvbmFscyB3
ZSd2ZSB3cml0dGVuCj4gc28gZmFyLCB0YmguIEFzIEkgY29tbWVudGVkIG9uIHRoZSBidWcsIHdo
ZW4gSSBjbGlja2VkIHRoZSBjb250YWluZXIKPiBqb2IgKHdoaWNoIHRoZSBydWxlcyBoYXBwZW4g
dG8gaGF2ZSBldmFsdWF0ZWQgdG8gYmVpbmcgIm1hbnVhbCIpLCBldmVyeQo+IGpvYiAocmVjdXJz
aXZlbHkpIGRvd25zdHJlYW0gb2YgaXQgZ290IGVucXVldWVkLCB3aGljaCBpc24ndCB3aGF0Cj4g
eW91J3JlIGRlc2NyaWJpbmcuIFNvIEkgdGhpbmsgaWYgeW91IGNhbiBkZXNjcmliZSB0aGUgVVgg
eW91J2QgbGlrZSB3ZQo+IGNhbiB3cml0ZSBydWxlcyB0byBtYWtlIHRoYXQgcmVhbGl0eS4KCk9r
LCBJIHdhcyBmZWFyaW5nIHRoYXQgd2UnZCBoYXZlIHRvIG1hbnVhbGx5IHRyaWdnZXIgZWFjaCBz
dGFnZSBvZgpkZXBlbmRlbmNpZXMgaW4gdGhlIHBpcGVsaW5lLiAgV2hpY2ggd291bGRuJ3QgYmUg
c28gYmFkIGV4Y2VwdCB0aGF0CmdpdGxhYiBtYWtlcyB5b3Ugd2FpdCBmb3IgdGhlIHByZXZpb3Vz
IHN0YWdlIHRvIGNvbXBsZXRlIGJlZm9yZQp0cmlnZ2VyaW5nIHRoZSBuZXh0IG9uZS4KClRoZSBp
ZGVhbCB0aGluZyB3b3VsZCBiZSB0byBiZSBhYmxlIHRvIGNsaWNrIGFueSBqb2JzIHRoYXQgd2Ug
d2FudCB0bwpydW4sIHNheSAiYXJtNjRfYTYzMF9nbGVzMzEiLCBhbmQgZm9yIGdpdGxhYiB0byBy
ZWFsaXplIHRoYXQgaXQgbmVlZHMKdG8gYXV0b21hdGljYWxseSB0cmlnZ2VyIGRlcGVuZGVuY2ll
cyBvZiB0aGF0IGpvYiAobWVzb24tYXJtNjQsIGFuZAphcm1fYnVpbGQrYXJtX3Rlc3QpLiAgQnV0
IG5vdCBzdXJlIGlmIHRoYXQgaXMgYSB0aGluZyBnaXRsYWIgY2FuIGRvLgoKVHJpZ2dlcmluZyBq
dXN0IHRoZSBmaXJzdCBjb250YWluZXIgam9icyBhbmQgaGF2aW5nIGV2ZXJ5dGhpbmcgZnJvbQp0
aGVyZSBydW4gYXV0b21hdGljYWxseSB3b3VsZCBiZSBvayBpZiB0aGUgY3VycmVudCBydWxlcyB0
byBmaWx0ZXIgb3V0CnVubmVlZGVkIGpvYnMgc3RpbGwgYXBwbHksIGllLiBhIHBhbmZyb3N0IGNo
YW5nZSBpc24ndCB0cmlnZ2VyaW5nCmZyZWVkcmVubyBDSSBqb2JzIGFuZCB2aXNhIHZlcnNhLiAg
QnV0IHRiaCBJIGRvbid0IHVuZGVyc3RhbmQgZW5vdWdoCm9mIHdoYXQgdGhhdCBNUiBpcyBkb2lu
ZyB0byB1bmRlcnN0YW5kIGlmIHRoYXQgaXMgd2hhdCBpdCBkb2VzLiAgKEl0CndhcyBzdWdnZXN0
ZWQgb24gSVJDIHRoYXQgdGhpcyBpcyBwcm9iYWJseSB3aGF0IGl0IGRvZXMuKQoKQlIsCi1SCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
