Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A85AB4A6F
	for <lists+dri-devel@lfdr.de>; Tue, 17 Sep 2019 11:27:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 017766EB8B;
	Tue, 17 Sep 2019 09:27:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.178])
 by gabe.freedesktop.org (Postfix) with ESMTP id CD6F26EB8B;
 Tue, 17 Sep 2019 09:27:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id AA5702AA162;
 Tue, 17 Sep 2019 11:27:08 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id Q1L7CC5HEEmT; Tue, 17 Sep 2019 11:27:08 +0200 (CEST)
Received: from thor (116.245.63.188.dynamic.wline.res.cust.swisscom.ch
 [188.63.245.116])
 by netline-mail3.netline.ch (Postfix) with ESMTPSA id 497932AA0BD;
 Tue, 17 Sep 2019 11:27:08 +0200 (CEST)
Received: from [::1] by thor with esmtp (Exim 4.92.2)
 (envelope-from <michel@daenzer.net>)
 id 1iA9lM-0006Ns-02; Tue, 17 Sep 2019 11:27:08 +0200
Subject: Re: [PATCH] drm: add drm device name
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
To: "Koenig, Christian" <Christian.Koenig@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20190903214040.2386-1-sonny.jiang@amd.com>
 <CAAxE2A45N4gMYrcETDpznGKyxLztuwenFasL19a81QQmBkYiww@mail.gmail.com>
 <CAF6AEGvvUUOGujJC9P3t72N93AJuxiiVt0OAk8zf226Q8WmHvg@mail.gmail.com>
 <CAKMK7uHFNhdNY4Y9ZFMNuci7gssPWCT5f5y=e4npg8s5r_jBdQ@mail.gmail.com>
 <CAAxE2A6sESsKAi3K1etAZeCwAPgexn099G6g0aJQnavTkiH+mA@mail.gmail.com>
 <87woe7eanv.fsf@intel.com> <03d31464-3968-6923-5323-f63060d70f1f@gmail.com>
 <CAKMK7uEj4FZ3YQqG-cCTa4EEaJoAk09Zaz398F9Hmo+mdXCKiw@mail.gmail.com>
 <7540df63-e623-19b0-dde5-b89ff2b7fb89@amd.com>
 <7535dcf4-413f-f06f-b3d1-dcffc86b43e0@daenzer.net>
Openpgp: preference=signencrypt
Autocrypt: addr=michel@daenzer.net; prefer-encrypt=mutual; keydata=
 mQGiBDsehS8RBACbsIQEX31aYSIuEKxEnEX82ezMR8z3LG8ktv1KjyNErUX9Pt7AUC7W3W0b
 LUhu8Le8S2va6hi7GfSAifl0ih3k6Bv1Itzgnd+7ZmSrvCN8yGJaHNQfAevAuEboIb+MaVHo
 9EMJj4ikOcRZCmQWw7evu/D9uQdtkCnRY9iJiAGxbwCguBHtpoGMxDOINCr5UU6qt+m4O+UD
 /355ohBBzzyh49lTj0kTFKr0Ozd20G2FbcqHgfFL1dc1MPyigej2gLga2osu2QY0ObvAGkOu
 WBi3LTY8Zs8uqFGDC4ZAwMPoFy3yzu3ne6T7d/68rJil0QcdQjzzHi6ekqHuhst4a+/+D23h
 Za8MJBEcdOhRhsaDVGAJSFEQB1qLBACOs0xN+XblejO35gsDSVVk8s+FUUw3TSWJBfZa3Imp
 V2U2tBO4qck+wqbHNfdnU/crrsHahjzBjvk8Up7VoY8oT+z03sal2vXEonS279xN2B92Tttr
 AgwosujguFO/7tvzymWC76rDEwue8TsADE11ErjwaBTs8ZXfnN/uAANgPLQjTWljaGVsIERh
 ZW56ZXIgPG1pY2hlbEBkYWVuemVyLm5ldD6IXgQTEQIAHgUCQFXxJgIbAwYLCQgHAwIDFQID
 AxYCAQIeAQIXgAAKCRBaga+OatuyAIrPAJ9ykonXI3oQcX83N2qzCEStLNW47gCeLWm/QiPY
 jqtGUnnSbyuTQfIySkK5AQ0EOx6FRRAEAJZkcvklPwJCgNiw37p0GShKmFGGqf/a3xZZEpjI
 qNxzshFRFneZze4f5LhzbX1/vIm5+ZXsEWympJfZzyCmYPw86QcFxyZflkAxHx9LeD+89Elx
 bw6wT0CcLvSv8ROfU1m8YhGbV6g2zWyLD0/naQGVb8e4FhVKGNY2EEbHgFBrAAMGA/0VktFO
 CxFBdzLQ17RCTwCJ3xpyP4qsLJH0yCoA26rH2zE2RzByhrTFTYZzbFEid3ddGiHOBEL+bO+2
 GNtfiYKmbTkj1tMZJ8L6huKONaVrASFzLvZa2dlc2zja9ZSksKmge5BOTKWgbyepEc5qxSju
 YsYrX5xfLgTZC5abhhztpYhGBBgRAgAGBQI7HoVFAAoJEFqBr45q27IAlscAn2Ufk2d6/3p4
 Cuyz/NX7KpL2dQ8WAJ9UD5JEakhfofed8PSqOM7jOO3LCA==
Message-ID: <5d0a8619-7073-fac2-cdd6-83b55221140b@daenzer.net>
Date: Tue, 17 Sep 2019 11:27:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <7535dcf4-413f-f06f-b3d1-dcffc86b43e0@daenzer.net>
Content-Language: en-CA
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
Cc: "Jiang, Sonny" <Sonny.Jiang@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS0wOS0xNyAxMToyMyBhLm0uLCBNaWNoZWwgRMOkbnplciB3cm90ZToKPiBPbiAyMDE5
LTA5LTE3IDEwOjIzIGEubS4sIEtvZW5pZywgQ2hyaXN0aWFuIHdyb3RlOgo+PiBBbSAxNy4wOS4x
OSB1bSAxMDoxNyBzY2hyaWViIERhbmllbCBWZXR0ZXI6Cj4+PiBPbiBUdWUsIFNlcCAxNywgMjAx
OSBhdCAxMDoxMiBBTSBDaHJpc3RpYW4gS8O2bmlnCj4+PiA8Y2tvZW5pZy5sZWljaHR6dW1lcmtl
bkBnbWFpbC5jb20+IHdyb3RlOgo+Pj4+IEFtIDE3LjA5LjE5IHVtIDA3OjQ3IHNjaHJpZWIgSmFu
aSBOaWt1bGE6Cj4+Pj4+IE9uIE1vbiwgMTYgU2VwIDIwMTksIE1hcmVrIE9sxaHDoWsgPG1hcmFl
b0BnbWFpbC5jb20+IHdyb3RlOgo+Pj4+Pj4gVGhlIHB1cnBvc2UgaXMgdG8gZ2V0IHJpZCBvZiBh
bGwgUENJIElEIHRhYmxlcyBmb3IgYWxsIGRyaXZlcnMgaW4KPj4+Pj4+IHVzZXJzcGFjZS4gKG9y
IGF0IGxlYXN0IHN0b3AgdXBkYXRpbmcgdGhlbSkKPj4+Pj4+Cj4+Pj4+PiBNZXNhIGNvbW1vbiBj
b2RlIGFuZCBtb2Rlc2V0dGluZyB3aWxsIHVzZSB0aGlzLgo+Pj4+PiBJJ2QgdGhpbmsgdGhpcyB3
b3VsZCB3YXJyYW50IGEgaGlnaCBsZXZlbCBkZXNjcmlwdGlvbiBvZiB3aGF0IHlvdSB3YW50Cj4+
Pj4+IHRvIGFjaGlldmUgaW4gdGhlIGNvbW1pdCBtZXNzYWdlLgo+Pj4+IEFuZCBtYXliZSBleHBs
aWNpdGx5IGNhbGwgaXQgdWFwaV9uYW1lIG9yIGV2ZW4gdWFwaV9kcml2ZXJfbmFtZS4KPj4+IElm
IGl0J3MgdWFwaV9uYW1lLCB0aGVuIHdoeSBkbyB3ZSBuZWVkIGEgbmV3IG9uZSBmb3IgZXZlcnkg
Z2VuZXJhdGlvbj8KPj4+IFVzZXJzcGFjZSBkcml2ZXJzIHRlbmQgdG8gc3BhbiBhIGxvdCBtb3Jl
IHRoYW4ganVzdCAxIGdlbmVyYXRpb24uIEFuZAo+Pj4gaWYgeW91IHdhbnQgdG8gaGF2ZSBwZXIt
Z2VuZXJhdGlvbiBkYXRhIGZyb20gdGhlIGtlcm5lbCB0byB1c2Vyc3BhY2UsCj4+PiB0aGVuIGlt
byB0aGF0J3MgbXVjaCBiZXR0ZXIgc3VpdGVkIGluIHNvbWUgYW1kZ3B1IGlvY3RsLCBpbnN0ZWFk
IG9mCj4+PiB0cnlpbmcgdG8gZW5jb2RlIHRoYXQgaW50byB0aGUgZHJpdmVyIG5hbWUuCj4+Cj4+
IFdlbGwgd2UgYWxyZWFkeSBoYXZlIGFuIElPQ1RMIGZvciB0aGF0LCBidXQgSSB0aG91Z2h0IHRo
ZSBpbnRlbnRpb24gaGVyZSAKPj4gd2FzIHRvIGdldCByaWQgb2YgdGhlIFBDSS1JRCB0YWJsZXMg
aW4gdXNlcnNwYWNlIHRvIGZpZ3VyZSBvdXQgd2hpY2ggCj4+IGRyaXZlciB0byBsb2FkLgo+IAo+
IFRoYXQncyBqdXN0IHVucmVhbGlzdGljIGluIGdlbmVyYWwsIEknbSBhZnJhaWQuIFNlZSBlLmcu
IHRoZSBvbmdvaW5nCj4gdHJhbnNpdGlvbiBmcm9tIGk5NjUgdG8gaXJpcyBmb3IgcmVjZW50IElu
dGVsIGhhcmR3YXJlLiBIb3cgaXMgdGhlCj4ga2VybmVsIHN1cHBvc2VkIHRvIGtub3cgd2hpY2gg
ZHJpdmVyIGlzIHRvIGJlIHVzZWQ/Cj4gCj4gCj4gRm9yIHRoZSBYb3JnIG1vZGVzZXR0aW5nIGRy
aXZlciwgdGhlcmUncyBhIHNpbXBsZSBzb2x1dGlvbiwgc2VlCj4gaHR0cHM6Ly9naXRsYWIuZnJl
ZWRlc2t0b3Aub3JnL3hvcmcveHNlcnZlci9tZXJnZV9yZXF1ZXN0cy8yNzggLgo+IFNvbWV0aGlu
ZyBzaW1pbGFyIGNhbiBwcm9iYWJseSBiZSBkb25lIGluIE1lc2EgYXMgd2VsbC4KCkFub3RoZXIg
cG9zc2liaWxpdHkgbWlnaHQgYmUgZm9yIFhvcmcgdG8gdXNlCmh0dHBzOi8vd3d3Lmtocm9ub3Mu
b3JnL3JlZ2lzdHJ5L0VHTC9leHRlbnNpb25zL01FU0EvRUdMX01FU0FfcXVlcnlfZHJpdmVyLnR4
dAp0byBkZXRlcm1pbmUgdGhlIGRyaXZlciBuYW1lLiBUaGVuIG9ubHkgTWVzYSBtaWdodCBuZWVk
IGFueSBIVyBzcGVjaWZpYwpjb2RlLgoKCi0tIApFYXJ0aGxpbmcgTWljaGVsIETDpG56ZXIgICAg
ICAgICAgICAgICB8ICAgICAgICAgICAgICAgaHR0cHM6Ly9yZWRoYXQuY29tCkxpYnJlIHNvZnR3
YXJlIGVudGh1c2lhc3QgICAgICAgICAgICAgfCAgICAgICAgICAgICBNZXNhIGFuZCBYIGRldmVs
b3BlcgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
