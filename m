Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 25D5B8F5FE
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2019 22:51:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBFC06EA7B;
	Thu, 15 Aug 2019 20:51:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F49D6EA77;
 Thu, 15 Aug 2019 20:51:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id CD57286663;
 Thu, 15 Aug 2019 20:51:35 +0000 (UTC)
Received: from redhat.com (unknown [10.20.6.178])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C77D017B64;
 Thu, 15 Aug 2019 20:51:34 +0000 (UTC)
Date: Thu, 15 Aug 2019 16:51:33 -0400
From: Jerome Glisse <jglisse@redhat.com>
To: Jason Gunthorpe <jgg@mellanox.com>
Subject: Re: [PATCH 04/15] mm: remove the pgmap field from struct hmm_vma_walk
Message-ID: <20190815205132.GC25517@redhat.com>
References: <CAPcyv4hMUzw8vyXFRPe2pdwef0npbMm9tx9wiZ9MWkHGhH1V6w@mail.gmail.com>
 <20190814073854.GA27249@lst.de>
 <20190814132746.GE13756@mellanox.com>
 <CAPcyv4g8usp8prJ+1bMtyV1xuedp5FKErBp-N8+KzR=rJ-v0QQ@mail.gmail.com>
 <20190815180325.GA4920@redhat.com>
 <CAPcyv4g4hzcEA=TPYVTiqpbtOoS30ahogRUttCvQAvXQbQjfnw@mail.gmail.com>
 <20190815194339.GC9253@redhat.com>
 <CAPcyv4jid8_=-8hBpn_Qm=c4S8BapL9B9RGT7e9uu303yH=Yqw@mail.gmail.com>
 <20190815203306.GB25517@redhat.com>
 <20190815204128.GI22970@mellanox.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190815204128.GI22970@mellanox.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.26]); Thu, 15 Aug 2019 20:51:36 +0000 (UTC)
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
Cc: Ralph Campbell <rcampbell@nvidia.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Ben Skeggs <bskeggs@redhat.com>,
 Dan Williams <dan.j.williams@intel.com>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBBdWcgMTUsIDIwMTkgYXQgMDg6NDE6MzNQTSArMDAwMCwgSmFzb24gR3VudGhvcnBl
IHdyb3RlOgo+IE9uIFRodSwgQXVnIDE1LCAyMDE5IGF0IDA0OjMzOjA2UE0gLTA0MDAsIEplcm9t
ZSBHbGlzc2Ugd3JvdGU6Cj4gCj4gPiBTbyBub3IgSE1NIG5vciBkcml2ZXIgc2hvdWxkIGRlcmVm
ZXJlbmNlIHRoZSBzdHJ1Y3QgcGFnZSAoaSBkbyBub3QKPiA+IHRoaW5rIGFueSBpb21tdSBkcml2
ZXIgd291bGQgZWl0aGVyKSwKPiAKPiBFciwgdGhleSBkbyB0ZWNobmljYWxseSBkZXJlZiB0aGUg
c3RydWN0IHBhZ2U6Cj4gCj4gbm91dmVhdV9kbWVtX2NvbnZlcnRfcGZuKHN0cnVjdCBub3V2ZWF1
X2RybSAqZHJtLAo+IAkJCSBzdHJ1Y3QgaG1tX3JhbmdlICpyYW5nZSkKPiAJCXN0cnVjdCBwYWdl
ICpwYWdlOwo+IAkJcGFnZSA9IGhtbV9wZm5fdG9fcGFnZShyYW5nZSwgcmFuZ2UtPnBmbnNbaV0p
Owo+IAkJaWYgKCFub3V2ZWF1X2RtZW1fcGFnZShkcm0sIHBhZ2UpKSB7Cj4gCj4gCj4gbm91dmVh
dV9kbWVtX3BhZ2Uoc3RydWN0IG5vdXZlYXVfZHJtICpkcm0sIHN0cnVjdCBwYWdlICpwYWdlKQo+
IHsKPiAJcmV0dXJuIGlzX2RldmljZV9wcml2YXRlX3BhZ2UocGFnZSkgJiYgZHJtLT5kbWVtID09
IHBhZ2VfdG9fZG1lbShwYWdlKQo+IAo+IAo+IFdoaWNoIGRvZXMgdG91Y2ggJ3BhZ2UtPnBnbWFw
Jwo+IAo+IElzIHRoaXMgT0sgd2l0aG91dCBoYXZpbmcgYSBnZXRfZGV2X3BhZ2VtYXAoKSA/Cj4K
PiBOb3RpbmcgdGhhdCB0aGUgY29sbGlzaW9uLXJldHJ5IHNjaGVtZSBkb2Vzbid0IHByb3RlY3Qg
YW55dGhpbmcgaGVyZQo+IGFzIHdlIGNhbiBoYXZlIGEgY29uY3VycmVudCBpbnZhbGlkYXRpb24g
d2hpbGUgZG9pbmcgdGhlIGFib3ZlIGRlcmVmLgoKVWggPyBIb3cgc28gPyBXZSBhcmUgbm90IHJl
YWRpbmcgdGhlIHNhbWUgY29kZSBpIHRoaW5rLgoKTXkgcmVhZCBpcyB0aGF0IGZ1bmN0aW9uIGlz
IGNhbGwgd2hlbiBob2xkaW5nIHRoZSBkZXZpY2UKbG9jayB3aGljaCBleGNsdWRlIGFueSByYWNp
bmcgbW11IG5vdGlmaWVyIGZyb20gbWFraW5nCmZvcndhcmQgcHJvZ3Jlc3MgYW5kIGl0IGlzIGFs
c28gcHJvdGVjdGVkIGJ5IHRoZSByYW5nZSBzbwphdCB0aGUgdGltZSB0aGlzIGhhcHBlbnMgaXQg
aXMgc2FmZSB0byBkZXJlZmVyZW5jZSB0aGUKc3RydWN0IHBhZ2UuIEluIHRoaXMgY2FzZSBhbnkg
d2F5IHdlIGNhbiB1cGRhdGUgdGhlCm5vdXZlYXVfZG1lbV9wYWdlKCkgdG8gY2hlY2sgdGhhdCBw
YWdlIHBhZ2UtPnBnbWFwID09IHRoZQpleHBlY3RlZCBwZ21hcC4KCkNoZWVycywKSsOpcsO0bWUK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
