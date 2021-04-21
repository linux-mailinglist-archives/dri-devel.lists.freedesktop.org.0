Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B86C63662D1
	for <lists+dri-devel@lfdr.de>; Wed, 21 Apr 2021 02:03:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51E7389BC0;
	Wed, 21 Apr 2021 00:03:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C892C89BAE;
 Wed, 21 Apr 2021 00:03:14 +0000 (UTC)
Received: by mail-oi1-x235.google.com with SMTP id x20so6988607oix.10;
 Tue, 20 Apr 2021 17:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Bzy1XVE3pX0bVpKOU6c03egp1B/YRIMRasUEXcl28pk=;
 b=eNf8Vlth2r1UW49M5oiMWsxxA5rquUjZ4/tvhLU4tG/VqdFuTA23WEYoCYEPiWwojd
 pK7VH0dAxzg8HoUhPEYc34kcMGPoRnjDfxZ10z0Rb7JGr0ADasV9Yv0hzxfu3RgUdOLt
 dA5wZIPtMBkcCGPekzDf7yY6SeG1pOtonesHDK4hS7JENAIBGmMXyg8s0o42+im98IpX
 1eedA3m2ekpWbbeTIYKiMxPzvZmn/fYbl8nJV/4GE1JuIa4o0Iw0QgHCn2hI4/7h7aYY
 EjGBKooscnyqyWu6GBIqfe0EFPBtbOw4ruc0Fpex6ctQ0k5SLiTUURkl+jtzCpeWRwHd
 9JNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Bzy1XVE3pX0bVpKOU6c03egp1B/YRIMRasUEXcl28pk=;
 b=NHdID4qftNr7VsfU5+qG143QEtztp3pNPnYVAY9FP9ftBv9C9tm7ZbBqrRWjipuFsf
 ON26y+zfzKtShlRjD8dexgSONJ1u7DV1EayYiJ+1cmBzxQ642GCKyCgNx3cvr4ZwQISz
 0d0HhL9iQrRDIQDFdO/fbGymYOky/UFUMD6+N//qFgGjvw1K5hqKL1bpiRzGzqWDJvkV
 3DN6f+Vp01AsGBAZ3xaSZ9tsddoSmKuQ4hY3c88LJrtkHMPKbA7JAN4Ej5V/fhxOe4V6
 ryUPZBjT63gqOOvRHZlCWk2RkPCT+YxE5AQqskfF/8byPQUZ/3RqzSrNE74fKLGEx2jN
 a3LA==
X-Gm-Message-State: AOAM533xA68kqvJuBtkca0aP73NSYSRVTn/9F4z35Q/oNU5dLKDiQQLh
 CdzFt7FhZyf18642mnISK1nUsaR4KT6z9cYYPGUbwsjqlgCPGw==
X-Google-Smtp-Source: ABdhPJy+DqK7M4J1LuG62c3cPuiea8egSrJJt94kyNl27+TAnlda55H4l4jGWLJr2QzKApIH+mn+qXtI134+dclonow=
X-Received: by 2002:a05:6808:68a:: with SMTP id
 k10mr4882531oig.120.1618963394237; 
 Tue, 20 Apr 2021 17:03:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210416143725.2769053-1-lee.jones@linaro.org>
 <20210416143725.2769053-36-lee.jones@linaro.org>
 <59a21fb5-224e-882f-5d2f-e337e78eb7db@amd.com>
In-Reply-To: <59a21fb5-224e-882f-5d2f-e337e78eb7db@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 20 Apr 2021 20:03:03 -0400
Message-ID: <CADnq5_MHCpUPR764FNp-A8_9xQhq1tTHAXkRc0foAKqKRFyaAw@mail.gmail.com>
Subject: Re: [PATCH 35/40] drm/amd/amdgpu/amdgpu_cs: Repair some function
 naming disparity
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

QXBwbGllZC4gIFRoYW5rcyEKCkFsZXgKCk9uIEZyaSwgQXByIDE2LCAyMDIxIGF0IDExOjU0IEFN
IENocmlzdGlhbiBLw7ZuaWcKPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4gd3JvdGU6Cj4KPiBB
bSAxNi4wNC4yMSB1bSAxNjozNyBzY2hyaWViIExlZSBKb25lczoKPiA+IEZpeGVzIHRoZSBmb2xs
b3dpbmcgVz0xIGtlcm5lbCBidWlsZCB3YXJuaW5nKHMpOgo+ID4KPiA+ICAgZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2NzLmM6Njg1OiB3YXJuaW5nOiBleHBlY3RpbmcgcHJvdG90
eXBlIGZvciBjc19wYXJzZXJfZmluaSgpLiBQcm90b3R5cGUgd2FzIGZvciBhbWRncHVfY3NfcGFy
c2VyX2ZpbmkoKSBpbnN0ZWFkCj4gPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9jcy5jOjE1MDI6IHdhcm5pbmc6IGV4cGVjdGluZyBwcm90b3R5cGUgZm9yIGFtZGdwdV9jc193
YWl0X2FsbF9mZW5jZSgpLiBQcm90b3R5cGUgd2FzIGZvciBhbWRncHVfY3Nfd2FpdF9hbGxfZmVu
Y2VzKCkgaW5zdGVhZAo+ID4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfY3Mu
YzoxNjU2OiB3YXJuaW5nOiBleHBlY3RpbmcgcHJvdG90eXBlIGZvciBhbWRncHVfY3NfZmluZF9i
b192YSgpLiBQcm90b3R5cGUgd2FzIGZvciBhbWRncHVfY3NfZmluZF9tYXBwaW5nKCkgaW5zdGVh
ZAo+ID4KPiA+IENjOiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Cj4g
PiBDYzogIkNocmlzdGlhbiBLw7ZuaWciIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cj4gPiBD
YzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgo+ID4gQ2M6IERhbmllbCBWZXR0ZXIg
PGRhbmllbEBmZndsbC5jaD4KPiA+IENjOiBTdW1pdCBTZW13YWwgPHN1bWl0LnNlbXdhbEBsaW5h
cm8ub3JnPgo+ID4gQ2M6IEplcm9tZSBHbGlzc2UgPGdsaXNzZUBmcmVlZGVza3RvcC5vcmc+Cj4g
PiBDYzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiA+IENjOiBkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCj4gPiBDYzogbGludXgtbWVkaWFAdmdlci5rZXJuZWwub3JnCj4g
PiBDYzogbGluYXJvLW1tLXNpZ0BsaXN0cy5saW5hcm8ub3JnCj4gPiBTaWduZWQtb2ZmLWJ5OiBM
ZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgo+Cj4gUmV2aWV3ZWQtYnk6IENocmlzdGlh
biBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KPgo+ID4gLS0tCj4gPiAgIGRyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9jcy5jIHwgNiArKystLS0KPiA+ICAgMSBmaWxl
IGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPiA+Cj4gPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2NzLmMgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfY3MuYwo+ID4gaW5kZXggYjVjNzY2OTk4MDQ1OC4uOTAx
MzZmOWRlZGQ2NSAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9jcy5jCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfY3Mu
Ywo+ID4gQEAgLTY3Miw3ICs2NzIsNyBAQCBzdGF0aWMgaW50IGFtZGdwdV9jc19zeW5jX3Jpbmdz
KHN0cnVjdCBhbWRncHVfY3NfcGFyc2VyICpwKQo+ID4gICB9Cj4gPgo+ID4gICAvKioKPiA+IC0g
KiBjc19wYXJzZXJfZmluaSgpIC0gY2xlYW4gcGFyc2VyIHN0YXRlcwo+ID4gKyAqIGFtZGdwdV9j
c19wYXJzZXJfZmluaSgpIC0gY2xlYW4gcGFyc2VyIHN0YXRlcwo+ID4gICAgKiBAcGFyc2VyOiBw
YXJzZXIgc3RydWN0dXJlIGhvbGRpbmcgcGFyc2luZyBjb250ZXh0Lgo+ID4gICAgKiBAZXJyb3I6
ICBlcnJvciBudW1iZXIKPiA+ICAgICogQGJhY2tvZmY6ICAgICAgICBpbmRpY2F0b3IgdG8gYmFj
a29mZiB0aGUgcmVzZXJ2YXRpb24KPiA+IEBAIC0xNDg4LDcgKzE0ODgsNyBAQCBpbnQgYW1kZ3B1
X2NzX2ZlbmNlX3RvX2hhbmRsZV9pb2N0bChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCB2b2lkICpk
YXRhLAo+ID4gICB9Cj4gPgo+ID4gICAvKioKPiA+IC0gKiBhbWRncHVfY3Nfd2FpdF9hbGxfZmVu
Y2UgLSB3YWl0IG9uIGFsbCBmZW5jZXMgdG8gc2lnbmFsCj4gPiArICogYW1kZ3B1X2NzX3dhaXRf
YWxsX2ZlbmNlcyAtIHdhaXQgb24gYWxsIGZlbmNlcyB0byBzaWduYWwKPiA+ICAgICoKPiA+ICAg
ICogQGFkZXY6IGFtZGdwdSBkZXZpY2UKPiA+ICAgICogQGZpbHA6IGZpbGUgcHJpdmF0ZQo+ID4g
QEAgLTE2MzksNyArMTYzOSw3IEBAIGludCBhbWRncHVfY3Nfd2FpdF9mZW5jZXNfaW9jdGwoc3Ry
dWN0IGRybV9kZXZpY2UgKmRldiwgdm9pZCAqZGF0YSwKPiA+ICAgfQo+ID4KPiA+ICAgLyoqCj4g
PiAtICogYW1kZ3B1X2NzX2ZpbmRfYm9fdmEgLSBmaW5kIGJvX3ZhIGZvciBWTSBhZGRyZXNzCj4g
PiArICogYW1kZ3B1X2NzX2ZpbmRfbWFwcGluZyAtIGZpbmQgYm9fdmEgZm9yIFZNIGFkZHJlc3MK
PiA+ICAgICoKPiA+ICAgICogQHBhcnNlcjogY29tbWFuZCBzdWJtaXNzaW9uIHBhcnNlciBjb250
ZXh0Cj4gPiAgICAqIEBhZGRyOiBWTSBhZGRyZXNzCj4KPiBfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwo+IGFtZC1nZnggbWFpbGluZyBsaXN0Cj4gYW1kLWdm
eEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2FtZC1nZngKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVsCg==
