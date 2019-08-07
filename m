Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8790385BF0
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2019 09:47:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CC3A6E7BD;
	Thu,  8 Aug 2019 07:47:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0EA26E72F
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Aug 2019 15:56:08 +0000 (UTC)
Received: from willy by bombadil.infradead.org with local (Exim 4.92 #3 (Red
 Hat Linux)) id 1hvOIB-0006Y2-H6; Wed, 07 Aug 2019 15:55:59 +0000
Date: Wed, 7 Aug 2019 08:55:59 -0700
From: Matthew Wilcox <willy@infradead.org>
To: Steven Price <steven.price@arm.com>
Subject: Re: drm pull for v5.3-rc1
Message-ID: <20190807155559.GC5482@bombadil.infradead.org>
References: <CAHk-=whwcMLwcQZTmWgCnSn=LHpQG+EBbWevJEj5YTKMiE_-oQ@mail.gmail.com>
 <CAHk-=wghASUU7QmoibQK7XS09na7rDRrjSrWPwkGz=qLnGp_Xw@mail.gmail.com>
 <20190806073831.GA26668@infradead.org>
 <CAHk-=wi7L0MDG7DY39Hx6v8jUMSq3ZCE3QTnKKirba_8KAFNyw@mail.gmail.com>
 <20190806190937.GD30179@bombadil.infradead.org>
 <20190807064000.GC6002@infradead.org>
 <20190807141517.GA5482@bombadil.infradead.org>
 <62cbe523-e8a4-cdfd-90c2-80260cefa5de@arm.com>
 <20190807145601.GB5482@bombadil.infradead.org>
 <4b9ea419-571b-93ab-ee52-811e52c0ae91@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4b9ea419-571b-93ab-ee52-811e52c0ae91@arm.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Mailman-Approved-At: Thu, 08 Aug 2019 07:46:20 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XZaTxyRD4Nqbdn0ljW5bmpndWHMns933E3SJhOAN/+0=; b=pM3PBYRihFz16BOz8wLJG1o5c
 NyBoWBzn5CGIWmxPpktF2eWRDVBbyQMF12sbpfKP7j8HNcAn1uIrznqlktDyq2Djlv/ZKtm/ZzS8E
 mUgofDi7T+Xk+j4KXA6M23Z5mLC4xlH5gxWCawx05rt8ZVmnltSW/Bw2ju8YikIomytGnPGJTiI/7
 EmXgKTBdum89gqwtkn1wPDW7NDohQM4mLoJsIbR7K9WsWlFFN8ft2OIxOX7t8STJWlJUFQpdmO9Pi
 ut/BTpn1S0Rpf7EPF2vHHZ4HjpHZ16bs9nxTD4N/KjcxdCRm6KMJQpmLgCugCt7sHUxnVJvytI1VS
 N0izq+XDg==;
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

T24gV2VkLCBBdWcgMDcsIDIwMTkgYXQgMDQ6MzI6NTFQTSArMDEwMCwgU3RldmVuIFByaWNlIHdy
b3RlOgo+IE9uIDA3LzA4LzIwMTkgMTU6NTYsIE1hdHRoZXcgV2lsY294IHdyb3RlOgo+ID4gT24g
V2VkLCBBdWcgMDcsIDIwMTkgYXQgMDM6MzA6MzhQTSArMDEwMCwgU3RldmVuIFByaWNlIHdyb3Rl
Ogo+ID4+IE9uIDA3LzA4LzIwMTkgMTU6MTUsIE1hdHRoZXcgV2lsY294IHdyb3RlOgo+ID4+PiBP
biBUdWUsIEF1ZyAwNiwgMjAxOSBhdCAxMTo0MDowMFBNIC0wNzAwLCBDaHJpc3RvcGggSGVsbHdp
ZyB3cm90ZToKPiA+Pj4+IE9uIFR1ZSwgQXVnIDA2LCAyMDE5IGF0IDEyOjA5OjM4UE0gLTA3MDAs
IE1hdHRoZXcgV2lsY294IHdyb3RlOgo+ID4+Pj4+IEhhcyBhbnlvbmUgbG9va2VkIGF0IHR1cm5p
bmcgdGhlIGludGVyZmFjZSBpbnNpZGUtb3V0PyAgaWUgc29tZXRoaW5nIGxpa2U6Cj4gPj4+Pj4K
PiA+Pj4+PiAJc3RydWN0IG1tX3dhbGtfc3RhdGUgc3RhdGUgPSB7IC5tbSA9IG1tLCAuc3RhcnQg
PSBzdGFydCwgLmVuZCA9IGVuZCwgfTsKPiA+Pj4+Pgo+ID4+Pj4+IAlmb3JfZWFjaF9wYWdlX3Jh
bmdlKCZzdGF0ZSwgcGFnZSkgewo+ID4+Pj4+IAkJLi4uIGRvIHNvbWV0aGluZyB3aXRoIHBhZ2Ug
Li4uCj4gPj4+Pj4gCX0KPiA+Pj4+Pgo+ID4+Pj4+IHdpdGggYXBwcm9wcmlhdGUgbWFjcm9sb2d5
IGFsb25nIHRoZSBsaW5lcyBvZjoKPiA+Pj4+Pgo+ID4+Pj4+ICNkZWZpbmUgZm9yX2VhY2hfcGFn
ZV9yYW5nZShzdGF0ZSwgcGFnZSkJCQkJXAo+ID4+Pj4+IAl3aGlsZSAoKHBhZ2UgPSBwYWdlX3Jh
bmdlX3dhbGtfbmV4dChzdGF0ZSkpKQo+ID4+Pj4+Cj4gPj4+Pj4gVGhlbiB5b3UgZG9uJ3QgbmVl
ZCB0byBwYWNrYWdlIGFueXRoaW5nIHVwIGludG8gc3RydWN0cyB0aGF0IGFyZSBzaGFyZWQKPiA+
Pj4+PiBiZXR3ZWVuIHRoZSBjYWxsZXIgYW5kIHRoZSBpdGVyYXRlZCBmdW5jdGlvbi4KPiA+Pj4+
Cj4gPj4+PiBJJ20gbm90IGFuIGFsbCB0aGF0IGh1Z2UgZmFuIG9mIHN1cGVyIG1hZ2ljIG1hY3Jv
IGxvb3BzLiAgQnV0IGluIHRoaXMKPiA+Pj4+IGNhc2UgSSBkb24ndCBzZWUgaG93IGl0IGNvdWxk
IGV2ZW4gd29yaywgYXMgd2UgZ2V0IHNwZWNpYWwgY2FsbGJhY2tzCj4gPj4+PiBmb3IgaHVnZSBw
YWdlcyBhbmQgaG9sZXMsIGFuZCBwZW9wbGUgYXJlIHRyeWluZyB0byBhZGQgYSBmZXcgbW9yZSBv
cHMKPiA+Pj4+IGFzIHdlbGwuCj4gPj4+Cj4gPj4+IFdlIGNvdWxkIGhhdmUgYml0cyBpbiB0aGUg
bW1fd2Fsa19zdGF0ZSB3aGljaCBpbmRpY2F0ZSB3aGF0IHRoaW5ncyB0byByZXR1cm4KPiA+Pj4g
YW5kIHdoYXQgdGhpbmdzIHRvIHNraXAuICBXZSBjb3VsZCAoYW5kIHByb2JhYmx5IHNob3VsZCkg
YWxzbyB1c2UgZGlmZmVyZW50Cj4gPj4+IGl0ZXJhdG9yIG5hbWVzIGlmIHBlb3BsZSBhY3R1YWxs
eSB3YW50IHRvIGl0ZXJhdGUgZGlmZmVyZW50IHRoaW5ncy4gIGVnCj4gPj4+IGZvcl9lYWNoX3B0
ZV9yYW5nZSgmc3RhdGUsIHB0ZSkgYXMgd2VsbCBhcyBmb3JfZWFjaF9wYWdlX3JhbmdlKCkuCj4g
Pj4+Cj4gPj4KPiA+PiBUaGUgaXRlcmF0b3IgYXBwcm9hY2ggY291bGQgYmUgYXdrd2FyZCBmb3Ig
dGhlIGxpa2VzIG9mIG15IGdlbmVyaWMKPiA+PiBwdGR1bXAgaW1wbGVtZW50YXRpb25bMV0uIEl0
IHdvdWxkIHJlcXVpcmUgYW4gaXRlcmF0b3Igd2hpY2ggcmV0dXJucyBhbGwKPiA+PiBsZXZlbHMg
YW5kIGFsbG93cyBza2lwcGluZyBsZXZlbHMgd2hlbiByZXF1aXJlZCAodG8gcHJldmVudCBLQVNB
Tgo+ID4+IHNsb3dpbmcgdGhpbmdzIGRvd24gdG9vIG11Y2gpLiBTbyBzb21ldGhpbmcgbGlrZToK
PiA+Pgo+ID4+IHN0YXJ0X3dhbGtfcmFuZ2UoJnN0YXRlKTsKPiA+PiBmb3JfZWFjaF9wYWdlX3Jh
bmdlKCZzdGF0ZSwgcGFnZSkgewo+ID4+IAlzd2l0Y2gocGFnZS0+bGV2ZWwpIHsKPiA+PiAJY2Fz
ZSBQVEU6Cj4gPj4gCQkuLi4KPiA+PiAJY2FzZSBQTUQ6Cj4gPj4gCQlpZiAoLi4uKQo+ID4+IAkJ
CXNraXBfcG1kKCZzdGF0ZSk7Cj4gPj4gCQkuLi4KPiA+PiAJY2FzZSBIT0xFOgo+ID4+IAkJLi4u
Lgo+ID4+IAkuLi4KPiA+PiAJfQo+ID4+IH0KPiA+PiBlbmRfd2Fsa19yYW5nZSgmc3RhdGUpOwo+
ID4+Cj4gPj4gSXQgc2VlbXMgYSBsaXR0bGUgZnJhZ2lsZSAtIGUuZy4gd2Ugd291bGRuJ3QgKGVh
c2lseSkgZ2V0IHR5cGUgY2hlY2tpbmcKPiA+PiB0aGF0IHlvdSBhcmUgYWN0dWFsbHkgdHJlYXRp
bmcgYSBQVEUgYXMgYSBwdGVfdC4gVGhlIHN0YXRlIG11dGF0b3JzIGxpa2UKPiA+PiBza2lwX3Bt
ZCgpIGFsc28gc2VlbSBhIGJpdCBjbHVtc3kuCj4gPiAKPiA+IE9uY2UgeW91J3JlIG9uLWJvYXJk
IHdpdGggdXNpbmcgYSBzdGF0ZSBzdHJ1Y3R1cmUsIHlvdSBjYW4gdXNlIGl0IGluIGFsbAo+ID4g
a2luZHMgb2YgZnVuIHdheXMuICBGb3IgZXhhbXBsZToKPiA+IAo+ID4gc3RydWN0IG1tX3dhbGtf
c3RhdGUgewo+ID4gCXN0cnVjdCBtbV9zdHJ1Y3QgKm1tOwo+ID4gCXVuc2lnbmVkIGxvbmcgc3Rh
cnQ7Cj4gPiAJdW5zaWduZWQgbG9uZyBlbmQ7Cj4gPiAJdW5zaWduZWQgbG9uZyBjdXJyOwo+ID4g
CXA0ZF90IHA0ZDsKPiA+IAlwdWRfdCBwdWQ7Cj4gPiAJcG1kX3QgcG1kOwo+ID4gCXB0ZV90IHB0
ZTsKPiA+IAllbnVtIHBhZ2VfZW50cnlfc2l6ZSBzaXplOwo+ID4gCWludCBmbGFnczsKPiA+IH07
Cj4gPiAKPiA+IEZvciB0aGlzIHVzZXIsIEknZCBleHBlY3Qgc29tZXRoaW5nIGxpa2UgLi4uCj4g
PiAKPiA+IAlERUNMQVJFX01NX1dBTEtfRkxBR1Moc3RhdGUsIG1tLCBzdGFydCwgZW5kLAo+ID4g
CQkJCU1NX1dBTEtfSE9MRVMgfCBNTV9XQUxLX0FMTF9TSVpFUyk7Cj4gPiAKPiA+IAl3YWxrX2Vh
Y2hfcHRlKHN0YXRlKSB7Cj4gPiAJCXN3aXRjaCAoc3RhdGUtPnNpemUpIHsKPiA+IAkJY2FzZSBQ
RV9TSVpFX1BURToKPiA+IAkJCS4uLiAKPiA+IAkJY2FzZSBQRV9TSVpFX1BNRDoKPiA+IAkJCWlm
ICguLi4oc3RhdGUtPnBtZCkpCj4gPiAJCQkJY29udGludWU7Cj4gCj4gWW91IG5lZWQgdG8gYmUg
YWJsZSB0byBzaWduYWwgd2hldGhlciB5b3Ugd2FudCB0byBkZXNjZW5kIGludG8gdGhlIFBNRAo+
IG9yIHNraXAgdGhlIGVudGlyZSBwYXJ0IG9mIHRoZSB0cmVlLiBUaGlzIHdhcyBteSBza2lwX3Bt
ZCgpIGZ1bmN0aW9uIGFib3ZlLgoKRG8geW91PyAgTXkgYXNzdW1wdGlvbiB3YXMgdGhhdCBpZiB0
aGVyZSdzIGEgUE1EIGVudHJ5LCB5b3UgZWl0aGVyIHdhbnQKdG8gYmUgY2FsbGVkIG9uY2UgZm9y
IHRoZSBlbnRpcmUgUE1EIGVudHJ5LCBvciA1MTIgdGltZXMgZm9yIGVhY2ggUFRFCmVudHJ5IHRo
YXQgd291bGQgYmUgaW4gdGhlIFBNRCBpZiBpdCBoYWRuJ3QgYmVlbiBjb2xsYXBzZWQsIGFuZCB5
b3UKY291bGQgaW5kaWNhdGUgdGhpcyB0aHJvdWdoIGEgZmxhZyBpbiB0aGUgc3RhdGUuICBJcyBp
dCBtb3JlIGR5bmFtaWMKdGhhbiB0aGF0IGZvciBzb21lIHVzZXJzPwoKSW4gYW55IGNhc2UsIHdl
IGNvdWxkIGhhdmUgYSBza2lwX3BtZCgmc3RhdGUpIGZ1bmN0aW9uOyBJJ20ganVzdCBub3QKc3Vy
ZSB3ZSBuZWVkIGl0LgoKPiA+IAkJLi4uCj4gPiAJCX0KPiA+IAl9Cj4gPiAKPiA+IFRoZXJlJ3Mg
bm8gbmVlZCB0byBoYXZlIHN0YXJ0IC8gZW5kIHdhbGsgZnVuY3Rpb24gY2FsbHMuCj4gCj4gWW91
J3ZlIGdvdCBhIHN0YXJ0IHdhbGsgZnVuY3Rpb24gKGl0J3MgeW91ciBERUNMQVJFX01NX1dBTEtf
RkxBR1MKPiBhYm92ZSkuIFRoZSBlbmQgd2FsayBJIGFncmVlIEkgdGhpbmsgeW91IGRvbid0IGFj
dHVhbGx5IG5lZWQgaXQgc2luY2UKPiBzdHJ1Y3QgbW1fd2Fsa19zdGF0ZSBjb250YWlucyBhbGwg
dGhlIHN0YXRlLgoKQWgsIEkgbWlzdW5kZXJzdG9vZCB3aGF0IHlvdSBtZWFudC4KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
