Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 267FD2F3C67
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jan 2021 23:37:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2508C898A7;
	Tue, 12 Jan 2021 22:37:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc30.google.com (mail-oo1-xc30.google.com
 [IPv6:2607:f8b0:4864:20::c30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 121A8898A7;
 Tue, 12 Jan 2021 22:37:15 +0000 (UTC)
Received: by mail-oo1-xc30.google.com with SMTP id y14so27394oom.10;
 Tue, 12 Jan 2021 14:37:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=xERaZ+cRvJ1AT75s/Sd6NIg2My+pi/GZJ6ju2r6RLE8=;
 b=QNPZH26ZvfUFMYziW93/hi8p2JHjeYFMXyOqtHCSl6HRwlxhQ1bRgywJFpfFw2uKhp
 xsc/dRFV8i3s0dh4z4jUm1il9YFJLk+xyrfGWGCywpE8/UxKDoMlVVc1P5cLF/SuLxr0
 3MABguwvuVZurAXIOPdu9tDM9gfCfRrnGGm9g7zHZdlF3HBd0ljF0xEYrCWVomf6KhSd
 ZIpwm3v5EmKiOl/3gxzmGyz2BXzCndgBh4XHFIut5KxBjbum4mqlJMqnjBjbryN2+fzO
 oa5n1y2uzE8ZoXlqy5SJMNWbNz8tQlNWFG3GyFK/BTKTmbH8txCQMBPSS9xNg4W+bQlC
 VeoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=xERaZ+cRvJ1AT75s/Sd6NIg2My+pi/GZJ6ju2r6RLE8=;
 b=iJSW46mrv9zBL02C+7QqevVudIoNZPzEs6L3xugISKODYjnjbfflFD1fJmgjNZCUk0
 byVdow+fwW4zjEf6WOhikzuSEgbZUoM4YmxSJkEA1ORUt7xCN5fxT1J3G2/63i50NU5f
 /8MTSa/XJ0roLllikf8xvFAgw4udQo7b1e604hk1DPNryJjEPyDjDX9G6jcbFPJ4IdPw
 cvapkRTP8euoxRQayIUbdzx8vprSM00DLnOatHhoW+KJ+4eOTZZaY7SOcfIiC3xckK5H
 odp+LcQ4Yw8bmzPJcblzYlbGzA2+T2CMJBcLpGVKozz1oRTXKHD6C/oUp2CzqA5yonfg
 DnLA==
X-Gm-Message-State: AOAM532Oo9yzLhWRgzBWwr2m63LKYKz9IDxGqS6kKvI1CJry1fnrZkI+
 +RECAknsm6h0ZkIT4kqrtrUsSYY7f5Pmx9RMS54=
X-Google-Smtp-Source: ABdhPJzqty4NpJdahSeM0tH4SU0UCXsnxmA3UxbVuNbJz1jQK8zoul1Fp2qrga9yxisZ2HVa+zpoB5DJQxuNzVw/2dE=
X-Received: by 2002:a4a:330b:: with SMTP id q11mr800770ooq.90.1610491034444;
 Tue, 12 Jan 2021 14:37:14 -0800 (PST)
MIME-Version: 1.0
References: <20210111191926.3688443-1-lee.jones@linaro.org>
 <20210111191926.3688443-35-lee.jones@linaro.org>
In-Reply-To: <20210111191926.3688443-35-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 12 Jan 2021 17:37:02 -0500
Message-ID: <CADnq5_PK9aukXtdcqcS-ELn9jB=Vysj+Gp0iL5nUcLXiQM=hfQ@mail.gmail.com>
Subject: Re: [PATCH 34/40] drm/amd/display/dc/dce110/dce110_transform_v:
 Demote kernel-doc abuse
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

T24gTW9uLCBKYW4gMTEsIDIwMjEgYXQgMjoyMCBQTSBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5h
cm8ub3JnPiB3cm90ZToKPgo+IEZpeGVzIHRoZSBmb2xsb3dpbmcgVz0xIGtlcm5lbCBidWlsZCB3
YXJuaW5nKHMpOgo+Cj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2Rpc3BsYXkvZGMv
ZGNlMTEwL2RjZTExMF90cmFuc2Zvcm1fdi5jOjIyODogd2FybmluZzogYmFkIGxpbmU6ICAgIHZv
aWQKPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9kYy9kY2UxMTAvZGNl
MTEwX3RyYW5zZm9ybV92LmM6MjMzOiB3YXJuaW5nOiBGdW5jdGlvbiBwYXJhbWV0ZXIgb3IgbWVt
YmVyICd4Zm1fZGNlJyBub3QgZGVzY3JpYmVkIGluICdwcm9ncmFtX292ZXJzY2FuJwo+ICBkcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9kaXNwbGF5L2RjL2RjZTExMC9kY2UxMTBfdHJhbnNm
b3JtX3YuYzoyMzM6IHdhcm5pbmc6IEZ1bmN0aW9uIHBhcmFtZXRlciBvciBtZW1iZXIgJ2RhdGEn
IG5vdCBkZXNjcmliZWQgaW4gJ3Byb2dyYW1fb3ZlcnNjYW4nCj4KPiBDYzogSGFycnkgV2VudGxh
bmQgPGhhcnJ5LndlbnRsYW5kQGFtZC5jb20+Cj4gQ2M6IExlbyBMaSA8c3VucGVuZy5saUBhbWQu
Y29tPgo+IENjOiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Cj4gQ2M6
ICJDaHJpc3RpYW4gS8O2bmlnIiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgo+IENjOiBEYXZp
ZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+Cj4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBm
ZndsbC5jaD4KPiBDYzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBDYzogZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IFNpZ25lZC1vZmYtYnk6IExlZSBKb25lcyA8bGVl
LmpvbmVzQGxpbmFyby5vcmc+CgpBcHBsaWVkLiAgVGhhbmtzIQoKQWxleAoKPiAtLS0KPiAgLi4u
L2Rpc3BsYXkvZGMvZGNlMTEwL2RjZTExMF90cmFuc2Zvcm1fdi5jICAgIHwgMTkgKysrKysrKysr
LS0tLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCAxMCBkZWxldGlv
bnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNl
MTEwL2RjZTExMF90cmFuc2Zvcm1fdi5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2Rj
L2RjZTExMC9kY2UxMTBfdHJhbnNmb3JtX3YuYwo+IGluZGV4IGIxYWFhYjU1OTBjYzYuLjI5NDM4
YzYwNTBkYmIgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Rj
ZTExMC9kY2UxMTBfdHJhbnNmb3JtX3YuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlz
cGxheS9kYy9kY2UxMTAvZGNlMTEwX3RyYW5zZm9ybV92LmMKPiBAQCAtMjE3LDE2ICsyMTcsMTUg
QEAgc3RhdGljIGJvb2wgc2V0dXBfc2NhbGluZ19jb25maWd1cmF0aW9uKAo+ICAgICAgICAgcmV0
dXJuIGlzX3NjYWxpbmdfbmVlZGVkOwo+ICB9Cj4KPiAtLyoqCj4gLSogRnVuY3Rpb246Cj4gLSog
dm9pZCBwcm9ncmFtX292ZXJzY2FuCj4gLSoKPiAtKiBQdXJwb3NlOiBQcm9ncmFtcyBvdmVyc2Nh
biBib3JkZXIKPiAtKiBJbnB1dDogICBvdmVyc2Nhbgo+IC0qCj4gLSogT3V0cHV0Ogo+IC0gICB2
b2lkCj4gLSovCj4gKy8qCj4gKyAqIEZ1bmN0aW9uOgo+ICsgKiB2b2lkIHByb2dyYW1fb3ZlcnNj
YW4KPiArICoKPiArICogUHVycG9zZTogUHJvZ3JhbXMgb3ZlcnNjYW4gYm9yZGVyCj4gKyAqIElu
cHV0OiAgIG92ZXJzY2FuCj4gKyAqCj4gKyAqIE91dHB1dDogdm9pZAo+ICsgKi8KPiAgc3RhdGlj
IHZvaWQgcHJvZ3JhbV9vdmVyc2NhbigKPiAgICAgICAgICAgICAgICAgc3RydWN0IGRjZV90cmFu
c2Zvcm0gKnhmbV9kY2UsCj4gICAgICAgICAgICAgICAgIGNvbnN0IHN0cnVjdCBzY2FsZXJfZGF0
YSAqZGF0YSkKPiAtLQo+IDIuMjUuMQo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbAo=
