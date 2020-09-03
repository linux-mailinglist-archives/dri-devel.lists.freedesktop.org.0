Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AACB425C0DA
	for <lists+dri-devel@lfdr.de>; Thu,  3 Sep 2020 14:22:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7881D6E9DB;
	Thu,  3 Sep 2020 12:22:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C2D56E1D6
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Sep 2020 12:22:13 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id w3so3416621ljo.5
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Sep 2020 05:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=AmASOpjxirKUPe5KF2kTy+958y5fGEm2GLzYZrAWmY0=;
 b=i0y2uYMmTvexrD5BT2Rg+2fR0wxA2Yuw2kq4ZFSIPgBWPk+zTIRox7tLo/V7J1IDcg
 /zGL+yZo0kczuHH1lpR6RfLpnpsjbK1Xp0ad2DHuWiTiwIFLLDyXSUCe+EHEXlAi3p/e
 pUr+iDCt5+xuvOEFlzj81oBsxg91JWPrhoQrh/NEf6k/eN5Qg/a80myuftRM/DW9XmNC
 ipV330QqlNcjkmijfbJW8+o9rHOfLN3FmFatTgkTg9EzG5KQ3wG5MwH0rOaFzRGEbvkH
 hEhTtGPWREF3ecaEB8e8krjUDxI3vOI+oVG2I+4TqSvovZEv6c27pjXJC4dege2SgzxD
 u2CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=AmASOpjxirKUPe5KF2kTy+958y5fGEm2GLzYZrAWmY0=;
 b=ldf+rS+PmueeaZydS3m9tQuErNNMdx+NzLDoqH1RgO7iDlTpKHL209K+beRMrALTem
 qMIceyPadOqd/a7f3X1SlY2BfTCysGlzg56jHYYYeFshEq52amz7fLx0kKUmtbin6wgg
 2LUj26GeiwK5RJrQLrArpoc+v14pkpAxa6ElNzzuNlp85CH14ExdkubCw2bs01LamlIs
 Oq/jytS1ot3e9+t8qd6BZYAKxre8rXEXZ8uaXZNj6vZIc4rP2MB5z+p0yEcCuzVaJKMZ
 3uwMWRmDzSeyiZ2guZphPLGAIpwFPToyKp28tajM+n417pkdT1RUnXDI/Gkl6LjTp/UJ
 lYZQ==
X-Gm-Message-State: AOAM531bwxK2dSyBl0jQydGEQ9+6xOjgp4fFjm+Y1I6+9OQOaltcgVzN
 jWR3ckagGncV0yzOQsim1AmBvDRJkR6XC9y7ZWpYWbHJ7yVcJA==
X-Google-Smtp-Source: ABdhPJwQ0KpxtLPZAseSnphNEoFuICKHObdYRxY2PW9uBsaYw3EIqCfxJnx9Lxv1GfE40giqNWLH6sOOChl2QA2RQ2I=
X-Received: by 2002:a2e:b892:: with SMTP id r18mr1073176ljp.249.1599135731427; 
 Thu, 03 Sep 2020 05:22:11 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1598331148.git.joe@perches.com>
 <990bf6f33ccaf73ad56eb4bea8bd2c0db5e90a31.1598331148.git.joe@perches.com>
 <d5ea3bc7-bff2-c702-51ed-cb85767824a7@amd.com>
In-Reply-To: <d5ea3bc7-bff2-c702-51ed-cb85767824a7@amd.com>
From: Sumit Semwal <sumit.semwal@linaro.org>
Date: Thu, 3 Sep 2020 17:51:59 +0530
Message-ID: <CAO_48GGeXrDe9F1S64pf4qeF-2vMMiwOTZXOXDctAdPO5Pn04w@mail.gmail.com>
Subject: Re: [PATCH 08/29] dma-buf: Avoid comma separated statements
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: Jiri Kosina <trivial@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Linaro MM SIG <linaro-mm-sig@lists.linaro.org>, Joe Perches <joe@perches.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGVsbG8gSm9lLAoKT24gV2VkLCAyNiBBdWcgMjAyMCBhdCAyMDozOCwgQ2hyaXN0aWFuIEvDtm5p
ZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPiB3cm90ZToKPgo+IEFtIDI1LjA4LjIwIHVtIDA2
OjU2IHNjaHJpZWIgSm9lIFBlcmNoZXM6Cj4gPiBVc2Ugc2VtaWNvbG9ucyBhbmQgYnJhY2VzLgo+
ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEpvZSBQZXJjaGVzIDxqb2VAcGVyY2hlcy5jb20+Cj4KPiBB
Y2tlZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgpGV0lX
LApBY2tlZC1ieTogU3VtaXQgU2Vtd2FsIDxzdW1pdC5zZW13YWxAbGluYXJvLm9yZz4KCj4KPiA+
IC0tLQo+ID4gICBkcml2ZXJzL2RtYS1idWYvc3QtZG1hLWZlbmNlLmMgfCA3ICsrKysrLS0KPiA+
ICAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiA+Cj4g
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9kbWEtYnVmL3N0LWRtYS1mZW5jZS5jIGIvZHJpdmVycy9k
bWEtYnVmL3N0LWRtYS1mZW5jZS5jCj4gPiBpbmRleCBlNTkzMDY0MzQxYzguLmM4YTEyZDdhZDcx
YSAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvZG1hLWJ1Zi9zdC1kbWEtZmVuY2UuYwo+ID4gKysr
IGIvZHJpdmVycy9kbWEtYnVmL3N0LWRtYS1mZW5jZS5jCj4gPiBAQCAtNDcxLDggKzQ3MSwxMSBA
QCBzdGF0aWMgaW50IHRocmVhZF9zaWduYWxfY2FsbGJhY2sodm9pZCAqYXJnKQo+ID4gICAgICAg
ICAgICAgICAgICAgICAgIGRtYV9mZW5jZV9zaWduYWwoZjEpOwo+ID4KPiA+ICAgICAgICAgICAg
ICAgc21wX3N0b3JlX21iKGNiLnNlZW4sIGZhbHNlKTsKPiA+IC0gICAgICAgICAgICAgaWYgKCFm
MiB8fCBkbWFfZmVuY2VfYWRkX2NhbGxiYWNrKGYyLCAmY2IuY2IsIHNpbXBsZV9jYWxsYmFjaykp
Cj4gPiAtICAgICAgICAgICAgICAgICAgICAgbWlzcysrLCBjYi5zZWVuID0gdHJ1ZTsKPiA+ICsg
ICAgICAgICAgICAgaWYgKCFmMiB8fAo+ID4gKyAgICAgICAgICAgICAgICAgZG1hX2ZlbmNlX2Fk
ZF9jYWxsYmFjayhmMiwgJmNiLmNiLCBzaW1wbGVfY2FsbGJhY2spKSB7Cj4gPiArICAgICAgICAg
ICAgICAgICAgICAgbWlzcysrOwo+ID4gKyAgICAgICAgICAgICAgICAgICAgIGNiLnNlZW4gPSB0
cnVlOwo+ID4gKyAgICAgICAgICAgICB9Cj4gPgo+ID4gICAgICAgICAgICAgICBpZiAoIXQtPmJl
Zm9yZSkKPiA+ICAgICAgICAgICAgICAgICAgICAgICBkbWFfZmVuY2Vfc2lnbmFsKGYxKTsKPgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
