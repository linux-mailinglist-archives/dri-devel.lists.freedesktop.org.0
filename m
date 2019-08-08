Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9830E87398
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2019 10:00:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95BA76ED0A;
	Fri,  9 Aug 2019 08:00:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id DBB506E7EF
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Aug 2019 10:21:00 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3EF2428;
 Thu,  8 Aug 2019 03:21:00 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 37F123F694;
 Thu,  8 Aug 2019 03:20:58 -0700 (PDT)
Date: Thu, 8 Aug 2019 11:20:53 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 1/2] drm: add cache support for arm64
Message-ID: <20190808102053.GA46901@lakrids.cambridge.arm.com>
References: <20190805211451.20176-1-robdclark@gmail.com>
 <20190806084821.GA17129@lst.de>
 <CAJs_Fx6eh1w7c=crMoD5XyEOMzP6orLhqUewErE51cPGYmObBQ@mail.gmail.com>
 <20190806143457.GF475@lakrids.cambridge.arm.com>
 <CAJs_Fx4h6SWGmDTLBnV4nmWUFAs_Ge1inxd-dW9aDKgKqmc1eQ@mail.gmail.com>
 <20190807123807.GD54191@lakrids.cambridge.arm.com>
 <CAJs_Fx5xU2-dn3iOVqWTzAjpTaQ8BBNP_Gn_iMc-eJpOX+iXoQ@mail.gmail.com>
 <20190807164958.GA44765@lakrids.cambridge.arm.com>
 <20190808075827.GD30308@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190808075827.GD30308@lst.de>
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

T24gVGh1LCBBdWcgMDgsIDIwMTkgYXQgMDk6NTg6MjdBTSArMDIwMCwgQ2hyaXN0b3BoIEhlbGx3
aWcgd3JvdGU6Cj4gT24gV2VkLCBBdWcgMDcsIDIwMTkgYXQgMDU6NDk6NTlQTSArMDEwMCwgTWFy
ayBSdXRsYW5kIHdyb3RlOgo+ID4gRm9yIGFybTY0LCB3ZSBjYW4gdGVhciBkb3duIHBvcnRpb25z
IG9mIHRoZSBsaW5lYXIgbWFwLCBidXQgdGhhdCBoYXMgdG8KPiA+IGJlIGRvbmUgZXhwbGljaXRs
eSwgYW5kIHRoaXMgaXMgb25seSBwb3NzaWJsZSB3aGVuIHVzaW5nIHJvZGF0YV9mdWxsLiBJZgo+
ID4gbm90IHVzaW5nIHJvZGF0YV9mdWxsLCBpdCBpcyBub3QgcG9zc2libGUgdG8gZHluYW1pY2Fs
bHkgdGVhciBkb3duIHRoZQo+ID4gY2FjaGVhYmxlIGFsaWFzLgo+IAo+IEludGVyZXN0aW5nLiAg
Rm9yIHRoaXMgb3IgbmV4dCBtZXJnZSB3aW5kb3cgSSBwbGFuIHRvIGFkZCBzdXBwb3J0IHRvIHRo
ZQo+IGdlbmVyaWMgRE1BIGNvZGUgdG8gcmVtYXAgcGFnZXMgYXMgdW5jYWNoYWJsZSBpbiBwbGFj
ZSBiYXNlZCBvbiB0aGUKPiBvcGVucmlzYyBjb2RlLiAgQdGVIGZhciBhcyBJIGNhbiB0ZWxsIHRo
ZSByZXF1aXJlbWVudCBmb3IgdGhhdCBpcwo+IGJhc2ljYWxseSBqdXN0IHRoYXQgdGhlIGtlcm5l
bCBkaXJlY3QgbWFwcGluZyBkb2Vzbid0IHVzZSBQTUQgb3IgYmlnZ2VyCj4gbWFwcGluZyBzbyB0
aGF0IGl0IHN1cHBvcnRzIGNoYW5naW5nIHByb3RlY3Rpb24gYml0cyBvbiBhIHBlci1QVEUgYmFz
aXMuCj4gSXMgdGhhdCB0aGUgY2FzZSB3aXRoIGFybTY0ICsgcm9kYXRhX2Z1bGw/CgpZZXMsIHdp
dGggdGhlIGFkZGVkIGNhc2UgdGhhdCBvbiBhcm02NCB3ZSBjYW4gYWxzbyBoYXZlIGNvbnRpZ3Vv
dXMKZW50cmllcyBhdCB0aGUgUFRFIGxldmVsLCB3aGljaCB3ZSBhbHNvIGhhdmUgdG8gZGlzYWJs
ZS4KCk91ciBrZXJuZWwgcGFnZSB0YWJsZSBjcmVhdGlvbiBjb2RlIGRvZXMgdGhhdCBmb3Igcm9k
YXRhX2Z1bGwgb3IKREVCVUdfUEFHRUFMTE9DLiBTZWUgYXJjaC9hcm02NC9tbXUuYywgaW4gbWFw
X21lbSgpLCB3aGVyZSB3ZSBwYXNzCk5PX3tCTE9DSyxDT05UfV9NQVBQSU5HUyBkb3duIHRvIG91
ciBwYWdldGFibGUgY3JlYXRpb24gY29kZS4KClRoYW5rcywKTWFyay4KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
