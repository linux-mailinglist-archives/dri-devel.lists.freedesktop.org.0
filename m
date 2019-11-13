Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 507AEFB704
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2019 19:08:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD0396EDD2;
	Wed, 13 Nov 2019 18:08:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from frontdoor.pr.hu (frontdoor.pr.hu
 [IPv6:2a02:808:1:101:250:56ff:fe8e:136b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 232DD6EDD2;
 Wed, 13 Nov 2019 18:08:49 +0000 (UTC)
Received: from [2a02:808:3:101::5] (helo=mail.pr.hu)
 by frontdoor.pr.hu with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <zboszor@pr.hu>)
 id 1iUx4S-0001Dw-77; Wed, 13 Nov 2019 19:08:48 +0100
Received: from host-87-242-20-26.prtelecom.hu ([87.242.20.26]
 helo=[192.168.1.2])
 by mail.pr.hu with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <zboszor@pr.hu>)
 id 1iUx4N-0005E1-Rv; Wed, 13 Nov 2019 19:08:46 +0100
Subject: Re: UDL device cannot get its own screen
To: Ilia Mirkin <imirkin@alum.mit.edu>
References: <536af56f-924d-f089-a2d8-180f4dee1613@pr.hu>
 <CAKb7UvhZ9VR_X5Nqv01EDvnWF2RXXt5fCdYEa5KUy8owKh4CwQ@mail.gmail.com>
 <35cdaafe-461e-56ec-d3d3-47fdd6468251@pr.hu>
 <CAKb7Uvh2L0oHMwNss-h1BFXGYeEXOUDLHB9TnaNEm4-oNhjMRw@mail.gmail.com>
 <6af6c1c5-0b99-e034-8a9c-83d4e1171115@pr.hu>
 <d2788b17-3179-ef9d-419a-635e784c6297@pr.hu>
 <CAKb7UvikHeUOj06oqBYnq2==KJ-CGDyZjHsbtbZtA+3r9jK68A@mail.gmail.com>
 <dc03de55-d6df-5804-675f-48f93dc2dfd9@pr.hu>
 <CAKb7UvjGD7Az_jAh5Qn8LaesjVrxpZk67d79aTZHb3_uZ0BEnA@mail.gmail.com>
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@pr.hu>
Message-ID: <a03f854f-dd70-cab5-81c1-50b32061dd1f@pr.hu>
Date: Wed, 13 Nov 2019 19:08:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <CAKb7UvjGD7Az_jAh5Qn8LaesjVrxpZk67d79aTZHb3_uZ0BEnA@mail.gmail.com>
Content-Language: en-US
X-Spam-Score: -1.9 (-)
X-Scan-Signature: a689203be2006d9326ab14b7d6d44a87
X-Spam-Tracer: backend.mail.pr.hu -1.9 20191113180846Z
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=pr.hu; 
 s=pr20170203; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3SWysnzBhC9gP5Q691CBsz+JRco8fu5oDR79jJ/Ey0M=; b=WkPPUVg5A1/wl6VrSP4/GIe3vV
 OKrPnIzlujrB8wAkNyJuZlRohB3Dk1a/vlDxLGn/Kygi+7yEiXLFukm4I4AYmBOo01yS8ZPaCe9FG
 tuiHscktzeeG4pn1hswQ6mZEsF6Oy9vbJp8bgzH7je1ZMrebdlIc00WF0HdqSlSwIT8LiaBVLFYBD
 i3rgKhIkItKLS4VFVsN9OZXUgE2TNBIKvKtWgA67VhLtmVRAXWvjpIZBUT6mOf+Kjl97Ed3gDQEuY
 f2Fm6Q3TqhHcaJ8+wDT4kDVZp01eD365vgZHbaJPd3G0h9H+WA83/BjUSfH9F/WwYQWHAOONv5LXq
 nzd8Bu3g==;
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: xorg@lists.x.org,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MjAxOS4gMTEuIDEzLiAxODoyNSBrZWx0ZXrDqXNzZWwsIElsaWEgTWlya2luIMOtcnRhOgo+IE9u
IFdlZCwgTm92IDEzLCAyMDE5IGF0IDExOjU5IEFNIELDtnN6w7ZybcOpbnlpIFpvbHTDoW4gPHpi
b3N6b3JAcHIuaHU+IHdyb3RlOgo+Pgo+PiAyMDE5LiAxMS4gMTIuIDE3OjQxIGtlbHRlesOpc3Nl
bCwgSWxpYSBNaXJraW4gw61ydGE6Cj4+PiBPbiBUdWUsIE5vdiAxMiwgMjAxOSBhdCA5OjIzIEFN
IELDtnN6w7ZybcOpbnlpIFpvbHTDoW4gPHpib3N6b3JAcHIuaHU+IHdyb3RlOgo+Pj4+IEJ1dCBu
bywgYWxsIEdQVSBkZXZpY2VzIChub3cgb25seSBvbmUsIHRoZSBVREwgZGV2aWNlKSBoYXZlIHNj
cmVlbiAwCj4+Pj4gKGEuay5hLiBESVNQTEFZPTowLjApIHNldCB3aGVuIEF1dG9CaW5kR1BVIGlz
IHRydWU6Cj4+Pj4KPj4+PiBbICAyNDQ0LjU3Nl0geGY4NkF1dG9Db25maWdPdXRwdXREZXZpY2Vz
OiB4Zjg2TnVtU2NyZWVucyAyIHhmODZOdW1HUFVTY3JlZW5zIDEKPj4+PiBbICAyNDQ0LjU3Nl0g
eGY4NkF1dG9Db25maWdPdXRwdXREZXZpY2VzOiBHUFUgIzAgZHJpdmVyICdtb2Rlc2V0dGluZycg
J21vZGVzZXQnIHNjcm5JbmRleAo+Pj4+IDI1NiBvcmlnSW5kZXggMjU3IHBTY3JlZW4tPm15TnVt
IDI1NiBjb25mU2NyZWVuLT5zY3JlZW5udW0gMAo+Pj4+IGNvbmZTY3JlZW4tPmRldmljZS0+aWRl
bnRpZmllciAnSW50ZWwwJwo+Pj4+ICAgICBjb25mU2NyZWVuLT5kZXZpY2UtPnNjcmVlbiAwIGNv
bmZTY3JlZW4tPmRldmljZS0+bXlTY3JlZW5TZWN0aW9uLT5zY3JlZW5udW0gMAo+Pj4+IGNvbmZT
Y3JlZW4tPmRldmljZS0+bXlTY3JlZW5TZWN0aW9uLT5kZXZpY2UtPnNjcmVlbiAwCj4+Pj4KPj4+
PiBTb21laG93LCBPcHRpb24gIkRldmljZSIgc2hvdWxkIGVuc3VyZSB0aGF0IHRoZSBVREwgZGV2
aWNlIGlzIGFjdHVhbGx5Cj4+Pj4gdHJlYXRlZCBhcyBhIGZyYW1lYnVmZmVyIHRoYXQgY2FuIGJl
IHJlbmRlcmVkIGludG8gKGkuZS4gdG8gYmUgbW9kZXNldCgyKQo+Pj4+IGluc3RlYWQgb2YgbW9k
ZXNldChHbikpIGFuZCBpdCBzaG91bGQgYmUgd29rZW4gdXAgYXV0b21hdGljYWxseS4KPj4+Pgo+
Pj4+IFRoaXMgaXMgd2hhdCBBdXRvQmluZEdQVSBpcyBzdXBwb3NlZCB0byBkbywgaXNuJ3QgaXQ/
Cj4+Pj4KPj4+PiBCdXQgaW5zdGVhZCBvZiBhc3NpZ25pbmcgdG8gc2NyZWVuIDAsIGl0IHNob3Vs
ZCBiZSBhc3NpZ25lZCB0byB3aGF0ZXZlcgo+Pj4+IHNjcmVlbiBudW1iZXIgaXQgaXMgY29uZmln
dXJlZCBhcy4KPj4+Pgo+Pj4+IEkga25vdyBpdCdzIG5vdCBhIGNvbW1vbiB1c2UgY2FzZSBub3dh
ZGF5cywgYnV0IEkgcmVhbGx5IHdhbnQgc2VwYXJhdGUKPj4+PiBmdWxsc2NyZWVuIGFwcHMgb24g
dGhlaXIgaW5kZXBlbmRlbnQgc2NyZWVucywgaW5jbHVkaW5nIGEgc3RhbmRhbG9uZSBVREwKPj4+
PiBkZXZpY2UsIGluc3RlYWQgb2YgaGF2aW5nIHRoZSBsYXR0ZXJzIGFzIGEgWGluZXJhbWEgZXh0
ZW5zaW9uIHRvIHNvbWUKPj4+PiBvdGhlciBkZXZpY2UuCj4+Pgo+Pj4gSWYgeW91IHNlZSBhICJH
IiwgdGhhdCBtZWFucyBpdCdzIGJlaW5nIHRyZWF0ZWQgYXMgYSBHUFUgZGV2aWNlLCB3aGljaAo+
Pj4gaXMgKm5vdCogd2hhdCB5b3Ugd2FudCBpZiB5b3Ugd2FudCBzZXBhcmF0ZSBzY3JlZW5zLiBZ
b3UgbmVlZCB0byB0cnkKPj4+IHRvIGNvbnZpbmNlIHRoaW5ncyB0byAqbm90KiBzZXQgdGhlIGRl
dmljZXMgdXAgYXMgR1BVIGRldmljZXMsIGJ1dAo+Pj4gaW5zdGVhZCBwdXQgZWFjaCBkZXZpY2Ug
KGFuZCBlYWNoIG9uZSBvZiBpdHMgaGVhZHMsIHZpYSBaYXBob2RIZWFkcykKPj4+IG5vIGEgc2Vw
YXJhdGUgZGV2aWNlLCB3aGljaCBpbiB0dXJuIHdpbGwgaGF2ZSBhIHNlcGFyYXRlIHNjcmVlbi4K
Pj4KPj4gSSBjcmVhdGVkIGEgbWVyZ2UgcmVxdWVzdCB0aGF0IGZpbmFsbHkgbWFkZSBpdCBwb3Nz
aWJsZSB3aGF0IEkgd2FudGVkLgo+Pgo+PiBodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcv
eG9yZy94c2VydmVyL21lcmdlX3JlcXVlc3RzLzMzNAo+Pgo+PiBOb3csIG5vIG1hdHRlciBpZiBJ
IHVzZSB0aGUgaW50ZWwgb3IgbW9kZXNldHRpbmcgZHJpdmVycyBmb3IgdGhlCj4+IERldmljZSBz
ZWN0aW9ucyB1c2luZyB0aGUgSW50ZWwgaGVhZHMsIG9yIEF1dG9CaW5kR1BVIHNldCB0byB0cnVl
IG9yCj4+IGZhbHNlLCB0aGUgVURMIGRldmljZSBpcyBjb3JyZWN0bHkgbWF0Y2hlZCB3aXRoIGl0
cyBPcHRpb24gImttc2RldiIKPj4gc2V0dGluZyB0byB0aGUgcGxhZm9ybSBkZXZpY2UncyBkZXZp
Y2UgcGF0aC4KPj4KPj4gVGhpcyBwYXRjaCBzZWVtcyB0byBiZSBhIHNsaWdodCBsYXllcmluZyB2
aW9sYXRpb24sIGJ1dCBzaW5jZSB0aGUKPj4gbW9kZXNldHRpbmcgZHJpdmVyIGlzIGJ1aWx0IGlu
dG8gdGhlIFhvcmcgc2VydmVyIHNvdXJjZXMsIHRoZSBwYXRjaAo+PiBtYXkgZ2V0IGF3YXkgd2l0
aCBpdC4KPiAKPiBIYXZlIHlvdSBsb29rZWQgYXQgc2V0dGluZyBBdXRvQWRkR1BVIHRvIGZhbHNl
PyBBdXRvQmluZEdQVSBpcyB0b28KPiBsYXRlIC0tIHRoYXQncyB3aGVuIHlvdSBhbHJlYWR5IGhh
dmUgYSBHUFUsIHdoZXRoZXIgdG8gYmluZCBpdCB0byB0aGUKPiBwcmltYXJ5IGRldmljZSAoL3Nj
cmVlbi93aGF0ZXZlcikuIFlvdSBuZWVkIHRvIG5vdCBoYXZlIGEgR1BVIGluIHRoZQo+IGZpcnN0
IHBsYWNlLgoKWWVzLCBJIHRyaWVkIEF1dG9BZGRHUFU9ZmFsc2UuIFRoZW4gdGhlIFVETCBkZXZp
Y2Ugd2FzIG5vdCBzZXQgdXAgYXQgYWxsLgoKV2hhdCBJIG5vdGljZWQgaW4gZGVidWdnaW5nIFhv
cmcgdmlhIEdEQiBpcyB0aGF0IHRoZSBVREwgZGV2aWNlIHdhcwptYXRjaGVkIHRvIHRoZSB3cm9u
ZyBwbGF0Zm9ybSBkZXZpY2UgaW4geGY4NnBsYXRmb3JtUHJvYmVEZXYuCgp4Zjg2X3BsYXRmb3Jt
X2RldmljZXNbMF0gPT0gSW50ZWwsIC9kZXYvZHJpL2NhcmQxLCBwcmltYXJ5IHBsYXRmb3JtIGRl
dmljZQp4Zjg2X3BsYXRmb3JtX2RldmljZXNbMV0gPT0gVURMLCAvZGV2L2RyaS9jYXJkMAoKZGV2
TGlzdFswXSA9PSAiSW50ZWwwIgpkZXZMaXN0WzFdID09ICJJbnRlbDEiCmRldkxpc3RbMl0gPT0g
IlVETCIKZGV2TGlzdFszXSA9PSAiSW50ZWwyIiAoR1BVIGRldmljZSkKClNpbmNlIHRoZSBkZXZp
Y2UgcGF0aCB3YXMgbm90IG1hdGNoZWQgYW5kIHRoZSBQQ0kgSUQgZGlkIG5vdCBtYXRjaCwKKGFm
dGVyIGFsbCwgdGhlIFVETCBkZXZpY2UgaXMgTk9UIFBDSSksIHRoaXMgY29kZSB3YXMgZXhlY3V0
ZWQ6CgogICAgICAgICAgICAgZWxzZSB7CiAgICAgICAgICAgICAgICAgLyogZm9yIG5vbi1zZWF0
MCBzZXJ2ZXJzIGFzc3VtZSBmaXJzdCBkZXZpY2UgaXMgdGhlIG1hc3RlciAqLwogICAgICAgICAg
ICAgICAgIGlmIChTZXJ2ZXJJc05vdFNlYXQwKCkpCiAgICAgICAgICAgICAgICAgICAgIGJyZWFr
OwoKICAgICAgICAgICAgICAgICBpZiAoeGY4NklzUHJpbWFyeVBsYXRmb3JtKCZ4Zjg2X3BsYXRm
b3JtX2RldmljZXNbal0pKQogICAgICAgICAgICAgICAgICAgICBicmVhazsKICAgICAgICAgICAg
IH0KClNvLCBwcm9iZVNpbmdsZURldmljZSgpIHdhcyBjYWxsZWQgd2l0aCB4Zjg2X3BsYXRmb3Jt
X2RldmljZXNbMF0gYW5kCmRldkxpc3RbMl0sIHJlc3VsdGluZyBpbiB0aGUgVURMIGRldmljZSBz
ZXQgdXAgYXMgYSBHUFUgZGV2aWNlIGFuZCBub3QKYSBmcmFtZWJ1ZmZlciBvbiBpdHMgb3duIHJp
Z2h0LgoKTXkgTVIgbW9kaWZpZXMgdGhpcyBzbyBpZiB0aGVyZSBpcyBhbiBleHBsaWNpdCBPcHRp
b24gImttc2RldiIgc2V0dGluZywKaXQncyBtYXRjaGVkIGZpcnN0LiBUaGUgZmluYWwgZWxzZSBi
cmFuY2ggaXMgb25seSBleGVjdXRlZCBpbiB0aGUgZGVmYXVsdApjYXNlIHdpdGggbm8gZXhwbGlj
aXQgY29uZmlndXJhdGlvbi4KCldpdGggdGhpcyBNUiwgdGhlIGV4cGxpY2l0IGNvbmZpZ3VyYXRp
b24gZm9yIFVETCB3b3JrcywgcmVnYXJkbGVzcyB0aGUKQXV0b0JpbmRHUFUgdmFsdWUuCgpCZXN0
IHJlZ2FyZHMsClpvbHTDoW4gQsO2c3rDtnJtw6lueWkKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
