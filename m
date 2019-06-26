Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 05ACE561D2
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 07:46:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 091596E141;
	Wed, 26 Jun 2019 05:45:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C62A6E141;
 Wed, 26 Jun 2019 05:45:57 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id A851EAF25;
 Wed, 26 Jun 2019 05:45:55 +0000 (UTC)
Date: Wed, 26 Jun 2019 07:45:54 +0200
From: Michal Hocko <mhocko@kernel.org>
To: John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH 18/22] mm: mark DEVICE_PUBLIC as broken
Message-ID: <20190626054554.GA17798@dhcp22.suse.cz>
References: <20190613094326.24093-1-hch@lst.de>
 <20190613094326.24093-19-hch@lst.de>
 <20190613194430.GY22062@mellanox.com>
 <a27251ad-a152-f84d-139d-e1a3bf01c153@nvidia.com>
 <20190613195819.GA22062@mellanox.com>
 <20190614004314.GD783@iweiny-DESK2.sc.intel.com>
 <d2b77ea1-7b27-e37d-c248-267a57441374@nvidia.com>
 <20190619192719.GO9374@mellanox.com>
 <29f43c79-b454-0477-a799-7850e6571bd3@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <29f43c79-b454-0477-a799-7850e6571bd3@nvidia.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
 "linux-nvdimm@lists.01.org" <linux-nvdimm@lists.01.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
 Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 Ira Weiny <ira.weiny@intel.com>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlIDI1LTA2LTE5IDIwOjE1OjI4LCBKb2huIEh1YmJhcmQgd3JvdGU6Cj4gT24gNi8xOS8x
OSAxMjoyNyBQTSwgSmFzb24gR3VudGhvcnBlIHdyb3RlOgo+ID4gT24gVGh1LCBKdW4gMTMsIDIw
MTkgYXQgMDY6MjM6MDRQTSAtMDcwMCwgSm9obiBIdWJiYXJkIHdyb3RlOgo+ID4+IE9uIDYvMTMv
MTkgNTo0MyBQTSwgSXJhIFdlaW55IHdyb3RlOgo+ID4+PiBPbiBUaHUsIEp1biAxMywgMjAxOSBh
dCAwNzo1ODoyOVBNICswMDAwLCBKYXNvbiBHdW50aG9ycGUgd3JvdGU6Cj4gPj4+PiBPbiBUaHUs
IEp1biAxMywgMjAxOSBhdCAxMjo1MzowMlBNIC0wNzAwLCBSYWxwaCBDYW1wYmVsbCB3cm90ZToK
PiA+Pj4+Pgo+ID4+IC4uLgo+ID4+PiBTbyBJIHRoaW5rIGl0IGlzIG9rLiAgRnJhbmtseSBJIHdh
cyB3b25kZXJpbmcgaWYgd2Ugc2hvdWxkIHJlbW92ZSB0aGUgcHVibGljCj4gPj4+IHR5cGUgYWx0
b2dldGhlciBidXQgY29uY2VwdHVhbGx5IGl0IHNlZW1zIG9rLiAgQnV0IEkgZG9uJ3Qgc2VlIGFu
eSB1c2VycyBvZiBpdAo+ID4+PiBzby4uLiAgc2hvdWxkIHdlIGdldCByaWQgb2YgaXQgaW4gdGhl
IGNvZGUgcmF0aGVyIHRoYW4gdHVybmluZyB0aGUgY29uZmlnIG9mZj8KPiA+Pj4KPiA+Pj4gSXJh
Cj4gPj4KPiA+PiBUaGF0IHNlZW1zIHJlYXNvbmFibGUuIEkgcmVjYWxsIHRoYXQgdGhlIGhvcGUg
d2FzIGZvciB0aG9zZSBJQk0gUG93ZXIgOQo+ID4+IHN5c3RlbXMgdG8gdXNlIF9QVUJMSUMsIGFz
IHRoZXkgaGF2ZSBoYXJkd2FyZS1iYXNlZCBjb2hlcmVudCBkZXZpY2UgKEdQVSkKPiA+PiBtZW1v
cnksIGFuZCBzbyB0aGUgbWVtb3J5IHJlYWxseSBpcyB2aXNpYmxlIHRvIHRoZSBDUFUuIEFuZCB0
aGUgSUJNIHRlYW0KPiA+PiB3YXMgdGhpbmtpbmcgb2YgdGFraW5nIGFkdmFudGFnZSBvZiBpdC4g
QnV0IEkgaGF2ZW4ndCBzZWVuIGFueXRoaW5nIG9uCj4gPj4gdGhhdCBmcm9udCBmb3IgYSB3aGls
ZS4KPiA+IAo+ID4gRG9lcyBhbnlvbmUga25vdyB3aG8gdGhvc2UgcGVvcGxlIGFyZSBhbmQgY2Fu
IHdlIGVuY291cmFnZSB0aGVtIHRvCj4gPiBzZW5kIHNvbWUgcGF0Y2hlcz8gOikKPiA+IAo+IAo+
IEkgYXNrZWQgYWJvdXQgdGhpcywgYW5kIGl0IHNlZW1zIHRoYXQgdGhlIGlkZWEgd2FzOiBERVZJ
Q0VfUFVCTElDIHdhcyB0aGVyZQo+IGluIG9yZGVyIHRvIHByb3ZpZGUgYW4gYWx0ZXJuYXRpdmUg
d2F5IHRvIGRvIHRoaW5ncyAoc3VjaCBhcyBtaWdyYXRlIG1lbW9yeQo+IHRvIGFuZCBmcm9tIGEg
ZGV2aWNlKSwgaW4gY2FzZSB0aGUgY29tYmluYXRpb24gb2YgZXhpc3RpbmcgYW5kIG5lYXItZnV0
dXJlCj4gTlVNQSBBUElzIHdhcyBpbnN1ZmZpY2llbnQuIFRoaXMgcHJvYmFibHkgY2FtZSBhcyBh
IGZvbGxvdy11cCB0byB0aGUgZWFybHkKPiAyMDE3LWlzaCBjb252ZXJzYXRpb25zIGFib3V0IE5V
TUEsIGluIHdoaWNoIHRoZSBsaW51eC1tbSByZWNvbW1lbmRhdGlvbiB3YXMKPiAidHJ5IHVzaW5n
IEhNTSBtZWNoYW5pc21zLCBhbmQgaWYgdGhvc2UgYXJlIGluYWRlcXVhdGUsIHRoZW4gbWF5YmUg
d2UgY2FuCj4gbG9vayBhdCBlbmhhbmNpbmcgTlVNQSBzbyB0aGF0IGl0IGhhcyBiZXR0ZXIgaGFu
ZGxpbmcgb2YgYWR2YW5jZWQgKEdQVS1saWtlKQo+IGRldmljZXMiLgoKWWVzIHRoYXQgd2FzIHRo
ZSBvcmlnaW5hbCBpZGVhLiBJdCBzb3VuZHMgc28gbXVjaCBiZXR0ZXIgdG8gdXNlIGEgY29tbW9u
CmZyYW1ld29yayByYXRoZXIgdGhhbiBhd2t3YXJkIHNwZWNpYWwgY2FzZWQgY3B1bGVzcyBOVU1B
IG5vZGVzIHdpdGgKYSB3ZWlyZCBzZW1hbnRpYy4gVXNlciBvZiB0aGUgbmVpdGhlciBvZiB0aGUg
dHdvIGhhcyBzaG93biB1cCBzbyBJIGd1ZXNzCnRoYXQgdGhlIGVudmlzaW9uZWQgSFcganVzdCBk
aWRuJ3QgbWF0ZXJpYWxpemVkLiBPciBoYXMgdGhlcmUgYmVlbiBhCmNvbXBsZXRlbHkgZGlmZmVy
ZW50IGFwcHJvYWNoIGNob3Nlbj8KCj4gSW4gdGhlIGVuZCwgaG93ZXZlciwgX1BVQkxJQyB3YXMg
bmV2ZXIgdXNlZCwgbm9yIGRvZXMgYW55b25lIGluIHRoZSBsb2NhbAo+IChOVklESUEgKyBJQk0p
IGtlcm5lbCB2aWNpbml0eSBzZWVtIHRvIGhhdmUgcGxhbnMgdG8gdXNlIGl0LiAgU28gaXQgcmVh
bGx5Cj4gZG9lcyBzZWVtIHNhZmUgdG8gcmVtb3ZlLCBhbHRob3VnaCBvZiBjb3Vyc2UgaXQncyBn
b29kIHRvIHN0YXJ0IHdpdGggCj4gQlJPS0VOIGFuZCBzZWUgaWYgYW55b25lIHBvcHMgdXAgYW5k
IGNvbXBsYWlucy4KCldlbGwsIEkgZG8gbm90IHJlYWxseSBzZWUgbXVjaCBvZiBhIGRpZmZlcmVu
Y2UuIFByZXNlcnZpbmcgYW4gdW51c2VkCmNvZGUgd2hpY2ggZG9lc24ndCBoYXZlIGFueSB1c2Vy
IGluIHNpZ2h0IGp1c3QgYWRkcyBhIG1haW50ZW5hbmNlIGJ1cmRlbgp3aGV0aGVyIHRoZSBjb2Rl
IGRlcGVuZHMgb24gQlJPS0VOIG9yIG5vdC4gV2UgY2FuIGFsd2F5cyByZXZlcnQgcGF0Y2hlcwp3
aGljaCByZW1vdmUgdGhlIGNvZGUgb25jZSBhIHJlYWwgdXNlciBzaG93cyB1cC4KLS0gCk1pY2hh
bCBIb2NrbwpTVVNFIExhYnMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
