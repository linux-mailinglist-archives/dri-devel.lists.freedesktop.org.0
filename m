Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C40B6A9E90
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2019 11:38:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0AA0891AC;
	Thu,  5 Sep 2019 09:37:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id EF0B0891AC
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Sep 2019 09:37:56 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 883721576;
 Thu,  5 Sep 2019 02:37:56 -0700 (PDT)
Received: from [10.1.196.133] (e112269-lin.cambridge.arm.com [10.1.196.133])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B9AB33F67D;
 Thu,  5 Sep 2019 02:37:55 -0700 (PDT)
Subject: Re: [PATCH] drm/panfrost: Fix regulator_get_optional() misuse
To: Rob Herring <robh@kernel.org>, Mark Brown <broonie@kernel.org>
References: <20190904123032.23263-1-broonie@kernel.org>
 <CAL_JsqK8hn8aHa0e-QhT5=dMqCd0_HzNWMHM1YbEC_2z8n-tXg@mail.gmail.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <feaf7338-9aa1-5065-7a83-028aeadd5578@arm.com>
Date: Thu, 5 Sep 2019 10:37:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAL_JsqK8hn8aHa0e-QhT5=dMqCd0_HzNWMHM1YbEC_2z8n-tXg@mail.gmail.com>
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
Cc: David Airlie <airlied@linux.ie>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMDUvMDkvMjAxOSAwOToyMSwgUm9iIEhlcnJpbmcgd3JvdGU6Cj4gK1N0ZXZlbgo+IAo+IE9u
IFdlZCwgU2VwIDQsIDIwMTkgYXQgMTozMCBQTSBNYXJrIEJyb3duIDxicm9vbmllQGtlcm5lbC5v
cmc+IHdyb3RlOgo+Pgo+PiBUaGUgcGFuZnJvc3QgZHJpdmVyIHJlcXVlc3RzIGEgc3VwcGx5IHVz
aW5nIHJlZ3VsYXRvcl9nZXRfb3B0aW9uYWwoKQo+PiBidXQgYm90aCB0aGUgbmFtZSBvZiB0aGUg
c3VwcGx5IGFuZCB0aGUgdXNhZ2UgcGF0dGVybiBzdWdnZXN0IHRoYXQgaXQgaXMKPj4gYmVpbmcg
dXNlZCBmb3IgdGhlIG1haW4gcG93ZXIgZm9yIHRoZSBkZXZpY2UgYW5kIGlzIG5vdCBhdCBhbGwg
b3B0aW9uYWwKPj4gZm9yIHRoZSBkZXZpY2UgZm9yIGZ1bmN0aW9uLCB0aGVyZSBpcyBubyBtZWFu
aW5nZnVsIGhhbmRsaW5nIGZvciBhYnNlbnQKPj4gc3VwcGxpZXMuICBTdWNoIHJlZ3VsYXRvcnMg
c2hvdWxkIHVzZSB0aGUgdmFuaWxsYSByZWd1bGF0b3JfZ2V0KCkKPj4gaW50ZXJmYWNlLCBpdCB3
aWxsIGVuc3VyZSB0aGF0IGV2ZW4gaWYgYSBzdXBwbHkgaXMgbm90IGRlc2NyaWJlZCBpbiB0aGUK
Pj4gc3lzdGVtIGludGVncmF0aW9uIG9uZSB3aWxsIGJlIHByb3ZpZGVkIGluIHNvZnR3YXJlLgo+
IAo+IEkgZ3Vlc3MgY29tbWl0cyBlMjFkZDI5MDg4MWIgKCJkcm0vcGFuZnJvc3Q6IEVuYWJsZSBk
ZXZmcmVxIHRvIHdvcmsKPiB3aXRob3V0IHJlZ3VsYXRvciIpIGFuZCBjOTBmMzA4MTJhNzkgKCJk
cm0vcGFuZnJvc3Q6IEFkZCBtaXNzaW5nIGNoZWNrCj4gZm9yIHBmZGV2LT5yZWd1bGF0b3IiKQo+
IGluIC1uZXh0IHNob3VsZCBiZSByZXZlcnRlZCBvciBwYXJ0aWFsbHkgcmV2ZXJ0ZWQ/CgpBaCwg
SSBkaWRuJ3QgcmVhbGlzZSB0aGF0IHJlZ3VsYXRvcl9nZXQoKSB3aWxsIHJldHVybiBhIGR1bW15
IHJlZ3VsYXRvcgppZiBub25lIGlzIHByb3ZpZGVkIGluIHRoZSBEVC4gSW4gdGhlb3J5IHRoYXQg
c2VlbXMgbGlrZSBhIG5pY2VyCnNvbHV0aW9uIHRvIG15IHR3byBjb21taXRzLiBIb3dldmVyIHRo
ZXJlJ3Mgc3RpbGwgYSBwcm9ibGVtIC0gdGhlIGR1bW15CnJlZ3VsYXRvciByZXR1cm5lZCBmcm9t
IHJlZ3VsYXRvcl9nZXQoKSByZXBvcnRzIGVycm9ycyB3aGVuCnJlZ3VsYXRvcl9zZXRfdm9sdGFn
ZSgpIGlzIGNhbGxlZC4gU28gSSBnZXQgZXJyb3JzIGxpa2UgdGhpczoKClsgIDI5OS44NjExNjVd
IHBhbmZyb3N0IGU4MmMwMDAwLm1hbGk6IENhbm5vdCBzZXQgdm9sdGFnZSAxMTAwMDAwIHVWClsg
IDI5OS44NjcyOTRdIGRldmZyZXEgZGV2ZnJlcTA6IGR2ZnMgZmFpbGVkIHdpdGggKC0yMikgZXJy
b3IKCihBbmQgdGhlcmVmb3JlIHRoZSBmcmVxdWVuY3kgaXNuJ3QgYmVpbmcgY2hhbmdlZCkKCklk
ZWFsbHkgd2Ugd2FudCBhIGR1bW15IHJlZ3VsYXRvciB0aGF0IHdpbGwgc2lsZW50bHkgaWdub3Jl
IGFueQpyZWd1bGF0b3Jfc2V0X3ZvbHRhZ2UoKSBjYWxscy4KClN0ZXZlCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
