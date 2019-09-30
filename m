Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE12BC24D7
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2019 18:05:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85F076E487;
	Mon, 30 Sep 2019 16:05:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 671776E487
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2019 16:05:27 +0000 (UTC)
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id D9A6B81F19
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2019 16:05:26 +0000 (UTC)
Received: by mail-io1-f69.google.com with SMTP id g8so31186540iop.19
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2019 09:05:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6Jo3uapkJwME3KNEX03kTFMW4ezdDySvqiZtAQI5QuE=;
 b=jAU1R8J6uWfR1AGHkd9Miw89IG4Im+SvhgCTNTPtUwFYH1pPGJzaTQw5LoMmE9le8w
 3q1ZkwNsiM5lNlvzijAd7n3nZCu7wDJ7ZX2tnkRw1jfO/cCodz3tWi8IQw3W4eVi/MgP
 2vNwqq/CPGuCIdvKN0BztRctuX6aO1+++K9dPRJW/3Z7DHkwbl2clJCPnyS+IpdKe8u0
 bmYlBNZ/IxDAAcf4LxZtZHnGGoie2M/aMLqoRz7VWf98OY1iGD6gpUIRyag9MXly9WP3
 eAxhbRAnS1hrv0q0HcPMJViYpmv3t+ldcsESUkCmjKQrC2OG78h9gxWaYHCooscemN4g
 gC7A==
X-Gm-Message-State: APjAAAUgFic9AWoB7m/WLI0Ew47oYEGvuxPGpo+fsLjwuIEfR8mipMA5
 iCUmtp3s7IoXOtlRpHPj9edSnuVMdhfdOxcB0J0XO/X6rTFygneUi4qnhvmCKiR7IyTcWOis7AQ
 BhLONii9kjW7TXCRR6Gf5g6SzDc9TiiSmN2nnmzKaYiXy
X-Received: by 2002:a5d:9a17:: with SMTP id s23mr21659734iol.171.1569859526156; 
 Mon, 30 Sep 2019 09:05:26 -0700 (PDT)
X-Google-Smtp-Source: APXvYqypngOWw3ZSLYDhxUEQ9NgyFEx9J+foY40JfzIJvF4e6vjzQEx3SO7djN0Th8o3+JHT5FzrewlaBaaAcXyAtrE=
X-Received: by 2002:a5d:9a17:: with SMTP id s23mr21659711iol.171.1569859525882; 
 Mon, 30 Sep 2019 09:05:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190927144421.22608-1-kherbst@redhat.com>
 <20190927214252.GA65801@google.com>
 <CACO55tuaY1jFXpJPeC9M4PoWEDyy547_tE8MpLaTDb+C+ffsbg@mail.gmail.com>
 <20190930080534.GS2714@lahna.fi.intel.com>
 <CACO55tuMo1aAA7meGtEey6J6sOS-ZA0ebZeL52i2zfkWtPqe_g@mail.gmail.com>
 <20190930092934.GT2714@lahna.fi.intel.com>
In-Reply-To: <20190930092934.GT2714@lahna.fi.intel.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Mon, 30 Sep 2019 18:05:14 +0200
Message-ID: <CACO55tu9M8_TWu2MxNe_NROit+d+rHJP5_Tb+t73q5vr19sd1w@mail.gmail.com>
Subject: Re: [RFC PATCH] pci: prevent putting pcie devices into lower device
 states on certain intel bridges
To: Mika Westerberg <mika.westerberg@linux.intel.com>
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
Cc: Linux PM <linux-pm@vger.kernel.org>,
 nouveau <nouveau@lists.freedesktop.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Helgaas <helgaas@kernel.org>, Linux PCI <linux-pci@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

c3RpbGwgaGFwcGVucyB3aXRoIHlvdXIgcGF0Y2ggYXBwbGllZC4gVGhlIG1hY2hpbmUgc2ltcGx5
IGdldHMgc2h1dCBkb3duLgoKZG1lc2cgY2FuIGJlIGZvdW5kIGhlcmU6Cmh0dHBzOi8vZ2lzdC5n
aXRodWJ1c2VyY29udGVudC5jb20va2Fyb2xoZXJic3QvNDBlYjA5MWM3YjdiMzNlZjk5MzUyNWRl
NjYwZjFhM2IvcmF3LzIzODBlMzFmNTY2ZTkzZTViYTdjODdlZjU0NTQyMDk2NWQ0YzQ5MmMvZ2lz
dGZpbGUxLnR4dAoKSWYgdGhlcmUgYXJlIG5vIG90aGVyIHRoaW5ncyB0byB0cnkgb3V0LCBJIHdp
bGwgcG9zdCB0aGUgdXBkYXRlZCBwYXRjaCBzaG9ydGx5LgoKT24gTW9uLCBTZXAgMzAsIDIwMTkg
YXQgMTE6MjkgQU0gTWlrYSBXZXN0ZXJiZXJnCjxtaWthLndlc3RlcmJlcmdAbGludXguaW50ZWwu
Y29tPiB3cm90ZToKPgo+IE9uIE1vbiwgU2VwIDMwLCAyMDE5IGF0IDExOjE1OjQ4QU0gKzAyMDAs
IEthcm9sIEhlcmJzdCB3cm90ZToKPiA+IE9uIE1vbiwgU2VwIDMwLCAyMDE5IGF0IDEwOjA1IEFN
IE1pa2EgV2VzdGVyYmVyZwo+ID4gPG1pa2Eud2VzdGVyYmVyZ0BsaW51eC5pbnRlbC5jb20+IHdy
b3RlOgo+ID4gPgo+ID4gPiBIaSBLYXJvbCwKPiA+ID4KPiA+ID4gT24gRnJpLCBTZXAgMjcsIDIw
MTkgYXQgMTE6NTM6NDhQTSArMDIwMCwgS2Fyb2wgSGVyYnN0IHdyb3RlOgo+ID4gPiA+ID4gV2hh
dCBleGFjdGx5IGlzIHRoZSBzZXJpb3VzIGlzc3VlPyAgSSBndWVzcyBpdCdzIHRoYXQgdGhlIHJl
c2Nhbgo+ID4gPiA+ID4gZG9lc24ndCBkZXRlY3QgdGhlIEdQVSwgd2hpY2ggbWVhbnMgaXQncyBu
b3QgcmVzcG9uZGluZyB0byBjb25maWcKPiA+ID4gPiA+IGFjY2Vzc2VzPyAgSXMgdGhlcmUgYW55
IHRpbWluZyBjb21wb25lbnQgaGVyZSwgZS5nLiwgbWF5YmUgd2UncmUKPiA+ID4gPiA+IG1pc3Np
bmcgc29tZSBkZWxheSBsaWtlIHRoZSBvbmVzIE1pa2EgaXMgYWRkaW5nIHRvIHRoZSByZXNldCBw
YXRocz8KPiA+ID4gPgo+ID4gPiA+IFdoZW4gSSB3YXMgY2hlY2tpbmcgdXAgb24gc29tZSBvZiB0
aGUgUENJIHJlZ2lzdGVycyBvZiB0aGUgYnJpZGdlCj4gPiA+ID4gY29udHJvbGxlciwgdGhlIHNs
b3QgZGV0ZWN0aW9uIHRvbGQgbWUgdGhhdCB0aGVyZSBpcyBubyBkZXZpY2UKPiA+ID4gPiByZWNv
Z25pemVkIGFueW1vcmUuIEkgZG9uJ3Qga25vdyB3aGljaCByZWdpc3RlciBpdCB3YXMgYW55bW9y
ZSwgdGhvdWdoCj4gPiA+ID4gSSBndWVzcyBvbmUgY291bGQgcmVhZCBpdCB1cCBpbiB0aGUgU29D
IHNwZWMgZG9jdW1lbnQgYnkgSW50ZWwuCj4gPiA+ID4KPiA+ID4gPiBNeSBndWVzcyBpcywgdGhh
dCB0aGUgYnJpZGdlIGNvbnRyb2xsZXIgZmFpbHMgdG8gZGV0ZWN0IHRoZSBHUFUgYmVpbmcKPiA+
ID4gPiBoZXJlIG9yIGFjdGl2ZWx5IHRocmV3IGl0IG9mIHRoZSBidXMgb3Igc29tZXRoaW5nLiBC
dXQgYSBub3JtYWwgc3lzdGVtCj4gPiA+ID4gc3VzcGVuZC9yZXN1bWUgY3ljbGUgYnJpbmdzIHRo
ZSBHUFUgYmFjayBvbmxpbmUgKGRvaW5nIGEgcmVzY2FuIHZpYQo+ID4gPiA+IHN5c2ZzIGdldHMg
dGhlIGRldmljZSBkZXRlY3RlZCBhZ2FpbikKPiA+ID4KPiA+ID4gQ2FuIHlvdSBlbGFib3JhdGUg
YSBiaXQgd2hhdCBraW5kIG9mIHNjZW5hcmlvIHRoZSBpc3N1ZSBoYXBwZW5zIChlLmcKPiA+ID4g
c3RlcHMgaG93IGl0IHJlcHJvZHVjZXMpPyBJdCB3YXMgbm90IDEwMCUgY2xlYXIgZnJvbSB0aGUg
Y2hhbmdlbG9nLiBBbHNvCj4gPiA+IHdoYXQgdGhlIHJlc3VsdCB3aGVuIHRoZSBmYWlsdXJlIGhh
cHBlbnM/Cj4gPiA+Cj4gPgo+ID4geWVhaCwgSSBhbHJlYWR5IGhhdmUgYW4gdXBkYXRlZCBwYXRj
aCBpbiB0aGUgd29ya3Mgd2hpY2ggYWxzbyBkb2VzIHRoZQo+ID4gcmV3b3JrIEJqb3JuIHN1Z2dl
c3RlZC4gSGFkIG5vIHRpbWUgeWV0IHRvIHRlc3QgaWYgSSBkaWRuJ3QgbWVzcyBpdAo+ID4gdXAu
Cj4gPgo+ID4gSSBhbSBhbHNvIHRoaW5raW5nIG9mIGFkZGluZyBhIGtlcm5lbCBwYXJhbWV0ZXIg
dG8gZW5hYmxlIHRoaXMKPiA+IHdvcmthcm91bmQgb24gZGVtYW5kLCBidXQgbm90IHF1aXRlIHN1
cmUgb24gdGhhdCBvbmUgeWV0Lgo+Cj4gUmlnaHQsIEkgdGhpbmsgaXQgd291bGQgYmUgZ29vZCB0
byBmaWd1cmUgb3V0IHRoZSByb290IGNhdXNlIGJlZm9yZQo+IGFkZGluZyBhbnkgd29ya2Fyb3Vu
ZHMgOy0pIEl0IG1pZ2h0IHZlcnkgd2VsbCBiZSB0aGF0IHdlIGFyZSBqdXN0Cj4gbWlzc2luZyBz
b21ldGhpbmcgdGhlIFBDSWUgc3BlYyByZXF1aXJlcyBidXQgbm90IGltcGxlbWVudGVkIGluIExp
bnV4Lgo+Cj4gPiA+IEkgc2VlIHRoZXJlIGlzIGEgc2NyaXB0IHRoYXQgZG9lcyBzb21ldGhpbmcg
YnV0IHVuZm9ydHVuYXRlbHkgSSdtIG5vdAo+ID4gPiBmbHVlbnQgaW4gUHl0aG9uIHNvIGNhbid0
IGV4dHJhY3QgdGhlIHN0ZXBzIGhvdyB0aGUgaXNzdWUgY2FuIGJlCj4gPiA+IHJlcHJvZHVjZWQg
Oy0pCj4gPiA+Cj4gPiA+IE9uZSB0aGluZyB0aGF0IEknbSB3b3JraW5nIG9uIGlzIHRoYXQgTGlu
dXggUENJIHN1YnN5c3RlbSBtaXNzZXMgY2VydGFpbgo+ID4gPiBkZWxheXMgdGhhdCBhcmUgbmVl
ZGVkIGFmdGVyIEQzY29sZCAtPiBEMCB0cmFuc2l0aW9uLCBvdGhlcndpc2UgdGhlCj4gPiA+IGRl
dmljZSBhbmQvb3IgbGluayBtYXkgbm90IGJlIHJlYWR5IGJlZm9yZSB3ZSBhY2Nlc3MgaXQuIFdo
YXQgeW91IGFyZQo+ID4gPiBleHBlcmllbmNpbmcgc291bmRzIHNpbWlsYXIuIEkgd29uZGVyIGlm
IHlvdSBjb3VsZCB0cnkgdGhlIGZvbGxvd2luZwo+ID4gPiBwYXRjaCBhbmQgc2VlIGlmIGl0IG1h
a2VzIGFueSBkaWZmZXJlbmNlPwo+ID4gPgo+ID4gPiBodHRwczovL3BhdGNod29yay5rZXJuZWwu
b3JnL3BhdGNoLzExMTA2NjExLwo+ID4KPiA+IEkgdGhpbmsgSSBhbHJlYWR5IHRyaWVkIHRoaXMg
cGF0aC4gVGhlIHByb2JsZW0gaXNuJ3QgdGhhdCB0aGUgZGV2aWNlCj4gPiBpc24ndCBhY2Nlc3Np
YmxlIHRvbyBsYXRlLCBidXQgdGhhdCBpdCBzZWVtcyB0aGF0IHRoZSBkZXZpY2UKPiA+IGNvbXBs
ZXRlbHkgZmFsbHMgb2ZmIHRoZSBidXMuIEJ1dCBJIGNhbiByZXRlc3QgYWdhaW4ganVzdCB0byBi
ZSBzdXJlLgo+Cj4gWWVzLCBwbGVhc2UgdHJ5IGl0IGFuZCBzaGFyZSBmdWxsIGRtZXNnIGlmL3do
ZW4gdGhlIGZhaWx1cmUgc3RpbGwgaGFwcGVucy4KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
