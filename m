Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABAB92FFDAC
	for <lists+dri-devel@lfdr.de>; Fri, 22 Jan 2021 08:56:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B29A6E215;
	Fri, 22 Jan 2021 07:56:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4682A6E215
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Jan 2021 07:56:42 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id q12so6258042lfo.12
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jan 2021 23:56:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=f2zRDUhBwnVP7tCaaBYDyBHO3WlC21+sK4f4qAGJOCI=;
 b=ooLdJkATi6/2fEB5idp2CRg5f3UiIOidhHf3ayOHeKjzppxkT0HkFh1Qpt0+cx2scW
 9TRsscg8UxCHBswLJk3rlH+y2AU+wqUJbRDxCcs2PU6F/Fl9Q1XghsLC0Im+Yb4S2H5I
 n1s6qqC3k+2t6r/GL0itPdpmTPBXjXfxS1UWz908azcwM1jJHQFBYOqmnhqBUGBw0HD9
 J0CSEqdsJAOvna2Q56Y9w9g91cBA18gOe/aXbr/RVSEVgzlWiM5lvWlFY2alEyykArkq
 JcBiUItzm89cgvg5yLmWhiUajU/rFsvwNxy7Iv1d5gT5s08tweA4y6yqT9ErV1YVjCaw
 x6nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=f2zRDUhBwnVP7tCaaBYDyBHO3WlC21+sK4f4qAGJOCI=;
 b=F3Hcp86GZ4FnEmEyd68yh50MYHWibgbfSJG5WMZoA0nnFY3G49Wtr52IdLL1d5EsCd
 Z5Y/JroNX+68b2RLLKEajn+z2Vtz0RlpSI4nWSWeht/9RzUkbV98Lli5DzsX9Yf9UxgY
 8VR4rR9PLdnK+NdfDP/Vc70EmhSGFjtuvgr0y/HHqwjGyYCIZGqoET6P47XhtfLOOLi8
 hUcgbjbKP810tvC2jadl0ZkVod9WtD1vKlNQXrPLoDeePHura5jqYsQovX0bJIWsnA35
 5/NzlgUoEbafin7x3DkcZbpZ7RnhIuYp6f8t1mx72rn+o6X3JsN5VYuR+hBSCSkK3dos
 AyoQ==
X-Gm-Message-State: AOAM5339SypO81R/NvEpvsfKMjsJNH19xJtyo1F7BMsw6/zXiUbPnP0S
 +6AdSFy6pD8cOA2kyt1j9pjvDkK4KcFh83ftpdFEKg==
X-Google-Smtp-Source: ABdhPJzDdNdouQ4GUOqShkAT1c4FUePpXmAYA00uB0PATJCkEJiA7J+aoxHR1CgglxjxPNR15g3wHTQl2OKZ+YzEjxU=
X-Received: by 2002:a19:7616:: with SMTP id c22mr25218lff.550.1611302200416;
 Thu, 21 Jan 2021 23:56:40 -0800 (PST)
MIME-Version: 1.0
References: <20210119204508.9256-1-john.stultz@linaro.org>
 <20210119204508.9256-2-john.stultz@linaro.org>
In-Reply-To: <20210119204508.9256-2-john.stultz@linaro.org>
From: Sumit Semwal <sumit.semwal@linaro.org>
Date: Fri, 22 Jan 2021 13:26:29 +0530
Message-ID: <CAO_48GEYGzY8cZybwrXgfODhuoAJqi4AvwbZbWd+PiYjMqKYpw@mail.gmail.com>
Subject: Re: [RESEND][PATCH 2/3] dma-buf: heaps: Add a WARN_ON should the
 vmap_cnt go negative
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

SGkgSm9obiwgU3VyZW4sCgoKT24gV2VkLCAyMCBKYW4gMjAyMSBhdCAwMjoxNSwgSm9obiBTdHVs
dHogPGpvaG4uc3R1bHR6QGxpbmFyby5vcmc+IHdyb3RlOgo+Cj4gV2Ugc2hvdWxkbid0IHZ1bm1h
cCBtb3JlIHRoZW4gd2Ugdm1hcCwgYnV0IGlmIHdlIGRvLCBtYWtlCj4gc3VyZSB3ZSBjb21wbGFp
biBsb3VkbHkuCgpJIHdhcyBjaGVja2luZyB0aGUgZ2VuZXJhbCB1c2FnZSBvZiB2dW5tYXAgaW4g
dGhlIGtlcm5lbCwgYW5kIEkKY291bGRuJ3QgZmluZCBtYW55IGluc3RhbmNlcyB3aGVyZSB3ZSBu
ZWVkIHRvIFdBUk5fT04gZm9yIHRoZSB2dW5tYXAKY291bnQgbW9yZSB0aGFuIHZtYXAgY291bnQu
IElzIHRoZXJlIGEgc3BlY2lmaWMgbmVlZCBmb3IgdGhpcyBpbiB0aGUgaGVhcHM/CgpCZXN0LApT
dW1pdC4KPgo+IENjOiBTdW1pdCBTZW13YWwgPHN1bWl0LnNlbXdhbEBsaW5hcm8ub3JnPgo+IENj
OiBMaWFtIE1hcmsgPGxtYXJrQGNvZGVhdXJvcmEub3JnPgo+IENjOiBMYXVyYSBBYmJvdHQgPGxh
YmJvdHRAa2VybmVsLm9yZz4KPiBDYzogQnJpYW4gU3RhcmtleSA8QnJpYW4uU3RhcmtleUBhcm0u
Y29tPgo+IENjOiBIcmlkeWEgVmFsc2FyYWp1IDxocmlkeWFAZ29vZ2xlLmNvbT4KPiBDYzogU3Vy
ZW4gQmFnaGRhc2FyeWFuIDxzdXJlbmJAZ29vZ2xlLmNvbT4KPiBDYzogU2FuZGVlcCBQYXRpbCA8
c3NwYXRpbEBnb29nbGUuY29tPgo+IENjOiBEYW5pZWwgTWVudHogPGRhbmllbG1lbnR6QGdvb2ds
ZS5jb20+Cj4gQ2M6IENocmlzIEdvbGRzd29ydGh5IDxjZ29sZHN3b0Bjb2RlYXVyb3JhLm9yZz4K
PiBDYzogw5hyamFuIEVpZGUgPG9yamFuLmVpZGVAYXJtLmNvbT4KPiBDYzogUm9iaW4gTXVycGh5
IDxyb2Jpbi5tdXJwaHlAYXJtLmNvbT4KPiBDYzogRXplcXVpZWwgR2FyY2lhIDxlemVxdWllbEBj
b2xsYWJvcmEuY29tPgo+IENjOiBTaW1vbiBTZXIgPGNvbnRhY3RAZW1lcnNpb24uZnI+Cj4gQ2M6
IEphbWVzIEpvbmVzIDxqYWpvbmVzQG52aWRpYS5jb20+Cj4gQ2M6IGxpbnV4LW1lZGlhQHZnZXIu
a2VybmVsLm9yZwo+IENjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gU3VnZ2Vz
dGVkLWJ5OiBTdXJlbiBCYWdoZGFzYXJ5YW4gPHN1cmVuYkBnb29nbGUuY29tPgo+IFNpZ25lZC1v
ZmYtYnk6IEpvaG4gU3R1bHR6IDxqb2huLnN0dWx0ekBsaW5hcm8ub3JnPgo+IC0tLQo+ICBkcml2
ZXJzL2RtYS1idWYvaGVhcHMvY21hX2hlYXAuYyAgICB8IDEgKwo+ICBkcml2ZXJzL2RtYS1idWYv
aGVhcHMvc3lzdGVtX2hlYXAuYyB8IDEgKwo+ICAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9u
cygrKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZG1hLWJ1Zi9oZWFwcy9jbWFfaGVhcC5jIGIv
ZHJpdmVycy9kbWEtYnVmL2hlYXBzL2NtYV9oZWFwLmMKPiBpbmRleCAzNjRmYzJmM2U0OTkuLjBj
NzZjYmMzZmIxMSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2RtYS1idWYvaGVhcHMvY21hX2hlYXAu
Ywo+ICsrKyBiL2RyaXZlcnMvZG1hLWJ1Zi9oZWFwcy9jbWFfaGVhcC5jCj4gQEAgLTIzMiw2ICsy
MzIsNyBAQCBzdGF0aWMgdm9pZCBjbWFfaGVhcF92dW5tYXAoc3RydWN0IGRtYV9idWYgKmRtYWJ1
Ziwgc3RydWN0IGRtYV9idWZfbWFwICptYXApCj4gICAgICAgICBzdHJ1Y3QgY21hX2hlYXBfYnVm
ZmVyICpidWZmZXIgPSBkbWFidWYtPnByaXY7Cj4KPiAgICAgICAgIG11dGV4X2xvY2soJmJ1ZmZl
ci0+bG9jayk7Cj4gKyAgICAgICBXQVJOX09OKGJ1ZmZlci0+dm1hcF9jbnQgPT0gMCk7Cj4gICAg
ICAgICBpZiAoIS0tYnVmZmVyLT52bWFwX2NudCkgewo+ICAgICAgICAgICAgICAgICB2dW5tYXAo
YnVmZmVyLT52YWRkcik7Cj4gICAgICAgICAgICAgICAgIGJ1ZmZlci0+dmFkZHIgPSBOVUxMOwo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2RtYS1idWYvaGVhcHMvc3lzdGVtX2hlYXAuYyBiL2RyaXZl
cnMvZG1hLWJ1Zi9oZWFwcy9zeXN0ZW1faGVhcC5jCj4gaW5kZXggNDA1MzUxYWFkMmE4Li4yMzIx
YzkxODkxZjYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9kbWEtYnVmL2hlYXBzL3N5c3RlbV9oZWFw
LmMKPiArKysgYi9kcml2ZXJzL2RtYS1idWYvaGVhcHMvc3lzdGVtX2hlYXAuYwo+IEBAIC0yNzMs
NiArMjczLDcgQEAgc3RhdGljIHZvaWQgc3lzdGVtX2hlYXBfdnVubWFwKHN0cnVjdCBkbWFfYnVm
ICpkbWFidWYsIHN0cnVjdCBkbWFfYnVmX21hcCAqbWFwKQo+ICAgICAgICAgc3RydWN0IHN5c3Rl
bV9oZWFwX2J1ZmZlciAqYnVmZmVyID0gZG1hYnVmLT5wcml2Owo+Cj4gICAgICAgICBtdXRleF9s
b2NrKCZidWZmZXItPmxvY2spOwo+ICsgICAgICAgV0FSTl9PTihidWZmZXItPnZtYXBfY250ID09
IDApOwo+ICAgICAgICAgaWYgKCEtLWJ1ZmZlci0+dm1hcF9jbnQpIHsKPiAgICAgICAgICAgICAg
ICAgdnVubWFwKGJ1ZmZlci0+dmFkZHIpOwo+ICAgICAgICAgICAgICAgICBidWZmZXItPnZhZGRy
ID0gTlVMTDsKPiAtLQo+IDIuMTcuMQo+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbAo=
