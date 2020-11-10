Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 99E502AE47D
	for <lists+dri-devel@lfdr.de>; Wed, 11 Nov 2020 00:56:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9177789C6B;
	Tue, 10 Nov 2020 23:56:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E311189BD5;
 Tue, 10 Nov 2020 23:56:31 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id b6so419096wrt.4;
 Tue, 10 Nov 2020 15:56:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=WfB5Zmw3Ux9CKhPt9P+tELn8R3tbn83JjmD6s3cqA8Y=;
 b=c9GbbbX262i+//lwyN4ABDp41NxBzHGtWZq7nQyCdbooeI+usENJXE6Nz+cVyC05Cs
 qUC5+HAW2VUn6TxyQfhXa0ZdFtY4b8eyUTH2yDFGy/kqrNAZe2MXG6pg0c6viy7mmQDh
 x+ma6hb3dQyFRN6LiNBRorma69lXljTii322GH8cdgf9dKJF2ZKdV6j5Hfd5gkDSgiBs
 Y1vcKeqBk4NCoqK7jgjv/kF4MPoNsL3z7st3PabSApeMZKCAiM8Sr1TW3N7BQroGP3wn
 zUay39jqPsc2IglPSulSPBVHRrRpig9t0kNsshJh/WrxnxI4soTjwoKewH1GCjZRst3Z
 5jqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=WfB5Zmw3Ux9CKhPt9P+tELn8R3tbn83JjmD6s3cqA8Y=;
 b=EMEN5WGxJOsthsoHBxbFIcG11of0vQ79hqEmBeWMVroIP0c/kWwx0O1Zql2NqSZ6OV
 0X0Ui8bDZ6cD5+tQRH6sXcn3HMY3Rx1h2UIl6ojFIH5CmHwpYMBAWY4NQU6hl0QwCq+H
 qtkcdhitsWKzwJSXebao5m2G1AxzGyYfpvWdsC8x9v3TYdk79ZVjBXFwaXotV6cd1UcM
 KGsup15+EdAkwpK6mHIfMhzN1p6L+FIAyyx1nu00B6Q5/mXRicQsSRcfR4UK4i47oz+n
 CBC1GhvkYEqWNfYNNhMGbY3jNGN7oLPqcYKqdMORHyZIUGfF2JXPewjCTtrgnz5r96LI
 ReMA==
X-Gm-Message-State: AOAM5314zRQscIIuHr08mkjmMu46FHaBmgo36Pxo6bAh3GUvl4D11xQs
 rJhXZSa4Jj8HsUjuWY8bA//RtlUibwkiIjOghX5Dv6Bg
X-Google-Smtp-Source: ABdhPJwsnW0y/kx7DL1j2p8r9N9uPNtVRi5fDJKmOzzqoro5WBcd2tHjiHixkDcYOyQM+BTSPEn2FX4iUDM/izxfwkM=
X-Received: by 2002:adf:f246:: with SMTP id b6mr26221425wrp.111.1605052590670; 
 Tue, 10 Nov 2020 15:56:30 -0800 (PST)
MIME-Version: 1.0
References: <20201110193112.988999-1-lee.jones@linaro.org>
 <20201110193112.988999-16-lee.jones@linaro.org>
In-Reply-To: <20201110193112.988999-16-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 10 Nov 2020 18:56:19 -0500
Message-ID: <CADnq5_Pq7ODBSwnjRQy8Hu1mTP+t9d8ofcO9KD0_89d9GpWpUQ@mail.gmail.com>
Subject: Re: [PATCH 15/30] drm/radeon/cik_sdma: Demote vague attempt at
 kernel-doc
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
Cc: David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBOb3YgMTAsIDIwMjAgYXQgMjozMSBQTSBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5h
cm8ub3JnPiB3cm90ZToKPgo+IEZpeGVzIHRoZSBmb2xsb3dpbmcgVz0xIGtlcm5lbCBidWlsZCB3
YXJuaW5nKHMpOgo+Cj4gIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vY2lrX3NkbWEuYzo5NDk6IHdh
cm5pbmc6IEZ1bmN0aW9uIHBhcmFtZXRlciBvciBtZW1iZXIgJ3JpbmcnIG5vdCBkZXNjcmliZWQg
aW4gJ2Npa19kbWFfdm1fZmx1c2gnCj4gIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vY2lrX3NkbWEu
Yzo5NDk6IHdhcm5pbmc6IEZ1bmN0aW9uIHBhcmFtZXRlciBvciBtZW1iZXIgJ3ZtX2lkJyBub3Qg
ZGVzY3JpYmVkIGluICdjaWtfZG1hX3ZtX2ZsdXNoJwo+ICBkcml2ZXJzL2dwdS9kcm0vcmFkZW9u
L2Npa19zZG1hLmM6OTQ5OiB3YXJuaW5nOiBGdW5jdGlvbiBwYXJhbWV0ZXIgb3IgbWVtYmVyICdw
ZF9hZGRyJyBub3QgZGVzY3JpYmVkIGluICdjaWtfZG1hX3ZtX2ZsdXNoJwo+Cj4gQ2M6IEFsZXgg
RGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KPiBDYzogIkNocmlzdGlhbiBLw7Zu
aWciIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cj4gQ2M6IERhdmlkIEFpcmxpZSA8YWlybGll
ZEBsaW51eC5pZT4KPiBDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgo+IENjOiBT
dW1pdCBTZW13YWwgPHN1bWl0LnNlbXdhbEBsaW5hcm8ub3JnPgo+IENjOiBhbWQtZ2Z4QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwo+IENjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4g
Q2M6IGxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZwo+IENjOiBsaW5hcm8tbW0tc2lnQGxpc3Rz
LmxpbmFyby5vcmcKPiBTaWduZWQtb2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8u
b3JnPgoKQXBwbGllZC4gIFRoYW5rcyEKCkFsZXgKCj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9y
YWRlb24vY2lrX3NkbWEuYyB8IDQgKy0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KyksIDMgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JhZGVv
bi9jaWtfc2RtYS5jIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9jaWtfc2RtYS5jCj4gaW5kZXgg
Njg0MDNlNzc3NTZkMy4uM2M3MDllYmU4ZDFhYiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vcmFkZW9uL2Npa19zZG1hLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL2Npa19z
ZG1hLmMKPiBAQCAtOTM2LDExICs5MzYsOSBAQCB2b2lkIGNpa19zZG1hX3ZtX3BhZF9pYihzdHJ1
Y3QgcmFkZW9uX2liICppYikKPiAgICAgICAgICAgICAgICAgaWItPnB0cltpYi0+bGVuZ3RoX2R3
KytdID0gU0RNQV9QQUNLRVQoU0RNQV9PUENPREVfTk9QLCAwLCAwKTsKPiAgfQo+Cj4gLS8qKgo+
ICsvKgo+ICAgKiBjaWtfZG1hX3ZtX2ZsdXNoIC0gY2lrIHZtIGZsdXNoIHVzaW5nIHNETUEKPiAg
ICoKPiAtICogQHJkZXY6IHJhZGVvbl9kZXZpY2UgcG9pbnRlcgo+IC0gKgo+ICAgKiBVcGRhdGUg
dGhlIHBhZ2UgdGFibGUgYmFzZSBhbmQgZmx1c2ggdGhlIFZNIFRMQgo+ICAgKiB1c2luZyBzRE1B
IChDSUspLgo+ICAgKi8KPiAtLQo+IDIuMjUuMQo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbAo=
