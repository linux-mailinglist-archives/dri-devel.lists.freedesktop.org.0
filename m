Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BC97E0807
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2019 17:56:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8079C6E869;
	Tue, 22 Oct 2019 15:56:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99C166E86F
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2019 15:56:19 +0000 (UTC)
Received: by mail-ot1-x344.google.com with SMTP id s22so14617417otr.6
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2019 08:56:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5H56XdOux4SKyU8Ke1qZlotEUEu1Ct1El6M2VfKXQrI=;
 b=cp4Uc2VPK2gQRsVYjn7+dwGfCAg1cTLxHtROgj93am7sVM16jjY+s2X7+mOCWPUd4A
 IXs2vjxKrRJt/kKOL26691WN1o17QBaQzL2Qdm/cYrWVyv33bMMA6WcsYpLslSUzS0Z4
 sHbJsQoO/gSClUtkAnDzFKIunlWBwRo8NNO8gb7kKXwOz+xEi8UcrmH6Cs0hmlXycQjP
 RHEcI9E35XCtnKRn3HNQ0Zk9AGO9EtHledJm5vCLnwR/5QL4JLPuTHnIpyVF6g7nV4q/
 cRrZX3BRIWSd8DStrrZq5mg3/25rJUnnbQcR0G173DTrjKqKCBumt/UvLRxxO9jBkQvF
 BwBg==
X-Gm-Message-State: APjAAAXksicojbQHOwzvARGjfLPedHWi+4PiXoh5QypB6EdAdv1Dcx4x
 cJrKsbcwyX492UwSMHFJ4xjArHVcBvnr70UGZqPp1g==
X-Google-Smtp-Source: APXvYqz6gKDeTzzKXSy/uJQ/zq2wkX0+TEyXaw/1KWZiG/0F6OBcC1VMO1MNc2keyK1MQSzS0eQRFVCwmykBbgpFWyA=
X-Received: by 2002:a9d:630c:: with SMTP id q12mr3270558otk.332.1571759778722; 
 Tue, 22 Oct 2019 08:56:18 -0700 (PDT)
MIME-Version: 1.0
References: <20191021190310.85221-1-john.stultz@linaro.org>
 <be7286c7-3e67-4ffb-73b1-2622391d7c15@baylibre.com>
In-Reply-To: <be7286c7-3e67-4ffb-73b1-2622391d7c15@baylibre.com>
From: John Stultz <john.stultz@linaro.org>
Date: Tue, 22 Oct 2019 08:56:06 -0700
Message-ID: <CALAqxLVjp-qNyy8wjG+fJYQqafK5Fsf8rpb3bNe3_p0X9VLjRg@mail.gmail.com>
Subject: Re: [PATCH v13 0/5] DMA-BUF Heaps (destaging ION)
To: Neil Armstrong <narmstrong@baylibre.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=5H56XdOux4SKyU8Ke1qZlotEUEu1Ct1El6M2VfKXQrI=;
 b=InvwlPuggw69FQ+wNV9b2DwABdDRrRxnQhNV+lvNJZxDm1O9d3EwMNJk3NcYkz+Zzu
 Xu4pfeAN/BpJeuW0jb+tvWQyIITLENhCjkoEEn1Gu1rZIh1pXRjbKwWVqb7sksaPYRJ1
 dLNSv1858/je85K4xejswBfzelyWsj0LDazReY9y/KMLz1L5bkjDWXqLdVm5nMvg/vfr
 5ThlE4qYsdk8MSy4T6e9+u9qdXIL0dnJpF+rVsDNGLBuMZ5sxWAA6q4vUQnAIB+1X6kB
 zFIbA2VLwgVdhrEj9qK4FaBSw9rxMdGuDJbGjET3Aw3htlmjbvjoGmqiQ4nB01i/WPLZ
 loVA==
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
Cc: Hillf Danton <hdanton@sina.com>,
 Vincent Donnefort <Vincent.Donnefort@arm.com>, Chenbo Feng <fengc@google.com>,
 lkml <linux-kernel@vger.kernel.org>, Liam Mark <lmark@codeaurora.org>,
 Alistair Strachan <astrachan@google.com>,
 Christoph Hellwig <hch@infradead.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, "Andrew F . Davis" <afd@ti.com>,
 Hridya Valsaraju <hridya@google.com>, Sudipto Paul <Sudipto.Paul@arm.com>,
 Pratik Patel <pratikp@codeaurora.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBPY3QgMjIsIDIwMTkgYXQgMToyMSBBTSBOZWlsIEFybXN0cm9uZyA8bmFybXN0cm9u
Z0BiYXlsaWJyZS5jb20+IHdyb3RlOgo+Cj4gSGkgSm9obiwKPgo+IE9uIDIxLzEwLzIwMTkgMjE6
MDMsIEpvaG4gU3R1bHR6IHdyb3RlOgo+ID4gTHVja3kgbnVtYmVyIDEzISA6KQo+ID4KPiA+IExh
c3Qgd2VlayBpbiB2MTIgSSBoYWQgcmUtYWRkZWQgc29tZSBzeW1ib2wgZXhwb3J0cyB0byBzdXBw
b3J0Cj4gPiBsYXRlciBwYXRjaGVzIEkgaGF2ZSBwZW5kaW5nIHRvIGVuYWJsZSBsb2FkaW5nIGhl
YXBzIGZyb20KPiA+IG1vZHVsZXMuIEhlIHJlbWluZGVkIG1lIHRoYXQgYmFjayBhcm91bmQgdjMg
KGl0cyBiZWVuIGF3aGlsZSEpIEkKPiA+IGhhZCByZW1vdmVkIHRob3NlIGV4cG9ydHMgZHVlIHRv
IGNvbmNlcm5zIGFib3V0IHRoZSBmYWN0IHRoYXQgd2UKPiA+IGRvbid0IHN1cHBvcnQgbW9kdWxl
IHJlbW92YWwuCj4gPgo+ID4gU28gSSdtIHJlc3Bpbm5pbmcgdGhlIHBhdGNoZXMsIHJlbW92aW5n
IHRoZSBleHBvcnRzIGFnYWluLiBJJ2xsCj4gPiBzdWJtaXQgYSBwYXRjaCB0byByZS1hZGQgdGhl
bSBpbiBhIGxhdGVyIHNlcmllcyBlbmFibGluZyBtb2R1ZWxzCj4gPiB3aGljaCBjYW4gYmUgcmV2
aWV3ZWQgaW5kZXBlbnRseS4KPiA+Cj4gPiBXaXRoIHRoYXQgZG9uZSwgbGV0cyBnZXQgb24gdG8g
dGhlIGJvaWxlcnBsYXRlIQo+ID4KPiA+IFRoZSBwYXRjaHNldCBpbXBsZW1lbnRzIHBlci1oZWFw
IGRldmljZXMgd2hpY2ggY2FuIGJlIG9wZW5lZAo+ID4gZGlyZWN0bHkgYW5kIHRoZW4gYW4gaW9j
dGwgaXMgdXNlZCB0byBhbGxvY2F0ZSBhIGRtYWJ1ZiBmcm9tIHRoZQo+ID4gaGVhcC4KPiA+Cj4g
PiBUaGUgaW50ZXJmYWNlIGlzIHNpbWlsYXIsIGJ1dCBtdWNoIHNpbXBsZXIgdGhlbiBJT05zLCBv
bmx5Cj4gPiBwcm92aWRpbmcgYW4gQUxMT0MgaW9jdGwuCj4gPgo+ID4gQWxzbywgSSd2ZSBwcm92
aWRlZCByZWxhdGl2ZWx5IHNpbXBsZSBzeXN0ZW0gYW5kIGNtYSBoZWFwcy4KPiA+Cj4gPiBJJ3Zl
IGJvb3RlZCBhbmQgdGVzdGVkIHRoZXNlIHBhdGNoZXMgd2l0aCBBT1NQIG9uIHRoZSBIaUtleTk2
MAo+ID4gdXNpbmcgdGhlIGtlcm5lbCB0cmVlIGhlcmU6Cj4gPiAgIGh0dHBzOi8vZ2l0LmxpbmFy
by5vcmcvcGVvcGxlL2pvaG4uc3R1bHR6L2FuZHJvaWQtZGV2LmdpdC9sb2cvP2g9ZGV2L2RtYS1i
dWYtaGVhcAo+Cj4gRG8geW91IGhhdmUgYSA0LjE5IHRyZWUgd2l0aCB0aGUgY2hhbmdlcyA/IEkg
dHJpZWQgYnV0IHRoZSB4YXJyYXkgaWRyIHJlcGxhY2VtZW50Cj4gaXMgbWlzc2luZy4uLiBzbyBJ
IGNhbid0IHRlc3Qgd2l0aCBvdXIgYW5kcm9pZC1hbWxvZ2ljLWJtZXNvbi00LjE5IHRyZWUuCj4K
PiBJZiB5b3UgY2FuIHByb3ZpZGUsIEknbGwgYmUgaGFwcHkgdG8gdGVzdCB0aGUgc2VyaWUgYW5k
IHRoZSBncmFsbG9jIGNoYW5nZXMuCgpVbmZvcnR1bmF0ZWx5IEkgZG9uJ3QgaGF2ZSBhIDQuMTkg
dmVyc2lvbiBvZiBkbWFidWYgaGVhcHMgKGFsbCB0aGUKd29yayBoYXMgYmVlbiBkb25lIHRoaXMg
eWVhciwgcG9zdCA0LjE5KS4gSSdtIHBsYW5uaW5nIHRvIGJhY2twb3J0IHRvCjUuNCBmb3IgQU9T
UCwgYnV0IEkndmUgbm90IHJlYWxseSB0aG91Z2h0IGFib3V0IDQuMTkuIE1vc3QgbGlrZWx5IEkK
d29uJ3QgaGF2ZSB0aW1lIHRvIGxvb2sgYXQgaXQgdW50aWwgYWZ0ZXIgdGhlIGNoYW5nZXMgYXJl
IHVwc3RyZWFtIGFuZAp0aGUgNS40IGJhY2twb3J0IGlzIGRvbmUuCgpJcyB0aGUgYm1lc29uIHRy
ZWUgbGlrZWx5IHRvIG9ubHkgc3RheSBhdCA0LjE5PyBPciB3aWxsIGl0IG1vdmUgZm9yd2FyZD8K
CnRoYW5rcwotam9obgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
