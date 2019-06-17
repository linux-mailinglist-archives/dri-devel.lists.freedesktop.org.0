Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F42A49A0C
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2019 09:12:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68F186E0F5;
	Tue, 18 Jun 2019 07:12:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 22A0C89259;
 Mon, 17 Jun 2019 17:18:21 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A9B7128;
 Mon, 17 Jun 2019 10:18:20 -0700 (PDT)
Received: from arrakis.emea.arm.com (arrakis.cambridge.arm.com [10.1.196.78])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id
 08B543F246; Mon, 17 Jun 2019 10:18:15 -0700 (PDT)
Date: Mon, 17 Jun 2019 18:18:13 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Evgenii Stepanov <eugenis@google.com>
Subject: Re: [PATCH v17 03/15] arm64: Introduce prctl() options to control
 the tagged user addresses ABI
Message-ID: <20190617171813.GC34565@arrakis.emea.arm.com>
References: <cover.1560339705.git.andreyknvl@google.com>
 <a7a2933bea5fe57e504891b7eec7e9432e5e1c1a.1560339705.git.andreyknvl@google.com>
 <20190617135636.GC1367@arrakis.emea.arm.com>
 <CAFKCwrjJ+0ijNKa3ioOP7xa91QmZU0NhkO=tNC-Q_ThC69vTug@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFKCwrjJ+0ijNKa3ioOP7xa91QmZU0NhkO=tNC-Q_ThC69vTug@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Tue, 18 Jun 2019 07:12:01 +0000
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
 linux-media@vger.kernel.org, Kevin Brodsky <kevin.brodsky@arm.com>,
 Kees Cook <keescook@chromium.org>, Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
 Andrey Konovalov <andreyknvl@google.com>,
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

T24gTW9uLCBKdW4gMTcsIDIwMTkgYXQgMDk6NTc6MzZBTSAtMDcwMCwgRXZnZW5paSBTdGVwYW5v
diB3cm90ZToKPiBPbiBNb24sIEp1biAxNywgMjAxOSBhdCA2OjU2IEFNIENhdGFsaW4gTWFyaW5h
cyA8Y2F0YWxpbi5tYXJpbmFzQGFybS5jb20+IHdyb3RlOgo+ID4gT24gV2VkLCBKdW4gMTIsIDIw
MTkgYXQgMDE6NDM6MjBQTSArMDIwMCwgQW5kcmV5IEtvbm92YWxvdiB3cm90ZToKPiA+ID4gRnJv
bTogQ2F0YWxpbiBNYXJpbmFzIDxjYXRhbGluLm1hcmluYXNAYXJtLmNvbT4KPiA+ID4KPiA+ID4g
SXQgaXMgbm90IGRlc2lyYWJsZSB0byByZWxheCB0aGUgQUJJIHRvIGFsbG93IHRhZ2dlZCB1c2Vy
IGFkZHJlc3NlcyBpbnRvCj4gPiA+IHRoZSBrZXJuZWwgaW5kaXNjcmltaW5hdGVseS4gVGhpcyBw
YXRjaCBpbnRyb2R1Y2VzIGEgcHJjdGwoKSBpbnRlcmZhY2UKPiA+ID4gZm9yIGVuYWJsaW5nIG9y
IGRpc2FibGluZyB0aGUgdGFnZ2VkIEFCSSB3aXRoIGEgZ2xvYmFsIHN5c2N0bCBjb250cm9sCj4g
PiA+IGZvciBwcmV2ZW50aW5nIGFwcGxpY2F0aW9ucyBmcm9tIGVuYWJsaW5nIHRoZSByZWxheGVk
IEFCSSAobWVhbnQgZm9yCj4gPiA+IHRlc3RpbmcgdXNlci1zcGFjZSBwcmN0bCgpIHJldHVybiBl
cnJvciBjaGVja2luZyB3aXRob3V0IHJlY29uZmlndXJpbmcKPiA+ID4gdGhlIGtlcm5lbCkuIFRo
ZSBBQkkgcHJvcGVydGllcyBhcmUgaW5oZXJpdGVkIGJ5IHRocmVhZHMgb2YgdGhlIHNhbWUKPiA+
ID4gYXBwbGljYXRpb24gYW5kIGZvcmsoKSdlZCBjaGlsZHJlbiBidXQgY2xlYXJlZCBvbiBleGVj
dmUoKS4KPiA+ID4KPiA+ID4gVGhlIFBSX1NFVF9UQUdHRURfQUREUl9DVFJMIHdpbGwgYmUgZXhw
YW5kZWQgaW4gdGhlIGZ1dHVyZSB0byBoYW5kbGUKPiA+ID4gTVRFLXNwZWNpZmljIHNldHRpbmdz
IGxpa2UgaW1wcmVjaXNlIHZzIHByZWNpc2UgZXhjZXB0aW9ucy4KPiA+ID4KPiA+ID4gU2lnbmVk
LW9mZi1ieTogQ2F0YWxpbiBNYXJpbmFzIDxjYXRhbGluLm1hcmluYXNAYXJtLmNvbT4KPiA+Cj4g
PiBBIHF1ZXN0aW9uIGZvciB0aGUgdXNlci1zcGFjZSBmb2xrOiBpZiBhbiBhcHBsaWNhdGlvbiBv
cHRzIGluIHRvIHRoaXMKPiA+IEFCSSwgd291bGQgeW91IHdhbnQgdGhlIHNpZ2NvbnRleHQuZmF1
bHRfYWRkcmVzcyBhbmQvb3Igc2lnaW5mby5zaV9hZGRyCj4gPiB0byBjb250YWluIHRoZSB0YWc/
IFdlIGN1cnJlbnRseSBjbGVhciBpdCBlYXJseSBpbiB0aGUgYXJtNjQgZW50cnkuUyBidXQKPiA+
IHdlIGNvdWxkIGZpbmQgYSB3YXkgdG8gcGFzcyBpdCBkb3duIGlmIG5lZWRlZC4KPiAKPiBGb3Ig
SFdBU2FuIHRoaXMgd291bGQgbm90IGJlIHVzZWZ1bCBiZWNhdXNlIHdlIGluc3RydW1lbnQgbWVt
b3J5Cj4gYWNjZXNzZXMgd2l0aCBleHBsaWNpdCBjaGVja3MgYW55d2F5LiBGb3IgTVRFLCBvbiB0
aGUgb3RoZXIgaGFuZCwgaXQKPiB3b3VsZCBiZSB2ZXJ5IGNvbnZlbmllbnQgdG8ga25vdyB0aGUg
ZmF1bHQgYWRkcmVzcyB0YWcgd2l0aG91dAo+IGRpc2Fzc2VtYmxpbmcgdGhlIGNvZGUuCgpJIGNv
dWxkIGFzIHRoaXMgZGlmZmVyZW50bHk6IGRvZXMgYW55dGhpbmcgYnJlYWsgaWYsIG9uY2UgdGhl
IHVzZXIKb3B0cyBpbiB0byBUQkksIGZhdWx0X2FkZHJlc3MgYW5kL29yIHNpX2FkZHIgaGF2ZSBu
b24temVybyB0b3AgYnl0ZT8KCkFsdGVybmF0aXZlbHksIHdlIGNvdWxkIHByZXNlbnQgdGhlIG9y
aWdpbmFsIEZBUl9FTDEgcmVnaXN0ZXIgYXMgYQpzZXBhcmF0ZSBmaWVsZCBhcyB3ZSBkbyB3aXRo
IEVTUl9FTDEsIGluZGVwZW5kZW50bHkgb2Ygd2hldGhlciB0aGUgdXNlcgpvcHRlZCBpbiB0byBU
Qkkgb3Igbm90LgoKLS0gCkNhdGFsaW4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
