Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4931BE4329
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2019 07:57:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D5E36E89C;
	Fri, 25 Oct 2019 05:56:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 601DB6E89C
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2019 05:56:57 +0000 (UTC)
Received: by mail-ot1-x341.google.com with SMTP id e11so1149537otl.5
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2019 22:56:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zThSuPucnYB11UxQ84T8AiU13at0QlBZrNas229mVK4=;
 b=RzXw2qXmIhs7MzE0JVsigQs+tHqR0P2b48ki8UddIiwyvQrJdn4+gVnYbg6Tn1foRQ
 eQyYBHQIhZbCSF26zjIZ7+8Zd166q839YY3jBt9CCO8z8OwjiF8IgqVkESdSaBh/xOC0
 iQklvf5IMZiSSM5VvU6yvNLhtfMUVqr1m3tJmdTcmVsSVVRKPMSMGPOGkleljTMgV0mI
 yoQBcVNfzp9CjxWhBKak4Eu4/qVTeL0hA0+q+7BzuHdyKUsYKLfqPm1C0qzN4kCoXkng
 fWk71m8PNL/MftW5s8mw81dUDWR5ICXfK2yhm5ZVGiON+EYaBN8rLMF8ejIXXuBBkzba
 oHLA==
X-Gm-Message-State: APjAAAVT14qtpuFp4ZW8++HL+NUlYL3CdOpui/AmL3rbiWSXPQbEH7Ou
 i4EQrRiZ9vX1CXFRbehUz2Of5c5hPhCkXGJQdriipg==
X-Google-Smtp-Source: APXvYqw/DUlrRogzHWRrsD06nz/kflR9lP8eB8Uz45TB1T3cs5AdM0YleXz3T7NJw93Ak+GBflKz0IBcBroUy3HWdSA=
X-Received: by 2002:a9d:2241:: with SMTP id o59mr1342045ota.224.1571983016328; 
 Thu, 24 Oct 2019 22:56:56 -0700 (PDT)
MIME-Version: 1.0
References: <20191021190310.85221-1-john.stultz@linaro.org>
In-Reply-To: <20191021190310.85221-1-john.stultz@linaro.org>
From: Sumit Semwal <sumit.semwal@linaro.org>
Date: Fri, 25 Oct 2019 11:26:44 +0530
Message-ID: <CAO_48GHk8b=7Rs2CYZvnki2EMpeo_4FRy+_3F0Mv_nAK42MpgQ@mail.gmail.com>
Subject: Re: [PATCH v13 0/5] DMA-BUF Heaps (destaging ION)
To: John Stultz <john.stultz@linaro.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=zThSuPucnYB11UxQ84T8AiU13at0QlBZrNas229mVK4=;
 b=c83H9Xm7uwJMYI/yUjZRfhl0JIbApRXJSslgxBFnsu3+JNMmAMx7Vvqg79Mi6F5/T6
 YA1unfPBbMrOhFSPnFZD9anMpGXO7as8l8PS3IU6UuRSTKTtHQRTeIQ5cnevXgD2hoQR
 L0ZIv9KKe1hJr4+zMi9wkJlNvAqVxGIkipCP5TMv1G54C7Yvfa8pafyAv2nflkMDdISX
 B2QPxwy33Po1tlfhJM858lU65nHQxQ1WeBZuvXvDX0IWU/0EVCywYRpPVABbk3oam2AI
 lU8d5Q6W9avvustlUo+sDMgS/yqJ5T/Yq21JKWYu7JnDhMg35Fd522DIvy6agg0OXOi6
 IImg==
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
Cc: Hillf Danton <hdanton@sina.com>, Sudipto Paul <Sudipto.Paul@arm.com>,
 Vincent Donnefort <Vincent.Donnefort@arm.com>, Chenbo Feng <fengc@google.com>,
 lkml <linux-kernel@vger.kernel.org>, Liam Mark <lmark@codeaurora.org>,
 "Andrew F . Davis" <afd@ti.com>, Christoph Hellwig <hch@infradead.org>,
 Alistair Strachan <astrachan@google.com>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Hridya Valsaraju <hridya@google.com>, Pratik Patel <pratikp@codeaurora.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSm9obiwKCk9uIFR1ZSwgMjIgT2N0IDIwMTkgYXQgMDA6MzMsIEpvaG4gU3R1bHR6IDxqb2hu
LnN0dWx0ekBsaW5hcm8ub3JnPiB3cm90ZToKPgo+IEx1Y2t5IG51bWJlciAxMyEgOikKPgo+IExh
c3Qgd2VlayBpbiB2MTIgSSBoYWQgcmUtYWRkZWQgc29tZSBzeW1ib2wgZXhwb3J0cyB0byBzdXBw
b3J0Cj4gbGF0ZXIgcGF0Y2hlcyBJIGhhdmUgcGVuZGluZyB0byBlbmFibGUgbG9hZGluZyBoZWFw
cyBmcm9tCj4gbW9kdWxlcy4gSGUgcmVtaW5kZWQgbWUgdGhhdCBiYWNrIGFyb3VuZCB2MyAoaXRz
IGJlZW4gYXdoaWxlISkgSQo+IGhhZCByZW1vdmVkIHRob3NlIGV4cG9ydHMgZHVlIHRvIGNvbmNl
cm5zIGFib3V0IHRoZSBmYWN0IHRoYXQgd2UKPiBkb24ndCBzdXBwb3J0IG1vZHVsZSByZW1vdmFs
Lgo+Cj4gU28gSSdtIHJlc3Bpbm5pbmcgdGhlIHBhdGNoZXMsIHJlbW92aW5nIHRoZSBleHBvcnRz
IGFnYWluLiBJJ2xsCj4gc3VibWl0IGEgcGF0Y2ggdG8gcmUtYWRkIHRoZW0gaW4gYSBsYXRlciBz
ZXJpZXMgZW5hYmxpbmcgbW9kdWVscwo+IHdoaWNoIGNhbiBiZSByZXZpZXdlZCBpbmRlcGVudGx5
LgoKVGhpcyBsb29rcyBnb29kIHRvIG1lLCBhbmQgaGFzbid0IHNlZW4gYW55IG1vcmUgY29tbWVu
dHMsIHNvIEkgYW0KZ29pbmcgdG8gbWVyZ2UgaXQgdmlhIGRybS1taXNjLW5leHQgdG9kYXkuCj4K
PiBXaXRoIHRoYXQgZG9uZSwgbGV0cyBnZXQgb24gdG8gdGhlIGJvaWxlcnBsYXRlIQo+Cj4gVGhl
IHBhdGNoc2V0IGltcGxlbWVudHMgcGVyLWhlYXAgZGV2aWNlcyB3aGljaCBjYW4gYmUgb3BlbmVk
Cj4gZGlyZWN0bHkgYW5kIHRoZW4gYW4gaW9jdGwgaXMgdXNlZCB0byBhbGxvY2F0ZSBhIGRtYWJ1
ZiBmcm9tIHRoZQo+IGhlYXAuCj4KPiBUaGUgaW50ZXJmYWNlIGlzIHNpbWlsYXIsIGJ1dCBtdWNo
IHNpbXBsZXIgdGhlbiBJT05zLCBvbmx5Cj4gcHJvdmlkaW5nIGFuIEFMTE9DIGlvY3RsLgo+Cj4g
QWxzbywgSSd2ZSBwcm92aWRlZCByZWxhdGl2ZWx5IHNpbXBsZSBzeXN0ZW0gYW5kIGNtYSBoZWFw
cy4KPgo+IEkndmUgYm9vdGVkIGFuZCB0ZXN0ZWQgdGhlc2UgcGF0Y2hlcyB3aXRoIEFPU1Agb24g
dGhlIEhpS2V5OTYwCj4gdXNpbmcgdGhlIGtlcm5lbCB0cmVlIGhlcmU6Cj4gICBodHRwczovL2dp
dC5saW5hcm8ub3JnL3Blb3BsZS9qb2huLnN0dWx0ei9hbmRyb2lkLWRldi5naXQvbG9nLz9oPWRl
di9kbWEtYnVmLWhlYXAKPgo+IEFuZCB0aGUgdXNlcnNwYWNlIGNoYW5nZXMgaGVyZToKPiAgIGh0
dHBzOi8vYW5kcm9pZC1yZXZpZXcuZ29vZ2xlc291cmNlLmNvbS9jL2RldmljZS9saW5hcm8vaGlr
ZXkvKy85MDk0MzYKPgo+IENvbXBhcmVkIHRvIElPTiwgdGhpcyBwYXRjaHNldCBpcyBtaXNzaW5n
IHRoZSBzeXN0ZW0tY29udGlnLAo+IGNhcnZlb3V0IGFuZCBjaHVuayBoZWFwcywgYXMgSSBkb24n
dCBoYXZlIGEgZGV2aWNlIHRoYXQgdXNlcwo+IHRob3NlLCBzbyBJJ20gdW5hYmxlIHRvIGRvIG11
Y2ggdXNlZnVsIHZhbGlkYXRpb24gdGhlcmUuCj4gQWRkaXRpb25hbGx5IHdlIGhhdmUgbm8gdXBz
dHJlYW0gdXNlcnMgb2YgY2h1bmsgb3IgY2FydmVvdXQsCj4gYW5kIHRoZSBzeXN0ZW0tY29udGln
IGhhcyBiZWVuIGRlcHJlY2F0ZWQgaW4gdGhlIGNvbW1vbi9hbmRvaWQtKgo+IGtlcm5lbHMsIHNv
IHRoaXMgc2hvdWxkIGJlIG9rLgo+Cj4gSSd2ZSBhbHNvIHJlbW92ZWQgdGhlIHN0YXRzIGFjY291
bnRpbmcsIHNpbmNlIGFueSBzdWNoCj4gYWNjb3VudGluZyBzaG91bGQgYmUgaW1wbGVtZW50ZWQg
YnkgZG1hLWJ1ZiBjb3JlIG9yIHRoZSBoZWFwcwo+IHRoZW1zZWx2ZXMuCj4KPiBOZXcgaW4gdjEz
Ogo+ICogUmUtcmVtb3ZlIHN5bWJvbCBleHBvcnRzLCBwZXIgZGlzY3Vzc2lvbiB3aXRoIEJyaWFu
LiBJJ2xsCj4gICByZXN1Ym1pdCB0aGVzZSBzZXBhcmF0ZWx5IGluIGEgbGF0ZXIgcGF0Y2ggc28g
dGhleSBjYW4gYmUKPiAgIGluZGVwZW5kZW50bHkgcmV2aWV3ZWQKPgo+IHRoYW5rcwo+IC1qb2hu
Cgo8c25pcD4KCkJlc3QsClN1bWl0LgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
