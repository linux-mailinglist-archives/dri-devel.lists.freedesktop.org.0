Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A86E61E9166
	for <lists+dri-devel@lfdr.de>; Sat, 30 May 2020 15:08:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C0E36E02C;
	Sat, 30 May 2020 13:08:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.178])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9BF416E02C
 for <dri-devel@lists.freedesktop.org>; Sat, 30 May 2020 13:08:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id F02392A6042;
 Sat, 30 May 2020 15:08:49 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id tg67PVYzRLOA; Sat, 30 May 2020 15:08:49 +0200 (CEST)
Received: from thor (212.174.63.188.dynamic.wline.res.cust.swisscom.ch
 [188.63.174.212])
 by netline-mail3.netline.ch (Postfix) with ESMTPSA id C6D572A6016;
 Sat, 30 May 2020 15:08:48 +0200 (CEST)
Received: from localhost ([::1]) by thor with esmtp (Exim 4.93)
 (envelope-from <michel@daenzer.net>)
 id 1jf1EF-000Hc2-7q; Sat, 30 May 2020 15:08:47 +0200
Subject: Re: [PATCH v3] drm/fourcc: document modifier uniqueness requirements
To: Daniel Stone <daniel@fooishbar.org>, Alex Deucher <alexdeucher@gmail.com>
References: <WOsdNGp0dhyp8Modsrt7DYpd0fVk7Yk264FISQ1Yls30bhlSXbxzgKTpmOCJ9H2WV1XHyUjCXu7nwBOWQ6n1NCbIcVl1-1IZ4rMMGN1dN-U=@emersion.fr>
 <CAAxE2A4NCo_KMkemUOHKbZ7P=GR4p-zwhpmP7Get18x4Ydb-Gg@mail.gmail.com>
 <bbZABMxDckHUj5JW5DW0pSewqQ-rAIW0gvNnTlI4np7o1A2bDrpPGIeyk5tXGMDr_cAI1l_R9qw6ykJ8OEhQlbKruJ8IG579jqADaPAnUbA=@emersion.fr>
 <CADnq5_MEFM_2k_uboU6E9d3_j18K+tz=Axtie-80PSSwJ2vkYw@mail.gmail.com>
 <CAPj87rMrJLNNbFJVvf081=eRqPqAe1H7=+PM21N22Jdsg7FzVQ@mail.gmail.com>
 <CADnq5_OX9o5_Gc4SjU5M4B=fthT9++J-FjX3UqTS7x_u6cJHOQ@mail.gmail.com>
 <CAPj87rP+Hxhohb4dEjRwtZzy34fYk+hAdgVfCkLF1u4JufJ=CQ@mail.gmail.com>
 <CADnq5_Pzj+AWQZWOcwvf8WQDVJrpc2DyG6Z1ZYqgfHA-8AXpMA@mail.gmail.com>
 <CAPj87rNO62i5JmRLdMhAg9XbiJUyrrRO7fj1ruXRCh-oxHnifQ@mail.gmail.com>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
Message-ID: <f3600bbc-bf45-7e6e-0858-7ed8ca8dafb9@daenzer.net>
Date: Sat, 30 May 2020 15:08:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <CAPj87rNO62i5JmRLdMhAg9XbiJUyrrRO7fj1ruXRCh-oxHnifQ@mail.gmail.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAyMC0wNS0yOSA1OjAxIHAubS4sIERhbmllbCBTdG9uZSB3cm90ZToKPiBPbiBGcmksIDI5
IE1heSAyMDIwIGF0IDE1OjM2LCBBbGV4IERldWNoZXIgPGFsZXhkZXVjaGVyQGdtYWlsLmNvbT4g
d3JvdGU6Cj4+IE9uIEZyaSwgTWF5IDI5LCAyMDIwIGF0IDEwOjMyIEFNIERhbmllbCBTdG9uZSA8
ZGFuaWVsQGZvb2lzaGJhci5vcmc+IHdyb3RlOgo+Pj4gT24gRnJpLCAyOSBNYXkgMjAyMCBhdCAx
NToyOSwgQWxleCBEZXVjaGVyIDxhbGV4ZGV1Y2hlckBnbWFpbC5jb20+IHdyb3RlOgo+Pj4+IE1h
eWJlIEknbSBvdmVyIHRoaW5raW5nIHRoaXMuICBJIGp1c3QgZG9uJ3Qgd2FudCB0byBnZXQgaW50
byBhCj4+Pj4gc2l0dWF0aW9uIHdoZXJlIHdlIGdvIHRocm91Z2ggYSBsb3Qgb2YgZWZmb3J0IHRv
IGFkZCBtb2RpZmllciBzdXBwb3J0Cj4+Pj4gYW5kIHRoZW4gcGVyZm9ybWFuY2UgZW5kcyB1cCBi
ZWluZyB3b3JzZSB0aGFuIGl0IGlzIHRvZGF5IGluIGEgbG90IG9mCj4+Pj4gY2FzZXMuCj4+Pgo+
Pj4gSSdtIGdlbnVpbmVseSBjdXJpb3VzOiB3aGF0IGRvIHlvdSBpbWFnaW5lIGNvdWxkIGNhdXNl
IGEgd29yc2UgcmVzdWx0Pwo+Pgo+PiBBcyBhbiBleGFtcGxlLCBpbiBzb21lIGNhc2VzLCBpdCdz
IGFjdHVhbGx5IGJldHRlciB0byB1c2UgbGluZWFyIGZvcgo+PiBzeXN0ZW0gbWVtb3J5IGJlY2F1
c2UgaXQgYmV0dGVyIGFsaWducyB3aXRoIHBjaWUgYWNjZXNzIHBhdHRlcm5zIHRoYW4KPj4gc29t
ZSB0aWxpbmcgZm9ybWF0cyAod2hpY2ggYXJlIGJldHRlciBhbGlnbmVkIGZvciB0aGUgbWVtb3J5
Cj4+IGNvbnRyb2xsZXIgdG9wb2xvZ3kgb24gdGhlIGRHUFUpLiAgVGhhdCBzYWlkLCBJIGhhdmVu
J3QgYmVlbiBpbiB0aGUKPj4gbG9vcCBhcyBtdWNoIHdpdGggdGhlIHRpbGluZyBmb3JtYXRzIG9u
IG5ld2VyIEdQVXMsIHNvIHRoYXQgbWF5IG5vdCBiZQo+PiBhcyBtdWNoIG9mIGFuIGlzc3VlIGFu
eW1vcmUuCj4gCj4gWWVhaCwgdGhhdCBtYWtlcyBhIGxvdCBvZiBzZW5zZS4gT24gdGhlIG90aGVy
IGhhbmQsIHBsYWNlbWVudCBpc24ndAo+IGV4cGxpY2l0bHkgZW5jb2RlZCBmb3IgZWl0aGVyIG1v
ZGlmaWVycyBvciBub24tbW9kaWZpZXJzLCBzbyBJJ20gbm90Cj4gc3VyZSBob3cgaXQgd291bGQg
cmVhbGx5IHJlZ3Jlc3MuCgpXaXRob3V0IG1vZGlmaWVycywgb25seSBsaW5lYXIgYnVmZmVycyBj
b3VsZCBiZSBzaGFyZWQgYmV0d2VlbiBkZXZpY2VzCndpdGggYW1kZ3B1LiBXaXRoIG1vZGlmaWVy
cywgc3VjaCBzaGFyZWQgYnVmZmVycyBtaWdodCBlbmQgdXAgdGlsZWQgYnV0CmxvY2F0ZWQgaW4g
c3lzdGVtIG1lbW9yeS4KCgpBbnl3YXksIGFzIHlvdSBleHBsYWluZWQgd2VsbCwgdGhlIGJlbmVm
aXRzIG9mIG1vZGlmaWVycyBhcmVuJ3QgbGltaXRlZAp0byBpbnRlci1kZXZpY2UgYnVmZmVyIHNo
YXJpbmcuCgoKLS0gCkVhcnRobGluZyBNaWNoZWwgRMOkbnplciAgICAgICAgICAgICAgIHwgICAg
ICAgICAgICAgICBodHRwczovL3JlZGhhdC5jb20KTGlicmUgc29mdHdhcmUgZW50aHVzaWFzdCAg
ICAgICAgICAgICB8ICAgICAgICAgICAgIE1lc2EgYW5kIFggZGV2ZWxvcGVyCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
