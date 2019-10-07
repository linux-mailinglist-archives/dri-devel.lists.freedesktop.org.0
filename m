Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE379CE8A7
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2019 18:08:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC8936E181;
	Mon,  7 Oct 2019 16:08:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 295B16E140;
 Mon,  7 Oct 2019 16:08:31 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id y21so95974wmi.0;
 Mon, 07 Oct 2019 09:08:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Z1iEZfsz63+hFaflS3INWnySuglWD+I2yD90meQjneg=;
 b=LCTMuvllaLTckWaJzR0jzDI8DI8G8FPqU7CrxHs19B5OqHrsIktLOX295OUcQL9vOe
 5y4xRxMOi0v5RxeiFw3A48qsmwOn/bDiQwrFi35QiWUlEnZ4iYf7+c35GnUfEukeUSw7
 uTdWIs2ytrJfGqh6xTDFFSIEdCll+HdKnbr4tXOXKC0WCDEPCrEl0aLgckXF7qLaS5rm
 k0UlxAdT5ltR3tUBbL0ChlzHoGBvTlJ8v/Vp8UfmG3aAfEcPQ8DEByXLfrh0KTPgpPXC
 zSO4/k4GABZXuxIbecXrULS/cMcGLDJMPYl1icaJJd8MY+HEvfhtWdoTuzlhtzVF6kYP
 rHrw==
X-Gm-Message-State: APjAAAUr1sYqr6XSyv6V/fHF2AQNShb78C3uqu6prAcDo6wnoZVen/OC
 Pyfh+5BfajoApnhde4LU3+DqbFddJ8YCJsf9kfc=
X-Google-Smtp-Source: APXvYqyq4efJgRyiW1dhwc+BXSa/rMaGmKzS1bwzST3wnGDfySKyRkkUk67CpkWeFqq/cYJquUmsPhHAH94fVc4ULu0=
X-Received: by 2002:a1c:3908:: with SMTP id g8mr64842wma.34.1570464509638;
 Mon, 07 Oct 2019 09:08:29 -0700 (PDT)
MIME-Version: 1.0
References: <20191005175808.32018-1-colin.king@canonical.com>
In-Reply-To: <20191005175808.32018-1-colin.king@canonical.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 7 Oct 2019 12:08:17 -0400
Message-ID: <CADnq5_PkTbzqNfesJt29SaB7=R0x4BdoNmHiNDXrHwqj02JUGg@mail.gmail.com>
Subject: Re: [PATCH] drm/amdkfd: add missing void argument to function
 kgd2kfd_init
To: Colin King <colin.king@canonical.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=Z1iEZfsz63+hFaflS3INWnySuglWD+I2yD90meQjneg=;
 b=hc6iJa4GVuhNuWWKGTrUwO7QaLE2DMH8tSuKd1N7fa2ey63T4C3Sv79QBeWNYBbDYE
 IBuGrRoyMSkcqqgjaMBcN2U+I5kYsOZmpfe25vJ4AO9sBXoWXaqq0f1F8XeJ3dN6nuCj
 id/bC57fyx6raHUDxh1UvEP2H/ZuD8KWZfDyFRUUAHQRLL8MC+/7k8CaMDbuIb4lr6PY
 r6FfQh4xBIcS0GPcIpDSGfh7pmn7rxiwEW0cgQeJWM//Ojfd1i58lKyL2uopQNa6BE01
 bGR7j88/Vab0pw636IuaEb8mq9eqk79QlZKmvc2fRSb8e+GubGoRijjFLnyJsQATvW04
 539Q==
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
Cc: David Airlie <airlied@linux.ie>, Felix Kuehling <Felix.Kuehling@amd.com>,
 kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU2F0LCBPY3QgNSwgMjAxOSBhdCAxOjU4IFBNIENvbGluIEtpbmcgPGNvbGluLmtpbmdAY2Fu
b25pY2FsLmNvbT4gd3JvdGU6Cj4KPiBGcm9tOiBDb2xpbiBJYW4gS2luZyA8Y29saW4ua2luZ0Bj
YW5vbmljYWwuY29tPgo+Cj4gRnVuY3Rpb24ga2dkMmtmZF9pbml0IGlzIG1pc3NpbmcgYSB2b2lk
IGFyZ3VtZW50LCBhZGQgaXQKPiB0byBjbGVhbiB1cCB0aGUgbm9uLUFOU0kgZnVuY3Rpb24gZGVj
bGFyYXRpb24uCj4KPiBTaWduZWQtb2ZmLWJ5OiBDb2xpbiBJYW4gS2luZyA8Y29saW4ua2luZ0Bj
YW5vbmljYWwuY29tPgoKQXBwbGllZC4gIHRoYW5rcyEKCkFsZXgKCj4gLS0tCj4gIGRyaXZlcnMv
Z3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9tb2R1bGUuYyB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRrZmQva2ZkX21vZHVsZS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRr
ZmQva2ZkX21vZHVsZS5jCj4gaW5kZXggOTg2ZmY1MmQ1NzUwLi5mNGI3ZjdlNmM0MGUgMTAwNjQ0
Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX21vZHVsZS5jCj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX21vZHVsZS5jCj4gQEAgLTgyLDcgKzgyLDcg
QEAgc3RhdGljIHZvaWQga2ZkX2V4aXQodm9pZCkKPiAgICAgICAgIGtmZF9jaGFyZGV2X2V4aXQo
KTsKPiAgfQo+Cj4gLWludCBrZ2Qya2ZkX2luaXQoKQo+ICtpbnQga2dkMmtmZF9pbml0KHZvaWQp
Cj4gIHsKPiAgICAgICAgIHJldHVybiBrZmRfaW5pdCgpOwo+ICB9Cj4gLS0KPiAyLjIwLjEKPgo+
IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gZHJpLWRl
dmVsIG1haWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbApfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
