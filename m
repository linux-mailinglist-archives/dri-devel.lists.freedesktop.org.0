Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D95E04A51B
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2019 17:19:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45D766E179;
	Tue, 18 Jun 2019 15:19:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC37F6E174;
 Tue, 18 Jun 2019 15:19:40 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 11072213F2;
 Tue, 18 Jun 2019 15:19:39 +0000 (UTC)
Date: Tue, 18 Jun 2019 17:19:38 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: drm connectors, tegra,  and the web they weave (was Re: [PATCH
 58/59] drm/todo: Add new debugfs todo)
Message-ID: <20190618151938.GA2567@kroah.com>
References: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
 <20190614203615.12639-59-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190614203615.12639-59-daniel.vetter@ffwll.ch>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1560871180;
 bh=PNIyNpRL12Z3acOSdwy0y27hNcJzCSr3npPEQ7CeV88=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sDzD0eKdGTAeWjRm/rES0DAk0WQVBWtvpRjJmX9Tc1VmpSS5rIqGvOMjhFH7vBMAR
 rliiK5wkOyAmj9s0DuW+eC6nUR6JuHBZQ25g7GONhMnMR1htsPA+ZA9hnU8cs3Go6F
 J3+PpQb/WXPBLP1eMbOR0bvBDBk0tWvE5r5TZOKw=
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdW4gMTQsIDIwMTkgYXQgMTA6MzY6MTRQTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBHcmVnIGlzIGJ1c3kgYWxyZWFkeSwgYnV0IG1heWJlIGhlIHdvbid0IGRvIGV2ZXJ5
dGhpbmcgLi4uCj4gCj4gQ2M6IEdyZWcgS3JvYWgtSGFydG1hbiA8Z3JlZ2toQGxpbnV4Zm91bmRh
dGlvbi5vcmc+Cj4gU2lnbmVkLW9mZi1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBp
bnRlbC5jb20+Cj4gLS0tCj4gIERvY3VtZW50YXRpb24vZ3B1L3RvZG8ucnN0IHwgMyArKysKPiAg
MSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9Eb2N1bWVu
dGF0aW9uL2dwdS90b2RvLnJzdCBiL0RvY3VtZW50YXRpb24vZ3B1L3RvZG8ucnN0Cj4gaW5kZXgg
OTcxNzU0MGVlMjhmLi4wMjZlNTVjNTE3ZTEgMTAwNjQ0Cj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9n
cHUvdG9kby5yc3QKPiArKysgYi9Eb2N1bWVudGF0aW9uL2dwdS90b2RvLnJzdAo+IEBAIC0zNzUs
NiArMzc1LDkgQEAgVGhlcmUncyBhIGJ1bmNoIG9mIGlzc3VlcyB3aXRoIGl0Ogo+ICAgIHRoaXMg
KHRvZ2V0aGVyIHdpdGggdGhlIGRybV9taW5vci0+ZHJtX2RldmljZSBtb3ZlKSB3b3VsZCBhbGxv
dyB1cyB0byByZW1vdmUKPiAgICBkZWJ1Z2ZzX2luaXQuCj4gIAo+ICstIERyb3AgdGhlIHJldHVy
biBjb2RlIGFuZCBlcnJvciBjaGVja2luZyBmcm9tIGFsbCBkZWJ1Z2ZzIGZ1bmN0aW9ucy4gR3Jl
ZyBLSCBpcwo+ICsgIHdvcmtpbmcgb24gdGhpcyBhbHJlYWR5LgoKClBhcnQgb2YgdGhpcyB3b3Jr
IHdhcyB0byB0cnkgdG8gZGVsZXRlIGRybV9kZWJ1Z2ZzX3JlbW92ZV9maWxlcygpLgoKVGhlcmUg
YXJlIG9ubHkgNCBmaWxlcyB0aGF0IGN1cnJlbnRseSBzdGlsbCBjYWxsIHRoaXMgZnVuY3Rpb246
Cglkcml2ZXJzL2dwdS9kcm0vdGVncmEvZGMuYwoJZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2RzaS5j
Cglkcml2ZXJzL2dwdS9kcm0vdGVncmEvaGRtaS5jCglkcml2ZXJzL2dwdS9kcm0vdGVncmEvc29y
LmMKCkZvciBkYy5jLCB0aGUgZHJpdmVyIHdhbnRzIHRvIGFkZCBkZWJ1Z2ZzIGZpbGVzIHRvIHRo
ZSBzdHJ1Y3QgZHJtX2NydGMKZGVidWdmcyBkaXJlY3RvcnkuICBXaGljaCBpcyBmaW5lLCBidXQg
aXQgaGFzIHRvIGRvIHNvbWUgc3BlY2lhbCBtZW1vcnkKYWxsb2NhdGlvbiB0byBnZXQgdGhlIGRl
YnVnZnMgY2FsbGJhY2sgdG8gcG9pbnQgbm90IHRvIHRoZSBzdHJ1Y3QKZHJtX21pbm9yIHBvaW50
ZXIsIGJ1dCByYXRoZXIgdGhlIGRybV9jcnRjIHN0cnVjdHVyZS4KClNvLCB0byByZW1vdmUgdGhp
cyBjYWxsLCBJIG5lZWQgdG8gcmVtb3ZlIHRoaXMgc3BlY2lhbCBtZW1vcnkgYWxsb2NhdGlvbgph
bmQgdG8gZG8gdGhhdCwgSSBuZWVkIHRvIHNvbWVob3cgYmUgYWJsZSB0byBjYXN0IGZyb20gZHJt
X21pbm9yIGJhY2sgdG8KdGhlIGRybV9jcnRjIHN0cnVjdHVyZSBiZWluZyB1c2VkIGluIHRoaXMg
ZHJpdmVyLiAgQW5kIEkgY2FuJ3QgZmlndXJlCmhvdyB0aGV5IGFyZSByZWxhdGVkIGF0IGFsbC4K
CkFueSBwb2ludGVycyBoZXJlIChwdW4gaW50ZW5kZWQpIHdvdWxkIGJlIGFwcHJlY2lhdGVkLgoK
Rm9yIHRoZSBvdGhlciAzIGZpbGVzLCB0aGUgc2l0dWF0aW9uIGlzIG11Y2ggdGhlIHNhbWUsIGJ1
dCBJIG5lZWQgdG8gZ2V0CmZyb20gYSAnc3RydWN0IGRybV9taW5vcicgcG9pbnRlciB0byBhICdz
dHJ1Y3QgZHJtX2Nvbm5lY3RvcicgcG9pbnRlci4KCkkgY291bGQganVzdCAib3BlbiBjb2RlIiBh
IGJ1bmNoIG9mIGNhbGxzIHRvIGRlYnVnZnNfY3JlYXRlX2ZpbGUoKSBmb3IKdGhlc2UgZHJpdmVy
cywgd2hpY2ggd291bGQgc29sdmUgdGhpcyBpc3N1ZSwgYnV0IGluIGEgbW9yZSAibm9uLWRybSIK
d2F5LiAgSXMgaXQgd29ydGggdG8ganVzdCBkbyB0aGF0IGluc3RlYWQgb2Ygb3ZlcnRoaW5raW5n
IHRoZSB3aG9sZQp0aGluZyBhbmQgdHJ5aW5nIHRvIHNxdWlzaCBpdCBpbnRvIHRoZSBkcm0gIm1v
ZGVsIiBvZiBkcm0gZGVidWdmcyBjYWxscz8KCkVpdGhlciB3YXksIHdobyBjYW4gdGVzdCB0aGVz
ZSBjaGFuZ2VzPyAgSSBjYW4ndCBldmVuIGJ1aWxkIHRoZSB0ZWdyYQpkcml2ZXIgd2l0aG91dCBk
aWdnaW5nIHVwIGFuIGFybTY0IGNyb3NzLWNvbXBpbGVyLCBhbmQgY2FuJ3QgdGVzdCBpdCBhcwpJ
IGhhdmUgbm8gaGFyZHdhcmUgYXQgYWxsLgoKdGhhbmtzLAoKZ3JlZyBrLWgKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
