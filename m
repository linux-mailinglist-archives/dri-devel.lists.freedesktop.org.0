Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 117CC4560E
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 09:24:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AE268982C;
	Fri, 14 Jun 2019 07:22:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 39B36896ED;
 Thu, 13 Jun 2019 15:58:23 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D2C10367;
 Thu, 13 Jun 2019 08:58:22 -0700 (PDT)
Received: from C02TF0J2HF1T.local (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 825ED3F246;
 Thu, 13 Jun 2019 08:58:02 -0700 (PDT)
Date: Thu, 13 Jun 2019 16:57:55 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Vincenzo Frascino <vincenzo.frascino@arm.com>
Subject: Re: [PATCH v17 03/15] arm64: Introduce prctl() options to control
 the tagged user addresses ABI
Message-ID: <20190613155754.GX28951@C02TF0J2HF1T.local>
References: <cover.1560339705.git.andreyknvl@google.com>
 <a7a2933bea5fe57e504891b7eec7e9432e5e1c1a.1560339705.git.andreyknvl@google.com>
 <20190613111659.GX28398@e103592.cambridge.arm.com>
 <20190613153505.GU28951@C02TF0J2HF1T.local>
 <99cc257d-5e99-922a-fbe7-3bbaf3621e38@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <99cc257d-5e99-922a-fbe7-3bbaf3621e38@arm.com>
User-Agent: Mutt/1.11.2 (2019-01-07)
X-Mailman-Approved-At: Fri, 14 Jun 2019 07:21:24 +0000
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
 Szabolcs Nagy <Szabolcs.Nagy@arm.com>, Will Deacon <will.deacon@arm.com>,
 dri-devel@lists.freedesktop.org, Kostya Serebryany <kcc@google.com>,
 Khalid Aziz <khalid.aziz@oracle.com>, Lee Smith <Lee.Smith@arm.com>,
 linux-kselftest@vger.kernel.org, Jacob Bramley <Jacob.Bramley@arm.com>,
 Leon Romanovsky <leon@kernel.org>, linux-rdma@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Dmitry Vyukov <dvyukov@google.com>,
 Dave Martin <Dave.Martin@arm.com>, Evgeniy Stepanov <eugenis@google.com>,
 linux-media@vger.kernel.org, Kees Cook <keescook@chromium.org>,
 Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
 Andrey Konovalov <andreyknvl@google.com>,
 Kevin Brodsky <kevin.brodsky@arm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>, linux-kernel@vger.kernel.org,
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

T24gVGh1LCBKdW4gMTMsIDIwMTkgYXQgMDQ6NDU6NTRQTSArMDEwMCwgVmluY2Vuem8gRnJhc2Np
bm8gd3JvdGU6Cj4gT24gMTMvMDYvMjAxOSAxNjozNSwgQ2F0YWxpbiBNYXJpbmFzIHdyb3RlOgo+
ID4gT24gVGh1LCBKdW4gMTMsIDIwMTkgYXQgMTI6MTY6NTlQTSArMDEwMCwgRGF2ZSBQIE1hcnRp
biB3cm90ZToKPiA+PiBPbiBXZWQsIEp1biAxMiwgMjAxOSBhdCAwMTo0MzoyMFBNICswMjAwLCBB
bmRyZXkgS29ub3ZhbG92IHdyb3RlOgo+ID4+PiArCj4gPj4+ICsvKgo+ID4+PiArICogQ29udHJv
bCB0aGUgcmVsYXhlZCBBQkkgYWxsb3dpbmcgdGFnZ2VkIHVzZXIgYWRkcmVzc2VzIGludG8gdGhl
IGtlcm5lbC4KPiA+Pj4gKyAqLwo+ID4+PiArc3RhdGljIHVuc2lnbmVkIGludCB0YWdnZWRfYWRk
cl9wcmN0bF9hbGxvd2VkID0gMTsKPiA+Pj4gKwo+ID4+PiArbG9uZyBzZXRfdGFnZ2VkX2FkZHJf
Y3RybCh1bnNpZ25lZCBsb25nIGFyZykKPiA+Pj4gK3sKPiA+Pj4gKwlpZiAoIXRhZ2dlZF9hZGRy
X3ByY3RsX2FsbG93ZWQpCj4gPj4+ICsJCXJldHVybiAtRUlOVkFMOwo+ID4+Cj4gPj4gU28sIHRh
Z2dpbmcgY2FuIGFjdHVhbGx5IGJlIGxvY2tlZCBvbiBieSBoYXZpbmcgYSBwcm9jZXNzIGVuYWJs
ZSBpdCBhbmQKPiA+PiB0aGVuIHNvbWUgcG9zc2libHkgdW5yZWxhdGVkIHByb2Nlc3MgY2xlYXJp
bmcgdGFnZ2VkX2FkZHJfcHJjdGxfYWxsb3dlZC4KPiA+PiBUaGF0IGZlZWxzIGEgYml0IHdlaXJk
Lgo+ID4gCj4gPiBUaGUgcHJvYmxlbSBpcyB0aGF0IGlmIHlvdSBkaXNhYmxlIHRoZSBBQkkgZ2xv
YmFsbHksIGxvdHMgb2YKPiA+IGFwcGxpY2F0aW9ucyB3b3VsZCBjcmFzaC4gVGhpcyBzeXNjdGwg
aXMgbWVhbnQgYXMgYSB3YXkgdG8gZGlzYWJsZSB0aGUKPiA+IG9wdC1pbiB0byB0aGUgVEJJIEFC
SS4gQW5vdGhlciBvcHRpb24gd291bGQgYmUgYSBrZXJuZWwgY29tbWFuZCBsaW5lCj4gPiBvcHRp
b24gKEknbSBub3Qga2VlbiBvbiBhIEtjb25maWcgb3B0aW9uKS4KPiAKPiBXaHkgeW91IGFyZSBu
b3Qga2VlbiBvbiBhIEtjb25maWcgb3B0aW9uPwoKQmVjYXVzZSBJIGRvbid0IHdhbnQgdG8gcmVi
dWlsZCB0aGUga2VybmVsL3JlYm9vdCBqdXN0IHRvIGJlIGFibGUgdG8KdGVzdCBob3cgdXNlciBz
cGFjZSBoYW5kbGVzIHRoZSBBQkkgb3B0LWluLiBJJ20gb2sgd2l0aCBhIEtjb25maWcgb3B0aW9u
CnRvIGRpc2FibGUgdGhpcyBnbG9iYWxseSBpbiBhZGRpdGlvbiB0byBhIHJ1bi10aW1lIG9wdGlv
biAoaWYgYWN0dWFsbHkKbmVlZGVkLCBJJ20gbm90IHN1cmUpLgoKLS0gCkNhdGFsaW4KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
