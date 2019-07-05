Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96A4A60271
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jul 2019 10:42:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D80626E447;
	Fri,  5 Jul 2019 08:41:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 451076E3FC
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jul 2019 04:09:20 +0000 (UTC)
Received: from static-50-53-52-16.bvtn.or.frontiernet.net ([50.53.52.16]
 helo=dragon.dunlab)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hjFXC-0007w4-C8; Fri, 05 Jul 2019 04:09:18 +0000
Subject: Re: mmotm 2019-07-04-15-01 uploaded (gpu/drm/i915/oa/)
To: Masahiro Yamada <yamada.masahiro@socionext.com>
References: <20190704220152.1bF4q6uyw%akpm@linux-foundation.org>
 <80bf2204-558a-6d3f-c493-bf17b891fc8a@infradead.org>
 <CAK7LNAQc1xYoet1o8HJVGKuonUV40MZGpK7eHLyUmqet50djLw@mail.gmail.com>
 <CAK7LNASLfyreDPvNuL1svvHPC0woKnXO_bsNku4DMK6UNn4oHw@mail.gmail.com>
 <5e5353e2-bfab-5360-26b2-bf8c72ac7e70@infradead.org>
 <CAK7LNATF+D5TgTZijG3EPBVON5NmN+JcwmCBvnvkMFyR+3wF2A@mail.gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <8868b3fc-ba16-2b01-4ebb-4bdefc2f9e18@infradead.org>
Date: Thu, 4 Jul 2019 21:09:15 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <CAK7LNATF+D5TgTZijG3EPBVON5NmN+JcwmCBvnvkMFyR+3wF2A@mail.gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Fri, 05 Jul 2019 08:41:21 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EpLpp6d5ev9UdUsgMU6f1l10/dE3Pg2qZg1140QaSWM=; b=b1jq75dxQbtB+7a65u6Rylo1L
 01T+/tPNKG4kAsias6gKT+e74KMYqsNVmHNpVUoATOVU43k0Q/oYEhbxb7uASluBzw9t31DXxOL4F
 VX9z+yb05Q+x9j+UVT6qB5SgP2QBi4gKgLvzIk7PpgKOFDOM75PF44vgjqpqzs1tXlSKHC82n/NJR
 mcjMdya35Mmn8wRdnCrJX1ijkuZzv7v7xGKF4UDt8ePkXqFbZInlYET+gWKS5rEU+CyZuoTWm3XSc
 Hk7S9UcSvq651qhTErC6lu0KudmoNoOKgrdnKQPc+r9geI20Fp6U2sgvPOInrz+2PZxT+v0SZsNyA
 uxb8DneeQ==;
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, mm-commits@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, mhocko@suse.cz,
 linux-mm@kvack.org, Mark Brown <broonie@kernel.org>,
 Linux-Next Mailing List <linux-next@vger.kernel.org>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gNy80LzE5IDg6NDQgUE0sIE1hc2FoaXJvIFlhbWFkYSB3cm90ZToKPiBPbiBGcmksIEp1bCA1
LCAyMDE5IGF0IDEyOjIzIFBNIFJhbmR5IER1bmxhcCA8cmR1bmxhcEBpbmZyYWRlYWQub3JnPiB3
cm90ZToKPj4KPj4gT24gNy80LzE5IDg6MDkgUE0sIE1hc2FoaXJvIFlhbWFkYSB3cm90ZToKPj4+
IE9uIEZyaSwgSnVsIDUsIDIwMTkgYXQgMTI6MDUgUE0gTWFzYWhpcm8gWWFtYWRhCj4+PiA8eWFt
YWRhLm1hc2FoaXJvQHNvY2lvbmV4dC5jb20+IHdyb3RlOgo+Pj4+Cj4+Pj4gT24gRnJpLCBKdWwg
NSwgMjAxOSBhdCAxMDowOSBBTSBSYW5keSBEdW5sYXAgPHJkdW5sYXBAaW5mcmFkZWFkLm9yZz4g
d3JvdGU6Cj4+Pj4+Cj4+Pj4+IE9uIDcvNC8xOSAzOjAxIFBNLCBha3BtQGxpbnV4LWZvdW5kYXRp
b24ub3JnIHdyb3RlOgo+Pj4+Pj4gVGhlIG1tLW9mLXRoZS1tb21lbnQgc25hcHNob3QgMjAxOS0w
Ny0wNC0xNS0wMSBoYXMgYmVlbiB1cGxvYWRlZCB0bwo+Pj4+Pj4KPj4+Pj4+ICAgIGh0dHA6Ly93
d3cub3psYWJzLm9yZy9+YWtwbS9tbW90bS8KPj4+Pj4+Cj4+Pj4+PiBtbW90bS1yZWFkbWUudHh0
IHNheXMKPj4+Pj4+Cj4+Pj4+PiBSRUFETUUgZm9yIG1tLW9mLXRoZS1tb21lbnQ6Cj4+Pj4+Pgo+
Pj4+Pj4gaHR0cDovL3d3dy5vemxhYnMub3JnL35ha3BtL21tb3RtLwo+Pj4+Pgo+Pj4+PiBJIGdl
dCBhIGxvdCBvZiB0aGVzZSBidXQgZG9uJ3Qgc2VlL2tub3cgd2hhdCBjYXVzZXMgdGhlbToKPj4+
Pj4KPj4+Pj4gLi4vc2NyaXB0cy9NYWtlZmlsZS5idWlsZDo0MjogLi4vZHJpdmVycy9ncHUvZHJt
L2k5MTUvb2EvTWFrZWZpbGU6IE5vIHN1Y2ggZmlsZSBvciBkaXJlY3RvcnkKPj4+Pj4gbWFrZVs2
XTogKioqIE5vIHJ1bGUgdG8gbWFrZSB0YXJnZXQgJy4uL2RyaXZlcnMvZ3B1L2RybS9pOTE1L29h
L01ha2VmaWxlJy4gIFN0b3AuCj4+Pj4+IC4uL3NjcmlwdHMvTWFrZWZpbGUuYnVpbGQ6NDk4OiBy
ZWNpcGUgZm9yIHRhcmdldCAnZHJpdmVycy9ncHUvZHJtL2k5MTUvb2EnIGZhaWxlZAo+Pj4+PiBt
YWtlWzVdOiAqKiogW2RyaXZlcnMvZ3B1L2RybS9pOTE1L29hXSBFcnJvciAyCj4+Pj4+IC4uL3Nj
cmlwdHMvTWFrZWZpbGUuYnVpbGQ6NDk4OiByZWNpcGUgZm9yIHRhcmdldCAnZHJpdmVycy9ncHUv
ZHJtL2k5MTUnIGZhaWxlZAo+Pj4+Pgo+Pj4+Cj4+Pj4gSSBjaGVja2VkIG5leHQtMjAxOTA3MDQg
dGFnLgo+Pj4+Cj4+Pj4gSSBzZWUgdGhlIGVtcHR5IGZpbGUKPj4+PiBkcml2ZXJzL2dwdS9kcm0v
aTkxNS9vYS9NYWtlZmlsZQo+Pj4+Cj4+Pj4gRGlkIHNvbWVvbmUgZGVsZXRlIGl0Pwo+Pj4+Cj4+
Pgo+Pj4KPj4+IEkgdGhpbmsgIm9iai15ICs9IG9hLyIKPj4+IGluIGRyaXZlcnMvZ3B1L2RybS9p
OTE1L01ha2VmaWxlCj4+PiBpcyByZWR1bmRhbnQuCj4+Cj4+IFRoYW5rcy4gIEl0IHNlZW1zIHRv
IGJlIHdvcmtpbmcgYWZ0ZXIgZGVsZXRpbmcgdGhhdCBsaW5lLgo+IAo+IAo+IENvdWxkIHlvdSBj
aGVjayB3aGV0aGVyIG9yIG5vdAo+IGRyaXZlcnMvZ3B1L2RybS9pOTE1L29hL01ha2VmaWxlIGV4
aXN0cyBpbiB5b3VyIHNvdXJjZSB0cmVlPwoKSXQgZG9lcyBub3QuCgo+IFlvdXIgYnVpbGQgbG9n
IHNheXMgaXQgd2FzIG1pc3NpbmcuCj4gCj4gQnV0LCBjb21taXQgNWVkN2EwY2YzMzk0ICgiZHJt
L2k5MTU6IE1vdmUgT0EgZmlsZXMgdG8gc2VwYXJhdGUgZm9sZGVyIikKPiBhZGRlZCBpdC4gIChJ
dCBpcyBqdXN0IGFuIGVtcHR5IGZpbGUpCj4gCj4gSSBhbSBqdXN0IHdvbmRlcmluZyB3aHkuCgpJ
IGFtIG5vdCB1c2luZyBhbnkgZ2l0IHRyZWUocykgZm9yIHRoaXMuICBKdXN0IHBhdGNoZXMuCgpU
aGF0IE1ha2VmaWxlIGlzIGluIHBhdGNoLXY1LjItcmM3LW5leHQtMjAxOTA3MDQueHouCgpJIGRv
bid0IGtub3cgaG93IEFuZHJldyBnZW5lcmF0ZXMgdGhlIGxpbnV4LW5leHQucGF0Y2ggZmlsZSBm
b3IgbW1vdG0sCmJ1dCBJIGRvbid0IHNlZSB0aGF0IE1ha2VmaWxlIGFueXdoZXJlIGluIG1tb3Rt
LCBhbHRob3VnaCB0aGUgcmVzdCBvZgp0aGUgaTkxNS9vYS8gZmlsZXMgc2VlbXMgdG8gYmUgdGhl
cmUuCgpNYXliZSBkaWZmIHNraXBzIGVtcHR5IGZpbGVzIHVubGVzcyB0b2xkIHRvIHNhdmUgdGhl
bT8KCi0tIAp+UmFuZHkKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
