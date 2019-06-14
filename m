Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 394E945835
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 11:07:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F07D89394;
	Fri, 14 Jun 2019 09:07:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7D3D089395
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 09:07:21 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D12FF2B;
 Fri, 14 Jun 2019 02:07:20 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B0D673F718;
 Fri, 14 Jun 2019 02:07:20 -0700 (PDT)
Received: by e110455-lin.cambridge.arm.com (Postfix, from userid 1000)
 id 71780682573; Fri, 14 Jun 2019 10:07:19 +0100 (BST)
Date: Fri, 14 Jun 2019 10:07:19 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] malidp: no need to check return value of debugfs_create
 functions
Message-ID: <20190614090719.GT4173@e110455-lin.cambridge.arm.com>
References: <20190613132829.GB4863@kroah.com>
 <20190613145221.GP4173@e110455-lin.cambridge.arm.com>
 <20190613155713.GA4632@kroah.com>
 <20190613162755.GR4173@e110455-lin.cambridge.arm.com>
 <20190613174215.GB9415@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190613174215.GB9415@kroah.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdW4gMTMsIDIwMTkgYXQgMDc6NDI6MTVQTSArMDIwMCwgR3JlZyBLcm9haC1IYXJ0
bWFuIHdyb3RlOgo+IE9uIFRodSwgSnVuIDEzLCAyMDE5IGF0IDA1OjI3OjU1UE0gKzAxMDAsIExp
dml1IER1ZGF1IHdyb3RlOgo+ID4gT24gVGh1LCBKdW4gMTMsIDIwMTkgYXQgMDU6NTc6MTNQTSAr
MDIwMCwgR3JlZyBLcm9haC1IYXJ0bWFuIHdyb3RlOgo+ID4gPiBPbiBUaHUsIEp1biAxMywgMjAx
OSBhdCAwMzo1MjoyMlBNICswMTAwLCBMaXZpdSBEdWRhdSB3cm90ZToKPiA+ID4gPiBPbiBUaHUs
IEp1biAxMywgMjAxOSBhdCAwMzoyODoyOVBNICswMjAwLCBHcmVnIEtyb2FoLUhhcnRtYW4gd3Jv
dGU6Cj4gPiA+ID4gPiBXaGVuIGNhbGxpbmcgZGVidWdmcyBmdW5jdGlvbnMsIHRoZXJlIGlzIG5v
IG5lZWQgdG8gZXZlciBjaGVjayB0aGUKPiA+ID4gPiA+IHJldHVybiB2YWx1ZS4gIFRoZSBmdW5j
dGlvbiBjYW4gd29yayBvciBub3QsIGJ1dCB0aGUgY29kZSBsb2dpYyBzaG91bGQKPiA+ID4gPiA+
IG5ldmVyIGRvIHNvbWV0aGluZyBkaWZmZXJlbnQgYmFzZWQgb24gdGhpcy4KPiA+ID4gPiAKPiA+
ID4gPiBJIHJlbWVtYmVyIHdoZW4gd3JpdGluZyB0aGlzIGNvZGUgYW5kIHRlc3Rpbmcgbm90IGZ1
bGx5IGNvbXBsZXRlIGNvZGUgdGhhdCBsZWZ0Cj4gPiA+ID4gbm9kZXMgYXJvdW5kIG9uIHJlbW92
aW5nIHRoZSBtb2R1bGUgdGhhdCB0aGVyZSB3ZXJlIGVycm9ycyBiZWluZyByZXR1cm5lZCBieQo+
ID4gPiA+IGRlYnVnZnNfY3JlYXRlX2ZpbGUoKS4gSGFzIHRoYXQgY2hhbmdlZCBzaW5jZSAyIHll
YXJzIGFnbz8gOikKPiA+ID4gCj4gPiA+IEVycm9ycyBjYW4gYmUgcmV0dXJuZWQgaWYgeW91IGRv
IHNvbWV0aGluZyBmb29saXNoOgo+ID4gPiAJLSBwYXNzIGFuIGVycm9yIGFzIGEgcGFyZW50IHBv
aW50ZXIKPiA+ID4gCS0gcGFzcyBhIG5hbWUgdGhhdCBpcyBhbHJlYWR5IHByZXNlbnQKPiA+IAo+
ID4gVGhhdCBpcyB3aGF0IEkgd2FzIGhpdHRpbmcgcHJldmlvdXNseS4gSWYgd2UgZm9sbG93IHRo
ZSBuZXcgYWR2aWNlIG9mIG5vdAo+ID4gY2hlY2tpbmcgZm9yIGVycm9ycyBkb2VzIHRoaXMgbWVh
biBJIGNhbiBub3cgc3RhcnQgdG8gaGlkZSBkZWJ1Z2ZzIGVudHJpZXMKPiA+IGJ5IHRvdWNoaW5n
IHNvbWUgZGVidWdmcyBmaWxlcyBiZWZvcmUgbW9kdWxlcyBnZXQgbG9hZGVkPwo+IAo+IEhvdyBj
YW4geW91ICJ0b3VjaCIgYSBkZWJ1Z2ZzIGZpbGUgdG9kYXk/CgpUb3VjaMOpISBZZXMsIGxhc3Qg
dGltZSBpdCB3YXMgdGhyb3VnaCBteSBzbG9wcHkgY29kaW5nIDopCgo+IAo+IEFuZCBldmVuIGlm
IHRoZXJlIGlzIGEgZHVwbGljYXRlIGRlYnVnZnMgZmlsZSwgeW91IHNob3VsZG4ndCBjYXJlIGFz
Cj4geW91ciBkcml2ZXIgc2hvdWxkIGtlZXAgZ29pbmcgZXZlbiBpZiBjcmVhdGlvbiBvZiBpdCBm
YWlscyBhcyBubwo+IGZ1bmN0aW9uYWxpdHkgb2YgdGhlIGNvZGUgc2hvdWxkIGV2ZXIgcmVseSBv
biBkZWJ1Z2ZzLgoKQWdyZWUgYW5kIHVuZGVyc3Rvb2QuIFRoYW5rcyBmb3IgdGFraW5nIHRoZSB0
aW1lIHRvIGV4cGxhaW4gaXQgdG8gbWUhCgpCZXN0IHJlZ2FyZHMsCkxpdml1Cgo+IAo+IHRoYW5r
cywKPiAKPiBncmVnIGstaAoKLS0gCj09PT09PT09PT09PT09PT09PT09CnwgSSB3b3VsZCBsaWtl
IHRvIHwKfCBmaXggdGhlIHdvcmxkLCAgfAp8IGJ1dCB0aGV5J3JlIG5vdCB8CnwgZ2l2aW5nIG1l
IHRoZSAgIHwKIFwgc291cmNlIGNvZGUhICAvCiAgLS0tLS0tLS0tLS0tLS0tCiAgICDCr1xfKOOD
hClfL8KvCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
