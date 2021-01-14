Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 090B62F66DB
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jan 2021 18:09:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4F8B6E112;
	Thu, 14 Jan 2021 17:09:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [IPv6:2607:f8b0:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB8576E0FB;
 Thu, 14 Jan 2021 17:09:41 +0000 (UTC)
Received: by mail-ot1-x330.google.com with SMTP id o11so5841485ote.4;
 Thu, 14 Jan 2021 09:09:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=PP8JE5c217gRoDVJCLejZjx16kM8emU+qTiJxyx5nEo=;
 b=usJkqjuY4p1amaQeSCnJmbev6MRgEF66fWJXOjX6Or/PJFfh3cMRqYjusuFaXNV9qP
 Wphi+XMAosPFkFVkDka3Kej/TufR9kqUCFIHjFmmxLX75R7IBsaBG7M+Y0rl8JP6AD1k
 Vs7Bl8kT4+9uR65zo1GXx3OpJM/xYbM1sCbcxHG4LTHmp8ZU6FF9fwWV0FFfw5HrUxe1
 NqLuFxwkcRtav6xTXXA3vdRnacaUPBgrYVnS5lpw1kuLJv7S8R9TFMmNRs/hdqITHhJs
 Oa8Zswh9aHaxktp1F90KlvmGuEpdGi63LbrgLpAKj6T+ENJghk15hnRB4FFVM13HT1rB
 +eTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=PP8JE5c217gRoDVJCLejZjx16kM8emU+qTiJxyx5nEo=;
 b=hEnRJQFZA449oyKYtktpWDJwmi0SWh5Rg269frAKcNRATVjdoA3PveFIOBuaLsx3a2
 mYiz7l2/d9pLS9E+09BKuisst/r5oBE+/gU9Rg7EWoTQ4kHAv/fL/ZFmHJCtjQrzjnuk
 Oe33od+9HS2jScMRJNZwVdhDd6YlZ0k45IgXfOQVb/3h4cdx3TRW2STJzDkLdKwrgaCm
 xk/OYzymNuQYvRYUXoOyKx6ggWpJ8J0rz+PfWds8cAiU5zuQvxqTVe903mvDSlKsXh+P
 7XyQK3yYQv7kR/6eizoXzc7oGNb6LYG3lSIJksNXX+C+hfL6EvBJSwkps3/QqYzF4BwZ
 sAVQ==
X-Gm-Message-State: AOAM531cxIthWWoSnV1KuJlVCZVqYeanw7yO4ncQoRLUnwo5mm9SGfZZ
 MuVp4hhz57Gi7eBk+ICWJNGyfXCl5pVQDi5bDoo=
X-Google-Smtp-Source: ABdhPJwHMFovgVFcpXbhJJ59jVrNPEJXn7I/BV2m1pE8Y+1ZrLLfTc/fcTVjseUJrIEMzw5MMeFqYFbgIRbIypIhUhA=
X-Received: by 2002:a9d:75d4:: with SMTP id c20mr5272258otl.311.1610644181186; 
 Thu, 14 Jan 2021 09:09:41 -0800 (PST)
MIME-Version: 1.0
References: <20210113080752.1003793-1-lee.jones@linaro.org>
 <20210113080752.1003793-9-lee.jones@linaro.org>
In-Reply-To: <20210113080752.1003793-9-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 14 Jan 2021 12:09:30 -0500
Message-ID: <CADnq5_NVQSOt6qqqGxKgVEqYpJRwOo+Tu_y+SZg2Er9SWA8pDA@mail.gmail.com>
Subject: Re: [PATCH 08/30] drm/amd/display/dc/core/dc_link_dp: Staticify local
 function 'linkRateInKHzToLinkRateMultiplier'
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

T24gV2VkLCBKYW4gMTMsIDIwMjEgYXQgMzowOCBBTSBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5h
cm8ub3JnPiB3cm90ZToKPgo+IEZpeGVzIHRoZSBmb2xsb3dpbmcgVz0xIGtlcm5lbCBidWlsZCB3
YXJuaW5nKHMpOgo+Cj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2Rpc3BsYXkvZGMv
Y29yZS9kY19saW5rX2RwLmM6MzcxMDoxOTogd2FybmluZzogbm8gcHJldmlvdXMgcHJvdG90eXBl
IGZvciDigJhsaW5rUmF0ZUluS0h6VG9MaW5rUmF0ZU11bHRpcGxpZXLigJkgWy1XbWlzc2luZy1w
cm90b3R5cGVzXQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9kaXNwbGF5L2RjL2Nv
cmUvZGNfbGlua19kcC5jOiBJbiBmdW5jdGlvbiDigJhkcGNkX3NldF9zb3VyY2Vfc3BlY2lmaWNf
ZGF0YeKAmToKPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9kYy9jb3Jl
L2RjX2xpbmtfZHAuYzo0NDAzOjE4OiB3YXJuaW5nOiB2YXJpYWJsZSDigJhyZXN1bHRfd3JpdGVf
bWluX2hibGFua+KAmSBzZXQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1idXQtc2V0LXZhcmlhYmxl
XQo+Cj4gQ2M6IEhhcnJ5IFdlbnRsYW5kIDxoYXJyeS53ZW50bGFuZEBhbWQuY29tPgo+IENjOiBM
ZW8gTGkgPHN1bnBlbmcubGlAYW1kLmNvbT4KPiBDYzogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIu
ZGV1Y2hlckBhbWQuY29tPgo+IENjOiAiQ2hyaXN0aWFuIEvDtm5pZyIgPGNocmlzdGlhbi5rb2Vu
aWdAYW1kLmNvbT4KPiBDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgo+IENjOiBE
YW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+Cj4gQ2M6IGFtZC1nZnhAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCj4gQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBTaWduZWQt
b2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgoKQXBwbGllZC4gIFRoYW5r
cyEKCkFsZXgKCj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2Rj
X2xpbmtfZHAuYyB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRl
bGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2Rj
L2NvcmUvZGNfbGlua19kcC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUv
ZGNfbGlua19kcC5jCj4gaW5kZXggMmZjMTIyMzliMjJjYi4uM2MzM2I4ZmUyMThlNSAxMDA2NDQK
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19saW5rX2RwLmMK
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19saW5rX2RwLmMK
PiBAQCAtMzcwNyw3ICszNzA3LDcgQEAgYm9vbCBkZXRlY3RfZHBfc2lua19jYXBzKHN0cnVjdCBk
Y19saW5rICpsaW5rKQo+ICAgICAgICAgLyogVE9ETyBzYXZlIHNpbmsgY2FwcyBpbiBsaW5rLT5z
aW5rICovCj4gIH0KPgo+IC1lbnVtIGRjX2xpbmtfcmF0ZSBsaW5rUmF0ZUluS0h6VG9MaW5rUmF0
ZU11bHRpcGxpZXIodWludDMyX3QgbGlua19yYXRlX2luX2toeikKPiArc3RhdGljIGVudW0gZGNf
bGlua19yYXRlIGxpbmtSYXRlSW5LSHpUb0xpbmtSYXRlTXVsdGlwbGllcih1aW50MzJfdCBsaW5r
X3JhdGVfaW5fa2h6KQo+ICB7Cj4gICAgICAgICBlbnVtIGRjX2xpbmtfcmF0ZSBsaW5rX3JhdGU7
Cj4gICAgICAgICAvLyBMaW5rUmF0ZSBpcyBub3JtYWxseSBzdG9yZWQgYXMgYSBtdWx0aXBsaWVy
IG9mIDAuMjcgR2JwcyBwZXIgbGFuZS4gRG8gdGhlIHRyYW5zbGF0aW9uLgo+IC0tCj4gMi4yNS4x
Cj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4g
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
