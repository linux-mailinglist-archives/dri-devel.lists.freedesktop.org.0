Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2888F30F3C
	for <lists+dri-devel@lfdr.de>; Fri, 31 May 2019 15:47:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36B5E8946E;
	Fri, 31 May 2019 13:47:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.101.70])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9C7B689471
 for <dri-devel@lists.freedesktop.org>; Fri, 31 May 2019 13:47:28 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 73245A78;
 Fri, 31 May 2019 06:47:28 -0700 (PDT)
Received: from [10.1.196.75] (e110467-lin.cambridge.arm.com [10.1.196.75])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 111CC3F5AF;
 Fri, 31 May 2019 06:47:25 -0700 (PDT)
Subject: Re: [PATCH v6 0/6] Allwinner H6 Mali GPU support
To: Tomeu Vizoso <tomeu.vizoso@collabora.com>
References: <20190521161102.29620-1-peron.clem@gmail.com>
 <CAAObsKD8bij1ANLqX6y11Y6mDEXiymNjrDkmHmvGWiFLKWu_FA@mail.gmail.com>
 <4ff02295-6c34-791b-49f4-6558a92ad7a3@arm.com>
 <CAAObsKBt1tPw9RKGi_Xey=1zy9Tu3N+A=1te2R8=NuJ5tDBqVg@mail.gmail.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <dc3872a4-8cd9-462b-9f73-0d69a810d985@arm.com>
Date: Fri, 31 May 2019 14:47:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAAObsKBt1tPw9RKGi_Xey=1zy9Tu3N+A=1te2R8=NuJ5tDBqVg@mail.gmail.com>
Content-Language: en-GB
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Neil Armstrong <narmstrong@baylibre.com>,
 David Airlie <airlied@linux.ie>, Will Deacon <will.deacon@arm.com>,
 open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>, Maxime Ripard <maxime.ripard@bootlin.com>,
 Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
 =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>,
 Linux IOMMU <iommu@lists.linux-foundation.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMzEvMDUvMjAxOSAxMzowNCwgVG9tZXUgVml6b3NvIHdyb3RlOgo+IE9uIFdlZCwgMjkgTWF5
IDIwMTkgYXQgMTk6MzgsIFJvYmluIE11cnBoeSA8cm9iaW4ubXVycGh5QGFybS5jb20+IHdyb3Rl
Ogo+Pgo+PiBPbiAyOS8wNS8yMDE5IDE2OjA5LCBUb21ldSBWaXpvc28gd3JvdGU6Cj4+PiBPbiBU
dWUsIDIxIE1heSAyMDE5IGF0IDE4OjExLCBDbMOpbWVudCBQw6lyb24gPHBlcm9uLmNsZW1AZ21h
aWwuY29tPiB3cm90ZToKPj4+Pgo+Pj4gW3NuaXBdCj4+Pj4gWyAgMzQ1LjIwNDgxM10gcGFuZnJv
c3QgMTgwMDAwMC5ncHU6IG1tdSBpcnEgc3RhdHVzPTEKPj4+PiBbICAzNDUuMjA5NjE3XSBwYW5m
cm9zdCAxODAwMDAwLmdwdTogVW5oYW5kbGVkIFBhZ2UgZmF1bHQgaW4gQVMwIGF0IFZBCj4+Pj4g
MHgwMDAwMDAwMDAyNDAwNDAwCj4+Pgo+Pj4gICBGcm9tIHdoYXQgSSBjYW4gc2VlIGhlcmUsIDB4
MDAwMDAwMDAwMjQwMDQwMCBwb2ludHMgdG8gdGhlIGZpcnN0IGJ5dGUKPj4+IG9mIHRoZSBmaXJz
dCBzdWJtaXR0ZWQgam9iIGRlc2NyaXB0b3IuCj4+Pgo+Pj4gU28gbWFwcGluZyBidWZmZXJzIGZv
ciB0aGUgR1BVIGRvZXNuJ3Qgc2VlbSB0byBiZSB3b3JraW5nIGF0IGFsbCBvbgo+Pj4gNjQtYml0
IFQtNzYwLgo+Pj4KPj4+IFN0ZXZlbiwgUm9iaW4sIGRvIHlvdSBoYXZlIGFueSBpZGVhIG9mIHdo
eSB0aGlzIGNvdWxkIGJlPwo+Pgo+PiBJIHRyaWVkIHJvbGxpbmcgYmFjayB0byB0aGUgb2xkIHBh
bmZyb3N0L25vbmRybSBzaGltLCBhbmQgaXQgd29ya3MgZmluZQo+PiB3aXRoIGtiYXNlLCBhbmQg
SSBhbHNvIGZvdW5kIHRoYXQgVC04MjAgZmFsbHMgb3ZlciBpbiB0aGUgZXhhY3Qgc2FtZQo+PiBt
YW5uZXIsIHNvIHRoZSBmYWN0IHRoYXQgaXQgc2VlbWVkIHRvIGJlIGNvbW1vbiB0byB0aGUgc21h
bGxlciAzMy1iaXQKPj4gZGVzaWducyByYXRoZXIgdGhhbiBhbnl0aGluZyB0byBkbyB3aXRoIHRo
ZSBvdGhlcgo+PiBqb2JfZGVzY3JpcHRvcl9zaXplL3Y0L3Y1IGNvbXBsaWNhdGlvbiB0dXJuZWQg
b3V0IHRvIGJlIHRlbGxpbmcuCj4gCj4gSXMgdGhpcyBjb21wbGljYXRpb24gc29tZXRoaW5nIHlv
dSBjYW4gZXhwbGFpbj8gSSBkb24ndCBrbm93IHdoYXQgdjQKPiBhbmQgdjUgYXJlIG1lYW50IGhl
cmUuCgpJIHdhcyBhbGx1ZGluZyB0byBCQVNFX0hXX0ZFQVRVUkVfVjQsIHdoaWNoIEkgYmVsaWV2
ZSByZWZlcnMgdG8gdGhlIApNaWRnYXJkIGFyY2hpdGVjdHVyZSB2ZXJzaW9uIC0gdGhlIG9sZGVy
IHZlcnNpb25zIGltcGxlbWVudGVkIGJ5IFQ2eHggCmFuZCBUNzIwIHNlZW0gdG8gYmUgY29sbGVj
dGl2ZWx5IHRyZWF0ZWQgYXMgInY0Iiwgd2hpbGUgVDc2MCBhbmQgVDh4eCAKd291bGQgZWZmZWN0
aXZlbHkgYmUgInY1Ii4KCj4+IFsgYXMgYW4gYXNpZGUsIGFyZSA2NC1iaXQgam9icyBhY3R1YWxs
eSBrbm93biBub3QgdG8gd29yayBvbiB2NCBHUFVzLCBvcgo+PiBpcyBpdCBqdXN0IHRoYXQgbm9i
b2R5J3MgeWV0IG9ic2VydmVkIGEgNjQtYml0IGJsb2IgZHJpdmluZyBvbmU/IF0KPiAKPiBJJ20g
bG9va2luZyByaWdodCBub3cgYXQgZ2V0dGluZyBQYW5mcm9zdCB3b3JraW5nIG9uIFQ3MjAgd2l0
aCA2NC1iaXQKPiBkZXNjcmlwdG9ycywgd2l0aCB0aGUgdWx0aW1hdGUgZ29hbCBvZiBtYWtpbmcg
UGFuZnJvc3QKPiA2NC1iaXQtZGVzY3JpcHRvciBvbmx5IHNvIHdlIGNhbiBoYXZlIGEgc2luZ2xl
IGJ1aWxkIG9mIE1lc2EgaW4KPiBkaXN0cm9zLgoKQ29vbCwgSSdsbCBrZWVwIGFuIGV5ZSBvdXQs
IGFuZCBob3BlIHRoYXQgaXQgbWlnaHQgYmUgZW5vdWdoIGZvciBUNjIwIG9uIApKdW5vLCB0b28g
OikKCj4+IExvbmcgc3Rvcnkgc2hvcnQsIGl0IGFwcGVhcnMgdGhhdCAnTWFsaSBMUEFFJyBpcyBh
bHNvIGxhY2tpbmcgdGhlIHN0YXJ0Cj4+IGxldmVsIG5vdGlvbiBvZiBWTVNBLCBhbmQgZXhwZWN0
cyBhIGZ1bGwgNC1sZXZlbCB0YWJsZSBldmVuIGZvciA8NDAgYml0cwo+PiB3aGVuIGxldmVsIDAg
ZWZmZWN0aXZlbHkgcmVkdW5kYW50LiBUaHVzIHdhbGtpbmcgdGhlIDMtbGV2ZWwgdGFibGUgdGhh
dAo+PiBpby1wZ3RhYmxlIGNvbWVzIGJhY2sgd2l0aCBlbmRzIHVwIGdvaW5nIHdpbGRseSB3cm9u
Zy4gVGhlIGhhY2sgYmVsb3cKPj4gc2VlbXMgdG8gZG8gdGhlIGpvYiBmb3IgbWU7IGlmIENsw6lt
ZW50IGNhbiBjb25maXJtIChvbiBULTcyMCB5b3UnbGwKPj4gc3RpbGwgbmVlZCB0aGUgdXNlcnNw
YWNlIGhhY2sgdG8gZm9yY2UgMzItYml0IGpvYnMgYXMgd2VsbCkgdGhlbiBJIHRoaW5rCj4+IEkn
bGwgY29vayB1cCBhIHByb3BlciByZWZhY3RvcmluZyBvZiB0aGUgYWxsb2NhdG9yIHRvIHB1dCB0
aGluZ3MgcmlnaHQuCj4gCj4gTW1hcHMgc2VlbSB0byB3b3JrIHdpdGggdGhpcyBwYXRjaCwgdGhh
bmtzLgo+IAo+IFRoZSBtYWluIGNvbXBsaWNhdGlvbiBJJ20gZmFjaW5nIHJpZ2h0IG5vdyBzZWVt
cyB0byBiZSB0aGF0IHRoZSBTRkJECj4gZGVzY3JpcHRvciBvbiBUNzIwIHNlZW1zIHRvIGJlIGRp
ZmZlcmVudCBmcm9tIHRoZSBvbmUgd2UgYWxyZWFkeSBoYWQKPiAodGVzdGVkIG9uIFQ2eHg/KS4K
Ck9LIC0gd2l0aCB0aGUgMzItYml0IGhhY2sgcG9pbnRlZCB0byB1cC10aHJlYWQsIGEgcXVpY2sg
a21zY3ViZSB0ZXN0IApnYXZlIG1lIHRoZSBpbXByZXNzaW9uIHRoYXQgVDcyMCB3b3JrcyBmaW5l
LCBidXQgb24gY2xvc2VyIGluc3BlY3Rpb24gCnNvbWUgcGFydHMgb2YgZ2xtYXJrMiBkbyBzZWVt
IHRvIGdvIGEgYml0IHdvbmt5IChhbHRob3VnaCBJIHN1c3BlY3QgYXQgCmxlYXN0IHNvbWUgb2Yg
aXQgaXMganVzdCBkb3duIHRvIHRoZSBGUEdBIHNldHVwIGJlaW5nIGJvdGggdmVyeSBzbG93IGFu
ZCAKbGFja2luZyBpbiBtZW1vcnkgYmFuZHdpZHRoKSwgYW5kIHRoZSAibnYxMi0xaW1nIiBtb2Rl
IG9mIGttc2N1YmUgdHVybnMgCm91dCB0byByZW5kZXIgaW4gc29tZSBkZWxpZ2h0ZnVsbHkgd3Jv
bmcgY29sb3Vycy4KCkknbGwgdHJ5IHRvIGdldCBhICdwcm9wZXInIHZlcnNpb24gb2YgdGhlIGlv
LXBndGFibGUgcGF0Y2ggcG9zdGVkIHNvb24uCgpUaGFua3MsClJvYmluLgoKPiAKPiBDaGVlcnMs
Cj4gCj4gVG9tZXUKPiAKPj4gUm9iaW4uCj4+Cj4+Cj4+IC0tLS0tPjgtLS0tLQo+PiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9pb21tdS9pby1wZ3RhYmxlLWFybS5jIGIvZHJpdmVycy9pb21tdS9pby1w
Z3RhYmxlLWFybS5jCj4+IGluZGV4IDU0Njk2OGQ4YTM0OS4uZjI5ZGE2ZThkYzA4IDEwMDY0NAo+
PiAtLS0gYS9kcml2ZXJzL2lvbW11L2lvLXBndGFibGUtYXJtLmMKPj4gKysrIGIvZHJpdmVycy9p
b21tdS9pby1wZ3RhYmxlLWFybS5jCj4+IEBAIC0xMDIzLDEyICsxMDIzLDE0IEBAIGFybV9tYWxp
X2xwYWVfYWxsb2NfcGd0YWJsZShzdHJ1Y3QKPj4gaW9fcGd0YWJsZV9jZmcgKmNmZywgdm9pZCAq
Y29va2llKQo+PiAgICAgICAgICBpb3AgPSBhcm1fNjRfbHBhZV9hbGxvY19wZ3RhYmxlX3MxKGNm
ZywgY29va2llKTsKPj4gICAgICAgICAgaWYgKGlvcCkgewo+PiAgICAgICAgICAgICAgICAgIHU2
NCBtYWlyLCB0dGJyOwo+PiArICAgICAgICAgICAgICAgc3RydWN0IGFybV9scGFlX2lvX3BndGFi
bGUgKmRhdGEgPSBpb19wZ3RhYmxlX29wc190b19kYXRhKCZpb3AtPm9wcyk7Cj4+Cj4+ICsgICAg
ICAgICAgICAgICBkYXRhLT5sZXZlbHMgPSA0Owo+PiAgICAgICAgICAgICAgICAgIC8qIENvcHkg
dmFsdWVzIGFzIHVuaW9uIGZpZWxkcyBvdmVybGFwICovCj4+ICAgICAgICAgICAgICAgICAgbWFp
ciA9IGNmZy0+YXJtX2xwYWVfczFfY2ZnLm1haXJbMF07Cj4+ICAgICAgICAgICAgICAgICAgdHRi
ciA9IGNmZy0+YXJtX2xwYWVfczFfY2ZnLnR0YnJbMF07Cj4+Cj4+IF9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
Pj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+PiBodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbApfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
