Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FC03215307
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jul 2020 09:19:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 371966E287;
	Mon,  6 Jul 2020 07:19:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x144.google.com (mail-il1-x144.google.com
 [IPv6:2607:f8b0:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DB556E405
 for <dri-devel@lists.freedesktop.org>; Sat,  4 Jul 2020 10:28:51 +0000 (UTC)
Received: by mail-il1-x144.google.com with SMTP id k6so29125783ili.6
 for <dri-devel@lists.freedesktop.org>; Sat, 04 Jul 2020 03:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=d6MVUUUiUZ/bhtH2VAQ03gjFBPUDLQ1YkvRus2a1Mlo=;
 b=XiWxA3m31JFaQ+mz5kCbQf2IwRGT6mUu1B/lZblRXRO8IlLsbz/OnJy0/frpHJ/CV0
 LIdILgFdp5R0ARxu3Rh4n6BNeCyylUo72QIrg1zKCp0Tb6SDEjonSX4i8UIfwY4cuaKu
 mDiiggfIuCRigMOAV3FNhhMEvKPFhZYOGHgvdWQezTeoayDm9xvl8/T8wWojPAswvqt8
 osbSGPR52diaqebXjARk2VnefI/2NKhE+DC0yBudXPgoXml5BC21gsPT744DlJl7uPBv
 7mmHdHP/jXe4gA0SliOy1tto4JUr4iX4sQUbpv6D4JgJWZ3IgefHX1mAKaanraTlIEdr
 Nu2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=d6MVUUUiUZ/bhtH2VAQ03gjFBPUDLQ1YkvRus2a1Mlo=;
 b=QQVF6MW0rZ/K80NTerulgBL11i2rUNRlW0CF0IUcntAXJSSGc7lbQlKpzEqvp2Ga8a
 Xp22DQ49r75T0fL67YlmG//tDpmVy7SCR7EInKTvhGA9I3HgW9GSbDHsT3emfODbhkkh
 2wQWm2sTeCGXSReok+TUbqCgLnpxTezZiLSaNuSz58u0IU1h0KfAFsQ0SFkDeosCzrXM
 /NR+vBsLkL0FaJy8BmlZmKXaHINvO2/FLnLxGWkgFAKoVLMWv6KDDaM5X7hMltej76/T
 rWLVSsG1UquA/Dl1a3t1B+EPqKGCjipNad+8K+XRqDY/mrGDnH2Y1j5PCVBzPyBbsN+i
 MjUg==
X-Gm-Message-State: AOAM533m5duhH3sq1KfvyWGMDBntz00iq+80CMZGC3yFL72VvyR1tVkx
 cSzXdxqoGN//ib7vvomIgOdI83Osc/rk/gS/zL4=
X-Google-Smtp-Source: ABdhPJwHCZ64dKNUzlzI7XDW+kwEnMHynN76AwRs4uNaGRVxWWcWCidxkyxY8FZITDR284KtKQEMNNfZTm4vASzNsz8=
X-Received: by 2002:a92:4b08:: with SMTP id m8mr20423899ilg.150.1593858530565; 
 Sat, 04 Jul 2020 03:28:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200704102535.189647-1-peron.clem@gmail.com>
In-Reply-To: <20200704102535.189647-1-peron.clem@gmail.com>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Sat, 4 Jul 2020 12:28:39 +0200
Message-ID: <CAJiuCceE8bMFwyZ5Nf3CxbczDYJZ64UhO=syqcWKc6knpK7sNQ@mail.gmail.com>
Subject: Re: [PATCH v2 00/14] Add regulator devfreq support to Panfrost
To: Rob Herring <robh@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, 
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>, 
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, 
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>
X-Mailman-Approved-At: Mon, 06 Jul 2020 07:19:18 +0000
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
Cc: linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpPbiBTYXQsIDQgSnVsIDIwMjAgYXQgMTI6MjUsIENsw6ltZW50IFDDqXJvbiA8cGVyb24u
Y2xlbUBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gSGksCj4KPiBUaGlzIHNlcmllIGNsZWFucyBhbmQg
YWRkcyByZWd1bGF0b3Igc3VwcG9ydCB0byBQYW5mcm9zdCBkZXZmcmVxLgo+IFRoaXMgaXMgbW9z
dGx5IGJhc2VkIG9uIGNvbW1lbnQgZm9yIHRoZSBmcmVzaGx5IGludHJvZHVjZWQgbGltYQo+IGRl
dmZyZXEuCj4KPiBXZSBuZWVkIHRvIGFkZCByZWd1bGF0b3Igc3VwcG9ydCBiZWNhdXNlIG9uIEFs
bHdpbm5lciB0aGUgR1BVIE9QUAo+IHRhYmxlIGRlZmluZXMgYm90aCBmcmVxdWVuY2llcyBhbmQg
dm9sdGFnZXMuCj4KPiBGaXJzdCBwYXRjaGVzIFswMS0wN10gc2hvdWxkIG5vdCBjaGFuZ2UgdGhl
IGFjdHVhbCBiZWhhdmlvcgo+IGFuZCBpbnRyb2R1Y2UgYSBwcm9wZXIgcGFuZnJvc3RfZGV2ZnJl
cSBzdHJ1Y3QuCj4KPiBSZWdhcmRzLAo+IENsw6ltZW50CgpDaGFuZ2VzIHNpbmNlIHYxOgogLSBD
b2xsZWN0IFN0ZXZlbiBQcmljZSByZXZpZXdlZC1ieSB0YWdzCiAtIEZpeCBzcGlubG9jayBjb21t
ZW50CiAtIERyb3AgT1BQIGNsb2NrLW5hbWUgcGF0aAogLSBEcm9wIGRldmljZV9wcm9wZXJ0eV90
ZXN0IHBhdGNoCiAtIEFkZCByZW5hbWUgZXJyb3IgbGFiZWxzIHBhdGNoCgo+Cj4gQ2zDqW1lbnQg
UMOpcm9uICgxNCk6Cj4gICBkcm0vcGFuZnJvc3Q6IGF2b2lkIHN0YXRpYyBkZWNsYXJhdGlvbgo+
ICAgZHJtL3BhbmZyb3N0OiBjbGVhbiBoZWFkZXJzIGluIGRldmZyZXEKPiAgIGRybS9wYW5mcm9z
dDogZG9uJ3QgdXNlIHBmZGV2ZnJlcS5idXN5X2NvdW50IHRvIGtub3cgaWYgaHcgaXMgaWRsZQo+
ICAgZHJtL3BhbmZyb3N0OiBpbnRyb2R1Y2UgcGFuZnJvc3RfZGV2ZnJlcSBzdHJ1Y3QKPiAgIGRy
bS9wYW5mcm9zdDogdXNlIHNwaW5sb2NrIGluc3RlYWQgb2YgYXRvbWljCj4gICBkcm0vcGFuZnJv
c3Q6IHByb3Blcmx5IGhhbmRsZSBlcnJvciBpbiBwcm9iZQo+ICAgZHJtL3BhbmZyb3N0OiByZW5h
bWUgZXJyb3IgbGFiZWxzIGluIGRldmljZV9pbml0Cj4gICBkcm0vcGFuZnJvc3Q6IG1vdmUgZGV2
ZnJlcV9pbml0KCkvZmluaSgpIGluIGRldmljZQo+ICAgZHJtL3BhbmZyb3N0OiBkeW5hbWljYWxs
eSBhbGxvYyByZWd1bGF0b3JzCj4gICBkcm0vcGFuZnJvc3Q6IGFkZCByZWd1bGF0b3JzIHRvIGRl
dmZyZXEKPiAgIGFybTY0OiBkZWZjb25maWc6IEVuYWJsZSBkZXZmcmVxIGNvb2xpbmcgZGV2aWNl
Cj4gICBhcm02NDogZHRzOiBhbGx3aW5uZXI6IGg2OiBBZGQgY29vbGluZyBtYXAgZm9yIEdQVQo+
ICAgW0RPIE5PVCBNRVJHRV0gYXJtNjQ6IGR0czogYWxsd2lubmVyOiBoNjogQWRkIEdQVSBPUFAg
dGFibGUKPiAgIFtETyBOT1QgTUVSR0VdIGFybTY0OiBkdHM6IGFsbHdpbm5lcjogZm9yY2UgR1BV
IHJlZ3VsYXRvciB0byBiZSBhbHdheXMKPgo+ICAuLi4vZHRzL2FsbHdpbm5lci9zdW41MGktaDYt
YmVlbGluay1nczEuZHRzICAgfCAgIDEgKwo+ICBhcmNoL2FybTY0L2Jvb3QvZHRzL2FsbHdpbm5l
ci9zdW41MGktaDYuZHRzaSAgfCAxMDIgKysrKysrKysrKysKPiAgYXJjaC9hcm02NC9jb25maWdz
L2RlZmNvbmZpZyAgICAgICAgICAgICAgICAgIHwgICAxICsKPiAgZHJpdmVycy9ncHUvZHJtL3Bh
bmZyb3N0L3BhbmZyb3N0X2RldmZyZXEuYyAgIHwgMTY1ICsrKysrKysrKysrKy0tLS0tLQo+ICBk
cml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZGV2ZnJlcS5oICAgfCAgMzAgKysrLQo+
ICBkcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZGV2aWNlLmMgICAgfCAgNjEgKysr
Ky0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZGV2aWNlLmggICAgfCAg
MTQgKy0KPiAgZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2Rydi5jICAgICAgIHwg
IDE1ICstCj4gIGRyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9qb2IuYyAgICAgICB8
ICAxMCArLQo+ICA5IGZpbGVzIGNoYW5nZWQsIDI5MCBpbnNlcnRpb25zKCspLCAxMDkgZGVsZXRp
b25zKC0pCj4KPiAtLQo+IDIuMjUuMQo+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbAo=
