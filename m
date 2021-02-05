Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E97353106C7
	for <lists+dri-devel@lfdr.de>; Fri,  5 Feb 2021 09:33:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8D6F6F3A0;
	Fri,  5 Feb 2021 08:33:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80F266E198
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Feb 2021 06:43:41 +0000 (UTC)
Received: from submission (posteo.de [89.146.220.130]) 
 by mout02.posteo.de (Postfix) with ESMTPS id 29D482400FD
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Feb 2021 07:43:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
 t=1612507419; bh=8zUn+UyozeAseEbIW29rRlgrAkKAcwU7JN9yB32OBVU=;
 h=Date:From:To:Cc:Subject:From;
 b=nxK5M0KsURI7H8q7N/u7Z5J40DfSmNln6h/rtHagaUbtb/h3fDvIEHpOyKDQ6Ppxk
 5BCcMFNUpaQMZx71PIv3eSlcHr1Hsd9NeFXGkWZg5jI5slYy+6wwBwWT2avZql8Wtv
 aI+Iw0bjBgv5HPfxjAN5gKAza50eCOCktUh1hBUGp4+Aq20GcBqezetx2gQdvVvUwb
 X8pm0B43c1TcA+tFJ5R7esBcFOz44IqE0fTqopArBLgvW3PWsBdtPtw45KPjyYQreA
 TA0+TOUFYljkM6ZkAqwVbLku1/ZS9wu4PZur0lWUuHw0SQlKciR2J/hbKY/A4ca4/2
 WMZpdjYeFI1AA==
Received: from customer (localhost [127.0.0.1])
 by submission (posteo.de) with ESMTPSA id 4DX5V03kQNz6tmM;
 Fri,  5 Feb 2021 07:43:36 +0100 (CET)
Date: Fri, 5 Feb 2021 07:43:35 +0100
From: Sebastian Fricke <sebastian.fricke@posteo.net>
To: Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>
Subject: Re: [PATCH 0/6] Support second Image Signal Processor on rk3399
Message-ID: <20210205064335.6c3gs3h3pgvhceku@basti-TUXEDO-Book-XA1510>
References: <20210202145632.1263136-1-heiko@sntech.de>
 <20210203181422.txbd6kvujlmz4nju@basti-TUXEDO-Book-XA1510>
 <16624224.lhrHg4fidi@diego>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <16624224.lhrHg4fidi@diego>
X-Mailman-Approved-At: Fri, 05 Feb 2021 08:33:33 +0000
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
Cc: devicetree@vger.kernel.org, dafna.hirschfeld@collabora.com,
 cmuellner@linux.com, hjc@rock-chips.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 helen.koike@collabora.com, robh+dt@kernel.org, ezequiel@collabora.com,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGV5IEhlaWtvLAoKT24gMDMuMDIuMjAyMSAyMDo1NCwgSGVpa28gU3TDvGJuZXIgd3JvdGU6Cj5I
aSBTZWJhc3RpYW4sCj4KPkFtIE1pdHR3b2NoLCAzLiBGZWJydWFyIDIwMjEsIDE5OjE0OjIyIENF
VCBzY2hyaWViIFNlYmFzdGlhbiBGcmlja2U6Cj4+IEhleSBIZWlrbywKPj4KPj4gSSBoYXZlIHRl
c3RlZCB5b3VyIHBhdGNoIHNldCBvbiBteSBuYW5vUEMtVDQsIGhlcmUgaXMgYSBjb21wbGV0ZSBs
b2cKPj4gd2l0aDoKPj4gLSByZWxldmFudCBrZXJuZWwgbG9nIGVudHJpZXMKPj4gLSBzeXN0ZW0g
aW5mb3JtYXRpb24KPj4gLSBtZWRpYSBjdGwgb3V0cHV0Cj4+IC0gc3lzZnMgZW50cnkgaW5mb3Jt
YXRpb24KPj4KPj4gaHR0cHM6Ly9wYXN0ZS5kZWJpYW4ubmV0LzExODM4NzQvCj4+Cj4+IEFkZGl0
aW9uYWxseSwgdG8geW91ciBwYXRjaHNldCBJIGhhdmUgYXBwbGllZCB0aGUgZm9sbG93aW5nIHBh
dGNoZXM6Cj4+IGh0dHBzOi8vZ2l0aHViLmNvbS9pbml0QmFzdGkvTGludXhfa2VybmVsX21lZGlh
X3RyZWVfZm9yay9jb21taXRzL2R1YWxfY2FtX3NldHVwCj4+Cj4+IEFuZCBqdXN0IHRvIG5vdCBj
YXVzZSBjb25mdXNpb24gdGhlIGBtZWRpYV9kZXZgIGVudHJpZXMgY29tZSBmcm9tIHRoaXMKPj4g
dW5tZXJnZWQgc2VyaWVzOgo+PiBodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3Qv
bGludXgtbWVkaWEvbGlzdC8/c2VyaWVzPTQyNjI2OQo+Pgo+PiBJIGhhdmUgYWN0dWFsbHkgYmVl
biBhYmxlIHRvIHN0cmVhbSB3aXRoIGJvdGggb2YgbXkgY2FtZXJhcyBhdCB0aGUgc2FtZQo+PiB0
aW1lIHVzaW5nIHRoZSBsaWJjYW1lcmEgY2FtIGNvbW1hbmQuCj4+IEkgd291bGQgbGlrZSB0byB0
aGFuayB5b3UgYSBsb3QgZm9yIG1ha2luZyB0aGlzIHBvc3NpYmxlLgo+Cj5UaGFua3MgZm9yIHRl
c3RpbmcgYSBkdWFsIGNhbWVyYSBzZXR1cC4gT24gbXkgYm9hcmQgSSBjb3VsZCBvbmx5IHRlc3QK
PnRoZSBzZWNvbmQgSVNQLiBBbmQgcmVhbGx5IGdsYWQgaXQgd29ya3MgZm9yIHlvdSB0b29sIDot
KSAuCj4KPk91dCBvZiBjdXJpb3NpdHksIGRvIHlvdSBhbHNvIHNlZSB0aGF0IGdyZWVuIHRpbnQg
aW4gdGhlIGltYWdlcyB0aGUgY2FtZXJhcwo+cHJvZHVjZT8KClllcywgSSBkby4gQWN0dWFsbHks
IEkgY3VycmVudGx5IGhhdmUgdHdvIGZvcm1zIG9mIGEgZ3JlZW4gdGludCwgb24gbXkKT1YxMzg1
MCBldmVyeXRoaW5nIGlzIHF1aXRlIGRhcmsgYW5kIGdyZWVuaXNoLCB3aGljaCBpcyBjYXVzZWQg
YnkgdGhlCm1pc3NpbmcgM0EgYWxnb3JpdGhtcy4gT24gbXkgT1Y0Njg5LCBJIGhhdmUgYmlnIHBh
dGNoZXMgb2YgdGhlIGltYWdlCndpdGggYnJpZ2h0IGdyZWVuIGNvbG9yIGFuZCBmbGlja2VyaW5n
LCBJIGludmVzdGlnYXRlZCBpZiB0aGlzIGlzCmNvbm5lY3RlZCB0byB0aGUgMm5kIElTUCBpbnN0
YW5jZSwgYnV0IHRoYXQgZG9lc24ndCBzZWVtIHRvIGJlIHRoZSBjYXNlCmFzIEkgaGF2ZSB0aGUg
c2FtZSByZXN1bHRzIHdoZW4gSSBzd2l0Y2ggdGhlIENTSSBwb3J0cyBvZiB0aGUgY2FtZXJhcy4K
CkkgaGF2ZSBmb3VuZCBhbm90aGVyIGlzc3VlLCB3aGlsZSB0ZXN0aW5nIEkgZGlzY292ZXJlZCBm
b2xsb3dpbmcKaXNzdWU6CldoZW4gSSBzdGFydCB0aGUgc3lzdGVtIHdpdGggYW4gSERNSSBtb25p
dG9yIGNvbm5lY3RlZCwgdGhlbiB0aGUgY2FtZXJhCm9uIHRoZSAybmQgcG9ydCBkb2Vzbid0IHdv
cmsuIFRoaXMgaXMgcHJvYmFibHkgYmVjYXVzZSB0aGUgUlgvVFggaXMKcmVzZXJ2ZWQgYXMgYSBU
WC4KQnV0IGl0IG1hZGUgbWUgd29uZGVyIGJlY2F1c2UgaWYgdGhlIHN5c3RlbSBoYXMgYW4gUlgs
IGEgVFgsIGFuZAphbiBSWC9UWCwgd2h5IGlzbid0IHRoZSBwdXJlIFRYIHVzZWQgYnkgdGhlIG1v
bml0b3IgYW5kIHRoZQpjYW1lcmFzIHRha2UgUlggYW5kIFJYL1RYPwpPciBkbyB5b3UgdGhpbmsg
dGhhdCB0aGlzIGlzIG1heWJlIGEgbWFsZnVuY3Rpb24gb2YgdGhpcyBwYXRjaD8KCj4KPlRoYW5r
cwo+SGVpa28KCkdyZWV0aW5ncywKU2ViYXN0aWFuCgo+Cj4KPj4gSWYgeW91IGxpa2UgdG8geW91
IGNhbiBhZGQ6Cj4+IFRlc3RlZC1ieTogU2ViYXN0aWFuIEZyaWNrZSA8c2ViYXN0aWFuLmZyaWNr
ZUBwb3N0ZW8ubmV0Pgo+Pgo+PiBPbiAwMi4wMi4yMDIxIDE1OjU2LCBIZWlrbyBTdHVlYm5lciB3
cm90ZToKPj4gPlRoZSByazMzOTkgaGFzIHR3byBJU1BzIGFuZCByaWdodCBub3cgb25seSB0aGUg
Zmlyc3Qgb25lIGlzIHVzYWJsZS4KPj4gPlRoZSBzZWNvbmQgSVNQIGlzIGNvbm5lY3RlZCB0byB0
aGUgVFhSWCBkcGh5IG9uIHRoZSBzb2MuCj4+ID4KPj4gPlRoZSBwaHkgb2YgSVNQMSBpcyBvbmx5
IGFjY2Vzc2libGUgdGhyb3VnaCB0aGUgRFNJIGNvbnRyb2xsZXIncwo+PiA+aW8tbWVtb3J5LCBz
byB0aGlzIHNlcmllcyBhZGRzIHN1cHBvcnQgZm9yIHNpbXBseSB1c2luZyB0aGUgZHNpCj4+ID5j
b250cm9sbGVyIGlzIGEgcGh5IGlmIG5lZWRlZC4KPj4gPgo+PiA+VGhhdCBzb2x1dGlvbiBpcyBu
ZWVkZWQgYXQgbGVhc3Qgb24gcmszMzk5IGFuZCByazMyODggYnV0IG5vLW9uZQo+PiA+aGFzIGxv
b2tlZCBhdCBjYW1lcmEgc3VwcG9ydCBvbiByazMyODggYXQgYWxsLCBzbyByaWdodCBub3cKPj4g
Pm9ubHkgaW1wbGVtZW50IHRoZSByazMzOTkgc3BlY2lmaWNzLgo+PiA+Cj4+ID4KPj4gPkhlaWtv
IFN0dWVibmVyICg2KToKPj4gPiAgZHJtL3JvY2tjaGlwOiBkc2k6IGFkZCBvd24gYWRkaXRpb25h
bCBwY2xrIGhhbmRsaW5nCj4+ID4gIGR0LWJpbmRpbmdzOiBkaXNwbGF5OiByb2NrY2hpcC1kc2k6
IGFkZCBvcHRpb25hbCAjcGh5LWNlbGxzIHByb3BlcnR5Cj4+ID4gIGRybS9yb2NrY2hpcDogZHNp
OiBhZGQgYWJpbGl0eSB0byB3b3JrIGFzIGEgcGh5IGluc3RlYWQgb2YgZnVsbCBkc2kKPj4gPiAg
YXJtNjQ6IGR0czogcm9ja2NoaXA6IGFkZCAjcGh5LWNlbGxzIHRvIG1pcGktZHNpMQo+PiA+ICBh
cm02NDogZHRzOiByb2NrY2hpcDogYWRkIGNpZiBjbGstY29udHJvbCBwaW5jdHJsIGZvciByazMz
OTkKPj4gPiAgYXJtNjQ6IGR0czogcm9ja2NoaXA6IGFkZCBpc3AxIG5vZGUgb24gcmszMzk5Cj4+
ID4KPj4gPiAuLi4vZGlzcGxheS9yb2NrY2hpcC9kd19taXBpX2RzaV9yb2NrY2hpcC50eHQgfCAg
IDEgKwo+PiA+IGFyY2gvYXJtNjQvYm9vdC9kdHMvcm9ja2NoaXAvcmszMzk5LmR0c2kgICAgICB8
ICAzOSArKwo+PiA+IGRyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9LY29uZmlnICAgICAgICAgICAg
ICB8ICAgMiArCj4+ID4gLi4uL2dwdS9kcm0vcm9ja2NoaXAvZHctbWlwaS1kc2ktcm9ja2NoaXAu
YyAgIHwgMzQyICsrKysrKysrKysrKysrKysrKwo+PiA+IDQgZmlsZXMgY2hhbmdlZCwgMzg0IGlu
c2VydGlvbnMoKykKPj4gPgo+Pgo+Cj4KPgo+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbAo=
