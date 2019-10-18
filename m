Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AFC39DCDF4
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2019 20:29:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18E446EB88;
	Fri, 18 Oct 2019 18:29:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CE926EB87
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2019 18:29:41 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id n14so7247087wrw.9
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2019 11:29:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=jM3mqQowcnIqqAadMg1JP7jXhgCphy4yRtthUQq8/D4=;
 b=KPBeyfX1F50VtggsaK9MkljNIIVMTgp978O2Rd/LJevCatn70iAm4Qq76ERwxBfJi8
 2Hg81qjNiTAjqd4NMszED/vsH4jXNezMQ9wwlvzlrZ/FjA9CrBmODOIFJnxQHLeZF0QQ
 6+NrcgUJ6H3jX0cVn/Mlb/pVsB/Yy9REX4AMjo0OcHVoMHUuZChBioPdS81wz79Yy1/3
 9J3NMbdvCE7gilTlLNY4wqYoQ+biUX9DXvl7ZTL4F51o/5WNy/Qk7KYQm+07fO+B+xLR
 lijy021nZ8PXyPW22SZl6iGln+xz2Yj+nsJXFy+X4TWSTErcBlYXPlz5MqaTImL5AqFm
 qH7Q==
X-Gm-Message-State: APjAAAUcXdat4l9viKVlcP5erHrQakbsxChl+21kjo8HBcZIVgB7M9y5
 8TE4ACMRdxxOs1QqHTej13+xlyxrjRa3fEXXM1Xnog==
X-Google-Smtp-Source: APXvYqw/ORDV9l2s2JvayF6Hp3+kzOGkiFz+Fg9YoEW0w523xapkapxxJarA+A63lfzlD4kH1X5LWJXwoVh3S7Lti20=
X-Received: by 2002:a5d:55ce:: with SMTP id i14mr8818316wrw.169.1571423380050; 
 Fri, 18 Oct 2019 11:29:40 -0700 (PDT)
MIME-Version: 1.0
References: <20191018052323.21659-1-john.stultz@linaro.org>
 <20191018052323.21659-5-john.stultz@linaro.org>
 <20191018112124.grjgqrn3ckuc7n4v@DESKTOP-E1NTVVP.localdomain>
 <CA+M3ks6KqqXCfqA6VDKnQOsvFLQfaGrUnA+eesnyzMRniFB00A@mail.gmail.com>
In-Reply-To: <CA+M3ks6KqqXCfqA6VDKnQOsvFLQfaGrUnA+eesnyzMRniFB00A@mail.gmail.com>
From: John Stultz <john.stultz@linaro.org>
Date: Fri, 18 Oct 2019 11:29:29 -0700
Message-ID: <CALAqxLXwo=Pwi7BUXNzpk3-aqm1j+O9ZTi4NpYWdc2eYVK7t1w@mail.gmail.com>
Subject: Re: [PATCH v12 4/5] dma-buf: heaps: Add CMA heap to dmabuf heaps
To: Benjamin Gaignard <benjamin.gaignard@linaro.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=jM3mqQowcnIqqAadMg1JP7jXhgCphy4yRtthUQq8/D4=;
 b=ncPaBbJZs3QwmaWC8n5a/tYGtGsYFjLWRdunAcoo3rSjcSu4BXW26U7bkskK8OO6TP
 3FD7LHPbHqupw4LRalLiBKjaIbQtF7l7QQpAYNOXezS6l5cwIuHZqRFfCNF2PM5/d5Gg
 JDiVQWIYpUd8YD3+ZjOvMzMw80MGmCjEj2WwT/Sk8TZwXwReqB8P/yqQir49rSVFj1O4
 T7cT2gpJsEYZcVXPV7R6V2ge1IxIVLQa4CTo55YCIM9PxFZW/4QOb3vPQKHujHyFG3Td
 mkW5GC6NJbJTjQBVCRIkJvb8/VxTcsr6+/dh7ax5gBifEzn2gwxJtliOQNSaqqmAdhVY
 niuA==
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
 Christoph Hellwig <hch@infradead.org>, nd <nd@arm.com>,
 Alistair Strachan <astrachan@google.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Andrew F . Davis" <afd@ti.com>, Hridya Valsaraju <hridya@google.com>,
 Pratik Patel <pratikp@codeaurora.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBPY3QgMTgsIDIwMTkgYXQgNTowNCBBTSBCZW5qYW1pbiBHYWlnbmFyZAo8YmVuamFt
aW4uZ2FpZ25hcmRAbGluYXJvLm9yZz4gd3JvdGU6Cj4gTGUgdmVuLiAxOCBvY3QuIDIwMTkgw6Ag
MTM6MjEsIEJyaWFuIFN0YXJrZXkgPEJyaWFuLlN0YXJrZXlAYXJtLmNvbT4gYSDDqWNyaXQgOgo+
ID4KPiA+IE9uIEZyaSwgT2N0IDE4LCAyMDE5IGF0IDA1OjIzOjIyQU0gKzAwMDAsIEpvaG4gU3R1
bHR6IHdyb3RlOgo+ID4gPiBUaGlzIGFkZHMgYSBDTUEgaGVhcCwgd2hpY2ggYWxsb3dzIHVzZXJz
cGFjZSB0byBhbGxvY2F0ZQo+ID4gPiBhIGRtYS1idWYgb2YgY29udGlndW91cyBtZW1vcnkgb3V0
IG9mIGEgQ01BIHJlZ2lvbi4KPiA+ID4KPiA+ID4gVGhpcyBjb2RlIGlzIGFuIGV2b2x1dGlvbiBv
ZiB0aGUgQW5kcm9pZCBJT04gaW1wbGVtZW50YXRpb24sIHNvCj4gPiA+IHRoYW5rcyB0byBpdHMg
b3JpZ2luYWwgYXV0aG9yIGFuZCBtYWludGFpbnRlcnM6Cj4gPiA+ICAgQmVuamFtaW4gR2FpZ25h
cmQsIExhdXJhIEFiYm90dCwgYW5kIG90aGVycyEKPiA+ID4KPiA+ID4gTk9URTogVGhpcyBwYXRj
aCBvbmx5IGFkZHMgdGhlIGRlZmF1bHQgQ01BIGhlYXAuIFdlIHdpbGwgZW5hYmxlCj4gPiA+IHNl
bGVjdGl2ZWx5IGFkZGluZyBvdGhlciBDTUEgbWVtb3J5IHJlZ2lvbnMgdG8gdGhlIGRtYWJ1ZiBo
ZWFwcwo+ID4gPiBpbnRlcmZhY2Ugd2l0aCBhIGxhdGVyIHBhdGNoICh3aGljaCByZXF1aXJlcyBh
IGR0IGJpbmRpbmcpCj4KPiBNYXliZSB3ZSBjYW4gdXNlICJuby1tYXAiIERUIHByb3BlcnR5IHRv
IHRyaWdnZXIgdGhhdC4gSWYgc2V0IGRvIG5vdCBleHBvc2UgdGhlCj4gY21hIGhlYXAuCgpJIGRv
bid0IHRoaW5rIHRoYXQncyBhIGdvb2QgcGxhbi4gU2VlIG15IFdJUCB0cmVlIGZvciB0aGUgYXBw
cm9hY2ggSSdtIHBsYW5uaW5nOgogIGh0dHBzOi8vZ2l0LmxpbmFyby5vcmcvcGVvcGxlL2pvaG4u
c3R1bHR6L2FuZHJvaWQtZGV2LmdpdC9sb2cvP2g9ZGV2L2RtYS1idWYtaGVhcC1XSVAKCnRoYW5r
cwotam9obgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
