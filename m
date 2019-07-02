Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 828145DE8F
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2019 09:14:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CEF16E0F5;
	Wed,  3 Jul 2019 07:13:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBD8F894DC;
 Tue,  2 Jul 2019 21:29:57 +0000 (UTC)
Received: by mail-io1-xd44.google.com with SMTP id k8so40691835iot.1;
 Tue, 02 Jul 2019 14:29:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=I1EqOkAJ16JrzJYbRJsKM2M5z/cziA7sysWiFBw1wCQ=;
 b=fpMKl/n3e1UmJIrQJfMp47HuncbsOgg9P3a/cBumWf4lKDWqSNxijK65UTcvSN1pHN
 I3QAt77Mg1+lRR/2Rw1Tvy5F5EyH5czinZTxrzMP1qifg5pTAg1EVtcxZctc6xZaR8tj
 LmuoWb+NnrjeN64b9xVTOxBkXX8FyrUDfJQ2a4y0G/rh+4OCOi8Nv833YVFAcYIs1rrK
 wZP7VFa3ryuqbV1L5qrZR/4krrBs0FhLBvZV3+t6IWUA0+nj0XXaUZed4w5mrOhqIo9C
 vrmnRPDnQueMKqnoTfVMseOUJ2Ak4GcqgD+ii11PsPQ38Q34AizP/KYBxcgDFhKfN5qR
 xQSA==
X-Gm-Message-State: APjAAAWcm4PmRXktXkOcMlvTkh5rZFDmbartzlRVGgUXDsGcfyuvw22o
 uHaiImwQZMDIp2GJwx5OLkj3F6mtPsVALr9xJRA=
X-Google-Smtp-Source: APXvYqz2ea1Co87gENT0Z1FYNhMJZ2SZm3RqcDFrMzN+sTpYjy5Oh6gRJ+UNd2Qx/1ivh+Y0WvJG4xn2CxoR0RmeRwA=
X-Received: by 2002:a02:ac09:: with SMTP id a9mr39228087jao.48.1562102997246; 
 Tue, 02 Jul 2019 14:29:57 -0700 (PDT)
MIME-Version: 1.0
References: <20190630131445.25712-1-robdclark@gmail.com>
 <20190630131445.25712-4-robdclark@gmail.com>
 <CAOCk7NpyYSiDHP84E4bQiTA1Wk9Sd4w-F8-Zqu9tKtDoUTsFDw@mail.gmail.com>
In-Reply-To: <CAOCk7NpyYSiDHP84E4bQiTA1Wk9Sd4w-F8-Zqu9tKtDoUTsFDw@mail.gmail.com>
From: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date: Tue, 2 Jul 2019 15:29:47 -0600
Message-ID: <CAOCk7NrxsbAd9sp6m9RSfkRjwW5GZH7qJv2fd78bogas-4YMWA@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH 3/3] drm/msm/dsi: make sure we have panel or
 bridge earlier
To: Rob Clark <robdclark@gmail.com>
X-Mailman-Approved-At: Wed, 03 Jul 2019 07:13:21 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=I1EqOkAJ16JrzJYbRJsKM2M5z/cziA7sysWiFBw1wCQ=;
 b=cHbuCUvN+s8Lxw2Gyg3gi4DFYo+F4B8Y2Kkpc1I2sZAekDpolXvsjxL2vCLw+zBEqh
 XqJBFdv4ZmCJk7ExnlSoa231CpUFJrcpmHzSb6QDviDzMXT80sTIefoueo7dajOTdTbi
 aSPGfyYr4g1yfJTGDte3QRKpLEKt1aqtYlMj+ltHYK9bVYthpd6JxS8HV8gAdXOBjeLa
 uTskqhloZdHDc8VdGHBGGTqQcEBxsoj4u5Nv/wU43dV0lo6VBVMpKiI5X6sDz/w7Ybgg
 oCN/1Oo3aDlnsbAFjFi5ldNCfMPtrnA2qTcQ7ew+gfk4C/znPwGU2nex1jNx62tD5fmB
 J9iw==
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
Cc: Rob Clark <robdclark@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 MSM <linux-arm-msm@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Sean Paul <sean@poorly.run>, Chandan Uddaraju <chandanu@codeaurora.org>,
 Sibi Sankar <sibis@codeaurora.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdWwgMiwgMjAxOSBhdCAyOjMwIFBNIEplZmZyZXkgSHVnbyA8amVmZnJleS5sLmh1
Z29AZ21haWwuY29tPiB3cm90ZToKPgo+IE9uIFN1biwgSnVuIDMwLCAyMDE5IGF0IDc6MTYgQU0g
Um9iIENsYXJrIDxyb2JkY2xhcmtAZ21haWwuY29tPiB3cm90ZToKPiA+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9tc20vZHNpL2RzaV9ob3N0LmMKPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tc20v
ZHNpL2RzaV9ob3N0LmMKPiA+IEBAIC0xODI0LDYgKzE4MjQsMjAgQEAgaW50IG1zbV9kc2lfaG9z
dF9pbml0KHN0cnVjdCBtc21fZHNpICptc21fZHNpKQo+ID4gICAgICAgICAgICAgICAgIGdvdG8g
ZmFpbDsKPiA+ICAgICAgICAgfQo+ID4KPiA+ICsgICAgICAgLyoKPiA+ICsgICAgICAgICogTWFr
ZSBzdXJlIHdlIGhhdmUgcGFuZWwgb3IgYnJpZGdlIGVhcmx5LCBiZWZvcmUgd2Ugc3RhcnQKPiA+
ICsgICAgICAgICogdG91Y2hpbmcgdGhlIGh3LiAgSWYgYm9vdGxvYWRlciBlbmFibGVkIHRoZSBk
aXNwbGF5LCB3ZQo+ID4gKyAgICAgICAgKiB3YW50IHRvIGJlIHN1cmUgdG8ga2VlcCBpdCBydW5u
aW5nIHVudGlsIHRoZSBicmlkZ2UvcGFuZWwKPiA+ICsgICAgICAgICogaXMgcHJvYmVkIGFuZCB3
ZSBhcmUgYWxsIHJlYWR5IHRvIGdvLiAgT3RoZXJ3aXNlIHdlJ2xsCj4gPiArICAgICAgICAqIGtp
bGwgdGhlIGRpc3BsYXkgYW5kIHRoZW4gLUVQUk9CRV9ERUZFUgo+ID4gKyAgICAgICAgKi8KPiA+
ICsgICAgICAgaWYgKElTX0VSUihvZl9kcm1fZmluZF9wYW5lbChtc21faG9zdC0+ZGV2aWNlX25v
ZGUpKSAmJgo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgIW9mX2RybV9maW5kX2JyaWRnZSht
c21faG9zdC0+ZGV2aWNlX25vZGUpKSB7Cj4gPiArICAgICAgICAgICAgICAgcHJfZXJyKCIlczog
bm8gcGFuZWwgb3IgYnJpZGdlIHlldFxuIiwgX19mdW5jX18pOwo+Cj4gcHJfZXJyKCkgZG9lc24n
dCBzZWVtIHJpZ2h0IGZvciBhIHByb2JlIGRlZmVyIGNvbmRpdGlvbi4gIHByX2RiZz8KPgo+ID4g
KyAgICAgICAgICAgICAgIHJldHVybiAtRVBST0JFX0RFRkVSOwo+ID4gKyAgICAgICB9Cj4gPiAr
Cj4gPiArCj4KPiBUZXN0ZWQtYnk6IEplZmZyZXkgSHVnbyA8amVmZnJleS5sLmh1Z29AZ21haWwu
Y29tPgo+IFJldmlld2VkLWJ5OiBKZWZmcmV5IEh1Z28gPGplZmZyZXkubC5odWdvQGdtYWlsLmNv
bT4KCkFjdHVhbGx5LCBJJ20gc29ycnksIEknbSBub3cgTkFDS2luZyB0aGlzLgoKVHVybnMgb3V0
IHRoaXMgcHJldmVudHMgdGhlIHBhbmVsL2JyaWRnZSBmcm9tIGV2ZXIgcHJvYmluZyBpZiBpdHMg
YQpjaGlsZCBub2RlIG9mIHRoZSBkc2kgZGV2aWNlLCBzaW5jZSBtaXBpX2RzaV9ob3N0X3JlZ2lz
dGVyKCkgaXMgbmV2ZXIKY2FsbGVkLgoKVGhpcyBwcm9iYWJseSB3b3JrcyBmb3IgeW91IG9uIHRo
ZSBjNjMwIGJlY2F1c2UgdGhlIGJyaWRnZSBoYW5ncyBvZmYKdGhlIGkyYyBidXMuCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
