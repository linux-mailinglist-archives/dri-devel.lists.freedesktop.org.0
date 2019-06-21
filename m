Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F7B84EC8D
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2019 17:52:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56D6D6E8EB;
	Fri, 21 Jun 2019 15:52:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.178])
 by gabe.freedesktop.org (Postfix) with ESMTP id 659906E8EB;
 Fri, 21 Jun 2019 15:52:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id B1B462A6045;
 Fri, 21 Jun 2019 17:52:49 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id QDo1qhuOT-KS; Fri, 21 Jun 2019 17:52:49 +0200 (CEST)
Received: from thor (116.245.63.188.dynamic.wline.res.cust.swisscom.ch
 [188.63.245.116])
 by netline-mail3.netline.ch (Postfix) with ESMTPSA id 4DD072A6042;
 Fri, 21 Jun 2019 17:52:48 +0200 (CEST)
Received: from localhost ([::1]) by thor with esmtp (Exim 4.92)
 (envelope-from <michel@daenzer.net>)
 id 1heLqH-0002JE-5L; Fri, 21 Jun 2019 17:52:45 +0200
Subject: Re: [PATCH 01/13] drm/amdgpu: introduce and honour DRM_FORCE_AUTH
 workaround
To: Daniel Vetter <daniel@ffwll.ch>
References: <9cad6e74-4751-0b0a-35d1-e8f0ac4d3efc@amd.com>
 <20190621090953.GZ12905@phenom.ffwll.local>
 <be9f38f5-6bb5-9535-f3d9-bafa83370e0f@amd.com>
 <CAKMK7uE5qO4q3RYNDp22gkMSSJGgz9ChxhuWPYqXO6D1UUvy6Q@mail.gmail.com>
 <20190621102015.GA21486@arch-x1c3>
 <d241fab3-b6f0-d38a-b83f-03b70736b355@amd.com>
 <CAKMK7uEVziNZJES9=JFBUu=LpmubS8=-A654cMN+QqhEmc8Fvw@mail.gmail.com>
 <c92dc683-6815-dc5a-dc2b-54517cc027de@gmail.com>
 <CAKMK7uHsv3HOXOQq=GGRkx6f+ssRg7dO7qEoBqRS9V_KiTN3Hg@mail.gmail.com>
 <b182c8e3-c060-71f0-2b3b-62600d825c9f@daenzer.net>
 <20190621154416.GE12905@phenom.ffwll.local>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
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
Message-ID: <13024821-4767-eeaf-86eb-9ae1056f8931@daenzer.net>
Date: Fri, 21 Jun 2019 17:52:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190621154416.GE12905@phenom.ffwll.local>
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
Cc: David Airlie <airlied@linux.ie>, Emil Velikov <emil.l.velikov@gmail.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS0wNi0yMSA1OjQ0IHAubS4sIERhbmllbCBWZXR0ZXIgd3JvdGU6Cj4gT24gRnJpLCBK
dW4gMjEsIDIwMTkgYXQgMDU6MTU6MjJQTSArMDIwMCwgTWljaGVsIETDpG56ZXIgd3JvdGU6Cj4+
IE9uIDIwMTktMDYtMjEgMTo1MCBwLm0uLCBEYW5pZWwgVmV0dGVyIHdyb3RlOgo+Pj4gT24gRnJp
LCBKdW4gMjEsIDIwMTkgYXQgMTozNyBQTSBDaHJpc3RpYW4gS8O2bmlnCj4+PiA8Y2tvZW5pZy5s
ZWljaHR6dW1lcmtlbkBnbWFpbC5jb20+IHdyb3RlOgo+Pj4+IEFtIDIxLjA2LjE5IHVtIDEzOjAz
IHNjaHJpZWIgRGFuaWVsIFZldHRlcjoKPj4+Pj4gU28gaWYgeW91IHdhbnQgdG8gZGVwcmFjYXRl
IHJlbmRlciBmdW5jdGlvbmFsaXR5IG9uIHByaW1hcnkgbm9kZXMsIHlvdQo+Pj4+PiBfaGF2ZV8g
dG8gZG8gdGhhdCBoaWRpbmcgaW4gdXNlcnNwYWNlLiBPciB5b3UnbGwgYnJlYWsgYSBsb3Qgb2YK
Pj4+Pj4gY29tcG9zaXRvcnMgZXZlcnl3aGVyZS4gSnVzdCB0ZXN0aW5nIC1hbWRncHUgZG9lc24n
dCByZWFsbHkgcHJvdmUKPj4+Pj4gYW55dGhpbmcgaGVyZS4gU28geW91IHdvbid0IG1vdmUgdGhl
IGxhcmdlciBlY29zeXN0ZW0gd2l0aCB0aGlzIGF0Cj4+Pj4+IGFsbCwgdGhhdCBzaGlwIHNhaWxl
ZC4KPj4+Pgo+Pj4+IFNvIHdoYXQgZWxzZSBjYW4gd2UgZG8/IFRoYXQgc291bmRzIGxpa2UgeW91
IHN1Z2dlc3Qgd2Ugc2hvdWxkCj4+Pj4gY29tcGxldGVseSBkcm9wIHJlbmRlciBub2RlIGZ1bmN0
aW9uYWxpdHkuCj4+Pj4KPj4+PiBJIG1lYW4gaXQncyBub3QgbXkgcHJlZmVycmVkIG9wdGlvbiwg
YnV0IGNlcnRhaW5seSBzb21ldGhpbmcgdGhhdAo+Pj4+IGV2ZXJ5Ym9keSBjb3VsZCBkby4KPj4+
Pgo+Pj4+IE15IHByaW1hcnkgY29uY2VybiBpcyB0aGF0IHdlIHNvbWVob3cgbmVlZCB0byBnZXQg
cmlkIG9mIHRoaW5rcyBsaWtlIEdFTQo+Pj4+IGZsaW5rIGFuZCBhbGwgdGhhdCBvdGhlciBjcnVm
dHkgc3R1ZmYgd2Ugc3RpbGwgaGF2ZSBhcm91bmQgb24gdGhlCj4+Pj4gcHJpbWFyeSBub2RlICh3
ZSBzaG91bGQgcHJvYmFibHkgbWFrZSBhIGxpc3Qgb2YgdGhhdCkuCj4+Pj4KPj4+PiBTd2l0Y2hp
bmcgZXZlcnl0aGluZyBvdmVyIHRvIHJlbmRlciBub2RlcyBqdXN0IHNvdW5kZWQgbGlrZSB0aGUg
YmVzdAo+Pj4+IGFsdGVybmF0aXZlIHNvIGZhciB0byBhcmNoaXZlIHRoYXQuCj4+Pgo+Pj4gdGJo
IEkgZG8gbGlrZSB0aGF0IHBsYW4gdG9vLCBidXQgaXQncyBhIGxvdCBtb3JlIHdvcmsuIEFuZCBJ
IHRoaW5rIHRvCj4+PiBoYXZlIGFueSBwdXNoIHdoYXRzb2V2ZXIgd2UgcHJvYmFibHkgbmVlZCB0
byByb2xsIGl0IG91dCBpbiBnYm0gYXMgYQo+Pj4gaGFjayB0byBrZWVwIHRoaW5ncyBnb2luZy4g
QnV0IHByb2JhYmx5IG5vdCBlbm91Z2guCj4+Pgo+Pj4gSSBhbHNvIHRoaW5rIHRoYXQgYXQgbGVh
c3Qgc29tZSBjb21wb3NpdG9ycyB3aWxsIGJvdGhlciB0byBkbyB0aGUKPj4+IHJpZ2h0IHRoaW5n
LCBhbmQgYWN0dWFsbHkgYm90aGVyIHdpdGggcmVuZGVyIG5vZGVzIGFuZCBhbGwgdGhhdAo+Pj4g
Y29ycmVjdGx5LiBJdCdzIGp1c3QgdGhhdCB0aGVyZSdzIHdheSBtb3JlIHdoaWNoIGRvbnQuCj4+
Cj4+IFdpdGggYW1kZ3B1LCB3ZSBjYW4gbWFrZSB1c2Vyc3BhY2UgYWx3YXlzIHVzZSByZW5kZXIg
bm9kZXMgZm9yIHJlbmRlcmluZwo+PiB3aXRoIGNoYW5nZXMgdG8gbGliZHJtX2FtZGdwdS9yYWRl
b25zaS94Zjg2LXZpZGVvLWFtZGdwdSAoYW5kIG1heWJlIHNvbWUKPj4gYW1kZ3B1LXBybyBjb21w
b25lbnRzKSBvbmx5LiBObyBHQk0vY29tcG9zaXRvciBjaGFuZ2VzIG5lZWRlZC4KPiAKPiBUaGlz
IGlzIGEgdmVyeSBub24tZXhoYXVzdGl2ZSBsaXN0IG9mIHVzZXJzcGFjZSB0aGF0IHJ1bnMgb24g
eW91ciBkcml2ZXIKPiAuLi4gVGhpcyB3YXlsYW5kIGNvbXBvc2l0b3IgdGhpbmcsIGFjdHVhbGx5
IHNoaXBwaW5nIG5vdywgYW5kIHRoZXJlJ3MgbWFueSA6LSkKCllvdSBkb24ndCBzZWVtIHRvIHVu
ZGVyc3RhbmQgd2hhdCBJIHdyb3RlLiBFdmVyeXRoaW5nIHdpbGwgd29yayBhdCBsZWFzdAphcyB3
ZWxsIGFzIG5vdywgd2l0aG91dCBhbnkgb3RoZXIgY2hhbmdlcy4KCgo+Pj4+PiBPbmNlIHdlIHBp
Y2tlZCBhIGNvbG9yIGl0J3MgYSBzaW1wbGUgdGVjaG5pY2FsIG1hdHRlciBvZiBob3cgdG8gcm9s
bAo+Pj4+PiBpdCBvdXQsIHVzaW5nIEtjb25maWcgb3B0aW9ucywgb3Igb25seSBlbmFibGluZyBv
biBuZXcgaHcsIG9yICJtZXJnZQo+Pj4+PiBhbmQgZml4IHRoZSByZWdyZXNzaW9ucyBhcyB0aGV5
IGNvbWUiIG9yIGFueSBvZiB0aGUgb3RoZXIgd2VsbCBwcm92ZW4KPj4+Pj4gcGF0aHMgZm9yd2Fy
ZC4KPj4+Pgo+Pj4+IFllYWgsIHRoZSBwcm9ibGVtIGlzIEkgZG9uJ3Qgc2VlIGFuIG9wdGlvbiB3
aGljaCBjdXJyZW50bHkgd29ya3MgZm9yCj4+Pj4gZXZlcnlvbmUuCj4+Pj4KPj4+PiBJIGFic29s
dXRlbHkgbmVlZCBhIGdyYWNlIHRpbWUgb2YgbXVsdGlwbGUgeWVhcnMgdW50aWwgd2UgY2FuIGFw
cGx5IHRoaXMKPj4+PiB0byBhbWRncHUvcmFkZW9uLgo+Pj4KPj4+IFllYWggdGhhdCdzIHdoYXQg
SSBtZWFudCB3aXRoICJwaWNrIGEgY29sb3IsIHBpY2sgYSB3YXkgdG8gcm9sbCBpdAo+Pj4gb3V0
Ii4gImVuYWJsZSBmb3IgbmV3IGh3LCByb2xsIG91dCB5ZWFycyBhbmQgeWVhcnMgbGF0ZXIiIGlz
IG9uZSBvZgo+Pj4gdGhlIG9wdGlvbnMgZm9yIHJvbGwgb3V0Lgo+Pgo+PiBPbmUgZ290Y2hhIGJl
aW5nIHRoYXQgZ2VuZXJpYyB1c2Vyc3BhY2Ugc3VjaCBhcyB0aGUgWG9yZyBtb2Rlc2V0dGluZwo+
PiBkcml2ZXIgbWF5IHN0aWxsIHRyeSB0byB1c2UgcGhhc2VkIG91dCBmdW5jdGlvbmFsaXR5IHN1
Y2ggYXMgRFJJMiB3aXRoCj4+IG5ldyBoYXJkd2FyZS4KPiAKPiBUaGVyZSdzIGEgbG90IG1vcmUg
Z2VuZXJpYyB1c2Vyc3BhY2UgdGhhbiAtbW9kZXNldHRpbmcuCgpUaGF0IGlzIGFmZmVjdGVkIGJ5
IHBoYXNpbmcgb3V0IERSSTIgcmVsYXRlZCBmdW5jdGlvbmFsaXR5PyAoSSB0aG91Z2h0CnRoYXQg
d2FzIHRoZSBjb250ZXh0IG9mIHRoaXMgc3ViLXN1Yi10aHJlYWQpCgoKPiBUaGF0IHdhcyB0aGUg
ZW50aXJlIHBvaW50IG9mIGttcywgYW5kIGl0IHN1Y2NlZWQgcmVhbGx5IHdlbGwuIFRoYXQncwo+
IHdoeSBJIGRvbid0IHRoaW5rIGFtZGdwdSBkb2luZyB0aGVpciBvd24gZmxhdm91ciBwaWNrIGlz
IGdvaW5nIHRvIGhlbHAKPiBhbnlvbmUgaGVyZSwKT3RoZXIgZHJpdmVycyBhcmUgd2VsY29tZSB0
byBlbXVsYXRlIGFtZGdwdSdzIGRlc2lnbiBtYWtpbmcgdGhlIGFib3ZlCnBvc3NpYmxlLiA6KQoK
Cj4gZXhjZXB0IG1heWJlIGlmIGFsbCB5b3UgY2FyZSBhYm91dCBpcyB0aGUgYW1kIHN0YW5kLWFs
b25lPiBzdGFjayBvbmx5Lgo+IEJ1dCB0aGVuIHdoeSBkbyB5b3UgYm90aGVyIHdpdGggdGhpcyB1
cHN0cmVhbSBzdHVmZiBhdCBhbGw+IC4uLgoKSSdtIGFmcmFpZCB5b3UndmUgbG9zdCBtZSBoZXJl
LgoKCi0tIApFYXJ0aGxpbmcgTWljaGVsIETDpG56ZXIgICAgICAgICAgICAgICB8ICAgICAgICAg
ICAgICBodHRwczovL3d3dy5hbWQuY29tCkxpYnJlIHNvZnR3YXJlIGVudGh1c2lhc3QgICAgICAg
ICAgICAgfCAgICAgICAgICAgICBNZXNhIGFuZCBYIGRldmVsb3BlcgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
