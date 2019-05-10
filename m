Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F70A19FD3
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2019 17:07:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3BC489D8D;
	Fri, 10 May 2019 15:07:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D74589D63;
 Fri, 10 May 2019 15:07:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id B8205FB03;
 Fri, 10 May 2019 17:07:22 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y4vFdfOmYyEE; Fri, 10 May 2019 17:07:20 +0200 (CEST)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id 0FFF0461A5; Fri, 10 May 2019 17:07:20 +0200 (CEST)
Date: Fri, 10 May 2019 17:07:19 +0200
From: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
To: Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [PATCH v2 0/8] per-process address spaces for MMUv2
Message-ID: <20190510150719.GA28712@bogon.m.sigxcpu.org>
References: <20190417135023.26977-1-l.stach@pengutronix.de>
 <20190503111026.GA6943@bogon.m.sigxcpu.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190503111026.GA6943@bogon.m.sigxcpu.org>
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
Cc: etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 patchwork-lst@pengutronix.de, kernel@pengutronix.de,
 Russell King <linux+etnaviv@armlinux.org.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTHVjYXMsCk9uIEZyaSwgTWF5IDAzLCAyMDE5IGF0IDAxOjEwOjI2UE0gKzAyMDAsIEd1aWRv
IEfDvG50aGVyIHdyb3RlOgo+IEhpIEx1Y2FzLAo+IE9uIFdlZCwgQXByIDE3LCAyMDE5IGF0IDAz
OjUwOjE1UE0gKzAyMDAsIEx1Y2FzIFN0YWNoIHdyb3RlOgo+ID4gCj4gPiBIaSBhbGwsCj4gPiAK
PiA+IHYxIGNvdmVyIGxldHRlcjoKPiA+IAo+ID4gdGhlIGZvbGxvd2luZyBwYXRjaGVzIGZpbmFs
bHkgaW1wbGVtZW50IG9uZSBvZiB0aGUgbG9uZ3N0YW5kaW5nIFRPRE8KPiA+IGl0ZW1zIGluIHRo
ZSBldG5hdml2IGRyaXZlcjogcGVyLXByb2Nlc3MgYWRkcmVzcyBzcGFjZXMuIFRoZXkgYXJlIG9u
bHkKPiA+IGVuYWJsZWQgZm9yIE1NVXYyLCBhcyBzd2l0Y2hpbmcgdGhlIE1NVSBjb250ZXh0IG9u
IE1NVXYxIHdvdWxkIHJlcXVpcmUKPiA+IGEgZnVsbCBzdG9wIG9mIHRoZSBGRSwgd2hpY2ggSSBk
ZWVtZWQgdG9vIGV4cGVuc2l2ZSB0byBkbyBvbiBwb3RlbnRpYWxseQo+ID4gZXZlcnkgc3VibWl0
dGVkIGNvbW1hbmRzdHJlYW0uCj4gPiAKPiA+IEZvciBub3cgdGhpcyBvbmx5IHByb3ZpZGVzIGJl
dHRlciBpc29sYXRpb24gYmV0d2VlbiBHUFUgY2xpZW50cywgYnV0IGl0Cj4gPiBpcyBhbHNvIGEg
YmlnIHN0ZXAgaW4gdGhlIGRpcmVjdGlvbiBvZiBzdXBwb3J0aW5nIHNvZnRwaW4uIFNvZnRwaW4g
d2lsbAo+ID4gbGF0ZXIgYmUgdXNlZCBieSBHQzcwMDAgdXNlcnNwYWNlIGRyaXZlcnMgdG8gZGVh
bCB3aXRoIHRleHR1cmUgZGVzY3JpcHRvcnMKPiA+IHdpdGhvdXQgdGhlIG5lZWQgdG8gYWRkIGV2
ZW4gbW9yZSByZWxvY2F0aW9uIGludGVyZmFjZXMgdG8gdGhlIGV0bmF2aXYKPiA+IFVBUEkuCj4g
PiAKPiA+IFRoZSBjaGFuZ2VzIGFyZSBiaWcgYW5kIHByZXR0eSBkaXNydXB0aXZlLCBzbyBJIGFj
a25vd2xlZGdlIHRoYXQgdGhleQo+ID4gYXJlbid0IHByaW1lIHRhcmdldHMgZm9yIGEgcXVpY2sg
cmV2aWV3LCBidXQgSSB3b3VsZCBhcHByZWNpYXRlIGEKPiA+IHNlY29uZCBwYWlycyBvZiBleWVz
IG9uIHRoZW0uCj4gPiAKPiA+IENoYW5nZXMgc2luY2UgdjE6Cj4gPiAtIGZpeGVkIGFuIGlzc3Vl
IHdoZXJlIGEgZGVidWdzZnMgcmVhZCBjb3VsZCBydW4gaW50byBhIGtlcm5lbCBOVUxMCj4gPiAg
IHB0ciBkZXJlZmVyZW5jZSBkdWUgdG8gbm8gY3VycmVudCBNTVUgY29udGV4dAo+ID4gLSBmaXhl
ZCBhbiBpc3N1ZSB3aGVyZSB0aGUgY3VycmVudCBNTVUgY29udGV4dCBjb3VsZCBiZSBkZXN0cm95
ZWQKPiA+ICAgZHVlIHRvIHRoZSBEUk0gY2xpZW50IGdvaW5nIGF3YXksIHdoaWxlIGl0IGlzIHN0
aWxsIGluIHVzZSBieQo+ID4gICBhbiBhY3RpdmUgR1BVIGpvYgo+ID4gLSBtb3JlIGV4dGVuc2l2
ZSB0ZXN0aW5nIG9uIEdDODgwLCBHQzIwMDAsIEdDMzAwMCBhbmQgR0M3MDAwCj4gCj4gSSBnYXZl
IHRoaXMgc2VyaWVzIGEgdGVzdCBvbiBHQzcwMDAgYW5kIGl0IGxvb2tzIGdvb2QuIEknbGwgZG8g
c29tZSBtb3JlCj4gdGVzdGluZyBvdmVyIHRoZSBuZXh0IHdlZWsuCgpJIGdhdmUgdGhpcyBzb21l
IG1vcmUgdGVzdGluZyBhbmQgaXQgd29ya3MgbmljZWx5LiBPbmUgdGhpbmcgaSBub3RpY2VkCnRo
b3VnaCBhcmUgb2NjYXNpb25hbCBHUFUgaGFuZ3Mgb24gY29tcG9zaXRvciBzdGFydHVwIGxpa2U6
CgpbICAgNTguOTI5OTA2XSBldG5hdml2LWdwdSAzODAwMDAwMC5ncHU6IE1NVSBmYXVsdCBzdGF0
dXMgMHgwMDAwMDAwMQpbICAgNTguOTM2MDIxXSBldG5hdml2LWdwdSAzODAwMDAwMC5ncHU6IE1N
VSAwIGZhdWx0IGFkZHIgMHgwMDQ4NGI4MApbICAgNTkuOTcyNjU1XSBldG5hdml2LWdwdSAzODAw
MDAwMC5ncHU6IHJlY292ZXIgaHVuZyBHUFUhCgpidXQgdGhlc2Ugb25seSBoYXBwZW4gd2l0aCBH
QUxMSVVNX0RERUJVRz1hbHdheXMuIEkgY2FuJ3QgcmVwcm9kdWNlIHRoZW0Kd2hlbiBlaXRoZXIK
Ci0gZHJvcHBpbmcgdGhpcyBwYXRjaCBzZXJpZXMKLSBkaXNhYmxpbmcgR0FMTElVTV9EREVCVUcK
Ckkgc2VlIGlmIEkgY2FuIGZpZ3VyZSBvdXQgc29tZSBtb3JlIGRldGFpbHMuCkNoZWVycywKIC0t
IEd1aWRvCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
