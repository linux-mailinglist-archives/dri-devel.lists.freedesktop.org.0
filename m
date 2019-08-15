Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B98C8EE76
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2019 16:41:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 517576E9CE;
	Thu, 15 Aug 2019 14:41:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B82526E404;
 Thu, 15 Aug 2019 14:41:26 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id z11so2441853wrt.4;
 Thu, 15 Aug 2019 07:41:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HcFpMiTtuOvVin5sw+3DuNBsfQfOejkUnh6Hot437es=;
 b=Ss12vqlcc+5TYyvXbgTh5X0gHh2FVY8rlOMXwY+D7UNpz5UgrzNbte8M5zGLIiwdiU
 8HiaA8h3cg3sZOpBXSHmiyPntaO2ULJdncylPeYgT3QTCdiF6Mhok7/zBHvJ+2JGGRjG
 TFCW+gl+RyvC9vwhXidNZt6d3u6mCsuzjPrlTyZKOMSGaev6qzMYc8E47cb11dveLQ7Y
 baGrBEPdxqgnkagFPk9tfLYqZr/1qTHO0kAm16Rxefxr8T4BpqaVMaQ/Fl1oNukmjth+
 pZi5hp2Ma+FrXf9F+BTyhnlAhrVnEBrgUn5ESKtYdZMknq4TKal1euRplMCYrx+Kaoun
 IrTQ==
X-Gm-Message-State: APjAAAXgZx2utMweSR/e5eJ8r6Zya43mietAUwRHRtc18gKrMb5IJrNk
 KjPBE4pPAB7xCoQz92CQTS3VRjiAS1FqsTua58k=
X-Google-Smtp-Source: APXvYqwu7tBhNmf/UnYZw2m8f2ftuHlgfpBHXl/sfxChx5P3Gt4q17UYOIlrbtBUl+i40lNOQNcjUR9EbI4EFrUTFIo=
X-Received: by 2002:a5d:4f91:: with SMTP id d17mr5805577wru.74.1565880085269; 
 Thu, 15 Aug 2019 07:41:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190814213118.28473-1-kherbst@redhat.com>
 <20190814213118.28473-2-kherbst@redhat.com>
 <CAPM=9ty7yEUqKrcixV1tTuWCpyh6UikA3rxX8BF1E3fDb6WLQQ@mail.gmail.com>
 <5e05532328324d01bc554c573f6298f8@AUSX13MPC101.AMER.DELL.COM>
 <CACO55tsDA1WpMGtAPqUJpWt0AmPDnv9LuC09g2KB5GXB-VSCew@mail.gmail.com>
 <CADnq5_NUox3vvg6Mt3i9erA+AL2MfotpNBZQnWWknn4j+j-F=Q@mail.gmail.com>
 <CACO55tty6TqEo4UBkX5YckLuP-XhHXKVs0ew+Q8__sKMi1BCbA@mail.gmail.com>
 <CADnq5_PWuLU0pcG549-xThMHy3W0P2+fAO_Ledk6FP2TVG3+gQ@mail.gmail.com>
 <6ed1c393ffeb4c24ab5875927d6a37ac@AUSX13MPC101.AMER.DELL.COM>
In-Reply-To: <6ed1c393ffeb4c24ab5875927d6a37ac@AUSX13MPC101.AMER.DELL.COM>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 15 Aug 2019 10:41:13 -0400
Message-ID: <CADnq5_NoCR3f7VhKnqkvvVAF+=R0aN69WRCDxwcVLHTPpfHyTQ@mail.gmail.com>
Subject: Re: [Nouveau] [PATCH 1/7] Revert "ACPI / OSI: Add OEM _OSI string to
 enable dGPU direct output"
To: Mario.Limonciello@dell.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=HcFpMiTtuOvVin5sw+3DuNBsfQfOejkUnh6Hot437es=;
 b=OXLlY6kcmuBDEe2qQ4D5NprGXUFSF0Iq0QNrVXw7/W68GetZu/DpIukPUSwgwKeZUK
 Zk4/NxyLYNzC5yqz3gR0lH0oDpOb5p1Ee9GGvY0zD9jOJQZIFXt9Qj+Q83eBvVRkO+7Z
 ADB3X5dMqjih80/3kRrwBojC3m3pfqMSdmI3E98upGyKdt1dWP8Hf1RivgQ3A3yEBqel
 VJX8E0D5hylR36JRDpziyrYYwvPHZ1flrImBCn+Lqg1B1Rd+byxgO+tq97Nvb5YsToRq
 n9ciL7JVxnKEv1JB1yPzC7SYtCv54PUQFWnMSIQlhBh9EXDzMxTkNhsDKJ1xqXlPOKip
 JtaA==
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
Cc: Karol Herbst <kherbst@redhat.com>, nouveau <nouveau@lists.freedesktop.org>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Linux ACPI <linux-acpi@vger.kernel.org>, Alex Hung <alex.hung@canonical.com>,
 Ben Skeggs <bskeggs@redhat.com>, Dave Airlie <airlied@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBBdWcgMTUsIDIwMTkgYXQgMTA6MzAgQU0gPE1hcmlvLkxpbW9uY2llbGxvQGRlbGwu
Y29tPiB3cm90ZToKPgo+ID4gT24gVGh1LCBBdWcgMTUsIDIwMTkgYXQgMTA6MTUgQU0gS2Fyb2wg
SGVyYnN0IDxraGVyYnN0QHJlZGhhdC5jb20+IHdyb3RlOgo+ID4gPgo+ID4gPiBPbiBUaHUsIEF1
ZyAxNSwgMjAxOSBhdCA0OjEzIFBNIEFsZXggRGV1Y2hlciA8YWxleGRldWNoZXJAZ21haWwuY29t
Pgo+ID4gd3JvdGU6Cj4gPiA+ID4KPiA+ID4gPiBPbiBUaHUsIEF1ZyAxNSwgMjAxOSBhdCAxMDow
NCBBTSBLYXJvbCBIZXJic3QgPGtoZXJic3RAcmVkaGF0LmNvbT4gd3JvdGU6Cj4gPiA+ID4gPgo+
ID4gPiA+ID4gT24gVGh1LCBBdWcgMTUsIDIwMTkgYXQgMzo1NiBQTSA8TWFyaW8uTGltb25jaWVs
bG9AZGVsbC5jb20+IHdyb3RlOgo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+IC0tLS0tT3JpZ2lu
YWwgTWVzc2FnZS0tLS0tCj4gPiA+ID4gPiA+ID4gRnJvbTogbGludXgtYWNwaS1vd25lckB2Z2Vy
Lmtlcm5lbC5vcmcgPGxpbnV4LWFjcGktCj4gPiBvd25lckB2Z2VyLmtlcm5lbC5vcmc+IE9uCj4g
PiA+ID4gPiA+ID4gQmVoYWxmIE9mIERhdmUgQWlybGllCj4gPiA+ID4gPiA+ID4gU2VudDogV2Vk
bmVzZGF5LCBBdWd1c3QgMTQsIDIwMTkgNTo0OCBQTQo+ID4gPiA+ID4gPiA+IFRvOiBLYXJvbCBI
ZXJic3QKPiA+ID4gPiA+ID4gPiBDYzogTEtNTDsgTGludXggQUNQSTsgZHJpLWRldmVsOyBub3V2
ZWF1OyBSYWZhZWwgSiAuIFd5c29ja2k7IEFsZXggSHVuZzsKPiA+IEJlbgo+ID4gPiA+ID4gPiA+
IFNrZWdnczsgRGF2ZSBBaXJsaWUKPiA+ID4gPiA+ID4gPiBTdWJqZWN0OiBSZTogW05vdXZlYXVd
IFtQQVRDSCAxLzddIFJldmVydCAiQUNQSSAvIE9TSTogQWRkIE9FTSBfT1NJCj4gPiBzdHJpbmcg
dG8KPiA+ID4gPiA+ID4gPiBlbmFibGUgZEdQVSBkaXJlY3Qgb3V0cHV0Igo+ID4gPiA+ID4gPiA+
Cj4gPiA+ID4gPiA+ID4gT24gVGh1LCAxNSBBdWcgMjAxOSBhdCAwNzozMSwgS2Fyb2wgSGVyYnN0
IDxraGVyYnN0QHJlZGhhdC5jb20+Cj4gPiB3cm90ZToKPiA+ID4gPiA+ID4gPiA+Cj4gPiA+ID4g
PiA+ID4gPiBUaGlzIHJldmVydHMgY29tbWl0IDI4NTg2YTUxZWVhNjY2ZDU1MzFiY2FlZjJmNjhl
NGFiYmQ4NzI0MmMuCj4gPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+ID4gVGhlIG9yaWdpbmFs
IGNvbW1pdCBtZXNzYWdlIGRpZG4ndCBldmVuIG1ha2Ugc2Vuc2UuIEFNRCBfZG9lc18KPiA+IHN1
cHBvcnQgaXQgYW5kCj4gPiA+ID4gPiA+ID4gPiBpdCB3b3JrcyB3aXRoIE5vdXZlYXUgYXMgd2Vs
bC4KPiA+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gPiBBbHNvIHdoYXQgd2FzIHRoZSBpc3N1
ZSBiZWluZyBzb2x2ZWQgaGVyZT8gTm8gcmVmZXJlbmNlcyB0byBhbnkgYnVncwo+ID4gYW5kIG5v
dAo+ID4gPiA+ID4gPiA+ID4gZXZlbiBleHBsYWluaW5nIGFueSBpc3N1ZSBhdCBhbGwgaXNuJ3Qg
dGhlIHdheSB3ZSBkbyB0aGluZ3MuCj4gPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+ID4gQW5k
IGV2ZW4gaWYgaXQgbWVhbnMgYSBtdXhlZCBkZXNpZ24sIHRoZW4gdGhlIGZpeCBpcyB0byBtYWtl
IGl0IHdvcmsKPiA+IGluc2lkZSB0aGUKPiA+ID4gPiA+ID4gPiA+IGRyaXZlciwgbm90IGFkZGlu
ZyBzb21lIGhhY2t5IHdvcmthcm91bmQgdGhyb3VnaCBBQ1BJIHRyaWNrcy4KPiA+ID4gPiA+ID4g
PiA+Cj4gPiA+ID4gPiA+ID4gPiBBbmQgd2hhdCBvdXQgb2YgdHJlZSBkcml2ZXJzIGRvIG9yIGRv
IG5vdCBzdXBwb3J0IHdlIGRvbid0IGNhcmUgb25lCj4gPiBiaXQgYW55d2F5Lgo+ID4gPiA+ID4g
PiA+ID4KPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+IEkgdGhpbmsgdGhlIHJldmVydHMgc2hv
dWxkIGJlIG1lcmdlZCB2aWEgUmFmYWVsJ3MgdHJlZSBhcyB0aGUgb3JpZ2luYWwKPiA+ID4gPiA+
ID4gPiBwYXRjaGVzIHdlbnQgaW4gdmlhIHRoZXJlLCBhbmQgd2Ugc2hvdWxkIGdldCB0aGVtIGlu
IGFzYXAuCj4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiBBY2tlZC1ieTogRGF2ZSBBaXJsaWUg
PGFpcmxpZWRAcmVkaGF0LmNvbT4KPiA+ID4gPiA+ID4gPiBEYXZlLgo+ID4gPiA+ID4gPgo+ID4g
PiA+ID4gPiBUaGVyZSBhcmUgZGVmaW5pdGVseSBnb2luZyB0byBiZSByZWdyZXNzaW9ucyBvbiBt
YWNoaW5lcyBpbiB0aGUgZmllbGQgd2l0aAo+ID4gdGhlCj4gPiA+ID4gPiA+IGluIHRyZWUgZHJp
dmVycyBieSByZXZlcnRpbmcgdGhpcy4gIEkgdGhpbmsgd2Ugc2hvdWxkIGhhdmUgYW4gYW5zd2Vy
IGZvciBhbGwKPiA+IG9mIHRob3NlCj4gPiA+ID4gPiA+IGJlZm9yZSB0aGlzIHJldmVydCBpcyBh
Y2NlcHRlZC4KPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gUmVnYXJkaW5nIHN5c3RlbXMgd2l0aCBJ
bnRlbCtOVklESUEsIHdlJ2xsIGhhdmUgdG8gd29yayB3aXRoIHBhcnRuZXJzIHRvCj4gPiBjb2xs
ZWN0Cj4gPiA+ID4gPiA+IHNvbWUgaW5mb3JtYXRpb24gb24gdGhlIGltcGFjdCBvZiByZXZlcnRp
bmcgdGhpcy4KPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gV2hlbiB0aGlzIGlzIHVzZWQgb24gYSBz
eXN0ZW0gd2l0aCBJbnRlbCtBTUQgdGhlIEFTTCBjb25maWd1cmVzIEFNRAo+ID4gR1BVIHRvIHVz
ZQo+ID4gPiA+ID4gPiAiSHlicmlkIEdyYXBoaWNzIiB3aGVuIG9uIFdpbmRvd3MgYW5kICJQb3dl
ciBFeHByZXNzIiBhbmQKPiA+ICJTd2l0Y2hhYmxlIEdyYXBoaWNzIgo+ID4gPiA+ID4gPiB3aGVu
IG9uIExpbnV4Lgo+ID4gPiA+ID4KPiA+ID4gPiA+IGFuZCB3aGF0J3MgZXhhY3RseSB0aGUgZGlm
ZmVyZW5jZSBiZXR3ZWVuIHRob3NlPyBBbmQgd2hhdCdzIHRoZSBhY3R1YWwKPiA+ID4gPiA+IGlz
c3VlIGhlcmU/Cj4gPiA+ID4KPiA+ID4gPiBIeWJyaWQgR3JhcGhpY3MgaXMgdGhlIG5ldyAic3Rh
bmRhcmQiIHdheSBvZiBoYW5kbGluZyB0aGVzZSBsYXB0b3BzLgo+ID4gPiA+IEl0IHVzZXMgdGhl
IHN0YW5kYXJkIF9QUjMgQVBDSSBtZXRob2QgdG8gaGFuZGxlIGRHUFUgcG93ZXIuICBTdXBwb3J0
Cj4gPiA+ID4gZm9yIHRoaXMgd2FzIGFkZGVkIHRvIExpbnV4IHJlbGF0aXZlbHkgbGF0ZXIgY29t
cGFyZWQgdG8gd2hlbiB0aGUKPiA+ID4gPiBsYXB0b3BzIHdlcmUgbGF1bmNoZWQuICAiUG93ZXIg
RXhwcmVzcyIgdXNlZCB0aGUgb3RoZXIgQU1EIHNwZWNpZmljCj4gPiA+ID4gQVRQWCBBQ1BJIG1l
dGhvZCB0byBoYW5kbGUgZEdQVSBwb3dlci4gIFRoZSBkcml2ZXIgc3VwcG9ydHMgYm90aCBzbwo+
ID4gPiA+IGVpdGhlciBtZXRob2Qgd2lsbCB3b3JrLgo+ID4gPiA+Cj4gPiA+ID4gQWxleAo+ID4g
PiA+Cj4gPiA+Cj4gPiA+IHRoYW5rcyBmb3IgY2xhcmlmeWluZy4gQnV0IHRoYXQgc3RpbGwgbWVh
bnMgdGhhdCB3ZSB3b24ndCBuZWVkIHN1Y2gKPiA+ID4gd29ya2Fyb3VuZHMgZm9yIEFNRCB1c2Vy
cywgcmlnaHQ/IGFtZGdwdSBoYW5kbGVzIGh5YnJpZCBncmFwaGljcyBqdXN0Cj4gPiA+IGZpbmUs
IHJpZ2h0Pwo+ID4KPiA+IFllYWggaXQgc2hvdWxkLCBhc3N1bWluZyB5b3UgaGF2ZSBhIG5ldyBl
bm91Z2gga2VybmVsIHdoaWNoIHN1cHBvcnRzCj4gPiBIRywgd2hpY2ggaGFzIGJlZW4gc2V2ZXJh
bCB5ZWFycyBhdCB0aGlzIHBvaW50IElJUkMuCj4gPgo+ID4gQWxleAo+ID4KPgo+IENhbiB5b3Ug
ZGVmaW5lIGhvdyBuZXcgb2YgYSBrZXJuZWwgaXMgYSBuZXcgZW5vdWdoIGtlcm5lbD8KPgo+IExv
b2tpbmcgb24gbXkgc2lkZSB0aGVzZSBwcm9ibGVtcyB3ZXJlIG9uIG5ldyBoYXJkd2FyZSAoUHJl
Y2lzaW9uIDc3NDApIGFuZAo+IGFyZSBjaGVja2VkIGFzIHJlY2VudGx5IGFzIHN0YXJ0IG9mIHRo
aXMgc3VtbWVyLCB3LyBrZXJuZWwgNC4xNS4KCkkgZG9uJ3QgcmVtZW1iZXIgb2ZmIGhhbmQuICBJ
dCB3YXMgYmVmb3JlIHRoZSBfUFIzIHN1cHBvcnQgaW4gdGhlIHBjaQpzdWJzeXN0ZW0gd2FzIHVw
c3RyZWFtLiAgV2hhdCB3YXMgdGhlIHByb2JsZW0geW91IHdlcmUgc2VlaW5nIHdpdGgKdGhpcyBz
eXN0ZW0/CgpBbGV4Cgo+Cj4gV2UgY2FuIGFycmFuZ2UgdG8gaGF2ZSBpdCBjaGVja2VkIGFnYWlu
IG9uIDUuM3JjWCB3LyB0aGUgT1NJIGRpc2FibGVkLgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
