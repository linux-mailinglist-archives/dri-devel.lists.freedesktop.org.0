Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EBDA85BE3
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2019 09:47:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65FE36E7A4;
	Thu,  8 Aug 2019 07:46:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0E7688310
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Aug 2019 17:30:15 +0000 (UTC)
Received: by mail-ot1-x344.google.com with SMTP id s20so41953574otp.4
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Aug 2019 10:30:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GvSVwyjYkUWZmzb2UwP5yi6JZ1ykYGY6rFaP7/aYTLo=;
 b=dN7Vq0cCMdW6KXquBdqvH5K4jj227fXAbqtzZ+/QNy1C2iD1JbMiove77mKwXe0lAc
 aID6bcmK1LTHu6kpTP4PYq4a1XYFq5H/BuP73U9mY58EYaw97dH/A/WwdIEVDhvlx7Mi
 E9fo8e7qwJcRjS8H/29et5WFRkFnJKDr3o8osgXmSNTP5RqHq76dxEdpRAN5LY5+EGRT
 euFaC8LcYEBhqdohtB+LeMcbQRzKENTFirSJj2eTthp57Q9S+H6G1HCb8022hHMabFaU
 JAIvZy98J8UcTR2jPE5PDnkYyyIMi7pzJHNlXrQpIBoPod8k7RPVFIQvSotVd7G80GHW
 8wkw==
X-Gm-Message-State: APjAAAXTeHmDRZma9zT/R7Tz6qzUs4Nw1PHydp7dYkJ+s30gouwOiFhb
 AOnKa4/n06bl8k7rowZKsqB0zEa9pYQXEpGcNRp7wg==
X-Google-Smtp-Source: APXvYqw7RRBjKPo7ZfZEtmV59ny/ac5jMKhz6wAq19P1RhtP8uwSeSEl2cXGsfsujsBrMkrSAoT5zOfXD+sPwaeHIv8=
X-Received: by 2002:a6b:90c1:: with SMTP id
 s184mr10120928iod.244.1565199015080; 
 Wed, 07 Aug 2019 10:30:15 -0700 (PDT)
MIME-Version: 1.0
References: <20190805211451.20176-1-robdclark@gmail.com>
 <20190806084821.GA17129@lst.de>
 <CAJs_Fx6eh1w7c=crMoD5XyEOMzP6orLhqUewErE51cPGYmObBQ@mail.gmail.com>
 <20190806143457.GF475@lakrids.cambridge.arm.com>
 <CAJs_Fx4h6SWGmDTLBnV4nmWUFAs_Ge1inxd-dW9aDKgKqmc1eQ@mail.gmail.com>
 <20190807123807.GD54191@lakrids.cambridge.arm.com>
 <CAJs_Fx5xU2-dn3iOVqWTzAjpTaQ8BBNP_Gn_iMc-eJpOX+iXoQ@mail.gmail.com>
 <20190807164958.GA44765@lakrids.cambridge.arm.com>
In-Reply-To: <20190807164958.GA44765@lakrids.cambridge.arm.com>
From: Rob Clark <robdclark@chromium.org>
Date: Wed, 7 Aug 2019 10:30:04 -0700
Message-ID: <CAJs_Fx71T=kJEgt28TWqzw+jOahSbLQynCg83+szQW7op4xBkQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm: add cache support for arm64
To: Mark Rutland <mark.rutland@arm.com>
X-Mailman-Approved-At: Thu, 08 Aug 2019 07:46:20 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=GvSVwyjYkUWZmzb2UwP5yi6JZ1ykYGY6rFaP7/aYTLo=;
 b=FffiqU5+eIuv8kGlzf37a45hctKBFrPl36bD6mU5CnzC9YL5qpM893c3kSRhakuQZQ
 X4takvwHuxy5NPQWSrC6jaQkzchWaUx1B2uc3JsY5zG+8FLgsHbhVsLvlRlGDAQ4kKoH
 5jmnc8EUa0XC26IRhxOfNVAFjlUJkw0FvWnMQ=
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
 Christoph Hellwig <hch@lst.de>, Allison Randal <allison@lohutok.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBBdWcgNywgMjAxOSBhdCA5OjUwIEFNIE1hcmsgUnV0bGFuZCA8bWFyay5ydXRsYW5k
QGFybS5jb20+IHdyb3RlOgo+Cj4gT24gV2VkLCBBdWcgMDcsIDIwMTkgYXQgMDk6MTU6NTRBTSAt
MDcwMCwgUm9iIENsYXJrIHdyb3RlOgo+ID4gT24gV2VkLCBBdWcgNywgMjAxOSBhdCA1OjM4IEFN
IE1hcmsgUnV0bGFuZCA8bWFyay5ydXRsYW5kQGFybS5jb20+IHdyb3RlOgo+ID4gPgo+ID4gPiBP
biBUdWUsIEF1ZyAwNiwgMjAxOSBhdCAwOTozMTo1NUFNIC0wNzAwLCBSb2IgQ2xhcmsgd3JvdGU6
Cj4gPiA+ID4gT24gVHVlLCBBdWcgNiwgMjAxOSBhdCA3OjM1IEFNIE1hcmsgUnV0bGFuZCA8bWFy
ay5ydXRsYW5kQGFybS5jb20+IHdyb3RlOgo+ID4gPiA+ID4KPiA+ID4gPiA+IE9uIFR1ZSwgQXVn
IDA2LCAyMDE5IGF0IDA3OjExOjQxQU0gLTA3MDAsIFJvYiBDbGFyayB3cm90ZToKPiA+ID4gPiA+
ID4gT24gVHVlLCBBdWcgNiwgMjAxOSBhdCAxOjQ4IEFNIENocmlzdG9waCBIZWxsd2lnIDxoY2hA
bHN0LmRlPiB3cm90ZToKPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+IFRoaXMgZ29lcyBpbiB0
aGUgd3JvbmcgZGlyZWN0aW9uLiAgZHJtX2NmbHVzaF8qIGFyZSBhIGJhZCBBUEkgd2UgbmVlZCB0
bwo+ID4gPiA+ID4gPiA+IGdldCByaWQgb2YsIG5vdCBhZGQgdXNlIG9mIGl0LiAgVGhlIHJlYXNv
biBmb3IgdGhhdCBpcyB0d28tZm9sZDoKPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+ICBhKSBp
dCBkb2Vzbid0IGFkZHJlc3MgaG93IGNhY2hlIG1haW50YWluY2UgYWN0dWFsbHkgd29ya3MgaW4g
bW9zdAo+ID4gPiA+ID4gPiA+ICAgICBwbGF0Zm9ybXMuICBXaGVuIHRhbGtpbmcgYWJvdXQgYSBj
YWNoZSB3ZSB0aHJlZSBmdW5kYW1lbnRhbCBvcGVyYXRpb25zOgo+ID4gPiA+ID4gPiA+Cj4gPiA+
ID4gPiA+ID4gICAgICAgICAxKSB3cml0ZSBiYWNrIC0gdGhpcyB3cml0ZXMgdGhlIGNvbnRlbnQg
b2YgdGhlIGNhY2hlIGJhY2sgdG8gdGhlCj4gPiA+ID4gPiA+ID4gICAgICAgICAgICBiYWNraW5n
IG1lbW9yeQo+ID4gPiA+ID4gPiA+ICAgICAgICAgMikgaW52YWxpZGF0ZSAtIHRoaXMgcmVtb3Zl
IHRoZSBjb250ZW50IG9mIHRoZSBjYWNoZQo+ID4gPiA+ID4gPiA+ICAgICAgICAgMykgd3JpdGUg
YmFjayArIGludmFsaWRhdGUgLSBkbyBib3RoIG9mIHRoZSBhYm92ZQo+ID4gPiA+ID4gPgo+ID4g
PiA+ID4gPiBBZ3JlZWQgdGhhdCBkcm1fY2ZsdXNoXyogaXNuJ3QgYSBncmVhdCBBUEkuICBJbiB0
aGlzIHBhcnRpY3VsYXIgY2FzZQo+ID4gPiA+ID4gPiAoSUlVQyksIEkgbmVlZCB3YitpbnYgc28g
dGhhdCB0aGVyZSBhcmVuJ3QgZGlydHkgY2FjaGUgbGluZXMgdGhhdCBkcm9wCj4gPiA+ID4gPiA+
IG91dCB0byBtZW1vcnkgbGF0ZXIsIGFuZCBzbyB0aGF0IEkgZG9uJ3QgZ2V0IGEgY2FjaGUgaGl0
IG9uCj4gPiA+ID4gPiA+IHVuY2FjaGVkL3djIG1tYXAnaW5nLgo+ID4gPiA+ID4KPiA+ID4gPiA+
IElzIHRoZXJlIGEgY2FjaGVhYmxlIGFsaWFzIGx5aW5nIGFyb3VuZCAoZS5nLiB0aGUgbGluZWFy
IG1hcCksIG9yIGFyZQo+ID4gPiA+ID4gdGhlc2UgYWRkcmVzc2VzIG9ubHkgbWFwcGVkIHVuY2Fj
aGVkL3djPwo+ID4gPiA+ID4KPiA+ID4gPiA+IElmIHRoZXJlJ3MgYSBjYWNoZWFibGUgYWxpYXMs
IHBlcmZvcm1pbmcgYW4gaW52YWxpZGF0ZSBpc24ndCBzdWZmaWNpZW50LAo+ID4gPiA+ID4gc2lu
Y2UgYSBDUFUgY2FuIGFsbG9jYXRlIGEgbmV3IChjbGVhbikgZW50cnkgYXQgYW55IHBvaW50IGlu
IHRpbWUgKGUuZy4KPiA+ID4gPiA+IGFzIGEgcmVzdWx0IG9mIHByZWZldGNoaW5nIG9yIGFyYml0
cmFyeSBzcGVjdWxhdGlvbikuCj4gPiA+ID4KPiA+ID4gPiBJICpiZWxpZXZlKiB0aGF0IHRoZXJl
IGFyZSBub3QgYWxpYXMgbWFwcGluZ3MgKHRoYXQgSSBkb24ndCBjb250cm9sCj4gPiA+ID4gbXlz
ZWxmKSBmb3IgcGFnZXMgY29taW5nIGZyb20KPiA+ID4gPiBzaG1lbV9maWxlX3NldHVwKCkvc2ht
ZW1fcmVhZF9tYXBwaW5nX3BhZ2UoKS4uCj4gPiA+Cj4gPiA+IEFGQUlDVCwgdGhhdCdzIHJlZ3Vs
YXIgYW5vbnltb3VzIG1lbW9yeSwgc28gdGhlcmUgd2lsbCBiZSBhIGNhY2hlYWJsZQo+ID4gPiBh
bGlhcyBpbiB0aGUgbGluZWFyL2RpcmVjdCBtYXAuCj4gPgo+ID4gdGJoLCBJJ20gbm90IDEwMCUg
c3VyZSB3aGV0aGVyIHRoZXJlIGlzIGEgY2FjaGVhYmxlIGFsaWFzLCBvciB3aGV0aGVyCj4gPiBh
bnkgcG90ZW50aWFsIGxpbmVhciBtYXAgaXMgdG9ybiBkb3duLgo+Cj4gSSdtIGZhaXJseSBjb25m
aWRlbnQgdGhhdCB0aGUgbGluZWFyL2RpcmVjdCBtYXAgY2FjaGVhYmxlIGFsaWFzIGlzIG5vdAo+
IHRvcm4gZG93biB3aGVuIHBhZ2VzIGFyZSBhbGxvY2F0ZWQuIFRoZSBnbmVlcmljIHBhZ2UgYWxs
b2NhdGlvbiBjb2RlCj4gZG9lc24ndCBkbyBzbywgYW5kIEkgc2VlIG5vdGhpbmcgdGhlIHNobWVt
IGNvZGUgdG8gZG8gc28uCj4KPiBGb3IgYXJtNjQsIHdlIGNhbiB0ZWFyIGRvd24gcG9ydGlvbnMg
b2YgdGhlIGxpbmVhciBtYXAsIGJ1dCB0aGF0IGhhcyB0bwo+IGJlIGRvbmUgZXhwbGljaXRseSwg
YW5kIHRoaXMgaXMgb25seSBwb3NzaWJsZSB3aGVuIHVzaW5nIHJvZGF0YV9mdWxsLiBJZgo+IG5v
dCB1c2luZyByb2RhdGFfZnVsbCwgaXQgaXMgbm90IHBvc3NpYmxlIHRvIGR5bmFtaWNhbGx5IHRl
YXIgZG93biB0aGUKPiBjYWNoZWFibGUgYWxpYXMuCgpTbywgd2UgZG8gZW5kIHVwIHVzaW5nIEdG
UF9ISUdIVVNFUiwgd2hpY2ggYXBwZWFycyB0byBnZXQgcGFzc2VkIHRocnUKd2hlbiBzaG1lbSBn
ZXRzIHRvIHRoZSBwb2ludCBvZiBhY3R1YWxseSBhbGxvY2F0aW5nIHBhZ2VzLi4gbm90IHN1cmUK
aWYgdGhhdCBqdXN0IGVuZHMgdXAgYmVpbmcgYSBoaW50LCBvciBpZiBpdCBndWFyYW50ZWVzIHRo
YXQgd2UgZG9uJ3QKZ2V0IHNvbWV0aGluZyBpbiB0aGUgbGluZWFyIG1hcC4KCihCZWFyIHdpdGgg
bWUgd2hpbGUgSSAicGFnZSIgdGhpcyBhbGwgYmFjayBpbi4uIGxhc3QgdGltZSBJIGR1ZyB0aHJ1
CnRoZSBzaG1lbSBjb2RlIHdhcyBwcm9iYWJseSBwcmUtYXJtdjgsIG9yIGF0IGxlYXN0IGJlZm9y
ZSBJIGhhZCBhbnkKYXJtdjggaHcpCgpCUiwKLVIKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
