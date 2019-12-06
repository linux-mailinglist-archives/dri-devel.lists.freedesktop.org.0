Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 855C3115645
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2019 18:16:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F5C86FA68;
	Fri,  6 Dec 2019 17:16:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 635AF6FA68
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2019 17:16:17 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com
 [209.85.219.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 272FF2075C
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2019 17:16:17 +0000 (UTC)
Received: by mail-qv1-f50.google.com with SMTP id p2so155222qvo.10
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Dec 2019 09:16:17 -0800 (PST)
X-Gm-Message-State: APjAAAVB/z6JNRcMgq5CSFYJ2/ogqgsmQma6K0Z1y2sb97I6pASgu8to
 Sc+hXQcFTf+UCkiY0d8UOvlUfm7Dj3NuLtIsVw==
X-Google-Smtp-Source: APXvYqzx8jl0GnKo/9iCYjSFSNiFINlc48pxzz7Fp8mE/q8FywUeC+oN6SsnRFBZgYuJNimMZ/yKyQNvOsSA19YHcRw=
X-Received: by 2002:ad4:450a:: with SMTP id k10mr12812100qvu.136.1575652576311; 
 Fri, 06 Dec 2019 09:16:16 -0800 (PST)
MIME-Version: 1.0
References: <20191129135908.2439529-1-boris.brezillon@collabora.com>
In-Reply-To: <20191129135908.2439529-1-boris.brezillon@collabora.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Fri, 6 Dec 2019 11:16:05 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLAA3K3Ea=eAh_vEmpMJygvPyZk5oSRknjogdNTG=5z1w@mail.gmail.com>
Message-ID: <CAL_JsqLAA3K3Ea=eAh_vEmpMJygvPyZk5oSRknjogdNTG=5z1w@mail.gmail.com>
Subject: Re: [PATCH 0/8] panfrost: Fixes for 5.4
To: Boris Brezillon <boris.brezillon@collabora.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1575652577;
 bh=mCoef2jYGa48MHa2MMofRgutdq7ZVj+qVb+Td+Wxjkk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Ac2J2WUYViFVyh2m++26jOnLJd7FSsirxmnpa12WxMirLj8vctYM77JbW1X47PhwI
 K0+uC1XBQdc9rflmfZS7LirCFBJOBLoWPxcK3K7ZZPEamLVyy1cZBZD75udVrAQsbL
 M37cPvQQD+V45jTt9geek5asmOI5N2FC5bs1TngU=
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Steven Price <steven.price@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBOb3YgMjksIDIwMTkgYXQgNzo1OSBBTSBCb3JpcyBCcmV6aWxsb24KPGJvcmlzLmJy
ZXppbGxvbkBjb2xsYWJvcmEuY29tPiB3cm90ZToKPgo+IEhlbGxvLAo+Cj4gSSd2ZSByZWNlbnRs
eSBjb21lIHRvIHRlc3QgYSA1LjQga2VybmVsIG9uIGEgcmszMjg4IHBsYXRmb3JtIChUNzYwKSwK
PiBhbmQsIGFzIHJlcG9ydGVkIGJ5IG1hbnkgcGVvcGxlIG9uICNwYW5mcm9zdCwgSSd2ZSBoaXQg
YSBwYWdlLWZhdWx0Cj4gc3Rvcm0gd2hlbiBydW5uaW5nIHZhcmlvdXMgR0wgYXBwcy4KPgo+IFRo
aXMgc2VyaWVzIHRyaWVzIHRvIGFkZHJlc3MgdGhlIHByb2JsZW1zIEkgY291bGQgc3BvdCBkdXJp
bmcgbXkgZGVidWcKPiBzZXNzaW9uLCB3aXRoIHBhdGNoIDcgYmVpbmcgdGhlIG1vc3QgaW52YXNp
dmUgY2hhbmdlLiBJIHdpc2ggSQo+IGNvdWxkIGZpbmQgYW4gZWFzaWVyIHdheSB0byBmaXggdGhl
ICJCTyBtYXBwaW5nIHRlYXJlZCBkb3duIHdoaWxlIEdQVQo+IGpvYnMgcmVmZXJlbmNpbmcgaXQg
YXJlIGluLWZsaWdodCIgcHJvYmxlbSwgYXMgSSBkb24ndCBsaWtlIHRhZ2dpbmcKPiBjb21wbGV4
IGNoYW5nZXMgZm9yIHN0YWJsZSwgYnV0IHRoaXMgaXMgdGhlIGJlc3QgSSBjb3VsZCBjb21lIHVw
IHdpdGguCj4KPiBMZXQgbWUga25vdyBpZiB5b3UgaGF2ZSBiZXR0ZXIgaWRlYXMuCj4KPiBSZWdh
cmRzLAo+Cj4gQm9yaXMKPgo+IEJvcmlzIEJyZXppbGxvbiAoOCk6Cj4gICBkcm0vcGFuZnJvc3Q6
IE1ha2UgcGFuZnJvc3Rfam9iX3J1bigpIHJldHVybiBhbiBFUlJfUFRSKCkgaW5zdGVhZCBvZgo+
ICAgICBOVUxMCj4gICBkcm0vcGFuZnJvc3Q6IEZpeCBhIHJhY2UgaW4gcGFuZnJvc3RfaW9jdGxf
bWFkdmlzZSgpCj4gICBkcm0vcGFuZnJvc3Q6IEZpeCBhIEJPIGxlYWsgaW4gcGFuZnJvc3RfaW9j
dGxfbW1hcF9ibygpCj4gICBkcm0vcGFuZnJvc3Q6IEZpeCBhIHJhY2UgaW4gcGFuZnJvc3RfZ2Vt
X2ZyZWVfb2JqZWN0KCkKPiAgIGRybS9wYW5mcm9zdDogT3Blbi9jbG9zZSB0aGUgcGVyZmNudCBC
Two+ICAgZHJtL3BhbmZyb3N0OiBNYWtlIHN1cmUgaW1wb3J0ZWQvZXhwb3J0ZWQgQk9zIGFyZSBu
ZXZlciBwdXJnZWQKPiAgIGRybS9wYW5mcm9zdDogQWRkIHRoZSBwYW5mcm9zdF9nZW1fbWFwcGlu
ZyBjb25jZXB0Cj4gICBkcm0vcGFuZnJvc3Q6IE1ha2Ugc3VyZSB0aGUgc2hyaW5rZXIgZG9lcyBu
b3QgcmVjbGFpbSByZWZlcmVuY2VkIEJPcwoKSSd2ZSBhcHBsaWVkIHBhdGNoZXMgMi01LgoKUm9i
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
