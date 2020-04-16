Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B75251AC35C
	for <lists+dri-devel@lfdr.de>; Thu, 16 Apr 2020 15:42:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB05B6E084;
	Thu, 16 Apr 2020 13:42:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id AA7E76E084
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Apr 2020 13:42:18 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B6F8C1FB;
 Thu, 16 Apr 2020 06:42:17 -0700 (PDT)
Received: from [192.168.1.84] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 68A253F68F;
 Thu, 16 Apr 2020 06:42:15 -0700 (PDT)
Subject: Re: Multiple regulators for one device [was drm/panfrost: add devfreq
 regulator support]
To: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>,
 Mark Brown <broonie@kernel.org>
References: <20200411200632.4045-1-peron.clem@gmail.com>
 <20200411200632.4045-2-peron.clem@gmail.com>
 <c96f31a2-6ff4-31aa-aaac-2ce9eafb3bfe@arm.com>
 <CAJiuCcegkNGQ7j4jcT1rBpSLqG1c-nb8g0wq+Nbvt-dGj7am2Q@mail.gmail.com>
 <CAJiuCceU662o7QGJ=mmT3pzVWK7uJUN=6+NKQnZ=Cfj9c2nw7A@mail.gmail.com>
 <d6465e7e-8e05-8b7d-16bd-f40877969089@arm.com>
 <CAJiuCccv2XPLY6sjcgvvrG5a8ONYHa_xn9i-YUDKUDK5a0DY=A@mail.gmail.com>
 <CAJiuCcfa9ro1V4nBzfD48cCuHpEsLaNA5P0bb-tQ3hcWUCtpkA@mail.gmail.com>
 <000f26f4-3640-797f-c7f6-4b31a5e2669e@arm.com>
 <CAJiuCccF3tmbmMWNh0nC5WRJ1_iPdj6f1oH1zYMSue_pFrXsPQ@mail.gmail.com>
 <20200414185523.GO5412@sirena.org.uk>
 <CAJiuCce5ekAed6RF8+x_ehruCXW3900wkFNKRXN_Xo_62MPXew@mail.gmail.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <5e15e7ac-1d9c-d614-8fd9-27525c88cafb@arm.com>
Date: Thu, 16 Apr 2020 14:42:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CAJiuCce5ekAed6RF8+x_ehruCXW3900wkFNKRXN_Xo_62MPXew@mail.gmail.com>
Content-Language: en-GB
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
Cc: Nishanth Menon <nm@ti.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Stephen Boyd <sboyd@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTQvMDQvMjAyMCAyMDoxNiwgQ2zDqW1lbnQgUMOpcm9uIHdyb3RlOgo+IEhpIE1hcmssCj4g
Cj4gT24gVHVlLCAxNCBBcHIgMjAyMCBhdCAyMDo1NSwgTWFyayBCcm93biA8YnJvb25pZUBrZXJu
ZWwub3JnPiB3cm90ZToKPj4KPj4gT24gVHVlLCBBcHIgMTQsIDIwMjAgYXQgMDg6MjA6MjNQTSAr
MDIwMCwgQ2zDqW1lbnQgUMOpcm9uIHdyb3RlOgo+Pj4gSGkgTGlhbSBhbmQgTWFyaywKPj4KPj4g
WW91IG1pZ2h0IHdhbnQgdG8gZmxhZyBzdHVmZiBsaWtlIHRoaXMgaW4gdGhlIHN1YmplY3QgbGlu
ZSwgSSB2ZXJ5Cj4+IG5lYXJseSBkZWxldGVkIHRoaXMgd2l0aG91dCBvcGVuaW5nIGl0IHNpbmNl
IG1vc3Qgb2YgdGhlIGVtYWlsIEkgZ2V0Cj4+IGFib3V0IHBhbmZyb3N0IGFwcGVhcnMgdG8gYmUg
Y29taW5nIGZyb20gbWUgaGF2aW5nIHNlbnQgcGF0Y2hlcyByYXRoZXIKPj4gdGhhbiBiZWluZyBy
ZWxldmFudC4KPiAKPiBPayB3aWxsIGRvIG5leHQgdGltZSwKPiAKPj4KPj4+IFdlIGFyZSBoYXZp
bmcgYW4gaXNzdWUgd2l0aCBQYW5mcm9zdCBkcml2ZXIgcmVnaXN0ZXJpbmcgdHdvIHRpbWVzIHRo
ZQo+Pj4gc2FtZSByZWd1bGF0b3IgYW5kIGdpdmluZyBhbiBlcnJvciB3aGVuIHRyeWluZyB0byBj
cmVhdGUgdGhlIGRlYnVnZnMKPj4+IGZvbGRlci4KPj4KPj4+IENvdWxkIHlvdSBjbGFyaWZ5IGlm
IGl0IGlzIGFsbG93ZWQgZm9yIGEgZGV2aWNlIHRvIHJlZ2lzdGVyIHR3byB0aW1lcwo+Pj4gdGhl
IHNhbWUgcmVndWxhdG9yPwo+Pgo+Pj4gSSBjaGVjayBEb2N1bWVudGF0aW9uL3Bvd2VyL3JlZ3Vs
YXRvci9yZWd1bGF0b3IucnN0IGJ1dCB0aGlzIHBvaW50IGlzCj4+PiBub3Qgc3BlY2lmaWVkLgo+
Pgo+PiBXZSBkb24ndCBhY3RpdmVseSBwcmV2ZW50IGl0IGFuZCBJIGNhbid0IHRoaW5rIHdoYXQg
b3RoZXIgdGhhbiBkZWJ1Z2ZzCj4+IG1pZ2h0IHJ1biBpbnRvIHByb2JsZW1zIChhbmQgdGhhdCdz
IGp1c3QgYSB3YXJuaW5nKSBidXQgaXQgZG9lcyBzZWVtCj4+IGxpa2UgYSB3ZWlyZCB0aGluZyB0
byB3YW50IHRvIGRvIGFuZCBsaWtlIGl0J3MgcG9pbnRpbmcgdG8gc29tZQo+PiBjb25mdXNpb24g
aW4geW91ciBjb2RlIHdpdGggdHdvIGRpZmZlcmVudCBwYXJ0cyBvZiB0aGUgZGV2aWNlCj4+IGNv
bnRyb2xsaW5nIHRoZSBzYW1lIHN1cHBseSBpbmRlcGVuZGVudGx5LiAgV2hhdCdzIHRoZSB1c2Ug
Y2FzZSBoZXJlPwo+IAo+IFBhbmZyb3N0IGZpcnN0IHByb2JlIGNsb2NrLCByZXNldCBhbmQgcmVn
dWxhdG9yIGluIGRldmljZV9pbml0Ogo+IGh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4
L3Y1LjctcmMxL3NvdXJjZS9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZHJ2LmMj
TDYwMgo+IFRoZW4gaXQgcHJvYmUgZm9yIG9wdGlvbmFsIGRldmZyZXEsIGRldmZyZXEgd2lsbCBn
ZXQgb3BwIHRhYmxlcyBhbmQKPiBhbHNvIGdldCByZWd1bGF0b3IgYWdhaW4uCj4gaHR0cHM6Ly9l
bGl4aXIuYm9vdGxpbi5jb20vbGludXgvdjUuNy1yYzEvc291cmNlL2RyaXZlcnMvZ3B1L2RybS9w
YW5mcm9zdC9wYW5mcm9zdF9kcnYuYyNMNjA5Cj4gCj4gVGhhdCdzIGNhbiBiZSByZXdvcmtlZCBh
bmQgUGFuZnJvc3QgY2FuIG9ubHkgcHJvYmUgcmVndWxhdG9yIGlmIHRoZXJlCj4gaXMgbm8gb3Bw
LXRhYmxlLgoKVGhpcyBpcyB3aGF0IEkgd2FzIHRoaW5raW5nIGFib3V0IGxvb2tpbmcgYXQuIEJ1
dCBpdCBtYXkgbWFrZSBzZW5zZSAKaW5zdGVhZCB0byBleHRlbmQgdGhlIHJlZ3VsYXRvciBBUEkg
dG8gYWxsb3cgbXVsdGlwbGUgcmVndWFsdG9yX2dldCgpIApjYWxscyBmb3IgYSBzaW5nbGUgZGV2
aWNlLiBJIGhhdmVuJ3QgaGFkIHRpbWUgdG8gZGlnIGludG8gaG93IGRpZmZpY3VsdCAKdGhpcyB3
b3VsZCBiZS4KCj4gQnV0IGlmIG11bHRpcGxlIHJlZ3VsYXRvciBpcyBub3QgYW4gaXNzdWUgYW5k
IGFzIGVhY2ggcmVxdWVzdCBpcyBsb2dpYy4KPiBUaGUgZmlyc3QgaW4gZGV2aWNlX2luaXQgYXNz
dXJlIHRvIGVuYWJsZSB0aGUgcmVndWxhdG9yIGFuZCB0aGUgc2Vjb25kCj4gaW4gT1BQIGFzc3Vy
ZSB0aGUgdm9sdGFnZSBsZXZlbC4KPiAKPiBNYXliZSB3ZSBjYW4ganVzdCBmaXggdGhpcyB3YXJu
aW5nPwoKIEZyb20gd2hhdCBJIGNhbiBzZWUgaW4gdGhlIGNvZGUsIGp1c3Qgc2lsZW5jaW5nIHRo
ZSB3YXJuaW5nIHdvdWxkIGxlYWQgCnRvICdvZGQnIGJlaGF2aW91ciB3aXRoIGRlYnVnZnMuIFRo
ZSBmaXJzdCBzdHJ1Y3QgcmVndWxhdG9yIFBhbmZyb3N0IAphY3F1aXJlcyBpcyB0aGUgb25lIHRo
YXQgaXMgdXNlZCBwdXJlbHkgZm9yIHR1cm5pbmcgdGhlIEdQVSBvbiAobm8gCnZvbHRhZ2Ugc2Nh
bGluZykuIFRoZSBzZWNvbmQgc3RydWN0IHJlZ3VsYXRvciBpcyB0aGUgb25lIHdoaWNoIGlzIApv
YnRhaW5lZCBieSB0aGUgT1BQIGZyYW1ld29yay4gSG93ZXZlciB0aGUgZGVidWdmcyBlbnRyaWVz
IHBvaW50IGludG8gCnRoZSBhY3R1YWwgc3RydWN0IHJlZ3VsYXRvciwgc28gaXQgd291bGQgYmUg
ZmFyIG1vcmUgbG9naWNhbC91c2VmdWwgaWYgCnRob3NlIHdlcmUgcG9pbnRpbmcgaW50byB0aGUg
c2Vjb25kIHN0cnVjdCByZWd1bGF0b3IuCgpJZGVhbGx5IGNhbGxpbmcgcmVndWxhdG9yX2dldCBh
IHNlY29uZCB0aW1lIGZvciB0aGUgc2FtZSBkZXZpY2Ugd291bGQgCnNpbXBseSByZXR1cm4gdGhl
IHNhbWUgc3RydWN0IHJlZ3VsYXRvciBvYmplY3QgKHdpdGggYSByZWZlcmVuY2UgY291bnQgCmlu
Y3JlbWVudCkuCgpQZXJoYXBzIGEgYmV0dGVyIGFwcHJvYWNoIHdvdWxkIGJlIGZvciBQYW5mcm9z
dCB0byBoYW5kIG92ZXIgdGhlIHN0cnVjdCAKcmVndWxhdG9yIG9iamVjdHMgaXQgaGFzIGFscmVh
ZHkgZ290IHRvIHRoZSBPUFAgZnJhbWV3b3JrLiBJLmUuIG9wZW4gCmNvZGUgZGV2X3BtX29wcF9z
ZXRfcmVndWxhdG9ycygpLCBidXQgaW5zdGVhZCBvZiBjYWxsaW5nIApyZWd1bGF0b3JfZ2V0X29w
dGlvbmFsKCkgc2ltcGx5IHBvcHVsYXRlIHRoZSByZWd1bGF0b3JzIHdlIGFscmVhZHkgaGF2ZT8K
ClRoZSBvdGhlciBiZW5lZml0IG9mIHRoYXQgaXMgaXQgd291bGQgcHJvdmlkZSBhIGNsZWFyIGhh
bmQtb3ZlciBvZiAKcmVzcG9uc2liaWxpdHkgYmV0d2VlbiBQYW5mcm9zdCBoYW5kbGluZyBpdCdz
IG93biByZWd1bGF0b3JzIGFuZCB0aGUgT1BQIApmcmFtZXdvcmsgcGlja2luZyB1cCB0aGUgd29y
ay4gVGhlIGRpc2FkdmFudGFnZSBpcyB0aGF0IFBhbmZyb3N0IHdvdWxkIApoYXZlIHRvIHRyYWNr
IHdoZXRoZXIgdGhlIHJlZ3VsYXRvcnMgaGF2ZSBiZWVuIGhhbmRlZCBvdmVyIG9yIG5vdC4KClN0
ZXZlCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
