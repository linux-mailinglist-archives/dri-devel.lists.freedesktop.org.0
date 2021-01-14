Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 02BBD2F66F4
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jan 2021 18:15:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7D1789798;
	Thu, 14 Jan 2021 17:15:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [IPv6:2607:f8b0:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D09B89798;
 Thu, 14 Jan 2021 17:15:05 +0000 (UTC)
Received: by mail-ot1-x330.google.com with SMTP id c18so60233oto.3;
 Thu, 14 Jan 2021 09:15:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=v+IWiGsFZpYty9uPEMCbFqjqaqqlfa3/+90RuBzx60o=;
 b=ten/ALZCvZdzN086fa5oMkKYJcezQlWqXYa+356BpaFzTsBA82jf4vMt0ECAfFgpPu
 vhqCzyxC9gnklgm/vuVULZWq5T/pEF6Lk5dkAyBWV0/lNWpkgSd5nf/DhiPWvIS2YR9m
 GApsWRH2deCphZOz04NpVmiGvlCHQuunIQrYbarn4bAh93NUc4O9YD9bvrfP4Xw2yO52
 p98NMIV1S6RPJRnmykyn95ma9O+PxTUQPipKu4qW2OxqCCbeTuXEsIW9elKEToepCamU
 cU28kuMX7obX/k8ivRp1vNy/OYXGFitv1UwQFAz+uTA9k+5v+s63Ymw/ot4G5EFMltbG
 CzeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=v+IWiGsFZpYty9uPEMCbFqjqaqqlfa3/+90RuBzx60o=;
 b=EEVWTq54d2q5PZ/dPYg6HNGRKPNxsYhzsPWLrE55+BY9NcT88ylN5LA0UQpuAQhZoh
 Yp9lwbyzHGwDVwY7i5IZ2oUiUZM6EO8hUPlDckpcanYi0bcuKWD0jbi4cpfj8470Sslk
 oOhGdgPV3/dwUrmhPuHbq9EOZBJYkitWC1D1kXScD3ragKyzfGIaCP2ZGqwlz3OHZMjy
 cx7NyWtjCK5HJOZq1GWBK3BYZOhLlIaDpuvv7JEhl+KG4A2zb0Oea+7HQ3DrPorbW36B
 6OSK6+o6EWGoeBUgZlMReOFqhq61fgPGVyB9dh8geMM72PPTMBmSkQvX4YbEyjt0v/Vg
 c2EQ==
X-Gm-Message-State: AOAM531dvE9akY5576SX2sgCKN8R5h+guntI8Ts2FTCgELt5Q4iXg6M+
 qx7lL/rf6qXM7ipZbD6Fhurj4xKDWkNZDiO3RwyD47CG
X-Google-Smtp-Source: ABdhPJyNJkE4H9tRyMCJgxPE3E10+sCah9UThloK7fktb03JAQOwNC6kFkzOOzCmgkcMv9EvXNFYrMoRUM+lxEXjgLo=
X-Received: by 2002:a05:6830:1b7b:: with SMTP id
 d27mr5473943ote.132.1610644504422; 
 Thu, 14 Jan 2021 09:15:04 -0800 (PST)
MIME-Version: 1.0
References: <20210113080752.1003793-1-lee.jones@linaro.org>
 <20210113080752.1003793-16-lee.jones@linaro.org>
In-Reply-To: <20210113080752.1003793-16-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 14 Jan 2021 12:14:53 -0500
Message-ID: <CADnq5_McjDiGUNYfLaZV4F1rH_NZ-U3GMuEBpjFhEHYoChg3WQ@mail.gmail.com>
Subject: Re: [PATCH 15/30] drm/amd/display/dc/dce80/dce80_resource: Include
 our own header containing prototypes
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
 Alex Deucher <alexander.deucher@amd.com>, Anthony Koo <Anthony.Koo@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKYW4gMTMsIDIwMjEgYXQgMzowOCBBTSBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5h
cm8ub3JnPiB3cm90ZToKPgo+IEZpeGVzIHRoZSBmb2xsb3dpbmcgVz0xIGtlcm5lbCBidWlsZCB3
YXJuaW5nKHMpOgo+Cj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2Rpc3BsYXkvZGMv
ZGNlODAvZGNlODBfcmVzb3VyY2UuYzoxMTI2OjIzOiB3YXJuaW5nOiBubyBwcmV2aW91cyBwcm90
b3R5cGUgZm9yIOKAmGRjZTgwX2NyZWF0ZV9yZXNvdXJjZV9wb29s4oCZIFstV21pc3NpbmctcHJv
dG90eXBlc10KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9kYy9kY2U4
MC9kY2U4MF9yZXNvdXJjZS5jOjEzMjU6MjM6IHdhcm5pbmc6IG5vIHByZXZpb3VzIHByb3RvdHlw
ZSBmb3Ig4oCYZGNlODFfY3JlYXRlX3Jlc291cmNlX3Bvb2zigJkgWy1XbWlzc2luZy1wcm90b3R5
cGVzXQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9kaXNwbGF5L2RjL2RjZTgwL2Rj
ZTgwX3Jlc291cmNlLmM6MTUyMDoyMzogd2FybmluZzogbm8gcHJldmlvdXMgcHJvdG90eXBlIGZv
ciDigJhkY2U4M19jcmVhdGVfcmVzb3VyY2VfcG9vbOKAmSBbLVdtaXNzaW5nLXByb3RvdHlwZXNd
Cj4KPiBDYzogSGFycnkgV2VudGxhbmQgPGhhcnJ5LndlbnRsYW5kQGFtZC5jb20+Cj4gQ2M6IExl
byBMaSA8c3VucGVuZy5saUBhbWQuY29tPgo+IENjOiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5k
ZXVjaGVyQGFtZC5jb20+Cj4gQ2M6ICJDaHJpc3RpYW4gS8O2bmlnIiA8Y2hyaXN0aWFuLmtvZW5p
Z0BhbWQuY29tPgo+IENjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+Cj4gQ2M6IERh
bmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KPiBDYzogQW50aG9ueSBLb28gPEFudGhvbnku
S29vQGFtZC5jb20+Cj4gQ2M6IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gQ2M6IGRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBTaWduZWQtb2ZmLWJ5OiBMZWUgSm9uZXMg
PGxlZS5qb25lc0BsaW5hcm8ub3JnPgoKQXBwbGllZC4gIFRoYW5rcyEKCkFsZXgKCj4gLS0tCj4g
IGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2U4MC9kY2U4MF9yZXNvdXJjZS5jIHwg
MiArKwo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZTgwL2RjZTgwX3Jlc291cmNlLmMgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlODAvZGNlODBfcmVzb3VyY2UuYwo+IGlu
ZGV4IGZlNWQ3MTYwODQzNjMuLjcyNWQ5MmU0MGNkMzAgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZTgwL2RjZTgwX3Jlc291cmNlLmMKPiArKysgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlODAvZGNlODBfcmVzb3VyY2UuYwo+IEBAIC02
MCw2ICs2MCw4IEBACj4gICNpbmNsdWRlICJkY2UvZGNlX2kyYy5oIgo+ICAvKiBUT0RPIHJlbW92
ZSB0aGlzIGluY2x1ZGUgKi8KPgo+ICsjaW5jbHVkZSAiZGNlODBfcmVzb3VyY2UuaCIKPiArCj4g
ICNpZm5kZWYgbW1NQ19IVUJfUkRSRVFfRE1JRl9MSU1JVAo+ICAjaW5jbHVkZSAiZ21jL2dtY183
XzFfZC5oIgo+ICAjaW5jbHVkZSAiZ21jL2dtY183XzFfc2hfbWFzay5oIgo+IC0tCj4gMi4yNS4x
Cj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4g
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
