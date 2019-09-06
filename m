Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F66CABB44
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2019 16:45:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21AF16E2D0;
	Fri,  6 Sep 2019 14:45:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 765666E2D0
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Sep 2019 14:45:14 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2B7AB28;
 Fri,  6 Sep 2019 07:45:14 -0700 (PDT)
Received: from [10.1.196.133] (e112269-lin.cambridge.arm.com [10.1.196.133])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 752063F718;
 Fri,  6 Sep 2019 07:45:13 -0700 (PDT)
Subject: Re: [PATCH] drm/panfrost: Fix regulator_get_optional() misuse
To: Mark Brown <broonie@kernel.org>
References: <20190904123032.23263-1-broonie@kernel.org>
 <CAL_JsqK8hn8aHa0e-QhT5=dMqCd0_HzNWMHM1YbEC_2z8n-tXg@mail.gmail.com>
 <feaf7338-9aa1-5065-7a83-028aeadd5578@arm.com>
 <20190905124014.GA4053@sirena.co.uk>
 <93b8910d-fc01-4c16-fd7e-86abfc3cc617@arm.com>
 <20190905163420.GD4053@sirena.co.uk>
 <58594735-c079-74e5-26c8-4911f073d4df@arm.com>
 <20190906105523.GR23391@sirena.co.uk>
From: Steven Price <steven.price@arm.com>
Message-ID: <1bfa2b93-301f-22ff-7208-b337b8f3820d@arm.com>
Date: Fri, 6 Sep 2019 15:45:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190906105523.GR23391@sirena.co.uk>
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
Cc: David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMDYvMDkvMjAxOSAxMTo1NSwgTWFyayBCcm93biB3cm90ZToKWy4uLl0KPj4+IEhvd2V2ZXIg
eW91J3JlIHByb2JhYmx5IGJldHRlciBvZmYgaGlkaW5nIGFsbCB0aGlzIHN0dWZmIHdpdGggdGhl
Cj4+PiBnZW5lcmljIE9QUCBjb2RlIHJhdGhlciB0aGFuIG9wZW4gY29kaW5nIGl0IC0gdGhpcyBh
bHJlYWR5IGhhcyBtdWNoCj4+PiBiZXR0ZXIgaGFuZGxpbmcgZm9yIHRoaXMsIGl0IHN1cHBvcnRz
IHZvbHRhZ2UgcmFuZ2VzIHJhdGhlciB0aGFuIHNpbmdsZQo+Pj4gdm9sdGFnZXMgYW5kIG9wdGlv
bmFsIHJlZ3VsYXRvcnMgYWxyZWFkeS4gIEknbSBub3QgMTAwJSBjbGVhciB3aHkgdGhpcwo+Pj4g
aXMgb3BlbiBjb2RlZCBUQkggYnV0IEkgbWlnaHQgYmUgbWlzc2luZyBzb21ldGhpbmcsIGlmIHRo
ZXJlJ3Mgc29tZQo+Pj4gcmVzdHJpY3Rpb24gcHJldmVudGluZyB0aGUgZ2VuZXJpYyBjb2RlIGJl
aW5nIHVzZWQgaXQgc2VlbXMgbGlrZSB0aG9zZQo+Pj4gc29odWxkIGJlIGZpeGVkLgo+IAo+PiBU
byBiZSBob25lc3QgSSd2ZSBubyBpZGVhIGhvdyB0byB1c2UgdGhlIGdlbmVyaWMgT1BQIGNvZGUg
dG8gZG8gdGhpcy4gSQo+PiBzdXNwZWN0IHRoZSBvcmlnaW5hbCBvcGVuIGNvZGluZyB3YXMgY2Fy
Z28tY3VsdGVkIGZyb20gYW5vdGhlciBkcml2ZXI6Cj4+IHRoZSBjb21tZW50cyBpbiB0aGUgZnVu
Y3Rpb24gbG9vayBsaWtlIHRoZXkgd2VyZSBsaWZ0ZWQgZnJvbQo+PiBkcml2ZXJzL2RldmZyZXEv
cmszMzk5X2RtYy5jLiBBbnkgaGVscCB0aWR5aW5nIHRoaXMgdXAgd291bGQgYmUgYXBwcmVjaWF0
ZWQuCj4gCj4gWWVzLCB0aGVyZSdzIGEgbG90IG9mIGNhcmdvIGN1bHRpbmcgb2YgYmFkIHJlZ3Vs
YXRvciBBUEkgdXNhZ2UgaW4KPiB0aGUgRFJNIHN1YnN5c3RlbSBmb3Igc29tZSByZWFzb24sIEkg
a2VlcCBoYXZpbmcgdG8gZG8gdGhlc2UKPiBwZXJpb2RpYyBzd2VlcHMgYW5kIHRoZXJlJ3MgYWx3
YXlzIHN0dWZmIGluIHRoZXJlLiAgSSB0aGluayBhIGxvdAo+IG9mIGl0IGNvbWVzIGZyb20gQlNQ
IGNvZGUgdGhhdCBqdXN0IGdldHMgZHJvcHBlZCBpbiB3aXRob3V0Cj4gcmV2aWV3IGFuZCB0aGVu
IGN1dCduJ3Bhc3RlZCBidXQgSSd2ZSBub3QgZmlndXJlZCBvdXQgd2h5IERSTSBpcwo+IHNvIGJh
ZGx5IGFmZmVjdGVkLgoKSSd2ZSBiZWVuIHdvcmtpbmcgb24gdGlkeWluZyB1cCB0aGUgZGV2ZnJl
cSB1c2FnZSBpbiBQYW5mcm9zdC4gRnJvbSB3aGF0CkkgY2FuIHNlZSB5b3VyIHBhdGNoIGlzIGNv
cnJlY3QgYW5kIEkganVzdCBuZWVkZWQgdG8gd29yayBvdXQgaG93IHRvIGZpeApteSBEVC4KClN0
ZXZlCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
