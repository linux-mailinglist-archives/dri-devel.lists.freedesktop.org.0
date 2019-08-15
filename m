Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD52E8EE00
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2019 16:17:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 314BD6E416;
	Thu, 15 Aug 2019 14:17:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D38776E416;
 Thu, 15 Aug 2019 14:17:29 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id p17so2341250wrf.11;
 Thu, 15 Aug 2019 07:17:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hR2oVEeRE+U1aLSfdfNg62NTQOkO5YChFCkngTDgHeM=;
 b=NJUZ2uJgm9iDMR/WFY/WvxBiQx3jumKqGTqOn4eFA6WKDLVN9Glc03xMQeC0ZvWKhX
 hYc6nlUx9s7dxatGmDvLutmUnK9Lt+8sTf6/uvqXAK6+syXcBXaBu9svf9nX2wEg4gXU
 UJgzG8fvwX3HzexelJfAWXSTPGpMx5n/H/+9YpQytxwleX7eU02j71wYdENqueAwN5sM
 Dx5+NTjtt695TgGJPpqC8f57pb5bEpTrwYQCTYO1d9NOwxxGWTlFht92OCEDw09Ox4e6
 nUs0J7k33z+JXxSeXxaqzE6MpnIObUoggKUepEnlG9H0AXv2WflWb+q1Sj1DUYLp/2I6
 +3hA==
X-Gm-Message-State: APjAAAXM8RAOqu42w+rzSeXsUVb/DZaymyIWHGGtVnouDrTDruS1NeNm
 vKfUigntxGRwu/K2PNDk/XaLIsDmXYNITdPRjm0=
X-Google-Smtp-Source: APXvYqwgEG09J1je3EBh7rb1fgFE0/whIpdRqyy9bANab2t48jig1H2inCjfGhuD0Pl/LhVva2b5zoj8pJFrogTe+KU=
X-Received: by 2002:a5d:6b11:: with SMTP id v17mr5599295wrw.323.1565878648396; 
 Thu, 15 Aug 2019 07:17:28 -0700 (PDT)
MIME-Version: 1.0
References: <20190814213118.28473-1-kherbst@redhat.com>
 <20190814213118.28473-2-kherbst@redhat.com>
 <CAPM=9ty7yEUqKrcixV1tTuWCpyh6UikA3rxX8BF1E3fDb6WLQQ@mail.gmail.com>
 <5e05532328324d01bc554c573f6298f8@AUSX13MPC101.AMER.DELL.COM>
 <CACO55tsDA1WpMGtAPqUJpWt0AmPDnv9LuC09g2KB5GXB-VSCew@mail.gmail.com>
 <CADnq5_NUox3vvg6Mt3i9erA+AL2MfotpNBZQnWWknn4j+j-F=Q@mail.gmail.com>
 <CACO55tty6TqEo4UBkX5YckLuP-XhHXKVs0ew+Q8__sKMi1BCbA@mail.gmail.com>
In-Reply-To: <CACO55tty6TqEo4UBkX5YckLuP-XhHXKVs0ew+Q8__sKMi1BCbA@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 15 Aug 2019 10:17:17 -0400
Message-ID: <CADnq5_PWuLU0pcG549-xThMHy3W0P2+fAO_Ledk6FP2TVG3+gQ@mail.gmail.com>
Subject: Re: [Nouveau] [PATCH 1/7] Revert "ACPI / OSI: Add OEM _OSI string to
 enable dGPU direct output"
To: Karol Herbst <kherbst@redhat.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=hR2oVEeRE+U1aLSfdfNg62NTQOkO5YChFCkngTDgHeM=;
 b=nI/VjGd/mq6T+65tzQ7x4tkebtyS3PxvHyhLkdm2i/ZFYP1cgiJvNNMeJ0PPg29XJx
 HwKn5LxRP3UwZu2uWNNmU4CANGdJgMKClTQ5ribhEYvLVdihDi6sq0xDRBWdCNQRTE4H
 f1wIrktxqFPC+xvZsi0AxeLU5q1dfN2iKkKfzmOQWDTjVvqZemKATl3bLR6Hu9WcS7yD
 1248flZzbmcN9exUx1bE1g/Kvcu6z6qJ9cjFx4/IsiMEJVdNPITcbw6946P18Vu6xmAB
 7WJJZ2VyaxQmhLmTLbys+3T6/cfw0yrGX3zHPGBbiDKWUeqbdomaIHmDnFTVxTup1EDQ
 CHiw==
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

T24gVGh1LCBBdWcgMTUsIDIwMTkgYXQgMTA6MTUgQU0gS2Fyb2wgSGVyYnN0IDxraGVyYnN0QHJl
ZGhhdC5jb20+IHdyb3RlOgo+Cj4gT24gVGh1LCBBdWcgMTUsIDIwMTkgYXQgNDoxMyBQTSBBbGV4
IERldWNoZXIgPGFsZXhkZXVjaGVyQGdtYWlsLmNvbT4gd3JvdGU6Cj4gPgo+ID4gT24gVGh1LCBB
dWcgMTUsIDIwMTkgYXQgMTA6MDQgQU0gS2Fyb2wgSGVyYnN0IDxraGVyYnN0QHJlZGhhdC5jb20+
IHdyb3RlOgo+ID4gPgo+ID4gPiBPbiBUaHUsIEF1ZyAxNSwgMjAxOSBhdCAzOjU2IFBNIDxNYXJp
by5MaW1vbmNpZWxsb0BkZWxsLmNvbT4gd3JvdGU6Cj4gPiA+ID4KPiA+ID4gPiA+IC0tLS0tT3Jp
Z2luYWwgTWVzc2FnZS0tLS0tCj4gPiA+ID4gPiBGcm9tOiBsaW51eC1hY3BpLW93bmVyQHZnZXIu
a2VybmVsLm9yZyA8bGludXgtYWNwaS1vd25lckB2Z2VyLmtlcm5lbC5vcmc+IE9uCj4gPiA+ID4g
PiBCZWhhbGYgT2YgRGF2ZSBBaXJsaWUKPiA+ID4gPiA+IFNlbnQ6IFdlZG5lc2RheSwgQXVndXN0
IDE0LCAyMDE5IDU6NDggUE0KPiA+ID4gPiA+IFRvOiBLYXJvbCBIZXJic3QKPiA+ID4gPiA+IENj
OiBMS01MOyBMaW51eCBBQ1BJOyBkcmktZGV2ZWw7IG5vdXZlYXU7IFJhZmFlbCBKIC4gV3lzb2Nr
aTsgQWxleCBIdW5nOyBCZW4KPiA+ID4gPiA+IFNrZWdnczsgRGF2ZSBBaXJsaWUKPiA+ID4gPiA+
IFN1YmplY3Q6IFJlOiBbTm91dmVhdV0gW1BBVENIIDEvN10gUmV2ZXJ0ICJBQ1BJIC8gT1NJOiBB
ZGQgT0VNIF9PU0kgc3RyaW5nIHRvCj4gPiA+ID4gPiBlbmFibGUgZEdQVSBkaXJlY3Qgb3V0cHV0
Igo+ID4gPiA+ID4KPiA+ID4gPiA+IE9uIFRodSwgMTUgQXVnIDIwMTkgYXQgMDc6MzEsIEthcm9s
IEhlcmJzdCA8a2hlcmJzdEByZWRoYXQuY29tPiB3cm90ZToKPiA+ID4gPiA+ID4KPiA+ID4gPiA+
ID4gVGhpcyByZXZlcnRzIGNvbW1pdCAyODU4NmE1MWVlYTY2NmQ1NTMxYmNhZWYyZjY4ZTRhYmJk
ODcyNDJjLgo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBUaGUgb3JpZ2luYWwgY29tbWl0IG1lc3Nh
Z2UgZGlkbid0IGV2ZW4gbWFrZSBzZW5zZS4gQU1EIF9kb2VzXyBzdXBwb3J0IGl0IGFuZAo+ID4g
PiA+ID4gPiBpdCB3b3JrcyB3aXRoIE5vdXZlYXUgYXMgd2VsbC4KPiA+ID4gPiA+ID4KPiA+ID4g
PiA+ID4gQWxzbyB3aGF0IHdhcyB0aGUgaXNzdWUgYmVpbmcgc29sdmVkIGhlcmU/IE5vIHJlZmVy
ZW5jZXMgdG8gYW55IGJ1Z3MgYW5kIG5vdAo+ID4gPiA+ID4gPiBldmVuIGV4cGxhaW5pbmcgYW55
IGlzc3VlIGF0IGFsbCBpc24ndCB0aGUgd2F5IHdlIGRvIHRoaW5ncy4KPiA+ID4gPiA+ID4KPiA+
ID4gPiA+ID4gQW5kIGV2ZW4gaWYgaXQgbWVhbnMgYSBtdXhlZCBkZXNpZ24sIHRoZW4gdGhlIGZp
eCBpcyB0byBtYWtlIGl0IHdvcmsgaW5zaWRlIHRoZQo+ID4gPiA+ID4gPiBkcml2ZXIsIG5vdCBh
ZGRpbmcgc29tZSBoYWNreSB3b3JrYXJvdW5kIHRocm91Z2ggQUNQSSB0cmlja3MuCj4gPiA+ID4g
PiA+Cj4gPiA+ID4gPiA+IEFuZCB3aGF0IG91dCBvZiB0cmVlIGRyaXZlcnMgZG8gb3IgZG8gbm90
IHN1cHBvcnQgd2UgZG9uJ3QgY2FyZSBvbmUgYml0IGFueXdheS4KPiA+ID4gPiA+ID4KPiA+ID4g
PiA+Cj4gPiA+ID4gPiBJIHRoaW5rIHRoZSByZXZlcnRzIHNob3VsZCBiZSBtZXJnZWQgdmlhIFJh
ZmFlbCdzIHRyZWUgYXMgdGhlIG9yaWdpbmFsCj4gPiA+ID4gPiBwYXRjaGVzIHdlbnQgaW4gdmlh
IHRoZXJlLCBhbmQgd2Ugc2hvdWxkIGdldCB0aGVtIGluIGFzYXAuCj4gPiA+ID4gPgo+ID4gPiA+
ID4gQWNrZWQtYnk6IERhdmUgQWlybGllIDxhaXJsaWVkQHJlZGhhdC5jb20+Cj4gPiA+ID4gPiBE
YXZlLgo+ID4gPiA+Cj4gPiA+ID4gVGhlcmUgYXJlIGRlZmluaXRlbHkgZ29pbmcgdG8gYmUgcmVn
cmVzc2lvbnMgb24gbWFjaGluZXMgaW4gdGhlIGZpZWxkIHdpdGggdGhlCj4gPiA+ID4gaW4gdHJl
ZSBkcml2ZXJzIGJ5IHJldmVydGluZyB0aGlzLiAgSSB0aGluayB3ZSBzaG91bGQgaGF2ZSBhbiBh
bnN3ZXIgZm9yIGFsbCBvZiB0aG9zZQo+ID4gPiA+IGJlZm9yZSB0aGlzIHJldmVydCBpcyBhY2Nl
cHRlZC4KPiA+ID4gPgo+ID4gPiA+IFJlZ2FyZGluZyBzeXN0ZW1zIHdpdGggSW50ZWwrTlZJRElB
LCB3ZSdsbCBoYXZlIHRvIHdvcmsgd2l0aCBwYXJ0bmVycyB0byBjb2xsZWN0Cj4gPiA+ID4gc29t
ZSBpbmZvcm1hdGlvbiBvbiB0aGUgaW1wYWN0IG9mIHJldmVydGluZyB0aGlzLgo+ID4gPiA+Cj4g
PiA+ID4gV2hlbiB0aGlzIGlzIHVzZWQgb24gYSBzeXN0ZW0gd2l0aCBJbnRlbCtBTUQgdGhlIEFT
TCBjb25maWd1cmVzIEFNRCBHUFUgdG8gdXNlCj4gPiA+ID4gIkh5YnJpZCBHcmFwaGljcyIgd2hl
biBvbiBXaW5kb3dzIGFuZCAiUG93ZXIgRXhwcmVzcyIgYW5kICJTd2l0Y2hhYmxlIEdyYXBoaWNz
Igo+ID4gPiA+IHdoZW4gb24gTGludXguCj4gPiA+Cj4gPiA+IGFuZCB3aGF0J3MgZXhhY3RseSB0
aGUgZGlmZmVyZW5jZSBiZXR3ZWVuIHRob3NlPyBBbmQgd2hhdCdzIHRoZSBhY3R1YWwKPiA+ID4g
aXNzdWUgaGVyZT8KPiA+Cj4gPiBIeWJyaWQgR3JhcGhpY3MgaXMgdGhlIG5ldyAic3RhbmRhcmQi
IHdheSBvZiBoYW5kbGluZyB0aGVzZSBsYXB0b3BzLgo+ID4gSXQgdXNlcyB0aGUgc3RhbmRhcmQg
X1BSMyBBUENJIG1ldGhvZCB0byBoYW5kbGUgZEdQVSBwb3dlci4gIFN1cHBvcnQKPiA+IGZvciB0
aGlzIHdhcyBhZGRlZCB0byBMaW51eCByZWxhdGl2ZWx5IGxhdGVyIGNvbXBhcmVkIHRvIHdoZW4g
dGhlCj4gPiBsYXB0b3BzIHdlcmUgbGF1bmNoZWQuICAiUG93ZXIgRXhwcmVzcyIgdXNlZCB0aGUg
b3RoZXIgQU1EIHNwZWNpZmljCj4gPiBBVFBYIEFDUEkgbWV0aG9kIHRvIGhhbmRsZSBkR1BVIHBv
d2VyLiAgVGhlIGRyaXZlciBzdXBwb3J0cyBib3RoIHNvCj4gPiBlaXRoZXIgbWV0aG9kIHdpbGwg
d29yay4KPiA+Cj4gPiBBbGV4Cj4gPgo+Cj4gdGhhbmtzIGZvciBjbGFyaWZ5aW5nLiBCdXQgdGhh
dCBzdGlsbCBtZWFucyB0aGF0IHdlIHdvbid0IG5lZWQgc3VjaAo+IHdvcmthcm91bmRzIGZvciBB
TUQgdXNlcnMsIHJpZ2h0PyBhbWRncHUgaGFuZGxlcyBoeWJyaWQgZ3JhcGhpY3MganVzdAo+IGZp
bmUsIHJpZ2h0PwoKWWVhaCBpdCBzaG91bGQsIGFzc3VtaW5nIHlvdSBoYXZlIGEgbmV3IGVub3Vn
aCBrZXJuZWwgd2hpY2ggc3VwcG9ydHMKSEcsIHdoaWNoIGhhcyBiZWVuIHNldmVyYWwgeWVhcnMg
YXQgdGhpcyBwb2ludCBJSVJDLgoKQWxleAoKPgo+ID4gPgo+ID4gPiBXZSBhbHJlYWR5IGhhdmUg
dGhlIFBSSU1FIG9mZmxvYWRpbmcgaW4gcGxhY2UgYW5kIGlmIHRoYXQncyBub3QKPiA+ID4gZW5v
dWdoLCB3ZSBzaG91bGQgd29yayBvbiBleHRlbmRpbmcgaXQsIG5vdCBhZGRpbmcgc29tZSBBQ1BJ
IGJhc2VkCj4gPiA+IHdvcmthcm91bmRzLCBiZWNhdXNlIHRoYXQncyBleGFjdGx5IGhvdyB0aGF0
IGxvb2tzIGxpa2UuCj4gPiA+Cj4gPiA+IEFsc28sIHdhcyB0aGlzIGRpc2N1c3NlZCB3aXRoIGFu
eWJvZHkgaW52b2x2ZWQgaW4gdGhlIGRybSBzdWJzeXN0ZW0/Cj4gPiA+Cj4gPiA+ID4KPiA+ID4g
PiBJIGZlZWwgd2UgbmVlZCBhIGtub2IgYW5kL29yIERNSSBkZXRlY3Rpb24gdG8gYWZmZWN0IHRo
ZSBjaGFuZ2VzIHRoYXQgdGhlIEFTTAo+ID4gPiA+IG5vcm1hbGx5IHBlcmZvcm1zLgo+ID4gPgo+
ID4gPiBXaHkgZG8gd2UgaGF2ZSB0byBkbyB0aGF0IG9uIGEgZmlybXdhcmUgbGV2ZWwgYXQgYWxs
Pwo+ID4gPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+
ID4gPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gPiA+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKPiA+ID4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
