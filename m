Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 725452EF932
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jan 2021 21:30:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F76B6E8CB;
	Fri,  8 Jan 2021 20:30:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [IPv6:2607:f8b0:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F02F16E8CA;
 Fri,  8 Jan 2021 20:30:50 +0000 (UTC)
Received: by mail-ot1-x333.google.com with SMTP id x13so10906899oto.8;
 Fri, 08 Jan 2021 12:30:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=8rX5uQHouoI4FRLqYNMC44Y4GpGcbHM8bJ4cljG7WHw=;
 b=VxZNWixJ9jeyM+bRpStXCk4K+N3m4Y9Ybu9ZCvuqS+CqhTWY1XWogyftNuSMgnEt90
 ZWXsoD5HgCuGbbR8yxZJm4DvSQUw17tQ6O0QsVdUjg45cjKPEYUpH1FCcejSkq6ORIYn
 XAcAM/S0kVwh7zsTDEr8rAQB1UU1psvDMPg7jCpp5DSEHM2hpkMDDVQB/PW98ZIWMbr3
 x67+sermSbPEUWP8Ar+zVI9n2jXRI9ynkgBaIV+S/4Y/Z7YxTxIg48Oxwai3JoCgj9Fm
 ZUrwzATMTbL/qZ5Va1HBYi6CQAw6oGXcMbPgp9o4dnLqEELRyvGE4WLSrUCDARalPWOW
 eIaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=8rX5uQHouoI4FRLqYNMC44Y4GpGcbHM8bJ4cljG7WHw=;
 b=Mviyh28dYA8hPpCglQvTB7wJJdGYWbgPQHY57Gq3thw4Om3y1jwxacYGp3g0EedcNV
 1kxHESELvHY/NiTkHEz9cDrJmVMUZi/1H9lk9rfpUQwnUadxk7UikF2mxPa192Ivjd4n
 0U0gSJwUS4W5fUv4KmXfzzHz+9rQDcMXY+3EjKKK3Nqjgdp93v2C98Lra4++85//tpcX
 EuZIpzk63cWYL/cNGQDMQ6k4AMeuy3Zb7+WYYR5RrGt0XvJ1SJ7xAScYinfwV+sBg2Xa
 KZWO8UWqxuI952/tu0EiXbCeLhV3Ar/uBs3ZcLKbE+xxBfidoSNDH72EsiSiHAbaWT5n
 TZTg==
X-Gm-Message-State: AOAM533di78QOOg9vQ6C9MBAL7U0xRURu8wd0KhnmBbHzoi7qbwCXc7L
 kFIQzNzrSBfbiJ84o6qBAXGBqkV9oe+Kr+YpvH4=
X-Google-Smtp-Source: ABdhPJz7Zw0UXJkV9YhbqEzt+3/lMNn51AX5yaKpxgYs2S9iN5GxGCnckdi3xe1/x6OJGrPsnJjXsOH6rXR/u32R+7A=
X-Received: by 2002:a05:6830:1d66:: with SMTP id
 l6mr3782098oti.23.1610137850323; 
 Fri, 08 Jan 2021 12:30:50 -0800 (PST)
MIME-Version: 1.0
References: <20210108201457.3078600-1-lee.jones@linaro.org>
 <20210108201457.3078600-5-lee.jones@linaro.org>
In-Reply-To: <20210108201457.3078600-5-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 8 Jan 2021 15:30:38 -0500
Message-ID: <CADnq5_M7R1rhP73iUWg+mcOTm_n+j8h2nh0ykLRUVda2xmNvMA@mail.gmail.com>
Subject: Re: [PATCH 04/40] drm/amd/amdgpu/amdgpu_ih: Update
 'amdgpu_ih_decode_iv_helper()'s function header
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
Cc: David Airlie <airlied@linux.ie>, Felix Kuehling <Felix.Kuehling@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKYW4gOCwgMjAyMSBhdCAzOjE1IFBNIExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFy
by5vcmc+IHdyb3RlOgo+Cj4gRml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdh
cm5pbmcocyk6Cj4KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2loLmM6MjIw
OiB3YXJuaW5nOiBGdW5jdGlvbiBwYXJhbWV0ZXIgb3IgbWVtYmVyICdpaCcgbm90IGRlc2NyaWJl
ZCBpbiAnYW1kZ3B1X2loX2RlY29kZV9pdl9oZWxwZXInCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9paC5jOjIyMDogd2FybmluZzogRnVuY3Rpb24gcGFyYW1ldGVyIG9yIG1l
bWJlciAnZW50cnknIG5vdCBkZXNjcmliZWQgaW4gJ2FtZGdwdV9paF9kZWNvZGVfaXZfaGVscGVy
Jwo+Cj4gQ2M6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KPiBDYzog
IkNocmlzdGlhbiBLw7ZuaWciIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cj4gQ2M6IERhdmlk
IEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KPiBDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZm
d2xsLmNoPgo+IENjOiBGZWxpeCBLdWVobGluZyA8RmVsaXguS3VlaGxpbmdAYW1kLmNvbT4KPiBD
YzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBDYzogZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwo+IFNpZ25lZC1vZmYtYnk6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFy
by5vcmc+CgpBcHBsaWVkLiAgVGhhbmtzIQoKQWxleAoKPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X2loLmMgfCAyICsrCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2Vy
dGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfaWguYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9paC5jCj4gaW5kZXgg
NzI1YTljNzNkNTFmMC4uZGM4NTJhZjRmM2I3NiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfaWguYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9paC5jCj4gQEAgLTIwOSw2ICsyMDksOCBAQCBpbnQgYW1kZ3B1X2loX3Byb2Nl
c3Moc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsIHN0cnVjdCBhbWRncHVfaWhfcmluZyAqaWgp
Cj4gICAqIGFtZGdwdV9paF9kZWNvZGVfaXZfaGVscGVyIC0gZGVjb2RlIGFuIGludGVycnVwdCB2
ZWN0b3IKPiAgICoKPiAgICogQGFkZXY6IGFtZGdwdV9kZXZpY2UgcG9pbnRlcgo+ICsgKiBAaWg6
IGloIHJpbmcgdG8gcHJvY2Vzcwo+ICsgKiBAZW50cnk6IElWIGVudHJ5Cj4gICAqCj4gICAqIERl
Y29kZXMgdGhlIGludGVycnVwdCB2ZWN0b3IgYXQgdGhlIGN1cnJlbnQgcnB0cgo+ICAgKiBwb3Np
dGlvbiBhbmQgYWxzbyBhZHZhbmNlIHRoZSBwb3NpdGlvbiBmb3IgZm9yIFZlZ2ExMAo+IC0tCj4g
Mi4yNS4xCj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Xwo+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
