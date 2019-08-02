Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C82ED81360
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2019 09:36:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A03836E2A4;
	Mon,  5 Aug 2019 07:34:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id BA8086EDC4;
 Fri,  2 Aug 2019 10:50:45 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6CBE3344;
 Fri,  2 Aug 2019 03:50:45 -0700 (PDT)
Received: from arrakis.emea.arm.com (arrakis.cambridge.arm.com [10.1.196.78])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id
 9FF973F71F; Fri,  2 Aug 2019 03:50:40 -0700 (PDT)
Date: Fri, 2 Aug 2019 11:50:38 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Dave Hansen <dave.hansen@intel.com>
Subject: Re: [PATCH v19 02/15] arm64: Introduce prctl() options to control
 the tagged user addresses ABI
Message-ID: <20190802105038.GC4175@arrakis.emea.arm.com>
References: <cover.1563904656.git.andreyknvl@google.com>
 <1c05651c53f90d07e98ee4973c2786ccf315db12.1563904656.git.andreyknvl@google.com>
 <7a34470c-73f0-26ac-e63d-161191d4b1e4@intel.com>
 <2b274c6f-6023-8eb8-5a86-507e6000e13d@arm.com>
 <88c59d1e-eda9-fcfe-5ee3-64a331f34313@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <88c59d1e-eda9-fcfe-5ee3-64a331f34313@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Mon, 05 Aug 2019 07:34:45 +0000
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
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Khalid Aziz <khalid.aziz@oracle.com>, linux-kselftest@vger.kernel.org,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Jacob Bramley <Jacob.Bramley@arm.com>, Leon Romanovsky <leon@kernel.org>,
 linux-rdma@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Dmitry Vyukov <dvyukov@google.com>,
 Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
 Dave Martin <Dave.Martin@arm.com>, Evgeniy Stepanov <eugenis@google.com>,
 linux-media@vger.kernel.org, Kees Cook <keescook@chromium.org>,
 Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
 Andrey Konovalov <andreyknvl@google.com>,
 Kevin Brodsky <kevin.brodsky@arm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Kostya Serebryany <kcc@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yishai Hadas <yishaih@mellanox.com>, linux-kernel@vger.kernel.org,
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

T24gVGh1LCBBdWcgMDEsIDIwMTkgYXQgMDk6NDU6MDVBTSAtMDcwMCwgRGF2ZSBIYW5zZW4gd3Jv
dGU6Cj4gT24gOC8xLzE5IDU6MzggQU0sIEtldmluIEJyb2Rza3kgd3JvdGU6Cj4gPiBUaGlzIHBh
dGNoIHNlcmllcyBvbmx5IGNoYW5nZXMgd2hhdCBpcyBhbGxvd2VkIG9yIG5vdCBhdCB0aGUgc3lz
Y2FsbAo+ID4gaW50ZXJmYWNlLiBJdCBkb2VzIG5vdCBjaGFuZ2UgdGhlIGFkZHJlc3Mgc3BhY2Ug
c2l6ZS4gT24gYXJtNjQsIFRCSSAoVG9wCj4gPiBCeXRlIElnbm9yZSkgaGFzIGFsd2F5cyBiZWVu
IGVuYWJsZWQgZm9yIHVzZXJzcGFjZSwgc28gaXQgaGFzIG5ldmVyIGJlZW4KPiA+IHBvc3NpYmxl
IHRvIHVzZSB0aGUgdXBwZXIgOCBiaXRzIG9mIHVzZXIgcG9pbnRlcnMgZm9yIGFkZHJlc3Npbmcu
Cj4gCj4gT2gsIHNvIGRvZXMgdGhlIGFkZHJlc3Mgc3BhY2UgdGhhdCdzIGF2YWlsYWJsZSBhbHJl
YWR5IGNob3AgdGhhdCBvdXQ/CgpZZXMuIEN1cnJlbnRseSB0aGUgaGFyZHdhcmUgb25seSBzdXBw
b3J0cyA1Mi1iaXQgdmlydHVhbCBhZGRyZXNzZXMuIEl0CmNvdWxkIGJlIGV4cGFuZGVkICh0aG91
Z2ggaXQgbmVlZHMgYSA1dGggcGFnZSB0YWJsZSBsZXZlbCkgdG8gNTYtYml0IFZBCmJ1dCBpdCdz
IG5vdCBjdXJyZW50bHkgb24gb3VyIChoYXJkd2FyZSkgcGxhbnMuIEJleW9uZCA1Ni1iaXQsIGl0
IGNhbm5vdApiZSBkb25lIHdpdGhvdXQgYnJlYWtpbmcgdGhlIHNvZnR3YXJlIGV4cGVjdGF0aW9u
cyAoYW5kIGhvcGVmdWxseSBJJ2xsCnJldGlyZSBiZWZvcmUgd2UgbmVlZCB0aGlzIDspKS4KCj4g
PiBJZiBvdGhlciBhcmNoaXRlY3R1cmVzIHdlcmUgdG8gc3VwcG9ydCBhIHNpbWlsYXIgZnVuY3Rp
b25hbGl0eSwgdGhlbiBJCj4gPiBhZ3JlZSB0aGF0IGEgY29tbW9uIGFuZCBtb3JlIGdlbmVyaWMg
aW50ZXJmYWNlIChpZiBuZWVkZWQpIHdvdWxkIGJlCj4gPiBoZWxwZnVsLCBidXQgYXMgaXQgc3Rh
bmRzIHRoaXMgaXMgYW4gYXJtNjQtc3BlY2lmaWMgcHJjdGwsIGFuZCBvbiBhcm02NAo+ID4gdGhl
IGFkZHJlc3MgdGFnIGlzIGRlZmluZWQgYnkgdGhlIGFyY2hpdGVjdHVyZSBhcyBiaXRzIFs2Mzo1
Nl0uCj4gCj4gSXQgc2hvdWxkIHRoZW4gYmUgYW4gYXJjaF9wcmN0bCgpLCBubz8KCkkgZ3Vlc3Mg
eW91IGp1c3Qgd2FudCByZW5hbWluZyBTRVRfVEFHR0VEX0FERFJfQ1RSTCgpIHRvCmFyY2hfcHJj
dGxfdGFnZ2VkX2FkZHJfY3RybF9zZXQoKT8gKHNpbWlsYXJseSBmb3IgJ2dldCcpCgotLSAKQ2F0
YWxpbgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
