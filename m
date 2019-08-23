Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CA0F9B31A
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2019 17:15:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DB386ECC3;
	Fri, 23 Aug 2019 15:15:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E18D96ECC3
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2019 15:15:49 +0000 (UTC)
Received: by mail-ot1-x341.google.com with SMTP id f17so9086932otq.4
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2019 08:15:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yF6s2o6Obyqe3Vdpv/vEsuzAp6r9764Exr+eDaZHvIs=;
 b=MyJDFHzSry+6KRpjYubxtPuGVW7M8rburxYUvn2wz+iTFnPRs/L0fFUxJYfMaF/Kot
 881ovSjVZzSPvbg4a+juw1W61ktBb4RqfVbYfbIxGIQ6GylF7XVpMoHjiYfa+eM8zozq
 1rVBUmHJ1Vgn61fyh8JooHhmJwkVhaflWiKmV+H58Wh71/cApFF7Ot8YP260dZ0lB8G/
 T2punJMCbSaw1ukjsWjae+TN1YsBt/XFkrK7nkUKML7epMn1MiZcH1BvzEsT5zneuulL
 ricWGcz9vHIaCO85xMGeQgjYg0LLQI4deoaPkaWZrH2PHgefUVFlCbHuKULwy2Gje0ZK
 xpBQ==
X-Gm-Message-State: APjAAAVTxolcLQZosrwkTNwG68V/KM1m/XC7Tj+IBTlWlf9jbK+FBSya
 VCOCTqH91x69uRFQt7txTX7AH2sf3DriXdCa8CnxXg==
X-Google-Smtp-Source: APXvYqxYJ5Sv6xRYyBhZ/VIa63V8CWwoKAMb/ZibSDLDyqK3dCvDo5SGQy04IWZyYut8+xZ5L8t6GMt0vJE1pUvmUsA=
X-Received: by 2002:a9d:7087:: with SMTP id l7mr4788315otj.281.1566573349104; 
 Fri, 23 Aug 2019 08:15:49 -0700 (PDT)
MIME-Version: 1.0
References: <20190820081902.24815-1-daniel.vetter@ffwll.ch>
 <20190820081902.24815-4-daniel.vetter@ffwll.ch>
 <20190820202440.GH11147@phenom.ffwll.local>
 <20190822161428.c9e4479207386d34745ea111@linux-foundation.org>
 <CAKMK7uGw_7uD=wH3bcR9xXSxAcAuYTLOZt3ue4TEvst1D0KzLQ@mail.gmail.com>
 <20190823121234.GB12968@ziepe.ca>
 <CAKMK7uHzSkd2j4MvSMoHhCaSE0BT0zMo9osF4FUBYwNZrVfYDA@mail.gmail.com>
 <20190823140615.GJ2369@hirez.programming.kicks-ass.net>
In-Reply-To: <20190823140615.GJ2369@hirez.programming.kicks-ass.net>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 23 Aug 2019 17:15:37 +0200
Message-ID: <CAKMK7uFM0JLqJ7y9F8ybvYx+o4+2S+guaV-MaBQyyik3F0vNiQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] kernel.h: Add non_block_start/end()
To: Peter Zijlstra <peterz@infradead.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=yF6s2o6Obyqe3Vdpv/vEsuzAp6r9764Exr+eDaZHvIs=;
 b=CipekAbZFv7AtHaeNXijgoaKhu1e4Ki+U+C5UwmSTDk1R0S6hDs4Rz2vU5i7aJx+Xm
 CNIekhclzjzyj/jl3B4i8OIxJ6LkL0vwtijn9gG6PL9FFIjKLREyHpLX0dOnwbR0Y3Yz
 IJxMIxvhHrwSWKUrN2lkWRoeMoZa+8njEAvaQ=
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
Cc: Feng Tang <feng.tang@intel.com>, Michal Hocko <mhocko@suse.com>,
 Kees Cook <keescook@chromium.org>, Linux MM <linux-mm@kvack.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Jann Horn <jannh@google.com>, LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Jason Gunthorpe <jgg@ziepe.ca>,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Ingo Molnar <mingo@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 Randy Dunlap <rdunlap@infradead.org>, David Rientjes <rientjes@google.com>,
 Wei Wang <wvw@google.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBBdWcgMjMsIDIwMTkgYXQgNDowNiBQTSBQZXRlciBaaWpsc3RyYSA8cGV0ZXJ6QGlu
ZnJhZGVhZC5vcmc+IHdyb3RlOgo+IE9uIEZyaSwgQXVnIDIzLCAyMDE5IGF0IDAzOjQyOjQ3UE0g
KzAyMDAsIERhbmllbCBWZXR0ZXIgd3JvdGU6Cj4gPiBJJ20gYXNzdW1pbmcgdGhlIGxvY2tkZXAg
b25lIHdpbGwgbGFuZCwgc28gbm90IGdvaW5nIHRvIHJlc2VuZCB0aGF0Lgo+Cj4gSSB3YXMgYXNz
dW1pbmcgeW91J2Qgd2FrZSB0aGUgbWlnaHRfbG9ja19uZXN0ZWQoKSBhbG9uZyB3aXRoIHRoZSBp
OTE1Cj4gdXNlciB0aHJvdWdoIHRoZSBpOTE1L2RybSB0cmVlLiBJZiB3YW50IG1lIHRvIHRha2Ug
c29tZSBvciBhbGwgb2YgdGhhdCwKPiBsZW1tZSBrbm93LgoKbWlnaHRfbG9ja19uZXN0ZWQoKSBp
cyBhIGRpZmZlcmVudCBwYXRjaCBzZXJpZXMsIHRoYXQgb25lIHdpbGwgaW5kZWVkCmdvIGluIHRo
cm91Z2ggdGhlIGRybS9pOTE1IHRyZWUsIHRoeCBmb3IgdGhlIGFjayB0aGVyZS4gV2hhdCBJIG1l
YW50CmhlcmUgaXMgc29tZSBtbXUgbm90aWZpZXIgbG9ja2RlcCBtYXAgaW4gdGhpcyBzZXJpZXMg
dGhhdCBKYXNvbiBzYWlkCmhlJ3MgZ29pbmcgdG8gcGljayB1cCBpbnRvIGhtbS5naXQuIEknbSBk
b2luZyBhYm91dCAzIG9yIDQgZGlmZmVyZW50CmxvY2tkZXAgYW5ub3RhdGlvbnMgc2VyaWVzIGlu
IHBhcmFsbGVsIHJpZ2h0IG5vdyA6LSkKLURhbmllbAotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2Fy
ZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KKzQxICgwKSA3OSAzNjUgNTcgNDggLSBodHRw
Oi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
