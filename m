Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 22C9074830
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2019 09:30:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 893956E690;
	Thu, 25 Jul 2019 07:29:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9C6056E5B0;
 Wed, 24 Jul 2019 14:21:06 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4AFA328;
 Wed, 24 Jul 2019 07:21:06 -0700 (PDT)
Received: from fuggles.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 761323F71A;
 Wed, 24 Jul 2019 07:21:01 -0700 (PDT)
Date: Wed, 24 Jul 2019 15:20:59 +0100
From: Will Deacon <will.deacon@arm.com>
To: Andrey Konovalov <andreyknvl@google.com>
Subject: Re: [PATCH v19 00/15] arm64: untag user pointers passed to the kernel
Message-ID: <20190724142059.GC21234@fuggles.cambridge.arm.com>
References: <cover.1563904656.git.andreyknvl@google.com>
 <CAAeHK+yc0D_nd7nTRsY4=qcSx+eQR0VLut3uXMf4NEiE-VpeCw@mail.gmail.com>
 <20190724140212.qzvbcx5j2gi5lcoj@willie-the-truck>
 <CAAeHK+xXzdQHpVXL7f1T2Ef2P7GwFmDMSaBH4VG8fT3=c_OnjQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAeHK+xXzdQHpVXL7f1T2Ef2P7GwFmDMSaBH4VG8fT3=c_OnjQ@mail.gmail.com>
User-Agent: Mutt/1.11.1+86 (6f28e57d73f2) ()
X-Mailman-Approved-At: Thu, 25 Jul 2019 07:29:33 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, kvm@vger.kernel.org,
 Christian Koenig <Christian.Koenig@amd.com>,
 Szabolcs Nagy <Szabolcs.Nagy@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, dri-devel@lists.freedesktop.org,
 Kostya Serebryany <kcc@google.com>, Khalid Aziz <khalid.aziz@oracle.com>,
 Lee Smith <Lee.Smith@arm.com>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>, Will Deacon <will@kernel.org>,
 Jacob Bramley <Jacob.Bramley@arm.com>, Leon Romanovsky <leon@kernel.org>,
 linux-rdma@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Dmitry Vyukov <dvyukov@google.com>, Dave Martin <Dave.Martin@arm.com>,
 Evgeniy Stepanov <eugenis@google.com>, linux-media@vger.kernel.org,
 Kees Cook <keescook@chromium.org>, Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
 Kevin Brodsky <kevin.brodsky@arm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 Jens Wiklander <jens.wiklander@linaro.org>,
 Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
 Alexander Deucher <Alexander.Deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>, enh <enh@google.com>,
 Robin Murphy <robin.murphy@arm.com>, Yishai Hadas <yishaih@mellanox.com>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdWwgMjQsIDIwMTkgYXQgMDQ6MTY6NDlQTSArMDIwMCwgQW5kcmV5IEtvbm92YWxv
diB3cm90ZToKPiBPbiBXZWQsIEp1bCAyNCwgMjAxOSBhdCA0OjAyIFBNIFdpbGwgRGVhY29uIDx3
aWxsQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4gT24gVHVlLCBKdWwgMjMsIDIwMTkgYXQgMDg6MDM6
MjlQTSArMDIwMCwgQW5kcmV5IEtvbm92YWxvdiB3cm90ZToKPiA+ID4gT24gVHVlLCBKdWwgMjMs
IDIwMTkgYXQgNzo1OSBQTSBBbmRyZXkgS29ub3ZhbG92IDxhbmRyZXlrbnZsQGdvb2dsZS5jb20+
IHdyb3RlOgo+ID4gPiA+Cj4gPiA+ID4gPT09IE92ZXJ2aWV3Cj4gPiA+ID4KPiA+ID4gPiBhcm02
NCBoYXMgYSBmZWF0dXJlIGNhbGxlZCBUb3AgQnl0ZSBJZ25vcmUsIHdoaWNoIGFsbG93cyB0byBl
bWJlZCBwb2ludGVyCj4gPiA+ID4gdGFncyBpbnRvIHRoZSB0b3AgYnl0ZSBvZiBlYWNoIHBvaW50
ZXIuIFVzZXJzcGFjZSBwcm9ncmFtcyAoc3VjaCBhcwo+ID4gPiA+IEhXQVNhbiwgYSBtZW1vcnkg
ZGVidWdnaW5nIHRvb2wgWzFdKSBtaWdodCB1c2UgdGhpcyBmZWF0dXJlIGFuZCBwYXNzCj4gPiA+
ID4gdGFnZ2VkIHVzZXIgcG9pbnRlcnMgdG8gdGhlIGtlcm5lbCB0aHJvdWdoIHN5c2NhbGxzIG9y
IG90aGVyIGludGVyZmFjZXMuCj4gPiA+ID4KPiA+ID4gPiBSaWdodCBub3cgdGhlIGtlcm5lbCBp
cyBhbHJlYWR5IGFibGUgdG8gaGFuZGxlIHVzZXIgZmF1bHRzIHdpdGggdGFnZ2VkCj4gPiA+ID4g
cG9pbnRlcnMsIGR1ZSB0byB0aGVzZSBwYXRjaGVzOgo+ID4gPiA+Cj4gPiA+ID4gMS4gODFjZGRk
NjUgKCJhcm02NDogdHJhcHM6IGZpeCB1c2Vyc3BhY2UgY2FjaGUgbWFpbnRlbmFuY2UgZW11bGF0
aW9uIG9uIGEKPiA+ID4gPiAgICAgICAgICAgICAgdGFnZ2VkIHBvaW50ZXIiKQo+ID4gPiA+IDIu
IDdkY2Q5ZGQ4ICgiYXJtNjQ6IGh3X2JyZWFrcG9pbnQ6IGZpeCB3YXRjaHBvaW50IG1hdGNoaW5n
IGZvciB0YWdnZWQKPiA+ID4gPiAgICAgICAgICAgICAgIHBvaW50ZXJzIikKPiA+ID4gPiAzLiAy
NzZlOTMyNyAoImFybTY0OiBlbnRyeTogaW1wcm92ZSBkYXRhIGFib3J0IGhhbmRsaW5nIG9mIHRh
Z2dlZAo+ID4gPiA+ICAgICAgICAgICAgICAgcG9pbnRlcnMiKQo+ID4gPiA+Cj4gPiA+ID4gVGhp
cyBwYXRjaHNldCBleHRlbmRzIHRhZ2dlZCBwb2ludGVyIHN1cHBvcnQgdG8gc3lzY2FsbCBhcmd1
bWVudHMuCj4gPgo+ID4gWy4uLl0KPiA+Cj4gPiA+IERvIHlvdSB0aGluayB0aGlzIGlzIHJlYWR5
IHRvIGJlIG1lcmdlZD8KPiA+ID4KPiA+ID4gU2hvdWxkIHRoaXMgZ28gdGhyb3VnaCB0aGUgbW0g
b3IgdGhlIGFybSB0cmVlPwo+ID4KPiA+IEkgd291bGQgY2VydGFpbmx5IHByZWZlciB0byB0YWtl
IGF0IGxlYXN0IHRoZSBhcm02NCBiaXRzIHZpYSB0aGUgYXJtNjQgdHJlZQo+ID4gKGkuZS4gcGF0
Y2hlcyAxLCAyIGFuZCAxNSkuIFdlIGFsc28gbmVlZCBhIERvY3VtZW50YXRpb24gcGF0Y2ggZGVz
Y3JpYmluZwo+ID4gdGhlIG5ldyBBQkkuCj4gCj4gU291bmRzIGdvb2QhIFNob3VsZCBJIHBvc3Qg
dGhvc2UgcGF0Y2hlcyB0b2dldGhlciB3aXRoIHRoZQo+IERvY3VtZW50YXRpb24gcGF0Y2hlcyBm
cm9tIFZpbmNlbnpvIGFzIGEgc2VwYXJhdGUgcGF0Y2hzZXQ/CgpZZXMsIHBsZWFzZSAoYWx0aG91
Z2ggYXMgeW91IHNheSBiZWxvdywgd2UgbmVlZCBhIG5ldyB2ZXJzaW9uIG9mIHRob3NlCnBhdGNo
ZXMgZnJvbSBWaW5jZW56byB0byBhZGRyZXNzIHRoZSBmZWVkYmFjayBvbiB2NSkuIFRoZSBvdGhl
ciB0aGluZyBJCnNob3VsZCBzYXkgaXMgdGhhdCBJJ2QgYmUgaGFwcHkgdG8gcXVldWUgdGhlIG90
aGVyIHBhdGNoZXMgaW4gdGhlIHNlcmllcwp0b28sIGJ1dCBzb21lIG9mIHRoZW0gYXJlIG1pc3Np
bmcgYWNrcyBmcm9tIHRoZSByZWxldmFudCBtYWludGFpbmVycyAoZS5nLgp0aGUgbW0vIGFuZCBm
cy8gY2hhbmdlcykuCgpXaWxsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
