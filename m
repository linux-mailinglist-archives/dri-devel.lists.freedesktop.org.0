Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 862DA2B2269
	for <lists+dri-devel@lfdr.de>; Fri, 13 Nov 2020 18:30:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A3556E5D5;
	Fri, 13 Nov 2020 17:30:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC4776E5D1;
 Fri, 13 Nov 2020 17:30:02 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id 33so10769087wrl.7;
 Fri, 13 Nov 2020 09:30:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=y5XLq8CASy6zy7N8oDE7rQcVOhoLkKsILxJE2K73xHE=;
 b=bAeFhepfBUbNFeZwG0IgNnzoRgTAR0H8PytEhCz6G00JYojWnocTe4WFCL37Gbv7Ne
 YiknUsYyV4DSBak+ucpmYZRa7qRPewOk/el126aeATJ2Hs0VLM2WImC34PvaO1YgYBO7
 s/5jFglrIIajRgEBP3qiJd97VsHz00drURd4GCRdV7u1WO7NSGhyXRahj4LgbmCOrTf9
 oSKqJcCggWFfQxuSP0DQ4ZJ3vt4+GT49VOSwEB6GGgezPWPW/Cp4DXZVo0d0UwSy8cjm
 oyl46q79YjGhYhnweeDLrmTQY+mGL9UzsnoQi7V17agunFgeGw0z9Wv1FPDFE3CVhTRm
 x36A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=y5XLq8CASy6zy7N8oDE7rQcVOhoLkKsILxJE2K73xHE=;
 b=TfroS+QT9H91T/HUmBrI4CXDtdXayQcZXSSWXzuhvZ6PaE12AE7I49tZjyNB99sTe/
 XEI3dFZ1GUjLUGBgkOZMqfe6U5wHckjWHN8MZudH+YU2RyKGLZsivMYHUnNvJL7LtpOg
 XYREz3plI7kOmTVlMv5VALgkjymToe+WPk1R2Y4HYdvPw7BviVQQu8UBDsyMQ2g2McRR
 UZmwDYyppQCPqnr7awaAvNTzteJH+wx8UQ3V3z7qdW3cdSxbWYMly+jeThyxIcJ5mlR+
 Io/hjoQCnXcOqRS9wTjI4UbLLYZ3w4vq33KCDxr6IM763P+7JY8TVqz9VO1fs8vk0Phg
 2Upg==
X-Gm-Message-State: AOAM5315ByO7+X925R3cDhFcSAipE+YeD0CosbLGgVanhjLA5RTC73Id
 BDfAjLyCNBi4j1Ll071/+sHwa2RXxRoHEqE++uw=
X-Google-Smtp-Source: ABdhPJx2zNAq12dh1x7XfucHKP6PuR8scXjnDxKPL++TGsvkSUK4GgJN/HAUBWb12O7U0SBkdTqGCXOo+U2bqXboxSI=
X-Received: by 2002:adf:8028:: with SMTP id 37mr4695655wrk.111.1605288596860; 
 Fri, 13 Nov 2020 09:29:56 -0800 (PST)
MIME-Version: 1.0
References: <20201113134938.4004947-1-lee.jones@linaro.org>
 <20201113134938.4004947-28-lee.jones@linaro.org>
In-Reply-To: <20201113134938.4004947-28-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 13 Nov 2020 12:29:45 -0500
Message-ID: <CADnq5_NAS5CCzHLPwL17-vy6tNLYw52+egThwid7Zdn2B=rMNQ@mail.gmail.com>
Subject: Re: [PATCH 27/40] drm/amd/amdgpu/amdgpu_ras: Remove unused function
 'amdgpu_ras_error_cure'
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
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBOb3YgMTMsIDIwMjAgYXQgODo1MCBBTSBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5h
cm8ub3JnPiB3cm90ZToKPgo+IEZpeGVzIHRoZSBmb2xsb3dpbmcgVz0xIGtlcm5lbCBidWlsZCB3
YXJuaW5nKHMpOgo+Cj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYzo5
MDg6NTogd2FybmluZzogbm8gcHJldmlvdXMgcHJvdG90eXBlIGZvciDigJhhbWRncHVfcmFzX2Vy
cm9yX2N1cmXigJkgWy1XbWlzc2luZy1wcm90b3R5cGVzXQo+Cj4gQ2M6IEFsZXggRGV1Y2hlciA8
YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KPiBDYzogIkNocmlzdGlhbiBLw7ZuaWciIDxjaHJp
c3RpYW4ua29lbmlnQGFtZC5jb20+Cj4gQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5p
ZT4KPiBDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgo+IENjOiBhbWQtZ2Z4QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwo+IENjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cj4gU2lnbmVkLW9mZi1ieTogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4KCkFwcGxp
ZWQuICBUaGFua3MhCgpBbGV4Cgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfcmFzLmMgfCA3IC0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDcgZGVsZXRpb25zKC0p
Cj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5j
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5jCj4gaW5kZXggYjk2MjY3
MDY4YTcyZC4uZjg5YTk5MTk5OTQyOCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfcmFzLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfcmFzLmMKPiBAQCAtOTA1LDEzICs5MDUsNiBAQCBpbnQgYW1kZ3B1X3Jhc19lcnJvcl9p
bmplY3Qoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCj4gICAgICAgICByZXR1cm4gcmV0Owo+
ICB9Cj4KPiAtaW50IGFtZGdwdV9yYXNfZXJyb3JfY3VyZShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAq
YWRldiwKPiAtICAgICAgICAgICAgICAgc3RydWN0IHJhc19jdXJlX2lmICppbmZvKQo+IC17Cj4g
LSAgICAgICAvKiBwc3AgZncgaGFzIG5vIGN1cmUgaW50ZXJmYWNlIGZvciBub3cuICovCj4gLSAg
ICAgICByZXR1cm4gMDsKPiAtfQo+IC0KPiAgLyogZ2V0IHRoZSB0b3RhbCBlcnJvciBjb3VudHMg
b24gYWxsIElQcyAqLwo+ICB1bnNpZ25lZCBsb25nIGFtZGdwdV9yYXNfcXVlcnlfZXJyb3JfY291
bnQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCj4gICAgICAgICAgICAgICAgIGJvb2wgaXNf
Y2UpCj4gLS0KPiAyLjI1LjEKPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWwK
