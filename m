Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 559B91E434
	for <lists+dri-devel@lfdr.de>; Tue, 14 May 2019 23:57:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5E8F89327;
	Tue, 14 May 2019 21:57:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.101.70])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0935689327
 for <dri-devel@lists.freedesktop.org>; Tue, 14 May 2019 21:57:01 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D4213374;
 Tue, 14 May 2019 14:57:00 -0700 (PDT)
Received: from [192.168.1.124] (usa-sjc-mx-foss1.foss.arm.com [217.140.101.70])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1C9803F703;
 Tue, 14 May 2019 14:56:57 -0700 (PDT)
Subject: Re: [PATCH v4 0/8] Allwinner H6 Mali GPU support
To: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>
References: <20190512174608.10083-1-peron.clem@gmail.com>
 <20190513151405.GW17751@phenom.ffwll.local>
 <de50a9da-669f-ab25-2ef2-5ffb90f8ee03@baylibre.com>
 <CAJiuCccuEw0BK6MwROR+XUDvu8AJTmZ5tu=pYwZbGAuvO31pgg@mail.gmail.com>
 <CAJiuCccWa5UTML68JDQq6q8SyNZzVWwQWTOL=+84Bh4EMHGC3A@mail.gmail.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <3c2c9094-69d4-bace-d5ee-c02b7f56ac82@arm.com>
Date: Tue, 14 May 2019 22:56:50 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAJiuCccWa5UTML68JDQq6q8SyNZzVWwQWTOL=+84Bh4EMHGC3A@mail.gmail.com>
Content-Language: en-GB
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 linux-sunxi <linux-sunxi@googlegroups.com>, Rob Herring <robh+dt@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS0wNS0xNCAxMDoyMiBwbSwgQ2zDqW1lbnQgUMOpcm9uIHdyb3RlOgo+IEhpLAo+IAo+
IE9uIFR1ZSwgMTQgTWF5IDIwMTkgYXQgMTc6MTcsIENsw6ltZW50IFDDqXJvbiA8cGVyb24uY2xl
bUBnbWFpbC5jb20+IHdyb3RlOgo+Pgo+PiBIaSwKPj4KPj4gT24gVHVlLCAxNCBNYXkgMjAxOSBh
dCAxMjoyOSwgTmVpbCBBcm1zdHJvbmcgPG5hcm1zdHJvbmdAYmF5bGlicmUuY29tPiB3cm90ZToK
Pj4+Cj4+PiBIaSwKPj4+Cj4+PiBPbiAxMy8wNS8yMDE5IDE3OjE0LCBEYW5pZWwgVmV0dGVyIHdy
b3RlOgo+Pj4+IE9uIFN1biwgTWF5IDEyLCAyMDE5IGF0IDA3OjQ2OjAwUE0gKzAyMDAsIHBlcm9u
LmNsZW1AZ21haWwuY29tIHdyb3RlOgo+Pj4+PiBGcm9tOiBDbMOpbWVudCBQw6lyb24gPHBlcm9u
LmNsZW1AZ21haWwuY29tPgo+Pj4+Pgo+Pj4+PiBIaSwKPj4+Pj4KPj4+Pj4gVGhlIEFsbHdpbm5l
ciBINiBoYXMgYSBNYWxpLVQ3MjAgTVAyLiBUaGUgZHJpdmVycyBhcmUKPj4+Pj4gb3V0LW9mLXRy
ZWUgc28gdGhpcyBzZXJpZXMgb25seSBpbnRyb2R1Y2UgdGhlIGR0LWJpbmRpbmdzLgo+Pj4+Cj4+
Pj4gV2UgZG8gaGF2ZSBhbiBpbi10cmVlIG1pZGdhcmQgZHJpdmVyIG5vdyAoc2luY2UgNS4yKS4g
RG9lcyB0aGlzIHN0dWZmIHdvcmsKPj4+PiB0b2dldGhlciB3aXRoIHlvdXIgZHQgY2hhbmdlcyBo
ZXJlPwo+Pj4KPj4+IE5vLCBidXQgaXQgc2hvdWxkIGJlIGVhc3kgdG8gYWRkLgo+PiBJIHdpbGwg
Z2l2ZSBpdCBhIHRyeSBhbmQgbGV0IHlvdSBrbm93Lgo+IEFkZGVkIHRoZSBidXNfY2xvY2sgYW5k
IGEgcmFtcCBkZWxheSB0byB0aGUgZ3B1X3ZkZCBidXQgdGhlIGRyaXZlcgo+IGZhaWwgYXQgcHJv
YmUuCj4gCj4gWyAgICAzLjA1MjkxOV0gcGFuZnJvc3QgMTgwMDAwMC5ncHU6IGNsb2NrIHJhdGUg
PSA0MzIwMDAwMDAKPiBbICAgIDMuMDU4Mjc4XSBwYW5mcm9zdCAxODAwMDAwLmdwdTogYnVzX2Ns
b2NrIHJhdGUgPSAxMDAwMDAwMDAKPiBbICAgIDMuMTc5NzcyXSBwYW5mcm9zdCAxODAwMDAwLmdw
dTogbWFsaS10NzIwIGlkIDB4NzIwIG1ham9yIDB4MQo+IG1pbm9yIDB4MSBzdGF0dXMgMHgwCj4g
WyAgICAzLjE4NzQzMl0gcGFuZnJvc3QgMTgwMDAwMC5ncHU6IGZlYXR1cmVzOiAwMDAwMDAwMCwx
MDMwOWU0MCwKPiBpc3N1ZXM6IDAwMDAwMDAwLDIxMDU0NDAwCj4gWyAgICAzLjE5NTUzMV0gcGFu
ZnJvc3QgMTgwMDAwMC5ncHU6IEZlYXR1cmVzOiBMMjoweDA3MTEwMjA2Cj4gU2hhZGVyOjB4MDAw
MDAwMDAgVGlsZXI6MHgwMDAwMDgwOSBNZW06MHgxIE1NVToweDAwMDAyODIxIEFTOjB4Zgo+IEpT
OjB4Nwo+IFsgICAgMy4yMDcxNzhdIHBhbmZyb3N0IDE4MDAwMDAuZ3B1OiBzaGFkZXJfcHJlc2Vu
dD0weDMgbDJfcHJlc2VudD0weDEKPiBbICAgIDMuMjM4MjU3XSBwYW5mcm9zdCAxODAwMDAwLmdw
dTogRmF0YWwgZXJyb3IgZHVyaW5nIEdQVSBpbml0Cj4gWyAgICAzLjI0NDE2NV0gcGFuZnJvc3Q6
IHByb2JlIG9mIDE4MDAwMDAuZ3B1IGZhaWxlZCB3aXRoIGVycm9yIC0xMgo+IAo+IFRoZSBFTk9N
RU0gaXMgY29taW5nIGZyb20gInBhbmZyb3N0X21tdV9pbml0Igo+IGFsbG9jX2lvX3BndGFibGVf
b3BzKEFSTV9NQUxJX0xQQUUsICZwZmRldi0+bW11LT5wZ3RibF9jZmcsCj4gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGZkZXYpOwo+IAo+IFdoaWNoIGlzIGR1ZSB0
byBhIGNoZWNrIGluIHRoZSBwZ3RhYmxlIGFsbG9jICJjZmctPmlhcyAhPSA0OCIKPiBhcm0tbHBh
ZSBpby1wZ3RhYmxlOiBhcm1fbWFsaV9scGFlX2FsbG9jX3BndGFibGUgY2ZnLT5pYXMgMzMgY2Zn
LT5vYXMgNDAKPiAKPiBEUkkgc3RhY2sgaXMgdG90YWxseSBuZXcgZm9yIG1lLCBjb3VsZCB5b3Ug
Z2l2ZSBtZSBhIGxpdHRsZSBjbHVlIGFib3V0Cj4gdGhpcyBpc3N1ZSA/CgpIZWgsIHRoaXMgaXMg
cHJvYmFibHkgdGhlIG9uZSBiaXQgd2hpY2ggZG9lc24ndCByZWFsbHkgY291bnQgYXMgIkRSSSBz
dGFjayIuCgpUaGF0J3MgbWVyZWx5IGEgc29tZXdoYXQtY29uc2VydmF0aXZlIHNhbml0eSBjaGVj
ayAtIEknbSBwcmV0dHkgc3VyZSBpdCAKKnNob3VsZCogYmUgZmluZSB0byBjaGFuZ2UgdGhlIHRl
c3QgdG8gImNmZy0+aWFzID4gNDgiIChpby1wZ3RhYmxlIAppdHNlbGYgb3VnaHQgdG8gY29wZSku
IFlvdSdsbCBqdXN0IGdldCB0byBiZSB0aGUgZmlyc3QgdG8gYWN0dWFsbHkgdGVzdCAKYSBub24t
NDgtYml0IGNvbmZpZ3VyYXRpb24gaGVyZSA6KQoKUm9iaW4uCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
