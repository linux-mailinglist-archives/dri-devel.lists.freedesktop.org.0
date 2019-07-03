Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B17F25DFFB
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2019 10:37:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 919576E0EF;
	Wed,  3 Jul 2019 08:37:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 925036E0EF
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jul 2019 08:37:48 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4D375218A0;
 Wed,  3 Jul 2019 08:37:47 +0000 (UTC)
Date: Wed, 3 Jul 2019 10:37:45 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Nishka Dasgupta <nishkadg.linux@gmail.com>
Subject: Re: [PATCH 1/2] staging: android: ion: Remove file ion_carveout_heap.c
Message-ID: <20190703083745.GB8996@kroah.com>
References: <20190703081842.22872-1-nishkadg.linux@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190703081842.22872-1-nishkadg.linux@gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1562143067;
 bh=qK6ghgk93FG01mdywSmNV6VqIZ8zgDPRk8dvP6i0gdY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CU1WoWdJjPLOIw967/h60TJQTKyKAV/N5RZSw2TX7OUvOAZvJhFj1/cDdNlGR3chb
 6CkNHPJmkj7h0CMSMDtQmFayoNJSPmUp0KvgBTckiiqwnt3ma0rHVco+uaIw+vAbDD
 du37tw+e0rFTPmtqknvlsxk3+muYuOlYZ6Z2AAZ8=
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
Cc: devel@driverdev.osuosl.org, tkjos@android.com,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 arve@android.com, joel@joelfernandes.org, maco@android.com,
 christian@brauner.io
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdWwgMDMsIDIwMTkgYXQgMDE6NDg6NDFQTSArMDUzMCwgTmlzaGthIERhc2d1cHRh
IHdyb3RlOgo+IFJlbW92ZSBmaWxlIGlvbl9jYXJ2ZW91dF9oZWFwLmMgYXMgaXRzIGZ1bmN0aW9u
cyBhbmQgZGVmaW5pdGlvbnMgYXJlIG5vdAo+IHVzZWQgYW55d2hlcmUuCj4gSXNzdWUgZm91bmQg
d2l0aCBDb2NjaW5lbGxlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IE5pc2hrYSBEYXNndXB0YSA8bmlz
aGthZGcubGludXhAZ21haWwuY29tPgo+IC0tLQo+ICBkcml2ZXJzL3N0YWdpbmcvYW5kcm9pZC9p
b24vS2NvbmZpZyAgICAgICAgICAgfCAgIDkgLS0KPiAgZHJpdmVycy9zdGFnaW5nL2FuZHJvaWQv
aW9uL01ha2VmaWxlICAgICAgICAgIHwgICAxIC0KPiAgLi4uL3N0YWdpbmcvYW5kcm9pZC9pb24v
aW9uX2NhcnZlb3V0X2hlYXAuYyAgIHwgMTMzIC0tLS0tLS0tLS0tLS0tLS0tLQoKSSBrZWVwIHRy
eWluZyB0byBkbyB0aGlzLCBidXQgb3RoZXJzIHBvaW50IG91dCB0aGF0IHRoZSBpb24gY29kZSBp
cwoiZ29pbmcgdG8gYmUgZml4ZWQgdXAgc29vbiIgYW5kIHRoYXQgcGVvcGxlIHJlbHkgb24gdGhp
cyBpbnRlcmZhY2Ugbm93LgpXZWxsLCAiY29kZSBvdXRzaWRlIG9mIHRoZSBrZXJuZWwgdHJlZSIg
cmVsaWVzIG9uIHRoaXMsIHdoaWNoIGlzIG5vdCBvaywKYnV0IHRoZSAic29vbiIgcGVvcGxlIGtl
ZXAgaW5zaXN0aW5nIG9uIGl0Li4uCgpPZGRzIGFyZSBJIHNob3VsZCBqdXN0IGRlbGV0ZSBhbGwg
b2YgSU9OLCBhcyB0aGVyZSBoYXNuJ3QgYmVlbiBhbnkKZm9yd2FyZCBwcm9ncmVzcyBvbiBpdCBp
biBhIGxvbmcgdGltZS4KCkhvcGVmdWxseSB0aGF0IHdha2VzIHNvbWUgcGVvcGxlIHVwLi4uCgp0
aGFua3MsCgpncmVnIGstaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
