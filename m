Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 569501B1F07
	for <lists+dri-devel@lfdr.de>; Tue, 21 Apr 2020 08:49:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD5886E893;
	Tue, 21 Apr 2020 06:48:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F22089EB4
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Apr 2020 08:22:19 +0000 (UTC)
Received: from ip5f5af183.dynamic.kabel-deutschland.de ([95.90.241.131]
 helo=wittgenstein) by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <christian.brauner@ubuntu.com>)
 id 1jQRgv-0004mr-1c; Mon, 20 Apr 2020 08:22:09 +0000
Date: Mon, 20 Apr 2020 10:22:07 +0200
From: Christian Brauner <christian.brauner@ubuntu.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] staging: android: ion: Skip sync if not mapped
Message-ID: <20200420082207.ui7iyg7dsnred2vv@wittgenstein>
References: <20200414134629.54567-1-orjan.eide@arm.com>
 <20200414141849.55654-1-orjan.eide@arm.com>
 <20200414142810.GA958163@kroah.com>
 <CALAqxLX-SUhHPH6ewt-s9cEMc8DtMTgXem=JruAkLofuJf1syg@mail.gmail.com>
 <20200416102508.GA820251@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200416102508.GA820251@kroah.com>
X-Mailman-Approved-At: Tue, 21 Apr 2020 06:48:39 +0000
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
Cc: driverdevel <devel@driverdev.osuosl.org>, nd <nd@arm.com>,
 Todd Kjos <tkjos@android.com>, Lecopzer Chen <lecopzer.chen@mediatek.com>,
 Arnd Bergmann <arnd@arndb.de>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 lkml <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Arve =?utf-8?B?SGrDuG5uZXbDpWc=?= <arve@android.com>,
 Anders Pedersen <anders.pedersen@arm.com>,
 Joel Fernandes <joel@joelfernandes.org>,
 "Darren Hart \(VMware\)" <dvhart@infradead.org>,
 =?utf-8?B?w5hyamFu?= Eide <orjan.eide@arm.com>,
 Laura Abbott <labbott@redhat.com>, Martijn Coenen <maco@android.com>,
 Christian Brauner <christian@brauner.io>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBBcHIgMTYsIDIwMjAgYXQgMTI6MjU6MDhQTSArMDIwMCwgR3JlZyBLcm9haC1IYXJ0
bWFuIHdyb3RlOgo+IE9uIFR1ZSwgQXByIDE0LCAyMDIwIGF0IDA5OjQxOjMxUE0gLTA3MDAsIEpv
aG4gU3R1bHR6IHdyb3RlOgo+ID4gT24gVHVlLCBBcHIgMTQsIDIwMjAgYXQgNzoyOCBBTSBHcmVn
IEtyb2FoLUhhcnRtYW4KPiA+IDxncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZz4gd3JvdGU6Cj4g
PiA+Cj4gPiA+IE9uIFR1ZSwgQXByIDE0LCAyMDIwIGF0IDA0OjE4OjQ3UE0gKzAyMDAsIMOYcmph
biBFaWRlIHdyb3RlOgo+ID4gPiA+IE9ubHkgc3luYyB0aGUgc2ctbGlzdCBvZiBhbiBJb24gZG1h
LWJ1ZiBhdHRhY2htZW50IHdoZW4gdGhlIGF0dGFjaG1lbnQKPiA+ID4gPiBpcyBhY3R1YWxseSBt
YXBwZWQgb24gdGhlIGRldmljZS4KPiA+ID4gPgo+ID4gPiA+IGRtYS1idWZzIG1heSBiZSBzeW5j
ZWQgYXQgYW55IHRpbWUuIEl0IGNhbiBiZSByZWFjaGVkIGZyb20gdXNlciBzcGFjZQo+ID4gPiA+
IHZpYSBETUFfQlVGX0lPQ1RMX1NZTkMsIHNvIHRoZXJlIGFyZSBubyBndWFyYW50ZWVzIGZyb20g
Y2FsbGVycyBvbiB3aGVuCj4gPiA+ID4gc3luY3MgbWF5IGJlIGF0dGVtcHRlZCwgYW5kIGRtYV9i
dWZfZW5kX2NwdV9hY2Nlc3MoKSBhbmQKPiA+ID4gPiBkbWFfYnVmX2JlZ2luX2NwdV9hY2Nlc3Mo
KSBtYXkgbm90IGJlIHBhaXJlZC4KPiA+ID4gPgo+ID4gPiA+IFNpbmNlIHRoZSBzZ19saXN0J3Mg
ZG1hX2FkZHJlc3MgaXNuJ3Qgc2V0IHVwIHVudGlsIHRoZSBidWZmZXIgaXMgdXNlZAo+ID4gPiA+
IG9uIHRoZSBkZXZpY2UsIGFuZCBkbWFfbWFwX3NnKCkgaXMgY2FsbGVkIG9uIGl0LCB0aGUgZG1h
X2FkZHJlc3Mgd2lsbCBiZQo+ID4gPiA+IE5VTEwgaWYgc3luYyBpcyBhdHRlbXB0ZWQgb24gdGhl
IGRtYS1idWYgYmVmb3JlIGl0J3MgbWFwcGVkIG9uIGEgZGV2aWNlLgo+ID4gPiA+Cj4gPiA+ID4g
QmVmb3JlIHY1LjAgKGNvbW1pdCA1NTg5N2FmNjMwOTEgKCJkbWEtZGlyZWN0OiBtZXJnZSBzd2lv
dGxiX2RtYV9vcHMKPiA+ID4gPiBpbnRvIHRoZSBkbWFfZGlyZWN0IGNvZGUiKSkgdGhpcyB3YXMg
YSBwcm9ibGVtIGFzIHRoZSBkbWEtYXBpIChhdCBsZWFzdAo+ID4gPiA+IHRoZSBzd2lvdGxiX2Rt
YV9vcHMgb24gYXJtNjQpIHdvdWxkIHVzZSB0aGUgcG90ZW50aWFsbHkgaW52YWxpZAo+ID4gPiA+
IGRtYV9hZGRyZXNzLiBIb3cgdGhhdCBmYWlsZWQgZGVwZW5kZWQgb24gaG93IHRoZSBkZXZpY2Ug
aGFuZGxlZCBwaHlzaWNhbAo+ID4gPiA+IGFkZHJlc3MgMC4gSWYgMCB3YXMgYSB2YWxpZCBhZGRy
ZXNzIHRvIHBoeXNpY2FsIHJhbSwgdGhhdCBwYWdlIHdvdWxkIGdldAo+ID4gPiA+IGZsdXNoZWQg
YSBsb3QsIHdoaWxlIHRoZSBhY3R1YWwgcGFnZXMgaW4gdGhlIGJ1ZmZlciB3b3VsZCBub3QgZ2V0
IHN5bmNlZAo+ID4gPiA+IGNvcnJlY3RseS4gV2hpbGUgaWYgMCBpcyBhbiBpbnZhbGlkIHBoeXNp
Y2FsIGFkZHJlc3MgaXQgbWF5IGNhdXNlIGEKPiA+ID4gPiBmYXVsdCBhbmQgdHJpZ2dlciBhIGNy
YXNoLgo+ID4gPiA+Cj4gPiA+ID4gSW4gdjUuMCB0aGlzIHdhcyBpbmNpZGVudGFsbHkgZml4ZWQg
YnkgY29tbWl0IDU1ODk3YWY2MzA5MSAoImRtYS1kaXJlY3Q6Cj4gPiA+ID4gbWVyZ2Ugc3dpb3Rs
Yl9kbWFfb3BzIGludG8gdGhlIGRtYV9kaXJlY3QgY29kZSIpLCBhcyB0aGlzIG1vdmVkIHRoZQo+
ID4gPiA+IGRtYS1hcGkgdG8gdXNlIHRoZSBwYWdlIHBvaW50ZXIgaW4gdGhlIHNnX2xpc3QsIGFu
ZCAoZm9yIElvbiBidWZmZXJzIGF0Cj4gPiA+ID4gbGVhc3QpIHRoaXMgd2lsbCBhbHdheXMgYmUg
dmFsaWQgaWYgdGhlIHNnX2xpc3QgZXhpc3RzIGF0IGFsbC4KPiA+ID4gPgo+ID4gPiA+IEJ1dCwg
dGhpcyBpc3N1ZSBpcyByZS1pbnRyb2R1Y2VkIGluIHY1LjMgd2l0aAo+ID4gPiA+IGNvbW1pdCA0
NDlmYTU0ZDY4MTUgKCJkbWEtZGlyZWN0OiBjb3JyZWN0IHRoZSBwaHlzaWNhbCBhZGRyIGluCj4g
PiA+ID4gZG1hX2RpcmVjdF9zeW5jX3NnX2Zvcl9jcHUvZGV2aWNlIikgbW92ZXMgdGhlIGRtYS1h
cGkgYmFjayB0byB0aGUgb2xkCj4gPiA+ID4gYmVoYXZpb3VyIGFuZCBwaWNrcyB0aGUgZG1hX2Fk
ZHJlc3MgdGhhdCBtYXkgYmUgaW52YWxpZC4KPiA+ID4gPgo+ID4gPiA+IGRtYS1idWYgY29yZSBk
b2Vzbid0IGVuc3VyZSB0aGF0IHRoZSBidWZmZXIgaXMgbWFwcGVkIG9uIHRoZSBkZXZpY2UsIGFu
ZAo+ID4gPiA+IHRodXMgaGF2ZSBhIHZhbGlkIHNnX2xpc3QsIGJlZm9yZSBjYWxsaW5nIHRoZSBl
eHBvcnRlcidzCj4gPiA+ID4gYmVnaW5fY3B1X2FjY2Vzcy4KPiA+ID4gPgo+ID4gPiA+IFNpZ25l
ZC1vZmYtYnk6IMOYcmphbiBFaWRlIDxvcmphbi5laWRlQGFybS5jb20+Cj4gPiA+ID4gLS0tCj4g
PiA+ID4gIGRyaXZlcnMvc3RhZ2luZy9hbmRyb2lkL2lvbi9pb24uYyB8IDEyICsrKysrKysrKysr
Kwo+ID4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKQo+ID4gPiA+Cj4gPiA+
ID4gUmVzdWJtaXQgd2l0aG91dCBkaXNjbGFpbWVyLCBzb3JyeSBhYm91dCB0aGF0Lgo+ID4gPiA+
Cj4gPiA+ID4gVGhpcyBzZWVtcyB0byBiZSBwYXJ0IG9mIGEgYmlnZ2VyIGlzc3VlIHdoZXJlIGRt
YS1idWYgZXhwb3J0ZXJzIGFzc3VtZQo+ID4gPiA+IHRoYXQgdGhlaXIgZG1hLWJ1ZiBiZWdpbl9j
cHVfYWNjZXNzIGFuZCBlbmRfY3B1X2FjY2VzcyBjYWxsYmFja3MgaGF2ZSBhCj4gPiA+ID4gY2Vy
dGFpbiBndWFyYW50ZWVkIGJlaGF2aW9yLCB3aGljaCBpc24ndCBlbnN1cmVkIGJ5IGRtYS1idWYg
Y29yZS4KPiA+ID4gPgo+ID4gPiA+IFRoaXMgcGF0Y2ggZml4ZXMgdGhpcyBpbiBpb24gb25seSwg
YnV0IGl0IGFsc28gbmVlZHMgdG8gYmUgZml4ZWQgZm9yCj4gPiA+ID4gb3RoZXIgZXhwb3J0ZXJz
LCBlaXRoZXIgaGFuZGxlZCBsaWtlIHRoaXMgaW4gZWFjaCBleHBvcnRlciwgb3IgaW4KPiA+ID4g
PiBkbWEtYnVmIGNvcmUgYmVmb3JlIGNhbGxpbmcgaW50byB0aGUgZXhwb3J0ZXJzLgo+ID4gPiA+
Cj4gPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvc3RhZ2luZy9hbmRyb2lkL2lvbi9pb24uYyBi
L2RyaXZlcnMvc3RhZ2luZy9hbmRyb2lkL2lvbi9pb24uYwo+ID4gPiA+IGluZGV4IDM4YjUxZWFj
ZTRmOS4uN2I3NTJiYTBjYjZkIDEwMDY0NAo+ID4gPiA+IC0tLSBhL2RyaXZlcnMvc3RhZ2luZy9h
bmRyb2lkL2lvbi9pb24uYwo+ID4gPiA+ICsrKyBiL2RyaXZlcnMvc3RhZ2luZy9hbmRyb2lkL2lv
bi9pb24uYwo+ID4gPgo+ID4gPiBOb3cgdGhhdCB3ZSBoYXZlIHRoZSBkbWEtYnVmZiBzdHVmZiBp
biB0aGUgdHJlZSwgZG8gd2UgZXZlbiBuZWVkIHRoZQo+ID4gPiBpb24gY29kZSBpbiB0aGUga2Vy
bmVsIGFueW1vcmU/ICBDYW4ndCB3ZSBkZWxldGUgaXQgbm93Pwo+ID4gPgo+ID4gCj4gPiBJIGFn
cmVlIHRoYXQgd2Ugc2hvdWxkbid0IGJlIHRha2luZyBmdXJ0aGVyIChub24tc2VjdXJpdHkvY2xl
YW51cCkKPiA+IHBhdGNoZXMgdG8gdGhlIElPTiBjb2RlLgo+ID4gCj4gPiBJJ2QgbGlrZSB0byBn
aXZlIGRldmVsb3BlcnMgYSBsaXR0bGUgYml0IG9mIGEgdHJhbnNpdGlvbiBwZXJpb2QgKEkgd2Fz
Cj4gPiB0aGlua2luZyBhIHllYXIsIGJ1dCByZWFsbHkganVzdCBvbmUgTFRTIHJlbGVhc2UgdGhh
dCBoYXMgYm90aCB3b3VsZAo+ID4gZG8pIHdoZXJlIHRoZXkgY2FuIG1vdmUgdGhlaXIgSU9OIGhl
YXBzIG92ZXIgdG8gZG1hYnVmIGhlYXBzIGFuZCB0ZXN0Cj4gPiBib3RoIGFnYWluc3QgdGhlIHNh
bWUgdHJlZS4KPiA+IAo+ID4gQnV0IEkgZG8gdGhpbmsgd2UgY2FuIG1hcmsgaXQgYXMgZGVwcmVj
YXRlZCBhbmQgbGV0IGZvbGtzIGtub3cgdGhhdAo+ID4gYXJvdW5kIHRoZSBlbmQgb2YgdGhlIHll
YXIgaXQgd2lsbCBiZSBkZWxldGVkLgo+IAo+IE5vIG9uZSBldmVyIG5vdGljZXMgImRlcHJlY2lh
dGVkIiB0aGluZ3MsIHRoZXkgb25seSBub3RpY2UgaWYgdGhlIGNvZGUKPiBpcyBubyBsb25nZXIg
dGhlcmUgOikKPiAKPiBTbyBJJ20gYWxsIGZvciBqdXN0IGRlbGV0aW5nIGl0IGFuZCBzZWVpbmcg
d2hvIGV2ZW4gbm90aWNlcy4uLgoKQWdyZWVkLgpBY2tlZC1ieTogQ2hyaXN0aWFuIEJyYXVuZXIg
PGNocmlzdGlhbi5icmF1bmVyQHVidW50dS5jb20+Cl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbAo=
