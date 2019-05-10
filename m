Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 510291A014
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2019 17:25:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B784A898C2;
	Fri, 10 May 2019 15:25:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com
 [IPv6:2607:f8b0:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9572898C2;
 Fri, 10 May 2019 15:25:50 +0000 (UTC)
Received: by mail-oi1-x243.google.com with SMTP id v10so4824526oib.1;
 Fri, 10 May 2019 08:25:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=lKwN54SK+W6O9fjruMh2Yrp66lpefmr9JPdcP+S36Vk=;
 b=W4Bk9snjGrxpG1pVozF1WWlUuxFQk2JvTZqg0rzbzjO0LpfxNxQwauM1dvr84irJPL
 PO+cCwAtiGRJIxq6LBOwAppC85xEOcxARpHk61EvQL4ths63baa7U7y6Huj+i6RM3aUg
 GGh5H1ejFkNH+jz9xWVAg+XoLsrX89szHLaU7PN/bjkvQwVZht8KuXgh+RcDeRgA21Y+
 NPYQCZC1p7k0DluC8V04pqOyctJY2DYjKQ/sOyE2soJbsDYu7l4WUHBjgIZMaDiDJFtR
 TUTzhDf05wCKhdUmS2m2kDWifglz9V9FrlRmnu2jgpQQf3uP465HQKBAbGYCENpzQCzj
 MXAg==
X-Gm-Message-State: APjAAAX1pjR2knzo3/UDAipzmAHyUyrJJ7RCGthrkkGuWT2Phx9TjvRI
 Em5Akx+qcqi7kvGoC+wswU0QNzup10ZFTX03kgc=
X-Google-Smtp-Source: APXvYqxMoxs8eeJi15rqKro5+GmOfVwMuCoN5hY4PYXTEvCmTRz9NKHdGZOHdS5/jU0ofKopRhRfCK6E+Z/P/ewrlO0=
X-Received: by 2002:aca:d90a:: with SMTP id q10mr4730169oig.65.1557501950024; 
 Fri, 10 May 2019 08:25:50 -0700 (PDT)
MIME-Version: 1.0
References: <20181120185814.13362-1-Kenny.Ho@amd.com>
 <20190509210410.5471-1-Kenny.Ho@amd.com>
 <20190509210410.5471-5-Kenny.Ho@amd.com>
 <f63c8d6b-92a4-2977-d062-7e0b7036834e@gmail.com>
 <CAOWid-fpHqvq35C+gfHmLnuHM9Lj+iiHFXE=3RPrkAiFL2=wvQ@mail.gmail.com>
 <1ca1363e-b39c-c299-1d24-098b1059f7ff@amd.com>
In-Reply-To: <1ca1363e-b39c-c299-1d24-098b1059f7ff@amd.com>
From: Kenny Ho <y2kenny@gmail.com>
Date: Fri, 10 May 2019 11:25:38 -0400
Message-ID: <CAOWid-eVz4w-hN=4tPZ1AOu54xMH_2ztDDZaMEKRCAeBgt9Dyw@mail.gmail.com>
Subject: Re: [RFC PATCH v2 4/5] drm,
 cgroup: Add total GEM buffer allocation limit
To: "Koenig, Christian" <Christian.Koenig@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=lKwN54SK+W6O9fjruMh2Yrp66lpefmr9JPdcP+S36Vk=;
 b=MzkCyMwYP6vwvvOjpLsMr1FlOuh2aoSNNH4ivWkC7vz7RDHLCfPIa6PQ0cDphZUWli
 ZL4ccEZcjzcHxoez+sUBmG6KB3GXXo6JKartpZB87cBcQ3kEEBHNKbXgIfZ3004OvQmy
 aeFhzsmcxtQJxQgsfJzYXPiR5n/SS87g57B4ks4ruWHPckfFAYvCAWhuSUQzDOv7cENV
 /0tQoVOdezg84O2bBx67TFiOoYzHSIo7N0RHW8jpz4ernghPEO2tRCunQiLTevYRQAMt
 yXiaRGRB883oEV+r7F/D08/8ZuuSm9/z3uh+79uHZrXZPefFfMch+bQecK3Y4L1i1WTH
 TfmQ==
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
Cc: "sunnanyong@huawei.com" <sunnanyong@huawei.com>, "Ho,
 Kenny" <Kenny.Ho@amd.com>, Brian Welty <brian.welty@intel.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Tejun Heo <tj@kernel.org>, "cgroups@vger.kernel.org" <cgroups@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBNYXkgMTAsIDIwMTkgYXQgMTE6MDggQU0gS29lbmlnLCBDaHJpc3RpYW4KPENocmlz
dGlhbi5Lb2VuaWdAYW1kLmNvbT4gd3JvdGU6Cj4gQW0gMTAuMDUuMTkgdW0gMTY6NTcgc2Nocmll
YiBLZW5ueSBIbzoKPiA+IE9uIEZyaSwgTWF5IDEwLCAyMDE5IGF0IDg6MjggQU0gQ2hyaXN0aWFu
IEvDtm5pZwo+ID4gPGNrb2VuaWcubGVpY2h0enVtZXJrZW5AZ21haWwuY29tPiB3cm90ZToKPiA+
PiBBbSAwOS4wNS4xOSB1bSAyMzowNCBzY2hyaWViIEtlbm55IEhvOgo+IFNvIHRoZSBkcm0gY2dy
b3VwIGNvbnRhaW5lciBpcyBzZXBhcmF0ZSB0byBvdGhlciBjZ3JvdXAgY29udGFpbmVycz8KSW4g
Y2dyb3VwLXYxLCB3aGljaCBpcyBtb3N0IHdpZGVseSBkZXBsb3llZCBjdXJyZW50bHksIGFsbCBj
b250cm9sbGVycwpoYXZlIHRoZWlyIG93biBoaWVyYXJjaHkgKHNlZSAvc3lzL2ZzL2Nncm91cC8p
LiAgSW4gY2dyb3VwLXYyLCB0aGUKaGllcmFyY2h5IGlzIHVuaWZpZWQgYnkgaW5kaXZpZHVhbCBj
b250cm9sbGVycyBjYW4gYmUgZGlzYWJsZWQgKEkKYmVsaWV2ZSwgSSBhbSBub3Qgc3VwZXIgZmFt
aWxpYXIgd2l0aCB2Mi4pCgo+IEluIG90aGVyIHdvcmRzIGFzIGxvbmcgYXMgdXNlcnNwYWNlIGRv
ZXNuJ3QgY2hhbmdlLCB0aGlzIHdvdWxkbid0IGhhdmUKPiBhbnkgZWZmZWN0PwpBcyBmYXIgYXMg
dGhpbmdzIGxpa2UgZG9ja2VyIGFuZCBwb2RtYW4gaXMgY29uY2VybiwgeWVzLiAgSSBhbSBub3QK
c3VyZSBhYm91dCB0aGUgYmVoYXZpb3VyIG9mIG90aGVycyBsaWtlIGx4YywgbHhkLCBldGMuIGJl
Y2F1c2UgSQpoYXZlbid0IHVzZWQgdGhvc2UgbXlzZWxmLgoKPiBXZWxsIHRoYXQgaXMgdW5leHBl
Y3RlZCBjYXVzZSB0aGVuIGEgcHJvY2Vzc2VzIHdvdWxkIGJlIGluIGRpZmZlcmVudAo+IGdyb3Vw
cyBmb3IgZGlmZmVyZW50IGNvbnRyb2xsZXJzLCBidXQgaWYgdGhhdCdzIHJlYWxseSB0aGUgY2Fz
ZSB0aGF0Cj4gd291bGQgY2VydGFpbmx5IHdvcmsuCkkgYmVsaWV2ZSB0aGlzIGlzIGEgcG9zc2li
aWxpdHkgZm9yIHYxIGFuZCBpcyB3aHkgZm9sa3MgY2FtZSB1cCB3aXRoCnRoZSB1bmlmaWVkIGhp
ZXJhcmNoeSBpbiB2MiB0byBzb2x2ZSBzb21lIG9mIHRoZSBpc3N1ZXMuCmh0dHBzOi8vd3d3Lmtl
cm5lbC5vcmcvZG9jL2h0bWwvbGF0ZXN0L2FkbWluLWd1aWRlL2Nncm91cC12Mi5odG1sI2lzc3Vl
cy13aXRoLXYxLWFuZC1yYXRpb25hbGVzLWZvci12MgoKUmVnYXJkcywKS2VubnkKCj4gPiBPbiB0
aGUgb3RoZXIgaGFuZCwgaWYgdGhlcmUgYXJlIGV4cGVjdGF0aW9ucyBmb3IgcmVzb3VyY2UgbWFu
YWdlbWVudAo+ID4gYmV0d2VlbiBjb250YWluZXJzLCBJIHdvdWxkIGxpa2UgdG8ga25vdyB3aG8g
aXMgdGhlIGV4cGVjdGVkIG1hbmFnZXIKPiA+IGFuZCBob3cgZG9lcyBpdCBmaXQgaW50byB0aGUg
Y29uY2VwdCBvZiBjb250YWluZXIgKHdoaWNoIGVuZm9yY2Ugc29tZQo+ID4gbGV2ZWwgb2YgaXNv
bGF0aW9uLikgIE9uZSBwb3NzaWJsZSBtYW5hZ2VyIG1heSBiZSB0aGUgZGlzcGxheSBzZXJ2ZXIu
Cj4gPiBCdXQgYXMgbG9uZyBhcyB0aGUgZGlzcGxheSBzZXJ2ZXIgaXMgaW4gYSBwYXJlbnQgY2dy
b3VwIG9mIHRoZSBhcHBzJwo+ID4gY2dyb3VwLCB0aGUgYXBwcyBjYW4gc3RpbGwgaW1wb3J0IGhh
bmRsZXMgZnJvbSB0aGUgZGlzcGxheSBzZXJ2ZXIKPiA+IHVuZGVyIHRoZSBjdXJyZW50IGltcGxl
bWVudGF0aW9uLiAgTXkgdW5kZXJzdGFuZGluZyBpcyB0aGF0IHRoaXMgaXMKPiA+IG1vc3QgbGlr
ZWx5IHRoZSBjYXNlLCB3aXRoIHRoZSBkaXNwbGF5IHNlcnZlciBzaW1wbHkgc2l0dGluZyBhdCB0
aGUKPiA+IGRlZmF1bHQvcm9vdCBjZ3JvdXAuICBCdXQgSSBjZXJ0YWlubHkgd2FudCB0byBoZWFy
IG1vcmUgYWJvdXQgb3RoZXIKPiA+IHVzZSBjYXNlcyAoZm9yIGV4YW1wbGUsIGlzIHJ1bm5pbmcg
bXVsdGlwbGUgZGlzcGxheSBzZXJ2ZXJzIG9uIGEKPiA+IHNpbmdsZSBob3N0IGEgcmVhbGlzdGlj
IHBvc3NpYmlsaXR5PyAgQXJlIHRoZXJlIHBlb3BsZSBydW5uaW5nCj4gPiBtdWx0aXBsZSBkaXNw
bGF5IHNlcnZlcnMgaW5zaWRlIHBlZXIgY29udGFpbmVycz8gIElmIHNvLCBob3cgZG8gdGhleQo+
ID4gY29vcmRpbmF0ZSByZXNvdXJjZXM/KQo+Cj4gV2UgZGVmaW5pdGVseSBoYXZlIHNpdHVhdGlv
bnMgd2l0aCBtdWx0aXBsZSBkaXNwbGF5IHNlcnZlcnMgcnVubmluZwo+IChqdXN0IHRoaW5rIG9m
IFZSKS4KPgo+IEkganVzdCBjYW4ndCBzYXkgaWYgdGhleSBjdXJyZW50bHkgdXNlIGNncm91cHMg
aW4gYW55IHdheS4KPgo+IFRoYW5rcywKPiBDaHJpc3RpYW4uCj4KPiA+Cj4gPiBJIHNob3VsZCBw
cm9iYWJseSBzdW1tYXJpemUgc29tZSBvZiB0aGVzZSBpbnRvIHRoZSBjb21taXQgbWVzc2FnZS4K
PiA+Cj4gPiBSZWdhcmRzLAo+ID4gS2VubnkKPiA+Cj4gPgo+ID4KPiA+PiBDaHJpc3RpYW4uCj4g
Pj4KPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
