Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7536C2C90C1
	for <lists+dri-devel@lfdr.de>; Mon, 30 Nov 2020 23:13:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 581E26E8FA;
	Mon, 30 Nov 2020 22:13:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com
 [IPv6:2607:f8b0:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70F366E8F7;
 Mon, 30 Nov 2020 22:13:45 +0000 (UTC)
Received: by mail-oi1-x242.google.com with SMTP id o25so15978760oie.5;
 Mon, 30 Nov 2020 14:13:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=L/eAhlrFrC0aLBaVHXix7LDhxFtZN4hZd7odpTZYr7A=;
 b=BIMkuHqMJhJmDttmx2+W1lq+T5dcIEylJKP8B/FkUBjdGgi1YwEXE1sYZKgLiLL/3Q
 Awv+ATOcPyjfonC/7u21ojHdHjaLcLEq4a+zFHlIZ2J0DaHL7W/s/7qs6LFqqt4fDX4z
 MU1z6y2Hav1ORRzTxEAeFeRUhI4Xv9StwvDCi4RukMabEijUOtCJoQc6rlxqxrlF/M5b
 EkA2iTt577mPj/J/DbTyUtsxugwimR53x0TukoGSyoUAcl7L5MbJWNyc5L9A/alBK7np
 P8TebOWbUgoXxxX8gSnFuObO93pPnNKdFJJ1dhLgjrOLuXt8Yv/bor+rV+MriEnseR2F
 DpAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=L/eAhlrFrC0aLBaVHXix7LDhxFtZN4hZd7odpTZYr7A=;
 b=nX1Sf1GB3crgoPmu44LVmMAGNOvjh2wwrtvN/YiP5S/9y4folisP7c8i3xUAYNP6cp
 Gp/iyJUh9Nhnn13vRnbUiljCDKkz4krLetHIJHqQ4Iy4U9es3+H+HCPrsZgeV4ajRI7q
 Aa0v+6Z1mV1MJzHimtJojsp5bHw7TIw4rnglkexxtobafBmp63stb8xX0e656oZbFgmP
 5nx9Jy7aqJ5m1wGk9/jeqbxfvdtDtiBNY0EJ74W9CtrOFztdY9t+zkPzJjs4RB214W08
 wJmeoW99NfDDt4FqjFoyFnQ9h5mmaFO6pQvQGlevRXJeZb70by9V+VkqBS84TEq++VLH
 jSrg==
X-Gm-Message-State: AOAM531nJKEa5t4dJcTk2kZ9M8CHKkhyjW53Luu7jFhM9jQUQaOsEREy
 XqzswIdaTF82EtZKKDbRNdqQrDPJbEyAnvpzP48=
X-Google-Smtp-Source: ABdhPJwYSpWAlUBLg6XI9B/pUa0ka9+f8AD8sh170wW7+G93V9dlfFIjsDFizRrGIiynDPRd7VFsT/ZG5B9HTd5Ci6w=
X-Received: by 2002:a54:4608:: with SMTP id p8mr886432oip.5.1606774424807;
 Mon, 30 Nov 2020 14:13:44 -0800 (PST)
MIME-Version: 1.0
References: <20201124193824.1118741-1-lee.jones@linaro.org>
 <20201124193824.1118741-15-lee.jones@linaro.org>
In-Reply-To: <20201124193824.1118741-15-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 30 Nov 2020 17:13:33 -0500
Message-ID: <CADnq5_OfOaxiB1uOVLFni72-GZLBChxtng18kxUvyOMOZsxF-A@mail.gmail.com>
Subject: Re: [PATCH 14/40] drm/amd/amdgpu/gfx_v9_0: Make called-by-reference
 only function static
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

T24gVHVlLCBOb3YgMjQsIDIwMjAgYXQgMjo0NSBQTSBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5h
cm8ub3JnPiB3cm90ZToKPgo+IEZpeGVzIHRoZSBmb2xsb3dpbmcgVz0xIGtlcm5lbCBidWlsZCB3
YXJuaW5nKHMpOgo+Cj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OV8wLmM6Mjk5
ODo2OiB3YXJuaW5nOiBubyBwcmV2aW91cyBwcm90b3R5cGUgZm9yIOKAmGdmeF92OV8wX3JsY19z
dG9w4oCZIFstV21pc3NpbmctcHJvdG90eXBlc10KPgo+IENjOiBBbGV4IERldWNoZXIgPGFsZXhh
bmRlci5kZXVjaGVyQGFtZC5jb20+Cj4gQ2M6ICJDaHJpc3RpYW4gS8O2bmlnIiA8Y2hyaXN0aWFu
LmtvZW5pZ0BhbWQuY29tPgo+IENjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+Cj4g
Q2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KPiBDYzogU3VtaXQgU2Vtd2FsIDxz
dW1pdC5zZW13YWxAbGluYXJvLm9yZz4KPiBDYzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKPiBDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IENjOiBsaW51eC1tZWRp
YUB2Z2VyLmtlcm5lbC5vcmcKPiBDYzogbGluYXJvLW1tLXNpZ0BsaXN0cy5saW5hcm8ub3JnCj4g
U2lnbmVkLW9mZi1ieTogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4KCkFwcGxpZWQu
ICBUaGFua3MhCgpBbGV4Cgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhf
djlfMC5jIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRp
b24oLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjlf
MC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y5XzAuYwo+IGluZGV4IDhhNmMw
NTBjYjZjYWYuLmVhZTgxZmM0MTI1NTYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvZ2Z4X3Y5XzAuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dm
eF92OV8wLmMKPiBAQCAtMjk5NSw3ICsyOTk1LDcgQEAgc3RhdGljIHZvaWQgZ2Z4X3Y5XzBfaW5p
dF9wZyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKPiAgICAgICAgIH0KPiAgfQo+Cj4gLXZv
aWQgZ2Z4X3Y5XzBfcmxjX3N0b3Aoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCj4gK3N0YXRp
YyB2b2lkIGdmeF92OV8wX3JsY19zdG9wKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQo+ICB7
Cj4gICAgICAgICBXUkVHMzJfRklFTEQxNShHQywgMCwgUkxDX0NOVEwsIFJMQ19FTkFCTEVfRjMy
LCAwKTsKPiAgICAgICAgIGdmeF92OV8wX2VuYWJsZV9ndWlfaWRsZV9pbnRlcnJ1cHQoYWRldiwg
ZmFsc2UpOwo+IC0tCj4gMi4yNS4xCj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwo+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVsCg==
