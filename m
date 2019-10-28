Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C31E7989
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2019 21:03:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B4D96E9C5;
	Mon, 28 Oct 2019 20:03:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com
 [IPv6:2607:f8b0:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC3AD6E9C5
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2019 20:03:17 +0000 (UTC)
Received: by mail-oi1-x243.google.com with SMTP id m193so2522506oig.0
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2019 13:03:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LlJXOfNrar9cSMwsMokP9HFTFFdfu93s0cpnQ48Gezs=;
 b=bgm1YTr6JIbWBzdHMynMH6gCqixX1y7Pr9qKo11d4i1aIoqBJjDSYSC/fhB+2Pcz23
 MFgk/tDZM4wQmlUgjPGvURaOMRzbj3J/OfrlcjxuwXHZ4O+/al+URTojTEDMIKnQ03QO
 ftHqxj0g27G+jrfOonOzut+ENmyFej3fuVA7iRzuwCcehShMEOIcSRq3qVb0+EIrJeuE
 iG+nWNqR19FldxspoGRfM96Xxhi3juE8546r29UTouyOHQvl8Zi/QzcpKk09mF/ivxci
 mgxbSmzaHUdd1ioxuDGHaMZBaqNDP/TCQuXI2OQnxWXQhw60wBzCYKIHyDesZAXIj1xK
 NPqA==
X-Gm-Message-State: APjAAAXTEhE4zj9NoxleGY+3rm5IH4bSniIsZcyyunq/OtJsfmvooIrm
 Iu9q2arwypIq7TKAafIa7kKDpX9bzBt41OoIMK9pxg==
X-Google-Smtp-Source: APXvYqxBOm9fQjYmZRso/7PDZ+WJx2Nc87EvRCW7FgWuw1UjJKhCz3MGX1e4aqRxLVZC4qNDZIWrS3MYoSgdXDBBmoU=
X-Received: by 2002:aca:58c2:: with SMTP id m185mr894309oib.128.1572292996724; 
 Mon, 28 Oct 2019 13:03:16 -0700 (PDT)
MIME-Version: 1.0
References: <20191025234834.28214-1-john.stultz@linaro.org>
 <20191025234834.28214-2-john.stultz@linaro.org>
 <20191028191231.GJ125958@google.com>
In-Reply-To: <20191028191231.GJ125958@google.com>
From: John Stultz <john.stultz@linaro.org>
Date: Mon, 28 Oct 2019 13:03:05 -0700
Message-ID: <CALAqxLVEwTjNe6y9xLLv9ib8qnp6hFXsT+XS2bJT0jRTzZVdsg@mail.gmail.com>
Subject: Re: [RFC][PATCH 1/2] mm: cma: Export cma symbols for cma heap as a
 module
To: Sandeep Patil <sspatil@google.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=LlJXOfNrar9cSMwsMokP9HFTFFdfu93s0cpnQ48Gezs=;
 b=X1YV3b4J8TxKUrgQ/8l0Q+Zyy4NSj2OyLTW8TY5W4OzAQC1RTbtjAOSKbCHdpa7PdV
 v9/cdxxYjFZNMLDHcqBF5fvXbCcpiWTOD9M12PJmlpAdzh4TtT0Y6k1HCaARZ++NGEe1
 +PKEkOT979vbQsxeNGy/RVsXCvVa3Ab9QOG63dvf+dWGDwonJH/tOHg4tchxu08KelCk
 oS5pMjeLlrJ/t1zNr52xcnQP3TmhiehLueWB93/kha6bBwCWRQ/z/uFaLVtq/OL0TEpw
 lLrLCUeHFVuhKy++M+q8gFyNMVnJmGVKtA+KYQqqahdohNVuSOTbdwZe7tiR74+jnE0f
 pj6A==
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
Cc: Alistair Strachan <astrachan@google.com>,
 Mike Rapoport <rppt@linux.ibm.com>, Chenbo Feng <fengc@google.com>,
 lkml <linux-kernel@vger.kernel.org>, Liam Mark <lmark@codeaurora.org>,
 Yue Hu <huyue2@yulong.com>, dri-devel <dri-devel@lists.freedesktop.org>,
 "Andrew F . Davis" <afd@ti.com>, Hridya Valsaraju <hridya@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Pratik Patel <pratikp@codeaurora.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBPY3QgMjgsIDIwMTkgYXQgMTI6MTIgUE0gPHNzcGF0aWxAZ29vZ2xlLmNvbT4gd3Jv
dGU6Cj4gT24gRnJpLCBPY3QgMjUsIDIwMTkgYXQgMTE6NDg6MzNQTSArMDAwMCwgSm9obiBTdHVs
dHogd3JvdGU6Cj4gPiAtLS0gYS9rZXJuZWwvZG1hL2NvbnRpZ3VvdXMuYwo+ID4gKysrIGIva2Vy
bmVsL2RtYS9jb250aWd1b3VzLmMKPiA+IEBAIC0zMSw2ICszMSw3IEBACj4gPiAgI2VuZGlmCj4g
Pgo+ID4gIHN0cnVjdCBjbWEgKmRtYV9jb250aWd1b3VzX2RlZmF1bHRfYXJlYTsKPiA+ICtFWFBP
UlRfU1lNQk9MKGRtYV9jb250aWd1b3VzX2RlZmF1bHRfYXJlYSk7Cj4KPiBJIGRpZG4ndCBuZWVk
IHRvIGRvIHRoaXMgZm9yIHRoZSAob3V0LW9mLXRyZWUpIGlvbiBjbWEgaGVhcCBbMV0uCj4gQW55
IHJlYXNvbiB3aHkgeW91IGhhZCB0bz8KCkl0cyBsaWtlbHkgZHVlIHRvIHRoZSBjaGFuZ2VzIEkg
bWFkZSBpbiB0aGUgc2VwYXJhdGUKbm9uLWRlZmF1bHQtQ01BLXJlZ2lvbiBwYXRjaCBzZXQuIEVh
cmxpZXIgSSBoYWQgZ290dGVuIGF3YXkgd2l0aCBqdXN0CnlvdXIgY2hhbmdlLCBidXQgaW4gdGVz
dGluZyBiZWZvcmUgSSBzZW50IHRoaXMgc2VyaWVzLCBJIGhpdCB0aGUgYnVpbGQKZXJyb3IgYW5k
IHF1aWNrbHkgYWRkZWQgdGhlIGV4cG9ydCBiZWZvcmUgc2VuZGluZy4KCkknbGwgcmV2aXNlIGFu
ZCByZXNwaW4gdGhpcy4gTW9zdGx5IGp1c3Qgd2FudGluZyB0byBnZXQgaW5pdGlhbApmZWVkYmFj
ayBvbiB0aGUgZG1hYnVmLWhlYXBzLWFzLW1vZHVsZXMgYml0LCBzbyBJIGRpZG4ndCB0YWtlIGFz
IG11Y2gKY2FyZSBhcyBJIHNob3VsZCBoYXZlIHdpdGggdGhlIGV4cG9ydHMgaGVyZS4KCnRoYW5r
cwotam9obgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
