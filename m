Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A98317481D
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2019 09:29:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43ADA6E66A;
	Thu, 25 Jul 2019 07:29:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id EF0EC6E4AE
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 12:47:14 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2729A28;
 Wed, 24 Jul 2019 05:47:14 -0700 (PDT)
Received: from stinger.cambridge.arm.com (stinger.cambridge.arm.com
 [10.1.137.189])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 219043F71A;
 Wed, 24 Jul 2019 05:47:13 -0700 (PDT)
Message-ID: <4d576e9cc749fc47b57f9bc64a082aa791e9780c.camel@arm.com>
Subject: Re: [PATCH 0/3] RFT: PL111 DRM conversion of nspire
From: Pawel Moll <pawel.moll@arm.com>
To: Linus Walleij <linus.walleij@linaro.org>, Sam Ravnborg
 <sam@ravnborg.org>,  Liviu Dudau <Liviu.Dudau@arm.com>
Date: Wed, 24 Jul 2019 13:47:11 +0100
In-Reply-To: <CACRpkdZhYy6o9xMD42pQm-MCZUi0EpXs1uwQg6D-B4NXpyMHWw@mail.gmail.com>
References: <20190723133755.22677-1-linus.walleij@linaro.org>
 <20190723181000.GA24663@ravnborg.org>
 <CACRpkdZhYy6o9xMD42pQm-MCZUi0EpXs1uwQg6D-B4NXpyMHWw@mail.gmail.com>
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 25 Jul 2019 07:29:33 +0000
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
Cc: Fabian Vogt <fabian@ritter-vogt.de>, Daniel Tang <dt.tangr@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAyMDE5LTA3LTI0IGF0IDEzOjI4ICswMTAwLCBMaW51cyBXYWxsZWlqIHdyb3RlOgo+
IE9uIFR1ZSwgSnVsIDIzLCAyMDE5IGF0IDg6MTAgUE0gU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJv
cmcub3JnPiB3cm90ZToKPiA+IE9uIFR1ZSwgSnVsIDIzLCAyMDE5IGF0IDAzOjM3OjUyUE0gKzAy
MDAsIExpbnVzIFdhbGxlaWogd3JvdGU6Cj4gPiBEbyB3ZSBuZWVkIHRvIHN1cHBvcnQgYXJtLHBs
MTF4LHRmdC1yMGcwYjAtcGFkcyBiZWZvcmUKPiA+IHdlIGNhbiBvYnNvbGV0ZSBmYmRldiBzdHVm
Zj8KPiAKPiBObyBJIGRvbid0IHRoaW5rIHNvLCB0aGUgb25seSBpbi10cmVlIHBsYXRmb3JtIHRo
YXQgd2FzIHVzaW5nIGl0IHdhcwo+IHRoZSBOb21hZGlrIGFuZCBhbGwgaXQgZGlkIHdhcyB0byBz
d2l0Y2ggUkdCIHRvIEJHUiBhbmQKPiBJIGFscmVhZHkgaGFuZGxlIHRoYXQgaW4gdGhlIGRyaXZl
ciB1c2luZyB0aGUgaGFyZHdhcmUKPiBmZWF0dXJlIHRvIHN3aXRjaCBSR0IgYW5kIEJHUiBhcm91
bmQgaW5zdGVhZC4KPiAKPiBSaWdodCBub3cgSSBqdXN0IGNoZWNrIHRoYXQgdGhlIHBhZHMgYXJl
IHRoZXJlLCBJIG1pZ2h0IGp1c3QKPiByZW1vdmUgdGhlIGNoZWNrLgo+IAo+IEhvd2V2ZXIgUGF3
ZWwgYWRkZWQgdGhpcyBiaW5kaW5nIGFuZCBtaWdodCBiZSBhYmxlIHRvIHRlbGwKPiBzb21ldGhp
bmcgYWJvdXQgaWYgdGhlcmUgYXJlIHBsYXRmb3JtcyBvdXQgdGhlcmUgdGhhdCByZWFsbHkKPiBu
ZWVkcyB0aGlzLiBQb3NzaWJseSBMaXZpdSBrbm93cyBtb3JlLgoKSXQgd2FzIG9ubHkgdGhlcmUg
c28gdGhlIGZiZGV2IGRyaXZlciBjb3VsZCBmaWd1cmUgb3V0IHRoZSBvdXRwdXQgbW9kZS4KSSB0
YWtlIHRoYXQgRFJNICJwaXBlbGluZSIgbm93IHRha2VzIGNhcmUgb2YgaXQsIHNvIEknZCBzYXkg
dGhhdCB0aGUKbW9tZW50IHRoZSBmYmRldiBkcml2ZXIgZGllcywgdGhlIGJpbmRpbmcgY2FuIGdv
IGFsb25nIDotKQoKQ2hlZXJzIQoKUGF3ZWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
