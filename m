Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 188B9845CF
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2019 09:27:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F7CF6E634;
	Wed,  7 Aug 2019 07:26:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 474B66E388
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Aug 2019 14:35:02 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C162B344;
 Tue,  6 Aug 2019 07:35:01 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BD5F23F706;
 Tue,  6 Aug 2019 07:34:59 -0700 (PDT)
Date: Tue, 6 Aug 2019 15:34:57 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Rob Clark <robdclark@chromium.org>
Subject: Re: [PATCH 1/2] drm: add cache support for arm64
Message-ID: <20190806143457.GF475@lakrids.cambridge.arm.com>
References: <20190805211451.20176-1-robdclark@gmail.com>
 <20190806084821.GA17129@lst.de>
 <CAJs_Fx6eh1w7c=crMoD5XyEOMzP6orLhqUewErE51cPGYmObBQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJs_Fx6eh1w7c=crMoD5XyEOMzP6orLhqUewErE51cPGYmObBQ@mail.gmail.com>
User-Agent: Mutt/1.11.1+11 (2f07cb52) (2018-12-01)
X-Mailman-Approved-At: Wed, 07 Aug 2019 07:26:18 +0000
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

T24gVHVlLCBBdWcgMDYsIDIwMTkgYXQgMDc6MTE6NDFBTSAtMDcwMCwgUm9iIENsYXJrIHdyb3Rl
Ogo+IE9uIFR1ZSwgQXVnIDYsIDIwMTkgYXQgMTo0OCBBTSBDaHJpc3RvcGggSGVsbHdpZyA8aGNo
QGxzdC5kZT4gd3JvdGU6Cj4gPgo+ID4gVGhpcyBnb2VzIGluIHRoZSB3cm9uZyBkaXJlY3Rpb24u
ICBkcm1fY2ZsdXNoXyogYXJlIGEgYmFkIEFQSSB3ZSBuZWVkIHRvCj4gPiBnZXQgcmlkIG9mLCBu
b3QgYWRkIHVzZSBvZiBpdC4gIFRoZSByZWFzb24gZm9yIHRoYXQgaXMgdHdvLWZvbGQ6Cj4gPgo+
ID4gIGEpIGl0IGRvZXNuJ3QgYWRkcmVzcyBob3cgY2FjaGUgbWFpbnRhaW5jZSBhY3R1YWxseSB3
b3JrcyBpbiBtb3N0Cj4gPiAgICAgcGxhdGZvcm1zLiAgV2hlbiB0YWxraW5nIGFib3V0IGEgY2Fj
aGUgd2UgdGhyZWUgZnVuZGFtZW50YWwgb3BlcmF0aW9uczoKPiA+Cj4gPiAgICAgICAgIDEpIHdy
aXRlIGJhY2sgLSB0aGlzIHdyaXRlcyB0aGUgY29udGVudCBvZiB0aGUgY2FjaGUgYmFjayB0byB0
aGUKPiA+ICAgICAgICAgICAgYmFja2luZyBtZW1vcnkKPiA+ICAgICAgICAgMikgaW52YWxpZGF0
ZSAtIHRoaXMgcmVtb3ZlIHRoZSBjb250ZW50IG9mIHRoZSBjYWNoZQo+ID4gICAgICAgICAzKSB3
cml0ZSBiYWNrICsgaW52YWxpZGF0ZSAtIGRvIGJvdGggb2YgdGhlIGFib3ZlCj4gCj4gQWdyZWVk
IHRoYXQgZHJtX2NmbHVzaF8qIGlzbid0IGEgZ3JlYXQgQVBJLiAgSW4gdGhpcyBwYXJ0aWN1bGFy
IGNhc2UKPiAoSUlVQyksIEkgbmVlZCB3YitpbnYgc28gdGhhdCB0aGVyZSBhcmVuJ3QgZGlydHkg
Y2FjaGUgbGluZXMgdGhhdCBkcm9wCj4gb3V0IHRvIG1lbW9yeSBsYXRlciwgYW5kIHNvIHRoYXQg
SSBkb24ndCBnZXQgYSBjYWNoZSBoaXQgb24KPiB1bmNhY2hlZC93YyBtbWFwJ2luZy4KCklzIHRo
ZXJlIGEgY2FjaGVhYmxlIGFsaWFzIGx5aW5nIGFyb3VuZCAoZS5nLiB0aGUgbGluZWFyIG1hcCks
IG9yIGFyZQp0aGVzZSBhZGRyZXNzZXMgb25seSBtYXBwZWQgdW5jYWNoZWQvd2M/CgpJZiB0aGVy
ZSdzIGEgY2FjaGVhYmxlIGFsaWFzLCBwZXJmb3JtaW5nIGFuIGludmFsaWRhdGUgaXNuJ3Qgc3Vm
ZmljaWVudCwKc2luY2UgYSBDUFUgY2FuIGFsbG9jYXRlIGEgbmV3IChjbGVhbikgZW50cnkgYXQg
YW55IHBvaW50IGluIHRpbWUgKGUuZy4KYXMgYSByZXN1bHQgb2YgcHJlZmV0Y2hpbmcgb3IgYXJi
aXRyYXJ5IHNwZWN1bGF0aW9uKS4KClRoYW5rcywKTWFyay4KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
