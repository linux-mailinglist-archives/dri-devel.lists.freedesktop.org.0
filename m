Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 23BDC19FC58
	for <lists+dri-devel@lfdr.de>; Mon,  6 Apr 2020 20:01:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0077B6E462;
	Mon,  6 Apr 2020 18:00:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8CEE6E478;
 Mon,  6 Apr 2020 18:00:52 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id c7so648169edl.2;
 Mon, 06 Apr 2020 11:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=MuT6OFSpOq6D2Htl1FsDrWBioWDz7LCLM+O4dnJpIbI=;
 b=ZuLuqZrzQfEtr+L+5Dp2hTbGeTwEKhfDg9qzhFcpCTKyPKsbYBu6o/gNVszErlf+vF
 RO6NGKIhho414A1HiFnHy2kMKfocca+i9uMM8KAwYDC5uvPI7Hl8zW3fItt+/nuoYEjy
 kVudDL/Vx5Fu4PGz706j4bLBZyT3eoy0VJc8amlGQP+wj2G59sQyd4ynLIBYTDUEKCbN
 y1fyaa91yuuvGrXMsrqYaPp5F8QLCrdSeaqBU9ZGDaMVdlW0cUXZp8WE5vv19wUnshWa
 Fm4aUPSTGUBlXF8f23GN2e9Rm3PsYMVy3+rEhiN9CGSSlF0rFogHevm7dmjn9i9cJGNh
 E7iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=MuT6OFSpOq6D2Htl1FsDrWBioWDz7LCLM+O4dnJpIbI=;
 b=b4MWl5bLzNM0SeFplWpnve6qOkmCbUqEFcL1J65PCqqSFbTInsJN+vCerRScp22ctF
 PjE/9rPRPlsmbMk5gOYv9ljupKM6ylL8UBIqdCtswERG3LDRdIll4rXO/dX8eE0d2n18
 zav8sOMOZuM4e7iO1M5bHL1TLdKm/Iao/IY6BdgUavN/exSlUsU3/VD8FWdtaYlWsGA8
 KScQBgRAyEV1KKSCOawXI5zWuIbjbEmAtmtRDmzoDpzZjX/AziQzUh/HvDuwDfpcnJym
 YHEHqJX6/QeOtfvYYc/Cpew74zAis0CqXZszV6W7oLvnwFWfantXf7URxbNKG9rWG/th
 XyGA==
X-Gm-Message-State: AGi0Pua/1fbPwaNaT9I3Ni66Lh47j+hyAY5fVv7P7ICLdJqVdyl8OTTL
 Q4xEWXw/LpUzzRA/8sDW1xruVzCwjTIqV+rrDuQ=
X-Google-Smtp-Source: APiQypLA4gZ25BNo5kxJOdgKbFrlwdUQoSGxVGVReSv57GgSO+DLINL8SOpkW+vnTj+VkvhitG1nRfAIzc+ZsnJlilk=
X-Received: by 2002:a17:906:1001:: with SMTP id 1mr637755ejm.267.1586196051208; 
 Mon, 06 Apr 2020 11:00:51 -0700 (PDT)
MIME-Version: 1.0
References: <CAKMK7uHHK2SsCfpmZwEUyTJJHsoccKoadoko3cEBOoYDFkmeAw@mail.gmail.com>
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
 <CAF6AEGtnxmCCakT65zJ7BY=11E_+DgttamBggD10SahtsXuxEQ@mail.gmail.com>
 <0d2d9669-3240-ff60-328d-77933499442a@daenzer.net>
In-Reply-To: <0d2d9669-3240-ff60-328d-77933499442a@daenzer.net>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 6 Apr 2020 11:00:51 -0700
Message-ID: <CAF6AEGvY7hQvohGY0OXBG1DWzRChYdNC9PpOgzuWabh927Jogg@mail.gmail.com>
Subject: Re: gitlab.fd.o financial situation and impact on services
To: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 "X.Org development" <xorg-devel@lists.x.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 wayland <wayland-devel@lists.freedesktop.org>,
 "X.Org Foundation Board" <board@foundation.x.org>,
 Xorg Members List <members@x.org>, dri-devel <dri-devel@lists.freedesktop.org>,
 Mesa Dev <mesa-dev@lists.freedesktop.org>,
 Discussion of the development of and with GStreamer
 <gstreamer-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBBcHIgNiwgMjAyMCBhdCAxMDowNCBBTSBNaWNoZWwgRMOkbnplciA8bWljaGVsQGRh
ZW56ZXIubmV0PiB3cm90ZToKPgo+IE9uIDIwMjAtMDQtMDYgNjozNCBwLm0uLCBSb2IgQ2xhcmsg
d3JvdGU6Cj4gPgo+ID4gVGhlIGlkZWFsIHRoaW5nIHdvdWxkIGJlIHRvIGJlIGFibGUgdG8gY2xp
Y2sgYW55IGpvYnMgdGhhdCB3ZSB3YW50IHRvCj4gPiBydW4sIHNheSAiYXJtNjRfYTYzMF9nbGVz
MzEiLCBhbmQgZm9yIGdpdGxhYiB0byByZWFsaXplIHRoYXQgaXQgbmVlZHMKPiA+IHRvIGF1dG9t
YXRpY2FsbHkgdHJpZ2dlciBkZXBlbmRlbmNpZXMgb2YgdGhhdCBqb2IgKG1lc29uLWFybTY0LCBh
bmQKPiA+IGFybV9idWlsZCthcm1fdGVzdCkuICBCdXQgbm90IHN1cmUgaWYgdGhhdCBpcyBhIHRo
aW5nIGdpdGxhYiBjYW4gZG8uCj4KPiBOb3QgdGhhdCBJIGtub3cgb2YuIFRoZSBkZXBlbmRlbmN5
IGhhbmRsaW5nIGlzIHN0aWxsIHByZXR0eSBydWRpbWVudGFyeQo+IGluIGdlbmVyYWwuCj4KPgo+
ID4gVHJpZ2dlcmluZyBqdXN0IHRoZSBmaXJzdCBjb250YWluZXIgam9icyBhbmQgaGF2aW5nIGV2
ZXJ5dGhpbmcgZnJvbQo+ID4gdGhlcmUgcnVuIGF1dG9tYXRpY2FsbHkgd291bGQgYmUgb2sgaWYg
dGhlIGN1cnJlbnQgcnVsZXMgdG8gZmlsdGVyIG91dAo+ID4gdW5uZWVkZWQgam9icyBzdGlsbCBh
cHBseSwgaWUuIGEgcGFuZnJvc3QgY2hhbmdlIGlzbid0IHRyaWdnZXJpbmcKPiA+IGZyZWVkcmVu
byBDSSBqb2JzIGFuZCB2aXNhIHZlcnNhLiAgQnV0IHRiaCBJIGRvbid0IHVuZGVyc3RhbmQgZW5v
dWdoCj4gPiBvZiB3aGF0IHRoYXQgTVIgaXMgZG9pbmcgdG8gdW5kZXJzdGFuZCBpZiB0aGF0IGlz
IHdoYXQgaXQgZG9lcy4gIChJdAo+ID4gd2FzIHN1Z2dlc3RlZCBvbiBJUkMgdGhhdCB0aGlzIGlz
IHByb2JhYmx5IHdoYXQgaXQgZG9lcy4pCj4KPiBJdCBpcy4gRmlsdGVyZWQgam9icyBkb24ndCBl
eGlzdCBhdCBhbGwgaW4gdGhlIHBpcGVsaW5lLCBzbyB0aGV5IGNhbid0Cj4gYmUgdHJpZ2dlcmVk
IGJ5IGFueSBtZWFucy4gOikKPgoKYWhoLCBvaywgSSBkaWRuJ3QgcmVhbGl6ZSB0aGF0Li4gdGh4
IGZvciB0aGUgZXhwbGFpbmF0aW9uCgpCUiwKLVIKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVsCg==
