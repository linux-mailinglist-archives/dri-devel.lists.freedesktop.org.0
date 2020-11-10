Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 30A842AE41C
	for <lists+dri-devel@lfdr.de>; Wed, 11 Nov 2020 00:32:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5DF689CE1;
	Tue, 10 Nov 2020 23:32:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FCA989CE1;
 Tue, 10 Nov 2020 23:32:45 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id o15so322249wru.6;
 Tue, 10 Nov 2020 15:32:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=G2LNzsbApo8M0xKgAstakRoXzap3k+FbU2qW0LU5sPI=;
 b=tQxnrN0q6Q/syhhHoDsN9FyMEvILP+4QqoyWhcoxi/jMtiFuoIFplJNIlXU6BXd6YV
 CzXI2zJSVF7XI141i8F1UWr3DaraAD/WVGvwJx5pRhdSXLn2he6kJS0k0HiJnzpwlt3+
 Ag6CdaVrcF9GYB6qjHD5gNZIAdoO5rxnnTdF1GuF7t91672+G//dv50KhlpGDhs/1r1g
 /ns5+uwLmFHakfUhZSzCXo+9Ht3crBXAz9pMjVzadeqd9LXgZwV6/t59Jk2tw1t01kVh
 H8lyFo/MS7d5kqNyzBzG6y3wnSpAQmoltKkwuxbZpCOTkXB8Y8kT2fItwOapVDdeN48V
 aEEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=G2LNzsbApo8M0xKgAstakRoXzap3k+FbU2qW0LU5sPI=;
 b=h6yaTQ90wk2SsTZldvjA5rAxd24c2fHQzEOSbxNijMBZxZYNtKFhO88YuspjicEGo8
 9HLOBCPnXat6yvO/A7ACzQIWwASXMXo0oXQsdJBHEOpuJQ/w5SzDeFTWcTFTxLmeW7nE
 jItGaaaw541PfuvGzWFywR3q4lztwmj5BVqZcVmmgasIdUHAnpbBItTuZ3sB1Dcx3hxQ
 twtLnijnVs/RXCyQdn0w8uBqW0MJP5ITQxUEQiyrc4V1U7PPd6BcWnBane8o0SyFAsxG
 46ZbZ6iAOBlH93BFynqcgFqnO+Kd0ENIR3ZR7zb9va9TOFDcLjvWQePBN4FT+Tm0HIZ+
 4Raw==
X-Gm-Message-State: AOAM531Wh4mg3DOt/QO37QuFLcaywbMWjFoOQxxeh3czNRWNbSKiRHMy
 7O65fs0LCp9FPswtrq5nCApsZWX1MNgO6psm85g=
X-Google-Smtp-Source: ABdhPJwBhuwfCBjZ2GW4NzKxgbF5f5GHB8cCuow49g3N137G7vUt28YS1cjus/0GCFCS8Hne/xKkCUuWC6JHawJQv/E=
X-Received: by 2002:adf:f246:: with SMTP id b6mr26147827wrp.111.1605051164306; 
 Tue, 10 Nov 2020 15:32:44 -0800 (PST)
MIME-Version: 1.0
References: <20201110193112.988999-1-lee.jones@linaro.org>
 <20201110193112.988999-4-lee.jones@linaro.org>
In-Reply-To: <20201110193112.988999-4-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 10 Nov 2020 18:32:31 -0500
Message-ID: <CADnq5_N18U4GdWbJALbJwKTXcmvqE8_hE2FpzYNT7O2zigCVbw@mail.gmail.com>
Subject: Re: [PATCH 03/30] drm/radeon/ni: Demote vague attempt at function
 header doc
To: Lee Jones <lee.jones@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBOb3YgMTAsIDIwMjAgYXQgMjozMSBQTSBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5h
cm8ub3JnPiB3cm90ZToKPgo+IEZpeGVzIHRoZSBmb2xsb3dpbmcgVz0xIGtlcm5lbCBidWlsZCB3
YXJuaW5nKHMpOgo+Cj4gIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vbmkuYzogSW4gZnVuY3Rpb24g
4oCYY2F5bWFuX2dwdV9pbml04oCZOgo+ICBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL25pLmM6MjY3
OTogd2FybmluZzogRnVuY3Rpb24gcGFyYW1ldGVyIG9yIG1lbWJlciAncmluZycgbm90IGRlc2Ny
aWJlZCBpbiAnY2F5bWFuX3ZtX2ZsdXNoJwo+ICBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL25pLmM6
MjY3OTogd2FybmluZzogRnVuY3Rpb24gcGFyYW1ldGVyIG9yIG1lbWJlciAndm1faWQnIG5vdCBk
ZXNjcmliZWQgaW4gJ2NheW1hbl92bV9mbHVzaCcKPiAgZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9u
aS5jOjI2Nzk6IHdhcm5pbmc6IEZ1bmN0aW9uIHBhcmFtZXRlciBvciBtZW1iZXIgJ3BkX2FkZHIn
IG5vdCBkZXNjcmliZWQgaW4gJ2NheW1hbl92bV9mbHVzaCcKPgo+IENjOiBBbGV4IERldWNoZXIg
PGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Cj4gQ2M6ICJDaHJpc3RpYW4gS8O2bmlnIiA8Y2hy
aXN0aWFuLmtvZW5pZ0BhbWQuY29tPgo+IENjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXgu
aWU+Cj4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KPiBDYzogYW1kLWdmeEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKPiBDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
Zwo+IFNpZ25lZC1vZmYtYnk6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+CgpBcHBs
aWVkLiAgVGhhbmtzIQoKQWxleAoKPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9uaS5j
IHwgNCArLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMyBkZWxldGlvbnMo
LSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL25pLmMgYi9kcml2ZXJz
L2dwdS9kcm0vcmFkZW9uL25pLmMKPiBpbmRleCA1M2E0ZDVjMTA5Nzk0Li4xMmRkMDgyMDY5NjQ5
IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vbmkuYwo+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS9yYWRlb24vbmkuYwo+IEBAIC0yNjY4LDExICsyNjY4LDkgQEAgdm9pZCBjYXlt
YW5fdm1fZGVjb2RlX2ZhdWx0KHN0cnVjdCByYWRlb25fZGV2aWNlICpyZGV2LAo+ICAgICAgICAg
ICAgICAgIGJsb2NrLCBtY19pZCk7Cj4gIH0KPgo+IC0vKioKPiArLyoKPiAgICogY2F5bWFuX3Zt
X2ZsdXNoIC0gdm0gZmx1c2ggdXNpbmcgdGhlIENQCj4gICAqCj4gLSAqIEByZGV2OiByYWRlb25f
ZGV2aWNlIHBvaW50ZXIKPiAtICoKPiAgICogVXBkYXRlIHRoZSBwYWdlIHRhYmxlIGJhc2UgYW5k
IGZsdXNoIHRoZSBWTSBUTEIKPiAgICogdXNpbmcgdGhlIENQIChjYXltYW4tc2kpLgo+ICAgKi8K
PiAtLQo+IDIuMjUuMQo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bAo=
