Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A17F2C9253
	for <lists+dri-devel@lfdr.de>; Tue,  1 Dec 2020 00:18:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E84988984C;
	Mon, 30 Nov 2020 23:18:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com
 [IPv6:2607:f8b0:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA1DF897B5;
 Mon, 30 Nov 2020 23:18:07 +0000 (UTC)
Received: by mail-oi1-x242.google.com with SMTP id w15so16095887oie.13;
 Mon, 30 Nov 2020 15:18:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=C7PinMSDxT1TDnGp4Uxl3lW8a+kzcDKRcBmpoKDWXck=;
 b=QqGSR/CecXkCQqNWiUVQ3x7oIKUjYWSlbL/kIrQv76YPayngtzffCNfLlAMNyLIrWx
 vJlIHFArtnWorW7U9iQFwHscmgrgKhkPRyM7X/AxNiiQU9MeSYOIwceX8InATsHxHEnD
 mtB5OCTPcn+QX8tsij/VO00sUER+7WYE1i2mPttiq1fC7q51TR2DyODZ4Dt1viz3svQa
 mombypA8IlE+Xn4O2ZcscFWGurbUkWwLyodOYQfNwdXsSzYGe1P47GRnnl+KU/ytYR0m
 JtzGWkwfcUjh+IbTulu0MzSPyjKJz2G6wR+FJBaV0tunY8dvjFcmB30HCcZec4k3BlIi
 fgFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=C7PinMSDxT1TDnGp4Uxl3lW8a+kzcDKRcBmpoKDWXck=;
 b=DjNyOk6kcOMYHwFzktk9gW6klSnbKPmdSgIScyhUhmC90zfHy0p3inoUFgOgrUYK+F
 D4N+pGnFxWjdYIgwjLwAeslcEIjWiTFloTyQRUsqucvt8hI1KbJC2aDRRaUNdapDKeE2
 WtO6NUCTx6ezscWKfInh2riJi9iTnN+Cmyf9gygLVG7rF77R/16mXCiCLhgzHtVhhEUz
 LZSzk1apd6VYff6IcVSsicVv1NovWc6CxLS+iH+/s7MELZLea411pdBR9w7HKfnwUsV0
 66VxEgIfP4oPaE3Twy8D5Em2jCYAl17bBYJ4e4v7IjOXi2wvnikK93QO9xYjlQCwwqLK
 JTJA==
X-Gm-Message-State: AOAM533n3UNdONK1uJlZzPnoX5dLuYaVnkCRYWgaKDkPg1LrxnCsMZvh
 GN662rB4D1ZA8IlmEXzAr9odH1OJU8Cpe/oAcEU=
X-Google-Smtp-Source: ABdhPJyveZpV+lcjNiVSe5NCFpk5s0+ulSEhgu6bAY1Pjr4rDw///J9UhNlLTgqW5QGCLGrtX0hOFWL6KbmrsfNYIug=
X-Received: by 2002:aca:f50e:: with SMTP id t14mr99714oih.123.1606778287242;
 Mon, 30 Nov 2020 15:18:07 -0800 (PST)
MIME-Version: 1.0
References: <20201126134240.3214176-1-lee.jones@linaro.org>
 <20201126134240.3214176-7-lee.jones@linaro.org>
In-Reply-To: <20201126134240.3214176-7-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 30 Nov 2020 18:17:56 -0500
Message-ID: <CADnq5_Ni=mj9KKcJn4wexsSKg1RK_GG_iDHz4Btk+6eBC0eHhQ@mail.gmail.com>
Subject: Re: [PATCH 06/40] drm/amd/pm/powerplay/smumgr/smu9_smumgr: Include
 our own header containing our prototypes
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
 Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBOb3YgMjYsIDIwMjAgYXQgODo0MyBBTSBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5h
cm8ub3JnPiB3cm90ZToKPgo+IEZpeGVzIHRoZSBmb2xsb3dpbmcgVz0xIGtlcm5lbCBidWlsZCB3
YXJuaW5nKHMpOgo+Cj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL3BtL3Bvd2VycGxh
eS9zbXVtZ3Ivc211OV9zbXVtZ3IuYzozODo2OiB3YXJuaW5nOiBubyBwcmV2aW91cyBwcm90b3R5
cGUgZm9yIOKAmHNtdTlfaXNfc21jX3JhbV9ydW5uaW5n4oCZIFstV21pc3NpbmctcHJvdG90eXBl
c10KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vcG0vcG93ZXJwbGF5L3NtdW1nci9z
bXU5X3NtdW1nci5jOjExMjo1OiB3YXJuaW5nOiBubyBwcmV2aW91cyBwcm90b3R5cGUgZm9yIOKA
mHNtdTlfc2VuZF9tc2dfdG9fc21j4oCZIFstV21pc3NpbmctcHJvdG90eXBlc10KPiAgZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vcG0vcG93ZXJwbGF5L3NtdW1nci9zbXU5X3NtdW1nci5j
OjE0MDo1OiB3YXJuaW5nOiBubyBwcmV2aW91cyBwcm90b3R5cGUgZm9yIOKAmHNtdTlfc2VuZF9t
c2dfdG9fc21jX3dpdGhfcGFyYW1ldGVy4oCZIFstV21pc3NpbmctcHJvdG90eXBlc10KPiAgZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vcG0vcG93ZXJwbGF5L3NtdW1nci9zbXU5X3NtdW1n
ci5jOjE2NToxMDogd2FybmluZzogbm8gcHJldmlvdXMgcHJvdG90eXBlIGZvciDigJhzbXU5X2dl
dF9hcmd1bWVudOKAmSBbLVdtaXNzaW5nLXByb3RvdHlwZXNdCj4KPiBDYzogRXZhbiBRdWFuIDxl
dmFuLnF1YW5AYW1kLmNvbT4KPiBDYzogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBh
bWQuY29tPgo+IENjOiAiQ2hyaXN0aWFuIEvDtm5pZyIgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNv
bT4KPiBDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgo+IENjOiBEYW5pZWwgVmV0
dGVyIDxkYW5pZWxAZmZ3bGwuY2g+Cj4gQ2M6IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cj4gQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBTaWduZWQtb2ZmLWJ5OiBM
ZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgoKQXBwbGllZC4gIFRoYW5rcyEKCkFsZXgK
Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG0vcG93ZXJwbGF5L3NtdW1nci9zbXU5X3Nt
dW1nci5jIHwgMSArCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+Cj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG0vcG93ZXJwbGF5L3NtdW1nci9zbXU5X3NtdW1n
ci5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wbS9wb3dlcnBsYXkvc211bWdyL3NtdTlfc211bWdy
LmMKPiBpbmRleCA4YTlhZWU4NTA0M2VjLi4yM2U1ZGUzYzRlYzE2IDEwMDY0NAo+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvcG0vcG93ZXJwbGF5L3NtdW1nci9zbXU5X3NtdW1nci5jCj4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wbS9wb3dlcnBsYXkvc211bWdyL3NtdTlfc211bWdyLmMK
PiBAQCAtMjIsNiArMjIsNyBAQAo+ICAgKi8KPgo+ICAjaW5jbHVkZSAic211bWdyLmgiCj4gKyNp
bmNsdWRlICJzbXU5X3NtdW1nci5oIgo+ICAjaW5jbHVkZSAidmVnYTEwX2luYy5oIgo+ICAjaW5j
bHVkZSAic29jMTVfY29tbW9uLmgiCj4gICNpbmNsdWRlICJwcF9kZWJ1Zy5oIgo+IC0tCj4gMi4y
NS4xCj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+
IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
