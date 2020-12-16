Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D36E2DC5C4
	for <lists+dri-devel@lfdr.de>; Wed, 16 Dec 2020 18:57:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5679589A5E;
	Wed, 16 Dec 2020 17:57:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02E7D89AC0
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Dec 2020 17:57:50 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id u18so50579918lfd.9
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Dec 2020 09:57:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=3ZAA26HLG36Xvu0N7Lw9uUcJ1NvzFfW1dGKLX9h8st0=;
 b=JCF0T0BdODPAh9sgJ0Dbubl6gNI0wTOnfeA1T8bbhNeo4Vdg0ZcFBOsPWNhOsF0Nrb
 1uxgjazlpeN28DWB8onxe+uttiZ4WdgiQF/Z/hkz0JVHGKR8LveLBh3U6msHCD6KzhAE
 Kpo+GSw98uqa7eMuQ4zw7Bkai/n2qV0oPMn3ACiMf9UFrVlUv47zskfzOpBbKST+Tg2i
 xA6/UXlcrTrl3Xj7jEzqmU9/zq4GX81slNt0zdoGXz2DGwVxjt1rz7o+fOTdcHpstuB+
 l8kcyn+4nf19fOG7jXArN0uKS+OAoyWkx28Qo1ZNAQzARyAPJj1YgL1Slows/ghyHmNU
 13fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=3ZAA26HLG36Xvu0N7Lw9uUcJ1NvzFfW1dGKLX9h8st0=;
 b=rnTeDbUuiQIu6HQi4Xb+UNWwx2cr7RC7SV2qJ4lofQuOZZZg3F6dSsnZcpYpmdz7n2
 0pBo80sJldI+22DqFC2ejEz2H1dzV0qaTu74ITATFoGxgraHjagRc8JZ/evvi0wMwJjq
 SsDhht56IvclliRmpyKuyVgkpGiRvkC3ze00sTc2BecTHW6ejdshNfSG1EaiAILGZgXV
 /2z9DIBoZIfku1l2IqI2bnbFnSTHz9n7oBkmiE++5Wo2o17KxnQ3Xy9NK3lADjg+dfT0
 nJ8HIRa7HQ1CDgUV+HyFGYO2iDEvZLbveoULzWzpik7Mxqh9qnOnVpOJhYOSz1+Z8aOV
 ZCGA==
X-Gm-Message-State: AOAM531z9YCXPQklrCq/dCgBUANHgK96StpMDqYpo4y0LypgMLOhSQmP
 GAFGx4DpTX5IT6AqvHPb4qEc/ckJ96VTP+Gz7EHkBg==
X-Google-Smtp-Source: ABdhPJw5c3OCJIuoNhHcuvnrQn7/ICbS3gk2kd2nIfl23ui/Q3VovlTktYiHjFn9OPyAOKgVVUNg5KEldFqYcRrHNvQ=
X-Received: by 2002:a19:8c8:: with SMTP id 191mr12977544lfi.492.1608141469335; 
 Wed, 16 Dec 2020 09:57:49 -0800 (PST)
MIME-Version: 1.0
References: <20201215235334.GA227480@roeck-us.net>
 <20201216004931.113505-1-john.stultz@linaro.org>
In-Reply-To: <20201216004931.113505-1-john.stultz@linaro.org>
From: Sumit Semwal <sumit.semwal@linaro.org>
Date: Wed, 16 Dec 2020 23:27:37 +0530
Message-ID: <CAO_48GGgK8uAVb7pBvusX8ZkQ1B0op4PmqYt7246ZH62aM7J8A@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: cma_heap: Include linux/vmalloc.h to fix build
 failures on MIPS
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

SGkgSm9obiwKCgpPbiBXZWQsIDE2IERlYyAyMDIwIGF0IDA2OjE5LCBKb2huIFN0dWx0eiA8am9o
bi5zdHVsdHpAbGluYXJvLm9yZz4gd3JvdGU6Cj4KPiBXZSBuZWVkIHRvIGluY2x1ZGUgPGxpbnV4
L3ZtYWxsb2MuaD4gaW4gb3JkZXIgZm9yIE1JUFMgdG8gZmluZAo+IHZtYXAoKSwgYXMgaXQgZG9l
c24ndCBvdGhlcndpc2UgZ2V0IGluY2x1ZGVkIHRoZXJlLgo+Cj4gV2l0aG91dCB0aGlzIHBhdGNo
LCBvbmUgY2FuIGhpdCB0aGUgZm9sbG93aW5nIGJ1aWxkIGVycm9yOgo+ICAgZHJpdmVycy9kbWEt
YnVmL2hlYXBzL2NtYV9oZWFwLmM6IEluIGZ1bmN0aW9uICdjbWFfaGVhcF9kb192bWFwJzoKPiAg
IGRyaXZlcnMvZG1hLWJ1Zi9oZWFwcy9jbWFfaGVhcC5jOjE5NToxMDogZXJyb3I6IGltcGxpY2l0
IGRlY2xhcmF0aW9uIG9mIGZ1bmN0aW9uICd2bWFwJwoKVGhhbmtzIGZvciB0aGUgcGF0Y2g7IEkn
dmUgbWVyZ2VkIGl0IHRvIGRybS1taXNjLW5leHQtZml4ZXMuCgo+Cj4gQ2M6IFN1bWl0IFNlbXdh
bCA8c3VtaXQuc2Vtd2FsQGxpbmFyby5vcmc+Cj4gQ2M6IExpYW0gTWFyayA8bG1hcmtAY29kZWF1
cm9yYS5vcmc+Cj4gQ2M6IExhdXJhIEFiYm90dCA8bGFiYm90dEBrZXJuZWwub3JnPgo+IENjOiBC
cmlhbiBTdGFya2V5IDxCcmlhbi5TdGFya2V5QGFybS5jb20+Cj4gQ2M6IEhyaWR5YSBWYWxzYXJh
anUgPGhyaWR5YUBnb29nbGUuY29tPgo+IENjOiBTdXJlbiBCYWdoZGFzYXJ5YW4gPHN1cmVuYkBn
b29nbGUuY29tPgo+IENjOiBTYW5kZWVwIFBhdGlsIDxzc3BhdGlsQGdvb2dsZS5jb20+Cj4gQ2M6
IERhbmllbCBNZW50eiA8ZGFuaWVsbWVudHpAZ29vZ2xlLmNvbT4KPiBDYzogQ2hyaXMgR29sZHN3
b3J0aHkgPGNnb2xkc3dvQGNvZGVhdXJvcmEub3JnPgo+IENjOiDDmHJqYW4gRWlkZSA8b3JqYW4u
ZWlkZUBhcm0uY29tPgo+IENjOiBSb2JpbiBNdXJwaHkgPHJvYmluLm11cnBoeUBhcm0uY29tPgo+
IENjOiBFemVxdWllbCBHYXJjaWEgPGV6ZXF1aWVsQGNvbGxhYm9yYS5jb20+Cj4gQ2M6IFNpbW9u
IFNlciA8Y29udGFjdEBlbWVyc2lvbi5mcj4KPiBDYzogSmFtZXMgSm9uZXMgPGpham9uZXNAbnZp
ZGlhLmNvbT4KPiBDYzogbGludXgtbWVkaWFAdmdlci5rZXJuZWwub3JnCj4gQ2M6IGRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBGaXhlczogYTVkMmQyOWUyNGJlICgiZG1hLWJ1Zjog
aGVhcHM6IE1vdmUgaGVhcC1oZWxwZXIgbG9naWMgaW50byB0aGUgY21hX2hlYXAgaW1wbGVtZW50
YXRpb24iKQo+IFJlcG9ydGVkLWJ5OiBHdWVudGVyIFJvZWNrIDxsaW51eEByb2Vjay11cy5uZXQ+
Cj4gU2lnbmVkLW9mZi1ieTogSm9obiBTdHVsdHogPGpvaG4uc3R1bHR6QGxpbmFyby5vcmc+Cj4g
LS0tCj4gIGRyaXZlcnMvZG1hLWJ1Zi9oZWFwcy9jbWFfaGVhcC5jIHwgMSArCj4gIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZG1hLWJ1Zi9o
ZWFwcy9jbWFfaGVhcC5jIGIvZHJpdmVycy9kbWEtYnVmL2hlYXBzL2NtYV9oZWFwLmMKPiBpbmRl
eCA1ZTdjMzQzNjMxMGMuLjNjNGUzNDMwMTE3MiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2RtYS1i
dWYvaGVhcHMvY21hX2hlYXAuYwo+ICsrKyBiL2RyaXZlcnMvZG1hLWJ1Zi9oZWFwcy9jbWFfaGVh
cC5jCj4gQEAgLTIwLDYgKzIwLDcgQEAKPiAgI2luY2x1ZGUgPGxpbnV4L21vZHVsZS5oPgo+ICAj
aW5jbHVkZSA8bGludXgvc2NhdHRlcmxpc3QuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L3NsYWIuaD4K
PiArI2luY2x1ZGUgPGxpbnV4L3ZtYWxsb2MuaD4KPgo+Cj4gIHN0cnVjdCBjbWFfaGVhcCB7Cj4g
LS0KPiAyLjE3LjEKPgpCZXN0LApTdW1pdC4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVsCg==
