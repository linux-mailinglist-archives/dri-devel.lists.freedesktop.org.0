Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D29375DE7A
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2019 09:13:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 146946E0D9;
	Wed,  3 Jul 2019 07:13:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 683186E08E;
 Tue,  2 Jul 2019 20:30:50 +0000 (UTC)
Received: by mail-io1-xd43.google.com with SMTP id w25so40202834ioc.8;
 Tue, 02 Jul 2019 13:30:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=e2dHY1JEDP4p/Iin7PE911+goagiVJlOgF+4JmS/qJI=;
 b=D+lqlqJm84Pk3vacgTTnqsYEdwvCJ/7nTNKl/FzjIM7orW34hFX0cr0cth1V73fYsw
 Ll9FpnEBSlG5Jo3Gncg8+wqQe6I4a2v5gI/H4VUf+482S8SNRlAtBfq58qcKybPZac3T
 NI1G1l0jwLzJ9oiOqwnxRXK7qeouwRWGybOc+Ko/59Kvg73I0PyD1qlJd9+xlmht0Y9/
 UduEtb1P27mCXZipU0t2xMZmvQtbAN5a/1lZsVNfa6vRgCl5ErdRbast9PEZdUQEX/E8
 r+kZRKHCgPAoZbbKe+dSR6T9G+sPR/9FUgDRojfLiNhPhDJmAaWAisZ8EXmPgFPbuKJW
 eyog==
X-Gm-Message-State: APjAAAWgYid3n/4hI1AKudPKs9x259z3Gc0EtLTNdcwv84SBHAx7hvX1
 ZHtPYUjKCKQHMPTHJzJNLDVaCqtQ0AgwqMYdIqk=
X-Google-Smtp-Source: APXvYqwXnBozA4Eg8repxRDmwc7v+ie6ZVutTX66BvuZfbKmO1Vnft8PUGkmnX5djxbfa6rxW7cPYo1M3PTW7hEaw/k=
X-Received: by 2002:a6b:f607:: with SMTP id n7mr7314656ioh.263.1562099449824; 
 Tue, 02 Jul 2019 13:30:49 -0700 (PDT)
MIME-Version: 1.0
References: <20190630131445.25712-1-robdclark@gmail.com>
 <20190630131445.25712-4-robdclark@gmail.com>
In-Reply-To: <20190630131445.25712-4-robdclark@gmail.com>
From: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date: Tue, 2 Jul 2019 14:30:39 -0600
Message-ID: <CAOCk7NpyYSiDHP84E4bQiTA1Wk9Sd4w-F8-Zqu9tKtDoUTsFDw@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH 3/3] drm/msm/dsi: make sure we have panel or
 bridge earlier
To: Rob Clark <robdclark@gmail.com>
X-Mailman-Approved-At: Wed, 03 Jul 2019 07:13:21 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=e2dHY1JEDP4p/Iin7PE911+goagiVJlOgF+4JmS/qJI=;
 b=fyZTRJk1EU58W3X9rMzFfX/rWwLk6qDxZqQwcdvO1B+WhX5Ay/UJIb48NnkcP5NLcS
 ceblxUmOFxSPlx1GBeqmcDjUbH6sB6hrn9ORIMObg1R8IvxgkKwhM0eHPX8TqeaCFty8
 N1KWPAjaJlmDjw1YCme0ht1QbwjJUJm/C7jaXTjMhpiThgVwTaGdpllJwhVOfBbta9Qe
 iEOIk5xCVFOv1RNqmaZTN85pB/FACzYDacf0MfBCtismFZAJ99Yag41k6NHrbx4zHk4l
 ARNK8o0PJYPNErN/pE8MUBWWxADpIOzOOzbW9BqxwCooNLIvnGGGb//TGKGEF4OATYas
 R7kg==
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

T24gU3VuLCBKdW4gMzAsIDIwMTkgYXQgNzoxNiBBTSBSb2IgQ2xhcmsgPHJvYmRjbGFya0BnbWFp
bC5jb20+IHdyb3RlOgo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tc20vZHNpL2RzaV9ob3N0LmMK
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2RzaS9kc2lfaG9zdC5jCj4gQEAgLTE4MjQsNiAr
MTgyNCwyMCBAQCBpbnQgbXNtX2RzaV9ob3N0X2luaXQoc3RydWN0IG1zbV9kc2kgKm1zbV9kc2kp
Cj4gICAgICAgICAgICAgICAgIGdvdG8gZmFpbDsKPiAgICAgICAgIH0KPgo+ICsgICAgICAgLyoK
PiArICAgICAgICAqIE1ha2Ugc3VyZSB3ZSBoYXZlIHBhbmVsIG9yIGJyaWRnZSBlYXJseSwgYmVm
b3JlIHdlIHN0YXJ0Cj4gKyAgICAgICAgKiB0b3VjaGluZyB0aGUgaHcuICBJZiBib290bG9hZGVy
IGVuYWJsZWQgdGhlIGRpc3BsYXksIHdlCj4gKyAgICAgICAgKiB3YW50IHRvIGJlIHN1cmUgdG8g
a2VlcCBpdCBydW5uaW5nIHVudGlsIHRoZSBicmlkZ2UvcGFuZWwKPiArICAgICAgICAqIGlzIHBy
b2JlZCBhbmQgd2UgYXJlIGFsbCByZWFkeSB0byBnby4gIE90aGVyd2lzZSB3ZSdsbAo+ICsgICAg
ICAgICoga2lsbCB0aGUgZGlzcGxheSBhbmQgdGhlbiAtRVBST0JFX0RFRkVSCj4gKyAgICAgICAg
Ki8KPiArICAgICAgIGlmIChJU19FUlIob2ZfZHJtX2ZpbmRfcGFuZWwobXNtX2hvc3QtPmRldmlj
ZV9ub2RlKSkgJiYKPiArICAgICAgICAgICAgICAgICAgICAgICAhb2ZfZHJtX2ZpbmRfYnJpZGdl
KG1zbV9ob3N0LT5kZXZpY2Vfbm9kZSkpIHsKPiArICAgICAgICAgICAgICAgcHJfZXJyKCIlczog
bm8gcGFuZWwgb3IgYnJpZGdlIHlldFxuIiwgX19mdW5jX18pOwoKcHJfZXJyKCkgZG9lc24ndCBz
ZWVtIHJpZ2h0IGZvciBhIHByb2JlIGRlZmVyIGNvbmRpdGlvbi4gIHByX2RiZz8KCj4gKyAgICAg
ICAgICAgICAgIHJldHVybiAtRVBST0JFX0RFRkVSOwo+ICsgICAgICAgfQo+ICsKPiArCgpUZXN0
ZWQtYnk6IEplZmZyZXkgSHVnbyA8amVmZnJleS5sLmh1Z29AZ21haWwuY29tPgpSZXZpZXdlZC1i
eTogSmVmZnJleSBIdWdvIDxqZWZmcmV5LmwuaHVnb0BnbWFpbC5jb20+Cl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
