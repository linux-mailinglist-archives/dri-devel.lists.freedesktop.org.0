Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D361E7EAE
	for <lists+dri-devel@lfdr.de>; Fri, 29 May 2020 15:29:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E9EB6E8F2;
	Fri, 29 May 2020 13:29:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 662176E8F2
 for <dri-devel@lists.freedesktop.org>; Fri, 29 May 2020 13:29:07 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id r9so3275333wmh.2
 for <dri-devel@lists.freedesktop.org>; Fri, 29 May 2020 06:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=wQoq021/Gp+q8H0I8EHmEoZWy7s44vHior8hBCelUbk=;
 b=q2o5AxLGZS/7ugHOLM3ni0EWbUPYN+KkW7wsxuO8lYVGOhHniKsLF3egF8rTnp98HA
 3RXJ2Vzx4cAKbdL9HKoMD8PXCYkn/PAm2ICOhQB/xZidlyTTRVczlfEfOq8kFz5gYoj0
 LxQMdSyD+b6pPsyhMNf2uTFZNVh1M2D2dVEoTPoLa5TQIuH/7D40GoIUIH0siyAPJXyh
 Pns8UYUdDdYEiuCibjcnVb4KQ10UeIJHsWjcUwuIiwOqXcYlz3Zu4Nl1B2KItzn3fKS7
 HS02EPW250OJmi0cHl9uK1dw0oBzfJy7Wc+dBXmj/48lEkAYFI2PvjmauOcFkDmte5Z+
 b+jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=wQoq021/Gp+q8H0I8EHmEoZWy7s44vHior8hBCelUbk=;
 b=Nc94kDr9q5/5cwiL2qGgQw+gqM+i1ZYAuKME9Mk8OxaqXFHjFwg33JTHnHtjdPfl9g
 hOLoA8+ZF2Xe8R3pRnYjmHY7GCpzdOMnu5HcDnkBGuNRDP2f8/wPbl5JzgrUvBqgzIXa
 Z54uO9Fl7AXkHbTi/NYtBhOnqu/TfVPpSCwOCZKXgcwwPSbRUw8HlBJSKgh9uuiO+afD
 BpQhImIlsLrV8k+WH97fIZpolUhepbgmAYxEvVCMIGNNDizEMO2rbN5DI+v6d/K+qDmO
 40WWFEPBJJiQUsy7udEDazXhzNAvSk3iOGFUtRum2l2VH6gYghL+DC/4wsSclWmWoSHG
 GrJQ==
X-Gm-Message-State: AOAM5321OYlpAhG2RxB4bMLiVG6/mGLJFkZpu8yfrisaf1+kAz6WdLmN
 OEvY3PDPSFt22lHKraE9Er5YzlKusZJ74JMjkydknPL/
X-Google-Smtp-Source: ABdhPJxwJyskWeAkFvqx4sKVPYPHOXwTzCra8jHeACsKmQPSvQQYzgcB2xzmHexkLY4I0S4m1lLxQZ32wHFNRXpKRns=
X-Received: by 2002:a7b:cc0e:: with SMTP id f14mr8532752wmh.39.1590758946066; 
 Fri, 29 May 2020 06:29:06 -0700 (PDT)
MIME-Version: 1.0
References: <WOsdNGp0dhyp8Modsrt7DYpd0fVk7Yk264FISQ1Yls30bhlSXbxzgKTpmOCJ9H2WV1XHyUjCXu7nwBOWQ6n1NCbIcVl1-1IZ4rMMGN1dN-U=@emersion.fr>
 <CAAxE2A4NCo_KMkemUOHKbZ7P=GR4p-zwhpmP7Get18x4Ydb-Gg@mail.gmail.com>
 <bbZABMxDckHUj5JW5DW0pSewqQ-rAIW0gvNnTlI4np7o1A2bDrpPGIeyk5tXGMDr_cAI1l_R9qw6ykJ8OEhQlbKruJ8IG579jqADaPAnUbA=@emersion.fr>
In-Reply-To: <bbZABMxDckHUj5JW5DW0pSewqQ-rAIW0gvNnTlI4np7o1A2bDrpPGIeyk5tXGMDr_cAI1l_R9qw6ykJ8OEhQlbKruJ8IG579jqADaPAnUbA=@emersion.fr>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 29 May 2020 09:28:55 -0400
Message-ID: <CADnq5_MEFM_2k_uboU6E9d3_j18K+tz=Axtie-80PSSwJ2vkYw@mail.gmail.com>
Subject: Re: [PATCH v3] drm/fourcc: document modifier uniqueness requirements
To: Simon Ser <contact@emersion.fr>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBNYXkgMjksIDIwMjAgYXQgNDo1OSBBTSBTaW1vbiBTZXIgPGNvbnRhY3RAZW1lcnNp
b24uZnI+IHdyb3RlOgo+Cj4gT24gVGh1cnNkYXksIE1heSAyOCwgMjAyMCA1OjQ5IFBNLCBNYXJl
ayBPbMWhw6FrIDxtYXJhZW9AZ21haWwuY29tPiB3cm90ZToKPgo+ID4gT24gbW9zdCBoYXJkd2Fy
ZSwgdGhlcmUgaXMgYSBtaW5pbXVtIHBpdGNoIGFsaWdubWVudCBmb3IgbGluZWFyIGFuZAo+ID4g
YW55IGdyZWF0ZXIgbXVsdGlwbGUgb2YgdGhlIGFsaWdubWVudCBpcyBmaW5lLgo+ID4KPiA+IE9u
IE5hdmksIHRoZSBwaXRjaCBpbiBieXRlcyBmb3IgbGluZWFyIG11c3QgYmUKPiA+IGFsaWduKHdp
ZHRoICogYnBwIC8gOCwgMjU2KS4gVGhhdCdzIGJlY2F1c2UgdGhlIGh3IGNvbXB1dGVzIHRoZSBw
aXRjaAo+ID4gZnJvbSB0aGUgd2lkdGggYW5kIGRvZXNuJ3QgYWxsb3cgc2V0dGluZyBhIGN1c3Rv
bSBwaXRjaC4gRm9yIHRoYXQKPiA+IHJlYXNvbiwgbXVsdGktR1BVIHNoYXJpbmcgbWlnaHQgbm90
IGJlIHBvc3NpYmxlIGlmIHRoZSBvdGhlciBHUFUKPiA+IGRvZXNuJ3QgYWxpZ24gdGhlIHBpdGNo
IGluIGV4YWN0bHkgdGhlIHNhbWUgd2F5Lgo+Cj4gT0suIEluIHRoaXMgY2FzZSBJIHRoaW5rIGl0
J3MgZmluZSB0byBtYWtlIHRoZSBETUEtQlVGIGltcG9ydCBmYWlsLCBhcwo+IHdlJ3ZlIHN1Z2dl
c3RlZCBvbiBJUkMuIFRoZSBtb3JlLW9yLWxlc3MgcGxhbm5lZCBmaXggZm9yIHRoZXNlIGJ1ZmZl
cgo+IHNoYXJpbmcgaXNzdWVzIGlzIHRvIHJldml2ZSB0aGUgYnVmZmVyIGNvbnN0cmFpbnRzIHBy
b3Bvc2FsIGZyb20gdGhlCj4gYWxsb2NhdG9yIHByb2plY3QuIEl0J3MgYSBsb3Qgb2Ygd29yayB0
aG91Z2guCgpJIGdldCB0aGF0LCBidXQgd2h5IGV4cGxpY2l0bHkgbGltaXQgbW9kaWZpZXJzIHRo
ZW4/ICBTaG91bGRuJ3Qgd2UgdHJ5CmFuZCBkbyB0aGUgYmVzdCB3ZSBjYW4gd2l0aCB3aGF0IHdl
IGhhdmUgbm93PyAgSWYgbm90IHRoZSBzaXR1YXRpb24gaXMKbm90IG11Y2ggYmV0dGVyIHRoYW4g
d2hhdCB3ZSBoYXZlIG5vdy4gIFdoeSBnbyB0aHJvdWdoIHRoZSBlZmZvcnQgb3IKYWRkaW5nIG1v
ZGlmZXIgc3VwcG9ydCBpbiB0aGUgZmlyc3QgcGxhY2UgaWYgdGhleSBhcmUgbW9zdGx5IHVzZWxl
c3M/CkkgZG9uJ3QgcXVpdGUgZ2V0IHdoYXQgd2UgYXJlIHRyeWluZyB0byBkbyB3aXRoIHRoZW0u
ICBXaGF0IGRvZXMgdGhpcwptZWFuICJNb2RpZmllcnMgbXVzdCB1bmlxdWVseSBlbmNvZGUgYnVm
ZmVyIGxheW91dCI/ICBXZSBoYXZlIGEgbnVtYmVyCm9mIGJ1ZmZlciBsYXlvdXRzIHRoYXQgYXJl
IHRoZSBzYW1lIGZyb20gYSBmdW5jdGlvbmFsIHN0YW5kcG9pbnQsIGJ1dAp0aGV5IGhhdmUgZGlm
ZmVyZW50IGFsaWdubWVudCByZXF1aXJlbWVudHMgZGVwZW5kaW5nIG9uIHRoZSBjaGlwIGFuZAp0
aGUgbnVtYmVyIG9mIG1lbW9yeSBjaGFubmVscywgZXRjLiAgV291bGQgdGhvc2UgYmUgY29uc2lk
ZXJlZCB0aGUKc2FtZSBtb2RpZmVyPyAgSWYgbm90LCB0aGVuIHdlIGFyZSBzb3J0IG9mIGltcGxp
Y2l0bHkgZW5jb2RpbmcKYWxpZ25tZW50IHJlcXVpcmVtZW50cyBpbnRvIHRoZSBtb2RpZmllci4K
CkFsZXgKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
