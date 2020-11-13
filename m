Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8956C2B2208
	for <lists+dri-devel@lfdr.de>; Fri, 13 Nov 2020 18:21:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 779AB6E508;
	Fri, 13 Nov 2020 17:21:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 737016E59D;
 Fri, 13 Nov 2020 17:21:32 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id d12so10705936wrr.13;
 Fri, 13 Nov 2020 09:21:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=SaGao1tKm3mRqKHn9uYPiR9Lgxh4rF18jpQ1IyMagMs=;
 b=pokhlglWjLCpsi+Qubq1+o3SojdpIF6vqNo8tiP+jWOODLOX0GJ435yGXTAom/WNom
 5D3R6VcCPJHXod+IzT+VR1LIvO7UmHFJ+S4Qwvgg1km0Jl4xov5Y0Q55JJYYEIsz+Ut6
 0/HqoqaOpqyU3Y5cSUz3lJ/k+zC+yJ8SpKtJWzsrQB88Fx28x+i5p36nnD9zfJnus5Ze
 9Q5wthfUAztVFarfbeuspBMRxZNwPOVMCsXP6ZBRJD2fnbpu+sR2nVC99w76Ia6IRrye
 H/FdJCQ1yy2B3zwgRAaN1uASo8EFXPqQmoB39PYBvLt5H6UVYM/Fmf+EIPktCtt6Zn2w
 q/Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=SaGao1tKm3mRqKHn9uYPiR9Lgxh4rF18jpQ1IyMagMs=;
 b=e9HJPd/Ek2y5Ds+QHnOjeM7AcYrw22yXyWsLN0gnj7lfZ+EQMC2wqOLMLATmBZXdFj
 nf/9F4FfEBRXvM9WtxCPLVoOP0DNmsx3ejwOEJjzTUJpqh0FF3+xJRJvZjZQERp0UYpi
 ed+6riMO4r9Z2X3DebTqvEHBUYh88G5CRT7I87heXiuaxOhU4XEUI1EvIU6gQaZJccul
 0zmYnQEiUV20l3LJgWtCk48SJit0WVHknRJnnGJAA7F4x85GdEiRk6N7DFs0NeLm+3l/
 yfmUc1DZbEYA7aY8dee1+hgfmBZWTiwv8NGG6BpV4/xHwvmyHYBu5rujvSMMbzy83nkb
 etkg==
X-Gm-Message-State: AOAM532ZLWk4iyp2OutnyOwKtYsoqlJ4ek9SLvT6cURK2qa6LBWFos4b
 Ye4azTbdOQ2SnQV2FEAhsWNCHGo9MC+Qi0gtZ6NgLBkK
X-Google-Smtp-Source: ABdhPJynB1E+xEniE0aIBmPKpJFPsVffvQtiSgMPbRJBSdgVZRIxmJd2duaz/aUMjwdEw1vd5Xq04oVsaVucUwy1cTM=
X-Received: by 2002:adf:e9c9:: with SMTP id l9mr5024750wrn.124.1605288088922; 
 Fri, 13 Nov 2020 09:21:28 -0800 (PST)
MIME-Version: 1.0
References: <20201113134938.4004947-1-lee.jones@linaro.org>
 <20201113134938.4004947-22-lee.jones@linaro.org>
In-Reply-To: <20201113134938.4004947-22-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 13 Nov 2020 12:21:17 -0500
Message-ID: <CADnq5_MU1jW68oamtqo+Vg3ASXdM9_WZ9HqJLSiwH+WYySUvLg@mail.gmail.com>
Subject: Re: [PATCH 21/40] drm/amd/amdgpu/amdgpu_virt: Make local function
 'amdgpu_virt_update_vf2pf_work_item()' static
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
YXJuaW5nKHMpOgo+Cj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92aXJ0LmM6
NTYwOjY6IHdhcm5pbmc6IG5vIHByZXZpb3VzIHByb3RvdHlwZSBmb3Ig4oCYYW1kZ3B1X3ZpcnRf
dXBkYXRlX3ZmMnBmX3dvcmtfaXRlbeKAmSBbLVdtaXNzaW5nLXByb3RvdHlwZXNdCj4KPiBDYzog
QWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgo+IENjOiAiQ2hyaXN0aWFu
IEvDtm5pZyIgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KPiBDYzogRGF2aWQgQWlybGllIDxh
aXJsaWVkQGxpbnV4LmllPgo+IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+Cj4g
Q2M6IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gQ2M6IGRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKPiBTaWduZWQtb2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5h
cm8ub3JnPgoKQXBwbGllZC4gIFRoYW5rcyEKCkFsZXgKCj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV92aXJ0LmMgfCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV92aXJ0LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfdmlydC5jCj4gaW5kZXggOGFmZjZlZjUwZjkxOC4uOTA1Yjg1MzkxZTY0YSAxMDA2NDQK
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdmlydC5jCj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZpcnQuYwo+IEBAIC01NTcsNyArNTU3
LDcgQEAgc3RhdGljIGludCBhbWRncHVfdmlydF93cml0ZV92ZjJwZl9kYXRhKHN0cnVjdCBhbWRn
cHVfZGV2aWNlICphZGV2KQo+ICAgICAgICAgcmV0dXJuIDA7Cj4gIH0KPgo+IC12b2lkIGFtZGdw
dV92aXJ0X3VwZGF0ZV92ZjJwZl93b3JrX2l0ZW0oc3RydWN0IHdvcmtfc3RydWN0ICp3b3JrKQo+
ICtzdGF0aWMgdm9pZCBhbWRncHVfdmlydF91cGRhdGVfdmYycGZfd29ya19pdGVtKHN0cnVjdCB3
b3JrX3N0cnVjdCAqd29yaykKPiAgewo+ICAgICAgICAgc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFk
ZXYgPSBjb250YWluZXJfb2Yod29yaywgc3RydWN0IGFtZGdwdV9kZXZpY2UsIHZpcnQudmYycGZf
d29yay53b3JrKTsKPgo+IC0tCj4gMi4yNS4xCj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwo+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiBkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVsCg==
