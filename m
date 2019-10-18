Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF682DC44F
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2019 14:04:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 478ED6E0E7;
	Fri, 18 Oct 2019 12:04:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4319C6E0E7
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2019 12:04:05 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id t20so8639530qtr.10
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2019 05:04:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Zgv+qsT50asyCBxx8dHLrc/7R2zuXJqrAElFwEmz+6o=;
 b=Bitj5xQOIT5nk3n66b5rLr06hNoLjJ4QysCiQGvR4eQxnvKbUNpA20IBiFifyJoTv8
 AjS1qIUEB9IUaCWmORTI/rEbr1lJwaUtbTMxLc3BBllUbswR3Ejz+qvnQ8rEsxGz3Te4
 Bq65Hdhgb6a08pAL+qYBPvjY5sfQdROv0XV8Rg55SMvV6N+2muJ0/mPLUlhzEI0xM0PS
 Hxb8QZUqqm3opZz0C1yRwuAa9MJz6FL6crHbJDNPm/wOQFWTKDl8oeHfHgn37UGtEHpG
 lERtyo93qfA2yytodXjELzrJ9DBVr7oS6UBAxX8coCIeB1n4IVG1eYpjW1LilNO2PCpt
 niOQ==
X-Gm-Message-State: APjAAAXKA3RycOPJat+dzdEzXOeA2j36a5htkPG3iWMhCk9gOpgqjxs3
 wpqbqa9IBxoFKP78SES5X6Azo82qHj/aNG9E/LALcw==
X-Google-Smtp-Source: APXvYqxN/PMVQWc4kwuCABb8SVWIpRbyl131FT7CZcvatX5vcKooHrltGmgsSQcxbFgna4xwbUWch+DuxQg3HoR+XIE=
X-Received: by 2002:ac8:110d:: with SMTP id c13mr9331476qtj.209.1571400244300; 
 Fri, 18 Oct 2019 05:04:04 -0700 (PDT)
MIME-Version: 1.0
References: <20191018052323.21659-1-john.stultz@linaro.org>
 <20191018052323.21659-5-john.stultz@linaro.org>
 <20191018112124.grjgqrn3ckuc7n4v@DESKTOP-E1NTVVP.localdomain>
In-Reply-To: <20191018112124.grjgqrn3ckuc7n4v@DESKTOP-E1NTVVP.localdomain>
From: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Date: Fri, 18 Oct 2019 14:03:53 +0200
Message-ID: <CA+M3ks6KqqXCfqA6VDKnQOsvFLQfaGrUnA+eesnyzMRniFB00A@mail.gmail.com>
Subject: Re: [PATCH v12 4/5] dma-buf: heaps: Add CMA heap to dmabuf heaps
To: Brian Starkey <Brian.Starkey@arm.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Zgv+qsT50asyCBxx8dHLrc/7R2zuXJqrAElFwEmz+6o=;
 b=PRl4/YMK8PN+sw8qz9vbBuWmnDNxUIbUV/4by7yJ/ZaetJCfkYyfwrAGp4L4IH6LoP
 X90KnC+d9bCIKe0fkrb8KwvqpCKLZfxHCWiRVC5+Avh65mJjwzKqn/c7tQy4nIFc43w6
 fEhxkzcQyeFDnYdq9lc6NIglUPHlGjhxzCtISkWH0lr1mN/d5ArBGgrWkrdHp3Fe8Lyd
 mX6Uxi4EFn19ZqRvFKdtnYLqjyXoc84MmMj+814gfoww9pORycIuZnYnOy5whHI3n0U7
 fWrPnn2VRYK4wEAYgggIvmmEHwL+yRBrdIpc5fY7eSH2tabBEWdHELFqZ+S8jDFESWhz
 xVmw==
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
 Alistair Strachan <astrachan@google.com>,
 Vincent Donnefort <Vincent.Donnefort@arm.com>, Chenbo Feng <fengc@google.com>,
 lkml <linux-kernel@vger.kernel.org>, Liam Mark <lmark@codeaurora.org>,
 "Andrew F . Davis" <afd@ti.com>, Christoph Hellwig <hch@infradead.org>,
 nd <nd@arm.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Hridya Valsaraju <hridya@google.com>, Pratik Patel <pratikp@codeaurora.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TGUgdmVuLiAxOCBvY3QuIDIwMTkgw6AgMTM6MjEsIEJyaWFuIFN0YXJrZXkgPEJyaWFuLlN0YXJr
ZXlAYXJtLmNvbT4gYSDDqWNyaXQgOgo+Cj4gT24gRnJpLCBPY3QgMTgsIDIwMTkgYXQgMDU6MjM6
MjJBTSArMDAwMCwgSm9obiBTdHVsdHogd3JvdGU6Cj4gPiBUaGlzIGFkZHMgYSBDTUEgaGVhcCwg
d2hpY2ggYWxsb3dzIHVzZXJzcGFjZSB0byBhbGxvY2F0ZQo+ID4gYSBkbWEtYnVmIG9mIGNvbnRp
Z3VvdXMgbWVtb3J5IG91dCBvZiBhIENNQSByZWdpb24uCj4gPgo+ID4gVGhpcyBjb2RlIGlzIGFu
IGV2b2x1dGlvbiBvZiB0aGUgQW5kcm9pZCBJT04gaW1wbGVtZW50YXRpb24sIHNvCj4gPiB0aGFu
a3MgdG8gaXRzIG9yaWdpbmFsIGF1dGhvciBhbmQgbWFpbnRhaW50ZXJzOgo+ID4gICBCZW5qYW1p
biBHYWlnbmFyZCwgTGF1cmEgQWJib3R0LCBhbmQgb3RoZXJzIQo+ID4KPiA+IE5PVEU6IFRoaXMg
cGF0Y2ggb25seSBhZGRzIHRoZSBkZWZhdWx0IENNQSBoZWFwLiBXZSB3aWxsIGVuYWJsZQo+ID4g
c2VsZWN0aXZlbHkgYWRkaW5nIG90aGVyIENNQSBtZW1vcnkgcmVnaW9ucyB0byB0aGUgZG1hYnVm
IGhlYXBzCj4gPiBpbnRlcmZhY2Ugd2l0aCBhIGxhdGVyIHBhdGNoICh3aGljaCByZXF1aXJlcyBh
IGR0IGJpbmRpbmcpCgpNYXliZSB3ZSBjYW4gdXNlICJuby1tYXAiIERUIHByb3BlcnR5IHRvIHRy
aWdnZXIgdGhhdC4gSWYgc2V0IGRvIG5vdCBleHBvc2UgdGhlCmNtYSBoZWFwLgoKQmVuamFtaW4K
Pgo+IFRoYXQnbGwgdGVhY2ggbWUgZm9yIHJlYWRpbmcgbXkgZW1haWwgaW4gRklGTyBvcmRlci4K
Pgo+IFRoaXMgYXBwcm9hY2ggbWFrZXMgc2Vuc2UgdG8gbWUuCj4KPiAtQnJpYW4KPgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
