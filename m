Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D1D901D0FE4
	for <lists+dri-devel@lfdr.de>; Wed, 13 May 2020 12:32:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0ACB26E9AA;
	Wed, 13 May 2020 10:32:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.178])
 by gabe.freedesktop.org (Postfix) with ESMTP id 42CA86E9AA
 for <dri-devel@lists.freedesktop.org>; Wed, 13 May 2020 10:32:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id 9C9B92A6048;
 Wed, 13 May 2020 12:32:53 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id uc2rehZeFuDv; Wed, 13 May 2020 12:32:53 +0200 (CEST)
Received: from thor (252.80.76.83.dynamic.wline.res.cust.swisscom.ch
 [83.76.80.252])
 by netline-mail3.netline.ch (Postfix) with ESMTPSA id 0DA862A6045;
 Wed, 13 May 2020 12:32:53 +0200 (CEST)
Received: from localhost ([::1]) by thor with esmtp (Exim 4.93)
 (envelope-from <michel@daenzer.net>)
 id 1jYoh2-000ryh-Iv; Wed, 13 May 2020 12:32:52 +0200
Subject: Re: [RFC] Remove AGP support from Radeon/Nouveau/TTM
To: Daniel Vetter <daniel@ffwll.ch>
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
 <CAKMK7uGiFOcEdHUNxxRMr1urX7JDFtgSEnc2TzCWG1UJ=ygN2w@mail.gmail.com>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
Message-ID: <6bdda31c-f1a4-558c-7f60-111c5e733fbd@daenzer.net>
Date: Wed, 13 May 2020 12:32:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <CAKMK7uGiFOcEdHUNxxRMr1urX7JDFtgSEnc2TzCWG1UJ=ygN2w@mail.gmail.com>
Content-Language: en-CA
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
Cc: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Rui Salvaterra <rsalvaterra@gmail.com>,
 "debian-powerpc@lists.debian.org" <debian-powerpc@lists.debian.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 "Karoly Balogh \(Charlie/SGR\)" <charlie@scenergy.dfmk.hu>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAyMC0wNS0xMyAxMjoyOSBwLm0uLCBEYW5pZWwgVmV0dGVyIHdyb3RlOgo+IE9uIFdlZCwg
TWF5IDEzLCAyMDIwIGF0IDEyOjI2IFBNIE1pY2hlbCBEw6RuemVyIDxtaWNoZWxAZGFlbnplci5u
ZXQ+IHdyb3RlOgo+Pgo+PiBPbiAyMDIwLTA1LTEzIDExOjI4IGEubS4sIFJ1aSBTYWx2YXRlcnJh
IHdyb3RlOgo+Pj4gT24gV2VkLCAxMyBNYXkgMjAyMCBhdCAwODoxOSwgRGFuaWVsIFZldHRlciA8
ZGFuaWVsQGZmd2xsLmNoPiB3cm90ZToKPj4+Pgo+Pj4+IGk5MTUgaXMgZXZlbiB3b3JzZSwgd2Ug
bWFudWFsbHkgbWVzcyBhcm91bmQgd2l0aCBjbGZsdXNoLiBJbgo+Pj4+IHVzZXJzcGFjZS4gU28g
cmVhbGx5IHRoZXJlJ3MgMiBheGlzIGZvciBkbWEgbWVtb3J5OiBjb2hlcmVudCB2cy4KPj4+PiBu
b24tY29oZXJlbnQgKHdoaWNoIGlzIHNvbWV0aGluZyB0aGUgZG1hLWFwaSBzb21ld2hhdCBleHBv
c2VkKSwgaS5lLgo+Pj4+IGRvIHlvdSBuZWVkIHRvIGNsZmx1c2ggb3Igbm90LCBhbmQgY2FjaGVk
IHZzIHVuY2FjaGVkLCBpLmUuIGFyZSB0aGUKPj4+PiBQQVQgZW50cmllcyB3YyBvciB3Yi4KPj4+
Cj4+PiBTbywgdGhlIFBvd2VyUEMgQUdQIEdBUlQgZW5kcyB1cCBiZWluZyBjYWNoZWQgYW5kIG5v
bi1jb2hlcmVudCwgcmlnaHQKPj4+IChhc3N1bWluZyB0aGVyZSdzIG5vIHdheSB0byBzZXQgdGhl
IHBhZ2UgYXR0cmlidXRlcyBNVFJSL1BBVC1zdHlsZSk/Cj4+Cj4+IEl0IHdhcyB1bmNhY2hlZCB3
aGVuIEkgd2FzIHVzaW5nIG15IGxhc3QtZ2VuIFBvd2VyQm9vayAodW50aWwgYSBmZXcKPj4geWVh
cnMgYWdvKSwgdGhvdWdoIGl0J3MgcG9zc2libGUgdGhhdCBicm9rZSBzaW5jZSB0aGVuLiBJIGRv
bid0IHJlbWVtYmVyCj4+IHRoZSBkZXRhaWxzIGhvdyBpdCdzIGRvbmUgb2ZmaGFuZCB0aG91Z2gu
Cj4+Cj4+IFRoZSBvbmx5IHRoZW9yZXRpY2FsIHByb2JsZW0gdGhlcmUgd2FzIHRoYXQgdGhlIGtl
cm5lbCBzdGlsbCBoYWQgYQo+PiBjYWNoZWFibGUgbWFwcGluZyBvZiB0aGUgc2FtZSBtZW1vcnks
IGFuZCBhbnkgYWNjZXNzIHZpYSB0aGF0IChlLmcuCj4+IHByZWZldGNoIGR1ZSB0byBhY2Nlc3Mg
dG8gYSBuZWlnaGJvdXJpbmcgcGFnZSkgY291bGQgdHJpZ2dlciBhIG1hY2hpbmUKPj4gY2hlY2su
IEJ1dCBJIGRvbid0IHJlbWVtYmVyIGV2ZXIgaGl0dGluZyB0aGF0LiBNYXliZSBJIHdhcyBqdXN0
IGx1Y2t5Cj4+IGFsbCB0aG9zZSB5ZWFycy4KPiAKPiBBdCBsZWFzdCBvbiBhcm0gdGhpcyBoYXMg
YmVlbiBhIGJpZyB0b3BpYywgc2luY2UgaXQgaW5kZWVkIHJhbmRvbWx5Cj4ga2lsbHMgbWFjaGlu
ZXMuIFRoYXQncyB3aHkgeW91IGNhbid0IHJlbWFwIHJhbmRvbSBwYWdlcyBhcyB3YywgdGhleQo+
IGhhdmUgdG8gYmUgaW4gaGlnaG1lbS4gSSB0aG91Z2h0IHBwYyBpcyBlcXVhbGx5IGVhc2lseSBh
bmdlcmVkLiBBbmQKPiB0aGUgdHJvdWJsZSBpcyB0aGF0IGp1c3QgdGhlIGV4aXN0YW5jZSBvZiB0
aGUgbWFwcGluZyBpcyBlbm91Z2ggdG8KPiBjYXVzZSBhIG1hY2hpbmUgY2hlY2sgZXhjZXB0aW9u
IGlpcmMuIFNvIGRvd24gdG8gcHVyZSBsdWNrLgoKRWl0aGVyIG15c2VsZiBhbmQgb3RoZXJzIHdl
cmUgdmVyeSBsdWNreSB0aGVuIHdpdGggUG93ZXJNYWNzLCBvciBpdCdzCm5vdCBhY3R1YWxseSB0
aGF0IGJhZC4KCgotLSAKRWFydGhsaW5nIE1pY2hlbCBEw6RuemVyICAgICAgICAgICAgICAgfCAg
ICAgICAgICAgICAgIGh0dHBzOi8vcmVkaGF0LmNvbQpMaWJyZSBzb2Z0d2FyZSBlbnRodXNpYXN0
ICAgICAgICAgICAgIHwgICAgICAgICAgICAgTWVzYSBhbmQgWCBkZXZlbG9wZXIKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
