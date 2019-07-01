Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8F0D5BD8C
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jul 2019 16:03:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9674C89C08;
	Mon,  1 Jul 2019 14:03:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8954789C03;
 Mon,  1 Jul 2019 14:03:33 +0000 (UTC)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com
 [209.85.160.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3D0C42184E;
 Mon,  1 Jul 2019 14:03:33 +0000 (UTC)
Received: by mail-qt1-f172.google.com with SMTP id h24so11709188qto.0;
 Mon, 01 Jul 2019 07:03:33 -0700 (PDT)
X-Gm-Message-State: APjAAAX9SpFB6xuJQfEOUt0Nrtb4mjY+2NgRuWJvOTm2d+N9nhCEwVGE
 2J9Smx4hSCQG0BUsnR2wp/ZCSVdLrxeGEeMp8w==
X-Google-Smtp-Source: APXvYqxIe3KvpivdXVekQQyi1JMul6lzbVRgVZQlo8hDS8fSl7EpRCjBjbxVicvn9Xjlwji3WRPz4NFznBekQ59zdyY=
X-Received: by 2002:aed:3f10:: with SMTP id p16mr20698288qtf.110.1561989812384; 
 Mon, 01 Jul 2019 07:03:32 -0700 (PDT)
MIME-Version: 1.0
References: <20190630203614.5290-1-robdclark@gmail.com>
 <20190630203614.5290-2-robdclark@gmail.com>
In-Reply-To: <20190630203614.5290-2-robdclark@gmail.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Mon, 1 Jul 2019 08:03:20 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKMULJJ9CERRBpqd7Y2dtovEJ6jcDKy6J4yR6rAdjibUg@mail.gmail.com>
Message-ID: <CAL_JsqKMULJJ9CERRBpqd7Y2dtovEJ6jcDKy6J4yR6rAdjibUg@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: chosen: document panel-id binding
To: Rob Clark <robdclark@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1561989813;
 bh=T2w/j8sYKdqu+6ydzrypjQS9JVeaNU+szoI9ecA6Qvw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=r4pN9Zh75V00tchT8/xeABJC+L4MWPT1MZxTHZGEWDk2wcRsBdcXAwSDWisLoSTNI
 1VgJ5sax1mLkviCHWwO/rLIep7TekqS6eWtrl/URRYivEc7ViMfsKkIswa/TRjs494
 IKgcJMbLBIr3w9aBduRa2S/eDEAD4MsMY8QFkyFw=
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
Cc: Rob Clark <robdclark@chromium.org>, Mark Rutland <mark.rutland@arm.com>,
 aarch64-laptops@lists.linaro.org,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, devicetree@vger.kernel.org,
 freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU3VuLCBKdW4gMzAsIDIwMTkgYXQgMjozNiBQTSBSb2IgQ2xhcmsgPHJvYmRjbGFya0BnbWFp
bC5jb20+IHdyb3RlOgo+Cj4gRnJvbTogUm9iIENsYXJrIDxyb2JkY2xhcmtAY2hyb21pdW0ub3Jn
Pgo+Cj4gVGhlIHBhbmVsLWlkIHByb3BlcnR5IGluIGNob3NlbiBjYW4gYmUgdXNlZCB0byBjb21t
dW5pY2F0ZSB3aGljaCBwYW5lbCwKPiBvZiBtdWx0aXBsZSBwb3NzaWJpbGl0aWVzLCBpcyBpbnN0
YWxsZWQuCj4KPiBTaWduZWQtb2ZmLWJ5OiBSb2IgQ2xhcmsgPHJvYmRjbGFya0BjaHJvbWl1bS5v
cmc+Cj4gLS0tCj4gIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9jaG9zZW4udHh0
IHwgNjkgKysrKysrKysrKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDY5IGluc2VydGlv
bnMoKykKCkkgbmVlZCB0byB1cGRhdGUgdGhpcyBmaWxlIHRvIHNheSBpdCdzIG1vdmVkIHRvIHRo
ZSBzY2hlbWEgcmVwb3NpdG9yeS4uLgoKQnV0IEkgZG9uJ3QgdGhpbmsgdGhhdCB3aWxsIG1hdHRl
ci4uLgoKPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2No
b3Nlbi50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvY2hvc2VuLnR4dAo+
IGluZGV4IDQ1ZTc5MTcyYTY0Ni4uZDUwMmU2NDg5YjhiIDEwMDY0NAo+IC0tLSBhL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9jaG9zZW4udHh0Cj4gKysrIGIvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Nob3Nlbi50eHQKPiBAQCAtNjgsNiArNjgsNzUgQEAgb24g
UG93ZXJQQyAic3Rkb3V0IiBpZiAic3Rkb3V0LXBhdGgiIGlzIG5vdCBmb3VuZC4gIEhvd2V2ZXIs
IHRoZQo+ICAibGludXgsc3Rkb3V0LXBhdGgiIGFuZCAic3Rkb3V0IiBwcm9wZXJ0aWVzIGFyZSBk
ZXByZWNhdGVkLiBOZXcgcGxhdGZvcm1zCj4gIHNob3VsZCBvbmx5IHVzZSB0aGUgInN0ZG91dC1w
YXRoIiBwcm9wZXJ0eS4KPgo+ICtwYW5lbC1pZAo+ICstLS0tLS0tLQo+ICsKPiArRm9yIGRldmlj
ZXMgdGhhdCBoYXZlIG11bHRpcGxlIHBvc3NpYmxlIGRpc3BsYXkgcGFuZWxzIChtdWx0aS1zb3Vy
Y2luZyB0aGUKPiArZGlzcGxheSBwYW5lbHMgaXMgY29tbW9uIG9uIGxhcHRvcHMsIHBob25lcywg
dGFibGV0cyksIHRoaXMgYWxsb3dzIHRoZQo+ICtib290bG9hZGVyIHRvIGNvbW11bmljYXRlIHdo
aWNoIHBhbmVsIGlzIGluc3RhbGxlZCwgZS5nLgoKSG93IGRvZXMgdGhlIGJvb3Rsb2FkZXIgZmln
dXJlIG91dCB3aGljaCBwYW5lbD8gV2h5IGNhbid0IHRoZSBrZXJuZWwKZG8gdGhlIHNhbWUgdGhp
bmc/Cgo+ICsKPiArLyB7Cj4gKyAgICAgICBjaG9zZW4gewo+ICsgICAgICAgICAgICAgICBwYW5l
bC1pZCA9IDwweGM0PjsKPiArICAgICAgIH07Cj4gKwo+ICsgICAgICAgaXZvX3BhbmVsIHsKPiAr
ICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJpdm8sbTEzM253ZjQtcjAiOwo+ICsgICAgICAg
ICAgICAgICBwb3dlci1zdXBwbHkgPSA8JnZsY21fM3YzPjsKPiArICAgICAgICAgICAgICAgbm8t
aHBkOwo+ICsKPiArICAgICAgICAgICAgICAgcG9ydHMgewo+ICsgICAgICAgICAgICAgICAgICAg
ICAgIHBvcnQgewo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaXZvX3BhbmVsX2lu
X2VkcDogZW5kcG9pbnQgewo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICByZW1vdGUtZW5kcG9pbnQgPSA8JnNuNjVkc2k4Nl9vdXRfaXZvPjsKPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIH07Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgfTsKPiArICAg
ICAgICAgICAgICAgfTsKPiArICAgICAgIH07Cj4gKwo+ICsgICAgICAgYm9lX3BhbmVsIHsKPiAr
ICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJib2UsbnYxMzNmaG0tbjYxIjsKCkJvdGggcGFu
ZWxzIGFyZSBnb2luZyB0byBwcm9iZS4gU28gdGhlIGJvb3Rsb2FkZXIgbmVlZHMgdG8gZGlzYWJs
ZSB0aGUKbm90IHBvcHVsYXRlZCBwYW5lbCBzZXR0aW5nICdzdGF0dXMnIChvciBkZWxldGUgdGhl
IG5vZGUpLiBJZiB5b3UgZG8KdGhhdCwgZG8geW91IGV2ZW4gbmVlZCAncGFuZWwtaWQnPwoKPiAr
ICAgICAgICAgICAgICAgcG93ZXItc3VwcGx5ID0gPCZ2bGNtXzN2Mz47Cj4gKyAgICAgICAgICAg
ICAgIG5vLWhwZDsKPiArCj4gKyAgICAgICAgICAgICAgIHBvcnRzIHsKPiArICAgICAgICAgICAg
ICAgICAgICAgICBwb3J0IHsKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJvZV9w
YW5lbF9pbl9lZHA6IGVuZHBvaW50IHsKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgcmVtb3RlLWVuZHBvaW50ID0gPCZzbjY1ZHNpODZfb3V0X2JvZT47Cj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICB9Owo+ICsgICAgICAgICAgICAgICAgICAgICAgIH07
Cj4gKyAgICAgICAgICAgICAgIH07Cj4gKyAgICAgICB9Owo+ICsKPiArICAgICAgIGRpc3BsYXlf
b3JfYnJpZGdlX2RldmljZSB7Cj4gKwo+ICsgICAgICAgICAgICAgICBwb3J0cyB7Cj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8MT47Cj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgI3NpemUtY2VsbHMgPSA8MD47Cj4gKwo+ICsgICAgICAgICAgICAgICAgICAgICAg
IC4uLgo+ICsKPiArICAgICAgICAgICAgICAgICAgICAgICBwb3J0QDAgewo+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8MT47Cj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAjc2l6ZS1jZWxscyA9IDwwPjsKPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHJlZyA9IDwwPjsKPiArCj4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBlbmRwb2ludEBjNCB7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHJlZyA9IDwweGM0PjsKCldoYXQgZG9lcyB0aGlzIG51bWJlciByZXByZXNlbnQ/IEl0
IGlzIHN1cHBvc2VkIHRvIGJlIGRlZmluZWQgYnkgdGhlCmRpc3BsYXlfb3JfYnJpZGdlX2Rldmlj
ZSwgbm90IGEgc3BlY2lmaWMgcGFuZWwuCgpXZSBhbHNvIG5lZWQgdG8gY29uc2lkZXIgaG93IHRo
ZSBEU0kgY2FzZSB3aXRoIHBhbmVscyBhcyBjaGlsZHJlbiBvZgp0aGUgRFNJIGNvbnRyb2xsZXIg
d291bGQgd29yayBhbmQgaG93IHRoaXMgd291bGQgd29yayB3aXRoIG11bHRpcGxlCmRpc3BsYXlz
IGVhY2ggaGF2aW5nIG11bHRpcGxlIHBhbmVsIG9wdGlvbnMuCgpSb2IKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
