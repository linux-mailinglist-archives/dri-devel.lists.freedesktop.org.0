Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BE938739E
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2019 10:00:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34DB66ED26;
	Fri,  9 Aug 2019 08:00:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id D64396E819
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Aug 2019 10:24:14 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7E5E628;
 Thu,  8 Aug 2019 03:24:14 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7C27C3F694;
 Thu,  8 Aug 2019 03:24:12 -0700 (PDT)
Date: Thu, 8 Aug 2019 11:24:10 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 1/2] drm: add cache support for arm64
Message-ID: <20190808102410.GB46901@lakrids.cambridge.arm.com>
References: <20190805211451.20176-1-robdclark@gmail.com>
 <20190806084821.GA17129@lst.de>
 <CAJs_Fx6eh1w7c=crMoD5XyEOMzP6orLhqUewErE51cPGYmObBQ@mail.gmail.com>
 <20190806143457.GF475@lakrids.cambridge.arm.com>
 <CAJs_Fx4h6SWGmDTLBnV4nmWUFAs_Ge1inxd-dW9aDKgKqmc1eQ@mail.gmail.com>
 <20190807123807.GD54191@lakrids.cambridge.arm.com>
 <CAJs_Fx5xU2-dn3iOVqWTzAjpTaQ8BBNP_Gn_iMc-eJpOX+iXoQ@mail.gmail.com>
 <20190807164958.GA44765@lakrids.cambridge.arm.com>
 <20190808075827.GD30308@lst.de>
 <20190808102053.GA46901@lakrids.cambridge.arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190808102053.GA46901@lakrids.cambridge.arm.com>
User-Agent: Mutt/1.11.1+11 (2f07cb52) (2018-12-01)
X-Mailman-Approved-At: Fri, 09 Aug 2019 08:00:17 +0000
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
Cc: Rob Clark <robdclark@chromium.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Catalin Marinas <catalin.marinas@arm.com>, David Airlie <airlied@linux.ie>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Sean Paul <sean@poorly.run>,
 linux-arm-kernel@lists.infradead.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
 Allison Randal <allison@lohutok.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBBdWcgMDgsIDIwMTkgYXQgMTE6MjA6NTNBTSArMDEwMCwgTWFyayBSdXRsYW5kIHdy
b3RlOgo+IE9uIFRodSwgQXVnIDA4LCAyMDE5IGF0IDA5OjU4OjI3QU0gKzAyMDAsIENocmlzdG9w
aCBIZWxsd2lnIHdyb3RlOgo+ID4gT24gV2VkLCBBdWcgMDcsIDIwMTkgYXQgMDU6NDk6NTlQTSAr
MDEwMCwgTWFyayBSdXRsYW5kIHdyb3RlOgo+ID4gPiBGb3IgYXJtNjQsIHdlIGNhbiB0ZWFyIGRv
d24gcG9ydGlvbnMgb2YgdGhlIGxpbmVhciBtYXAsIGJ1dCB0aGF0IGhhcyB0bwo+ID4gPiBiZSBk
b25lIGV4cGxpY2l0bHksIGFuZCB0aGlzIGlzIG9ubHkgcG9zc2libGUgd2hlbiB1c2luZyByb2Rh
dGFfZnVsbC4gSWYKPiA+ID4gbm90IHVzaW5nIHJvZGF0YV9mdWxsLCBpdCBpcyBub3QgcG9zc2li
bGUgdG8gZHluYW1pY2FsbHkgdGVhciBkb3duIHRoZQo+ID4gPiBjYWNoZWFibGUgYWxpYXMuCj4g
PiAKPiA+IEludGVyZXN0aW5nLiAgRm9yIHRoaXMgb3IgbmV4dCBtZXJnZSB3aW5kb3cgSSBwbGFu
IHRvIGFkZCBzdXBwb3J0IHRvIHRoZQo+ID4gZ2VuZXJpYyBETUEgY29kZSB0byByZW1hcCBwYWdl
cyBhcyB1bmNhY2hhYmxlIGluIHBsYWNlIGJhc2VkIG9uIHRoZQo+ID4gb3BlbnJpc2MgY29kZS4g
IEHRlSBmYXIgYXMgSSBjYW4gdGVsbCB0aGUgcmVxdWlyZW1lbnQgZm9yIHRoYXQgaXMKPiA+IGJh
c2ljYWxseSBqdXN0IHRoYXQgdGhlIGtlcm5lbCBkaXJlY3QgbWFwcGluZyBkb2Vzbid0IHVzZSBQ
TUQgb3IgYmlnZ2VyCj4gPiBtYXBwaW5nIHNvIHRoYXQgaXQgc3VwcG9ydHMgY2hhbmdpbmcgcHJv
dGVjdGlvbiBiaXRzIG9uIGEgcGVyLVBURSBiYXNpcy4KPiA+IElzIHRoYXQgdGhlIGNhc2Ugd2l0
aCBhcm02NCArIHJvZGF0YV9mdWxsPwo+IAo+IFllcywgd2l0aCB0aGUgYWRkZWQgY2FzZSB0aGF0
IG9uIGFybTY0IHdlIGNhbiBhbHNvIGhhdmUgY29udGlndW91cwo+IGVudHJpZXMgYXQgdGhlIFBU
RSBsZXZlbCwgd2hpY2ggd2UgYWxzbyBoYXZlIHRvIGRpc2FibGUuCj4gCj4gT3VyIGtlcm5lbCBw
YWdlIHRhYmxlIGNyZWF0aW9uIGNvZGUgZG9lcyB0aGF0IGZvciByb2RhdGFfZnVsbCBvcgo+IERF
QlVHX1BBR0VBTExPQy4gU2VlIGFyY2gvYXJtNjQvbW11LmMsIGluIG1hcF9tZW0oKSwgd2hlcmUg
d2UgcGFzcwo+IE5PX3tCTE9DSyxDT05UfV9NQVBQSU5HUyBkb3duIHRvIG91ciBwYWdldGFibGUg
Y3JlYXRpb24gY29kZS4KCldob29wcywgdGhhdCBzaG91bGQgYmU6IGFyY2gvYXJtNjQvbW0vbW11
LmMuCgpNYXJrLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
