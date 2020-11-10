Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7EAB2AE319
	for <lists+dri-devel@lfdr.de>; Tue, 10 Nov 2020 23:17:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C75589CF7;
	Tue, 10 Nov 2020 22:17:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBF3489CF2;
 Tue, 10 Nov 2020 22:17:26 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id 33so14403342wrl.7;
 Tue, 10 Nov 2020 14:17:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=PybHYHD7oH2aLnG+yvTddEPZqr7VRvhfNzCANa+XKfA=;
 b=AnT0B68fsoy6LnsJzwe/Fm7jjXUzfkVseEBGHrDF8afef5eVu8t5Vc4WHB44H01snU
 Y0XxjtlSavsWQJ++9Q7cyNMhWTMUCQItMA1xUjro37jdTV1GN3Oi81zHV6/cufsj3hrh
 IbKlbsH8DnVVcNymAVVEOE4yAhcrgeMFMicm0ObvYEyOPNLwHhMoxAp893ou/pn9lkII
 riGVsX9X2H6Q3gGnUmc3HIu9VSXp88vjmHfYWlsUCEybqYt0eNc7Nv1H84cBIiCbYmbB
 Io9FqVA5KHeCT5mAPSrAlLl3ZoQpUTnhdd4q1T5VW47Ta+3f6INB3cihUIhZe6ZS8x6W
 3PGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=PybHYHD7oH2aLnG+yvTddEPZqr7VRvhfNzCANa+XKfA=;
 b=MmRL+HXxHus5rGDAtOiKs1vVBvqhoXluzFaDIjE3pznzUSx3UInqFZN1zYWOXnT+IQ
 eQaQopBytd+6IOWoxB5td2yD6nPRWkUPfFeCgrEaLI3dKwzY/GOaSJepKf5P025CKCzL
 5r85RQdtGRC9EbehMiwFD6BlIb/fR/dDOFMy1SnTg1vrRnFMSyvCKkOcXMVPgz3BOs7x
 XwNnKvpFalFyime5afXh9996gO3f3Q1q3vr8GH4u8fCWJ0G3d4lGlKdyO0c4fd8GVDjB
 OY+PtcQ4YsRgfjdtTsrCAPiL53N9eqmlInIYB3G/HG9udetdG+G6SdscfquvD9B/e7th
 u05Q==
X-Gm-Message-State: AOAM530OYWApiEuAKXr3ADCQymrWoi9/7KeUTBKO0CylPqNm2eZKn31c
 +gNRaGZjzTCNMq8Q2oYO2LMwxNsIYj809TBBcr8=
X-Google-Smtp-Source: ABdhPJxh2GeljpewW2T0ti487h5NvVsa43l5KqIELZfR5hDC7Aj0bILRpfkBVbdUXZQrjDANOnsCVpXmp8jNi1eT12o=
X-Received: by 2002:adf:e9c9:: with SMTP id l9mr27815711wrn.124.1605046645534; 
 Tue, 10 Nov 2020 14:17:25 -0800 (PST)
MIME-Version: 1.0
References: <20201109211855.3340030-1-lee.jones@linaro.org>
 <20201109211855.3340030-12-lee.jones@linaro.org>
In-Reply-To: <20201109211855.3340030-12-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 10 Nov 2020 17:17:13 -0500
Message-ID: <CADnq5_MJQExKjyigHaYc4Vqy7H755qQC80Y7uSqxBPdR41B1cQ@mail.gmail.com>
Subject: Re: [PATCH 11/20] drm/radeon/r600: Strip out set but unused 'tmp'
 variables
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

T24gTW9uLCBOb3YgOSwgMjAyMCBhdCA0OjE5IFBNIExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFy
by5vcmc+IHdyb3RlOgo+Cj4gRml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdh
cm5pbmcocyk6Cj4KPiAgZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yNjAwLmM6IEluIGZ1bmN0aW9u
IOKAmHI2MDBfcGNpZV9nYXJ0X3RsYl9mbHVzaOKAmToKPiAgZHJpdmVycy9ncHUvZHJtL3JhZGVv
bi9yNjAwLmM6MTA4Mzo3OiB3YXJuaW5nOiB2YXJpYWJsZSDigJh0bXDigJkgc2V0IGJ1dCBub3Qg
dXNlZCBbLVd1bnVzZWQtYnV0LXNldC12YXJpYWJsZV0KPiAgZHJpdmVycy9ncHUvZHJtL3JhZGVv
bi9yNjAwLmM6IEF0IHRvcCBsZXZlbDoKPiAgZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yNjAwLmM6
IEluIGZ1bmN0aW9uIOKAmHI2MDBfbW1pb19oZHBfZmx1c2jigJk6Cj4gIGRyaXZlcnMvZ3B1L2Ry
bS9yYWRlb24vcjYwMC5jOjQzOTM6Nzogd2FybmluZzogdmFyaWFibGUg4oCYdG1w4oCZIHNldCBi
dXQgbm90IHVzZWQgWy1XdW51c2VkLWJ1dC1zZXQtdmFyaWFibGVdCj4KPiBDYzogQWxleCBEZXVj
aGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgo+IENjOiAiQ2hyaXN0aWFuIEvDtm5pZyIg
PGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KPiBDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxp
bnV4LmllPgo+IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+Cj4gQ2M6IFN1bWl0
IFNlbXdhbCA8c3VtaXQuc2Vtd2FsQGxpbmFyby5vcmc+Cj4gQ2M6IGFtZC1nZnhAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCj4gQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBDYzog
bGludXgtbWVkaWFAdmdlci5rZXJuZWwub3JnCj4gQ2M6IGxpbmFyby1tbS1zaWdAbGlzdHMubGlu
YXJvLm9yZwo+IFNpZ25lZC1vZmYtYnk6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+
CgpBcHBsaWVkLiAgVGhhbmtzIQoKQWxleAoKPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL3JhZGVv
bi9yNjAwLmMgfCA2ICsrLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA0
IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcjYw
MC5jIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yNjAwLmMKPiBpbmRleCBkOWEzM2NhNzY4ZjM0
Li42ZTc4MGIwMTA5OTk1IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcjYw
MC5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yNjAwLmMKPiBAQCAtMTA4MCw3ICsx
MDgwLDYgQEAgdm9pZCByNjAwX3BjaWVfZ2FydF90bGJfZmx1c2goc3RydWN0IHJhZGVvbl9kZXZp
Y2UgKnJkZXYpCj4gICAgICAgICBpZiAoKHJkZXYtPmZhbWlseSA+PSBDSElQX1JWNzcwKSAmJiAo
cmRldi0+ZmFtaWx5IDw9IENISVBfUlY3NDApICYmCj4gICAgICAgICAgICAgIShyZGV2LT5mbGFn
cyAmIFJBREVPTl9JU19BR1ApKSB7Cj4gICAgICAgICAgICAgICAgIHZvaWQgX19pb21lbSAqcHRy
ID0gKHZvaWQgKilyZGV2LT5nYXJ0LnB0cjsKPiAtICAgICAgICAgICAgICAgdTMyIHRtcDsKPgo+
ICAgICAgICAgICAgICAgICAvKiByN3h4IGh3IGJ1Zy4gIHdyaXRlIHRvIEhEUF9ERUJVRzEgZm9s
bG93ZWQgYnkgZmIgcmVhZAo+ICAgICAgICAgICAgICAgICAgKiByYXRoZXIgdGhhbiB3cml0ZSB0
byBIRFBfUkVHX0NPSEVSRU5DWV9GTFVTSF9DTlRMCj4gQEAgLTEwODgsNyArMTA4Nyw3IEBAIHZv
aWQgcjYwMF9wY2llX2dhcnRfdGxiX2ZsdXNoKHN0cnVjdCByYWRlb25fZGV2aWNlICpyZGV2KQo+
ICAgICAgICAgICAgICAgICAgKiBtZXRob2QgZm9yIHRoZW0uCj4gICAgICAgICAgICAgICAgICAq
Lwo+ICAgICAgICAgICAgICAgICBXUkVHMzIoSERQX0RFQlVHMSwgMCk7Cj4gLSAgICAgICAgICAg
ICAgIHRtcCA9IHJlYWRsKCh2b2lkIF9faW9tZW0gKilwdHIpOwo+ICsgICAgICAgICAgICAgICBy
ZWFkbCgodm9pZCBfX2lvbWVtICopcHRyKTsKPiAgICAgICAgIH0gZWxzZQo+ICAgICAgICAgICAg
ICAgICBXUkVHMzIoUl8wMDU0ODBfSERQX01FTV9DT0hFUkVOQ1lfRkxVU0hfQ05UTCwgMHgxKTsK
Pgo+IEBAIC00MzkwLDEwICs0Mzg5LDkgQEAgdm9pZCByNjAwX21taW9faGRwX2ZsdXNoKHN0cnVj
dCByYWRlb25fZGV2aWNlICpyZGV2KQo+ICAgICAgICAgaWYgKChyZGV2LT5mYW1pbHkgPj0gQ0hJ
UF9SVjc3MCkgJiYgKHJkZXYtPmZhbWlseSA8PSBDSElQX1JWNzQwKSAmJgo+ICAgICAgICAgICAg
IHJkZXYtPnZyYW1fc2NyYXRjaC5wdHIgJiYgIShyZGV2LT5mbGFncyAmIFJBREVPTl9JU19BR1Ap
KSB7Cj4gICAgICAgICAgICAgICAgIHZvaWQgX19pb21lbSAqcHRyID0gKHZvaWQgKilyZGV2LT52
cmFtX3NjcmF0Y2gucHRyOwo+IC0gICAgICAgICAgICAgICB1MzIgdG1wOwo+Cj4gICAgICAgICAg
ICAgICAgIFdSRUczMihIRFBfREVCVUcxLCAwKTsKPiAtICAgICAgICAgICAgICAgdG1wID0gcmVh
ZGwoKHZvaWQgX19pb21lbSAqKXB0cik7Cj4gKyAgICAgICAgICAgICAgIHJlYWRsKCh2b2lkIF9f
aW9tZW0gKilwdHIpOwo+ICAgICAgICAgfSBlbHNlCj4gICAgICAgICAgICAgICAgIFdSRUczMihS
XzAwNTQ4MF9IRFBfTUVNX0NPSEVSRU5DWV9GTFVTSF9DTlRMLCAweDEpOwo+ICB9Cj4gLS0KPiAy
LjI1LjEKPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Cj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
