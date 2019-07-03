Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34BDA5E164
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2019 11:51:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1D6A89A0F;
	Wed,  3 Jul 2019 09:51:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E770D89A0F
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jul 2019 09:51:00 +0000 (UTC)
Received: by mail-ot1-x343.google.com with SMTP id b7so1665978otl.11
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Jul 2019 02:51:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=H/ehYv/2ak3jZJnHyYTFa/b/nUib6ujuNN4I7eaf8Lw=;
 b=Xtm6yr63ePlwqR5S9He/KcEBzzNBZiLiAxdqYYj6VkOK8/JOAASjxTS/+VbAZbikgA
 xHrPlt48Feka1vB1RV9paxENrbacSflS821IQxB+LFreDoPmu/re38oMZnoom9VBp/WQ
 1a0vJBaG1Caje2KZNkqKY+JdnueCKjxHXg8qYX7hRZTnYWqin2qQKd0Jl+rx+4k7ElBX
 3Rb+DHS5kgUL/4busxLGbd4c8xx4R5wBaM0RkjHAySzN/b5yCipFwxKCvCA6EuNZ2ktH
 BSKKODPtNdKKUjRMgb2icrHw4NWyiQdhkRwRvKNCMUB6Jzh7f1CDfhoiX3U3XXNwO0DE
 9hlg==
X-Gm-Message-State: APjAAAU1RBj3JrPtLUpgtyD2HgOEtZwdGI2ImOCE7kG6tFAFVYvhxwVf
 glsleMzT+O7EL1sw1Vb/jg4FgA1To3xh6SeRq4VA1w==
X-Google-Smtp-Source: APXvYqx/azz/6Vc4WD1pKgY9UXBiehUSQbpKmzO3HsJXJ5Ws2WYqFWnzzr3U7FZPfAcAkjcQu+T8npPeRaqHBsN5fAs=
X-Received: by 2002:a05:6830:4b:: with SMTP id
 d11mr647832otp.106.1562147460149; 
 Wed, 03 Jul 2019 02:51:00 -0700 (PDT)
MIME-Version: 1.0
References: <20190703081842.22872-1-nishkadg.linux@gmail.com>
 <20190703083745.GB8996@kroah.com>
In-Reply-To: <20190703083745.GB8996@kroah.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 3 Jul 2019 11:50:47 +0200
Message-ID: <CAKMK7uFAaw3sL_A6gGOeot80fvukjZqprLptLER=riA1_p4zWw@mail.gmail.com>
Subject: Re: [PATCH 1/2] staging: android: ion: Remove file ion_carveout_heap.c
To: Greg KH <gregkh@linuxfoundation.org>, John Stultz <john.stultz@linaro.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=H/ehYv/2ak3jZJnHyYTFa/b/nUib6ujuNN4I7eaf8Lw=;
 b=Mspe3R7ndQayw/OzAHGs/yhWSgavQvgdkmhe15W+QpZAxWl/g99R0+s+bqgIIj6dhx
 S9abrXSCiAA0nPYg2YDcdyfoUMTu8dve/YVN+4Eoa/gOptBpf7dRqiJP0/4RUfmcxy/f
 Ws00+12FUG2EJmbJ/kPjfazOq1vpIMlCveVJo=
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
Cc: driverdevel <devel@driverdev.osuosl.org>, Todd Kjos <tkjos@android.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>,
 Nishka Dasgupta <nishkadg.linux@gmail.com>, joel@joelfernandes.org,
 maco@android.com, christian@brauner.io
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdWwgMywgMjAxOSBhdCAxMDozNyBBTSBHcmVnIEtIIDxncmVna2hAbGludXhmb3Vu
ZGF0aW9uLm9yZz4gd3JvdGU6Cj4KPiBPbiBXZWQsIEp1bCAwMywgMjAxOSBhdCAwMTo0ODo0MVBN
ICswNTMwLCBOaXNoa2EgRGFzZ3VwdGEgd3JvdGU6Cj4gPiBSZW1vdmUgZmlsZSBpb25fY2FydmVv
dXRfaGVhcC5jIGFzIGl0cyBmdW5jdGlvbnMgYW5kIGRlZmluaXRpb25zIGFyZSBub3QKPiA+IHVz
ZWQgYW55d2hlcmUuCj4gPiBJc3N1ZSBmb3VuZCB3aXRoIENvY2NpbmVsbGUuCj4gPgo+ID4gU2ln
bmVkLW9mZi1ieTogTmlzaGthIERhc2d1cHRhIDxuaXNoa2FkZy5saW51eEBnbWFpbC5jb20+Cj4g
PiAtLS0KPiA+ICBkcml2ZXJzL3N0YWdpbmcvYW5kcm9pZC9pb24vS2NvbmZpZyAgICAgICAgICAg
fCAgIDkgLS0KPiA+ICBkcml2ZXJzL3N0YWdpbmcvYW5kcm9pZC9pb24vTWFrZWZpbGUgICAgICAg
ICAgfCAgIDEgLQo+ID4gIC4uLi9zdGFnaW5nL2FuZHJvaWQvaW9uL2lvbl9jYXJ2ZW91dF9oZWFw
LmMgICB8IDEzMyAtLS0tLS0tLS0tLS0tLS0tLS0KPgo+IEkga2VlcCB0cnlpbmcgdG8gZG8gdGhp
cywgYnV0IG90aGVycyBwb2ludCBvdXQgdGhhdCB0aGUgaW9uIGNvZGUgaXMKPiAiZ29pbmcgdG8g
YmUgZml4ZWQgdXAgc29vbiIgYW5kIHRoYXQgcGVvcGxlIHJlbHkgb24gdGhpcyBpbnRlcmZhY2Ug
bm93Lgo+IFdlbGwsICJjb2RlIG91dHNpZGUgb2YgdGhlIGtlcm5lbCB0cmVlIiByZWxpZXMgb24g
dGhpcywgd2hpY2ggaXMgbm90IG9rLAo+IGJ1dCB0aGUgInNvb24iIHBlb3BsZSBrZWVwIGluc2lz
dGluZyBvbiBpdC4uLgo+Cj4gT2RkcyBhcmUgSSBzaG91bGQganVzdCBkZWxldGUgYWxsIG9mIElP
TiwgYXMgdGhlcmUgaGFzbid0IGJlZW4gYW55Cj4gZm9yd2FyZCBwcm9ncmVzcyBvbiBpdCBpbiBh
IGxvbmcgdGltZS4KPgo+IEhvcGVmdWxseSB0aGF0IHdha2VzIHNvbWUgcGVvcGxlIHVwLi4uCgpK
b2huIFN0dWx0eiBoYXMgZG9uZSBhIHN0ZWFkeSBzdHJlYW0gb24gaW9uIGRlc3RhZ2luZyBwYXRj
aCBzZXJpZXMKcGFzdCBmZXcgbW9udGhzLCB1bmQgdGhlIGhlYWRpbmcgb2YgIkRNQS1CVUYgSGVh
cHMiLCB0YXJnZXRpbmcKZHJpdmVycy9kbWEtYnVmLiBJJ20gbm90IGZvbGxvd2luZyB0aGUgZGV0
YWlscywgYW5kIGl0IHNlZW1zIGEgYml0IGEKY3Jhd2wsIGJ1dCB0aGVyZSdzIGRlZmluaXRlbHkg
d29yayBnb2luZyBvbiAuLi4gSnVzdCBwcm9iYWJseSBub3QKaW4tcGxhY2UgaW4gc3RhZ2luZyBJ
IHRoaW5rLgotRGFuaWVsCgo+Cj4gdGhhbmtzLAo+Cj4gZ3JlZyBrLWgKPiBfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKCgoKLS0KRGFuaWVsIFZldHRl
cgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KKzQxICgwKSA3OSAzNjUgNTcg
NDggLSBodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
