Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8670E25AD14
	for <lists+dri-devel@lfdr.de>; Wed,  2 Sep 2020 16:29:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 515E86E917;
	Wed,  2 Sep 2020 14:29:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x144.google.com (mail-il1-x144.google.com
 [IPv6:2607:f8b0:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AADB6E917
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Sep 2020 14:29:34 +0000 (UTC)
Received: by mail-il1-x144.google.com with SMTP id x2so5154909ilm.0
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Sep 2020 07:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=basnieuwenhuizen-nl.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=/fXgQHiXukX+ClzrRX80pTyjguROYRV1kg49BzpegFw=;
 b=HlwgYaeefKMrvI0/QsxwEcUEiX2F9gPNjBaEOegxYDK76O5fBGUw1OIyDG8hJqFNr6
 5EKqMP2OiMvMNc383In8g0enlv8O0x0atZ+mU6hgWN9V8kCfW2YbOicLyJGisSMtmY4S
 zBN/+R4CuRl9vWK6aC2Y5rAgWDZ2sqHAkZAQa9eqnbQ13OwazoMHe9KF1faD+K+YUkVm
 PfTFHSj3YvncTIVvKTiVL9NRq5meYTN5OHeb4BqPItfKRgbrPrNxP7vNwes6zWy2zaj3
 FfewhF93J8QV/0MqRBc9yivnhsJvSUoHCkx39yJ5hcfkTEn3DOjaDyJSd1nZ0tPCEFTn
 pnvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=/fXgQHiXukX+ClzrRX80pTyjguROYRV1kg49BzpegFw=;
 b=EyWYbHa19k3UFF1qElwsd+jn6hS4yG9KzijPHE7Kd5cW6MBYFPDw+PhL3DGJkbNv+w
 rQtX5Isw5+l2bJg0DSt0yxzR3O2df56jT9tpwrSVYGy7SkA/xBRFySpeQLf1Kk5p+Mvn
 C4BiU1fAP05fMJmYbdVJMSGdtNN0NWPVQrVde/uMfoTxenLRdglkPirP5f0OANb9hXxz
 t5BMJhpMRMDvrTQR8lvxJEx3o40KS2zA4nVxyZMRQkA4u6flCz+AhkDvYQUFsSs694z+
 dvj1Y5E9tSKSYtoBjHp9nrmR40yjGQSCbv+NpTz+pjHnjfa+f8EqTgdzHCUAqFpMwxRU
 TKbQ==
X-Gm-Message-State: AOAM531QvExnXqP4HB2ZVAXzTBBFwxH0e2H3KO/N2aGL2CGDB/AE02Tz
 82XlllMkXIXjEgrwbiEQckeDSCyfqXe3m2JnO85y4g==
X-Google-Smtp-Source: ABdhPJzNBQ87jwvPh8YvMJC21LLeVcwEF8+dzWFQNgYkmh+c2dw/e3dEOhCKiejRx4mV/L96uVP3C+Z3LcRnAf0pMow=
X-Received: by 2002:a92:de48:: with SMTP id e8mr3864114ilr.41.1599056973808;
 Wed, 02 Sep 2020 07:29:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200902102440.3621733-1-daniel.vetter@ffwll.ch>
 <t3hHLqZ0yNm5FdxpyJovgjEVzs-OD7qD5nYrYXug8UhkBykhekB0_hOqPltEvFH3daJ3HYtY_3FInv3U5xIHprg1FS7b2SP8fCf48r7DvVg=@emersion.fr>
 <CAKMK7uFztTjjvQvM-toeZv3hps+NMJFXV7s=Dzs5PwG3J+7wjw@mail.gmail.com>
 <ap5W_r98yx5DpM1jFkrof6yWGWPtxbyObFp3iIP1-hm-SD_-Jij72KZK2VhVV2p-34EqdVE6T1JeW4zAgjnNsxv_CtULfvg2ASY3xECXMuY=@emersion.fr>
In-Reply-To: <ap5W_r98yx5DpM1jFkrof6yWGWPtxbyObFp3iIP1-hm-SD_-Jij72KZK2VhVV2p-34EqdVE6T1JeW4zAgjnNsxv_CtULfvg2ASY3xECXMuY=@emersion.fr>
From: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
Date: Wed, 2 Sep 2020 16:29:26 +0200
Message-ID: <CAP+8YyGRghDdO+hswLyN=KKe+JYDbXcWztpq0yf5qTW0A0CKHA@mail.gmail.com>
Subject: Re: [PATCH] drm/doc: Document that modifiers are always required for
 fb
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
Cc: Daniel Stone <daniels@collabora.com>,
 =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>, Juston Li <juston.li@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBTZXAgMiwgMjAyMCBhdCAyOjQ5IFBNIFNpbW9uIFNlciA8Y29udGFjdEBlbWVyc2lv
bi5mcj4gd3JvdGU6Cj4KPiBPbiBXZWRuZXNkYXksIFNlcHRlbWJlciAyLCAyMDIwIDI6NDQgUE0s
IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+IHdyb3RlOgo+Cj4gPiA+IEkg
c3VwcG9zZSBzb21ldGhpbmcgc2ltaWxhciBoYXBwZW5zIGluIHVzZXItc3BhY2U6IGdibV9ib19j
cmVhdGUKPiA+ID4gd2l0aG91dCBtb2RpZmllcnMgbmVlZHMgdG8gcHJvcGVybHkgc2V0IHRoZSBp
bXBsaWNpdCBtb2RpZmllciwgaWUuCj4gPiA+IGdibV9ib19nZXRfbW9kaWZpZXIgbmVlZHMgdG8g
cmV0dXJuIHRoZSBlZmZlY3RpdmUgbW9kaWZpZXIuIElzIHRoaXMKPiA+ID4gc29tZXRoaW5nIGFs
cmVhZHkgZG9jdW1lbnRlZD8KPiA+Cj4gPiBJIGRvbid0IHRoaW5rIHRoYXQgaGFwcGVucywgYnV0
IGl0IGhhcyBjb21lIHVwIGluIGRpc2N1c3Npb25zLiBJdCdzCj4gPiBraW5kYSBkaWZmZXJlbnQg
c2NlbmFyaW8gdGhvdWdoOiBnZXRmYjIgaXMgZm9yIGNyb3NzLWNvbXBvc2l0b3Igc3R1ZmYsCj4g
PiBlbmFibGluZyBzbW9vdGggdHJhbnNpdGlvbnMgYXQgYm9vdC11cCBhbmQgd2hlbiBzd2l0Y2hp
bmcuIFNvIHlvdSBoYXZlCj4gPiBhIGxlZ2l0IHJlYXNvbiBmb3IgbWl4aW5nIG1vZGlmaWVyLWF3
YXJlIHVzZXJzcGFjZSB3aXRoCj4gPiBub24tbW9kaWZpZXItYXdhcmUgdXNlcnNwYWNlLiBBbmQg
dGhlIG1vZGlmaWVyLWF3YXJlIHVzZXJzcGFjZSB3b3VsZAo+ID4gbGlrZSB0aGF0IGV2ZXJ5dGhp
bmcgd29ya3Mgd2l0aCBtb2RpZmllcnMgY29uc2lzdGVudGx5LCBpbmNsdWRpbmcKPiA+IGdldGZi
Mi4gQnV0IGdibSBpcyBqdXN0IHdpdGhpbiBhIHNpbmdsZSBwcm9jZXNzLCBhbmQgdGhhdCBzaG91
bGQKPiA+IGVpdGhlciBydW4gYWxsIHdpdGggbW9kaWZpZXJzLCBvciBub3QgYXQgYWxsLCBzaW5j
ZSB0aGVzZSB3b3JsZHMganVzdAo+ID4gZG9udCBtaXggd2VsbC4gSGVuY2UgSSdtIG5vdCBzZWVp
bmcgbXVjaCB1c2UgZm9yIHRoYXQsIC1tb2Rlc2V0dGluZwo+ID4gYmVpbmcgYSBjb25mdXNlZCBt
ZXNzIG5vbndpdGhzdGFuZGluZyA6LSkKPgo+IFdlbGzigKYgVGhlcmUncyBhbHNvIHRoZSBjYXNl
IHdoZXJlIHNvbWUgbGVnYWN5IFdheWxhbmQgY2xpZW50IHRhbGtzIHRvIGEKPiBtb2RpZmllci1h
d2FyZSBjb21wb3NpdG9yLiBnYm1fYm9faW1wb3J0IHdvdWxkIGJlIGNhbGxlZCB3aXRob3V0IGEK
PiBtb2RpZmllciwgYnV0IHRoZSBjb21wb3NpdG9yIGV4cGVjdHMgZ2JtX2JvX2dldF9tb2RpZmll
ciB0byB3b3JrLgo+Cj4gQWxzbywgd2xyb290cyB3aWxsIGNhbGwgZ2JtX2JvX2NyZWF0ZSB3aXRo
b3V0IGEgbW9kaWZpZXIgdG8gb25seSBsZXQKPiB0aGUgZHJpdmVyIHBpY2sgInNhZmUiIG1vZGlm
aWVycyBpbiBjYXNlIHBhc3NpbmcgdGhlIGZ1bGwgbGlzdCBvZgo+IG1vZGlmaWVycyByZXN1bHRz
IGluIGEgYmxhY2sgc2NyZWVuLiBMYXRlciBvbiB3bHJvb3RzIHdpbGwgY2FsbAo+IGdibV9ib19n
ZXRfbW9kaWZpZXIgdG8gZmlndXJlIG91dCB3aGF0IG1vZGlmaWVyIHRoZSBkcml2ZXIgcGlja2Vk
LgoKSSBkb24ndCB0aGluayB3ZSBjYW4gZG8gdGhhdCBnZW5lcmFsbHksIGFzIHByZS1tb2RpZmll
ciBjbGllbnRzIGFyZQp0eXBpY2FsbHkgYWxzbyBub3QgY2FwYWJsZSBvZiBoYW5kbGluZyBtZW1v
cnkgcGxhbmVzID4gZm9ybWF0IHBsYW5lcywKd2hpY2ggd2lsbCBoYXBwZW4gd2l0aCBjb21wcmVz
c2lvbiAoYnV0IHVzZWQgb3V0IG9mIGJhbmQgY29tbXVuaWNhdGlvbgpmb3IgdGhlIHNlY29uZCBw
bGFuZSBvbiBBTUQgaW4gdGhlIG5vbi1tb2RpZmllciBjYXNlKS4KPiBfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
PiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
