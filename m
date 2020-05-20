Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 649871DB941
	for <lists+dri-devel@lfdr.de>; Wed, 20 May 2020 18:25:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B9126E86E;
	Wed, 20 May 2020 16:25:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.178])
 by gabe.freedesktop.org (Postfix) with ESMTP id CD63C6E194;
 Wed, 20 May 2020 16:25:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id CD3B32A6048;
 Wed, 20 May 2020 18:25:45 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id fKgcnsgcu5hV; Wed, 20 May 2020 18:25:45 +0200 (CEST)
Received: from thor (252.80.76.83.dynamic.wline.res.cust.swisscom.ch
 [83.76.80.252])
 by netline-mail3.netline.ch (Postfix) with ESMTPSA id 573902A6046;
 Wed, 20 May 2020 18:25:45 +0200 (CEST)
Received: from localhost ([::1]) by thor with esmtp (Exim 4.93)
 (envelope-from <michel@daenzer.net>)
 id 1jbRXM-000Ydc-T3; Wed, 20 May 2020 18:25:44 +0200
Subject: Re: [RFC] Deprecate AGP GART support for Radeon/Nouveau/TTM
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 amd-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>
References: <20200513110313.12979-1-christian.koenig@amd.com>
 <9d784383-905e-59af-b17c-923c92474ece@gmail.com>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
Message-ID: <ea2dfaaa-a7ca-5e4a-9264-0a82f1d5ea9b@daenzer.net>
Date: Wed, 20 May 2020 18:25:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <9d784383-905e-59af-b17c-923c92474ece@gmail.com>
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
Cc: debian-powerpc@lists.debian.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAyMC0wNS0yMCA0OjQzIHAubS4sIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4gQW0gMTMu
MDUuMjAgdW0gMTM6MDMgc2NocmllYiBDaHJpc3RpYW4gS8O2bmlnOgo+PiBVbmZvcnR1bmF0ZWx5
IEFHUCBpcyBzdGlsbCB0byB3aWRlbHkgdXNlZCBhcyB3ZSBjb3VsZCBqdXN0IGRyb3AKPj4gc3Vw
cG9ydCBmb3IgdXNpbmcgaXRzIEdBUlQuCj4+Cj4+IE5vdCB1c2luZyB0aGUgQUdQIEdBUlQgYWxz
byBkb2Vzbid0IG1lYW4gYSBsb3NzIGluIGZ1bmN0aW9uYWxpdHkgc2luY2UKPj4gZHJpdmVycyB3
aWxsIGp1c3QgZmFsbGJhY2sgdG8gdGhlIGRyaXZlciBzcGVjaWZpYyBQQ0kgR0FSVC4KPj4KPj4g
Rm9yIG5vdyBqdXN0IGRlcHJlY2F0ZSB0aGUgY29kZSBhbmQgZG9uJ3QgZW5hYmxlIHRoZSBBR1Ag
R0FSVCBpbiBUVE0KPj4gZXZlbiB3aGVuIGdlbmVyYWwgQUdQIHN1cHBvcnQgaXMgYXZhaWxhYmxl
Lgo+IAo+IFNvIEkndmUgdXNlZCBhbiBhbmNpZW50IHN5c3RlbSAoMzJiaXQpIHRvIHNldHVwIGEg
dGVzdCBib3ggZm9yIHRoaXMuCj4gCj4gCj4gVGhlIGZpcnN0IEdQVSBJIGNvdWxkIHRlc3QgaXMg
YW4gUlYyODAgKFJhZGVvbiA5MjAwIFBSTykgd2hpY2ggaXMgZWFzaWx5Cj4gMTUgeWVhcnMgb2xk
Lgo+IAo+IFdoYXQgaGFwcGVucyBpbiBBR1AgbW9kZSBpcyB0aGF0IGdseGdlYXJzIHNob3dzIGFy
dGlmYWN0cyBkdXJpbmcKPiByZW5kZXJpbmcgb24gdGhpcyBzeXN0ZW0uCj4gCj4gSW4gUENJIG1v
ZGUgdGhvc2UgcmVuZGVyaW5nIGFydGlmYWN0cyBhcmUgZ29uZSBhbmQgZ2x4Z2VhcnMgc2VlbXMg
dG8KPiBkcmF3IGV2ZXJ5dGhpbmcgY29ycmVjdGx5IG5vdy4KPiAKPiBQZXJmb3JtYW5jZSBpcyBv
YnZpb3VzbHkgbm90IGNvbXBhcmFibGUsIGNhdXNlIGluIEFHUCB3ZSBkb24ndCByZW5kZXIKPiBh
bGwgdHJpYW5nbGVzIGNvcnJlY3RseS4KPiAKPiAKPiBUaGUgc2Vjb25kIEdQVSBJIGNvdWxkIHRl
c3QgaXMgYW4gUlY2MzAgUFJPIChSYWRlb24gSEQgMjYwMCBQUk8gQUdQKQo+IHdoaWNoIGlzIG1v
cmUgdGhhbiAxMCB5ZWFycyBvbGQuCj4gCj4gQXMgZmFyIGFzIEkgY2FuIHRlbGwgdGhpcyBvbmUg
d29ya3MgaW4gYm90aCBBR1AgYW5kIFBDSWUgbW9kZSBwZXJmZWN0bHkKPiBmaW5lLgo+IAo+IFNp
bmNlIHRoaXMgaXMgb25seSBhIDMyYml0IHN5c3RlbSBJIGNvdWxkbid0IHJlYWxseSB0ZXN0IGFu
eSBPcGVuR0wgZ2FtZQo+IHRoYXQgd2VsbC4KPiAKPiBCdXQgZm9yIGdseGdlYXJzIHN3aXRjaGlu
ZyBmcm9tIEFHUCB0byBQQ0llIG1vZGUgc2VlbXMgdG8gcmVzdWx0IGluIGEKPiByb3VnaGx5IDUl
IHBlcmZvcm1hbmNlIGRyb3AuCj4gCj4gVGhlIHN1cnByaXNpbmcgcmVhc29uIGZvciB0aGlzIGlz
IG5vdCB0aGUgYmV0dGVyIFRMQiBwZXJmb3JtYW5jZSwgYnV0Cj4gdGhlIGxhY2sgb2YgVVNXQyBz
dXBwb3J0IGZvciB0aGUgUENJZSBHQVJUIGluIHJhZGVvbi4KCkkgc3VzcGVjdCB0aGUgbWFpbiBy
ZWFzb24gaXQncyBvbmx5IDUlIGlzIHRoYXQgUENJZSBHQVJUIHBhZ2UgdGFibGVzIGFyZQpzdG9y
ZWQgaW4gVlJBTSwgc28gdGhleSBkb24ndCBuZWVkIHRvIGJlIGZldGNoZWQgYWNyb3NzIHRoZSBQ
Q0llIGxpbmsKKGFuZCBwcmVzdW1hYmx5IGl0IGhhcyBtb3JlIHRoYW4gb25lIFRMQiBlbnRyeSBh
cyB3ZWxsKS4gVGhlIGRpZmZlcmVuY2UKaXMgbXVjaCBiaWdnZXIgd2l0aCBuYXRpdmUgQUdQIEFT
SUNzIHdpdGggUENJIEdBUlQuCgoKLS0gCkVhcnRobGluZyBNaWNoZWwgRMOkbnplciAgICAgICAg
ICAgICAgIHwgICAgICAgICAgICAgICBodHRwczovL3JlZGhhdC5jb20KTGlicmUgc29mdHdhcmUg
ZW50aHVzaWFzdCAgICAgICAgICAgICB8ICAgICAgICAgICAgIE1lc2EgYW5kIFggZGV2ZWxvcGVy
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
