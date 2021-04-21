Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6E673662B7
	for <lists+dri-devel@lfdr.de>; Wed, 21 Apr 2021 02:00:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24D816E91C;
	Wed, 21 Apr 2021 00:00:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com
 [IPv6:2607:f8b0:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9125B6E91D;
 Wed, 21 Apr 2021 00:00:40 +0000 (UTC)
Received: by mail-ot1-x332.google.com with SMTP id
 c8-20020a9d78480000b0290289e9d1b7bcso23369202otm.4; 
 Tue, 20 Apr 2021 17:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=e9+TAg/KoUWsa99Vc8OUos6cMxUG+phWDsMLGP3+C+w=;
 b=H9I6YTdW5X1jB4Ak+0cUKMmHDwNhdEcX7fpaedlJtz6o7jWjDXjvWZyFSRPp+0VEGx
 oV30KOct5TLMbE9r0AFi65mzT6zN4Bzucjoq2VMoGRKFj8G+SZwP8y/ApnTefuEGRJTb
 6Pn/X0WcDjTwHblpnCnlrjX/KwQSU13CRlMJsSUF8sFC2LBpbUQi7lr2A4laUert7ldP
 FQlOzSKn7egjwiwWMn1allUdiJysakqI2FyxQYAvNDk5sFuBqsqNMafU9uqA2yKspoav
 O1Yi8bmuylSp0YUt5VuHjEjH/NfLkPIndJTUmChrghxRsNHsFTghgvK1ot8pq2hl7diF
 EPCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=e9+TAg/KoUWsa99Vc8OUos6cMxUG+phWDsMLGP3+C+w=;
 b=q7r0odHh6WTz0xRA4vr5+r7F9MkUuU0hVwkMDaU/34unJkFU8xkWZb/Ft6L8ruTtNY
 UUrJuzMk1tA1HEwck1wIvl2XlaFfPFpFXmCQuL/bT+XvNTQvMYi4rxmmsjYZs4UhsU41
 8zUFR4WCD5q9C0KpcF8ewIRQ8eUNc7SAxBBEROnIYuvmpvWqyBF/IVpwNWRNjPzZdOeG
 2zvh9q0tkh5oVNyfcvdQgKuvf1HEMBQ8cpV7EPcib9PevJEwqnTLNSdPnsBjD5C/EpgL
 RQT0xLubcKBhnvViNELHqsvjdkABCfhG4Dsu/qQfmjvXsTPQNv8pZNLgPP0v0vfYfriZ
 6YMA==
X-Gm-Message-State: AOAM533zDtfLmgExKhOvC8Sn+amRYadcE7+cYD03InVzAMrjgpFyctLz
 7OtEAQHI09YVNHsznWkNYLAoIw695rf1hz3vDuE=
X-Google-Smtp-Source: ABdhPJymGN8we/4AVICoWFYllwCiQQt06X+J/UkA1Epkav0/XCuFSaiNnmHrehyuBajDCyPXswh2i+Wd9a8SJ9lTrgw=
X-Received: by 2002:a05:6830:1f12:: with SMTP id
 u18mr14249635otg.132.1618963240005; 
 Tue, 20 Apr 2021 17:00:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210416143725.2769053-1-lee.jones@linaro.org>
 <20210416143725.2769053-33-lee.jones@linaro.org>
 <eecd70a6-eb05-ea13-e9ca-c0d989f2210b@amd.com>
In-Reply-To: <eecd70a6-eb05-ea13-e9ca-c0d989f2210b@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 20 Apr 2021 20:00:29 -0400
Message-ID: <CADnq5_MqY6qcv97vncaLX_a0r_JBDTxrfkw=cAcHFXH10QEL0A@mail.gmail.com>
Subject: Re: [PATCH 32/40] drm/amd/amdgpu/amdgpu_ttm: Fix incorrectly
 documented function 'amdgpu_ttm_copy_mem_to_mem()'
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
Cc: David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Jerome Glisse <glisse@freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, Lee Jones <lee.jones@linaro.org>,
 linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QXBwbGllZC4gIFRoYW5rcyEKCkFsZXgKCk9uIEZyaSwgQXByIDE2LCAyMDIxIGF0IDExOjUzIEFN
IENocmlzdGlhbiBLw7ZuaWcKPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4gd3JvdGU6Cj4KPiBB
bSAxNi4wNC4yMSB1bSAxNjozNyBzY2hyaWViIExlZSBKb25lczoKPiA+IEZpeGVzIHRoZSBmb2xs
b3dpbmcgVz0xIGtlcm5lbCBidWlsZCB3YXJuaW5nKHMpOgo+ID4KPiA+ICAgZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5jOjMxMTogd2FybmluZzogZXhwZWN0aW5nIHByb3Rv
dHlwZSBmb3IgYW1kZ3B1X2NvcHlfdHRtX21lbV90b19tZW0oKS4gUHJvdG90eXBlIHdhcyBmb3Ig
YW1kZ3B1X3R0bV9jb3B5X21lbV90b19tZW0oKSBpbnN0ZWFkCj4gPgo+ID4gQ2M6IEFsZXggRGV1
Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KPiA+IENjOiAiQ2hyaXN0aWFuIEvDtm5p
ZyIgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KPiA+IENjOiBEYXZpZCBBaXJsaWUgPGFpcmxp
ZWRAbGludXguaWU+Cj4gPiBDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgo+ID4g
Q2M6IFN1bWl0IFNlbXdhbCA8c3VtaXQuc2Vtd2FsQGxpbmFyby5vcmc+Cj4gPiBDYzogSmVyb21l
IEdsaXNzZSA8Z2xpc3NlQGZyZWVkZXNrdG9wLm9yZz4KPiA+IENjOiBhbWQtZ2Z4QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwo+ID4gQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiA+
IENjOiBsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmcKPiA+IENjOiBsaW5hcm8tbW0tc2lnQGxp
c3RzLmxpbmFyby5vcmcKPiA+IFNpZ25lZC1vZmYtYnk6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxp
bmFyby5vcmc+Cj4KPiBSZXZpZXdlZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtv
ZW5pZ0BhbWQuY29tPgo+Cj4gPiAtLS0KPiA+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X3R0bS5jIHwgMiArLQo+ID4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyks
IDEgZGVsZXRpb24oLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X3R0bS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0
bS5jCj4gPiBpbmRleCAzYmVmMDQzMmNhYzJmLi44NTkzMTRjMGQ2YTM5IDEwMDY0NAo+ID4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5jCj4gPiArKysgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdHRtLmMKPiA+IEBAIC0yODgsNyArMjg4LDcg
QEAgc3RhdGljIGludCBhbWRncHVfdHRtX21hcF9idWZmZXIoc3RydWN0IHR0bV9idWZmZXJfb2Jq
ZWN0ICpibywKPiA+ICAgfQo+ID4KPiA+ICAgLyoqCj4gPiAtICogYW1kZ3B1X2NvcHlfdHRtX21l
bV90b19tZW0gLSBIZWxwZXIgZnVuY3Rpb24gZm9yIGNvcHkKPiA+ICsgKiBhbWRncHVfdHRtX2Nv
cHlfbWVtX3RvX21lbSAtIEhlbHBlciBmdW5jdGlvbiBmb3IgY29weQo+ID4gICAgKiBAYWRldjog
YW1kZ3B1IGRldmljZQo+ID4gICAgKiBAc3JjOiBidWZmZXIvYWRkcmVzcyB3aGVyZSB0byByZWFk
IGZyb20KPiA+ICAgICogQGRzdDogYnVmZmVyL2FkZHJlc3Mgd2hlcmUgdG8gd3JpdGUgdG8KPgo+
IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gZHJpLWRl
dmVsIG1haWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbApfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
