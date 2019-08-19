Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2027A91C22
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2019 06:41:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 870B089CD9;
	Mon, 19 Aug 2019 04:41:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D15F489CD9
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2019 04:41:00 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id DF6A080486;
 Mon, 19 Aug 2019 06:40:56 +0200 (CEST)
Date: Mon, 19 Aug 2019 06:40:54 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: xinliang <z.liuxinliang@hisilicon.com>,
 John Stultz <john.stultz@linaro.org>
Subject: Re: [RESEND][PATCH v3 00/26] drm: Kirin driver cleanups to prep for
 Kirin960 support
Message-ID: <20190819044054.GA8554@ravnborg.org>
References: <20190814184702.54275-1-john.stultz@linaro.org>
 <20190814194508.GA26866@ravnborg.org>
 <5D5A045C.5020707@hisilicon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5D5A045C.5020707@hisilicon.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=BTeA3XvPAAAA:8
 a=KKAkSRfTAAAA:8 a=e5mUnYsNAAAA:8 a=COxsePLIwNb3J7ku7MsA:9
 a=CjuIK1q_8ugA:10 a=tafbbOV3vt1XuEhzTjGK:22 a=cvBusfyB2V15izCimMoJ:22
 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: xuyiping@hisilicon.com, David Airlie <airlied@linux.ie>,
 Chen Feng <puck.chen@hisilicon.com>, lkml <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Rongrong Zou <zourongrong@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgWGlubGlhbmcKCj4gPiBBcyBNYWludGFpbmVycyBjYW4gd2UgcGxlYXNlIGdldCBzb21lIGZl
ZWRiYWNrIGZyb20gb25lIG9mIHlvdS4KPiA+IEp1c3QgYW4gIk9LIHRvIGNvbW1pdCIgd291bGQg
ZG8gaXQuCj4gPiBCdXQgcHJlZmVyYWJseSBhbiBhY2sgb3IgYSByZXZpZXcgb24gdGhlIGluZGl2
aWR1YWwgcGF0Y2hlcy4KPiAKPiBBcyBJIGhhdmUgZG9uZSBhIHByZS1yZXZpZXcgYW5kIHRhbGtl
ZCB3aXRoIHRoZSAgYXV0aG9yIGJlZm9yZSBzZW5kaW5nIG91dAo+IHRoZSBwYXRjaGVzLgo+IFNv
LCBmb3IgdGhpcyBzZXJpYWwgcGF0Y2hlcywKPiBBY2tlZC1ieTogWGlubGlhbmcgTGl1IDx6Lmxp
dXhpbmxpYW5nQGhpc2lsaWNvbi5jb20+CgpUaGFua3MhCldlIGFsbCBrbm93IGhvdyBpdCBpcyB0
byBiZSBidXN5LCBlc3BlY2lhbGx5IHdoZW4gdHJ5aW5nIHRvIGtlZXAgdXAKYWZ0ZXIgcm9sZSBj
aGFuZ2VzLgpVbmxlc3Mgc29tZW9uZSBiZWF0cyBtZSwgdGhlbiBJIHdpbGwgYXBwbHkgdG9uaWdo
dCBvciB0b21vcnJvdy4KCj4gPiBJZiB0aGUgcmVhbGl0eSBpcyB0aGF0IEpvaG4gaXMgdGhlIE1h
aW50YWluZXIgdG9kYXksCj4gPiB0aGVuIHdlIHNob3VsZCB1cGRhdGUgTUFJTlRBSU5FUlMgdG8g
cmVmbGVjdCB0aGlzLgo+IAo+IEkgYW0gYXNzdW1pbmcgeW91IGFyZSB0YWxraW5nIGFib3V0IHRo
ZSBraXJpblsxXSBkcm0gZHJpdmVyIG5vdCB0aGUgaGlibWNbMl0KPiBvbmUsIHJpZ2h0Pwo+IEkg
cmVhbGx5IGFwcHJlY2lhdGUgSm9obidzIGF3ZXNvbWUgd29yayBhdCBraXJpbiBkcm0gZHJpdmVy
IGFsbCB0aGUgd2F5Lgo+IEhvbmVzdGx5LCBhZnRlciBteSB3b3JrIGNoYW5nZSBmcm9tIG1vYmls
ZSB0byBzZXJ2ZXIgeWVhcnMgYWdvLCBJIGFtIGFsd2F5cwo+IHdhaXRpbmcgZm9yIHNvbWUgZ3V5
IHdobyBpcyBzdGFibHkgd29ya2luZyBhdCBraXJpbiBkcm0gZHJpdmVyIHRvIHRha2UgdGhlCj4g
bWFpbnRlbmFuY2Ugd29yay4KPiBKb2huLCBzdXJlbHkgaXMgYSBzdWNoIGd1eS4gIFBsZWFzZSBh
ZGQgdXAgYSBwYXRjaCB0byB1cGRhdGUgdGhlIG1haW50YWluZXIKPiBhcyBKb2huLCBpZiBKb2hu
IGFncmVlIHNvLiAgVGhlbiBKb2huIGNhbiBwdXNoIHRoZSBwYXRjaCBzZXQgdG8gZHJtCj4gbWFp
bnRhaW5lciBoaW1zZWxmLgo+ICpOb3RlKiB0aGF0IHRoZSBtYWludGFpbmVyIHBhdGNoIHNob3Vs
ZCBicmVhayBoaXNpbGljb24gZHJpdmVycyBpbnRvIGtpcmluCj4gYW5kIGhpYm1jIHR3byBwYXJ0
cywgbGlrZSBiZWxsb3c6Cj4gCj4gRFJNIERSSVZFUlMgRk9SIEhJU0lMSUNPTiBISUJNQwo+IE06
ICBYaW5saWFuZyBMaXUgPHoubGl1eGlubGlhbmdAaGlzaWxpY29uLmNvbT4KPiAuLi4KPiBGOiAg
ZHJpdmVycy9ncHUvZHJtL2hpc2lsaWNvbi9oaWJtYwo+IC4uLgo+IAo+IERSTSBEUklWRVJTIEZP
UiBISVNJTElDT04gS0lSSU4KPiBNOiAgSm9obiBTdHVsdHogPGpvaG4uc3R1bHR6QGxpbmFyby5v
cmc+Cj4gLi4uCj4gRjogIGRyaXZlcnMvZ3B1L2RybS9oaXNpbGljb24va2lyaW4KPiAuLi4KPiAK
PiBbMV0gZHJpdmVycy9ncHUvZHJtL2hpc2lsaWNvbi9raXJpbiAjIGZvciBraXJpbiBtb2JpbGUg
ZGlzcGxheSBkcml2ZXIKPiBbMl0gZHJpdmVycy9ncHUvZHJtL2hpc2lsaWNvbi9oaWJtYyAjIGZv
ciBzZXJ2ZXIgVkdBIGRyaXZlcgoKSGkgSm9obgoKVXAgdG8gdGhlIGNoYWxsZW5nZT8KSWYgeWVz
IHRoZW4gcGxlYXNlIGNvbnNpZGVyIHRvIGFwcGx5IGZvciBjb21taXQgcmlnaHRzIHRvIGRybS1t
aXNjLW5leHQuCgpBbmQgcmVhZDoKaHR0cHM6Ly9kcm0ucGFnZXMuZnJlZWRlc2t0b3Aub3JnL21h
aW50YWluZXItdG9vbHMvaW5kZXguaHRtbAoKU2VlIHRoaXMgdG8gZ2V0IGFuIGFjY291bnQ6Cmh0
dHBzOi8vd3d3LmZyZWVkZXNrdG9wLm9yZy93aWtpL0FjY291bnRSZXF1ZXN0cy8KCllvdSB3aWxs
IG5lZWQgYW4gc3NoIGFjY291bnQgZm9yIGRybS1taXNjLW5leHQgYXMgaXQgaXMgbm90ICh5ZXQ/
KQpnaXRsYWIgZW5hYmxlZC4KCglTYW0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
