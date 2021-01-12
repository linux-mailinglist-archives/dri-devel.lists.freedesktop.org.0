Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98B692F3C4A
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jan 2021 23:26:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A31FC89AC0;
	Tue, 12 Jan 2021 22:26:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc31.google.com (mail-oo1-xc31.google.com
 [IPv6:2607:f8b0:4864:20::c31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9369589AC0;
 Tue, 12 Jan 2021 22:26:03 +0000 (UTC)
Received: by mail-oo1-xc31.google.com with SMTP id o5so17876oop.12;
 Tue, 12 Jan 2021 14:26:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=SNbCI8QXsw68f7cArm3g7fzx51ypEltbTSdK1JYnPSE=;
 b=rvB9yn151kICpyUsGCIqOBZDBv/QMlydvjzDatPpjwhMAi5h887EeYglO0YrS60Bug
 TADqyb9R1oD8GPT3BR3IuQZamXvr3s7P2He1HZWLlekMpfDzQR+hiVlb90yGC/SXHX6T
 X/Bn4AgH8eZqvA/nrm/X5OugRdmCQ/YWmx6c2XA1Rn1uxMyGkGKzmWA41iM+k4ddK+vq
 y4YPI5i84iT3PUz+u7k8lXJb5NTUWDqXi5tK0Ix3xWYSKO6NhkzzKJTtreASboCL/wbn
 7TOYFRfi4u6uBl/pGjvYt12jxCUQsyrHLGm95L+hBFdz8Iv3+8YnWGj0E0ml5bq/CJus
 jUug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=SNbCI8QXsw68f7cArm3g7fzx51ypEltbTSdK1JYnPSE=;
 b=ufmhCmlkerf3PouWyKSUeExkBJQ32+u88X2AmUKHabyD4e05mB94BqQgnYJCY7yA0N
 IC6oF3IUBgADKYcSwolxY6NX/CAeaj4bWSZ8ulF5I1okmji0I286m99b8hWRpUh5XqZQ
 XKSXJgq2zdvL5YzqYod0/l1YjyMScTgXxfAOK7M3Zz6EaixlRqWZ3qvBl2/Q0mE3ASHZ
 ngP3FeJ+E99BorauJDTpwiAGk7mHZXxP10Bu6WlMAEQDaZDOVJQz/6dl626qRxYXRIv/
 KA45zHx0y30Az6IEdJM4rInblioWV7+XLYZ4kPfqF9ZYKPouDwJB19x1xiP0z/rozyIa
 C8gA==
X-Gm-Message-State: AOAM532lFm6t2f4M8papJnunD4FbUtxwKirHFw/zI0DRFBA52rtlbcv7
 9L66ruUuSf+UHYbeBAi96aXm2GIKmgjyh48N2Vg=
X-Google-Smtp-Source: ABdhPJwl82AhUlOj+8xTD00jkCRkRwEUvm+f6rSMzzMnuxSDkDI6yDrzeHf+3NyTqb+2neWNTj3xNpDc8ungkzhghtA=
X-Received: by 2002:a4a:a2c5:: with SMTP id r5mr786480ool.72.1610490362947;
 Tue, 12 Jan 2021 14:26:02 -0800 (PST)
MIME-Version: 1.0
References: <20210111191926.3688443-1-lee.jones@linaro.org>
 <20210111191926.3688443-25-lee.jones@linaro.org>
In-Reply-To: <20210111191926.3688443-25-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 12 Jan 2021 17:25:51 -0500
Message-ID: <CADnq5_PEmMUY8G8Yetd5t6g3KPMyNSz4vcp4rXk5+6reXjtyeg@mail.gmail.com>
Subject: Re: [PATCH 24/40] drm/amd/pm/swsmu/smu11/vangogh_ppt: Make local
 function 'vangogh_clk_dpm_is_enabled' static
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
Cc: Xiaojian Du <Xiaojian.Du@amd.com>, David Airlie <airlied@linux.ie>,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKYW4gMTEsIDIwMjEgYXQgMjoyMCBQTSBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5h
cm8ub3JnPiB3cm90ZToKPgo+IEZpeGVzIHRoZSBmb2xsb3dpbmcgVz0xIGtlcm5lbCBidWlsZCB3
YXJuaW5nKHMpOgo+Cj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL3BtL3N3c211L3Nt
dTExL3ZhbmdvZ2hfcHB0LmM6NjEzOjY6IHdhcm5pbmc6IG5vIHByZXZpb3VzIHByb3RvdHlwZSBm
b3Ig4oCYdmFuZ29naF9jbGtfZHBtX2lzX2VuYWJsZWTigJkgWy1XbWlzc2luZy1wcm90b3R5cGVz
XQo+Cj4gQ2M6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KPiBDYzog
IkNocmlzdGlhbiBLw7ZuaWciIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cj4gQ2M6IERhdmlk
IEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KPiBDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZm
d2xsLmNoPgo+IENjOiBYaWFvamlhbiBEdSA8WGlhb2ppYW4uRHVAYW1kLmNvbT4KPiBDYzogYW1k
LWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwo+IFNpZ25lZC1vZmYtYnk6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+
CgpBcHBsaWVkIHRoZSBzYW1lIHBhdGNoIGZyb20gc29tZW9uZSBlbHNlIGVhcmxpZXIgdG9kYXku
ICBUaGFua3MhCgpBbGV4Cgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL3BtL3N3c211L3Nt
dTExL3ZhbmdvZ2hfcHB0LmMgfCA0ICsrLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9u
cygrKSwgMiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L3BtL3N3c211L3NtdTExL3ZhbmdvZ2hfcHB0LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3BtL3N3
c211L3NtdTExL3ZhbmdvZ2hfcHB0LmMKPiBpbmRleCA3NWRkY2FkZjM4MDJhLi4zN2JkNGM2NDc0
MThkIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG0vc3dzbXUvc211MTEvdmFu
Z29naF9wcHQuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG0vc3dzbXUvc211MTEvdmFu
Z29naF9wcHQuYwo+IEBAIC02MTAsOCArNjEwLDggQEAgc3RhdGljIGludCB2YW5nb2doX2dldF9w
cm9maWxpbmdfY2xrX21hc2soc3RydWN0IHNtdV9jb250ZXh0ICpzbXUsCj4gICAgICAgICByZXR1
cm4gMDsKPiAgfQo+Cj4gLWJvb2wgdmFuZ29naF9jbGtfZHBtX2lzX2VuYWJsZWQoc3RydWN0IHNt
dV9jb250ZXh0ICpzbXUsCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBlbnVtIHNt
dV9jbGtfdHlwZSBjbGtfdHlwZSkKPiArc3RhdGljIGJvb2wgdmFuZ29naF9jbGtfZHBtX2lzX2Vu
YWJsZWQoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUsCj4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgZW51bSBzbXVfY2xrX3R5cGUgY2xrX3R5cGUpCj4gIHsKPiAgICAgICAg
IGVudW0gc211X2ZlYXR1cmVfbWFzayBmZWF0dXJlX2lkID0gMDsKPgo+IC0tCj4gMi4yNS4xCj4K
PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
