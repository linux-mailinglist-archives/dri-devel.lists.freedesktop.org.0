Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43BED2A97AC
	for <lists+dri-devel@lfdr.de>; Fri,  6 Nov 2020 15:32:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E49A6E0EF;
	Fri,  6 Nov 2020 14:32:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51AEC6E0EF
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Nov 2020 14:32:16 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id h2so1628300wmm.0
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Nov 2020 06:32:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=TG+grahIptnoTDeadrfkRn7emRkmhtKpvXQhWUpy47k=;
 b=CrhDurWJAeG4yK5DEGv6d9vKTLLPGIfaDJN7YD9qUnkQpoyQUsXYvGemkHpc95FY87
 pviTM6G9r8Hhf2hQUKgc22YuQg0Ss5mCLrSh9xbXMmx0fXYz4mRWJdyIA6XwOPnXVf9P
 skctiWNEDRpalRxGXR8tQzPcfJ7in7yLpP3sLfM+mroEGkpOMrz+tf6RKaWSMRTZM0Za
 F30A4x23Xj7WI1aPnn+zIU01l+RroFxRZfvuqgGlrntMzkS/zPC+d8A1Nbfmm6UK0xL+
 2ZPHj9LYGSlZ2puczY7UpBzyZtP1yhTfY5YpPk10esNMcygJdK6YH7T2fLjK8emhE7Ux
 cL0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=TG+grahIptnoTDeadrfkRn7emRkmhtKpvXQhWUpy47k=;
 b=Ofq7lhqafXxv4bJvHBWct3iCLzB6m73K4af+LDJNYoe3C3Dn3T4TnxunQAp4JRjC8V
 f0RspPXweCvyfOofjKh9gtDZY2oJ0JErGWnDpn/X+0IvznUwXehWNHAkaflv2NmXLeTU
 DXsXo07s36RDKdIA4P3H74Vhpr4s0Cr4b2s8piAybDsJqriogjm6XFXfCyX/798MPzqZ
 7dmA5YDiD7dJ8AYnTP137k/TZ/lilZS8FJTfGY7hIaRuSeVBWmYJNgCjdXvShlFnQJl6
 SnWk25+bwJua0Y6drDDqm0jYMZyuyDiDhxd+Z1Z1YgZvKhCaHsXLMKzzFoSUAduPwJvu
 Sz7g==
X-Gm-Message-State: AOAM532nuQcTxR/VcLUv0pjWIEu3+QEgNUQnMUgVINmgGeXe0yMgiN+w
 p3AzNoqCikjo+fmRwnseIHGMtA==
X-Google-Smtp-Source: ABdhPJz0I4gPLyquCNwWmcmsIQGxwkz8JIey0HnDEKQCgJUtOSWDcHPzwffR+RU3ePv5LrUQVQs2ZA==
X-Received: by 2002:a1c:4646:: with SMTP id t67mr2949050wma.40.1604673134943; 
 Fri, 06 Nov 2020 06:32:14 -0800 (PST)
Received: from dell ([91.110.221.242])
 by smtp.gmail.com with ESMTPSA id a185sm2567348wmf.24.2020.11.06.06.32.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2020 06:32:14 -0800 (PST)
Date: Fri, 6 Nov 2020 14:32:12 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH 08/19] gpu: drm: omapdrm: dss: dsi: Rework and remove a
 few unused variables
Message-ID: <20201106143212.GJ2063125@dell>
References: <20201105144517.1826692-1-lee.jones@linaro.org>
 <20201105144517.1826692-9-lee.jones@linaro.org>
 <74399fab-6af5-77d3-e0eb-749774eb2837@ti.com>
 <20201105180725.GO4488@dell>
 <e48964e6-4a94-4495-0217-90db19fff629@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e48964e6-4a94-4495-0217-90db19fff629@ti.com>
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAwNiBOb3YgMjAyMCwgVG9taSBWYWxrZWluZW4gd3JvdGU6Cgo+IE9uIDA1LzExLzIw
MjAgMjA6MDcsIExlZSBKb25lcyB3cm90ZToKPiA+IE9uIFRodSwgMDUgTm92IDIwMjAsIFRvbWkg
VmFsa2VpbmVuIHdyb3RlOgo+ID4gCj4gPj4gT24gMDUvMTEvMjAyMCAxNjo0NSwgTGVlIEpvbmVz
IHdyb3RlOgo+ID4+PiBGaXhlcyB0aGUgZm9sbG93aW5nIFc9MSBrZXJuZWwgYnVpbGQgd2Fybmlu
ZyhzKToKPiA+Pj4KPiA+Pj4gIGRyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL2Rzcy9kc2kuYzogSW4g
ZnVuY3Rpb24g4oCYX2RzaV9wcmludF9yZXNldF9zdGF0dXPigJk6Cj4gPj4+ICBkcml2ZXJzL2dw
dS9kcm0vb21hcGRybS9kc3MvZHNpLmM6MTEzMTo2OiB3YXJuaW5nOiB2YXJpYWJsZSDigJhs4oCZ
IHNldCBidXQgbm90IHVzZWQgWy1XdW51c2VkLWJ1dC1zZXQtdmFyaWFibGVdCj4gPj4+ICBkcml2
ZXJzL2dwdS9kcm0vb21hcGRybS9kc3MvZHNpLmM6IEluIGZ1bmN0aW9uIOKAmGRzaV91cGRhdGXi
gJk6Cj4gPj4+ICBkcml2ZXJzL2dwdS9kcm0vb21hcGRybS9kc3MvZHNpLmM6Mzk0MzoxMDogd2Fy
bmluZzogdmFyaWFibGUg4oCYZGjigJkgc2V0IGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtYnV0LXNl
dC12YXJpYWJsZV0KPiA+Pj4gIGRyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL2Rzcy9kc2kuYzozOTQz
OjY6IHdhcm5pbmc6IHZhcmlhYmxlIOKAmGR34oCZIHNldCBidXQgbm90IHVzZWQgWy1XdW51c2Vk
LWJ1dC1zZXQtdmFyaWFibGVdCj4gPj4+Cj4gPj4+IENjOiBUb21pIFZhbGtlaW5lbiA8dG9taS52
YWxrZWluZW5AdGkuY29tPgo+ID4+PiBDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4Lmll
Pgo+ID4+PiBDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgo+ID4+PiBDYzogTGF1
cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPgo+ID4+PiBD
YzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+ID4+PiBTaWduZWQtb2ZmLWJ5OiBM
ZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgo+ID4+PiAtLS0KPiA+Pj4gIGRyaXZlcnMv
Z3B1L2RybS9vbWFwZHJtL2Rzcy9kc2kuYyB8IDkgKystLS0tLS0tCj4gPj4+ICAxIGZpbGUgY2hh
bmdlZCwgMiBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQo+ID4+Cj4gPj4gSSdkIHVzZSAi
ZHJtL29tYXA6IGRzaTogIiBzdWJqZWN0IHByZWZpeCwgdGhlIGN1cnJlbnQgb25lIGlzIGZpbmUg
dG9vOgo+ID4+Cj4gPj4gUmV2aWV3ZWQtYnk6IFRvbWkgVmFsa2VpbmVuIDx0b21pLnZhbGtlaW5l
bkB0aS5jb20+Cj4gPj4KPiA+PiBTaG91bGQgSSBwaWNrIHRoaXMgdXAgb3IgZG8geW91IHdhbnQg
dG8ga2VlcCB0aGUgc2VyaWVzIGludGFjdD8KPiA+IAo+ID4gSWYgeW91IGFyZSBpbiBhIHBvc2l0
aW9uIHRvIHRha2UgaXQsIHBsZWFzZSBkbyBzby4KPiA+IAo+ID4gSSByZWJhc2UgZXZlcnkgZGF5
LCBzbyBpdCB3aWxsIGp1c3QgdmFuaXNoIGZyb20gbXkgd29ya2luZyBzZXQuCj4gCj4gSSBoYXZl
IGEgNTYgcGF0Y2ggc2VyaWVzIG9uIGRzaS5jIHRoYXQgSSBzZW50IHllc3RlcmRheSwgYW5kIGl0
IGNvbmZsaWN0cyB3aXRoIHRoaXMgb25lLiBJJ2xsIHBpY2sKPiB0aGlzIG9uZSBvbiB0b3Agb2Yg
bXkgc2VyaWVzLgoKU291bmRzIGdvb2QsIHRoYW5rcy4KCi0tIApMZWUgSm9uZXMgW+adjueQvOaW
r10KU2VuaW9yIFRlY2huaWNhbCBMZWFkIC0gRGV2ZWxvcGVyIFNlcnZpY2VzCkxpbmFyby5vcmcg
4pSCIE9wZW4gc291cmNlIHNvZnR3YXJlIGZvciBBcm0gU29DcwpGb2xsb3cgTGluYXJvOiBGYWNl
Ym9vayB8IFR3aXR0ZXIgfCBCbG9nCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbAo=
