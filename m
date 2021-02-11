Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E693C318FA7
	for <lists+dri-devel@lfdr.de>; Thu, 11 Feb 2021 17:14:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 019146EE58;
	Thu, 11 Feb 2021 16:14:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29FD36EE57
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Feb 2021 16:14:15 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id m13so4674327wro.12
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Feb 2021 08:14:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Goqlu3JXKMReLC4SR77jOg8JxDCrzP1nU/r5BPFSSK0=;
 b=W3JlD3isxQ8G58UGHWfk8yycc3J1N7fHXura8tSPzT3UIkQIzfjEVr/njq112mBqny
 0G8u3IrsvWPjLY9nBEZH0D0sUKVBRays37ShMyeHUVyjF81DVzXrD0gAGvVpIjKb24ij
 4ihmvJv+DlrvQDoj6sgplotlz/pst1BPpjTYZzsD1J7gVE+aNCnh/WvbxzoCehqz3vzh
 4ge3jylKzCbwAHo+A3LLMi7wHIpcftL+zbHNhb2VnvvZJzZzKHZ7tSIQQyb4zOq6wkjF
 kmpIQDxAkAaGKVFGzoAXyJuVG4ZexdRkR/UdsFJuVubP1Q1nnVA9YTW3KabT8gHTNJzM
 6psg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Goqlu3JXKMReLC4SR77jOg8JxDCrzP1nU/r5BPFSSK0=;
 b=q4N29zHeqbK+CkORcfWOJ0hxmGBkiI8KS5IHtoWokwnlnRN+ywadVBCuAZ5lMg2T1T
 9+NL7jqEl4knjn2lHaV8qH9Eu3oZYZP76Dl3534GlrDUhxAQUYph2lAOwdTbvbyZKfN2
 2VFJi8Xb3QiwKckECQoqpP5jbWxVHzMvYJWZCE9JAyjm6T8Kz/o7qiw1+XLNF9TmFhAW
 NM2sKjMjCKM/DrBJTwbIvZrWp6U47gOyD+wJyXiyEPP4Gs1/Y25FulTazsmZgVd4sgmz
 OADc91ZeMuPZ74MMwBUonIYVLiQAN4g0aawsJ98eGpLPXsB771sPqk+mGWFywbDoh0yG
 DEnw==
X-Gm-Message-State: AOAM531VLoL+y1W7rhCl4nEnc9RNeD4CkRagAfIh+YSQdJBxZ8jaKADh
 RQHqXsbIgfx9afFiHybAyzz0jeczcmbCWOoelSkKCA==
X-Google-Smtp-Source: ABdhPJw1VbHolp6OI710JYcFMS4lEOw3gN3HU42P/b3FKSOvjr/V/w4gobgGceB8ouofxB0yYf/0MWda4ul4033xRvE=
X-Received: by 2002:adf:fb0c:: with SMTP id c12mr6466342wrr.6.1613060053758;
 Thu, 11 Feb 2021 08:14:13 -0800 (PST)
MIME-Version: 1.0
References: <20210210001401.463-1-manasi.d.navare@intel.com>
 <YCPcrusmPxj0iGxz@phenom.ffwll.local>
 <vpyQ2PWoypdzSDLBjlqvQW_zi3sOkPdCOWS_MuxLId4i5HFb3ulnEWkVreU1mEYxcN9bKIB0iV_TpgMBEDaREA7bhZVUFVkTaA5d1DJHhLI=@emersion.fr>
 <YCP2l7PDMTE2a0Eh@intel.com>
In-Reply-To: <YCP2l7PDMTE2a0Eh@intel.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Thu, 11 Feb 2021 16:14:02 +0000
Message-ID: <CAPj87rOZgAD0FJOD+4X2vniV8PP6dMLSn6fDzaf-rP00JYoDeA@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH] Revert "drm/atomic: document and enforce
 rules around "spurious" EBUSY"
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
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
 dri-devel <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAxMCBGZWIgMjAyMSBhdCAxNTowNywgVmlsbGUgU3lyasOkbMOkCjx2aWxsZS5zeXJq
YWxhQGxpbnV4LmludGVsLmNvbT4gd3JvdGU6Cj4gT24gV2VkLCBGZWIgMTAsIDIwMjEgYXQgMDE6
Mzg6NDVQTSArMDAwMCwgU2ltb24gU2VyIHdyb3RlOgo+ID4gVGhlIFdBUk5fT04gb25seSBoYXBw
ZW5zIGlmIGFsbG93X21vZGVzZXQgPT0gZmFsc2UuIElmIGFsbG93X21vZGVzZXQgPT0gdHJ1ZSwK
PiA+IHRoZW4gdGhlIGRyaXZlciBpcyBhbGxvd2VkIHRvIHN0ZWFsIGFuIHVucmVsYXRlZCBwaXBl
Lgo+ID4KPiA+IE1heWJlIGk5MTUgaXMgc3RlYWxpbmcgYSBwaXBlIHdpdGhvdXQgYWxsb3dfbW9k
ZXNldD8KPgo+IE5vLiBBbGwgcGFnZSBmbGlwcyBldGMuIHdpbGwgaGF2ZSB0byBnZXQgc3BsaXQg
dXAgaW50ZXJuYWxseQo+IGJldHdlZW4gbXVsdGlwbGUgY3J0Y3MuCgpJIHRoaW5rIHRoaXMgaXMg
dGhlIHNhbGllbnQgcG9pbnQuCgo+IFNvIEkgdGhpbmsgdGhlcmUncyBiYXNpY2FsbHkgdGhyZWUg
b3B0aW9uczoKPiBhKSBtYXNzaXZlIHJld3JpdGUgb2YgaTkxNSB0byBieXBhc3MgZXZlbiBtb3Jl
IG9mIGRybV9hdG9taWMgc3R1ZmYKPiBiKSBhbGxvdyBpOTE1IHRvIHNpbGVuY2UgdGhhdCB3YXJu
aW5nLCB3aGljaCBvcGVucyB1cCB0aGUgcXVlc3Rpb24KPiAgICB3aGV0aGVyIHRoZSB3YXJuIGlz
IGRvaW5nIGFueSBnb29kIGlmIGl0IGNhbiBqdXN0IGJlIGJ5cGFzc2VkCj4gYykgbnVrZSB0aGUg
d2FybmluZyBlbnRpcmVseQo+Cj4gYSkgaXMgbm90IGdvaW5nIHRvIGhhcHBlbiwgYW5kIGl0IHdv
dWxkIGFueSB3YXkgYWxsb3cgaTkxNSB0bwo+IGRvIHRoaW5ncyBhbnkgd2hpY2ggd2F5IGl0IHdh
bnRzIHdpdGhvdXQgdHJpcHBpbmcgdGhlIHdhcm4sCj4gcmVuZGVyaW5nIHRoZSB3YXJuIGVudGly
ZWx5IHRvb3RobGVzcy4KPgo+IEhtbS4gTWF5YmUgdGhlcmUgaXMgYSBkKSB3aGljaCB3b3VsZCBi
ZSB0byBpZ25vcmUgYWxsIGNydGNzCj4gdGhhdCBhcmUgbm90IGxvZ2ljYWxseSBlbmFibGVkIGlu
IHRoZSB3YXJuPyBOb3Qgc3VyZSBpZiB0aGF0Cj4gY291bGQgYWxsb3cgc29tZXRoaW5nIHRvIHNs
aXQgdGhyb3VnaCB0aGF0IHBlb3BsZSB3YW50IGl0IHRvCj4gY2F0Y2g/CgpTbyBmcm9tIHdoYXQg
SSB1bmRlcnN0YW5kLCBpZiBJIGVuYWJsZSBDUlRDIDQ0IGFuZCB0aGUgZHJpdmVyCm1hZ2ljYWxs
eSBkZWNpZGVzIHRvIHNwbGl0IGl0IHVwIGFzIGEgJ2JpZy1qb2luZXInIG91dHB1dCwgaXQgd2ls
bAphbHNvIHN0ZWFsIENSVEMgNTAgdG8gd29yayBhcyB0aGUgb3RoZXIgaGFsZiBvZiB0aGUgb3V0
cHV0LiBUaGVuIGlmIEkKYXR0YWNoIHBsYW5lIDQ3IHRvIENSVEMgNDQsIHBvc3RpbmcgYSBGQiB0
byBwbGFuZSA0NyB3aWxsIHJlc3VsdCBpbiBtZQpnZXR0aW5nIGF0b21pYyBjb21wbGV0aW9uIGV2
ZW50cyBmb3IgYm90aCBDUlRDIDQ0IGFuZCBDUlRDIDUwPwoKVGhhdCdzIG5vdCBPSyBmcm9tIGEg
dXNlcnNwYWNlIHBlcnNwZWN0aXZlLiBJZiB5b3Ugd2FudCB0byBkbyBtYWdpYyB0bwpjcmVhdGUg
dGhlIGlsbHVzaW9uIG9mIGEgc2luZ2xlIENSVEMsIHRoZW4gdGhhdCBtYWdpYyBuZWVkcyB0byBi
ZQpjb25zaXN0ZW50LiBBdCB0aGUgbW9tZW50IGl0J3MgdGhlIHdvcnN0IGtpbmQgb2YgbWFnaWM6
IGl0IGRvZXMKaW1wbGljaXQgdGhpbmdzIHVuZGVyIHRoZSBob29kIGZvciB5b3UsIGJ1dCB0aGVu
IGxlYWtzIGFsbCBvZiB0aGUKYmVoaW5kLXRoZS1zY2VuZXMgZGV0YWlsIGludG8gdXNlcnNwYWNl
LgoKQ29udGludWluZyB3aXRoIHRoYXQgd291bGQgZm9yY2UgdXMgYWxsIHRvIGp1c3QgaWdub3Jl
IHdoYXRldmVyIGV2ZW50cwp3ZSBzZWUsIGJlY2F1c2Ugd2UgY2FuJ3QgcmVhc29uIGFib3V0IHdo
YXQgdGhleSBtYXkgYmUgb3Igd2h5IHRoZXkncmUKZ2VuZXJhdGVkLiBXaGljaCBkb2Vzbid0IGFs
bG93IGZvciBhbnkga2luZCBvZiBiZXN0IHByYWN0aWNlIGluCnVzZXJzcGFjZS4KCkNoZWVycywK
RGFuaWVsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
