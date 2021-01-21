Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CC872FEBCA
	for <lists+dri-devel@lfdr.de>; Thu, 21 Jan 2021 14:29:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 562226E530;
	Thu, 21 Jan 2021 13:29:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDF856E530
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jan 2021 13:29:10 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id u25so2517698lfc.2
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jan 2021 05:29:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=TCBmtAGF/p0qcpEu6dpC3LB6xwiWGvLiDJYZOK21eQg=;
 b=kso9808x4AKlVCLoDuCnsIu39a5rc+GdoErbN4v9A0LeyKqKlKZnQ1dZCtCi/0HC8w
 KnpoXw6adp5LSyaXaJqzK1+/d0XrFyt+6exKUKkPuXHFe6dn1pOpw630yXpyGwMieW0j
 T6KPRzXmXWmgk8S0am1TrBzX0lIsQL5iGtEEwTwKcJfen4UKw/mkoT/Whj00fjmxTOWW
 eNJ5E1psjb4UowIw3L/ze2bL8N1I12lKlDeGZOI6qWOSHemRUyNBu/cfHfl7YMRSREJf
 y85GfZVxzSHd0veFJ2SPwAvJmAw/Q7l8G1Mm9YmwoUiNIqbqr9FVssgzQyuO802KfYmR
 eBXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=TCBmtAGF/p0qcpEu6dpC3LB6xwiWGvLiDJYZOK21eQg=;
 b=JHhUNRvcdrzJyqD3RhnAPBXyluodLwOmmAt2ezrTFZefsK7Yr//m9oJzuh/YUh71Mo
 AkhKIClNGAicfpwfLl0bxeo9mwSgBSHWuLFbPuXQ1/p0G1+1x2LyxEdXaCKmJDz1YA5d
 et/WFW2MIpvIUakK8+eHFP9kw3FgNgn1YgVqCR4VKmBxZHGlDIXsnUJn9XhtrupadLTy
 sUQXqjQBNovXyv71raHn/pYw2RQepnSDXLA6WClPfUwTjw4Bd9aEmKqMJibQIGl3CHpU
 QqCIBqmQ1U65NuZzzHJoCT6aslnu1FWwFfGgLdno/9+jnM5ORErs1pKQ+IgSIIT3AjV/
 tb5A==
X-Gm-Message-State: AOAM533xLK14O6Ac3s7np7LMljfzamQXR3uc2wX82+plLutarsiBIryx
 1cM5gbpr9uVaqbNMMkSsAj6bRfULMAbKIiSBqdDgaw==
X-Google-Smtp-Source: ABdhPJxLYG8wma3X3iAjIq15alrm3ByQ9m1SEliYlbpIky8zpSJ6MErlEFnMHA3/JFYzicxGQZp2bcYAzKcs4eMeICU=
X-Received: by 2002:a19:7616:: with SMTP id c22mr4729640lff.550.1611235749239; 
 Thu, 21 Jan 2021 05:29:09 -0800 (PST)
MIME-Version: 1.0
References: <20210119204508.9256-1-john.stultz@linaro.org>
In-Reply-To: <20210119204508.9256-1-john.stultz@linaro.org>
From: Sumit Semwal <sumit.semwal@linaro.org>
Date: Thu, 21 Jan 2021 18:58:57 +0530
Message-ID: <CAO_48GHfGPqcX8B7BC5tf0J3+RWrtjpgHpfnJ-+sVaNv3bxYiw@mail.gmail.com>
Subject: Re: [RESEND][PATCH 1/3] dma-buf: system_heap: Make sure to return an
 error if we abort
To: John Stultz <john.stultz@linaro.org>
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
Cc: Sandeep Patil <sspatil@google.com>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Ezequiel Garcia <ezequiel@collabora.com>, Robin Murphy <robin.murphy@arm.com>,
 James Jones <jajones@nvidia.com>, lkml <linux-kernel@vger.kernel.org>,
 Liam Mark <lmark@codeaurora.org>, Laura Abbott <labbott@kernel.org>,
 Chris Goldsworthy <cgoldswo@codeaurora.org>,
 Hridya Valsaraju <hridya@google.com>,
 =?UTF-8?Q?=C3=98rjan_Eide?= <orjan.eide@arm.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Daniel Mentz <danielmentz@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSm9obiwKCk9uIFdlZCwgMjAgSmFuIDIwMjEgYXQgMDI6MTUsIEpvaG4gU3R1bHR6IDxqb2hu
LnN0dWx0ekBsaW5hcm8ub3JnPiB3cm90ZToKPgo+IElmIHdlIGFib3J0IGZyb20gdGhlIGFsbG9j
YXRpb24gZHVlIHRvIGEgZmF0YWxfc2lnbmFsX3BlbmRpbmcoKSwKPiBiZSBzdXJlIHdlIHJlcG9y
dCBhbiBlcnJvciBzbyBhbnkgcmV0dXJuIGNvZGUgcGF0aHMgZG9uJ3QgdHJpcAo+IG92ZXIgdGhl
IGZhY3QgdGhhdCB0aGUgYWxsb2NhdGlvbiBkaWRuJ3Qgc3VjY2VlZC4KClRoYW5rcyBmb3IgdGhl
IHBhdGNoOyBMR1RNLCB3aWxsIHB1c2ggaW50byBkcm0tbWlzYy1uZXh0Lgo+Cj4gQ2M6IFN1bWl0
IFNlbXdhbCA8c3VtaXQuc2Vtd2FsQGxpbmFyby5vcmc+Cj4gQ2M6IExpYW0gTWFyayA8bG1hcmtA
Y29kZWF1cm9yYS5vcmc+Cj4gQ2M6IExhdXJhIEFiYm90dCA8bGFiYm90dEBrZXJuZWwub3JnPgo+
IENjOiBCcmlhbiBTdGFya2V5IDxCcmlhbi5TdGFya2V5QGFybS5jb20+Cj4gQ2M6IEhyaWR5YSBW
YWxzYXJhanUgPGhyaWR5YUBnb29nbGUuY29tPgo+IENjOiBTdXJlbiBCYWdoZGFzYXJ5YW4gPHN1
cmVuYkBnb29nbGUuY29tPgo+IENjOiBTYW5kZWVwIFBhdGlsIDxzc3BhdGlsQGdvb2dsZS5jb20+
Cj4gQ2M6IERhbmllbCBNZW50eiA8ZGFuaWVsbWVudHpAZ29vZ2xlLmNvbT4KPiBDYzogQ2hyaXMg
R29sZHN3b3J0aHkgPGNnb2xkc3dvQGNvZGVhdXJvcmEub3JnPgo+IENjOiDDmHJqYW4gRWlkZSA8
b3JqYW4uZWlkZUBhcm0uY29tPgo+IENjOiBSb2JpbiBNdXJwaHkgPHJvYmluLm11cnBoeUBhcm0u
Y29tPgo+IENjOiBFemVxdWllbCBHYXJjaWEgPGV6ZXF1aWVsQGNvbGxhYm9yYS5jb20+Cj4gQ2M6
IFNpbW9uIFNlciA8Y29udGFjdEBlbWVyc2lvbi5mcj4KPiBDYzogSmFtZXMgSm9uZXMgPGpham9u
ZXNAbnZpZGlhLmNvbT4KPiBDYzogbGludXgtbWVkaWFAdmdlci5rZXJuZWwub3JnCj4gQ2M6IGRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBTdWdnZXN0ZWQtYnk6IFN1cmVuIEJhZ2hk
YXNhcnlhbiA8c3VyZW5iQGdvb2dsZS5jb20+Cj4gU2lnbmVkLW9mZi1ieTogSm9obiBTdHVsdHog
PGpvaG4uc3R1bHR6QGxpbmFyby5vcmc+Cj4gLS0tCj4gIGRyaXZlcnMvZG1hLWJ1Zi9oZWFwcy9z
eXN0ZW1faGVhcC5jIHwgNCArKystCj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyks
IDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2RtYS1idWYvaGVhcHMvc3lz
dGVtX2hlYXAuYyBiL2RyaXZlcnMvZG1hLWJ1Zi9oZWFwcy9zeXN0ZW1faGVhcC5jCj4gaW5kZXgg
MTdlMGU5YTY4YmFmLi40MDUzNTFhYWQyYTggMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9kbWEtYnVm
L2hlYXBzL3N5c3RlbV9oZWFwLmMKPiArKysgYi9kcml2ZXJzL2RtYS1idWYvaGVhcHMvc3lzdGVt
X2hlYXAuYwo+IEBAIC0zNjMsOCArMzYzLDEwIEBAIHN0YXRpYyBpbnQgc3lzdGVtX2hlYXBfYWxs
b2NhdGUoc3RydWN0IGRtYV9oZWFwICpoZWFwLAo+ICAgICAgICAgICAgICAgICAgKiBBdm9pZCB0
cnlpbmcgdG8gYWxsb2NhdGUgbWVtb3J5IGlmIHRoZSBwcm9jZXNzCj4gICAgICAgICAgICAgICAg
ICAqIGhhcyBiZWVuIGtpbGxlZCBieSBTSUdLSUxMCj4gICAgICAgICAgICAgICAgICAqLwo+IC0g
ICAgICAgICAgICAgICBpZiAoZmF0YWxfc2lnbmFsX3BlbmRpbmcoY3VycmVudCkpCj4gKyAgICAg
ICAgICAgICAgIGlmIChmYXRhbF9zaWduYWxfcGVuZGluZyhjdXJyZW50KSkgewo+ICsgICAgICAg
ICAgICAgICAgICAgICAgIHJldCA9IC1FSU5UUjsKPiAgICAgICAgICAgICAgICAgICAgICAgICBn
b3RvIGZyZWVfYnVmZmVyOwo+ICsgICAgICAgICAgICAgICB9Cj4KPiAgICAgICAgICAgICAgICAg
cGFnZSA9IGFsbG9jX2xhcmdlc3RfYXZhaWxhYmxlKHNpemVfcmVtYWluaW5nLCBtYXhfb3JkZXIp
Owo+ICAgICAgICAgICAgICAgICBpZiAoIXBhZ2UpCj4gLS0KPiAyLjE3LjEKPgoKQmVzdCwKU3Vt
aXQuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
