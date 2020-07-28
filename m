Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE9002312B0
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jul 2020 21:31:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8655A6E3AA;
	Tue, 28 Jul 2020 19:31:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5946389B8F
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 10:18:14 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id 140so10704977lfi.5
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 03:18:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=y5JvHTfL3KAJW7sNZfdf0acUJLJFvSpi5rTiY+++JWk=;
 b=FiUDYJT+DkGKwexMj0wMwhkGRgDEcuVc/KAn2msNbjHHLX1/JES+yjuud3qRe9C2PI
 ExNC87JkNE3M+5OqPO+I1aXaJ8W22p8P9w3/5acFoYZrkV9hO4ajoP0dW/36pXs0A01G
 96RSfc4KUWzSISwDYq/MjjO9K+vgAI+0aPQigtPnrHLBQzIsmGgg7yMS5E9q0RF99BCF
 IOiiokEvncvAYdarjebwAby6cGS8ykq2jgD4A75MQXLF9v73XukOMrCwniaOgLzJXLzJ
 ckH712meXzmUKR4Dl/LnO1JqPurwYOx+PLw4hThG3L+v8THomDZnWa5C5c4n9OgYjv2f
 vmqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=y5JvHTfL3KAJW7sNZfdf0acUJLJFvSpi5rTiY+++JWk=;
 b=SVTjhRcFOoIw0RNbTPZ4pfwH+xtdvOilPpjtz3nX8/a7t+RTxaxsYu8V4oissNciGG
 xXwgcNpLc42Xc5AO5uAPc4mPnFsR4pZNITQJwv/ml5MihWVGC5ay3i9hytcIJU/6hoWG
 wcuhXPoN2x4strdWU5X3p1vQQy5oPBiECGCSNIc+kI1aIsZvbWN2D81YNWhKK9HEprmg
 /5Q/amgvFfbPJn8O+VON7f8+55KRNrIEKW5mX66n0AkKj/g/Krr8P6RFPKV2y3j6t7Q4
 EDtmiARgcmKC01mlsv2wAEokJv0zCFBkulDg4ZB7/3ILAe7gRJqt0ZfD7s4AqAEFwh60
 dtXw==
X-Gm-Message-State: AOAM531R8Q+D1PXHsFDprjPJua5DSdfsSk4RSaTJnAvRczKc8tc/fG+a
 VTFkF28B27f0datB5j6RvRD+Uy/V9KLjeyFQ1yk=
X-Google-Smtp-Source: ABdhPJzArjx6w8VQ21R+BwbyCxSpbtNwUNEm+Wcrn4ZfPf+5dodhqNS4jMNPRiS7XqQEXSQwTmZyaZGvKYkOQ1onUtw=
X-Received: by 2002:a05:6512:3156:: with SMTP id
 s22mr14053284lfi.140.1595931492732; 
 Tue, 28 Jul 2020 03:18:12 -0700 (PDT)
MIME-Version: 1.0
References: <1584105767-11963-1-git-send-email-kevin3.tang@gmail.com>
 <1584105767-11963-5-git-send-email-kevin3.tang@gmail.com>
 <CACvgo52_KT6O79PujodCPbkegP6LLwuVSFEoRdbarZ=y50B63A@mail.gmail.com>
In-Reply-To: <CACvgo52_KT6O79PujodCPbkegP6LLwuVSFEoRdbarZ=y50B63A@mail.gmail.com>
From: Kevin Tang <kevin3.tang@gmail.com>
Date: Tue, 28 Jul 2020 18:18:01 +0800
Message-ID: <CAFPSGXaERhtja=hZdKcuBJf-wtiT4RbM50UcT2wNBBAa2bq-Uw@mail.gmail.com>
Subject: Re: [PATCH RFC v5 4/6] drm/sprd: add Unisoc's drm display controller
 driver
To: Emil Velikov <emil.l.velikov@gmail.com>
X-Mailman-Approved-At: Tue, 28 Jul 2020 19:30:50 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, Baolin Wang <baolin.wang@linaro.org>,
 Dave Airlie <airlied@linux.ie>, Chunyan Zhang <zhang.lyra@gmail.com>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Orson Zhai <orsonzhai@gmail.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRW1pbCwKU29ycnksIEkgbGVmdCBmb3IgYSBsb25nIHRpbWUgYmVjYXVzZSBvZiBvdGhlciB0
aGluZ3MuIE5vdyBpJ20gYmFja34KClY2IGZpeCBhY2Nlc3MgcmVnaXN0ZXJzIHZpYSByZWFkbC93
cml0ZWwsIGNoZWNrIHVuc3VwcG9ydGVkIEtNUwpwcm9wZXJ0aWVzIChmb3JtYXQsIHJvdGF0aW9u
LCBibGVuZCBtb2RlLCBldGMpIGJ5IHBsYW5lX2NoZWNrIGNhbGxiYWNrCm9wcwphbmQgcmVtb3Zl
IGFsd2F5cyB0cnVlIGNoZWNrcyBmb3IgZHB1IGNvcmUgb3BzCgpBZGQgY2hhbmdlbG9nIHdpdGhp
biB0aGUgY29ycmVzcG9uZGluZyBwYXRjaCBmcm9tIG5vdyBvbiwgdGhhbmtzIGZvcgp5b3VyIGFk
dmljZS4KCkJSLApLZXZpbgoKCkVtaWwgVmVsaWtvdiA8ZW1pbC5sLnZlbGlrb3ZAZ21haWwuY29t
PiDkuo4yMDIw5bm0M+aciDIw5pel5ZGo5LqUIOS4iuWNiDI6MDflhpnpgZPvvJoKPgo+IEhleSBL
ZXZpbiwKPgo+IE9uIFN1biwgMTUgTWFyIDIwMjAgYXQgMjM6MTksIEtldmluIFRhbmcgPGtldmlu
My50YW5nQGdtYWlsLmNvbT4gd3JvdGU6Cj4gPgo+ID4gQWRkcyBEUFUoRGlzcGxheSBQcm9jZXNz
b3IgVW5pdCkgc3VwcG9ydCBmb3IgdGhlIFVuaXNvYydzIGRpc3BsYXkgc3Vic3lzdGVtLgo+ID4g
SXQncyBzdXBwb3J0IG11bHRpIHBsYW5lcywgc2NhbGVyLCByb3RhdGlvbiwgUFEoUGljdHVyZSBR
dWFsaXR5KSBhbmQgbW9yZS4KPiA+Cj4gPiBDYzogT3Jzb24gWmhhaSA8b3Jzb256aGFpQGdtYWls
LmNvbT4KPiA+IENjOiBCYW9saW4gV2FuZyA8YmFvbGluLndhbmdAbGluYXJvLm9yZz4KPiA+IENj
OiBDaHVueWFuIFpoYW5nIDx6aGFuZy5seXJhQGdtYWlsLmNvbT4KPiA+IFNpZ25lZC1vZmYtYnk6
IEtldmluIFRhbmcgPGtldmluLnRhbmdAdW5pc29jLmNvbT4KPiA+IC0tLQo+ID4gIGRyaXZlcnMv
Z3B1L2RybS9zcHJkL01ha2VmaWxlICAgICAgIHwgICA1ICstCj4gPiAgZHJpdmVycy9ncHUvZHJt
L3NwcmQvZHB1L01ha2VmaWxlICAgfCAgIDcgKwo+ID4gIGRyaXZlcnMvZ3B1L2RybS9zcHJkL2Rw
dS9kcHVfcjJwMC5jIHwgNzUwICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+
ID4gIGRyaXZlcnMvZ3B1L2RybS9zcHJkL3NwcmRfZHB1LmMgICAgIHwgNTAxICsrKysrKysrKysr
KysrKysrKysrKysrKwo+ID4gIGRyaXZlcnMvZ3B1L2RybS9zcHJkL3NwcmRfZHB1LmggICAgIHwg
MTcwICsrKysrKysrCj4gPiAgZHJpdmVycy9ncHUvZHJtL3NwcmQvc3ByZF9kcm0uYyAgICAgfCAg
IDEgKwo+ID4gIGRyaXZlcnMvZ3B1L2RybS9zcHJkL3NwcmRfZHJtLmggICAgIHwgICAyICsKPgo+
IFNlZW1zIGxpa2UgdjUgKHBhdGNoIGF0IGxlYXN0LCBJIGRpZCBub3QgbG9vayBhdCB0aGUgcmVz
dCkgZG9lcyBub3QKPiBhZGRyZXNzIGEgaGFuZGZ1bCBvZiB0aGUgZmVlZGJhY2suCj4gIC0gQWNj
ZXNzIHJlZ2lzdGVycyB2aWEgcmVhZGwvd3JpdGVsLCBpbnN0ZWFkIG9mIGN1cnJlbnQgYXBwcm9h
Y2gKPiAgLSBXaXRoIF5eIHlvdSBjYW4gZHJvcCB0aGUgY29tcGlsZXIgd29ya2Fyb3VuZAo+ICAt
IENoZWNraW5nIGZvciB1bnN1cHBvcnRlZCBLTVMgcHJvcGVydGllcyAoZm9ybWF0LCByb3RhdGlv
biwgZXRjKQo+IHNob3VsZCBoYXBwZW4gaW4gdGhlIFhYWF9jaGVjayBjYWxsYmFja3MKPiAgLSBS
ZW1vdmUgYWx3YXlzIHRydWUgY2hlY2tzLCBhcm91bmQgdGhlIChyYXRoZXIgbW9vdCkgYWJzdHJh
Y3Rpb24gbGF5ZXIKPgo+IEZvciB0aGUgZnV0dXJlLCBwbGVhc2Uga2VlcCB0aGUgcmV2aXNpb24v
Y2hhbmdlbG9nIHdpdGhpbiB0aGUKPiBjb3JyZXNwb25kaW5nIHBhdGNoLiBUaGlzIHdheSByZXZp
ZXdlcnMgY2FuIHNlZSwgZnJvbSB0aGUgb25zZXQsIHdoYXQKPiBpcyBhZGRyZXNzZWQuCj4gTG9v
ayBhdCBgZ2l0IGxvZyAtLSBkcml2ZXJzL2dwdS9kcm1gIGZvciBleGFtcGxlcy4KPgo+Cj4gLUVt
aWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
