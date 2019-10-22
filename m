Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 46405E13C0
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2019 10:10:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AB586E9AA;
	Wed, 23 Oct 2019 08:10:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from muru.com (muru.com [72.249.23.125])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9BCE16E83F
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2019 15:02:07 +0000 (UTC)
Received: from atomide.com (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTPS id 51D4180FA;
 Tue, 22 Oct 2019 15:02:40 +0000 (UTC)
Date: Tue, 22 Oct 2019 08:02:02 -0700
From: Tony Lindgren <tony@atomide.com>
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [PATCH 1/7] dt-bindings: gpu: pvrsgx: add initial bindings
Message-ID: <20191022150202.GJ5610@atomide.com>
References: <cover.1571424390.git.hns@goldelico.com>
 <f0fb68dc7bc027e5e911721852f6bc6fa2d77a63.1571424390.git.hns@goldelico.com>
 <CAL_Jsq+obsTSU3iP1wm_3-FsAJ4Mxiz0NbMY1_h5NeFn67Sj+A@mail.gmail.com>
 <CEA29A3B-4116-4FE3-8E18-0C97353688DC@goldelico.com>
 <20191021172557.GB5610@atomide.com>
 <C6CD5A50-7F0A-4F56-ABB9-CAEDF7E47A5D@goldelico.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <C6CD5A50-7F0A-4F56-ABB9-CAEDF7E47A5D@goldelico.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Mailman-Approved-At: Wed, 23 Oct 2019 08:09:38 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Discussions about the Letux Kernel <letux-kernel@openphoenux.org>,
 David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Rob Herring <robh+dt@kernel.org>,
 =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
 kernel@pyra-handheld.com, linux-omap <linux-omap@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

KiBILiBOaWtvbGF1cyBTY2hhbGxlciA8aG5zQGdvbGRlbGljby5jb20+IFsxOTEwMjEgMTg6MDhd
Ogo+IAo+ID4gQW0gMjEuMTAuMjAxOSB1bSAxOToyNSBzY2hyaWViIFRvbnkgTGluZGdyZW4gPHRv
bnlAYXRvbWlkZS5jb20+Ogo+ID4gCj4gPiAqIEguIE5pa29sYXVzIFNjaGFsbGVyIDxobnNAZ29s
ZGVsaWNvLmNvbT4gWzE5MTAyMSAxNTo0Nl06Cj4gPj4+IEFtIDIxLjEwLjIwMTkgdW0gMTc6MDcg
c2NocmllYiBSb2IgSGVycmluZyA8cm9iaCtkdEBrZXJuZWwub3JnPjoKPiA+Pj4gT24gRnJpLCBP
Y3QgMTgsIDIwMTkgYXQgMTo0NiBQTSBILiBOaWtvbGF1cyBTY2hhbGxlciA8aG5zQGdvbGRlbGlj
by5jb20+IHdyb3RlOgo+ID4+Pj4gK09wdGlvbmFsIHByb3BlcnRpZXM6Cj4gPj4+PiArLSB0aW1l
cjogICAgICAgdGhlIHRpbWVyIHRvIGJlIHVzZWQgYnkgdGhlIGRyaXZlci4KPiA+Pj4gCj4gPj4+
IE5lZWRzIGEgYmV0dGVyIGRlc2NyaXB0aW9uIGFuZCB2ZW5kb3IgcHJlZml4IGF0IGxlYXN0Lgo+
ID4+IAo+ID4+IEkgYW0gbm90IHlldCBzdXJlIGlmIGl0IGlzIHZlbmRvciBzcGVjaWZpYyBvciBp
ZiBhbGwKPiA+PiBTR1ggaW1wbGVtZW50YXRpb25zIG5lZWQgc29tZSB0aW1lci4KPiA+PiAKPiA+
Pj4gCj4gPj4+IFdoeSBpcyB0aGlzIG5lZWRlZCByYXRoZXIgdGhhbiB1c2luZyB0aGUgT1MncyB0
aW1lcnM/Cj4gPj4gCj4gPj4gQmVjYXVzZSBub2JvZHkgdW5kZXJzdGFuZHMgdGhlIGN1cnJlbnQg
KG91dCBvZiB0cmVlIGFuZAo+ID4+IHBsYW5uZWQgZm9yIHN0YWdpbmcpIGRyaXZlciB3ZWxsIGVu
b3VnaCB3aGF0IHRoZSB0aW1lcgo+ID4+IGlzIGRvaW5nLiBJdCBpcyBjdXJyZW50bHkgaGFyZCBj
b2RlZCB0aGF0IHNvbWUgb21hcCByZWZlcgo+ID4+IHRvIHRpbWVyNyBhbmQgb3RoZXJzIHVzZSB0
aW1lcjExLgo+ID4gCj4gPiBKdXN0IGNvbmZpZ3VyZSBpdCBpbiB0aGUgZHJpdmVyIGJhc2VkIG9u
IHRoZSBjb21wYXRpYmxlCj4gPiB2YWx1ZSB0byBrZWVwIGl0IG91dCBvZiB0aGUgZHRzLiBJdCdz
IGJlc3QgdG8gc3RpY2sgdG8KPiA+IHN0YW5kYXJkIGJpbmRpbmdzLgo+IAo+IElNSE8gbGVhZHMg
dG8gdWdseSBjb2RlLi4uIFNpbmNlIHRoZSB0aW1lciBpcyBub3QgcGFydCBvZgo+IHRoZSBTR1gg
SVBSIG1vZHVsZSBidXQgb25lIG9mIHRoZSBPTUFQIHRpbWVycyBpdCBpcyBzb3J0Cj4gb2YgaGFy
ZHdhcmUgY29ubmVjdGlvbiB0aGF0IGNhbiBiZSBjaG9zZW4gYSBsaXR0bGUgYXJiaXRyYXJpbHku
Cj4gCj4gVGhpcyBpcyB0aGUgbWFpbiByZWFzb24gd2h5IEkgdGhpbmsgYWRkaW5nIGl0IHRvIGEg
ZGV2aWNlIHRyZWUKPiBzb3VyY2Ugc28gdGhhdCBhIGJvYXJkIHRoYXQgcmVhbGx5IHJlcXVpcmVz
IHRvIHVzZSBhIHRpbWVyCj4gZm9yIGEgZGlmZmVyZW50IHB1cnBvc2UsIGNhbiByZWFzc2lnbiBp
dC4gVGhpcyBpcyBub3QgcG9zc2libGUKPiBpZiB3ZSBoYXJkLWNvZGUgdGhhdCBpbnRvIHRoZSBk
cml2ZXIgYnkgc2Nhbm5pbmcgZm9yCj4gY29tcGF0aWJsZS4gSW4gdGhhdCBjYXNlIHRoZSBkcml2
ZXIgbXVzdCBjaGVjayBib2FyZCBjb21wYXRpYmxlCj4gbmFtZXMuLi4KPiAKPiBCdXQgaWYgd2Ug
Z2FpbiBhIGJldHRlciB1bmRlcnN0YW5kaW5nIG9mIGl0cyByb2xlIGluIHRoZSBkcml2ZXIKPiAo
ZG9lcyBpdCByZWFsbHkgbmVlZCBhIGRlZGljYXRlZCB0aW1lciBhbmQgZm9yIHdoYXQgYW5kIHdo
aWNoCj4gcHJvcGVydGllcyB0aGUgdGltZXIgbXVzdCBoYXZlKSB3ZSBjYW4gcHJvYmFibHkgcmVw
bGFjZSBpdC4KCldlbGwgaG93IGFib3V0IGp1c3QgbGVhdmUgb3V0IHRoZSB0aW1lciBmcm9tIHRo
ZSBiaW5kaW5nCmZvciBub3csIGFuZCBqdXN0IGNhcnJ5IGEgcGF0Y2ggZm9yIGl0IHVudGlsIGl0
IGlzIGtub3duCmlmL3doeSBpdCdzIHJlYWxseSBuZWVkZWQ/CgpJZiBpdCdzIG5lZWRlZCwgeWVh
aCBJIGFncmVlIGEgdGltZXIgcHJvcGVydHkgc2hvdWxkIGJlCnVzZWQuCgo+ID4+Pj4gKy0gaW1n
LGNvcmVzOiAgIG51bWJlciBvZiBjb3Jlcy4gRGVmYXVsdHMgdG8gPDE+Lgo+ID4+PiAKPiA+Pj4g
Tm90IGRpc2NvdmVyYWJsZT8KPiA+PiAKPiA+PiBOb3Qgc3VyZSBpZiBpdCBpcy4gVGhpcyBpcyBw
cm9iYWJseSBhdmFpbGFibGUgaW4gdW5kb2N1bWVudGVkCj4gPj4gcmVnaXN0ZXJzIG9mIHRoZSBz
Z3guCj4gPiAKPiA+IFRoaXMgdG9vLCBhbmQgd2hhdGV2ZXIgbm9uLXN0YW5kcmQgb3RoZXIgcHJv
cGVyaXRpZXMKPiA+IHlvdSBtaWdodCBoYXZlLgo+IAo+IEhlcmUgaXQgaXMgYSBmZWF0dXJlIG9m
IHRoZSBTR1ggSVBSIG9mIHRoZSBTb0MsIGkuZS4KPiBkZXNjcmliZXMgdGhhdCB0aGUgaGFyZHdh
cmUgaGFzIG9uZSBvciB0d28gY29yZXMuCgpIZXJlIHlvdSBjYW4gaGF2ZSBhIHN0YW5kYXJkIGR0
cyBiaW5kaW5nIGJ5IHB1dHRpbmcgdGhpcwppbnRvIGRyaXZlciBzdHJ1Y3Qgb2ZfZGV2aWNlX2lk
IG1hdGNoIC5kYXRhLiBUaGVuIHdoZW4Kc29tZWJvZHkgZmlndXJlcyBvdXQgaG93IHRvIHJlYWQg
dGhhdCBmcm9tIHRoZSBoYXJkd2FyZSwKaXQgY2FuIGJlIGp1c3QgZHJvcHBlZC4KClJlZ2FyZHMs
CgpUb255Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
