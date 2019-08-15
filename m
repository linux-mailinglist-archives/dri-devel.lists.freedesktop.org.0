Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 566098F2BA
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2019 20:03:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39B756EA18;
	Thu, 15 Aug 2019 18:03:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 820C76E9EA;
 Thu, 15 Aug 2019 18:03:28 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 161762A09AF;
 Thu, 15 Aug 2019 18:03:28 +0000 (UTC)
Received: from redhat.com (unknown [10.20.6.178])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F1A13600CD;
 Thu, 15 Aug 2019 18:03:26 +0000 (UTC)
Date: Thu, 15 Aug 2019 14:03:25 -0400
From: Jerome Glisse <jglisse@redhat.com>
To: Dan Williams <dan.j.williams@intel.com>
Subject: Re: [PATCH 04/15] mm: remove the pgmap field from struct hmm_vma_walk
Message-ID: <20190815180325.GA4920@redhat.com>
References: <20190806160554.14046-1-hch@lst.de>
 <20190806160554.14046-5-hch@lst.de>
 <20190807174548.GJ1571@mellanox.com>
 <CAPcyv4hPCuHBLhSJgZZEh0CbuuJNPLFDA3f-79FX5uVOO0yubA@mail.gmail.com>
 <20190808065933.GA29382@lst.de>
 <CAPcyv4hMUzw8vyXFRPe2pdwef0npbMm9tx9wiZ9MWkHGhH1V6w@mail.gmail.com>
 <20190814073854.GA27249@lst.de>
 <20190814132746.GE13756@mellanox.com>
 <CAPcyv4g8usp8prJ+1bMtyV1xuedp5FKErBp-N8+KzR=rJ-v0QQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPcyv4g8usp8prJ+1bMtyV1xuedp5FKErBp-N8+KzR=rJ-v0QQ@mail.gmail.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.38]); Thu, 15 Aug 2019 18:03:28 +0000 (UTC)
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
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Jason Gunthorpe <jgg@mellanox.com>,
 Ben Skeggs <bskeggs@redhat.com>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBBdWcgMTQsIDIwMTkgYXQgMDc6NDg6MjhBTSAtMDcwMCwgRGFuIFdpbGxpYW1zIHdy
b3RlOgo+IE9uIFdlZCwgQXVnIDE0LCAyMDE5IGF0IDY6MjggQU0gSmFzb24gR3VudGhvcnBlIDxq
Z2dAbWVsbGFub3guY29tPiB3cm90ZToKPiA+Cj4gPiBPbiBXZWQsIEF1ZyAxNCwgMjAxOSBhdCAw
OTozODo1NEFNICswMjAwLCBDaHJpc3RvcGggSGVsbHdpZyB3cm90ZToKPiA+ID4gT24gVHVlLCBB
dWcgMTMsIDIwMTkgYXQgMDY6MzY6MzNQTSAtMDcwMCwgRGFuIFdpbGxpYW1zIHdyb3RlOgo+ID4g
PiA+IFNlY3Rpb24gYWxpZ25tZW50IGNvbnN0cmFpbnRzIHNvbWV3aGF0IHNhdmUgdXMgaGVyZS4g
VGhlIG9ubHkgZXhhbXBsZQo+ID4gPiA+IEkgY2FuIHRoaW5rIG9mIGEgUE1EIG5vdCBjb250YWlu
aW5nIGEgdW5pZm9ybSBwZ21hcCBhc3NvY2lhdGlvbiBmb3IKPiA+ID4gPiBlYWNoIHB0ZSBpcyB0
aGUgY2FzZSB3aGVuIHRoZSBwZ21hcCBvdmVybGFwcyBub3JtYWwgZHJhbSwgaS5lLiBzaGFyZXMK
PiA+ID4gPiB0aGUgc2FtZSAnc3RydWN0IG1lbW9yeV9zZWN0aW9uJyBmb3IgYSBnaXZlbiBzcGFu
LiBPdGhlcndpc2UsIGRpc3RpbmN0Cj4gPiA+ID4gcGdtYXBzIGFycmFuZ2UgdG8gbWFuYWdlIHRo
ZWlyIG93biBleGNsdXNpdmUgc2VjdGlvbnMgKGFuZCBub3cKPiA+ID4gPiBzdWJzZWN0aW9ucyBh
cyBvZiB2NS4zKS4gT3RoZXJ3aXNlIHRoZSBpbXBsZW1lbnRhdGlvbiBjb3VsZCBub3QKPiA+ID4g
PiBndWFyYW50ZWUgZGlmZmVyZW50IG1hcHBpbmcgbGlmZXRpbWVzLgo+ID4gPiA+Cj4gPiA+ID4g
VGhhdCBzYWlkLCB0aGlzIHNlZW1zIHRvIHdhbnQgYSBiZXR0ZXIgbWVjaGFuaXNtIHRvIGRldGVy
bWluZSAicGZuIGlzCj4gPiA+ID4gWk9ORV9ERVZJQ0UiLgo+ID4gPgo+ID4gPiBTbyBJIGd1ZXNz
IHRoaXMgcGF0Y2ggaXMgZmluZSBmb3Igbm93LCBhbmQgb25jZSB5b3UgcHJvdmlkZSBhIGJldHRl
cgo+ID4gPiBtZWNoYW5pc20gd2UgY2FuIHN3aXRjaCBvdmVyIHRvIGl0Pwo+ID4KPiA+IFdoYXQg
YWJvdXQgdGhlIHZlcnNpb24gSSBzZW50IHRvIGp1c3QgZ2V0IHJpZCBvZiBhbGwgdGhlIHN0cmFu
Z2UKPiA+IHB1dF9kZXZfcGFnZW1hcHMgd2hpbGUgc2Nhbm5pbmc/IE9kZHMgYXJlIGdvb2Qgd2Ug
d2lsbCB3b3JrIHdpdGggb25seQo+ID4gYSBzaW5nbGUgcGFnZW1hcCwgc28gaXQgbWFrZXMgc29t
ZSBzZW5zZSB0byBjYWNoZSBpdCBvbmNlIHdlIGZpbmQgaXQ/Cj4gCj4gWWVzLCBpZiB0aGUgc2Nh
biBpcyBvdmVyIGEgc2luZ2xlIHBtZCB0aGVuIGNhY2hpbmcgaXQgbWFrZXMgc2Vuc2UuCgpRdWl0
ZSBmcmFua2x5IGFuIGVhc2llciBhbiBiZXR0ZXIgc29sdXRpb24gaXMgdG8gcmVtb3ZlIHRoZSBw
YWdlbWFwCmxvb2t1cCBhcyBITU0gdXNlciBhYmlkZSBieSBtbXUgbm90aWZpZXIgaXQgbWVhbnMg
d2Ugd2lsbCBub3QgbWFrZQp1c2Ugb3IgZGVyZWZlcmVuY2UgdGhlIHN0cnVjdCBwYWdlIHNvIHRo
YXQgd2UgYXJlIHNhZmUgZnJvbSBhbnkKcmFjaW5nIGhvdHVucGx1ZyBvZiBkYXggbWVtb3J5IChh
cyBsb25nIGFzIGRldmljZSBkcml2ZXIgdXNpbmcgaG1tCmRvIG5vdCBoYXZlIGEgYnVnKS4KCkNo
ZWVycywKSsOpcsO0bWUKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
