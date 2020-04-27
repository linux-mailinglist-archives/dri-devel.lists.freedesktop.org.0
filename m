Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC3E61BAE0A
	for <lists+dri-devel@lfdr.de>; Mon, 27 Apr 2020 21:34:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C52546E172;
	Mon, 27 Apr 2020 19:33:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEE056E172;
 Mon, 27 Apr 2020 19:33:57 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id h4so177522wmb.4;
 Mon, 27 Apr 2020 12:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=RQZ1rqt62TGR9QlKawKQ7R+UMp19s5QFNMCT8s9pOcE=;
 b=HM4a93dgEM8jHKU4uRwndIQC+9ZAi1w+JKDvvaayAlvYgKy4orRFUm/h9kfqJKZdDg
 /2gmvLsvVY0oLqy1RS3x0dzqsUO1OI4b/aV3SNgXnOf5o2E+OCLVmrUbidI5lOCWY9iw
 IVRoRSLI3N7d7mclt4qnS5m9QiqII/zoFWEHIYvDaM+xS9fZPgyjeunv2YskwL+hO8je
 8yMNDdz/1hOiKrQmPmLZ7Evwhi9c2rQOY9me9oTDNG2nHvjdE0DF0/EDHonE4hVa8sYQ
 DztIJGCWLmkeul1tM9ufbyXA0P/C0l6C2TvE/yRGVzl6yCRUezzH9vUi+i4Azb5zZ9ho
 3fkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=RQZ1rqt62TGR9QlKawKQ7R+UMp19s5QFNMCT8s9pOcE=;
 b=BietzmG4q8EYuE2gpx25SPJyyBPiktROsNc9VGcq5RoahWrxUF5q9tgDcGvtolPQT5
 XbbGCinEyvRSb3Kv/arF3Wlq3FYsvnvt5xzlfGv7SeJ8UWRpt9fObPu+c6z1EV2yIsHA
 znx1tSoweuYvWa0NphVxtXcXS6ugNMp0Bg8IAcVGnWytr9ZPpLV4homPHSQKtTnbrH23
 KbRMg2GOl9GNnZQY7GQhXmZ3nmXopxMCHreTNcBucZlg3qIvY9CoF3yRn3d1h2e/54Nm
 oRYC6XboRyomWbe2N362SoFiixtFNFriLCjRY1dut3ALOJ2+KtxyQi6i0xAZqckJWrFG
 +/oQ==
X-Gm-Message-State: AGi0PuZ9cWj3+UiCeKflA0EX9DcrQX2yNDlIWYwbiZ5nC4q+NAqay3d5
 AxAkHMIsNemj7o50Gh4zcEjukTYOCHXY4AtADuA=
X-Google-Smtp-Source: APiQypLw47bboaDd/mZnU70Zl7MsZjLgr4FhkhEYQa6MoG/m0MmPRUu85gaYdD13flYQJddWJ/JLAKOQ2wX2qK/dJm8=
X-Received: by 2002:a1c:6344:: with SMTP id x65mr295567wmb.56.1588016036543;
 Mon, 27 Apr 2020 12:33:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200427063726.21363-1-yanaijie@huawei.com>
 <d7546d27-a17f-8dcd-c396-79476a3972c1@amd.com>
In-Reply-To: <d7546d27-a17f-8dcd-c396-79476a3972c1@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 27 Apr 2020 15:33:45 -0400
Message-ID: <CADnq5_Mc77ze3_0FP8i+5o4hfbWeGonmJ0Ow29ZBbp_AW371+g@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: remove conversion to bool in
 dc_link_ddc.c
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
Cc: Jason Yan <yanaijie@huawei.com>, "Leo \(Sunpeng\) Li" <sunpeng.li@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, Dave Airlie <airlied@linux.ie>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QXBwbGllZC4gIFRoYW5rcyEKCkFsZXgKCk9uIE1vbiwgQXByIDI3LCAyMDIwIGF0IDQ6MDMgQU0g
Q2hyaXN0aWFuIEvDtm5pZwo8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPiB3cm90ZToKPgo+IEFt
IDI3LjA0LjIwIHVtIDA4OjM3IHNjaHJpZWIgSmFzb24gWWFuOgo+ID4gVGhlICc+JyBleHByZXNz
aW9uIGl0c2VsZiBpcyBib29sLCBubyBuZWVkIHRvIGNvbnZlcnQgaXQgdG8gYm9vbCBhZ2Fpbi4K
PiA+IFRoaXMgZml4ZXMgdGhlIGZvbGxvd2luZyBjb2NjaWNoZWNrIHdhcm5pbmc6Cj4gPgo+ID4g
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNfbGlua19kZGMuYzo2MDI6Mjgt
MzM6IFdBUk5JTkc6Cj4gPiBjb252ZXJzaW9uIHRvIGJvb2wgbm90IG5lZWRlZCBoZXJlCj4gPgo+
ID4gU2lnbmVkLW9mZi1ieTogSmFzb24gWWFuIDx5YW5haWppZUBodWF3ZWkuY29tPgo+Cj4gUmV2
aWV3ZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KPgo+
ID4gLS0tCj4gPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjX2xpbmtf
ZGRjLmMgfCAyICstCj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxl
dGlvbigtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
ZGMvY29yZS9kY19saW5rX2RkYy5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Nv
cmUvZGNfbGlua19kZGMuYwo+ID4gaW5kZXggMjU2ODg5ZWVkOTNlLi5hZWZkMjlhNDQwYjUgMTAw
NjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19saW5r
X2RkYy5jCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19s
aW5rX2RkYy5jCj4gPiBAQCAtNTk5LDcgKzU5OSw3IEBAIGJvb2wgZGFsX2RkY19zdWJtaXRfYXV4
X2NvbW1hbmQoc3RydWN0IGRkY19zZXJ2aWNlICpkZGMsCj4gPiAgICAgICBkbyB7Cj4gPiAgICAg
ICAgICAgICAgIHN0cnVjdCBhdXhfcGF5bG9hZCBjdXJyZW50X3BheWxvYWQ7Cj4gPiAgICAgICAg
ICAgICAgIGJvb2wgaXNfZW5kX29mX3BheWxvYWQgPSAocmV0cmlldmVkICsgREVGQVVMVF9BVVhf
TUFYX0RBVEFfU0laRSkgPgo+ID4gLSAgICAgICAgICAgICAgICAgICAgIHBheWxvYWQtPmxlbmd0
aCA/IHRydWUgOiBmYWxzZTsKPiA+ICsgICAgICAgICAgICAgICAgICAgICBwYXlsb2FkLT5sZW5n
dGg7Cj4gPgo+ID4gICAgICAgICAgICAgICBjdXJyZW50X3BheWxvYWQuYWRkcmVzcyA9IHBheWxv
YWQtPmFkZHJlc3M7Cj4gPiAgICAgICAgICAgICAgIGN1cnJlbnRfcGF5bG9hZC5kYXRhID0gJnBh
eWxvYWQtPmRhdGFbcmV0cmlldmVkXTsKPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCj4gYW1kLWdmeCBtYWlsaW5nIGxpc3QKPiBhbWQtZ2Z4QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vYW1kLWdmeApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWwK
