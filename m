Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 496D485BE8
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2019 09:47:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B2226E7D3;
	Thu,  8 Aug 2019 07:46:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 313106E729
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Aug 2019 14:56:06 +0000 (UTC)
Received: from willy by bombadil.infradead.org with local (Exim 4.92 #3 (Red
 Hat Linux)) id 1hvNM9-00082M-J1; Wed, 07 Aug 2019 14:56:01 +0000
Date: Wed, 7 Aug 2019 07:56:01 -0700
From: Matthew Wilcox <willy@infradead.org>
To: Steven Price <steven.price@arm.com>
Subject: Re: drm pull for v5.3-rc1
Message-ID: <20190807145601.GB5482@bombadil.infradead.org>
References: <CAHk-=wiD6a189CXj-ugRzCxA9r1+siSCA0eP_eoZ_bk_bLTRMw@mail.gmail.com>
 <48890b55-afc5-ced8-5913-5a755ce6c1ab@shipmail.org>
 <CAHk-=whwcMLwcQZTmWgCnSn=LHpQG+EBbWevJEj5YTKMiE_-oQ@mail.gmail.com>
 <CAHk-=wghASUU7QmoibQK7XS09na7rDRrjSrWPwkGz=qLnGp_Xw@mail.gmail.com>
 <20190806073831.GA26668@infradead.org>
 <CAHk-=wi7L0MDG7DY39Hx6v8jUMSq3ZCE3QTnKKirba_8KAFNyw@mail.gmail.com>
 <20190806190937.GD30179@bombadil.infradead.org>
 <20190807064000.GC6002@infradead.org>
 <20190807141517.GA5482@bombadil.infradead.org>
 <62cbe523-e8a4-cdfd-90c2-80260cefa5de@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <62cbe523-e8a4-cdfd-90c2-80260cefa5de@arm.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Mailman-Approved-At: Thu, 08 Aug 2019 07:46:20 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WHDkGIkGDhi7s/aX5RIG2h076WJQgiwTmFKZsiix88I=; b=AC2sFIrClzvrAuopVrXvwugiY
 8pjCjcoNMRxBAbOu1e+IYWnWwBn23rrvVb3+zo9jSy/rEqV0jtM6OKmuaKJgIPCd+ZEJGVHI1xCUM
 V33yiZR1LBHycuELJYuk3ChIMHbwC3+U3UkD+itrcmrRrXwcGTUiy4Emh3dDvFH8iJCGHKTIyZkSS
 JkM7h5vZfpkNwqmfAGioAVQ7oEBCMiwDFERlYOCfEHok0Ct0gRQBQZhg0acgBiGO6N99OC8PyFqGX
 RBH5duCu835KJqDGvsVYJ2T0t8xRO3dI5YDATQhUwKO6u2/VVkIlC73MRjL16m50yadyh4WpPfYWx
 CslHyrvIQ==;
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
Cc: Thomas Hellstrom <thellstrom@vmware.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m_=28VMware=29?= <thomas@shipmail.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Christoph Hellwig <hch@infradead.org>, Linux-MM <linux-mm@kvack.org>,
 Jerome Glisse <jglisse@redhat.com>, Jason Gunthorpe <jgg@mellanox.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBBdWcgMDcsIDIwMTkgYXQgMDM6MzA6MzhQTSArMDEwMCwgU3RldmVuIFByaWNlIHdy
b3RlOgo+IE9uIDA3LzA4LzIwMTkgMTU6MTUsIE1hdHRoZXcgV2lsY294IHdyb3RlOgo+ID4gT24g
VHVlLCBBdWcgMDYsIDIwMTkgYXQgMTE6NDA6MDBQTSAtMDcwMCwgQ2hyaXN0b3BoIEhlbGx3aWcg
d3JvdGU6Cj4gPj4gT24gVHVlLCBBdWcgMDYsIDIwMTkgYXQgMTI6MDk6MzhQTSAtMDcwMCwgTWF0
dGhldyBXaWxjb3ggd3JvdGU6Cj4gPj4+IEhhcyBhbnlvbmUgbG9va2VkIGF0IHR1cm5pbmcgdGhl
IGludGVyZmFjZSBpbnNpZGUtb3V0PyAgaWUgc29tZXRoaW5nIGxpa2U6Cj4gPj4+Cj4gPj4+IAlz
dHJ1Y3QgbW1fd2Fsa19zdGF0ZSBzdGF0ZSA9IHsgLm1tID0gbW0sIC5zdGFydCA9IHN0YXJ0LCAu
ZW5kID0gZW5kLCB9Owo+ID4+Pgo+ID4+PiAJZm9yX2VhY2hfcGFnZV9yYW5nZSgmc3RhdGUsIHBh
Z2UpIHsKPiA+Pj4gCQkuLi4gZG8gc29tZXRoaW5nIHdpdGggcGFnZSAuLi4KPiA+Pj4gCX0KPiA+
Pj4KPiA+Pj4gd2l0aCBhcHByb3ByaWF0ZSBtYWNyb2xvZ3kgYWxvbmcgdGhlIGxpbmVzIG9mOgo+
ID4+Pgo+ID4+PiAjZGVmaW5lIGZvcl9lYWNoX3BhZ2VfcmFuZ2Uoc3RhdGUsIHBhZ2UpCQkJCVwK
PiA+Pj4gCXdoaWxlICgocGFnZSA9IHBhZ2VfcmFuZ2Vfd2Fsa19uZXh0KHN0YXRlKSkpCj4gPj4+
Cj4gPj4+IFRoZW4geW91IGRvbid0IG5lZWQgdG8gcGFja2FnZSBhbnl0aGluZyB1cCBpbnRvIHN0
cnVjdHMgdGhhdCBhcmUgc2hhcmVkCj4gPj4+IGJldHdlZW4gdGhlIGNhbGxlciBhbmQgdGhlIGl0
ZXJhdGVkIGZ1bmN0aW9uLgo+ID4+Cj4gPj4gSSdtIG5vdCBhbiBhbGwgdGhhdCBodWdlIGZhbiBv
ZiBzdXBlciBtYWdpYyBtYWNybyBsb29wcy4gIEJ1dCBpbiB0aGlzCj4gPj4gY2FzZSBJIGRvbid0
IHNlZSBob3cgaXQgY291bGQgZXZlbiB3b3JrLCBhcyB3ZSBnZXQgc3BlY2lhbCBjYWxsYmFja3MK
PiA+PiBmb3IgaHVnZSBwYWdlcyBhbmQgaG9sZXMsIGFuZCBwZW9wbGUgYXJlIHRyeWluZyB0byBh
ZGQgYSBmZXcgbW9yZSBvcHMKPiA+PiBhcyB3ZWxsLgo+ID4gCj4gPiBXZSBjb3VsZCBoYXZlIGJp
dHMgaW4gdGhlIG1tX3dhbGtfc3RhdGUgd2hpY2ggaW5kaWNhdGUgd2hhdCB0aGluZ3MgdG8gcmV0
dXJuCj4gPiBhbmQgd2hhdCB0aGluZ3MgdG8gc2tpcC4gIFdlIGNvdWxkIChhbmQgcHJvYmFibHkg
c2hvdWxkKSBhbHNvIHVzZSBkaWZmZXJlbnQKPiA+IGl0ZXJhdG9yIG5hbWVzIGlmIHBlb3BsZSBh
Y3R1YWxseSB3YW50IHRvIGl0ZXJhdGUgZGlmZmVyZW50IHRoaW5ncy4gIGVnCj4gPiBmb3JfZWFj
aF9wdGVfcmFuZ2UoJnN0YXRlLCBwdGUpIGFzIHdlbGwgYXMgZm9yX2VhY2hfcGFnZV9yYW5nZSgp
Lgo+ID4gCj4gCj4gVGhlIGl0ZXJhdG9yIGFwcHJvYWNoIGNvdWxkIGJlIGF3a3dhcmQgZm9yIHRo
ZSBsaWtlcyBvZiBteSBnZW5lcmljCj4gcHRkdW1wIGltcGxlbWVudGF0aW9uWzFdLiBJdCB3b3Vs
ZCByZXF1aXJlIGFuIGl0ZXJhdG9yIHdoaWNoIHJldHVybnMgYWxsCj4gbGV2ZWxzIGFuZCBhbGxv
d3Mgc2tpcHBpbmcgbGV2ZWxzIHdoZW4gcmVxdWlyZWQgKHRvIHByZXZlbnQgS0FTQU4KPiBzbG93
aW5nIHRoaW5ncyBkb3duIHRvbyBtdWNoKS4gU28gc29tZXRoaW5nIGxpa2U6Cj4gCj4gc3RhcnRf
d2Fsa19yYW5nZSgmc3RhdGUpOwo+IGZvcl9lYWNoX3BhZ2VfcmFuZ2UoJnN0YXRlLCBwYWdlKSB7
Cj4gCXN3aXRjaChwYWdlLT5sZXZlbCkgewo+IAljYXNlIFBURToKPiAJCS4uLgo+IAljYXNlIFBN
RDoKPiAJCWlmICguLi4pCj4gCQkJc2tpcF9wbWQoJnN0YXRlKTsKPiAJCS4uLgo+IAljYXNlIEhP
TEU6Cj4gCQkuLi4uCj4gCS4uLgo+IAl9Cj4gfQo+IGVuZF93YWxrX3JhbmdlKCZzdGF0ZSk7Cj4g
Cj4gSXQgc2VlbXMgYSBsaXR0bGUgZnJhZ2lsZSAtIGUuZy4gd2Ugd291bGRuJ3QgKGVhc2lseSkg
Z2V0IHR5cGUgY2hlY2tpbmcKPiB0aGF0IHlvdSBhcmUgYWN0dWFsbHkgdHJlYXRpbmcgYSBQVEUg
YXMgYSBwdGVfdC4gVGhlIHN0YXRlIG11dGF0b3JzIGxpa2UKPiBza2lwX3BtZCgpIGFsc28gc2Vl
bSBhIGJpdCBjbHVtc3kuCgpPbmNlIHlvdSdyZSBvbi1ib2FyZCB3aXRoIHVzaW5nIGEgc3RhdGUg
c3RydWN0dXJlLCB5b3UgY2FuIHVzZSBpdCBpbiBhbGwKa2luZHMgb2YgZnVuIHdheXMuICBGb3Ig
ZXhhbXBsZToKCnN0cnVjdCBtbV93YWxrX3N0YXRlIHsKCXN0cnVjdCBtbV9zdHJ1Y3QgKm1tOwoJ
dW5zaWduZWQgbG9uZyBzdGFydDsKCXVuc2lnbmVkIGxvbmcgZW5kOwoJdW5zaWduZWQgbG9uZyBj
dXJyOwoJcDRkX3QgcDRkOwoJcHVkX3QgcHVkOwoJcG1kX3QgcG1kOwoJcHRlX3QgcHRlOwoJZW51
bSBwYWdlX2VudHJ5X3NpemUgc2l6ZTsKCWludCBmbGFnczsKfTsKCkZvciB0aGlzIHVzZXIsIEkn
ZCBleHBlY3Qgc29tZXRoaW5nIGxpa2UgLi4uCgoJREVDTEFSRV9NTV9XQUxLX0ZMQUdTKHN0YXRl
LCBtbSwgc3RhcnQsIGVuZCwKCQkJCU1NX1dBTEtfSE9MRVMgfCBNTV9XQUxLX0FMTF9TSVpFUyk7
CgoJd2Fsa19lYWNoX3B0ZShzdGF0ZSkgewoJCXN3aXRjaCAoc3RhdGUtPnNpemUpIHsKCQljYXNl
IFBFX1NJWkVfUFRFOgoJCQkuLi4gCgkJY2FzZSBQRV9TSVpFX1BNRDoKCQkJaWYgKC4uLihzdGF0
ZS0+cG1kKSkKCQkJCWNvbnRpbnVlOwoJCS4uLgoJCX0KCX0KClRoZXJlJ3Mgbm8gbmVlZCB0byBo
YXZlIHN0YXJ0IC8gZW5kIHdhbGsgZnVuY3Rpb24gY2FsbHMuCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
