Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D155FEA1A7
	for <lists+dri-devel@lfdr.de>; Wed, 30 Oct 2019 17:21:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B3EC6EAB4;
	Wed, 30 Oct 2019 16:21:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com
 [IPv6:2607:f8b0:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84D436EAB4
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Oct 2019 16:21:53 +0000 (UTC)
Received: by mail-oi1-x243.google.com with SMTP id g81so2464456oib.8
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Oct 2019 09:21:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=B4YfyDvcjYY9edtaAxaWe+R+x3fMKG/oWbf1ji+gZ9o=;
 b=kQxS/5CaToa2rttf9gA16dra0bRYkSejwOhMGBiGKCxiD33Pj6OhrdY9i52vPV2aMv
 BCudgCNtN2SRmXxtsH3Ajoja17cNL4no9NQAW8XuHv5W2vIuAUNy9EokxHhOKFTfKHpZ
 xhk5yJNbaNoswVCxf7wC2LKVjK1iLXV5I1qqfDIBh9quaFdbWHlGn3IDZSupP9+L1FZl
 cJV2Iw9ztXZjjh6hj6zZuL8FT2xvPF3CXYwN/QokAlsdaiB67Q1h6qQanr4fxES0Ymft
 j6SgPmcOmbfp5L/KrQrNNkCGYVIuz8FY5cGmF+XXlvOhkR1dZw58J/i84F3ObwihxeN9
 A1DQ==
X-Gm-Message-State: APjAAAXhJbtAtt25WyY2lXy8v8oJEGxJUIOUbPA6rCuBCTojXO3WgEr9
 Du2qOYK9a/Kbj/DLI7uTRw8XW7gg5abrTZ34/bVnMQ==
X-Google-Smtp-Source: APXvYqx/3LD0Wi6ZtOSveEWM/gRe/gZI+G4wG7E22gydAW8YY7t20K75PurFbX1LRPthN3mbGMzOaKzEU+05LiKmGXI=
X-Received: by 2002:a05:6808:a04:: with SMTP id n4mr47802oij.44.1572452512534; 
 Wed, 30 Oct 2019 09:21:52 -0700 (PDT)
MIME-Version: 1.0
References: <20191030150253.10596-1-colin.king@canonical.com>
 <673b3e8f-9211-2fa2-c408-4560b03b4700@ti.com>
In-Reply-To: <673b3e8f-9211-2fa2-c408-4560b03b4700@ti.com>
From: John Stultz <john.stultz@linaro.org>
Date: Wed, 30 Oct 2019 09:21:41 -0700
Message-ID: <CALAqxLVvkd73zQria9C+QcyF1P2cZ7=pOpVQO+AyWzqJQ_q3Yw@mail.gmail.com>
Subject: Re: [PATCH][next] dma-buf: heaps: remove redundant assignment to
 variable ret
To: "Andrew F. Davis" <afd@ti.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=B4YfyDvcjYY9edtaAxaWe+R+x3fMKG/oWbf1ji+gZ9o=;
 b=SeJKbZ9buhy2hrsu7Su0+IXH+BHUtWsjdWMqxQ3NYmzMrpXlqJRZwiTeHesgNUwvKm
 hfSYTym4woJjWQD/xLJhZ6zpdhWHjyA2fa6nUk7U5FmsrnBjFi4Lc/mv77qRDLNHYfnq
 QxeLbVhmTcbMJ/GIeRZ9IkFXxissadJ3cqUNTpN+3V3JDuuNMJQQEdXsnfHl8VCAX4gO
 3z3gH6eCt4mrxl2slCES2KxCq61zzxU+EbTr7QxQw8HCzv/y0kpZYG33T5WpI1Vf+13J
 7ppEwSlA76oy9FWP0xMug3pXLkhQZ/NhOsr+THBOeyyDRtkz2O4Zl1JyB85bKdHa0Mms
 ytxA==
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
Cc: kernel-janitors@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>,
 Liam Mark <lmark@codeaurora.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Colin King <colin.king@canonical.com>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBPY3QgMzAsIDIwMTkgYXQgODo0NSBBTSBBbmRyZXcgRi4gRGF2aXMgPGFmZEB0aS5j
b20+IHdyb3RlOgo+Cj4gT24gMTAvMzAvMTkgMTE6MDIgQU0sIENvbGluIEtpbmcgd3JvdGU6Cj4g
PiBGcm9tOiBDb2xpbiBJYW4gS2luZyA8Y29saW4ua2luZ0BjYW5vbmljYWwuY29tPgo+ID4KPiA+
IFRoZSB2YXJpYWJsZSByZXQgaXMgYmVpbmcgYXNzaWduZWQgd2l0aCBhIHZhbHVlIHRoYXQgaXMg
bmV2ZXIKPiA+IHJlYWQsIGl0IGlzIGJlaW5nIHJlLWFzc2lnbmVkIHRoZSBzYW1lIHZhbHVlIG9u
IHRoZSBlcnIwIGV4aXQKPiA+IHBhdGguIFRoZSBhc3NpZ25tZW50IGlzIHJlZHVuZGFudCBhbmQg
aGVuY2UgY2FuIGJlIHJlbW92ZWQuCj4gPgo+ID4gQWRkcmVzc2VzLUNvdmVyaXR5OiAoIlVudXNl
ZCB2YWx1ZSIpCj4gPiBGaXhlczogNDdhMzJmOWMxMjI2ICgiZG1hLWJ1ZjogaGVhcHM6IEFkZCBz
eXN0ZW0gaGVhcCB0byBkbWFidWYgaGVhcHMiKQo+ID4gU2lnbmVkLW9mZi1ieTogQ29saW4gSWFu
IEtpbmcgPGNvbGluLmtpbmdAY2Fub25pY2FsLmNvbT4KPiA+IC0tLQo+Cj4KPiBUaGUgcm9vdCBv
ZiB0aGUgaXNzdWUgaXMgdGhhdCByZXQgaXMgbm90IHVzZWQgaW4gdGhlIGVycm9yIHBhdGgsIGl0
Cj4gc2hvdWxkIGJlLCBJIHN1Z2dlc3QgdGhpcyBmaXg6Cj4KPiA+IC0tLSBhL2RyaXZlcnMvZG1h
LWJ1Zi9oZWFwcy9zeXN0ZW1faGVhcC5jCj4gPiArKysgYi9kcml2ZXJzL2RtYS1idWYvaGVhcHMv
c3lzdGVtX2hlYXAuYwo+ID4gQEAgLTk4LDcgKzk4LDcgQEAgc3RhdGljIGludCBzeXN0ZW1faGVh
cF9hbGxvY2F0ZShzdHJ1Y3QgZG1hX2hlYXAgKmhlYXAsCj4gPiAgZXJyMDoKPiA+ICAgICAgICAg
a2ZyZWUoaGVscGVyX2J1ZmZlcik7Cj4gPgo+ID4gLSAgICAgICByZXR1cm4gLUVOT01FTTsKPiA+
ICsgICAgICAgcmV0dXJuIHJldDsKPiA+ICB9CgpTb3VuZHMgZ29vZCEgSWYgaXRzIG9rIEknbGwg
Z2VuZXJhdGUgYSBjb21taXQgY3JlZGl0aW5nIENvbGluIGZvcgpyZXBvcnRpbmcgdGhlIGlzc3Vl
IGFuZCBBbmRyZXcgZm9yIHRoZSBmaXggYW5kIHN1Ym1pdCBpdCB0byBTdW1pdC4KCk1hbnkgdGhh
bmtzIHRvIHlvdSBib3RoIQotam9obgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
