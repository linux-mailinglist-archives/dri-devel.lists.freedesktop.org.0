Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B8C062EF972
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jan 2021 21:40:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25A126E8CA;
	Fri,  8 Jan 2021 20:40:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [IPv6:2607:f8b0:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52FDB6E8C5;
 Fri,  8 Jan 2021 20:40:32 +0000 (UTC)
Received: by mail-ot1-x32a.google.com with SMTP id q25so10940197otn.10;
 Fri, 08 Jan 2021 12:40:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=7USUfBSYNoXr//1ygkSq10RDo/1Zyym1BvRpYGLGfmo=;
 b=hL+zB/53a3D7/Dz2T4csFfGInwbU0EN94DemgSD+CYJUk4LwRrIxAUDKhrABpKUbGY
 m73J7++gpKyfHAsEbvUyYwh28HajKGoSgwjGFfO+jenIvmQU4x1ayaAzkKYRVFBklZDs
 bHGS3vYQoxgGVnnfDOz1kLPjV7R65V1dl/uqTG0zVuCid7sIRuZ0JZYb81dDFdUOYq1a
 n60oBvCd01ZadjpahratJ8mtq/hpKYMOcSk15QARypFtOdnfwHVVZSzxRBmykP0JcLx6
 UnCWIrRbQv0RZn8dNYvDgefi7gBdbAsn9QL1jNQiiX1CSnOvktcmUUipb2cmh9puhJml
 Zsfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=7USUfBSYNoXr//1ygkSq10RDo/1Zyym1BvRpYGLGfmo=;
 b=Ni55w7Lhu/1/Pol9luLYE4Zv3vdE1tT58c/AHTePiML1H7eYFe9g5d2MNQLfQmbHb4
 b7ju5x7smeo/5f+F4AU84l2eq5F9JMf0f73Td3QubnAioixHTTBbrxRWGdDjrg0vxaMp
 UtPADCeRdCbisB0o6vRWk/HyM9bTEudqSEofOen0mqFvP3qYaBH5JpQtJ3//JFm6S2GT
 iXBEGO6O+bBWXPvrnWIYS1Cx2wZVMvcnOzP/hMLzZaXrQSR8hrASp0JMFrlCa4GNzEXB
 y12sADaDYeF13+FAZsf5tgVxm7dHI17xwcW8eCJLYuwc0Q6xBanD9PoDQ7XLIJk4zp3N
 jmsQ==
X-Gm-Message-State: AOAM532qlKkVvDHePZ4t07DALH1yZF/h/46U/HS7JJ6RbXjuIoXLWHaV
 NVixJr5O71eWMk6ffZBbPnzUiD0vnESOp3E51PQ=
X-Google-Smtp-Source: ABdhPJwRrpd22ECWoBX6bY7sHAEZBIGQRs0c0g7zfb7/k4Uv/xcqSzrQAYOSTfmFOjbYC1p2uB6IjCCBaJC8/o2fM5A=
X-Received: by 2002:a05:6830:1b7b:: with SMTP id
 d27mr3997488ote.132.1610138430197; 
 Fri, 08 Jan 2021 12:40:30 -0800 (PST)
MIME-Version: 1.0
References: <20210108201457.3078600-1-lee.jones@linaro.org>
 <20210108201457.3078600-17-lee.jones@linaro.org>
In-Reply-To: <20210108201457.3078600-17-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 8 Jan 2021 15:40:18 -0500
Message-ID: <CADnq5_MuiUeU=-Y0yi_3jv9j0dKuWNja1W8MA4vje-0Ggax+xA@mail.gmail.com>
Subject: Re: [PATCH 16/40] drm/amd/display/dc/bios/command_table_helper2: Fix
 legacy formatting problems
To: Lee Jones <lee.jones@linaro.org>
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
Cc: Leo Li <sunpeng.li@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QXBwbGllZC4gIFRoYW5rcyEKCkFsZXgKCk9uIEZyaSwgSmFuIDgsIDIwMjEgYXQgMzoxNSBQTSBM
ZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPiB3cm90ZToKPgo+IEZpeGVzIHRoZSBmb2xs
b3dpbmcgVz0xIGtlcm5lbCBidWlsZCB3YXJuaW5nKHMpOgo+Cj4gIGRyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1Ly4uL2Rpc3BsYXkvZGMvYmlvcy9jb21tYW5kX3RhYmxlX2hlbHBlcjIuYzoxNDU6
IHdhcm5pbmc6IEZ1bmN0aW9uIHBhcmFtZXRlciBvciBtZW1iZXIgJ3QnIG5vdCBkZXNjcmliZWQg
aW4gJ2RhbF9jbWRfdGFibGVfaGVscGVyX3RyYW5zbWl0dGVyX2JwX3RvX2F0b20yJwo+Cj4gQ2M6
IEhhcnJ5IFdlbnRsYW5kIDxoYXJyeS53ZW50bGFuZEBhbWQuY29tPgo+IENjOiBMZW8gTGkgPHN1
bnBlbmcubGlAYW1kLmNvbT4KPiBDYzogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBh
bWQuY29tPgo+IENjOiAiQ2hyaXN0aWFuIEvDtm5pZyIgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNv
bT4KPiBDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgo+IENjOiBEYW5pZWwgVmV0
dGVyIDxkYW5pZWxAZmZ3bGwuY2g+Cj4gQ2M6IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cj4gQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBTaWduZWQtb2ZmLWJ5OiBM
ZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgo+IC0tLQo+ICAuLi4vZGlzcGxheS9kYy9i
aW9zL2NvbW1hbmRfdGFibGVfaGVscGVyMi5jICAgfCAyMCArKysrKysrKy0tLS0tLS0tLS0tCj4g
IDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDEyIGRlbGV0aW9ucygtKQo+Cj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9iaW9zL2NvbW1hbmRfdGFi
bGVfaGVscGVyMi5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Jpb3MvY29tbWFu
ZF90YWJsZV9oZWxwZXIyLmMKPiBpbmRleCA3NzM2YzkyZDU1YzQwLi40NTVlZTJiZTE1YTM2IDEw
MDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9iaW9zL2NvbW1hbmRf
dGFibGVfaGVscGVyMi5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Jp
b3MvY29tbWFuZF90YWJsZV9oZWxwZXIyLmMKPiBAQCAtMTI4LDE4ICsxMjgsMTQgQEAgYm9vbCBk
YWxfY21kX3RhYmxlX2hlbHBlcl9jb250cm9sbGVyX2lkX3RvX2F0b20yKAo+ICB9Cj4KPiAgLyoq
Cj4gLSogdHJhbnNsYXRlX3RyYW5zbWl0dGVyX2JwX3RvX2F0b20KPiAtKgo+IC0qIEBicmllZgo+
IC0qICBUcmFuc2xhdGUgdGhlIFRyYW5zbWl0dGVyIHRvIHRoZSBjb3JyZXNwb25kaW5nIEFUT00g
QklPUyB2YWx1ZQo+IC0qCj4gLSogQHBhcmFtCj4gLSogICBpbnB1dCB0cmFuc21pdHRlcgo+IC0q
ICAgb3V0cHV0IGRpZ2l0YWxUcmFuc21pdHRlcgo+IC0qICAgIC8vID0wMDogRGlnaXRhbCBUcmFu
c21pdHRlcjEgKCBVTklQSFkgbGlua0FCICkKPiAtKiAgICAvLyA9MDE6IERpZ2l0YWwgVHJhbnNt
aXR0ZXIyICggVU5JUEhZIGxpbmtDRCApCj4gLSogICAgLy8gPTAyOiBEaWdpdGFsIFRyYW5zbWl0
dGVyMyAoIFVOSVBIWSBsaW5rRUYgKQo+IC0qLwo+ICsgKiB0cmFuc2xhdGVfdHJhbnNtaXR0ZXJf
YnBfdG9fYXRvbTIgLSBUcmFuc2xhdGUgdGhlIFRyYW5zbWl0dGVyIHRvIHRoZQo+ICsgKiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb3JyZXNwb25kaW5nIEFUT00gQklPUyB2
YWx1ZQo+ICsgKiAgQHQ6IHRyYW5zbWl0dGVyCj4gKyAqICByZXR1cm5zOiBkaWdpdGFsVHJhbnNt
aXR0ZXIKPiArICogICAgLy8gPTAwOiBEaWdpdGFsIFRyYW5zbWl0dGVyMSAoIFVOSVBIWSBsaW5r
QUIgKQo+ICsgKiAgICAvLyA9MDE6IERpZ2l0YWwgVHJhbnNtaXR0ZXIyICggVU5JUEhZIGxpbmtD
RCApCj4gKyAqICAgIC8vID0wMjogRGlnaXRhbCBUcmFuc21pdHRlcjMgKCBVTklQSFkgbGlua0VG
ICkKPiArICovCj4gIHVpbnQ4X3QgZGFsX2NtZF90YWJsZV9oZWxwZXJfdHJhbnNtaXR0ZXJfYnBf
dG9fYXRvbTIoCj4gICAgICAgICBlbnVtIHRyYW5zbWl0dGVyIHQpCj4gIHsKPiAtLQo+IDIuMjUu
MQo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBk
cmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+
IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
