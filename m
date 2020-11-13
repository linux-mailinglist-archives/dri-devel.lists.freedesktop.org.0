Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 319442B2281
	for <lists+dri-devel@lfdr.de>; Fri, 13 Nov 2020 18:32:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 328AB6E598;
	Fri, 13 Nov 2020 17:32:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE1F16E598;
 Fri, 13 Nov 2020 17:32:17 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id w24so9339329wmi.0;
 Fri, 13 Nov 2020 09:32:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=nB0sqPZdl7dQLoXl7ubMEUx/Fs5H1HyujTYlOBisxFw=;
 b=tEf5E9PgHkBX+tNoCia7JZ3Kr29grA0sA17rvN6So/U5BnGMt3IxD4Mfn9PafoJ5cJ
 XNC3dNDdjXIgi0J9u52/8bnkM1yrvS9uZZcnSgbK4eAgpHhkY8uHAojQGt/jL/ajDbKi
 aQVLWJmW4E/39lnjOx3GPfCknqYCeD+TofYUzgoK+yBVi8FzZc2s76US58fsqaO2AwSR
 RaXnzpmXtFUWoPpI0U98S+B6dYDZ5tWCWor5Z//1rmRcW3PS+sgwvdZzArvh8bN1e37E
 lFSI2b1q8OXzDDAeUZ0pZjmRGzfX6K39tW1wm1NJq1B2ZrlT9uVyoUMaV/l1s5MFTMMJ
 iR/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=nB0sqPZdl7dQLoXl7ubMEUx/Fs5H1HyujTYlOBisxFw=;
 b=CFG5bWRoKhMkA223fIvOCMPy0Qr3yR251Pq25H7d2d6XUegM7LKGYkeR0qN+mbSkvK
 pn8VBXk3l81PGt0EM1sraTTfRx3z+/EpJB0F7eopqeOJtRI8E+6qBZ8O4LOMj1uTRXbj
 6HZ7FRxEs6knzhd16LIIleZZJfjjDGhUBhClZgDtfar3d7rgeVHoQtTPlywJdZ4lG8i5
 WhIPtirbR+OCeWP8SXLfWFuB/RF+wIkAD5mKvDULT4VzdnH/omYKRK8ch9e8gATVkFAX
 dmDBmyxEo1H3D4IYJhfjfQ++0uvvoqo0tBxP7iS7oPGTAa1vcW+EHZ/UJdJJKp8Oskbs
 QORA==
X-Gm-Message-State: AOAM5319/piNIxH/IRaFlit2LGEx8Nj7eU4g1nBkMgsI9d12GjSNKOHV
 iBtzkwtFUnOMFuFHSC/Mn3CLpDeh7c0qgKy/KdU=
X-Google-Smtp-Source: ABdhPJwLUWp9h2RgHmnYgvG6nAKpZckkeYcM9u4+qoAUdVIw1MKwoRmYok6qE1X+JE0iF7PSBR6qtULvVKQcTNTZYNg=
X-Received: by 2002:a1c:80cb:: with SMTP id b194mr3585107wmd.73.1605288733517; 
 Fri, 13 Nov 2020 09:32:13 -0800 (PST)
MIME-Version: 1.0
References: <20201113134938.4004947-1-lee.jones@linaro.org>
 <20201113134938.4004947-32-lee.jones@linaro.org>
In-Reply-To: <20201113134938.4004947-32-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 13 Nov 2020 12:32:02 -0500
Message-ID: <CADnq5_NrurURuTvTHF-94EOy2kwmd1mgmY6tF2BN-ywVqH73ag@mail.gmail.com>
Subject: Re: [PATCH 31/40] drm/amd/amdgpu/amdgpu_vm_sdma: Fix
 'amdgpu_vm_sdma_prepare()'s doc-rot
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

T24gRnJpLCBOb3YgMTMsIDIwMjAgYXQgODo1MCBBTSBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5h
cm8ub3JnPiB3cm90ZToKPgo+IEZpeGVzIHRoZSBmb2xsb3dpbmcgVz0xIGtlcm5lbCBidWlsZCB3
YXJuaW5nKHMpOgo+Cj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bV9zZG1h
LmM6NjM6IHdhcm5pbmc6IEZ1bmN0aW9uIHBhcmFtZXRlciBvciBtZW1iZXIgJ3Jlc3YnIG5vdCBk
ZXNjcmliZWQgaW4gJ2FtZGdwdV92bV9zZG1hX3ByZXBhcmUnCj4gIGRyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV92bV9zZG1hLmM6NjM6IHdhcm5pbmc6IEZ1bmN0aW9uIHBhcmFtZXRl
ciBvciBtZW1iZXIgJ3N5bmNfbW9kZScgbm90IGRlc2NyaWJlZCBpbiAnYW1kZ3B1X3ZtX3NkbWFf
cHJlcGFyZScKPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtX3NkbWEuYzo2
Mzogd2FybmluZzogRXhjZXNzIGZ1bmN0aW9uIHBhcmFtZXRlciAnb3duZXInIGRlc2NyaXB0aW9u
IGluICdhbWRncHVfdm1fc2RtYV9wcmVwYXJlJwo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfdm1fc2RtYS5jOjYzOiB3YXJuaW5nOiBFeGNlc3MgZnVuY3Rpb24gcGFyYW1ldGVy
ICdleGNsdXNpdmUnIGRlc2NyaXB0aW9uIGluICdhbWRncHVfdm1fc2RtYV9wcmVwYXJlJwo+Cj4g
Q2M6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KPiBDYzogIkNocmlz
dGlhbiBLw7ZuaWciIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cj4gQ2M6IERhdmlkIEFpcmxp
ZSA8YWlybGllZEBsaW51eC5pZT4KPiBDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNo
Pgo+IENjOiBTdW1pdCBTZW13YWwgPHN1bWl0LnNlbXdhbEBsaW5hcm8ub3JnPgo+IENjOiBhbWQt
Z2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IENjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCj4gQ2M6IGxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZwo+IENjOiBsaW5hcm8tbW0t
c2lnQGxpc3RzLmxpbmFyby5vcmcKPiBTaWduZWQtb2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25l
c0BsaW5hcm8ub3JnPgoKQXBwbGllZC4gIFRoYW5rcyEKCkFsZXgKCj4gLS0tCj4gIGRyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bV9zZG1hLmMgfCA0ICsrLS0KPiAgMSBmaWxlIGNo
YW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm1fc2RtYS5jIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtX3NkbWEuYwo+IGluZGV4IGRiNzkwNTc0ZGMyZTguLmE4
M2E2NDY3NTljNTggMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X3ZtX3NkbWEuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92
bV9zZG1hLmMKPiBAQCAtNTEsOCArNTEsOCBAQCBzdGF0aWMgaW50IGFtZGdwdV92bV9zZG1hX21h
cF90YWJsZShzdHJ1Y3QgYW1kZ3B1X2JvICp0YWJsZSkKPiAgICogYW1kZ3B1X3ZtX3NkbWFfcHJl
cGFyZSAtIHByZXBhcmUgU0RNQSBjb21tYW5kIHN1Ym1pc3Npb24KPiAgICoKPiAgICogQHA6IHNl
ZSBhbWRncHVfdm1fdXBkYXRlX3BhcmFtcyBkZWZpbml0aW9uCj4gLSAqIEBvd25lcjogb3duZXIg
d2UgbmVlZCB0byBzeW5jIHRvCj4gLSAqIEBleGNsdXNpdmU6IGV4Y2x1c2l2ZSBtb3ZlIGZlbmNl
IHdlIG5lZWQgdG8gc3luYyB0bwo+ICsgKiBAcmVzdjogcmVzZXJ2YXRpb24gb2JqZWN0IHdpdGgg
ZW1iZWRkZWQgZmVuY2UKPiArICogQHN5bmNfbW9kZTogc3luY2hyb25pemF0aW9uIG1vZGUKPiAg
ICoKPiAgICogUmV0dXJuczoKPiAgICogTmVnYXRpdiBlcnJubywgMCBmb3Igc3VjY2Vzcy4KPiAt
LQo+IDIuMjUuMQo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
