Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FFE18EDEE
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2019 16:15:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED7D56E402;
	Thu, 15 Aug 2019 14:15:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
 [209.85.167.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D1926E402
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2019 14:15:28 +0000 (UTC)
Received: by mail-oi1-f196.google.com with SMTP id h21so2122285oie.7
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2019 07:15:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=b9jb062JktpIPx3XCuJv3YXZ+jyDnT3aSJG503OYARU=;
 b=WaNoYipm5L36TXsGLKxyy+4bX9tOg9qvjKZ94GmlJ+ATwDRyp1aax7mSZgF6Fgdk3O
 zVXhjArv/plr0c3j6YOEs9tv748LXkvJw/jjLUFcl/J36O4JfGrvTaV63po1+QznEBuF
 7ov3MyPHRiAV1165mQvY/YLYqyoIDQXe0aWIltxbmorCJdtfFd0VMZs27HwzuNzdp+mU
 HKspdbCWp7PIbYnTdWBD3D/TG3tsOgnrQAN7uWxqNlzdeUwqyXnpTyIQZKisB4b0tR1t
 SKHfGudSQ3qdev9RpQ4oMR9PAoNBzICi6Kgn28rlBhTLTwd1hJ73NlFv6ozewTXkJtGt
 l0fw==
X-Gm-Message-State: APjAAAX6Moa8Dl5R+NNb8TdBNf+kia8CSxb+gPBXOR/qzu/ZLqml8VNV
 GUlC2jDA8pBtb5/aqr3+uGjAvVj6b0omK3C5EEm6Tg==
X-Google-Smtp-Source: APXvYqxpnadQ2kgqSZUiV7ajsvFWIFx/uIZmcJ+cCemlrXrZgp22YXUqzkttXhECALkTzksoff48J80wrn/BFUt2Yt8=
X-Received: by 2002:a02:69d1:: with SMTP id e200mr5260698jac.138.1565878527612; 
 Thu, 15 Aug 2019 07:15:27 -0700 (PDT)
MIME-Version: 1.0
References: <20190814213118.28473-1-kherbst@redhat.com>
 <20190814213118.28473-2-kherbst@redhat.com>
 <CAPM=9ty7yEUqKrcixV1tTuWCpyh6UikA3rxX8BF1E3fDb6WLQQ@mail.gmail.com>
 <5e05532328324d01bc554c573f6298f8@AUSX13MPC101.AMER.DELL.COM>
 <CACO55tsDA1WpMGtAPqUJpWt0AmPDnv9LuC09g2KB5GXB-VSCew@mail.gmail.com>
 <CADnq5_NUox3vvg6Mt3i9erA+AL2MfotpNBZQnWWknn4j+j-F=Q@mail.gmail.com>
In-Reply-To: <CADnq5_NUox3vvg6Mt3i9erA+AL2MfotpNBZQnWWknn4j+j-F=Q@mail.gmail.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Thu, 15 Aug 2019 16:15:16 +0200
Message-ID: <CACO55tty6TqEo4UBkX5YckLuP-XhHXKVs0ew+Q8__sKMi1BCbA@mail.gmail.com>
Subject: Re: [Nouveau] [PATCH 1/7] Revert "ACPI / OSI: Add OEM _OSI string to
 enable dGPU direct output"
To: Alex Deucher <alexdeucher@gmail.com>
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
Cc: Mario.Limonciello@dell.com, nouveau <nouveau@lists.freedesktop.org>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux ACPI Mailing List <linux-acpi@vger.kernel.org>,
 Alex Hung <alex.hung@canonical.com>, Ben Skeggs <bskeggs@redhat.com>,
 David Airlie <airlied@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBBdWcgMTUsIDIwMTkgYXQgNDoxMyBQTSBBbGV4IERldWNoZXIgPGFsZXhkZXVjaGVy
QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBPbiBUaHUsIEF1ZyAxNSwgMjAxOSBhdCAxMDowNCBBTSBL
YXJvbCBIZXJic3QgPGtoZXJic3RAcmVkaGF0LmNvbT4gd3JvdGU6Cj4gPgo+ID4gT24gVGh1LCBB
dWcgMTUsIDIwMTkgYXQgMzo1NiBQTSA8TWFyaW8uTGltb25jaWVsbG9AZGVsbC5jb20+IHdyb3Rl
Ogo+ID4gPgo+ID4gPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4gPiA+ID4gRnJvbTog
bGludXgtYWNwaS1vd25lckB2Z2VyLmtlcm5lbC5vcmcgPGxpbnV4LWFjcGktb3duZXJAdmdlci5r
ZXJuZWwub3JnPiBPbgo+ID4gPiA+IEJlaGFsZiBPZiBEYXZlIEFpcmxpZQo+ID4gPiA+IFNlbnQ6
IFdlZG5lc2RheSwgQXVndXN0IDE0LCAyMDE5IDU6NDggUE0KPiA+ID4gPiBUbzogS2Fyb2wgSGVy
YnN0Cj4gPiA+ID4gQ2M6IExLTUw7IExpbnV4IEFDUEk7IGRyaS1kZXZlbDsgbm91dmVhdTsgUmFm
YWVsIEogLiBXeXNvY2tpOyBBbGV4IEh1bmc7IEJlbgo+ID4gPiA+IFNrZWdnczsgRGF2ZSBBaXJs
aWUKPiA+ID4gPiBTdWJqZWN0OiBSZTogW05vdXZlYXVdIFtQQVRDSCAxLzddIFJldmVydCAiQUNQ
SSAvIE9TSTogQWRkIE9FTSBfT1NJIHN0cmluZyB0bwo+ID4gPiA+IGVuYWJsZSBkR1BVIGRpcmVj
dCBvdXRwdXQiCj4gPiA+ID4KPiA+ID4gPiBPbiBUaHUsIDE1IEF1ZyAyMDE5IGF0IDA3OjMxLCBL
YXJvbCBIZXJic3QgPGtoZXJic3RAcmVkaGF0LmNvbT4gd3JvdGU6Cj4gPiA+ID4gPgo+ID4gPiA+
ID4gVGhpcyByZXZlcnRzIGNvbW1pdCAyODU4NmE1MWVlYTY2NmQ1NTMxYmNhZWYyZjY4ZTRhYmJk
ODcyNDJjLgo+ID4gPiA+ID4KPiA+ID4gPiA+IFRoZSBvcmlnaW5hbCBjb21taXQgbWVzc2FnZSBk
aWRuJ3QgZXZlbiBtYWtlIHNlbnNlLiBBTUQgX2RvZXNfIHN1cHBvcnQgaXQgYW5kCj4gPiA+ID4g
PiBpdCB3b3JrcyB3aXRoIE5vdXZlYXUgYXMgd2VsbC4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBBbHNv
IHdoYXQgd2FzIHRoZSBpc3N1ZSBiZWluZyBzb2x2ZWQgaGVyZT8gTm8gcmVmZXJlbmNlcyB0byBh
bnkgYnVncyBhbmQgbm90Cj4gPiA+ID4gPiBldmVuIGV4cGxhaW5pbmcgYW55IGlzc3VlIGF0IGFs
bCBpc24ndCB0aGUgd2F5IHdlIGRvIHRoaW5ncy4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBBbmQgZXZl
biBpZiBpdCBtZWFucyBhIG11eGVkIGRlc2lnbiwgdGhlbiB0aGUgZml4IGlzIHRvIG1ha2UgaXQg
d29yayBpbnNpZGUgdGhlCj4gPiA+ID4gPiBkcml2ZXIsIG5vdCBhZGRpbmcgc29tZSBoYWNreSB3
b3JrYXJvdW5kIHRocm91Z2ggQUNQSSB0cmlja3MuCj4gPiA+ID4gPgo+ID4gPiA+ID4gQW5kIHdo
YXQgb3V0IG9mIHRyZWUgZHJpdmVycyBkbyBvciBkbyBub3Qgc3VwcG9ydCB3ZSBkb24ndCBjYXJl
IG9uZSBiaXQgYW55d2F5Lgo+ID4gPiA+ID4KPiA+ID4gPgo+ID4gPiA+IEkgdGhpbmsgdGhlIHJl
dmVydHMgc2hvdWxkIGJlIG1lcmdlZCB2aWEgUmFmYWVsJ3MgdHJlZSBhcyB0aGUgb3JpZ2luYWwK
PiA+ID4gPiBwYXRjaGVzIHdlbnQgaW4gdmlhIHRoZXJlLCBhbmQgd2Ugc2hvdWxkIGdldCB0aGVt
IGluIGFzYXAuCj4gPiA+ID4KPiA+ID4gPiBBY2tlZC1ieTogRGF2ZSBBaXJsaWUgPGFpcmxpZWRA
cmVkaGF0LmNvbT4KPiA+ID4gPiBEYXZlLgo+ID4gPgo+ID4gPiBUaGVyZSBhcmUgZGVmaW5pdGVs
eSBnb2luZyB0byBiZSByZWdyZXNzaW9ucyBvbiBtYWNoaW5lcyBpbiB0aGUgZmllbGQgd2l0aCB0
aGUKPiA+ID4gaW4gdHJlZSBkcml2ZXJzIGJ5IHJldmVydGluZyB0aGlzLiAgSSB0aGluayB3ZSBz
aG91bGQgaGF2ZSBhbiBhbnN3ZXIgZm9yIGFsbCBvZiB0aG9zZQo+ID4gPiBiZWZvcmUgdGhpcyBy
ZXZlcnQgaXMgYWNjZXB0ZWQuCj4gPiA+Cj4gPiA+IFJlZ2FyZGluZyBzeXN0ZW1zIHdpdGggSW50
ZWwrTlZJRElBLCB3ZSdsbCBoYXZlIHRvIHdvcmsgd2l0aCBwYXJ0bmVycyB0byBjb2xsZWN0Cj4g
PiA+IHNvbWUgaW5mb3JtYXRpb24gb24gdGhlIGltcGFjdCBvZiByZXZlcnRpbmcgdGhpcy4KPiA+
ID4KPiA+ID4gV2hlbiB0aGlzIGlzIHVzZWQgb24gYSBzeXN0ZW0gd2l0aCBJbnRlbCtBTUQgdGhl
IEFTTCBjb25maWd1cmVzIEFNRCBHUFUgdG8gdXNlCj4gPiA+ICJIeWJyaWQgR3JhcGhpY3MiIHdo
ZW4gb24gV2luZG93cyBhbmQgIlBvd2VyIEV4cHJlc3MiIGFuZCAiU3dpdGNoYWJsZSBHcmFwaGlj
cyIKPiA+ID4gd2hlbiBvbiBMaW51eC4KPiA+Cj4gPiBhbmQgd2hhdCdzIGV4YWN0bHkgdGhlIGRp
ZmZlcmVuY2UgYmV0d2VlbiB0aG9zZT8gQW5kIHdoYXQncyB0aGUgYWN0dWFsCj4gPiBpc3N1ZSBo
ZXJlPwo+Cj4gSHlicmlkIEdyYXBoaWNzIGlzIHRoZSBuZXcgInN0YW5kYXJkIiB3YXkgb2YgaGFu
ZGxpbmcgdGhlc2UgbGFwdG9wcy4KPiBJdCB1c2VzIHRoZSBzdGFuZGFyZCBfUFIzIEFQQ0kgbWV0
aG9kIHRvIGhhbmRsZSBkR1BVIHBvd2VyLiAgU3VwcG9ydAo+IGZvciB0aGlzIHdhcyBhZGRlZCB0
byBMaW51eCByZWxhdGl2ZWx5IGxhdGVyIGNvbXBhcmVkIHRvIHdoZW4gdGhlCj4gbGFwdG9wcyB3
ZXJlIGxhdW5jaGVkLiAgIlBvd2VyIEV4cHJlc3MiIHVzZWQgdGhlIG90aGVyIEFNRCBzcGVjaWZp
Ywo+IEFUUFggQUNQSSBtZXRob2QgdG8gaGFuZGxlIGRHUFUgcG93ZXIuICBUaGUgZHJpdmVyIHN1
cHBvcnRzIGJvdGggc28KPiBlaXRoZXIgbWV0aG9kIHdpbGwgd29yay4KPgo+IEFsZXgKPgoKdGhh
bmtzIGZvciBjbGFyaWZ5aW5nLiBCdXQgdGhhdCBzdGlsbCBtZWFucyB0aGF0IHdlIHdvbid0IG5l
ZWQgc3VjaAp3b3JrYXJvdW5kcyBmb3IgQU1EIHVzZXJzLCByaWdodD8gYW1kZ3B1IGhhbmRsZXMg
aHlicmlkIGdyYXBoaWNzIGp1c3QKZmluZSwgcmlnaHQ/Cgo+ID4KPiA+IFdlIGFscmVhZHkgaGF2
ZSB0aGUgUFJJTUUgb2ZmbG9hZGluZyBpbiBwbGFjZSBhbmQgaWYgdGhhdCdzIG5vdAo+ID4gZW5v
dWdoLCB3ZSBzaG91bGQgd29yayBvbiBleHRlbmRpbmcgaXQsIG5vdCBhZGRpbmcgc29tZSBBQ1BJ
IGJhc2VkCj4gPiB3b3JrYXJvdW5kcywgYmVjYXVzZSB0aGF0J3MgZXhhY3RseSBob3cgdGhhdCBs
b29rcyBsaWtlLgo+ID4KPiA+IEFsc28sIHdhcyB0aGlzIGRpc2N1c3NlZCB3aXRoIGFueWJvZHkg
aW52b2x2ZWQgaW4gdGhlIGRybSBzdWJzeXN0ZW0/Cj4gPgo+ID4gPgo+ID4gPiBJIGZlZWwgd2Ug
bmVlZCBhIGtub2IgYW5kL29yIERNSSBkZXRlY3Rpb24gdG8gYWZmZWN0IHRoZSBjaGFuZ2VzIHRo
YXQgdGhlIEFTTAo+ID4gPiBub3JtYWxseSBwZXJmb3Jtcy4KPiA+Cj4gPiBXaHkgZG8gd2UgaGF2
ZSB0byBkbyB0aGF0IG9uIGEgZmlybXdhcmUgbGV2ZWwgYXQgYWxsPwo+ID4gX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiA+IGRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKPiA+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiA+IGh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
