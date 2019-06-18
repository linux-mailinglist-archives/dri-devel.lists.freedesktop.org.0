Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C7024A020
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2019 14:01:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A7F26E149;
	Tue, 18 Jun 2019 12:01:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DFA46E149
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 12:01:37 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 533492070B;
 Tue, 18 Jun 2019 12:01:37 +0000 (UTC)
Date: Tue, 18 Jun 2019 14:01:35 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 1/2] drm: debugfs: make drm_debugfs_remove_files() a void
 function
Message-ID: <20190618120135.GA32046@kroah.com>
References: <20190614095110.3716-1-gregkh@linuxfoundation.org>
 <20190614145908.GZ23020@phenom.ffwll.local>
 <20190614151958.GA18049@kroah.com>
 <CAKMK7uFuMHe6G2fEAuk_XY3khbA0irtzbikY7-K6+myaDU1srw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uFuMHe6G2fEAuk_XY3khbA0irtzbikY7-K6+myaDU1srw@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1560859297;
 bh=fWNwPfZDgV2OTiUGsLddEWfjXm4AenNiKlCdjlOcy9Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=a5VA4AVYMrooAlVSbu3M6aDCMlkq8lEnWfv1LXXf/p9LneCGffk2vWcz388VEddYI
 N4Vg4itunqAqApk/h7g+doczzEcs4ulCYZtnzlqyAjFCfl99lkm8MTZWq1XoIf43iA
 6JUKTYbKX1sTN9CKcmHnWUGhz+6M/szTMJ93FLzM=
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
Cc: David Airlie <airlied@linux.ie>, Maxime Ripard <maxime.ripard@bootlin.com>,
 Sean Paul <sean@poorly.run>, dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdW4gMTQsIDIwMTkgYXQgMDU6Mzc6NThQTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBPbiBGcmksIEp1biAxNCwgMjAxOSBhdCA1OjIwIFBNIEdyZWcgS3JvYWgtSGFydG1h
bgo+IDxncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZz4gd3JvdGU6Cj4gPgo+ID4gT24gRnJpLCBK
dW4gMTQsIDIwMTkgYXQgMDQ6NTk6MDhQTSArMDIwMCwgRGFuaWVsIFZldHRlciB3cm90ZToKPiA+
ID4gT24gRnJpLCBKdW4gMTQsIDIwMTkgYXQgMTE6NTE6MDlBTSArMDIwMCwgR3JlZyBLcm9haC1I
YXJ0bWFuIHdyb3RlOgo+ID4gPiA+IFRoZSBmdW5jdGlvbiBjYW4gbm90IGZhaWwsIGFuZCBubyBv
bmUgY2hlY2tzIHRoZSBjdXJyZW50IHJldHVybiB2YWx1ZSwKPiA+ID4gPiBzbyBqdXN0IG1hcmsg
aXQgYXMgYSB2b2lkIGZ1bmN0aW9uIHNvIG5vIG9uZSBnZXRzIGNvbmZ1c2VkLgo+ID4gPiA+Cj4g
PiA+ID4gQ2M6IE1hYXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRl
bC5jb20+Cj4gPiA+ID4gQ2M6IE1heGltZSBSaXBhcmQgPG1heGltZS5yaXBhcmRAYm9vdGxpbi5j
b20+Cj4gPiA+ID4gQ2M6IFNlYW4gUGF1bCA8c2VhbkBwb29ybHkucnVuPgo+ID4gPiA+IENjOiBE
YXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+Cj4gPiA+ID4gQ2M6IERhbmllbCBWZXR0ZXIg
PGRhbmllbEBmZndsbC5jaD4KPiA+ID4gPiBDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IEdyZWcgS3JvYWgtSGFydG1hbiA8Z3JlZ2toQGxp
bnV4Zm91bmRhdGlvbi5vcmc+Cj4gPiA+ID4gLS0tCj4gPiA+ID4gIGRyaXZlcnMvZ3B1L2RybS9k
cm1fZGVidWdmcy5jIHwgNSArKy0tLQo+ID4gPiA+ICBpbmNsdWRlL2RybS9kcm1fZGVidWdmcy5o
ICAgICB8IDkgKysrKy0tLS0tCj4gPiA+ID4gIDIgZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRpb25z
KCspLCA4IGRlbGV0aW9ucygtKQo+ID4gPiA+Cj4gPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9kcm1fZGVidWdmcy5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9kZWJ1Z2ZzLmMKPiA+
ID4gPiBpbmRleCA2ZjI4MDJlOWJmYjUuLjUxNTU2OTAwMmM4NiAxMDA2NDQKPiA+ID4gPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0vZHJtX2RlYnVnZnMuYwo+ID4gPiA+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS9kcm1fZGVidWdmcy5jCj4gPiA+ID4gQEAgLTI3MCw4ICsyNzAsOCBAQCBpbnQgZHJtX2Rl
YnVnZnNfaW5pdChzdHJ1Y3QgZHJtX21pbm9yICptaW5vciwgaW50IG1pbm9yX2lkLAo+ID4gPiA+
ICB9Cj4gPiA+ID4KPiA+ID4gPgo+ID4gPiA+IC1pbnQgZHJtX2RlYnVnZnNfcmVtb3ZlX2ZpbGVz
KGNvbnN0IHN0cnVjdCBkcm1faW5mb19saXN0ICpmaWxlcywgaW50IGNvdW50LAo+ID4gPiA+IC0g
ICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgZHJtX21pbm9yICptaW5vcikKPiA+ID4gPiAr
dm9pZCBkcm1fZGVidWdmc19yZW1vdmVfZmlsZXMoY29uc3Qgc3RydWN0IGRybV9pbmZvX2xpc3Qg
KmZpbGVzLCBpbnQgY291bnQsCj4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1
Y3QgZHJtX21pbm9yICptaW5vcikKPiA+ID4KPiA+ID4gV2UncmUgdHJ5aW5nIHRvIGVudGlyZWx5
IG51a2UgdGhpcyBmdW5jdGlvbiBoZXJlLCBzZWUgdGhlIGtlcm5lbGRvYyBmb3IKPiA+ID4gZHJt
X2RlYnVnZnNfY3JlYXRlX2ZpbGVzKCkuIE9ubHkgdXNlciBsZWZ0IGlzIHRlZ3JhLCBhbmQgd2Ug
Y2FsbCB0aGUKPiA+ID4gInJlbW92ZSBhbGwgZGVidWdmcyBmaWxlcyIgYW5kIHRoZSAtPmVhcmx5
X3VucmVnaXN0ZXIgaG9va3MgYWxsIGZyb20gdGhlCj4gPiA+IHNhbWUgcGxhY2UuIFNvIHRoaXMg
Y2FuIGFsbCBiZSBnYXJiYWdlIGNvbGxlY3RlZC4gSXQncyBtaWxkbHkgYW5ub3lpbmcKPiA+ID4g
YmVjYXVzZSB3ZSdkIG5lZWQgdG8gbW92ZSB0aGUga2ZyZWUgZnJvbSAtPmVhcmx5X3VucmVnaXN0
ZXIgaW50byAtPmRlc3Ryb3kKPiA+ID4gY2FsbGJhY2tzLCBiZWNhdXNlIGNvbm5lY3RvcnMgYXJl
IHVucmVnaXN0ZXIgYmVmb3JlIHdlIHRocm93IGF3YXkgYWxsIHRoZQo+ID4gPiBkZWJ1Z2ZzIGZp
bGVzIGluIGRybV9kZXZfdW5yZWdpc3RlcigpLiBCdXQgaW1vIHRoYXQncyBjbGVhbmVyIGFud2F5
Lgo+ID4KPiA+IEkgd291bGQgbG92ZSB0byBzZWUgdGhpcyBmdW5jdGlvbiBnb25lLCBpdCBjYW4g
YWxzbyBtYWtlIHRoaW5ncyBhIGxvdAo+ID4gc2ltcGxlciBmcm9tIHRoZSBwb2ludCBvZiB2aWV3
IG9mIGNyZWF0aW5nIHRoZSBkZWJ1Z2ZzIGZpbGVzIGFzIHdlbGwsIGFzCj4gPiBubyBkZW50cmll
cyB3aWxsIG5lZWQgdG8gYmUgc2F2ZWQuCj4gPgo+ID4gPiBVcCBmb3IgdGhhdD8KPiA+Cj4gPiBT
dXJlLCBJIGNhbiBkbyB0aGF0LiAgSSBoYXZlIGEgbXVjaCBsYXJnZXIgcGF0Y2ggbWVzc2luZyB3
aXRoCj4gPiBkcm1fZGVidWdmc19jcmVhdGVfZmlsZXMoKSB0aGF0IEkgd2FudCB5b3UgYWxsIHRv
IGJlIGluIGEgZ29vZCBtb29kIGZvcgo+ID4gd2hlbiBJIHN1Ym1pdCBpdCAoaXQgdG91Y2hlcyBh
bGwgZHJpdmVycyBhdCBvbmNlKSwgc28gSSBtaWdodCBhcyB3ZWxsCj4gPiBjbGVhbiB0aGlzIHVw
IGZpcnN0IDopCj4gCj4gT2ggZG9uJ3Qgd29ycnksIHdlJ3ZlIGhhZCBhIHBpbGUgb2YgY2xlYW51
cCB0b2RvIHRhc2tzIGluIHRoaXMgYXJlYQo+IHNpbmNlIGEgbG9uZyB0aW1lLiBZb3UgZG9pbmcg
dGhlbSBhbGwgaXMgZ29pbmcgdG8gbWFrZSBtZSBhIGhhcHB5Cj4gY2FtcGVyIDotKQo+IAo+IE9u
bHkgdGhpbmcgdG8gYmUgYXdhcmUgb2YgaXMgdGhhdCB3ZSBoYXZlIGEgYml0IGEgaGFiaXQgb2Yg
ZHJhZ2dpbmcKPiBnb29kIGNvbnRyaWJ1dG9ycyBvZiByZWZhY3RvcmluZy9jbGVhbnVwL2Z1bmRh
bWVudGFsIHdvcmsgbGlrZSB0aGlzCj4gaW50byB0aGUgZHJtIGZvbGQgZm9yIGdvb2QuIFlvdSBt
aWdodCBnZXQgc3R1Y2sgLi4uCgpIYWguLi4KCkFueXdheSwgd2hhdCB0cmVlL2JyYW5jaCBzaG91
bGQgSSBkbyB0aGlzIHdvcmsgb24/ICBJIHNlZSBkcm0tbmV4dCwgaXMKdGhhdCB0aGUgb25lIHRv
IHVzZSwgYnV0IGl0IGRvZXNuJ3Qgc2VlbSB0byBoYXZlIHRoZSBvdGhlciBwYXRjaGVzIHlvdQph
bGwgc2FpZCB5b3UgYWNjZXB0ZWQgZnJvbSBtZSBmb3IgdGhpcyBkZWJ1Z2ZzIGNsZWFudXAgYWxy
ZWFkeS4KCnRoYW5rcywKCmdyZWcgay1oCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
