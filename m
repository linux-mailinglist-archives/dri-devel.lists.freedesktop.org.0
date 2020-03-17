Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8E09187DAC
	for <lists+dri-devel@lfdr.de>; Tue, 17 Mar 2020 11:02:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EA1489F0B;
	Tue, 17 Mar 2020 10:02:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.178])
 by gabe.freedesktop.org (Postfix) with ESMTP id D6C0D89F0A;
 Tue, 17 Mar 2020 10:02:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id 4E8EA2A6042;
 Tue, 17 Mar 2020 11:01:59 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id DxoYdUv3L313; Tue, 17 Mar 2020 11:01:59 +0100 (CET)
Received: from thor (252.80.76.83.dynamic.wline.res.cust.swisscom.ch
 [83.76.80.252])
 by netline-mail3.netline.ch (Postfix) with ESMTPSA id 91A072A6016;
 Tue, 17 Mar 2020 11:01:58 +0100 (CET)
Received: from [::1] by thor with esmtp (Exim 4.93)
 (envelope-from <michel@daenzer.net>)
 id 1jE92r-000epK-Rh; Tue, 17 Mar 2020 11:01:57 +0100
Subject: Re: Plumbing explicit synchronization through the Linux ecosystem
To: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>
References: <CAOFGe94jy2VYDPbkMW8ZuNdAeM+HS8sM1OAYFGd9JKc1V7PVOQ@mail.gmail.com>
 <CAAxE2A4q9sZDz8vSLAvT0HH4BGukf8Ug68eqSV1ojqrm_5uFFg@mail.gmail.com>
 <170e13edbb0.27ad.c6988b7ea6112e3e892765a0d4287e0c@jlekstrand.net>
 <CAAxE2A6hMs2Ngd4zEv+hEJnEUKmPDuXmeWUaUU-4YCTRHNzr1w@mail.gmail.com>
 <e470a1d0-cf91-5811-d280-322e005888a8@daenzer.net>
 <CAAxE2A5D2HaqjS52jymMbwOUEsaXG_cMeeA9_esqaC54-52Kgw@mail.gmail.com>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
Message-ID: <ea771b02-b74b-2a89-e55c-2977d641558d@daenzer.net>
Date: Tue, 17 Mar 2020 11:01:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAAxE2A5D2HaqjS52jymMbwOUEsaXG_cMeeA9_esqaC54-52Kgw@mail.gmail.com>
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

T24gMjAyMC0wMy0xNiA3OjMzIHAubS4sIE1hcmVrIE9sxaHDoWsgd3JvdGU6Cj4gT24gTW9uLCBN
YXIgMTYsIDIwMjAgYXQgNTo1NyBBTSBNaWNoZWwgRMOkbnplciA8bWljaGVsQGRhZW56ZXIubmV0
PiB3cm90ZToKPj4gT24gMjAyMC0wMy0xNiA0OjUwIGEubS4sIE1hcmVrIE9sxaHDoWsgd3JvdGU6
Cj4+PiBUaGUgc3luY2hyb25pemF0aW9uIHdvcmtzIGJlY2F1c2UgdGhlIE1lc2EgZHJpdmVyIHdh
aXRzIGZvciBpZGxlIChkcmFpbnMKPj4+IHRoZSBHRlggcGlwZWxpbmUpIGF0IHRoZSBlbmQgb2Yg
Y29tbWFuZCBidWZmZXJzIGFuZCB0aGVyZSBpcyBvbmx5IDEKPj4+IGdyYXBoaWNzIHF1ZXVlLCBz
byBldmVyeXRoaW5nIGlzIG9yZGVyZWQuCj4+Pgo+Pj4gVGhlIEdGWCBwaXBlbGluZSBydW5zIGFz
eW5jaHJvbm91c2x5IHRvIHRoZSBjb21tYW5kIGJ1ZmZlciwgbWVhbmluZyB0aGUKPj4+IGNvbW1h
bmQgYnVmZmVyIG9ubHkgc3RhcnRzIGRyYXdzIGFuZCBkb2Vzbid0IHdhaXQgZm9yIGNvbXBsZXRp
b24uIElmIHRoZQo+Pj4gTWVzYSBkcml2ZXIgZGlkbid0IHdhaXQgYXQgdGhlIGVuZCBvZiB0aGUg
Y29tbWFuZCBidWZmZXIsIHRoZSBjb21tYW5kCj4+PiBidWZmZXIgd291bGQgZmluaXNoIGFuZCBh
IGRpZmZlcmVudCBwcm9jZXNzIGNvdWxkIHN0YXJ0IGV4ZWN1dGlvbiBvZiBpdHMKPj4+IG93biBj
b21tYW5kIGJ1ZmZlciB3aGlsZSBzaGFkZXJzIG9mIHRoZSBwcmV2aW91cyBwcm9jZXNzIGFyZSBz
dGlsbAo+PiBydW5uaW5nLgo+Pj4KPj4+IElmIHRoZSBNZXNhIGRyaXZlciBzdWJtaXRzIGEgY29t
bWFuZCBidWZmZXIgaW50ZXJuYWxseSAoYmVjYXVzZSBpdCdzCj4+IGZ1bGwpLAo+Pj4gaXQgZG9l
c24ndCB3YWl0LCBzbyB0aGUgR0ZYIHBpcGVsaW5lIGRvZXNuJ3Qgbm90aWNlIHRoYXQgYSBjb21t
YW5kIGJ1ZmZlcgo+Pj4gZW5kZWQgYW5kIGEgbmV3IG9uZSBzdGFydGVkLgo+Pj4KPj4+IFRoZSB3
YWl0aW5nIGF0IHRoZSBlbmQgb2YgY29tbWFuZCBidWZmZXJzIGhhcHBlbnMgb25seSB3aGVuIHRo
ZSBmbHVzaCBpcwo+Pj4gZXh0ZXJuYWwgKFN3YXAgYnVmZmVycywgZ2xGbHVzaCkuCj4+Pgo+Pj4g
SXQncyBhIHBlcmZvcm1hbmNlIHByb2JsZW0sIGJlY2F1c2UgdGhlIEdGWCBxdWV1ZSBpcyBibG9j
a2VkIHVudGlsIHRoZQo+PiBHRlgKPj4+IHBpcGVsaW5lIGlzIGRyYWluZWQgYXQgdGhlIGVuZCBv
ZiBldmVyeSBmcmFtZSBhdCBsZWFzdC4KPj4+Cj4+PiBTbyBleHBsaWNpdCBmZW5jZXMgZm9yIFN3
YXBCdWZmZXJzIHdvdWxkIGhlbHAuCj4+Cj4+IE5vdCBzdXJlIHdoYXQgZGlmZmVyZW5jZSBpdCB3
b3VsZCBtYWtlLCBzaW5jZSB0aGUgc2FtZSB0aGluZyBuZWVkcyB0byBiZQo+PiBkb25lIGZvciBl
eHBsaWNpdCBmZW5jZXMgYXMgd2VsbCwgZG9lc24ndCBpdD8KPiAKPiBOby4gRXhwbGljaXQgZmVu
Y2VzIGRvbid0IHJlcXVpcmUgdXNlcnNwYWNlIHRvIHdhaXQgZm9yIGlkbGUgaW4gdGhlIGNvbW1h
bmQKPiBidWZmZXIuIEZlbmNlcyBhcmUgc2lnbmFsbGVkIHdoZW4gdGhlIGxhc3QgZHJhdyBpcyBj
b21wbGV0ZSBhbmQgY2FjaGVzIGFyZQo+IGZsdXNoZWQuIEJlZm9yZSB0aGF0IGhhcHBlbnMsIGFu
eSBjb21tYW5kIGJ1ZmZlciB0aGF0IGlzIG5vdCBkZXBlbmRlbnQgb24KPiB0aGUgZmVuY2UgY2Fu
IHN0YXJ0IGV4ZWN1dGlvbi4gVGhlcmUgaXMgbmV2ZXIgYSBuZWVkIGZvciB0aGUgR1BVIHRvIGJl
IGlkbGUKPiBpZiB0aGVyZSBpcyBlbm91Z2ggaW5kZXBlbmRlbnQgd29yayB0byBkby4KCkkgZG9u
J3QgdGhpbmsgZXhwbGljaXQgZmVuY2VzIGluIHRoZSBjb250ZXh0IG9mIHRoaXMgZGlzY3Vzc2lv
biBpbXBseQp1c2luZyB0aGF0IGRpZmZlcmVudCBmZW5jZSBzaWduYWxsaW5nIG1lY2hhbmlzbSB0
aG91Z2guIE15IHVuZGVyc3RhbmRpbmcKaXMgdGhhdCB0aGUgQVBJIHByb3Bvc2VkIGJ5IEphc29u
IGFsbG93cyBpbXBsaWNpdCBmZW5jZXMgdG8gYmUgdXNlZCBhcwpleHBsaWNpdCBvbmVzIGFuZCB2
aWNlIHZlcnNhLCBzbyBwcmVzdW1hYmx5IHRoZXkgaGF2ZSB0byB1c2UgdGhlIHNhbWUKc2lnbmFs
bGluZyBtZWNoYW5pc20uCgoKQW55d2F5LCBtYXliZSB0aGUgZGlmZmVyZW50IGZlbmNlIHNpZ25h
bGxpbmcgbWVjaGFuaXNtIHlvdSBkZXNjcmliZQpjb3VsZCBiZSB1c2VkIGJ5IHRoZSBhbWRncHUg
a2VybmVsIGRyaXZlciBpbiBnZW5lcmFsLCB0aGVuIE1lc2EgY291bGQKZHJvcCB0aGUgd2FpdHMg
Zm9yIGlkbGUgYW5kIGdldCB0aGUgYmVuZWZpdHMgd2l0aCBpbXBsaWNpdCBzeW5jIGFzIHdlbGw/
CgoKLS0gCkVhcnRobGluZyBNaWNoZWwgRMOkbnplciAgICAgICAgICAgICAgIHwgICAgICAgICAg
ICAgICBodHRwczovL3JlZGhhdC5jb20KTGlicmUgc29mdHdhcmUgZW50aHVzaWFzdCAgICAgICAg
ICAgICB8ICAgICAgICAgICAgIE1lc2EgYW5kIFggZGV2ZWxvcGVyCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
