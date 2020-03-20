Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BDC818C932
	for <lists+dri-devel@lfdr.de>; Fri, 20 Mar 2020 09:50:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB0D16EAF3;
	Fri, 20 Mar 2020 08:50:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.178])
 by gabe.freedesktop.org (Postfix) with ESMTP id 925C26EAF3;
 Fri, 20 Mar 2020 08:50:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id B834F2A6016;
 Fri, 20 Mar 2020 09:50:32 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id RaTPwCQfUc8e; Fri, 20 Mar 2020 09:50:32 +0100 (CET)
Received: from thor (252.80.76.83.dynamic.wline.res.cust.swisscom.ch
 [83.76.80.252])
 by netline-mail3.netline.ch (Postfix) with ESMTPSA id 2838A2A6042;
 Fri, 20 Mar 2020 09:50:32 +0100 (CET)
Received: from localhost ([::1]) by thor with esmtp (Exim 4.93)
 (envelope-from <michel@daenzer.net>)
 id 1jFDM7-0007vl-16; Fri, 20 Mar 2020 09:50:15 +0100
Subject: Re: Plumbing explicit synchronization through the Linux ecosystem
To: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <CAOFGe94jy2VYDPbkMW8ZuNdAeM+HS8sM1OAYFGd9JKc1V7PVOQ@mail.gmail.com>
 <CAAxE2A4q9sZDz8vSLAvT0HH4BGukf8Ug68eqSV1ojqrm_5uFFg@mail.gmail.com>
 <170e13edbb0.27ad.c6988b7ea6112e3e892765a0d4287e0c@jlekstrand.net>
 <CAAxE2A6hMs2Ngd4zEv+hEJnEUKmPDuXmeWUaUU-4YCTRHNzr1w@mail.gmail.com>
 <e470a1d0-cf91-5811-d280-322e005888a8@daenzer.net>
 <CAAxE2A5D2HaqjS52jymMbwOUEsaXG_cMeeA9_esqaC54-52Kgw@mail.gmail.com>
 <ea771b02-b74b-2a89-e55c-2977d641558d@daenzer.net>
 <20200319105129.GF2363188@phenom.ffwll.local>
 <CAAxE2A4-YocvFctj7x4mHe=hMx4Q6DBzjPBisbi+Tmh1UMjCpg@mail.gmail.com>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
Message-ID: <0b547156-ea58-90ab-1ad0-36d8cc433f90@daenzer.net>
Date: Fri, 20 Mar 2020 09:50:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <CAAxE2A4-YocvFctj7x4mHe=hMx4Q6DBzjPBisbi+Tmh1UMjCpg@mail.gmail.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, xorg-devel <xorg-devel@lists.x.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 "wayland-devel @ lists . freedesktop . org"
 <wayland-devel@lists.freedesktop.org>,
 Discussion of the development of and with GStreamer
 <gstreamer-devel@lists.freedesktop.org>, Jason Ekstrand <jason@jlekstrand.net>,
 ML mesa-dev <mesa-dev@lists.freedesktop.org>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAyMC0wMy0xOSA4OjU0IHAubS4sIE1hcmVrIE9sxaHDoWsgd3JvdGU6Cj4gT24gVGh1Liwg
TWFyLiAxOSwgMjAyMCwgMDY6NTEgRGFuaWVsIFZldHRlciwgPGRhbmllbEBmZndsbC5jaD4KPiB3
cm90ZToKPj4gCj4+IFllYWgsIHRoaXMgaXMgZW50aXJlbHkgYWJvdXQgdGhlIHByb2dyYW1taW5n
IG1vZGVsIHZpc2libGUgdG8KPj4gdXNlcnNwYWNlLiBUaGVyZSBzaG91bGRuJ3QgYmUgYW55IGlt
cGFjdCBvbiB0aGUgZHJpdmVyJ3MgY2hvaWNlIG9mCj4+IGEgdG9wIHZzLiBib3R0b20gb2YgdGhl
IGdwdSBwaXBlbGluZSB1c2VkIGZvciBzeW5jaHJvbml6YXRpb24sCj4+IHRoYXQncyBlbnRpcmVs
eSB1cCB0byB3aGF0IHlvdSdyZSBody9kcml2ZXIvc2NoZWR1bGVyIGNhbiBwdWxsCj4+IG9mZi4K
Pj4gCj4+IERvaW5nIGEgZnVsbCBnZnggcGlwZWxpbmUgZmx1c2ggZm9yIHNoYXJlZCBidWZmZXJz
LCB3aGVuIHlvdXIgaHcKPj4gY2FuIGRvIGJlLCBzb3VuZHMgbGlrZSBhbiBpc3N1ZSB0byBtZSB0
aGF0J3Mgbm90IHJlbGF0ZWQgdG8gdGhpcwo+PiBoZXJlIGF0IGFsbC4gSXQgbWlnaHQgYmUgaW50
ZXJ0d2luZWQgd2l0aCBhbWRncHUncyBzcGVjaWFsCj4+IGludGVycHJldGF0aW9uIG9mIGRtYV9y
ZXN2IGZlbmNlcyB0aG91Z2gsIG5vIGlkZWEuIFdlIG1pZ2h0IG5lZWQgdG8KPj4gcmV2YW1wIGFs
bCB0aGF0LiBCdXQgZm9yIGEgdXNlcnNwYWNlIGNsaWVudCB0aGF0IGRvZXMgbm90aGluZyBmYW5j
eQo+PiAobm8gbXVsdGlwbGUgcmVuZGVyIGJ1ZmZlciB0YXJnZXRzIGluIG9uZSBibywgb3Igdmsg
c3R5bGUgIkkgd3JpdGUKPj4gdG8gZXZlcnl0aGluZyBhbGwgdGhlIHRpbWUsIHBlcmhhcHMiIHN0
dWZmKSB0aGVyZSBzaG91bGQgYmUgMCBwZXJmCj4+IGRpZmZlcmVuY2UgYmV0d2VlbiBpbXBsaWNp
dCBzeW5jIHRocm91Z2ggZG1hX3Jlc3YgYW5kIGV4cGxpY2l0IHN5bmMKPj4gdGhyb3VnaCBzeW5j
X2ZpbGUvc3luY29iai9kbWFfZmVuY2UgZGlyZWN0bHkuCj4+IAo+PiBJZiB0aGVyZSBpcyBJJ2Qg
Y29uc2lkZXIgdGhhdCBhIGJpdCBhIGRyaXZlciBidWcuCj4gCj4gTGFzdCB0aW1lIEkgY2hlY2tl
ZCwgdGhlcmUgd2FzIG5vIGZlbmNlIHN5bmMgaW4gZ25vbWUgc2hlbGwgYW5kCj4gY29tcGl6IGFm
dGVyIGFuIGFwcCBwYXNzZXMgYSBidWZmZXIgdG8gaXQuCgpUaGV5IGFyZSBub3QgcmVxdWlyZWQg
KHRob3VnaCBlbmNvdXJhZ2VkKSB0byBkbyB0aGF0LgoKCj4gU28gZHJpdmVycyBoYXZlIHRvIGlu
dmVudCBoYWNrcyB0byB3b3JrIGFyb3VuZCBpdCBhbmQgZGVjcmVhc2UKPiBwZXJmb3JtYW5jZS4g
SXQncyBub3QgYSBkcml2ZXIgYnVnLgo+IAo+IEltcGxpY2l0IHN5bmMgcmVhbGx5IG1lYW5zIHRo
YXQgYXBwcyBhbmQgY29tcG9zaXRvcnMgZG9uJ3Qgc3luYywgc28KPiB0aGUgZHJpdmVyIGhhcyB0
byBndWVzcyB3aGVuIGl0IHNob3VsZCBzeW5jLgoKTWFraW5nIGltcGxpY2l0IHN5bmMgd29yayBj
b3JyZWN0bHkgaXMgdWx0aW1hdGVseSB0aGUga2VybmVsIGRyaXZlcidzCnJlc3BvbnNpYmlsaXR5
LiBJdCBzb3VuZHMgbGlrZSByYWRlb25zaSBpcyBoYXZpbmcgdG8gd29yayBhcm91bmQgdGhlCmFt
ZGdwdS9yYWRlb24ga2VybmVsIGRyaXZlcihzKSBub3QgZnVsbHkgbGl2aW5nIHVwIHRvIHRoaXMg
cmVzcG9uc2liaWxpdHkuCgoKLS0gCkVhcnRobGluZyBNaWNoZWwgRMOkbnplciAgICAgICAgICAg
ICAgIHwgICAgICAgICAgICAgICBodHRwczovL3JlZGhhdC5jb20KTGlicmUgc29mdHdhcmUgZW50
aHVzaWFzdCAgICAgICAgICAgICB8ICAgICAgICAgICAgIE1lc2EgYW5kIFggZGV2ZWxvcGVyCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
