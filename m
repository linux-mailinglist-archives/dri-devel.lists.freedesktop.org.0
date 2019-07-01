Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF20D5C3C3
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jul 2019 21:45:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8099789BBD;
	Mon,  1 Jul 2019 19:45:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAB3A89BAF;
 Mon,  1 Jul 2019 19:45:54 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id k8so24878723edr.11;
 Mon, 01 Jul 2019 12:45:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wYt+ewXSszrhV0/c2X8NnRDiNI3d5oiddfdOVtTGEv4=;
 b=kOUmEyl4wY/vJYXXsc2GmhSHEpnVmPqspW+70NBxdrZmdauUWjOPunnz4pFG4xJ42e
 Mchr5OHI3XzHOQe0tnrxEUkZnzCUzvT/DJkIMvHt4SELr508oIsvSo5LZKBj/+R+Yi7d
 WPdcFeTtyCGXBvE9F7OQBcHa72G4H3M7aKGXTtrf/IePj9sH2ygFO3qjf30LCb2Ymwcz
 tW7reI8cKiIrlbASjG9ZA/kV3cABVAQPAvseP5XBsYU4FAUt7HSbDI/6Cv8pBJ6a3O/L
 1YiKLFWE0Dl5kY4SFa3LPKwfaeFqwABhae/VwprintVZOjymcCO1DvV+qOuicWKPpaGT
 V21w==
X-Gm-Message-State: APjAAAUATaSpPworup6O6FtvAbU04xXuX+dl8Bf58kwuepFxMXVOg+34
 IZmmamKIwTt80hXdM/eFX0PEa03Gt2AgznCfhrY=
X-Google-Smtp-Source: APXvYqzmQmIl2B93LwDgt2BUXvj32T8pqLfXA1PfXNu7QlmdutC1F2lXsilw4UmzTuobGJsgzukwDitPiyJKtGG6OpY=
X-Received: by 2002:a50:8bfd:: with SMTP id n58mr31055135edn.272.1562010353531; 
 Mon, 01 Jul 2019 12:45:53 -0700 (PDT)
MIME-Version: 1.0
References: <20190701173907.15494-1-jeffrey.l.hugo@gmail.com>
In-Reply-To: <20190701173907.15494-1-jeffrey.l.hugo@gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 1 Jul 2019 12:45:38 -0700
Message-ID: <CAF6AEGu=Pv5mCKA7QDVGPjhFShmD2cfKWNZk26PTQSSQzbzKXA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/mdp5: Use drm_device for creating gem address
 space
To: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=wYt+ewXSszrhV0/c2X8NnRDiNI3d5oiddfdOVtTGEv4=;
 b=OTEwuu7vihjB71E/nIGCfIEuAUae12z379sL2OcZplfhBCkJ/5py4ReiPBH3cOGMcC
 wSbZsO2UpnITz4pleUww2L0E48/p3edkgBngqpQNrigk/GfTILqWzT6hblKHq2gFqjpC
 ZURhOgAcj4++trVqK9lWHNPhdwYVWZIVc3ZHDOq7HXgrBANMYzyJrPYQxwScRoQjD+7K
 gWJ6JFpAhoAyNe6DFinGjvg4MhF7N/9roWXA8yCzip8uK83RsuZHDqNqrE8RpA0VypzW
 SuQeAkaoYTjHsKUCBJZi8TL52/sF3AYgrdjQeC9pGl9r8QSYtzyaliB6XgWqblyo0D8y
 V1Zw==
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
Cc: freedreno <freedreno@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKdWwgMSwgMjAxOSBhdCAxMDozOSBBTSBKZWZmcmV5IEh1Z28gPGplZmZyZXkubC5o
dWdvQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBDcmVhdGluZyB0aGUgbXNtIGdlbSBhZGRyZXNzIHNw
YWNlIHJlcXVpcmVzIGEgcmVmZXJlbmNlIHRvIHRoZSBkZXYgd2hlcmUKPiB0aGUgaW9tbXUgaXMg
bG9jYXRlZC4gIFRoZSBkcml2ZXIgY3VycmVudGx5IGFzc3VtZXMgdGhpcyBpcyB0aGUgc2FtZSBh
cwo+IHRoZSBwbGF0Zm9ybSBkZXZpY2UsIHdoaWNoIGJyZWFrcyB3aGVuIHRoZSBpb21tdSBpcyBv
dXRzaWRlIG9mIHRoZQo+IHBsYXRmb3JtIGRldmljZS4gIFVzZSB0aGUgZHJtX2RldmljZSBpbnN0
ZWFkLCB3aGljaCBoYXBwZW5zIHRvIGFsd2F5cyBoYXZlCj4gYSByZWZlcmVuY2UgdG8gdGhlIHBy
b3BlciBkZXZpY2UuCj4KPiBTaWduZWQtb2ZmLWJ5OiBKZWZmcmV5IEh1Z28gPGplZmZyZXkubC5o
dWdvQGdtYWlsLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL21kcDUvbWRw
NV9rbXMuYyB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0
aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL21kcDUvbWRw
NV9rbXMuYyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9tZHA1L21kcDVfa21zLmMKPiBpbmRl
eCA0YTYwZjVmY2E2YjAuLjEzNDdhNTIyMzkxOCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vbXNtL2Rpc3AvbWRwNS9tZHA1X2ttcy5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21zbS9k
aXNwL21kcDUvbWRwNV9rbXMuYwo+IEBAIC03MDIsNyArNzAyLDcgQEAgc3RydWN0IG1zbV9rbXMg
Km1kcDVfa21zX2luaXQoc3RydWN0IGRybV9kZXZpY2UgKmRldikKPiAgICAgICAgIG1kZWxheSgx
Nik7Cj4KPiAgICAgICAgIGlmIChjb25maWctPnBsYXRmb3JtLmlvbW11KSB7Cj4gLSAgICAgICAg
ICAgICAgIGFzcGFjZSA9IG1zbV9nZW1fYWRkcmVzc19zcGFjZV9jcmVhdGUoJnBkZXYtPmRldiwK
PiArICAgICAgICAgICAgICAgYXNwYWNlID0gbXNtX2dlbV9hZGRyZXNzX3NwYWNlX2NyZWF0ZShk
ZXYtPmRldiwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbmZpZy0+cGxhdGZv
cm0uaW9tbXUsICJtZHA1Iik7CgpobW0sIGRvIHlvdSBoYXZlIGEgdHJlZSBzb21ld2hlcmUgd2l0
aCB5b3VyIGR0IGZpbGVzPyAgVGhpcyBtYWtlcyBtZQp0aGluayB0aGUgZGlzcGxheSBpb21tdSBp
cyBob29rZWQgdXAgc29tZXdoZXJlIGRpZmZlcmVudGx5IGNvbXBhcmVkCnRvLCBzYXksIG1zbTg5
MTYuZHRzaQoKQlIsCi1SCgo+ICAgICAgICAgICAgICAgICBpZiAoSVNfRVJSKGFzcGFjZSkpIHsK
PiAgICAgICAgICAgICAgICAgICAgICAgICByZXQgPSBQVFJfRVJSKGFzcGFjZSk7Cj4gLS0KPiAy
LjE3LjEKPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
