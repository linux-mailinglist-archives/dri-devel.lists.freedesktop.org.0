Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62A001D0A48
	for <lists+dri-devel@lfdr.de>; Wed, 13 May 2020 09:52:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00D566E9B3;
	Wed, 13 May 2020 07:52:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.178])
 by gabe.freedesktop.org (Postfix) with ESMTP id 47E756E9B3;
 Wed, 13 May 2020 07:52:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id 9EC9D2A6046;
 Wed, 13 May 2020 09:52:30 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id Hhxao25PSrGf; Wed, 13 May 2020 09:52:30 +0200 (CEST)
Received: from thor (252.80.76.83.dynamic.wline.res.cust.swisscom.ch
 [83.76.80.252])
 by netline-mail3.netline.ch (Postfix) with ESMTPSA id 11BC32A6045;
 Wed, 13 May 2020 09:52:30 +0200 (CEST)
Received: from localhost ([::1]) by thor with esmtp (Exim 4.93)
 (envelope-from <michel@daenzer.net>)
 id 1jYmBo-000qd4-Pd; Wed, 13 May 2020 09:52:28 +0200
Subject: Re: [Nouveau] [PATCH 1/3] drm/radeon: remove AGP support
To: christian.koenig@amd.com, Alex Deucher <alexdeucher@gmail.com>,
 Roy Spliet <nouveau@spliet.org>
References: <20200511171722.96576-1-christian.koenig@amd.com>
 <20200511171722.96576-2-christian.koenig@amd.com>
 <CADnq5_MyO_L+1w69qDLzhg34W6Qer-uSRR2tb7-2uXLC_6PXSg@mail.gmail.com>
 <ba0b1ab7-3078-a6f2-41cd-326ca21ee99f@daenzer.net>
 <CADnq5_MdbJUXs7wbG=HCOKj4Vp_NmLkcJng=EXynSXPe9gsyOQ@mail.gmail.com>
 <777c08d1-3ac3-16ca-0222-e2d62c281e50@spliet.org>
 <CADnq5_NK6ziShvkDug5xGHm7oZTf9qEu41gOxvNANQHFD2a-qQ@mail.gmail.com>
 <5c3da9d3-8b77-e97f-28a2-e1083a53a1d7@gmail.com>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
Message-ID: <ef9026a7-11d4-c011-a434-d0d018a0bc18@daenzer.net>
Date: Wed, 13 May 2020 09:52:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <5c3da9d3-8b77-e97f-28a2-e1083a53a1d7@gmail.com>
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
Cc: nouveau <nouveau@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAyMC0wNS0xMyA5OjQ2IGEubS4sIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4gQW0gMTIu
MDUuMjAgdW0gMjM6MTIgc2NocmllYiBBbGV4IERldWNoZXI6Cj4+IE9uIFR1ZSwgTWF5IDEyLCAy
MDIwIGF0IDQ6NTIgUE0gUm95IFNwbGlldCA8bm91dmVhdUBzcGxpZXQub3JnPiB3cm90ZToKPj4+
Cj4+PiBJJ2xsIHZvbHVudGVlciB0byBiZSB0aGUgb25lIGFza2luZzogaG93IGJpZyBpcyB0aGlz
IHBlcmZvcm1hbmNlCj4+PiBkaWZmZXJlbmNlPyBIYXZlIGFueSBiZW5jaG1hcmtzIGJlZW4gcnVu
IGJlZm9yZSBhbmQgYWZ0ZXIgcmVtb3ZhbCBvZiBBR1AKPj4+IEdBUlQgY29kZSBvbiBhZmZlY3Rl
ZCBub3V2ZWF1L3JhZGVvbiBzeXN0ZW1zPyBPciBpcyB0aGlzIGNvZGUgYmVpbmcKPj4+IGRyb3Bw
ZWQgX2p1c3RfIGJlY2F1c2UgaXQncyBjdW1iZXJzb21lLCB3aXRoIG5vIHJlZ2FyZCBmb3IgbWV0
cmljcyB0aGF0Cj4+PiBkZXRlcm1pbmUgdGhlIHZhbHVlIG9mIEFHUCBHQVJUIHN1cHBvcnQ/Cj4+
Pgo+PiBJIGRvbid0IHRoaW5rIGFueW9uZSBoYXMgYW55IHNvbGlkIG51bWJlcnMsIGp1c3QgYW5l
Y2RvdGFsIGZyb20KPj4gbWVtb3J5LsKgIEkgY2VydGFpbmx5IGRvbid0IGhhdmUgYW55IGZ1bmN0
aW9uYWwgQUdQIHN5c3RlbXMgYXQgdGhpcwo+PiBwb2ludC7CoCBJdCdzIG1vc3RseSBqdXN0IGN1
bWJlcnNvbWUgYW5kIHdvdWxkIGFsbG93IHVzIHRvIGNsZWFuIHR0bQo+PiBhbmQgcHJvYmFibHkg
aW1wcm92ZSBzdGFiaWxpdHkgYXQgdGhlIHNhbWUgdGltZS7CoCBBdCBsZWFzdCBvbiB0aGUKPj4g
cmFkZW9uIHNpZGUsIHRoZSBvbmx5IG5hdGl2ZSBBR1AgY2FyZHMgd2VyZSByMXh4LCByMnh4LCBh
bmQgc29tZSBvZgo+PiB0aGUgZWFybHkgcjN4eCBib2FyZHMuwqAgT25jZSB3ZSBzd2l0Y2hlZCB0
byBwY2llIG1pZC13YXkgdGhyb3VnaCByM3h4LAo+PiBldmVyeXRoaW5nIHdhcyBuYXRpdmUgcGNp
ZSBhbmQgdGhlIEFHUCBjYXJkcyB1c2VkIGEgcGNpZSB0byBBR1AgYnJpZGdlCj4+IGNoaXAgc28g
dGhleSBoYWQgYSBkZWNlbnQgb24gY2hpcCBNTVUuwqAgVGhvc2Ugb2xkZXIgY2FyZHMgdG9wcGVk
IG91dAo+PiBhdCBtYXliZSAzMiBvciA2NCBNQiBvZiB2cmFtLCBzbyB0aGV5IGFyZSBnb2luZyB0
byBiZSBoYXJkIHByZXNzZWQgdG8KPj4gZGVhbCB3aXRoIG1vZGVybiBkZXNrdG9wcyBhbnl3YXku
wqAgTm8gaWRlYSB3aGF0IHNvcnQgb2YgR0FSVAo+PiBjYXBhYmlsaXRpZXMgTlYgQUdQIGhhcmR3
YXJlIGF0IHRoaXMgdGltZSBoYWQuCj4gCj4gSSBjb3VsZCBvbmx5IHRlc3Qgd2l0aCBhbiBvbGQg
eDg2IE1hYyBhbmQgYW4gcjN4eCBnZW5lcmF0aW9uIGh3IGFuZCBpbgo+IHRoaXMgY2FzZSBtYWtp
bmcgdGhlIHN3aXRjaCBkaWRuJ3QgaGFkIGFueSBub3RpY2VhYmxlIGVmZmVjdCBhdCBhbGwuCj4g
Cj4gQnV0IEkgZGlkbid0IGRvIG1vcmUgdGhhbiBwbGF5aW5nIGFyb3VuZCB3aXRoIHRoZSBkZXNr
dG9wIGVmZmVjdHMgYW5kCj4gcGxheWluZyBhIHZpZGVvLgoKWWVhaCwgdGhhdCdzIG5vdCBlbm91
Z2ggdG8gc2VlIGEgZGlmZmVyZW5jZS4gVHJ5IGFuIE9wZW5HTCBnYW1lLCBvciBldmVuCmp1c3Qg
Z2x4Z2VhcnMuCgoKLS0gCkVhcnRobGluZyBNaWNoZWwgRMOkbnplciAgICAgICAgICAgICAgIHwg
ICAgICAgICAgICAgICBodHRwczovL3JlZGhhdC5jb20KTGlicmUgc29mdHdhcmUgZW50aHVzaWFz
dCAgICAgICAgICAgICB8ICAgICAgICAgICAgIE1lc2EgYW5kIFggZGV2ZWxvcGVyCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
