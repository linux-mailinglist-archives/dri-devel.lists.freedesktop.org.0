Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ACDA15E0F
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2019 09:20:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 333AE89DB7;
	Tue,  7 May 2019 07:20:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94BF4891D2
 for <dri-devel@lists.freedesktop.org>; Mon,  6 May 2019 13:50:37 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id a59so6412513pla.5
 for <dri-devel@lists.freedesktop.org>; Mon, 06 May 2019 06:50:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bQJbdD3DpYVGAJMB4xHT/wsaNr2EFZ6QKX73vdaXiy8=;
 b=Ezlmw2hjmN6+qgrIpfPBnh+Fzy22Ov4FTsP8q4k+ktzxIJlMFJzud4fLahxTt8Nu5A
 NASxFlsxqfNCPfhAUXBlaeK3WRevO92pjkoas7D8k2JIE4LUUaoIfSsaRy/CNIJi17vd
 szp/IAEq/Z+4z5SvlRB7/zanE0RnL55tj3mZFY9bMhGFPv3gB0jkRORMqrUwue04xA9S
 V73VweLLzHoV38N7DVvPdcugiIGFMfb6hsl2WfRFUkeGcfJpvRM55FhKIdDihMhchhI8
 8J/gmIlOau3i0gYkLe0PoTzYJmC0crREF3+lr81+Ac2seGNYzfYzCPEqN21RwOtBmFoN
 uHeA==
X-Gm-Message-State: APjAAAWpfe+VlapaLzfeFVYdTjqogNuR9eVIaakM14IUNk2/ZCx3x/7a
 YxbacRZ0GI+qJ4wKicsQHwgdAmYAmhuAk0zB7Hf4VQ==
X-Google-Smtp-Source: APXvYqwbKSvVTOpuC9GERGa4zYi/56mC1YqRSuljrXhiTGgFzKxKxPy7xquJMcd52Z/Xw9GWuZtYyS77z4awlmXBnWo=
X-Received: by 2002:a17:902:7783:: with SMTP id
 o3mr32208910pll.159.1557150636780; 
 Mon, 06 May 2019 06:50:36 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1556630205.git.andreyknvl@google.com>
 <2e827b5c484be14044933049fec180cd6acb054b.1556630205.git.andreyknvl@google.com>
 <3108d33e-8e18-a73e-5e1a-f0db64f02ab3@amd.com>
In-Reply-To: <3108d33e-8e18-a73e-5e1a-f0db64f02ab3@amd.com>
From: Andrey Konovalov <andreyknvl@google.com>
Date: Mon, 6 May 2019 15:50:25 +0200
Message-ID: <CAAeHK+zDScw-aYpQFVG=JKartDqCF+ZWnq3-6PuaYgMiBphcJA@mail.gmail.com>
Subject: Re: [PATCH v14 11/17] drm/amdgpu, arm64: untag user pointers
To: "Kuehling, Felix" <Felix.Kuehling@amd.com>
X-Mailman-Approved-At: Tue, 07 May 2019 07:20:13 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=bQJbdD3DpYVGAJMB4xHT/wsaNr2EFZ6QKX73vdaXiy8=;
 b=DRQ6yKsX6G++7lU4Zg5s3BYR0P9dOtDVRdgDq4OTKtqnFzdHr5mrU+eAH8m/xaAqq9
 GjaGvUS7mkeRr5xpwetie72lE61cQQyZApscmN4YS70y1VIT4NWv/M48lKerfm627Th7
 gjcuK1BYAbSf4nXxfiio5m7d5spLpXCCTDKGcC2aVAdeBFYRKrP8Z7bE2tG9DZ2rIsGu
 CwljSWmdU9qHLtd/Gz+syQE0KKMpSKrEQoJTqd9Mdkk5tKa5G5tK8eI5XA5KcbzqPu4t
 Lq4Z4U34+8CqteCsW5OMIEDaAHJ5orfzvcPcniCK32BPqiOxrEh1Ln7swqpgKcat4g3N
 37Bg==
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
 Dmitry Vyukov <dvyukov@google.com>, Dave Martin <Dave.Martin@arm.com>,
 Evgeniy Stepanov <eugenis@google.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 Kevin Brodsky <kevin.brodsky@arm.com>, Kees Cook <keescook@chromium.org>,
 Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
 Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Kostya Serebryany <kcc@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yishai Hadas <yishaih@mellanox.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Koenig,
 Christian" <Christian.Koenig@amd.com>, Lee Smith <Lee.Smith@arm.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>, Robin Murphy <robin.murphy@arm.com>,
 Jens Wiklander <jens.wiklander@linaro.org>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBBcHIgMzAsIDIwMTkgYXQgODowMyBQTSBLdWVobGluZywgRmVsaXggPEZlbGl4Lkt1
ZWhsaW5nQGFtZC5jb20+IHdyb3RlOgo+Cj4gT24gMjAxOS0wNC0zMCA5OjI1IGEubS4sIEFuZHJl
eSBLb25vdmFsb3Ygd3JvdGU6Cj4gPiBbQ0FVVElPTjogRXh0ZXJuYWwgRW1haWxdCj4gPgo+ID4g
VGhpcyBwYXRjaCBpcyBhIHBhcnQgb2YgYSBzZXJpZXMgdGhhdCBleHRlbmRzIGFybTY0IGtlcm5l
bCBBQkkgdG8gYWxsb3cgdG8KPiA+IHBhc3MgdGFnZ2VkIHVzZXIgcG9pbnRlcnMgKHdpdGggdGhl
IHRvcCBieXRlIHNldCB0byBzb21ldGhpbmcgZWxzZSBvdGhlcgo+ID4gdGhhbiAweDAwKSBhcyBz
eXNjYWxsIGFyZ3VtZW50cy4KPiA+Cj4gPiBhbWRncHVfdHRtX3R0X2dldF91c2VyX3BhZ2VzKCkg
dXNlcyBwcm92aWRlZCB1c2VyIHBvaW50ZXJzIGZvciB2bWEKPiA+IGxvb2t1cHMsIHdoaWNoIGNh
biBvbmx5IGJ5IGRvbmUgd2l0aCB1bnRhZ2dlZCBwb2ludGVycy4gVGhpcyBwYXRjaAo+ID4gdW50
YWcgdXNlciBwb2ludGVycyB3aGVuIHRoZXkgYXJlIGJlaW5nIHNldCBpbgo+ID4gYW1kZ3B1X3R0
bV90dF9zZXRfdXNlcnB0cigpLgo+ID4KPiA+IEluIGFtZGdwdV9nZW1fdXNlcnB0cl9pb2N0bCgp
IGFuZCBhbWRncHVfYW1ka2ZkX2dwdXZtLmMvaW5pdF91c2VyX3BhZ2VzKCkKPiA+IGFuIE1NVSBu
b3RpZmllciBpcyBzZXQgdXAgd2l0aCBhICh0YWdnZWQpIHVzZXJzcGFjZSBwb2ludGVyLiBUaGUg
dW50YWdnZWQKPiA+IGFkZHJlc3Mgc2hvdWxkIGJlIHVzZWQgc28gdGhhdCBNTVUgbm90aWZpZXJz
IGZvciB0aGUgdW50YWdnZWQgYWRkcmVzcyBnZXQKPiA+IGNvcnJlY3RseSBtYXRjaGVkIHVwIHdp
dGggdGhlIHJpZ2h0IEJPLiBUaGlzIHBhdGNoIHVudGFnIHVzZXIgcG9pbnRlcnMgaW4KPiA+IGFt
ZGdwdV9nZW1fdXNlcnB0cl9pb2N0bCgpIGZvciB0aGUgR0VNIGNhc2UgYW5kIGluCj4gPiBhbWRn
cHVfYW1ka2ZkX2dwdXZtX2FsbG9jX21lbW9yeV9vZl9ncHUoKSBmb3IgdGhlIEtGRCBjYXNlLgo+
ID4KPiA+IFN1Z2dlc3RlZC1ieTogS3VlaGxpbmcsIEZlbGl4IDxGZWxpeC5LdWVobGluZ0BhbWQu
Y29tPgo+ID4gU2lnbmVkLW9mZi1ieTogQW5kcmV5IEtvbm92YWxvdiA8YW5kcmV5a252bEBnb29n
bGUuY29tPgo+ID4gLS0tCj4gPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9h
bWRrZmRfZ3B1dm0uYyB8IDIgKy0KPiA+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X2dlbS5jICAgICAgICAgIHwgMiArKwo+ID4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfdHRtLmMgICAgICAgICAgfCAyICstCj4gPiAgIDMgZmlsZXMgY2hhbmdlZCwgNCBp
bnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkX2dwdXZtLmMgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkX2dwdXZtLmMKPiA+IGluZGV4IDE5MjFkZWMzZGY3
YS4uMjBjYWM0NGVkNDQ5IDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X2FtZGtmZF9ncHV2bS5jCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfYW1ka2ZkX2dwdXZtLmMKPiA+IEBAIC0xMTIxLDcgKzExMjEsNyBAQCBpbnQg
YW1kZ3B1X2FtZGtmZF9ncHV2bV9hbGxvY19tZW1vcnlfb2ZfZ3B1KAo+ID4gICAgICAgICAgICAg
ICAgICBhbGxvY19mbGFncyA9IDA7Cj4gPiAgICAgICAgICAgICAgICAgIGlmICghb2Zmc2V0IHx8
ICEqb2Zmc2V0KQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOwo+
ID4gLSAgICAgICAgICAgICAgIHVzZXJfYWRkciA9ICpvZmZzZXQ7Cj4gPiArICAgICAgICAgICAg
ICAgdXNlcl9hZGRyID0gdW50YWdnZWRfYWRkcigqb2Zmc2V0KTsKPiA+ICAgICAgICAgIH0gZWxz
ZSBpZiAoZmxhZ3MgJiBBTExPQ19NRU1fRkxBR1NfRE9PUkJFTEwpIHsKPiA+ICAgICAgICAgICAg
ICAgICAgZG9tYWluID0gQU1ER1BVX0dFTV9ET01BSU5fR1RUOwo+ID4gICAgICAgICAgICAgICAg
ICBhbGxvY19kb21haW4gPSBBTURHUFVfR0VNX0RPTUFJTl9DUFU7Cj4gPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dlbS5jIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X2dlbS5jCj4gPiBpbmRleCBkMjFkZDJmMzY5ZGEuLjk4NWNiODJi
MmFhNiAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9n
ZW0uYwo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dlbS5jCj4g
PiBAQCAtMjg2LDYgKzI4Niw4IEBAIGludCBhbWRncHVfZ2VtX3VzZXJwdHJfaW9jdGwoc3RydWN0
IGRybV9kZXZpY2UgKmRldiwgdm9pZCAqZGF0YSwKPiA+ICAgICAgICAgIHVpbnQzMl90IGhhbmRs
ZTsKPiA+ICAgICAgICAgIGludCByOwo+ID4KPiA+ICsgICAgICAgYXJncy0+YWRkciA9IHVudGFn
Z2VkX2FkZHIoYXJncy0+YWRkcik7Cj4gPiArCj4gPiAgICAgICAgICBpZiAob2Zmc2V0X2luX3Bh
Z2UoYXJncy0+YWRkciB8IGFyZ3MtPnNpemUpKQo+ID4gICAgICAgICAgICAgICAgICByZXR1cm4g
LUVJTlZBTDsKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X3R0bS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5jCj4g
PiBpbmRleCA3M2U3MWU2MWRjOTkuLjFkMzBlOTdhYzJjNCAxMDA2NDQKPiA+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYwo+ID4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5jCj4gPiBAQCAtMTI0OCw3ICsxMjQ4LDcgQEAgaW50
IGFtZGdwdV90dG1fdHRfc2V0X3VzZXJwdHIoc3RydWN0IHR0bV90dCAqdHRtLCB1aW50NjRfdCBh
ZGRyLAo+ID4gICAgICAgICAgaWYgKGd0dCA9PSBOVUxMKQo+ID4gICAgICAgICAgICAgICAgICBy
ZXR1cm4gLUVJTlZBTDsKPiA+Cj4gPiAtICAgICAgIGd0dC0+dXNlcnB0ciA9IGFkZHI7Cj4gPiAr
ICAgICAgIGd0dC0+dXNlcnB0ciA9IHVudGFnZ2VkX2FkZHIoYWRkcik7Cj4KPiBEb2luZyB0aGlz
IGhlcmUgc2VlbXMgdW5uZWNlc3NhcnkuIFlvdSBhbHJlYWR5IHVudGFnZ2VkIHRoZSBhZGRyZXNz
IGluCj4gYm90aCBjYWxsZXJzIG9mIHRoaXMgZnVuY3Rpb24uIFVudGFnZ2luZyBpbiB0aGUgdHdv
IGNhbGxlcnMgZW5zdXJlcyB0aGF0Cj4gdGhlIHVzZXJwdHIgYW5kIE1NVSBub3RpZmllciBhcmUg
aW4gc3luYywgdXNpbmcgdGhlIHNhbWUgdW50YWdnZWQKPiBhZGRyZXNzLiBEb2luZyBpdCBhZ2Fp
biBoZXJlIGlzIHJlZHVuZGFudC4KCiBXaWxsIGZpeCBpbiB2MTUsIHRoYW5rcyEKCj4KPiBSZWdh
cmRzLAo+ICAgIEZlbGl4Cj4KPgo+ID4gICAgICAgICAgZ3R0LT51c2VyZmxhZ3MgPSBmbGFnczsK
PiA+Cj4gPiAgICAgICAgICBpZiAoZ3R0LT51c2VydGFzaykKPiA+IC0tCj4gPiAyLjIxLjAuNTkz
Lmc1MTFlYzM0NWUxOC1nb29nCj4gPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
