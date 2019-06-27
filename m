Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE65157C54
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2019 08:41:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A8BF6E5AE;
	Thu, 27 Jun 2019 06:41:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0072F6E5AE;
 Thu, 27 Jun 2019 06:41:08 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 4E3F7AFAE;
 Thu, 27 Jun 2019 06:41:07 +0000 (UTC)
Date: Thu, 27 Jun 2019 08:41:06 +0200
From: Michal Hocko <mhocko@kernel.org>
To: Dan Williams <dan.j.williams@intel.com>
Subject: Re: [PATCH 05/22] mm: export alloc_pages_vma
Message-ID: <20190627064106.GC17798@dhcp22.suse.cz>
References: <20190613094326.24093-6-hch@lst.de>
 <20190620191733.GH12083@dhcp22.suse.cz>
 <CAPcyv4h9+Ha4FVrvDAe-YAr1wBOjc4yi7CAzVuASv=JCxPcFaw@mail.gmail.com>
 <20190625072317.GC30350@lst.de>
 <20190625150053.GJ11400@dhcp22.suse.cz>
 <CAPcyv4j1e5dbBHnc+wmtsNUyFbMK_98WxHNwuD_Vxo4dX9Ce=Q@mail.gmail.com>
 <20190625190038.GK11400@dhcp22.suse.cz>
 <CAPcyv4hU13v7dSQpF0WTQTxQM3L3UsHMUhsFMVz7i4UGLoM89g@mail.gmail.com>
 <20190626054645.GB17798@dhcp22.suse.cz>
 <CAPcyv4jLK2F2UHqbwp4bCEiB7tL8sVsr775egKMmJvfZG+W+NQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPcyv4jLK2F2UHqbwp4bCEiB7tL8sVsr775egKMmJvfZG+W+NQ@mail.gmail.com>
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
Cc: linux-nvdimm <linux-nvdimm@lists.01.org>, nouveau@lists.freedesktop.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Linux MM <linux-mm@kvack.org>,
 =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
 Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>,
 linux-pci@vger.kernel.org, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkIDI2LTA2LTE5IDA5OjE0OjMyLCBEYW4gV2lsbGlhbXMgd3JvdGU6Cj4gT24gVHVlLCBK
dW4gMjUsIDIwMTkgYXQgMTA6NDYgUE0gTWljaGFsIEhvY2tvIDxtaG9ja29Aa2VybmVsLm9yZz4g
d3JvdGU6Cj4gPgo+ID4gT24gVHVlIDI1LTA2LTE5IDEyOjUyOjE4LCBEYW4gV2lsbGlhbXMgd3Jv
dGU6Cj4gPiBbLi4uXQo+ID4gPiA+IERvY3VtZW50YXRpb24vcHJvY2Vzcy9zdGFibGUtYXBpLW5v
bnNlbnNlLnJzdAo+ID4gPgo+ID4gPiBUaGF0IGRvY3VtZW50IGhhcyBmYWlsZWQgdG8gcHJlY2x1
ZGUgc3ltYm9sIGV4cG9ydCBmaWdodHMgaW4gdGhlIHBhc3QKPiA+ID4gYW5kIHRoZXJlIGlzIGEg
cmVhc29uYWJsZSBhcmd1bWVudCB0byB0cnkgbm90IHRvIHJldHJhY3QgZnVuY3Rpb25hbGl0eQo+
ID4gPiB0aGF0IGhhZCBiZWVuIHByZXZpb3VzbHkgZXhwb3J0ZWQgcmVnYXJkbGVzcyBvZiB0aGF0
IGRvY3VtZW50Lgo+ID4KPiA+IENhbiB5b3UgcG9pbnQgbWUgdG8gYW55IHNwZWNpZmljIGV4YW1w
bGUgd2hlcmUgdGhpcyB3b3VsZCBiZSB0aGUgY2FzZQo+ID4gZm9yIHRoZSBjb3JlIGtlcm5lbCBz
eW1ib2xzIHBsZWFzZT8KPiAKPiBUaGUgbW9zdCByZWNlbnQgZXhhbXBsZSB0aGF0IGNvbWVzIHRv
IG1pbmQgd2FzIHRoZSB0aHJhc2ggYXJvdW5kCj4gX19rZXJuZWxfZnB1X3tiZWdpbixlbmR9IFsx
XS4KCldlbGwsIHRoaXMgc2VlbXMgbW9yZSBsaWtlIGEgZGlzYWdyZWVtZW50IG92ZXIgYSBmdW5j
dGlvbmFsaXR5IHRoYXQgaGFzCnJlZHVjZWQgaXRzIHZpc2liaWxpdHkgcmF0aGVyIHRoYW4gZW5m
b3JjZW1lbnQgb2YgYSBzcGVjaWZpYyBBUEkuIEFuZCBJCmRvIGFncmVlIHRoYXQgdGhlIGFib3Zl
IGRvY3VtZW50IHN0YXRlcyB0aGF0IHRoaXMgaXMgcGVyZmVjdGx5CmxlZ2l0aW1hdGUgYW5kIG5v
IG91dC1vZi10cmVlIGNvZGUgY2FuIHJlbHkgb24gX2FueV8gZnVuY3Rpb25hbGl0eSB0byBiZQpw
cmVzZXJ2ZWQuCgpPbiB0aGUgb3RoZXIgaGFuZCwgSSBhbSBub3QgcmVhbGx5IHN1cnByaXNlZCBh
Ym91dCB0aGUgZGlzY3Vzc2lvbgpiZWNhdXNlIGQ2M2U3OWIxMTRjMDIgaXMgYSBtZXJlIGNsZWFu
IHVwIG5vdCBleHBsYWluaW5nIHdoeSB0aGUKZnVuY3Rpb25hbGl0eSBzaG91bGQgYmUgcmVzdHJp
Y3RlZCB0byBHUEwgb25seSBjb2RlLiBTbyB0aGVyZSBjZXJ0YWlubHkKaXMgYSByb29tIGZvciBj
bGFyaWZpY2F0aW9uLiBFc3BlY2lhbGx5IHdoZW4gdGhlIGNvZGUgaGFzIGJlZW4gZXhwb3J0ZWQK
d2l0aG91dCB0aGlzIHJlc3RyaWN0aW9uIGluIHRoZSBwYXN0IChzZWUgODU0NmMwMDg5MjRkNSku
IFNvIHRvIG1lIHRoaXMKc291bmRzIG1vcmUgbGlrZSBhIHVzdWFsIEVYUE9SVF9TWU1CT0x7X0dQ
TH0gbWVzcy4KCkluIGFueSBjYXNlIEkgcmVhbGx5IGRvIG5vdCBzZWUgYW55IHJlbGF0aW9uIHRv
IHRoZSBtYWludGVuYW5jZSBjb3N0CmhlcmUuIEdQTCBzeW1ib2xzIGFyZSBub3QgaW4gYW55IHNl
bnNlIG1vcmUgc3RhYmxlIHRoYW4gYW55IG90aGVyCmV4cG9ydGVkIHN5bWJvbC4gVGhleSBjYW4g
Y2hhbmdlIGF0IGFueSB0aW1lLiBUaGUgb25seSBtYWludGVuYW5jZQpidXJkZW4gaXMgdG8gdXBk
YXRlIGFsbCBfaW5fa2VybmVsXyB1c2VycyBvZiB0aGUgc2FpZCBzeW1ib2wuIEFueQpvdXQtb2Yt
dHJlZSBjb2RlIGlzIG9uIGl0cyBvd24gdG8gZGVhbCB3aXRoIHRoaXMuIEZ1bGwgc3RvcC4KCkdQ
TCBvciBub24tR1BMIHN5bWJvbHMgYXJlIHNvbGVseSB0byBkZWZpbmUgYSBzY29wZSBvZiB0aGUg
dXNhZ2UuCk5vdGhpbmcgbGVzcyBhbmQgbm90aGluZyBtb3JlLgoKPiBJIHJlZmVyZW5jZWQgdGhh
dCB3aGVuIGRlYmF0aW5nIF9HUEwgc3ltYm9sIHBvbGljeSB3aXRoIErDqXLDtG1lIFsyXS4KPiAK
PiBbMV06IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvMjAxOTA1MjIxMDA5NTkuR0ExNTM5
MEBrcm9haC5jb20vCj4gWzJdOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sL0NBUGN5djRn
YityPT1yaUtGWGtWWjdnR2RuS2U2MnlCbVo3eE9hNHVCQkJ5aG5LOVR6Z0BtYWlsLmdtYWlsLmNv
bS8KCi0tIApNaWNoYWwgSG9ja28KU1VTRSBMYWJzCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
