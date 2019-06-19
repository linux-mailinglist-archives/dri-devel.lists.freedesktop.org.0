Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C1D74C7FE
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2019 09:14:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE0716E504;
	Thu, 20 Jun 2019 07:13:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7B6906E3D6;
 Wed, 19 Jun 2019 15:29:46 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EF1DA344;
 Wed, 19 Jun 2019 08:29:45 -0700 (PDT)
Received: from arrakis.emea.arm.com (arrakis.cambridge.arm.com [10.1.196.78])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id
 4E94C3F246; Wed, 19 Jun 2019 08:29:41 -0700 (PDT)
Date: Wed, 19 Jun 2019 16:29:39 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Andrey Konovalov <andreyknvl@google.com>
Subject: Re: [PATCH v17 03/15] arm64: Introduce prctl() options to control
 the tagged user addresses ABI
Message-ID: <20190619152938.GD25211@arrakis.emea.arm.com>
References: <cover.1560339705.git.andreyknvl@google.com>
 <a7a2933bea5fe57e504891b7eec7e9432e5e1c1a.1560339705.git.andreyknvl@google.com>
 <CAAeHK+xvtqALY9DESF048mR17Po=W++QwWOUOOeSXKgriVTC-w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAeHK+xvtqALY9DESF048mR17Po=W++QwWOUOOeSXKgriVTC-w@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Thu, 20 Jun 2019 07:13:36 +0000
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
 Szabolcs Nagy <Szabolcs.Nagy@arm.com>, Will Deacon <will.deacon@arm.com>,
 dri-devel@lists.freedesktop.org,
 Linux Memory Management List <linux-mm@kvack.org>,
 Khalid Aziz <khalid.aziz@oracle.com>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Jacob Bramley <Jacob.Bramley@arm.com>, Leon Romanovsky <leon@kernel.org>,
 linux-rdma@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Dmitry Vyukov <dvyukov@google.com>, Dave Martin <Dave.Martin@arm.com>,
 Evgeniy Stepanov <eugenis@google.com>, linux-media@vger.kernel.org,
 Kevin Brodsky <kevin.brodsky@arm.com>, Kees Cook <keescook@chromium.org>,
 Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
 Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Kostya Serebryany <kcc@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yishai Hadas <yishaih@mellanox.com>, LKML <linux-kernel@vger.kernel.org>,
 Jens Wiklander <jens.wiklander@linaro.org>, Lee Smith <Lee.Smith@arm.com>,
 Alexander Deucher <Alexander.Deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>, enh <enh@google.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Christian Koenig <Christian.Koenig@amd.com>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdW4gMTksIDIwMTkgYXQgMDQ6NDU6MDJQTSArMDIwMCwgQW5kcmV5IEtvbm92YWxv
diB3cm90ZToKPiBPbiBXZWQsIEp1biAxMiwgMjAxOSBhdCAxOjQzIFBNIEFuZHJleSBLb25vdmFs
b3YgPGFuZHJleWtudmxAZ29vZ2xlLmNvbT4gd3JvdGU6Cj4gPiBGcm9tOiBDYXRhbGluIE1hcmlu
YXMgPGNhdGFsaW4ubWFyaW5hc0Bhcm0uY29tPgo+ID4KPiA+IEl0IGlzIG5vdCBkZXNpcmFibGUg
dG8gcmVsYXggdGhlIEFCSSB0byBhbGxvdyB0YWdnZWQgdXNlciBhZGRyZXNzZXMgaW50bwo+ID4g
dGhlIGtlcm5lbCBpbmRpc2NyaW1pbmF0ZWx5LiBUaGlzIHBhdGNoIGludHJvZHVjZXMgYSBwcmN0
bCgpIGludGVyZmFjZQo+ID4gZm9yIGVuYWJsaW5nIG9yIGRpc2FibGluZyB0aGUgdGFnZ2VkIEFC
SSB3aXRoIGEgZ2xvYmFsIHN5c2N0bCBjb250cm9sCj4gPiBmb3IgcHJldmVudGluZyBhcHBsaWNh
dGlvbnMgZnJvbSBlbmFibGluZyB0aGUgcmVsYXhlZCBBQkkgKG1lYW50IGZvcgo+ID4gdGVzdGlu
ZyB1c2VyLXNwYWNlIHByY3RsKCkgcmV0dXJuIGVycm9yIGNoZWNraW5nIHdpdGhvdXQgcmVjb25m
aWd1cmluZwo+ID4gdGhlIGtlcm5lbCkuIFRoZSBBQkkgcHJvcGVydGllcyBhcmUgaW5oZXJpdGVk
IGJ5IHRocmVhZHMgb2YgdGhlIHNhbWUKPiA+IGFwcGxpY2F0aW9uIGFuZCBmb3JrKCknZWQgY2hp
bGRyZW4gYnV0IGNsZWFyZWQgb24gZXhlY3ZlKCkuCj4gPgo+ID4gVGhlIFBSX1NFVF9UQUdHRURf
QUREUl9DVFJMIHdpbGwgYmUgZXhwYW5kZWQgaW4gdGhlIGZ1dHVyZSB0byBoYW5kbGUKPiA+IE1U
RS1zcGVjaWZpYyBzZXR0aW5ncyBsaWtlIGltcHJlY2lzZSB2cyBwcmVjaXNlIGV4Y2VwdGlvbnMu
Cj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogQ2F0YWxpbiBNYXJpbmFzIDxjYXRhbGluLm1hcmluYXNA
YXJtLmNvbT4KPiAKPiBDYXRhbGluLCB3b3VsZCB5b3UgbGlrZSB0byBkbyB0aGUgcmVxdWVzdGVk
IGNoYW5nZXMgdG8gdGhpcyBwYXRjaAo+IHlvdXJzZWxmIGFuZCBzZW5kIGl0IHRvIG1lIG9yIHNo
b3VsZCBJIGRvIHRoYXQ/CgpJJ2xsIHNlbmQgeW91IGFuIHVwZGF0ZWQgdmVyc2lvbiB0aGlzIHdl
ZWsuCgotLSAKQ2F0YWxpbgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
