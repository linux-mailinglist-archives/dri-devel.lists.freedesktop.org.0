Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5309A7598F
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2019 23:28:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37A876E834;
	Thu, 25 Jul 2019 21:28:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D5F86E834
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2019 21:28:22 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
 [209.85.222.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C244422C97
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2019 21:28:21 +0000 (UTC)
Received: by mail-qk1-f179.google.com with SMTP id w190so37560315qkc.6
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2019 14:28:21 -0700 (PDT)
X-Gm-Message-State: APjAAAWhYu74k8NwCn+vnzaHtbManyGWdeCslslCF7SlsP0wHaAmRltg
 DXvW4gtbMEiMD+9jvOHDqjPsID5GAKJcS4rbxw==
X-Google-Smtp-Source: APXvYqz0a5bZuuNWqK9Zbzh5EQg0tuu4E2ZUYUDzxepTDEWCBdQC0fcPx8zlxKYmZv62FD3tpJ1dATm1XMCrbmBx/Q0=
X-Received: by 2002:a05:620a:1447:: with SMTP id
 i7mr61100099qkl.254.1564090100912; 
 Thu, 25 Jul 2019 14:28:20 -0700 (PDT)
MIME-Version: 1.0
References: <20190725011003.30837-1-robh@kernel.org>
 <20190725011003.30837-7-robh@kernel.org>
 <ab9c3277-9e34-2712-975b-7c59b64e52d0@arm.com>
 <9eaf879c-bd7b-aded-e8f6-8efc2394fef5@arm.com>
In-Reply-To: <9eaf879c-bd7b-aded-e8f6-8efc2394fef5@arm.com>
From: Rob Herring <robh@kernel.org>
Date: Thu, 25 Jul 2019 15:28:09 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+C1wLYg8_OWL9vUWU2HRcMUuHcL53MjbUAm0fXcO9Mkg@mail.gmail.com>
Message-ID: <CAL_Jsq+C1wLYg8_OWL9vUWU2HRcMUuHcL53MjbUAm0fXcO9Mkg@mail.gmail.com>
Subject: Re: [PATCH v2 6/7] drm/panfrost: Add support for GPU heap allocations
To: Steven Price <steven.price@arm.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1564090101;
 bh=TET78VrHD5fBazipSqZrmLQCJxh29B1dvoBSWZaE7lk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=VnHINwAI2O0fcIDpXC5cBuJcAFixCwdEsl75wgadIU5rIRyyeBEX6jHMnmQ7TM+vm
 0T6TCVd4/hP1v0JOwQuUqIfxgizySrYQuJyffeLk/xTNvyfOuzcZn2KNucQNbAoskn
 wnOvBGQiRIKADChYa98pfPCXyhbOVCEOrv7f9btA=
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Robin Murphy <robin.murphy@arm.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdWwgMjUsIDIwMTkgYXQgOTozNSBBTSBTdGV2ZW4gUHJpY2UgPHN0ZXZlbi5wcmlj
ZUBhcm0uY29tPiB3cm90ZToKPgo+IE9uIDI1LzA3LzIwMTkgMTU6NTksIFN0ZXZlbiBQcmljZSB3
cm90ZToKPiBbLi4uXQo+ID4gSXQgd291bGQgYXBwZWFyIHRoYXQgaW4gdGhlIGZvbGxvd2luZyBj
YWxsIHNndD09TlVMTDoKPiA+PiAgICAgIHJldCA9IHNnX2FsbG9jX3RhYmxlX2Zyb21fcGFnZXMo
c2d0LCBwYWdlcyArIHBhZ2Vfb2Zmc2V0LAo+ID4+ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBOVU1fRkFVTFRfUEFHRVMsIDAsIFNaXzJNLCBHRlBfS0VSTkVMKTsKPiA+Cj4g
PiBXaGljaCBtZWFucyB3ZSd2ZSBlbmRlZCB1cCB3aXRoIGEgQk8gd2l0aCBiby0+c2d0PT1OVUxM
LCBiby0+cGFnZXMgc2V0Cj4gPiBhbmQgYm8tPmlzX2hlYXA9dHJ1ZS4gTXkgdW5kZXJzdGFuZGlu
ZyBpcyB0aGlzIHNob3VsZCBiZSBpbXBvc3NpYmxlLgo+ID4KPiA+IEkgaGF2ZW4ndCB5ZXQgZmln
dXJlZCBvdXQgaG93IHRoaXMgaGFwcGVucyAtIGl0IHNlZW1zIHRvIGJlIGp1c3QgYmVmb3JlCj4g
PiB0ZXJtaW5hdGlvbiwgc28gaXQgbWlnaHQgYmUgYSByYWNlIHdpdGggY2xlYW51cD8KPgo+IFRo
YXQgd2FzIGEgcmVkIGhlcnJpbmcgLSBpdCdzIHBhcnRseSBteSB0ZXN0IGNhc2UgZG9pbmcgc29t
ZXRoaW5nIGEgYml0Cj4gd2VpcmQuIFRoaXMgY3Jhc2ggaXMgY2F1c2VkIGJ5IGRvaW5nIGFuIG1t
YXAgb2YgYSBIRUFQIG9iamVjdCBiZWZvcmUgYW55Cj4gZmF1bHQgaGFzIG9jY3VycmVkLgoKTXkg
YnJvdGhlciBSZWQgaXMgYWx3YXlzIGNhdXNpbmcgcHJvYmxlbXMuIDspCgpCdXQgeW91IHdlcmUg
cmlnaHQgdGhhdCBJIG5lZWQgdG8ga2ZyZWUgYm8tPnNndHMuIEFkZGl0aW9uYWxseSwgSSBhbHNv
Cm5lZWQgdG8gY2FsbCBzZ19mcmVlX3RhYmxlIG9uIGVhY2ggdGFibGUuCgo+IGRybV9nZW1fc2ht
ZW1fbW1hcCgpIGNhbGxzIGRybV9nZW1fc2htZW1fZ2V0X3BhZ2VzKCkgd2hpY2ggd2lsbCBwb3B1
bGF0ZQo+IGJvLT5iYXNlLnBhZ2VzIChldmVuIGlmIGJvLT5pc19oZWFwKS4KPgo+IEVpdGhlciB3
ZSBzaG91bGQgcHJldmVudCBtYXBwaW5nIG9mIEhFQVAgb2JqZWN0cywgb3IgYWx0ZXJuYXRpdmVs
eQo+IGJvLT5iYXNlLnBhZ2VzIGNvdWxkIGJlIGFsbG9jYXRlZCB1cGZyb250IGluc3RlYWQgb2Yg
ZHVyaW5nIHRoZSBmaXJzdAo+IGZhdWx0LiBNeSBwcmVmZXJlbmNlIHdvdWxkIGJlIGFsbG9jYXRp
bmcgaXQgdXBmcm9udCBiZWNhdXNlIG9wdGltaXNpbmcKPiBmb3IgdGhlIGNhc2Ugb2YgYSBIRUFQ
IEJPIHdoaWNoIGlzbid0IHVzZWQgc2VlbXMgYSBiaXQgd2VpcmQuIEFsdGhvdWdoCj4gdGhlcmUn
cyBzdGlsbCB0aGUgcXVlc3Rpb24gb2YgZXhhY3RseSB3aGF0IHRoZSBiZWhhdmlvdXIgc2hvdWxk
IGJlIG9mCj4gYWNjZXNzaW5nIHRocm91Z2ggdGhlIENQVSBwYWdlcyB3aGljaCBoYXZlbid0IGJl
ZW4gYWxsb2NhdGVkIHlldC4KPgo+IEFsc28gc2htZW0tPnBhZ2VzX3VzZV9jb3VudCBuZWVkcyBp
bmNyZW1lbnRpbmcgdG8gc3RvcAo+IGRybV9nZW1fc2htZW1fZ2V0X3BhZ2VzKCkgcmVwbGFjaW5n
IGJvLT5iYXNlLnBhZ2VzLiBJIGhhdmVuJ3QgdGVzdGVkCj4gd2hhdCBoYXBwZW5zIGlmIHlvdSBt
bWFwICphZnRlciogdGhlIGZpcnN0IGZhdWx0LgoKSSBkaWQgc2F5IG1tYXAgaGFkIHVuZGVmaW5l
ZC91bmtub3duIGJlaGF2aW9yLgoKUm9iCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
