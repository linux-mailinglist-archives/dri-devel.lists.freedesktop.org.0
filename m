Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7188819E704
	for <lists+dri-devel@lfdr.de>; Sat,  4 Apr 2020 20:16:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2152C6E271;
	Sat,  4 Apr 2020 18:16:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3859B6E260;
 Sat,  4 Apr 2020 18:16:10 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id cf14so13435774edb.13;
 Sat, 04 Apr 2020 11:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Lwxcb6OJrzlLU21zkvYVFj+FPcVDHtkSRXkWDYl2ojk=;
 b=YoxuPXGB62a9/ReYFloy4jjV8tB8fHJxjWTndPfdfCYHef2oaWELyJLMwP7hFUMfy1
 U3laXaqAyMD1lENnQA1vktxthiWRK1EUqyEJy0D9Kh5yF9y0O3ZZmRL8qfVZnrkQhhMX
 kJwbnrVubGuyepeT/5D2SWf5nIlJpb4eiwUJeposywD3v/USmKCuhLkN4LzIBzCyEWKR
 XSFD1hn95u8FrAR3sYPoP9nYzgiUgGVl1rtRgu34F/hT0WblyJ8XsVN413u/xfSFyYYj
 vf/lrP8+tjwD2C3twAuywQD+QyKhTL1PWTKXOoXsMV4trQ1b3dukWFAGtDARgwnU+ic1
 dG6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Lwxcb6OJrzlLU21zkvYVFj+FPcVDHtkSRXkWDYl2ojk=;
 b=f38Q3iaJWCQjG2FvStYDNB65tm8/xahiuPhSNN4gDjYv2ix6TIiTcCTthUXzH3NtYy
 paDtK4ktQV4/XuNxFhKVW6mhwQZ1G/4RHEGlpmzEpgpK020Ifj+xxAGr5kJrqqrzP1tu
 uv6UeICw3GDCtsEg4jQtNfFuGg6POLVXgw7wdIQi5bhQPUZuGpNG/T4/9LkIAuo/L6/N
 bMG+b9BdeVLSBLeHJKawpfDp+GdBO6Bv7KgWYv5rHT5yqwUA9TycpOHzptWbwHbvAeDg
 /071j0pgiq7Q7390UN+KukMaEL2FeVprOQ1szLy/19HYWFd54dsnhi4Hy0+SAC46fQ0V
 mBxQ==
X-Gm-Message-State: AGi0Puanqk6PFInX8TpVm8AN8Wk0Ue0h84Wn+k4yQ4dfhcCpy0Zx2DAa
 0K2y2vNQXJPRJr9IyqThHoezQOkJuwZilQ41ElU=
X-Google-Smtp-Source: APiQypLV5jXA7qrHlYCQiJPAQTyG4orDfJsj4kxL6h/GcXYEiyDdmOp4+++QWBG4Zo2l3jcgFPn2R+pbKP6ABWV8pho=
X-Received: by 2002:a17:906:28cf:: with SMTP id
 p15mr14134560ejd.202.1586024168616; 
 Sat, 04 Apr 2020 11:16:08 -0700 (PDT)
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
 <3e5bc9f9416c3f8b2ec52436b40b82cafb717586.camel@ndufresne.ca>
In-Reply-To: <3e5bc9f9416c3f8b2ec52436b40b82cafb717586.camel@ndufresne.ca>
From: Rob Clark <robdclark@gmail.com>
Date: Sat, 4 Apr 2020 11:16:08 -0700
Message-ID: <CAF6AEGuVzvO_wkrsuxahme-9AHOH7D+2yXJXiuRh_e825t_K6w@mail.gmail.com>
Subject: Re: [Mesa-dev] [Intel-gfx] gitlab.fd.o financial situation and impact
 on services
To: Nicolas Dufresne <nicolas@ndufresne.ca>
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
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>,
 "X.Org development" <xorg-devel@lists.x.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 wayland <wayland-devel@lists.freedesktop.org>,
 "X.Org Foundation Board" <board@foundation.x.org>,
 Xorg Members List <members@x.org>, Jason Ekstrand <jason@jlekstrand.net>,
 Mesa Dev <mesa-dev@lists.freedesktop.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Discussion of the development of and with GStreamer
 <gstreamer-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU2F0LCBBcHIgNCwgMjAyMCBhdCAxMDo0NyBBTSBOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFz
QG5kdWZyZXNuZS5jYT4gd3JvdGU6Cj4KPiBMZSBzYW1lZGkgMDQgYXZyaWwgMjAyMCDDoCAwODox
MSAtMDcwMCwgUm9iIENsYXJrIGEgw6ljcml0IDoKPiA+IE9uIEZyaSwgQXByIDMsIDIwMjAgYXQg
NzoxMiBBTSBNaWNoZWwgRMOkbnplciA8bWljaGVsQGRhZW56ZXIubmV0PiB3cm90ZToKPiA+ID4g
T24gMjAyMC0wMy0wMSA2OjQ2IGEubS4sIE1hcmVrIE9sxaHDoWsgd3JvdGU6Cj4gPiA+ID4gRm9y
IE1lc2EsIHdlIGNvdWxkIHJ1biBDSSBvbmx5IHdoZW4gTWFyZ2UgcHVzaGVzLCBzbyB0aGF0IGl0
J3MgYSBzdHJpY3RseQo+ID4gPiA+IHByZS1tZXJnZSBDSS4KPiA+ID4KPiA+ID4gVGhhbmtzIGZv
ciB0aGUgc3VnZ2VzdGlvbiEgSSBpbXBsZW1lbnRlZCBzb21ldGhpbmcgbGlrZSB0aGlzIGZvciBN
ZXNhOgo+ID4gPgo+ID4gPiBodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvbWVzYS9tZXNh
Ly0vbWVyZ2VfcmVxdWVzdHMvNDQzMgo+ID4gPgo+ID4KPiA+IEkgd291bGRuJ3QgbWluZCBtYW51
YWxseSB0cmlnZ2VyaW5nIHBpcGVsaW5lcywgYnV0IHVubGVzcyB0aGVyZSBpcwo+ID4gc29tZSB0
cmljayBJJ20gbm90IHJlYWxpemluZywgaXQgaXMgc3VwZXIgY3VtYmVyc29tZS4gIEllLiB5b3Ug
aGF2ZSB0bwo+ID4gY2xpY2sgZmlyc3QgdGhlIGNvbnRhaW5lciBqb2JzLi4gdGhlbiB3YWl0Li4g
dGhlbiB0aGUgYnVpbGQgam9icy4uCj4gPiB0aGVuIHdhaXQgc29tZSBtb3JlLi4gYW5kIHRoZW4g
ZmluYWxseSB0aGUgYWN0dWFsIHJ1bm5lcnMuICBUaGF0IHdvdWxkCj4gPiBiZSBhIHJlYWwgc3Rl
cCBiYWNrIGluIHRlcm1zIG9mIHVzZWZ1bG5lc3Mgb2YgQ0kuLiBvbmUgbWlnaHQgY2FsbCBpdCBh
Cj4gPiByZWdyZXNzaW9uIDotKAo+Cj4gT24gR1N0cmVhbWVyIHNpZGUgd2UgaGF2ZSBtb3ZlZCBz
b21lIGV4aXN0aW5nIHBpcGVsaW5lIHRvIG1hbnVhbCBtb2RlLgo+IEFzIHdlIHVzZSBuZWVkczog
YmV0d2VlbiBqb2JzLCB3ZSBjb3VsZCBzaW1wbHkgc2V0IHRoZSBmaXJzdCBqb2IgdG8KPiBtYW51
YWwgKGluIG91ciBjYXNlIGl0J3MgYSBzaW5nbGUgam9iIGNhbGxlZCBtYW5pZmVzdCBpbiB5b3Vy
IGNhc2UgaXQKPiB3b3VsZCBiZSB0aGUgTiBjb250YWluZXIgam9icykuIFRoaXMgd2F5IHlvdSBj
YW4gaGF2ZSBhIG1hbnVhbCBwaXBlbGluZQo+IHRoYXQgaXMgdHJpZ2dlcmVkIGluIHNpbmdsZSAo
b3IgZmV3ZXIpIGNsaWNrcy4gSGVyZSdzIGFuIGV4YW1wbGU6Cj4KPiBodHRwczovL2dpdGxhYi5m
cmVlZGVza3RvcC5vcmcvZ3N0cmVhbWVyL2dzdHJlYW1lci9waXBlbGluZXMvMTI4MjkyCj4KPiBU
aGF0IG91ciBwb3N0LW1lcmdlIHBpcGVsaW5lcywgd2Ugb25seSB0cmlnZ2VyIHRoZW4gaWYgd2Ug
c3VzcGVjdCBhCj4gcHJvYmxlbS4KPgoKSSdtIG5vdCBzdXJlIHRoYXQgd291bGQgd29yayBmb3Ig
bWVzYSBzaW5jZSB0aGUgaGllcmFyY2h5IG9mIGpvYnMKYnJhbmNoZXMgb3V0IHByZXR0eSBmYXIu
LiBpZS4gaWYgSSBqdXN0IGNsaWNrZWQgdGhlIGFybTY0IGJ1aWxkICsgdGVzdApjb250YWluZXIg
am9icywgYW5kIGV2ZXJ5dGhpbmcgZWxzZSByYW4gYXV0b21hdGljYWxseSBhZnRlciB0aGF0LCBp
dAp3b3VsZCBlbmQgdXAgcnVubmluZyBhbGwgdGhlIENJIGpvYnMgZm9yIGFsbCB0aGUgYXJtIGRl
dmljZXMgKG9yIGF0CmxlYXN0IGFsbCB0aGUgNjRiIG9uZXMpCgpJJ20gbm90IHN1cmUgd2h5IGdp
dGxhYiB3b3JrcyB0aGlzIHdheSwgYSBtb3JlIHNlbnNpYmxlIGFwcHJvYWNoIHdvdWxkCmJlIHRv
IGNsaWNrIG9uIHRoZSBsYXN0IGpvYnMgeW91IHdhbnQgdG8gcnVuIGFuZCBmb3IgdGhhdCB0bwph
dXRvbWF0aWNhbGx5IHByb3BhZ2F0ZSB1cCB0byBydW4gdGhlIGpvYnMgbmVlZGVkIHRvIHJ1biBj
bGlja2VkIGpvYi4KCkJSLAotUgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWwK
