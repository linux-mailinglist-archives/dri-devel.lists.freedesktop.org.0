Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D7BA8F4EE
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2019 21:43:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 738206EA64;
	Thu, 15 Aug 2019 19:43:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACA246EA64;
 Thu, 15 Aug 2019 19:43:44 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 3690B300C72E;
 Thu, 15 Aug 2019 19:43:44 +0000 (UTC)
Received: from redhat.com (unknown [10.20.6.178])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6F4BA177C5;
 Thu, 15 Aug 2019 19:43:41 +0000 (UTC)
Date: Thu, 15 Aug 2019 15:43:39 -0400
From: Jerome Glisse <jglisse@redhat.com>
To: Dan Williams <dan.j.williams@intel.com>
Subject: Re: [PATCH 04/15] mm: remove the pgmap field from struct hmm_vma_walk
Message-ID: <20190815194339.GC9253@redhat.com>
References: <20190806160554.14046-5-hch@lst.de>
 <20190807174548.GJ1571@mellanox.com>
 <CAPcyv4hPCuHBLhSJgZZEh0CbuuJNPLFDA3f-79FX5uVOO0yubA@mail.gmail.com>
 <20190808065933.GA29382@lst.de>
 <CAPcyv4hMUzw8vyXFRPe2pdwef0npbMm9tx9wiZ9MWkHGhH1V6w@mail.gmail.com>
 <20190814073854.GA27249@lst.de>
 <20190814132746.GE13756@mellanox.com>
 <CAPcyv4g8usp8prJ+1bMtyV1xuedp5FKErBp-N8+KzR=rJ-v0QQ@mail.gmail.com>
 <20190815180325.GA4920@redhat.com>
 <CAPcyv4g4hzcEA=TPYVTiqpbtOoS30ahogRUttCvQAvXQbQjfnw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPcyv4g4hzcEA=TPYVTiqpbtOoS30ahogRUttCvQAvXQbQjfnw@mail.gmail.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.45]); Thu, 15 Aug 2019 19:43:44 +0000 (UTC)
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

T24gVGh1LCBBdWcgMTUsIDIwMTkgYXQgMTI6MzY6NThQTSAtMDcwMCwgRGFuIFdpbGxpYW1zIHdy
b3RlOgo+IE9uIFRodSwgQXVnIDE1LCAyMDE5IGF0IDExOjA3IEFNIEplcm9tZSBHbGlzc2UgPGpn
bGlzc2VAcmVkaGF0LmNvbT4gd3JvdGU6Cj4gPgo+ID4gT24gV2VkLCBBdWcgMTQsIDIwMTkgYXQg
MDc6NDg6MjhBTSAtMDcwMCwgRGFuIFdpbGxpYW1zIHdyb3RlOgo+ID4gPiBPbiBXZWQsIEF1ZyAx
NCwgMjAxOSBhdCA2OjI4IEFNIEphc29uIEd1bnRob3JwZSA8amdnQG1lbGxhbm94LmNvbT4gd3Jv
dGU6Cj4gPiA+ID4KPiA+ID4gPiBPbiBXZWQsIEF1ZyAxNCwgMjAxOSBhdCAwOTozODo1NEFNICsw
MjAwLCBDaHJpc3RvcGggSGVsbHdpZyB3cm90ZToKPiA+ID4gPiA+IE9uIFR1ZSwgQXVnIDEzLCAy
MDE5IGF0IDA2OjM2OjMzUE0gLTA3MDAsIERhbiBXaWxsaWFtcyB3cm90ZToKPiA+ID4gPiA+ID4g
U2VjdGlvbiBhbGlnbm1lbnQgY29uc3RyYWludHMgc29tZXdoYXQgc2F2ZSB1cyBoZXJlLiBUaGUg
b25seSBleGFtcGxlCj4gPiA+ID4gPiA+IEkgY2FuIHRoaW5rIG9mIGEgUE1EIG5vdCBjb250YWlu
aW5nIGEgdW5pZm9ybSBwZ21hcCBhc3NvY2lhdGlvbiBmb3IKPiA+ID4gPiA+ID4gZWFjaCBwdGUg
aXMgdGhlIGNhc2Ugd2hlbiB0aGUgcGdtYXAgb3ZlcmxhcHMgbm9ybWFsIGRyYW0sIGkuZS4gc2hh
cmVzCj4gPiA+ID4gPiA+IHRoZSBzYW1lICdzdHJ1Y3QgbWVtb3J5X3NlY3Rpb24nIGZvciBhIGdp
dmVuIHNwYW4uIE90aGVyd2lzZSwgZGlzdGluY3QKPiA+ID4gPiA+ID4gcGdtYXBzIGFycmFuZ2Ug
dG8gbWFuYWdlIHRoZWlyIG93biBleGNsdXNpdmUgc2VjdGlvbnMgKGFuZCBub3cKPiA+ID4gPiA+
ID4gc3Vic2VjdGlvbnMgYXMgb2YgdjUuMykuIE90aGVyd2lzZSB0aGUgaW1wbGVtZW50YXRpb24g
Y291bGQgbm90Cj4gPiA+ID4gPiA+IGd1YXJhbnRlZSBkaWZmZXJlbnQgbWFwcGluZyBsaWZldGlt
ZXMuCj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IFRoYXQgc2FpZCwgdGhpcyBzZWVtcyB0byB3YW50
IGEgYmV0dGVyIG1lY2hhbmlzbSB0byBkZXRlcm1pbmUgInBmbiBpcwo+ID4gPiA+ID4gPiBaT05F
X0RFVklDRSIuCj4gPiA+ID4gPgo+ID4gPiA+ID4gU28gSSBndWVzcyB0aGlzIHBhdGNoIGlzIGZp
bmUgZm9yIG5vdywgYW5kIG9uY2UgeW91IHByb3ZpZGUgYSBiZXR0ZXIKPiA+ID4gPiA+IG1lY2hh
bmlzbSB3ZSBjYW4gc3dpdGNoIG92ZXIgdG8gaXQ/Cj4gPiA+ID4KPiA+ID4gPiBXaGF0IGFib3V0
IHRoZSB2ZXJzaW9uIEkgc2VudCB0byBqdXN0IGdldCByaWQgb2YgYWxsIHRoZSBzdHJhbmdlCj4g
PiA+ID4gcHV0X2Rldl9wYWdlbWFwcyB3aGlsZSBzY2FubmluZz8gT2RkcyBhcmUgZ29vZCB3ZSB3
aWxsIHdvcmsgd2l0aCBvbmx5Cj4gPiA+ID4gYSBzaW5nbGUgcGFnZW1hcCwgc28gaXQgbWFrZXMg
c29tZSBzZW5zZSB0byBjYWNoZSBpdCBvbmNlIHdlIGZpbmQgaXQ/Cj4gPiA+Cj4gPiA+IFllcywg
aWYgdGhlIHNjYW4gaXMgb3ZlciBhIHNpbmdsZSBwbWQgdGhlbiBjYWNoaW5nIGl0IG1ha2VzIHNl
bnNlLgo+ID4KPiA+IFF1aXRlIGZyYW5rbHkgYW4gZWFzaWVyIGFuIGJldHRlciBzb2x1dGlvbiBp
cyB0byByZW1vdmUgdGhlIHBhZ2VtYXAKPiA+IGxvb2t1cCBhcyBITU0gdXNlciBhYmlkZSBieSBt
bXUgbm90aWZpZXIgaXQgbWVhbnMgd2Ugd2lsbCBub3QgbWFrZQo+ID4gdXNlIG9yIGRlcmVmZXJl
bmNlIHRoZSBzdHJ1Y3QgcGFnZSBzbyB0aGF0IHdlIGFyZSBzYWZlIGZyb20gYW55Cj4gPiByYWNp
bmcgaG90dW5wbHVnIG9mIGRheCBtZW1vcnkgKGFzIGxvbmcgYXMgZGV2aWNlIGRyaXZlciB1c2lu
ZyBobW0KPiA+IGRvIG5vdCBoYXZlIGEgYnVnKS4KPiAKPiBZZXMsIGFzIGxvbmcgYXMgdGhlIGRy
aXZlciByZW1vdmUgaXMgc3luY2hyb25pemVkIGFnYWluc3QgSE1NCj4gb3BlcmF0aW9ucyB2aWEg
YW5vdGhlciBtZWNoYW5pc20gdGhlbiB0aGVyZSBpcyBubyBuZWVkIHRvIHRha2UgcGFnZW1hcAo+
IHJlZmVyZW5jZXMuIENhbiB5b3UgYnJpZWZseSBkZXNjcmliZSB3aGF0IHRoYXQgb3RoZXIgbWVj
aGFuaXNtIGlzPwoKU28gaWYgeW91IGhvdHVucGx1ZyBzb21lIGRheCBtZW1vcnkgaSBhc3N1bWUg
dGhhdCB0aGlzIGNhbiBvbmx5CmhhcHBlbnMgb25jZSBhbGwgdGhlIHBhZ2VzIGFyZSB1bm1hcHBl
ZCAoYXMgaXQgbXVzdCBoYXZlIHRoZQp6ZXJvIHJlZmNvdW50LCB3ZWxsIDEgYmVjYXVzZSBvZiB0
aGUgYmlhcykgYW5kIGFueSB1bm1hcCB3aWxsCnRyaWdnZXIgYSBtbXUgbm90aWZpZXIgY2FsbGJh
Y2suIFVzZXIgb2YgaG1tIG1pcnJvciBhYmlkaW5nIGJ5CnRoZSBBUEkgd2lsbCBuZXZlciBtYWtl
IHVzZSBvZiBpbmZvcm1hdGlvbiB0aGV5IGdldCB0aHJvdWdoIHRoZQpmYXVsdCBvciBzbmFwc2hv
dCBmdW5jdGlvbiB1bnRpbCBjaGVja2luZyBmb3IgcmFjaW5nIG5vdGlmaWVyCnVuZGVyIGxvY2su
CgpDaGVlcnMsCkrDqXLDtG1lCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
