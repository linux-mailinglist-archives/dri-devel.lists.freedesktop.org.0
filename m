Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C94F1873A4
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2019 10:00:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5349B6ED19;
	Fri,  9 Aug 2019 08:00:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEF576E89D
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Aug 2019 16:32:32 +0000 (UTC)
Received: by mail-ot1-x341.google.com with SMTP id b7so70802012otl.11
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Aug 2019 09:32:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=erfhL7VDoeVN6LjjmIrSkztKG2I43YnuXIQ5QoKPdbc=;
 b=fqYTsKGJSN2FfjcT4D1AOBQWRPfZNpenOWLGNzWeKR9DcxGh7nrBdh1lQg6kZ6sZ5x
 kSg9l1ISBMR3imDqewuey8JUpv2tNyr5RGCmgpgtXgyUl3VEbXM1kNBXl56FaML+w6kQ
 wjXHeAUJH5P2K+7dZWQw/T+cXzze6hzgAJ4pgjXq2cCgn4yCzCkNQWein12cO3rj+pWK
 WFOp98cgLKlgde/I6Jfptl7zw9Zlkl/gch+OvUTnlkiKYegXsoXxGajEnDl0z1v6ERN7
 zF/PnbyiAbZ9g6ccXYIaC2hFi2k9DdNYuR7fJKyZZogfl8V5yyP4E2mG/9INe0hUKFi4
 PdXw==
X-Gm-Message-State: APjAAAUZu3kX9zAuhI2AbyrN7lIQboFIK3Zs4EmMUTYVYedhdXET3bmj
 QRaCJvbukMBHcK6H6VWkqmP9rFmnXd1HddJMgDoq/A==
X-Google-Smtp-Source: APXvYqy8Y64Qwzaj+EcuykgpBje7tkhZgHMn/Tvi8eNyfMMvhJLC6rMpyPg9xxizaeKi+hpK8mPldF+gfVafFe2ZGzs=
X-Received: by 2002:a6b:90c1:: with SMTP id
 s184mr15573418iod.244.1565281952009; 
 Thu, 08 Aug 2019 09:32:32 -0700 (PDT)
MIME-Version: 1.0
References: <20190805211451.20176-1-robdclark@gmail.com>
 <20190806084821.GA17129@lst.de>
 <CAJs_Fx6eh1w7c=crMoD5XyEOMzP6orLhqUewErE51cPGYmObBQ@mail.gmail.com>
 <20190806155044.GC25050@lst.de>
 <CAJs_Fx6uztwDy2PqRy3Tc9p12k8r_ovS2tAcsMV6HqnAp=Ggug@mail.gmail.com>
 <20190807062545.GF6627@lst.de>
 <CAJs_Fx7tqbr_gqRdqJEwOcRFReP0DqZzOu11Dxhxkp8+PygUQw@mail.gmail.com>
 <20190808100031.GA32658@lst.de>
In-Reply-To: <20190808100031.GA32658@lst.de>
From: Rob Clark <robdclark@chromium.org>
Date: Thu, 8 Aug 2019 09:32:21 -0700
Message-ID: <CAJs_Fx6ikxob7Mu6GM1ESe4pBXAbVv4NNnbZN7YUQdmyfPnxgg@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm: add cache support for arm64
To: Christoph Hellwig <hch@lst.de>
X-Mailman-Approved-At: Fri, 09 Aug 2019 08:00:16 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=erfhL7VDoeVN6LjjmIrSkztKG2I43YnuXIQ5QoKPdbc=;
 b=kV+NV+qW/5qJZ2Z48xBPFEZ6LJYAXKY5/LhYbls4LmwDokugWNdTa16wJmKp0yXodN
 iVYJzFf9wKMlE++n5p9Whx3JnTaCk53pROAM7OZ8x0kFxKIh5rsaR/LnSEl93Lnc1C2A
 Hfwb5Y/I4iLfY0pVARlG0U/1rzE7/uJK5ZkZY=
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
Cc: Sean Paul <sean@poorly.run>, Maxime Ripard <maxime.ripard@bootlin.com>,
 Catalin Marinas <catalin.marinas@arm.com>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 linux-arm-kernel@lists.infradead.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
 Allison Randal <allison@lohutok.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBBdWcgOCwgMjAxOSBhdCAzOjAwIEFNIENocmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0
LmRlPiB3cm90ZToKPgo+IE9uIFdlZCwgQXVnIDA3LCAyMDE5IGF0IDA5OjA5OjUzQU0gLTA3MDAs
IFJvYiBDbGFyayB3cm90ZToKPiA+ID4gPiAoRXZlbnR1YWxseSBJJ2QgbGlrZSB0byBzdXBwb3J0
IHBhZ2VzIHBhc3NlZCBpbiBmcm9tIHVzZXJzcGFjZS4uIGJ1dAo+ID4gPiA+IHRoYXQgaXMgZG93
biB0aGUgcm9hZC4pCj4gPiA+Cj4gPiA+IEV3dy4gIFBsZWFzZSB0YWxrIHRvIHRoZSBpb21tdSBs
aXN0IGJlZm9yZSBzdGFydGluZyBvbiB0aGF0Lgo+ID4KPiA+IFRoaXMgaXMgbW9yZSBvZiBhIGxv
bmcgdGVybSBnb2FsLCB3ZSBjYW4ndCBkbyBpdCB1bnRpbCB3ZSBoYXZlCj4gPiBwZXItY29udGV4
dC9wcm9jZXNzIHBhZ2V0YWJsZXMsIG9mYy4KPiA+Cj4gPiBHZXR0aW5nIGEgYml0IG9mZiB0b3Bp
YywgYnV0IEknbSBjdXJpb3VzIGFib3V0IHdoYXQgcHJvYmxlbXMgeW91IGFyZQo+ID4gY29uY2Vy
bmVkIGFib3V0LiAgVXNlcnNwYWNlIGNhbiBzaG9vdCBpdCdzIG93biBmb290LCBidXQgaWYgaXQg
aXMgbm90Cj4gPiBzaGFyaW5nIEdQVSBwYWdldGFibGVzIHdpdGggb3RoZXIgcHJvY2Vzc2VzLCBp
dCBjYW4ndCBzaG9vdCBvdGhlcidzCj4gPiBmZWV0LiAgKEknbSBndWVzc2luZyB5b3UgYXJlIGNv
bmNlcm5lZCBhYm91dCBub24tcGFnZS1hbGlnbmVkCj4gPiBtYXBwaW5ncz8pCj4KPiBNYXliZSBJ
IG1pc3VuZGVyc3Rvb2Qgd2hhdCB5b3UgbWVhbiBhYm92ZSwgSSB0aG91Z2ggeW91IG1lYW4gbWVz
c2luZwo+IHdpdGggcGFnZSBjYWNoYWJpbGl0eSBhdHRyaWJ1dGVzIGZvciB1c2Vyc3BhY2UgcGFn
ZXMuICBJZiB3aGF0IHlvdSBhcmUKPiBsb29raW5nIGludG8gaXMganVzdCAic3RhbmRhcmQiIFNW
TSBJIG9ubHkgaG9wZSB0aGF0IG91ciBBUElzIGZvciB0aGF0Cj4gd2hpY2ggY3VycmVudGx5IGFy
ZSBhIG1lc3MgYXJlIGluIHNoYXBlIGJ5IHRoZW4sIGFzIGFsbCB1c2VycyBjdXJyZW50bHkKPiBo
YXZlIHRoZWlyIG93biBjcnVmdHkgYW5kIGF0IGxlYXN0IHNsaWdodGx5IGJ1Z2d5IHZlcnNpb25z
IG9mIHRoYXQuICBCdXQKPiBhdCBsZWFzdCBpdCBpcyBhbiBpc3N1ZSB0aGF0IGlzIGJlaW5nIHdv
cmtlZCBvbi4KCmFoaCwgb2suLiBhbmQgbm8sIHdlIHdvdWxkbid0IGJlIHJlbWFwcGluZyAnbWFs
bG9jJyBtZW1vcnkgYXMKd3JpdGVjb21iaW5lLiAgV2UnZCBoYXZlIHRvIHdpcmUgdXAgYmV0dGVy
IHN1cHBvcnQgZm9yIGNhY2hlZCBidWZmZXJzLgoKQ3VycmVudGx5IHdlIHVzZSBXQyBmb3IgYmFz
aWNhbGx5IGFsbCBHRU0gYnVmZmVycyBhbGxvY2F0ZWQgZnJvbQprZXJuZWwsIHNpbmNlIHRoYXQg
aXMgYSBnb29kIGNob2ljZSBmb3IgbW9zdCBHUFUgd29ya2xvYWRzLi4gaWUuIENQVQppc24ndCBy
ZWFkaW5nIGJhY2sgZnJvbSBHUFUgYnVmZmVycyBpbiBtb3N0IGNhc2VzLiAgSSdtIHRvbGQgY2Fj
aGVkCmJ1ZmZlcnMgYXJlIHVzZWZ1bCBmb3IgY29tcHV0ZSB3b3JrbG9hZHMgd2hlcmUgdGhlcmUg
aXMgbW9yZSBiYWNrIGFuZApmb3J0aCBiZXR3ZWVuIEdQVSBhbmQgQ1BVLCBidXQgd2UgaGF2ZW4n
dCByZWFsbHkgY3Jvc3NlZCB0aGF0IGJyaWRnZQp5ZXQuICBDb21wdXRlIHdvcmtsb2FkcyBpcyBh
bHNvIHdlcmUgdGhlIFNWTSBpbnRlcmVzdCBpcy4KCj4gPiA+IFNvIGJhY2sgdG8gdGhlIHF1ZXN0
aW9uLCBJJ2QgbGlrZSB0byB1bmRlcnN0YW5kIHlvdXIgdXNlIGNhc2UgKGFuZAo+ID4gPiBtYXli
ZSBoZWFyIGZyb20gdGhlIG90aGVyIGRybSBmb2xrcyBpZiB0aGF0IGlzIGNvbW1vbik6Cj4gPiA+
Cj4gPiA+ICAtIHlvdSBhbGxvY2F0ZSBwYWdlcyBmcm9tIHNobWVtICh3aHkgc2htZW0sIGJ0dz8g
IGlmIHRoaXMgaXMgZG9uZSBieQo+ID4gPiAgICBvdGhlciBkcm0gZHJpdmVycyBob3cgZG8gdGhl
eSBndWFyYW50ZWUgYWRkcmVzc2FiaWxpdHkgd2l0aG91dCBhbgo+ID4gPiAgICBpb21tdT8pCj4g
Pgo+ID4gc2htZW0gZm9yIHN3YXBwYWJsZSBwYWdlcy4gIEkgZG9uJ3QgdW5waW4gYW5kIGxldCB0
aGluZ3MgZ2V0IHN3YXBwZWQKPiA+IG91dCB5ZXQsIGJ1dCBJJ20gdG9sZCBpdCBzdGFydHMgdG8g
YmVjb21lIGltcG9ydGFudCB3aGVuIHlvdSBoYXZlIDUwCj4gPiBicm93c2VyIHRhYnMgb3BlbiA7
LSkKPgo+IFllcywgIGJ1dCBhdCB0aGF0IHBvaW50IHRoZSBzd2FwcGluZyBjYW4gdXNlIHRoZSBr
ZXJuZWwgbGluZWFyIG1hcHBpbmcKPiBhbmQgd2UgYXJlIGdvaW5nIGludG8gYWxpYXNpbmcgcHJv
YmxlbXMgdGhhdCBjYW4gZGlzdHVyYiB0aGUgY2FjaGUuICBTbwo+IGFzLWlzIHRoaXMgaXMgZ29p
bmcgdG8gcHJvYmxlbWF0aWMgd2l0aG91dCBuZXcgaG9va3MgaW50byBzaG1lbWZzLgo+CgpNeSBl
eHBlY3RhdGlvbiBpcyB0aGF0IHdlJ2QgdHJlYXQgdGhlIHBhZ2VzIGFzIGNhY2hlZCB3aGVuIGhh
bmRpbmcKdGhlbSBiYWNrIHRvIHNobWVtZnMsIGFuZCB3YitpbnYgd2hlbiB3ZSB0YWtlIHRoZW0g
YmFjayBhZ2FpbiBmcm9tCnNobWVtZnMgYW5kIHJlLXBpbi4gIEkgdGhpbmsgdGhpcyB3b3JrcyBv
dXQgdG8gYmUgYmFzaWNhbGx5IHRoZSBzYW1lCnNjZW5hcmlvIGFzIGhhdmluZyB0byB3YitpbnYg
d2hlbiB3ZSBmaXJzdCBnZXQgdGhlIHBhZ2VzIGZyb20gc2htZW1mcy4KCj4gPiA+ICAtIHRoZW4g
dGhlIG1lbW9yeSBpcyBlaXRoZXIgbWFwcGVkIHRvIHVzZXJzcGFjZSBvciB2bWFwcGVkIChvciBl
dmVuCj4gPiA+ICAgIGJvdGgsIGFsdGhyb3VnaCB0aGUgbGFjayBvZiBhbGlhc2luZyB5b3UgbWVu
dGlvbmVkIHdvdWxkIHNwZWFrCj4gPiA+ICAgIGFnYWluc3QgaXQpIGFzIHdyaXRlY29tYmluZSAo
YWthIGFybSB2Nisgbm9ybWFsIHVuY2FjaGVkKS4gIERvZXMKPiA+ID4gICAgdGhlIG1hcHBpbmcg
bGl2ZSBvbiB1bnRpbCB0aGUgbWVtb3J5IGlzIGZyZWVkPwo+ID4KPiA+IChzaWRlIG5vdGUsICpt
b3N0KiBvZiB0aGUgZHJtL21zbSBzdXBwb3J0ZWQgZGV2aWNlcyBhcmUgYXJtdjgsIHRoZQo+ID4g
ZXhjZXB0aW9ucyBhcmUgODA2MCBhbmQgODA2NCB3aGljaCBhcmUgYXJtdjcuLiBJIGRvbid0IHRo
aW5rIGRybS9tc20KPiA+IHdpbGwgZXZlciBoYXZlIHRvIGRlYWwgdy8gYXJtdjYpCj4KPiBXZWxs
LCB0aGUgcG9pbnQgd2FzIHRoYXQgc3RhcnRpbmcgZnJvbSB2NiB0aGUga2VybmVscyBkbWEgdW5j
YWNoZWQKPiByZWFsbHkgaXMgd3JpdGUgY29tYmluZS4gIFNvIHRoYXQgYXBwbGllZCB0byB2NyBh
bmQgdjggYXMgd2VsbC4KCmFoaCwgZ290Y2hhCgpCUiwKLVIKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
