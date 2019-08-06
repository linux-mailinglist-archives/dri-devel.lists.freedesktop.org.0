Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6354B845C1
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2019 09:27:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 099FA6E65E;
	Wed,  7 Aug 2019 07:26:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe42.google.com (mail-vs1-xe42.google.com
 [IPv6:2607:f8b0:4864:20::e42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64C326E41D
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Aug 2019 16:26:28 +0000 (UTC)
Received: by mail-vs1-xe42.google.com with SMTP id 190so58695790vsf.9
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Aug 2019 09:26:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1l5ZrHi0Yk9YrLdE/QA8qgrMQVeapVUN6J/JOSvAOYc=;
 b=QnMG5ynktsOT8yNAIbvmPTHCdp79vRv5WJI3q64KiDGX2oPgIB0AusQMSIyAk4gSWN
 8YrPjv736TH0rEGAA6RMUQSdJxbNFQcFl6dbRyvBT+eX48FVay+BinQ6ClyfyG5WXJL1
 j7e4Sck4m0bRSu9QO4VOnH25UsjcuBcx6mcQZqjn9XNn7suFgPfls6nFw4T4IAodyV8Y
 +jDRGocmoVxsBAl1zo8IBK3cy21FLJr+e0aIy7ewD0aIILkhF4B02rRx9V5bkuM7FAOm
 dWIj2JEVHOhCOv+ywykpa6Y7Rozhvt5aI/9n5gXZWrKMpIJP5/KYTDNUw9R2f2Gme7Nh
 5jzg==
X-Gm-Message-State: APjAAAW/5NDxe6T7olL/0Fc7tTihrvb8C+sCwyU6pRfo9C2JzR2OVl+P
 hl0WKQCgypQFuVS8fba9XutYKnSadnEsBZ3pJ0hB0w==
X-Google-Smtp-Source: APXvYqwcAz9ahI3UjO9cuqIBc0I2yQDE+A8Mr2TXIaxm06KJMfs4AnTSSTTINyr+iiH0P6wDgJEqM8oppH2++ox+PQo=
X-Received: by 2002:a67:ba12:: with SMTP id l18mr3017326vsn.29.1565108787535; 
 Tue, 06 Aug 2019 09:26:27 -0700 (PDT)
MIME-Version: 1.0
References: <20190805211451.20176-1-robdclark@gmail.com>
 <20190806084821.GA17129@lst.de>
 <CAJs_Fx6eh1w7c=crMoD5XyEOMzP6orLhqUewErE51cPGYmObBQ@mail.gmail.com>
 <20190806155044.GC25050@lst.de>
 <CAJs_Fx6uztwDy2PqRy3Tc9p12k8r_ovS2tAcsMV6HqnAp=Ggug@mail.gmail.com>
In-Reply-To: <CAJs_Fx6uztwDy2PqRy3Tc9p12k8r_ovS2tAcsMV6HqnAp=Ggug@mail.gmail.com>
From: Rob Clark <robdclark@chromium.org>
Date: Tue, 6 Aug 2019 09:26:16 -0700
Message-ID: <CAJs_Fx4dUNKwd_U7wXMaedvTy6mORdmzL4mi-mGp1UnU_SVnzQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm: add cache support for arm64
To: Christoph Hellwig <hch@lst.de>
X-Mailman-Approved-At: Wed, 07 Aug 2019 07:26:17 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=1l5ZrHi0Yk9YrLdE/QA8qgrMQVeapVUN6J/JOSvAOYc=;
 b=ZBV4oHn5MVJP82WyuT5P3kIh8PCv/GK73DVyI6Q+Iv7zO1Oco9bjpqilJ0cmyPPxx/
 PZMs4cf0csx7Sl3GioHm6+yiGvHAhZ54V/qtkc1PvY2NmjcsMJpXwSDLN30Ta2x8aDis
 vyln7ihg3bJ76am6PXKXDohQCkHRmyewx7KMQ=
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
Cc: Sean Paul <sean@poorly.run>, Maxime Ripard <maxime.ripard@bootlin.com>,
 Catalin Marinas <catalin.marinas@arm.com>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 linux-arm-kernel@lists.infradead.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
 Allison Randal <allison@lohutok.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBBdWcgNiwgMjAxOSBhdCA5OjIzIEFNIFJvYiBDbGFyayA8cm9iZGNsYXJrQGNocm9t
aXVtLm9yZz4gd3JvdGU6Cj4KPiBPbiBUdWUsIEF1ZyA2LCAyMDE5IGF0IDg6NTAgQU0gQ2hyaXN0
b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+IHdyb3RlOgo+ID4KPiA+IE9uIFR1ZSwgQXVnIDA2LCAy
MDE5IGF0IDA3OjExOjQxQU0gLTA3MDAsIFJvYiBDbGFyayB3cm90ZToKPiA+ID4gQWdyZWVkIHRo
YXQgZHJtX2NmbHVzaF8qIGlzbid0IGEgZ3JlYXQgQVBJLiAgSW4gdGhpcyBwYXJ0aWN1bGFyIGNh
c2UKPiA+ID4gKElJVUMpLCBJIG5lZWQgd2IraW52IHNvIHRoYXQgdGhlcmUgYXJlbid0IGRpcnR5
IGNhY2hlIGxpbmVzIHRoYXQgZHJvcAo+ID4gPiBvdXQgdG8gbWVtb3J5IGxhdGVyLCBhbmQgc28g
dGhhdCBJIGRvbid0IGdldCBhIGNhY2hlIGhpdCBvbgo+ID4gPiB1bmNhY2hlZC93YyBtbWFwJ2lu
Zy4KPiA+Cj4gPiBTbyB3aGF0IGlzIHRoZSB1c2UgY2FzZSBoZXJlPyAgQWxsb2NhdGUgcGFnZXMg
dXNpbmcgdGhlIHBhZ2UgYWxsb2NhdG9yCj4gPiAob3IgQ01BIGZvciB0aGF0IG1hdHRlciksIGFu
ZCB0aGVuIG1tYXBpbmcgdGhlbSB0byB1c2Vyc3BhY2UgYW5kIG5ldmVyCj4gPiB0b3VjaGluZyB0
aGVtIGFnYWluIGZyb20gdGhlIGtlcm5lbD8KPgo+IEN1cnJlbnRseSwgaXQgaXMgcGFnZXMgY29t
aW5nIGZyb20gdG1wZnMuICBJZGVhbGx5IHdlIHdhbnQgcGFnZXMgdGhhdAo+IGFyZSBzd2FwcGFi
bGUgd2hlbiB1bnBpbm5lZC4KCnRvIGJlIG1vcmUgc3BlY2lmaWMsIHBhZ2VzIGNvbWUgZnJvbQpz
aG1lbV9maWxlX3NldHVwKCkvc2htZW1fcmVhZF9tYXBwaW5nX3BhZ2UoKQoKQlIsCi1SCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
