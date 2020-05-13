Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CBC01D0FB8
	for <lists+dri-devel@lfdr.de>; Wed, 13 May 2020 12:30:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EAD66E057;
	Wed, 13 May 2020 10:29:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com
 [IPv6:2607:f8b0:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B29726E057
 for <dri-devel@lists.freedesktop.org>; Wed, 13 May 2020 10:29:58 +0000 (UTC)
Received: by mail-oi1-x243.google.com with SMTP id b18so20977613oic.6
 for <dri-devel@lists.freedesktop.org>; Wed, 13 May 2020 03:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=nlqVvSX1IwDoToribmvJoK6Qqfwdo65lg7byAyA3AZg=;
 b=gJMdPqGLCdfpERpMk3LObKOtoL1zShZJ3ki3xLatxSQ4aXqYlgmvip948Yod1PsZBo
 /dGQebBy3ylVrdmQaTRpUclKrTet4a38xsneFS00ybg84z76ddSldIEOkF7cErSr0qO8
 Ja9LOlB4awYyxBMOHT6zXpx5lbXgcXYaB+RRY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=nlqVvSX1IwDoToribmvJoK6Qqfwdo65lg7byAyA3AZg=;
 b=OE/QMzLur9sLthzodlqg7d6yWiNdBwoIEiXr2QD+6jRrVMqyU97Pj4d0KbtqUsqDEE
 zsNiTapE/DTM9CHgUJ0Sb6+Nw3RizMgfRw54l1E0+qgr2bl+wULVo/z34ieXDpzseo6u
 r8gxz3M/vhPwlMxjZF7giwVauxyqM4alOm1fb1g3SgEEq6E3kdvPz04jMAVlJeiQEjg0
 SXCalvjq/QZsM4/OvAWz8Bvtiq63RKcIraOhz37VMJsWf3ioR6pUKEsIIbbS5VWkFSsZ
 eMZitd3RFKYcmziy1CEB2AiAfAN8g8Tc2Cz2S7nE7OFtdn72qUluLEt+amA4/eVRMZS1
 GnbQ==
X-Gm-Message-State: AGi0PubSOr+NT3lbK2/54Ed48Nh4m2MBT3ADEZ6xkweOl/bEMRWlTmMO
 Wa/9nW9ZdWmWAkH5qeYamAI9UkN+cDjWnwctneafBQ==
X-Google-Smtp-Source: APiQypJkrmct0pHUCMnZXMcm2TTYPnW85A5TKQcXmKzS9JhyW8X/YhsBJYJQX7FDwE1W/SRWTnxH1x4S/6F+xegxCPU=
X-Received: by 2002:aca:2113:: with SMTP id 19mr18039574oiz.128.1589365798078; 
 Wed, 13 May 2020 03:29:58 -0700 (PDT)
MIME-Version: 1.0
References: <d249c339-fa3f-4440-bbc8-c9cf08338174@physik.fu-berlin.de>
 <CADnq5_NkD4+AMbNJceOJVSeBbJNQ3KDJq-kb7aHyF2jW8Y6dOA@mail.gmail.com>
 <CALjTZvZcg60rgDux7+Kh3zaMBkd-OiqoJ7GyYrLxfvnwgc4Xng@mail.gmail.com>
 <CADnq5_M61r7CMtfMBx6Cf_N9SnJJn0PouiMjVg8wytEMF1YZfw@mail.gmail.com>
 <c5d29422-21bd-b786-c822-5643730ab8a6@daenzer.net>
 <CALjTZvZOHyEFVv-2RV94dFKDFQY4zxYEHt5uQ+1B48Npo4AwRw@mail.gmail.com>
 <alpine.DEB.2.02.2005121124110.28199@scenergy.dfmk.hu>
 <CADnq5_PwY5czTPepDwzc5qoMJ3cKc4Mui=uN=k1EOtmOD42Log@mail.gmail.com>
 <CAKMK7uG3R4uve41MkkcFSiDJ+p=MwW81gcFW7NFENjKbdDUZ+g@mail.gmail.com>
 <CADnq5_NFDjOzgnjHOHEcjacd2dX1kA1QEzHp8=NweZg_b-82-A@mail.gmail.com>
 <CAKMK7uHv_Hj8BB8t_i=EXx1C4WXw1PnmxuTyNfrA=b5eQMaSLg@mail.gmail.com>
 <CALjTZvZNb-KbdZwM3kLU4yK8zH+NSh35k=iBtfGJMF1xyjpSFg@mail.gmail.com>
 <69696543-7c0e-604d-ed29-721b1b99d44e@daenzer.net>
In-Reply-To: <69696543-7c0e-604d-ed29-721b1b99d44e@daenzer.net>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 13 May 2020 12:29:46 +0200
Message-ID: <CAKMK7uGiFOcEdHUNxxRMr1urX7JDFtgSEnc2TzCWG1UJ=ygN2w@mail.gmail.com>
Subject: Re: [RFC] Remove AGP support from Radeon/Nouveau/TTM
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
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Rui Salvaterra <rsalvaterra@gmail.com>,
 "debian-powerpc@lists.debian.org" <debian-powerpc@lists.debian.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 "Karoly Balogh \(Charlie/SGR\)" <charlie@scenergy.dfmk.hu>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBNYXkgMTMsIDIwMjAgYXQgMTI6MjYgUE0gTWljaGVsIETDpG56ZXIgPG1pY2hlbEBk
YWVuemVyLm5ldD4gd3JvdGU6Cj4KPiBPbiAyMDIwLTA1LTEzIDExOjI4IGEubS4sIFJ1aSBTYWx2
YXRlcnJhIHdyb3RlOgo+ID4gT24gV2VkLCAxMyBNYXkgMjAyMCBhdCAwODoxOSwgRGFuaWVsIFZl
dHRlciA8ZGFuaWVsQGZmd2xsLmNoPiB3cm90ZToKPiA+Pgo+ID4+IGk5MTUgaXMgZXZlbiB3b3Jz
ZSwgd2UgbWFudWFsbHkgbWVzcyBhcm91bmQgd2l0aCBjbGZsdXNoLiBJbgo+ID4+IHVzZXJzcGFj
ZS4gU28gcmVhbGx5IHRoZXJlJ3MgMiBheGlzIGZvciBkbWEgbWVtb3J5OiBjb2hlcmVudCB2cy4K
PiA+PiBub24tY29oZXJlbnQgKHdoaWNoIGlzIHNvbWV0aGluZyB0aGUgZG1hLWFwaSBzb21ld2hh
dCBleHBvc2VkKSwgaS5lLgo+ID4+IGRvIHlvdSBuZWVkIHRvIGNsZmx1c2ggb3Igbm90LCBhbmQg
Y2FjaGVkIHZzIHVuY2FjaGVkLCBpLmUuIGFyZSB0aGUKPiA+PiBQQVQgZW50cmllcyB3YyBvciB3
Yi4KPiA+Cj4gPiBTbywgdGhlIFBvd2VyUEMgQUdQIEdBUlQgZW5kcyB1cCBiZWluZyBjYWNoZWQg
YW5kIG5vbi1jb2hlcmVudCwgcmlnaHQKPiA+IChhc3N1bWluZyB0aGVyZSdzIG5vIHdheSB0byBz
ZXQgdGhlIHBhZ2UgYXR0cmlidXRlcyBNVFJSL1BBVC1zdHlsZSk/Cj4KPiBJdCB3YXMgdW5jYWNo
ZWQgd2hlbiBJIHdhcyB1c2luZyBteSBsYXN0LWdlbiBQb3dlckJvb2sgKHVudGlsIGEgZmV3Cj4g
eWVhcnMgYWdvKSwgdGhvdWdoIGl0J3MgcG9zc2libGUgdGhhdCBicm9rZSBzaW5jZSB0aGVuLiBJ
IGRvbid0IHJlbWVtYmVyCj4gdGhlIGRldGFpbHMgaG93IGl0J3MgZG9uZSBvZmZoYW5kIHRob3Vn
aC4KPgo+IFRoZSBvbmx5IHRoZW9yZXRpY2FsIHByb2JsZW0gdGhlcmUgd2FzIHRoYXQgdGhlIGtl
cm5lbCBzdGlsbCBoYWQgYQo+IGNhY2hlYWJsZSBtYXBwaW5nIG9mIHRoZSBzYW1lIG1lbW9yeSwg
YW5kIGFueSBhY2Nlc3MgdmlhIHRoYXQgKGUuZy4KPiBwcmVmZXRjaCBkdWUgdG8gYWNjZXNzIHRv
IGEgbmVpZ2hib3VyaW5nIHBhZ2UpIGNvdWxkIHRyaWdnZXIgYSBtYWNoaW5lCj4gY2hlY2suIEJ1
dCBJIGRvbid0IHJlbWVtYmVyIGV2ZXIgaGl0dGluZyB0aGF0LiBNYXliZSBJIHdhcyBqdXN0IGx1
Y2t5Cj4gYWxsIHRob3NlIHllYXJzLgoKQXQgbGVhc3Qgb24gYXJtIHRoaXMgaGFzIGJlZW4gYSBi
aWcgdG9waWMsIHNpbmNlIGl0IGluZGVlZCByYW5kb21seQpraWxscyBtYWNoaW5lcy4gVGhhdCdz
IHdoeSB5b3UgY2FuJ3QgcmVtYXAgcmFuZG9tIHBhZ2VzIGFzIHdjLCB0aGV5CmhhdmUgdG8gYmUg
aW4gaGlnaG1lbS4gSSB0aG91Z2h0IHBwYyBpcyBlcXVhbGx5IGVhc2lseSBhbmdlcmVkLiBBbmQK
dGhlIHRyb3VibGUgaXMgdGhhdCBqdXN0IHRoZSBleGlzdGFuY2Ugb2YgdGhlIG1hcHBpbmcgaXMg
ZW5vdWdoIHRvCmNhdXNlIGEgbWFjaGluZSBjaGVjayBleGNlcHRpb24gaWlyYy4gU28gZG93biB0
byBwdXJlIGx1Y2suCi1EYW5pZWwKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIs
IEludGVsIENvcnBvcmF0aW9uCis0MSAoMCkgNzkgMzY1IDU3IDQ4IC0gaHR0cDovL2Jsb2cuZmZ3
bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
