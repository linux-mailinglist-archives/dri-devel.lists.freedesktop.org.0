Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3242036CBD2
	for <lists+dri-devel@lfdr.de>; Tue, 27 Apr 2021 21:42:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3A456E9C5;
	Tue, 27 Apr 2021 19:41:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 403D66E9BC
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Apr 2021 19:41:54 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id i24so11785615edy.8
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Apr 2021 12:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=q7b75r3LUOYsDlkB01o8ziHA86zvHGuBm+tIXfSHuHI=;
 b=zUMpjw3LVLPxLJm7OACGak7kh3YaooA8gosFyZBZyHgz3xeant4YJPf5I5wrP+3GOD
 6Bd5eQD3EbnZQv8tHlhcXCR4k7FkHUUgQwrCCHCscblfSq9ljI0dIJvYHJlLs/3VWNCT
 x6wRM7h6tcgcGCZSeZTzoNbbqV4rhjoiMZdF4sxaqYHyOyCZX/pseyaIe0QvH64RNu73
 o2I06+DS7x/r+rDxhmcw+PGOsfqGCTtgsu8HDJoyDTcaZMhNXA8+EToz84YHFavAJl+z
 bYx6N+ZtAi89cD6B+ztqInS9EsAVh0/tsGMIXX3Dt7Wu3qg7wxDTDpyUGr0EinS2R/wz
 wicw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=q7b75r3LUOYsDlkB01o8ziHA86zvHGuBm+tIXfSHuHI=;
 b=MhiYLt5vCQ0T5AgmcuBC3mpJSPxt5J12J7ae7rts+67El5dvbNAYa1g+czM97/UOMX
 0E3NZNd3fQNXZWJGcUWWatQQfr5CUUoPTVQdYgyOg8bdGlb44pGJLhNaamVbf+ExeiT1
 ZeZjWz/dfWLIyhcoFIdV3VYtHdeDPfyxY4b1kVW2APac8aI9RM/hvUprnuyxnSxh/bF0
 KRLVCEIE6I3Ad78vIOhae4SGsuAFva5OI4sMZ88xFQgkdFTTtcITkJ0LpkFsW9HzYpWn
 A6ODVH/HBjN3F6347pi0gzeKHKXYuaGxC3vB3btg8oHcyPUT7HeqIcgl9+M3FpceApf2
 q9Rw==
X-Gm-Message-State: AOAM530+ShWMq1O7vEuV942dVqv977YgN7JyH5kMNPFbrSkxV4ONjXCM
 pJpiXgGkS/d600ETFkFcVVLIO2c8dSIBmd35Up4hGA==
X-Google-Smtp-Source: ABdhPJxN3hzAuVRjS1EwQDI9UF8XyyAM/WQgOAUMsNR2s93y+WTfyCk8lC21jbyrmbmcFXCRSg4LtsBYe01tTAyy2Dw=
X-Received: by 2002:a05:6402:1013:: with SMTP id
 c19mr6430002edu.213.1619552512696; 
 Tue, 27 Apr 2021 12:41:52 -0700 (PDT)
MIME-Version: 1.0
References: <CAAxE2A4mpapnCE7uw8GNWkaRR4jXeoz9qa9j=9XknjR3yeq3YQ@mail.gmail.com>
 <CAPj87rMn_gabTdZpHGQVa16Log8xFe8fvhcL_WSC6tyOMvmY=w@mail.gmail.com>
 <CAOFGe96c1SxHiUBzapbVFx1h0aOwF=X8hcStVZmrw4OjrrG+Zg@mail.gmail.com>
 <CAPj87rPSW13nxz2n5E+n0JYcwGR3mFWJAG2kYaaoav7A-ZVD2g@mail.gmail.com>
 <CAKMK7uHyTiFWwQWdxVk1am+KoFA9DsTnJ658CAhzBYOyg7AdsA@mail.gmail.com>
 <CAPj87rM=qf78kUvys1irnR8Djh=CLjRdQJt1V4je82-=+yPWYw@mail.gmail.com>
 <CAKMK7uEAu4FgYwN9t9AMCqD2nVbkSRbGP3tST4nY1nKP26+vxA@mail.gmail.com>
 <CAPj87rOfv0w8jF4CO8PUHQXTfq+2GE=BDmRRWjOMkQ0wH3CPAA@mail.gmail.com>
 <CAAxE2A5pJ-D7AFbDJLKPDztr=yzOSDSm=3HrnJOWr3r96_KOQQ@mail.gmail.com>
 <YIfFC3YST0cfzd3l@phenom.ffwll.local>
 <CAAxE2A6APcJBwnbq58HOqc5bkHMsrzpiNnrso85kfBkRowwz+g@mail.gmail.com>
 <fada1543-612d-369e-765c-f90b718c2cfa@gmail.com>
 <CAAxE2A7a5+q2j1txN-FxWBvKOoPSRKAZ9iPPeTSjMZDbgJCU-A@mail.gmail.com>
 <CAKMK7uHXSnDetsK1VG-X4ZwUZdA819wUKd=YMgqF=yvAQ6Y2vw@mail.gmail.com>
 <CAAxE2A4BhDZL2rrV1KEXPzmKnOq4DXmkFm=4K5XZoY-Cj0uT=Q@mail.gmail.com>
 <735e0d2e-f2c9-c546-ea6c-b5bbb0fe03a6@gmail.com>
 <CAAxE2A4FwZ11_opL++TPUViTOD6ZpV5b3MR+rTDUPvzqYz-oeQ@mail.gmail.com>
 <23ea06c825279c7a9f7678b335c7f89437d387ed.camel@pengutronix.de>
In-Reply-To: <23ea06c825279c7a9f7678b335c7f89437d387ed.camel@pengutronix.de>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Tue, 27 Apr 2021 14:41:41 -0500
Message-ID: <CAOFGe95C78mqV-8-o7PgZ1RZu-OJATVzK4wsS2k9ojXh6ba-tA@mail.gmail.com>
Subject: Re: [Mesa-dev] [RFC] Linux Graphics Next: Explicit fences everywhere
 and no BO fences - initial proposal
To: Lucas Stach <l.stach@pengutronix.de>
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
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>,
 ML Mesa-dev <mesa-dev@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VHJ5aW5nIHRvIGZpZ3VyZSBvdXQgd2hpY2ggZS1tYWlsIGluIHRoaXMgbWVzcyBpcyB0aGUgcmln
aHQgb25lIHRvIHJlcGx5IHRvLi4uLgoKT24gVHVlLCBBcHIgMjcsIDIwMjEgYXQgMTI6MzEgUE0g
THVjYXMgU3RhY2ggPGwuc3RhY2hAcGVuZ3V0cm9uaXguZGU+IHdyb3RlOgo+Cj4gSGksCj4KPiBB
bSBEaWVuc3RhZywgZGVtIDI3LjA0LjIwMjEgdW0gMDk6MjYgLTA0MDAgc2NocmllYiBNYXJlayBP
bMWhw6FrOgo+ID4gT2suIFNvIHRoYXQgd291bGQgb25seSBtYWtlIHRoZSBmb2xsb3dpbmcgdXNl
IGNhc2VzIGJyb2tlbiBmb3Igbm93Ogo+ID4gLSBhbWQgcmVuZGVyIC0+IGV4dGVybmFsIGdwdQoK
QXNzdW1pbmcgc2FpZCBleHRlcm5hbCBHUFUgZG9lc24ndCBzdXBwb3J0IG1lbW9yeSBmZW5jZXMu
ICBJZiB3ZSBkbwphbWRncHUgYW5kIGk5MTUgYXQgdGhlIHNhbWUgdGltZSwgdGhhdCBjb3ZlcnMg
YmFzaWNhbGx5IG1vc3Qgb2YgdGhlCmV4dGVybmFsIEdQVSB1c2UtY2FzZXMuICBPZiBjb3Vyc2Us
IHdlJ2Qgd2FudCB0byBjb252ZXJ0IG5vdXZlYXUgYXMKd2VsbCBmb3IgdGhlIHJlc3QuCgo+ID4g
LSBhbWQgdmlkZW8gZW5jb2RlIC0+IG5ldHdvcmsgZGV2aWNlCj4KPiBGV0lXLCAib25seSIgYnJl
YWtpbmcgYW1kIHJlbmRlciAtPiBleHRlcm5hbCBncHUgd2lsbCBtYWtlIHVzIHByZXR0eQo+IHVu
aGFwcHksIGFzIHdlIGhhdmUgc29tZSBjYXNlcyB3aGVyZSB3ZSBhcmUgY29tYmluaW5nIGFuIEFN
RCBBUFUgd2l0aCBhCj4gRlBHQSBiYXNlZCBncmFwaGljcyBjYXJkLiBJIGNhbid0IGdvIGludG8g
dGhlIHNwZWNpZmljcyBvZiB0aGlzIHVzZS0KPiBjYXNlIHRvbyBtdWNoIGJ1dCBiYXNpY2FsbHkg
dGhlIEFNRCBncmFwaGljcyBpcyByZW5kZXJpbmcgY29udGVudCB0aGF0Cj4gZ2V0cyBjb21wb3Np
dGVkIG9uIHRvcCBvZiBhIGxpdmUgdmlkZW8gcGlwZWxpbmUgcnVubmluZyB0aHJvdWdoIHRoZQo+
IEZQR0EuCgpJIHRoaW5rIGl0J3Mgd29ydGggdGFraW5nIGEgc3RlcCBiYWNrIGFuZCBhc2tpbmcg
d2hhdCdzIGJlaW5nIGhlcmUKYmVmb3JlIHdlIGZyZWFrIG91dCB0b28gbXVjaC4gIElmIHdlIGRv
IGdvIHRoaXMgcm91dGUsIGl0IGRvZXNuJ3QgbWVhbgp0aGF0IHlvdXIgRlBHQSB1c2UtY2FzZSBj
YW4ndCB3b3JrLCBpdCBqdXN0IG1lYW5zIGl0IHdvbid0IHdvcmsKb3V0LW9mLXRoZSBib3ggYW55
bW9yZS4gIFlvdSdsbCBoYXZlIHRvIHNlcGFyYXRlIGV4ZWN1dGlvbiBhbmQgbWVtb3J5CmRlcGVu
ZGVuY2llcyBpbnNpZGUgeW91ciBGUEdBIGRyaXZlci4gIFRoYXQncyBzdGlsbCBub3QgZ3JlYXQg
YnV0IGl0J3MKbm90IGFzIGJhZCBhcyB5b3UgbWF5YmUgbWFkZSBpdCBzb3VuZC4KCj4gPiBXaGF0
IGFib3V0IHRoZSBjYXNlIHdoZW4gd2UgZ2V0IGEgYnVmZmVyIGZyb20gYW4gZXh0ZXJuYWwgZGV2
aWNlIGFuZAo+ID4gd2UncmUgc3VwcG9zZWQgdG8gbWFrZSBpdCAiYnVzeSIgd2hlbiB3ZSBhcmUg
dXNpbmcgaXQsIGFuZCB0aGUKPiA+IGV4dGVybmFsIGRldmljZSB3YW50cyB0byB3YWl0IHVudGls
IHdlIHN0b3AgdXNpbmcgaXQ/IElzIGl0IHNvbWV0aGluZwo+ID4gdGhhdCBjYW4gaGFwcGVuLCB0
aHVzIHR1cm5pbmcgImV4dGVybmFsIC0+IGFtZCIgaW50byAiZXh0ZXJuYWwgPC0+Cj4gPiBhbWQi
Pwo+Cj4gWmVyby1jb3B5IHRleHR1cmUgc2FtcGxpbmcgZnJvbSBhIHZpZGVvIGlucHV0IGNlcnRh
aW5seSBhcHByZWNpYXRlcwo+IHRoaXMgdmVyeSBtdWNoLiBUcnlpbmcgdG8gcGFzcyB0aGUgcmVu
ZGVyIGZlbmNlIHRocm91Z2ggdGhlIHZhcmlvdXMKPiBsYXllcnMgb2YgdXNlcnNwYWNlIHRvIGJl
IGFibGUgdG8gdGVsbCB3aGVuIHRoZSB2aWRlbyBpbnB1dCBjYW4gcmV1c2UgYQo+IGJ1ZmZlciBp
cyBhIGdyZWF0IGV4cGVyaWVuY2UgaW4geWFrIHNoYXZpbmcuIEFsbG93aW5nIHRoZSB2aWRlbyBp
bnB1dAo+IHRvIHJldXNlIHRoZSBidWZmZXIgYXMgc29vbiBhcyB0aGUgcmVhZCBkbWFfZmVuY2Ug
ZnJvbSB0aGUgR1BVIGlzCj4gc2lnbmFsZWQgaXMgbXVjaCBtb3JlIHN0cmFpZ2h0IGZvcndhcmQu
CgpPaCwgaXQncyBkZWZpbml0ZWx5IHdvcnNlIHRoYW4gdGhhdC4gIEV2ZXJ5IHdpbmRvdyBzeXN0
ZW0gaW50ZXJhY3Rpb24KaXMgYmktZGlyZWN0aW9uYWwuICBUaGUgWCBzZXJ2ZXIgaGFzIHRvIHdh
aXQgb24gdGhlIGNsaWVudCBiZWZvcmUKY29tcG9zaXRpbmcgZnJvbSBpdCBhbmQgdGhlIGNsaWVu
dCBoYXMgdG8gd2FpdCBvbiBYIGJlZm9yZSByZS11c2luZwp0aGF0IGJhY2stYnVmZmVyLiAgT2Yg
Y291cnNlLCB3ZSBjYW4gYnJlYWsgdGhhdCBsYXRlciBkZXBlbmRlbmN5IGJ5CmRvaW5nIGEgZnVs
bCBDUFUgd2FpdCBidXQgdGhhdCdzIGdvaW5nIHRvIG1lYW4gZWl0aGVyIG1vcmUgbGF0ZW5jeSBv
cgpyZXNlcnZpbmcgbW9yZSBiYWNrIGJ1ZmZlcnMuICBUaGVyZSdzIG5vIGdvb2QgY2xlYW4gd2F5
IHRvIGNsYWltIHRoYXQKYW55IG9mIHRoaXMgaXMgb25lLWRpcmVjdGlvbmFsLgoKLS1KYXNvbgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
