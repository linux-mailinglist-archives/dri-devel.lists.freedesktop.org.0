Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C506819E608
	for <lists+dri-devel@lfdr.de>; Sat,  4 Apr 2020 17:11:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CE3E6E22C;
	Sat,  4 Apr 2020 15:11:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DB5E6E15A;
 Sat,  4 Apr 2020 15:11:25 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id w26so13013832edu.7;
 Sat, 04 Apr 2020 08:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=0ei6i/+VGJhIvoDfkwW5mzuzQfMnSAhEY9hUkVjXVmA=;
 b=HhHZROjEuw6Fus4iZtJT8fKvJYJnQFzXHB/gchKvrpELkfMW3FLHuIQOzbJ8CDDXl8
 KQ4HGuFzSuQ6g83SeFMTTee/FKj2qQLR+5DIztpIu1+BPdyLEbiZnlF42WTMC0oWIo8/
 mPghZscP1DEMtjLiuZzO1Eo1jthENJ0NyQLFzJJyzmoVKEdlAmXtW+jVSRCERuY5yzQs
 oz0VWpviOAiwJa8av5sviptlhHymquLz1k7e03+xPESlDxyQpI/RRzP3gNQmyGvF6NnV
 Ci4mzk5RmLDhu2+P3K9CcUJryKlcPygEXF2XI4kYLgCD9WQgcjJlTvHm+1GxQdEEHrMb
 KQrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=0ei6i/+VGJhIvoDfkwW5mzuzQfMnSAhEY9hUkVjXVmA=;
 b=HVp8jVU2kebNmDTQRcWOPzAXmvO2rGrvwST+J4Rxg6MMWO3lMwbm3GShDkpUfSaHvy
 OOEqskHoTCtHiBo5eesl7GRhdkb3+EiZMRi6oTtyqw5+OzTQPlyrIvVvKPo46Sh07AL3
 VchqMytEkriFPek53NTEnXXQW2JozQbDWNyw3EKREVZW4u1FGKsMt87bNMs+uZL5Ig5E
 DI/mujTgdBLjjshPBVHRfsjLYb0XyPLtEaoQzjts2fvxw0URAKCE19mWvwbyX/NDbQON
 Jjppn299SCuc+7vGNnJ4Yv3HZp4aZP0w0rtM/Tak34/yWEuGWUyedqEpHhGvAkAXm5GG
 rhyQ==
X-Gm-Message-State: AGi0PuYquSLFSVuvJTxyXLp1FfMgEXLWemTVKQTPF+Tnbuy6W2TsS9gV
 a4Nqjmmb+rti1W4h6GFZzvvhmpgXSYW/g7EgqbI=
X-Google-Smtp-Source: APiQypKnKcPHewvob8kHiGKubsSx6yoHJrFkHA8LrBnpSpmtTM0YWBRdM4SaIw2DBiZSSM87nEOYFu4MHEFS4DHiTVs=
X-Received: by 2002:a17:906:6992:: with SMTP id
 i18mr13107081ejr.293.1586013084543; 
 Sat, 04 Apr 2020 08:11:24 -0700 (PDT)
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
In-Reply-To: <3cddf1aa-5072-af7c-c51e-c16039176f6c@daenzer.net>
From: Rob Clark <robdclark@gmail.com>
Date: Sat, 4 Apr 2020 08:11:23 -0700
Message-ID: <CAF6AEGuNTtHfNm_nRhPFX5wPRmKkjnFEKqTdTSBDjpLkaiN8Fw@mail.gmail.com>
Subject: Re: [Mesa-dev] [Intel-gfx] gitlab.fd.o financial situation and impact
 on services
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
Cc: Erik Faye-Lund <erik.faye-lund@collabora.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>,
 =?UTF-8?Q?Timur_Krist=C3=B3f?= <timur.kristof@gmail.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 "X.Org development" <xorg-devel@lists.x.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Nicolas Dufresne <nicolas@ndufresne.ca>,
 "X.Org Foundation Board" <board@foundation.x.org>,
 Xorg Members List <members@x.org>, Jason Ekstrand <jason@jlekstrand.net>,
 Mesa Dev <mesa-dev@lists.freedesktop.org>,
 wayland <wayland-devel@lists.freedesktop.org>,
 Discussion of the development of and with GStreamer
 <gstreamer-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBBcHIgMywgMjAyMCBhdCA3OjEyIEFNIE1pY2hlbCBEw6RuemVyIDxtaWNoZWxAZGFl
bnplci5uZXQ+IHdyb3RlOgo+Cj4gT24gMjAyMC0wMy0wMSA2OjQ2IGEubS4sIE1hcmVrIE9sxaHD
oWsgd3JvdGU6Cj4gPiBGb3IgTWVzYSwgd2UgY291bGQgcnVuIENJIG9ubHkgd2hlbiBNYXJnZSBw
dXNoZXMsIHNvIHRoYXQgaXQncyBhIHN0cmljdGx5Cj4gPiBwcmUtbWVyZ2UgQ0kuCj4KPiBUaGFu
a3MgZm9yIHRoZSBzdWdnZXN0aW9uISBJIGltcGxlbWVudGVkIHNvbWV0aGluZyBsaWtlIHRoaXMg
Zm9yIE1lc2E6Cj4KPiBodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvbWVzYS9tZXNhLy0v
bWVyZ2VfcmVxdWVzdHMvNDQzMgo+CgpJIHdvdWxkbid0IG1pbmQgbWFudWFsbHkgdHJpZ2dlcmlu
ZyBwaXBlbGluZXMsIGJ1dCB1bmxlc3MgdGhlcmUgaXMKc29tZSB0cmljayBJJ20gbm90IHJlYWxp
emluZywgaXQgaXMgc3VwZXIgY3VtYmVyc29tZS4gIEllLiB5b3UgaGF2ZSB0bwpjbGljayBmaXJz
dCB0aGUgY29udGFpbmVyIGpvYnMuLiB0aGVuIHdhaXQuLiB0aGVuIHRoZSBidWlsZCBqb2JzLi4K
dGhlbiB3YWl0IHNvbWUgbW9yZS4uIGFuZCB0aGVuIGZpbmFsbHkgdGhlIGFjdHVhbCBydW5uZXJz
LiAgVGhhdCB3b3VsZApiZSBhIHJlYWwgc3RlcCBiYWNrIGluIHRlcm1zIG9mIHVzZWZ1bG5lc3Mg
b2YgQ0kuLiBvbmUgbWlnaHQgY2FsbCBpdCBhCnJlZ3Jlc3Npb24gOi0oCgpJcyB0aGVyZSBhIHBv
c3NpYmxlIG1pZGRsZSBncm91bmQgd2hlcmUgcHJlLW1hcmdlIHBpcGVsaW5lcyB0aGF0IHRvdWNo
CmEgcGFydGljdWxhciBkcml2ZXIgdHJpZ2dlciB0aGF0IGRyaXZlcidzIENJIGpvYnMsIGJ1dCBN
UnMgdGhhdCBkb24ndAp0b3VjaCB0aGF0IGRyaXZlciBidXQgZG8gdG91Y2ggc2hhcmVkIGNvZGUg
ZG9uJ3QgdW50aWwgdHJpZ2dlcmVkIGJ5Cm1hcmdlPyAgSWUuIGlmIEkgaGF2ZSBhIE1SIHRoYXQg
b25seSB0b3VjaGVzIG5pciwgaXQncyBwcm9iYWJseSBvayB0bwpub3QgcnVuIGZyZWVkcmVubyBq
b2JzIHVudGlsIG1hcmdlIHRyaWdnZXJzIGl0LiAgQnV0IGlmIEkgaGF2ZSBhIE1SCnRoYXQgaXMg
dG91Y2hpbmcgZnJlZWRyZW5vLCBJJ2QgcmVhbGx5IHJhdGhlciBub3QgaGF2ZSB0byB3YWl0IHVu
dGlsCm1hcmdlIHRyaWdnZXJzIHRoZSBmcmVlZHJlbm8gQ0kgam9icy4KCkJ0dywgSSB3YXMgdW5k
ZXIgdGhlIGltcHJlc3Npb24gKGZyb20gcGVyaW9kaWNhbGx5IHNraW1taW5nIHRoZSBsb2dzCmlu
ICNmcmVlZGVza3RvcCwgc28gSSBjb3VsZCB3ZWxsIGJlIG1pc3Npbmcgb3IgbWlzdW5kZXJzdGFu
ZGluZwpzb21ldGhpbmcpIHRoYXQgY2FjaGluZy9ldGMgaGFkIGJlZW4gaW1wcm92ZWQgYW5kIG1l
c2EncyBwYXJ0IG9mIHRoZQplZ3Jlc3Mgd2Fzbid0IHRoZSBiaWdnZXIgaXNzdWUgYXQgdGhpcyBw
b2ludD8KCkJSLAotUgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWwK
