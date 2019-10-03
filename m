Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 59ECFCB552
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2019 09:40:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04BA86EADA;
	Fri,  4 Oct 2019 07:39:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 226D16EA7D
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Oct 2019 21:12:06 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 6E09AAF2A;
 Thu,  3 Oct 2019 21:12:04 +0000 (UTC)
Date: Thu, 3 Oct 2019 14:10:50 -0700
From: Davidlohr Bueso <dave@stgolabs.net>
To: Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH -next 00/11] lib/interval-tree: move to half closed
 intervals
Message-ID: <20191003211050.5xwndt7ua4gw4tfq@linux-p48b>
Mail-Followup-To: Matthew Wilcox <willy@infradead.org>,
 akpm@linux-foundation.org, walken@google.com, peterz@infradead.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 dri-devel@lists.freedesktop.org, linux-rdma@vger.kernel.org
References: <20191003201858.11666-1-dave@stgolabs.net>
 <20191003203250.GE32665@bombadil.infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191003203250.GE32665@bombadil.infradead.org>
User-Agent: NeoMutt/20180716
X-Mailman-Approved-At: Fri, 04 Oct 2019 07:38:50 +0000
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
Cc: peterz@infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org, akpm@linux-foundation.org,
 walken@google.com, linux-rdma@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAwMyBPY3QgMjAxOSwgTWF0dGhldyBXaWxjb3ggd3JvdGU6Cgo+T24gVGh1LCBPY3Qg
MDMsIDIwMTkgYXQgMDE6MTg6NDdQTSAtMDcwMCwgRGF2aWRsb2hyIEJ1ZXNvIHdyb3RlOgo+PiBJ
dCBoYXMgYmVlbiBkaXNjdXNzZWRbMSwyXSB0aGF0IGFsbW9zdCBhbGwgdXNlcnMgb2YgaW50ZXJ2
YWwgdHJlZXMgd291bGQgYmV0dGVyCj4+IGJlIHNlcnZlZCBpZiB0aGUgaW50ZXJ2YWxzIHdlcmUg
YWN0dWFsbHkgbm90IFthLGJdLCBidXQgaW5zdGVhZCBbYSwgYikuIFRoaXMKPgo+U28gaG93IGRv
ZXMgYSB1c2VyIHJlcHJlc2VudCBhIHJhbmdlIGZyb20gVUxPTkdfTUFYIHRvIFVMT05HX01BWCBu
b3c/CgpJIHdvdWxkIGFzc3VtZSB0aGF0IGFueSBzdWNoIGxvb2t1cHMgd291bGQgYmUgc3RhYiBx
dWVyaWVzIChhbm9uL3ZtYSBpbnRlcnZhbAp0cmVlKS4gU28gYm90aCBhbm9uIGFuZCBmaWxlcy4g
QW5kIHllYWgsIEkgYmxpc3NmdWxseSBpZ25vcmVkIGFueSBvdmVyZmxvdyBzY2VuYXJpb3MuClRo
aXMgc2hvdWxkIGF0IGxlYXN0IGJlIGRvY3VtZW50ZWQuCgo+Cj5JIHRoaW5rIHRoZSBwcm9ibGVt
IGlzIHRoYXQgbGFyZ2UgcGFydHMgb2YgdGhlIGtlcm5lbCBqdXN0IGRvbid0IGNvbnNpZGVyCj5p
bnRlZ2VyIG92ZXJmbG93LiAgQmVjYXVzZSB3ZSB3cml0ZSBpbiBDLCBpdCdzIG5hdHVyYWwgdG8g
d3JpdGU6Cj4KPglmb3IgKGkgPSBzdGFydDsgaSA8IGVuZDsgaSsrKQo+Cj5hbmQganVzdCBhc3N1
bWUgdGhhdCB3ZSBuZXZlciBuZWVkIHRvIGhpdCBVTE9OR19NQVggb3IgVUlOVF9NQVguCgpTaW1p
bGFybHksIEkgZGlkIG5vdCBhZGp1c3QgcXVlcmllcyBzdWNoIGFzIDAgdG8gVUxPTkdfTUFYLCB3
aGljaCBhcmUgYWN0dWFsbHkKcmVhbCwgdGhlbiBhZ2FpbiBhbnkgaW50ZXJzZWN0aW5nIHJhbmdl
cyB3aWxsIG1vc3QgbGlrZWx5IG5vdCBldmVuIGJlIGNsb3NlIHRvCmVuZC4KCj5JZiB3ZSdyZSBz
dG9yaW5nIGFkZHJlc3NlcywgdGhhdCdzIGdlbmVyYWxseSB0cnVlIC0tIG1vc3QgYXJjaGl0ZWN0
dXJlcwo+ZG9uJ3QgYWxsb3cgYWRkcmVzc2VzIGluIHRoZSAtUEFHRV9TSVpFIHRvIFVMT05HX01B
WCByYW5nZSAob3IgdGhleSdkCj5oYXZlIHRyb3VibGUgd2l0aCBQVFJfRVJSKS4gIElmIHlvdSdy
ZSBsb29raW5nIGF0IGZpbGUgc2l6ZXMsIHRoYXQncwo+bm90IHRydWUgb24gMzItYml0IG1hY2hp
bmVzLCBhbmQgd2UndmUgZGVmaW5pdGVseSBzZWVuIGZpbGVzeXN0ZW0gYnVncwo+d2l0aCBmaWxl
cyBudWRnaW5nIHVwIG9uIDE2VEIgKG9uIDMyIGJpdCB3aXRoIDRrIHBhZ2Ugc2l6ZSkuICBPciBi
bG9jawo+ZHJpdmVyIGJ1Z3Mgd2l0aCBzaW1pbGFybHkgc2l6ZWQgYmxvY2sgZGV2aWNlcy4KPgo+
U28sIHllYWgsIGVhc2llciB0byB1c2UuICBCdXQgZGFtbmluZyBjb3JuZXIgY2FzZXMuCgpJIGFn
cmVlLgoKVGhhbmtzLApEYXZpZGxvaHIKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
