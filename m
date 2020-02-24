Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7352D16B112
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2020 21:43:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA73F6E963;
	Mon, 24 Feb 2020 20:43:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com
 [IPv6:2607:f8b0:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DFAD6E963
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2020 20:43:24 +0000 (UTC)
Received: by mail-oi1-x242.google.com with SMTP id 18so7332095oij.6
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2020 12:43:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=dNetdq6yTza1V7Q0eE3ppDLEJHpPKyhs8ej65X2kQI4=;
 b=EW8mIdCvXzMKGdX9wxpcC6QsE6B4CVxB27tKVe1hri56wUmplZ0SFT3pMOj7IrLO4m
 3C4gwG7PtVzQPV9fsLdjKES2SNUYrXH2ot4jbZBQKedfuEqg/FIYkb+WV0ADdeMAiLlL
 5nO4XeACZzay+BRMtcB5OG1KwNYYdYb2EzsSg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=dNetdq6yTza1V7Q0eE3ppDLEJHpPKyhs8ej65X2kQI4=;
 b=S6mpbpcbgNTQZcPR3wsvSx1DLqXZxV6675ijuJt3Pt6QMxlwcv4FXPKYjeHORqyikW
 sarh9YYPTL2VQO04nsw176o+nKO5mlyBBabd4/ZSc4rBxTVTlqVqex1qcmBExGe/yReO
 tVCioAFG/Bx54q1bZEcOIRmNRuAcADVbVV1oZ797VUtjYABm6MnUEoYe7gE2FItI2OHg
 y/4rWnPUYCkDS5YNSuDTlkmql5Akk5Kr/nPUgS3JTTgAmzOBBoXN+DxQPzvIUDaZ3+GQ
 pSL+53xVFj6mlFbIO5jSgOGLC18tDMTntsOpTGqzgHHu2Us3MfsIS40yhdcWMRrsnuqS
 VlNg==
X-Gm-Message-State: APjAAAUURrkVeDHQCOkTfHudkFx9ZSE49jzR5YAtbedJgwzTeD1cuWfK
 uoL/m+kfgkFAbhaBwUzCFnhCelij6q0sQO6vQshISA==
X-Google-Smtp-Source: APXvYqxFLKO3vD/YMuDX3/DypS+o8h8XjOYor9SniNsUJOkgIEM4zwI7M687yHymATPRXiQ0Et4omueinpPxfMFeIQ0=
X-Received: by 2002:aca:2407:: with SMTP id n7mr761697oic.14.1582577003915;
 Mon, 24 Feb 2020 12:43:23 -0800 (PST)
MIME-Version: 1.0
References: <20200222175433.2259158-1-daniel.vetter@ffwll.ch>
 <CADnq5_PLJgZGb+9mhw_06oxRXiYsfRuO3PiRHCBLmNYtV4Q64Q@mail.gmail.com>
In-Reply-To: <CADnq5_PLJgZGb+9mhw_06oxRXiYsfRuO3PiRHCBLmNYtV4Q64Q@mail.gmail.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Mon, 24 Feb 2020 21:43:12 +0100
Message-ID: <CAKMK7uH+Zh5MJc+b0omaGvqjhYjDVxq91fx9uRbYsrRBw+jeww@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm/amdgpu: Drop DRIVER_USE_AGP
To: Alex Deucher <alexdeucher@gmail.com>
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: Xiaojie Yuan <xiaojie.yuan@amd.com>,
 =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <marek.olsak@amd.com>,
 "Tianci.Yin" <tianci.yin@amd.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Hans de Goede <hdegoede@redhat.com>, Alex Deucher <alexander.deucher@amd.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Evan Quan <evan.quan@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBGZWIgMjQsIDIwMjAgYXQgNToxMCBQTSBBbGV4IERldWNoZXIgPGFsZXhkZXVjaGVy
QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBPbiBTYXQsIEZlYiAyMiwgMjAyMCBhdCAxMjo1NCBQTSBE
YW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPiB3cm90ZToKPiA+Cj4gPiBUaGlz
IGRvZXNuJ3QgZG8gYW55dGhpbmcgZXhjZXB0IGF1dG8taW5pdCBkcm1fYWdwIHN1cHBvcnQgd2hl
biB5b3UKPiA+IGNhbGwgZHJtX2dldF9wY2lfZGV2KCkuIFdoaWNoIGFtZGdwdSBzdG9wcGVkIGRv
aW5nIHdpdGgKPiA+Cj4gPiBjb21taXQgYjU4YzExMzE0YTE3MDZiZjA5NGM0ODllZjVjYjI4Zjc2
NDc4YzcwNAo+ID4gQXV0aG9yOiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5j
b20+Cj4gPiBEYXRlOiAgIEZyaSBKdW4gMiAxNzoxNjozMSAyMDE3IC0wNDAwCj4gPgo+ID4gICAg
IGRybS9hbWRncHU6IGRyb3AgZGVwcmVjYXRlZCBkcm1fZ2V0X3BjaV9kZXYgYW5kIGRybV9wdXRf
ZGV2Cj4gPgo+ID4gTm8gaWRlYSB3aGV0aGVyIHRoaXMgd2FzIGludGVudGlvbmFsIG9yIGFjY2lk
ZW50YWwgYnJlYWthZ2UsIGJ1dCBJCj4gPiBndWVzcyBhbnlvbmUgd2hvIG1hbmFnZXMgdG8gYm9v
dCBhIHRoaXMgbW9kZXJuIGdwdSBiZWhpbmQgYW4gYWdwCj4gPiBicmlkZ2UgZGVzZXJ2ZXMgYSBw
cmljZS4gQSBwcmljZSBJIG5ldmVyIGV4cGVjdCBhbnlvbmUgdG8gZXZlciBjb2xsZWN0Cj4gPiA6
LSkKPiA+Cj4gPiBDYzogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgo+
ID4gQ2M6ICJDaHJpc3RpYW4gS8O2bmlnIiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgo+ID4g
Q2M6IEhhd2tpbmcgWmhhbmcgPEhhd2tpbmcuWmhhbmdAYW1kLmNvbT4KPiA+IENjOiBYaWFvamll
IFl1YW4gPHhpYW9qaWUueXVhbkBhbWQuY29tPgo+ID4gQ2M6IEV2YW4gUXVhbiA8ZXZhbi5xdWFu
QGFtZC5jb20+Cj4gPiBDYzogIlRpYW5jaS5ZaW4iIDx0aWFuY2kueWluQGFtZC5jb20+Cj4gPiBD
YzogIk1hcmVrIE9sxaHDoWsiIDxtYXJlay5vbHNha0BhbWQuY29tPgo+ID4gQ2M6IEhhbnMgZGUg
R29lZGUgPGhkZWdvZWRlQHJlZGhhdC5jb20+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgVmV0
dGVyIDxkYW5pZWwudmV0dGVyQGludGVsLmNvbT4KPgo+IFNlcmllcyBpczoKPiBSZXZpZXdlZC1i
eTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgo+IEknbSBoYXBweSB0
byB0YWtlIHRoZSBwYXRjaGVzIHRocm91Z2ggbXkgdHJlZSBvciBkcm0tbWlzYy4KCkkgZG9uJ3Qg
aGF2ZSBhbnl0aGluZyBidWlsZGluZyBvbiB0b3Agb2YgdGhpcywganVzdCByYW5kb20gdGhpbmdz
IGZyb20KbXkgdHJlZS4gUmVhc29uIEkgc2VudCBpdCBvdXQgaXMgTGF1cmVudCdzIHNlcmllcyB0
byBtYWtlIGEgY29uc3QKZHJtX2RyaXZlciBwb3NzaWJsZSwgYnV0IEkgZG9uJ3QgdGhpbmsgdGhl
eSdsbCBjb25mbGljdC4gU28gYW1kIHRyZWVzCmZvciB0aGUgc2VyaWVzIGlzIHBlcmZlY3RseSBm
aW5lIGFuZCBwcm9iYWJseSBzaW1wbGVzdC4KLURhbmllbAoKPgo+IEFsZXgKPgo+Cj4gPiAtLS0K
PiA+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMgfCAyICstCj4gPiAg
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gPgo+ID4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYuYyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYuYwo+ID4gaW5kZXggNDU5ODgzNmM1ZmE0
Li42Y2VhOTIwMTcxMDkgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfZHJ2LmMKPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9kcnYuYwo+ID4gQEAgLTEzNzksNyArMTM3OSw3IEBAIGludCBhbWRncHVfZmlsZV90b19mcHJp
dihzdHJ1Y3QgZmlsZSAqZmlscCwgc3RydWN0IGFtZGdwdV9mcHJpdiAqKmZwcml2KQo+ID4KPiA+
ICBzdGF0aWMgc3RydWN0IGRybV9kcml2ZXIga21zX2RyaXZlciA9IHsKPiA+ICAgICAgICAgLmRy
aXZlcl9mZWF0dXJlcyA9Cj4gPiAtICAgICAgICAgICBEUklWRVJfVVNFX0FHUCB8IERSSVZFUl9B
VE9NSUMgfAo+ID4gKyAgICAgICAgICAgRFJJVkVSX0FUT01JQyB8Cj4gPiAgICAgICAgICAgICBE
UklWRVJfR0VNIHwKPiA+ICAgICAgICAgICAgIERSSVZFUl9SRU5ERVIgfCBEUklWRVJfTU9ERVNF
VCB8IERSSVZFUl9TWU5DT0JKIHwKPiA+ICAgICAgICAgICAgIERSSVZFUl9TWU5DT0JKX1RJTUVM
SU5FLAo+ID4gLS0KPiA+IDIuMjQuMQo+ID4KPiA+IF9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCj4gPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gPiBkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAoKCgotLSAKRGFuaWVsIFZldHRlcgpTb2Z0
d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KKzQxICgwKSA3OSAzNjUgNTcgNDggLSBo
dHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWwK
