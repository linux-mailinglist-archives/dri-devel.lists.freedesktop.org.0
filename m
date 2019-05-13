Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD4761BF87
	for <lists+dri-devel@lfdr.de>; Tue, 14 May 2019 00:37:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A585891E2;
	Mon, 13 May 2019 22:37:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3807D891E1;
 Mon, 13 May 2019 22:37:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 3FB3D4E90E;
 Mon, 13 May 2019 22:37:06 +0000 (UTC)
Received: from redhat.com (ovpn-112-22.rdu2.redhat.com [10.10.112.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B73AD60856;
 Mon, 13 May 2019 22:37:04 +0000 (UTC)
Date: Mon, 13 May 2019 18:37:01 -0400
From: Jerome Glisse <jglisse@redhat.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH 1/2] mm/hmm: support automatic NUMA balancing
Message-ID: <20190513223700.GA673@redhat.com>
References: <20190510195258.9930-1-Felix.Kuehling@amd.com>
 <20190510195258.9930-2-Felix.Kuehling@amd.com>
 <20190513142720.3334a98cbabaae67b4ffbb5a@linux-foundation.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190513142720.3334a98cbabaae67b4ffbb5a@linux-foundation.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.38]); Mon, 13 May 2019 22:37:06 +0000 (UTC)
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
Cc: "Yang, Philip" <Philip.Yang@amd.com>,
 "alex.deucher@amd.com" <alex.deucher@amd.com>, "Kuehling,
 Felix" <Felix.Kuehling@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBNYXkgMTMsIDIwMTkgYXQgMDI6Mjc6MjBQTSAtMDcwMCwgQW5kcmV3IE1vcnRvbiB3
cm90ZToKPiBPbiBGcmksIDEwIE1heSAyMDE5IDE5OjUzOjIzICswMDAwICJLdWVobGluZywgRmVs
aXgiIDxGZWxpeC5LdWVobGluZ0BhbWQuY29tPiB3cm90ZToKPiAKPiA+IEZyb206IFBoaWxpcCBZ
YW5nIDxQaGlsaXAuWWFuZ0BhbWQuY29tPgo+ID4gCj4gPiBXaGlsZSB0aGUgcGFnZSBpcyBtaWdy
YXRpbmcgYnkgTlVNQSBiYWxhbmNpbmcsIEhNTSBmYWlsZWQgdG8gZGV0ZWN0IHRoaXMKPiA+IGNv
bmRpdGlvbiBhbmQgc3RpbGwgcmV0dXJuIHRoZSBvbGQgcGFnZS4gQXBwbGljYXRpb24gd2lsbCB1
c2UgdGhlIG5ldwo+ID4gcGFnZSBtaWdyYXRlZCwgYnV0IGRyaXZlciBwYXNzIHRoZSBvbGQgcGFn
ZSBwaHlzaWNhbCBhZGRyZXNzIHRvIEdQVSwKPiA+IHRoaXMgY3Jhc2ggdGhlIGFwcGxpY2F0aW9u
IGxhdGVyLgo+ID4gCj4gPiBVc2UgcHRlX3Byb3Rub25lKHB0ZSkgdG8gcmV0dXJuIHRoaXMgY29u
ZGl0aW9uIGFuZCB0aGVuIGhtbV92bWFfZG9fZmF1bHQKPiA+IHdpbGwgYWxsb2NhdGUgbmV3IHBh
Z2UuCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IFBoaWxpcCBZYW5nIDxQaGlsaXAuWWFuZ0BhbWQu
Y29tPgo+IAo+IFRoaXMgc2hvdWxkIGhhdmUgaW5jbHVkZWQgeW91ciBzaWduZWQtb2ZmLWJ5Oiwg
c2luY2UgeW91IHdlcmUgb24gdGhlCj4gcGF0Y2ggZGVsaXZlcnkgcGF0aC4gIEknbGwgbWFrZSB0
aGF0IGNoYW5nZSB0byBteSBjb3B5IG9mIHRoZSBwYXRjaCwKPiBPSz8KClllcyBpdCBzaG91bGQg
aGF2ZSBpbmNsdWRlZCB0aGF0LgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
