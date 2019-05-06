Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C2CF615E16
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2019 09:20:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DF7C89DB9;
	Tue,  7 May 2019 07:20:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7371C89958
 for <dri-devel@lists.freedesktop.org>; Mon,  6 May 2019 13:44:27 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id z26so6804728pfg.6
 for <dri-devel@lists.freedesktop.org>; Mon, 06 May 2019 06:44:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=P1AsWbEhRa0wHsK8aH/Xd0AjHqgvO+evP2tETj4R/Hs=;
 b=Juq3ZebM9hEl+MVn1jYy04ErCuvUT4VJ40iWnSjUIHIllvcgZMH2ZL0t5ixv30ayq/
 GXCYHICtEvTcExUbmU1RHNc+wVKmuZdPrHr+jK+Qv5vT2UyTAb2WfDHM7VOpmL2S7MmE
 xkmhTYbl86I7/ueyk9TTTwANgzNjNvCsWVx/6cgIP3XjJ8edI4h7uQlBAMP6QigZr1dd
 5mP7Ub4yn5MZo1uEh6kjXNTCLClYwXgf0qIzmNf8Y0vZtiOSqZ8vw63NBiHf2ICuBDe2
 mqO4X3iUSkGWMnYzGuw8JAj3yNt+DnZU1MDWyQsB8VJDSPxOpFhUqoY1BjhqDGr01a4V
 Sl/A==
X-Gm-Message-State: APjAAAXPJKrqBbowTHHsMCLUb+Cbj9eoFh2J+1hREd7RNLCRRziK6Rti
 6D+l1Xh0I0ac6amYkVqTb4a0gstG/2KuXZrl0nl4wg==
X-Google-Smtp-Source: APXvYqyNDZxWsCMEiiGgR4F3I9CPNPMghQJxWH7nmS2ow6tBDXdVdmASCVpQ1EAh1QL7BadGynC5IC5t7w0MYPoEEO8=
X-Received: by 2002:a65:610a:: with SMTP id z10mr32127312pgu.54.1557150266321; 
 Mon, 06 May 2019 06:44:26 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1556630205.git.andreyknvl@google.com>
 <9a50ef07d927cbccd9620894bda825e551168c3d.1556630205.git.andreyknvl@google.com>
 <bfe5e11e-6dc4-352f-57eb-d527f965a2ef@amd.com>
In-Reply-To: <bfe5e11e-6dc4-352f-57eb-d527f965a2ef@amd.com>
From: Andrey Konovalov <andreyknvl@google.com>
Date: Mon, 6 May 2019 15:44:15 +0200
Message-ID: <CAAeHK+wFq_NwhYtoGapcrKDnCxZUcquBuW_ZCae+8CAqtp3ndQ@mail.gmail.com>
Subject: Re: [PATCH v14 12/17] drm/radeon, arm64: untag user pointers
To: "Kuehling, Felix" <Felix.Kuehling@amd.com>
X-Mailman-Approved-At: Tue, 07 May 2019 07:20:13 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=P1AsWbEhRa0wHsK8aH/Xd0AjHqgvO+evP2tETj4R/Hs=;
 b=mCRvGiMCWNKbNQEDEHJPLjAQLrUoFSSCHXZ4fTSXpN0g/fIsZshRPm9ndJR5eUZFeS
 cUUVjH5+H0srhJLB97pYS1dAESJ7tlFO12o1QmSKRMylSSrMX7eSkAQZPeAl3j+/4jot
 Z0rf7bLAB+FWXtNFndWhjKloQyKtxfQf5Kq8g+VAeVRm9B5go9fsjfeA1Dd6Ooje6hgH
 357+7liJijJSnEfmpI/7ugnjlRqi6Wms+2k2fk5xNGdbQ6jmPTdGnzA1IYZPJTlgFqN0
 Ndu9I5tb/O92PbPFqb8n8H87QKDs4WxDWcu0C7SbNnCwtFrTK4+5MXiNHqnk7vlAYn6T
 l3OQ==
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 "Koenig@google.com" <Koenig@google.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 Szabolcs Nagy <Szabolcs.Nagy@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
 Chintan Pandya <cpandya@codeaurora.org>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Jacob Bramley <Jacob.Bramley@arm.com>, Leon Romanovsky <leon@kernel.org>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Dave Martin <Dave.Martin@arm.com>, Evgeniy Stepanov <eugenis@google.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 Kevin Brodsky <kevin.brodsky@arm.com>, Kees Cook <keescook@chromium.org>,
 Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
 Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
 "Deucher@google.com" <Deucher@google.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Dmitry Vyukov <dvyukov@google.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 "Kuehling@google.com" <Kuehling@google.com>,
 Kostya Serebryany <kcc@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yishai Hadas <yishaih@mellanox.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Jens Wiklander <jens.wiklander@linaro.org>, Lee Smith <Lee.Smith@arm.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>, Robin Murphy <robin.murphy@arm.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBBcHIgMzAsIDIwMTkgYXQgNzo1NyBQTSBLdWVobGluZywgRmVsaXggPEZlbGl4Lkt1
ZWhsaW5nQGFtZC5jb20+IHdyb3RlOgo+Cj4gT24gMjAxOS0wNC0zMCA5OjI1IGEubS4sIEFuZHJl
eSBLb25vdmFsb3Ygd3JvdGU6Cj4gPiBbQ0FVVElPTjogRXh0ZXJuYWwgRW1haWxdCj4gPgo+ID4g
VGhpcyBwYXRjaCBpcyBhIHBhcnQgb2YgYSBzZXJpZXMgdGhhdCBleHRlbmRzIGFybTY0IGtlcm5l
bCBBQkkgdG8gYWxsb3cgdG8KPiA+IHBhc3MgdGFnZ2VkIHVzZXIgcG9pbnRlcnMgKHdpdGggdGhl
IHRvcCBieXRlIHNldCB0byBzb21ldGhpbmcgZWxzZSBvdGhlcgo+ID4gdGhhbiAweDAwKSBhcyBz
eXNjYWxsIGFyZ3VtZW50cy4KPiA+Cj4gPiByYWRlb25fdHRtX3R0X3Bpbl91c2VycHRyKCkgdXNl
cyBwcm92aWRlZCB1c2VyIHBvaW50ZXJzIGZvciB2bWEKPiA+IGxvb2t1cHMsIHdoaWNoIGNhbiBv
bmx5IGJ5IGRvbmUgd2l0aCB1bnRhZ2dlZCBwb2ludGVycy4gVGhpcyBwYXRjaAo+ID4gdW50YWdz
IHVzZXIgcG9pbnRlcnMgd2hlbiB0aGV5IGFyZSBiZWluZyBzZXQgaW4KPiA+IHJhZGVvbl90dG1f
dHRfcGluX3VzZXJwdHIoKS4KPiA+Cj4gPiBJbiBhbWRncHVfZ2VtX3VzZXJwdHJfaW9jdGwoKSBh
biBNTVUgbm90aWZpZXIgaXMgc2V0IHVwIHdpdGggYSAodGFnZ2VkKQo+ID4gdXNlcnNwYWNlIHBv
aW50ZXIuIFRoZSB1bnRhZ2dlZCBhZGRyZXNzIHNob3VsZCBiZSB1c2VkIHNvIHRoYXQgTU1VCj4g
PiBub3RpZmllcnMgZm9yIHRoZSB1bnRhZ2dlZCBhZGRyZXNzIGdldCBjb3JyZWN0bHkgbWF0Y2hl
ZCB1cCB3aXRoIHRoZSByaWdodAo+ID4gQk8uIFRoaXMgcGF0Y2ggdW50YWdzIHVzZXIgcG9pbnRl
cnMgaW4gcmFkZW9uX2dlbV91c2VycHRyX2lvY3RsKCkuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTog
QW5kcmV5IEtvbm92YWxvdiA8YW5kcmV5a252bEBnb29nbGUuY29tPgo+ID4gLS0tCj4gPiAgIGRy
aXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2dlbS5jIHwgMiArKwo+ID4gICBkcml2ZXJzL2dw
dS9kcm0vcmFkZW9uL3JhZGVvbl90dG0uYyB8IDIgKy0KPiA+ICAgMiBmaWxlcyBjaGFuZ2VkLCAz
IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fZ2VtLmMgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3Jh
ZGVvbl9nZW0uYwo+ID4gaW5kZXggNDQ2MTdkZWM4MTgzLi45MGViNzhmYjVlYjIgMTAwNjQ0Cj4g
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9nZW0uYwo+ID4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fZ2VtLmMKPiA+IEBAIC0yOTEsNiArMjkxLDggQEAg
aW50IHJhZGVvbl9nZW1fdXNlcnB0cl9pb2N0bChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCB2b2lk
ICpkYXRhLAo+ID4gICAgICAgICAgdWludDMyX3QgaGFuZGxlOwo+ID4gICAgICAgICAgaW50IHI7
Cj4gPgo+ID4gKyAgICAgICBhcmdzLT5hZGRyID0gdW50YWdnZWRfYWRkcihhcmdzLT5hZGRyKTsK
PiA+ICsKPiA+ICAgICAgICAgIGlmIChvZmZzZXRfaW5fcGFnZShhcmdzLT5hZGRyIHwgYXJncy0+
c2l6ZSkpCj4gPiAgICAgICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOwo+ID4KPiA+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl90dG0uYyBiL2RyaXZlcnMvZ3B1
L2RybS9yYWRlb24vcmFkZW9uX3R0bS5jCj4gPiBpbmRleCA5OTIwYTZmYzExYmYuLmRjZTcyMmM0
OTRjMSAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX3R0bS5j
Cj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl90dG0uYwo+ID4gQEAgLTc0
Miw3ICs3NDIsNyBAQCBpbnQgcmFkZW9uX3R0bV90dF9zZXRfdXNlcnB0cihzdHJ1Y3QgdHRtX3R0
ICp0dG0sIHVpbnQ2NF90IGFkZHIsCj4gPiAgICAgICAgICBpZiAoZ3R0ID09IE5VTEwpCj4gPiAg
ICAgICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOwo+ID4KPiA+IC0gICAgICAgZ3R0LT51c2Vy
cHRyID0gYWRkcjsKPiA+ICsgICAgICAgZ3R0LT51c2VycHRyID0gdW50YWdnZWRfYWRkcihhZGRy
KTsKPgo+IERvaW5nIHRoaXMgaGVyZSBzZWVtcyB1bm5lY2Vzc2FyeSwgYmVjYXVzZSB5b3UgYWxy
ZWFkeSB1bnRhZ2dlZCB0aGUKPiBhZGRyZXNzIGluIHRoZSBvbmx5IGNhbGxlciBvZiB0aGlzIGZ1
bmN0aW9uIGluIHJhZGVvbl9nZW1fdXNlcnB0cl9pb2N0bC4KPiBUaGUgY2hhbmdlIHRoZXJlIHdp
bGwgYWZmZWN0IGJvdGggdGhlIHVzZXJwdHIgYW5kIE1NVSBub3RpZmllciBzZXR1cCBhbmQKPiBt
YWtlcyBzdXJlIHRoYXQgYm90aCBhcmUgaW4gc3luYywgdXNpbmcgdGhlIHNhbWUgdW50YWdnZWQg
YWRkcmVzcy4KCldpbGwgZml4IGluIHYxNSwgdGhhbmtzIQoKPgo+IFJlZ2FyZHMsCj4gICAgRmVs
aXgKPgo+Cj4gPiAgICAgICAgICBndHQtPnVzZXJtbSA9IGN1cnJlbnQtPm1tOwo+ID4gICAgICAg
ICAgZ3R0LT51c2VyZmxhZ3MgPSBmbGFnczsKPiA+ICAgICAgICAgIHJldHVybiAwOwo+ID4gLS0K
PiA+IDIuMjEuMC41OTMuZzUxMWVjMzQ1ZTE4LWdvb2cKPiA+Cl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
