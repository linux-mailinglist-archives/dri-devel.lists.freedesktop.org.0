Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED7222EF93F
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jan 2021 21:33:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 257B76E8CA;
	Fri,  8 Jan 2021 20:33:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B6EC6E8CA;
 Fri,  8 Jan 2021 20:33:25 +0000 (UTC)
Received: by mail-oi1-x233.google.com with SMTP id s75so12798056oih.1;
 Fri, 08 Jan 2021 12:33:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ZYvjPoOvzJBIn24kQKs5FPm5ZLIlN4myojPVOGBPV34=;
 b=crftWgJUHppE4xpnQ9WV+PbL58v5axlyYfAewl1c+EKy61Dvuy53KFTi/S3PLdBJDQ
 mLYM4uYHOgw0uPiUXE7he2yA8H0rtzm/ig+41FrqtDkqXIM23uDNnIKuOl60/ZfiP7uR
 vPiZQj9L61iIFToOrYfyxFv/BPctAShyy9OlNBRqgkeQxnfLGvrszUdlXVznH3FmZ40T
 rYnmBm42yTSBLkKksxQQzu9+zyaWJYFKgdv01z3GyCVpvUuhDc/E/8aBuTdoipw5WRHc
 IY4UG2PXjRQ6vhDiVOruCy+zUgrymwvnn4V7ifzr/WglcBPfgiiL9NtmadlrteJ+vwhl
 phmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ZYvjPoOvzJBIn24kQKs5FPm5ZLIlN4myojPVOGBPV34=;
 b=k881C5OIcmGv51rauGn8fwurbzA1DmwIAZMv1TtkTwxN8cLXcWBhedmVmzW+PFrpRO
 2pPKDjl2sdIzoFi+fn3xVHqZyRc5nr/xUyJZG8tPe7Ab8BkAFbDtPQWNBg5opwIUrGkC
 aiPu24PmAz/UV7JuRsv8b7wVYb1dzhZqx8LCS322YEM7FSp6pDmndvuw5bWnDng/vElb
 qteBUF+Ln+LJuqsNlvPm46OlaBezz80C3wDNHsRi+l2PHw+BfJNLpzNtJb7vRkonqxxr
 vI/NKS7hnI1fTqJpDdBvSFPAwX6aPSnBcNhr+VB9OhKdAupINrIRA2ntuGZdnEOdItDk
 4tcQ==
X-Gm-Message-State: AOAM5313O8jEdXtD5E6kqsGhiirCxrzMOt4WF5zTB+AAGZmUtdpx1h5/
 vxRz0zLZ4WmdEFUUHXmdsewQv9UtxU1l3zZQ2RI=
X-Google-Smtp-Source: ABdhPJzfCJ8M3CUxtMAGHA/Xdc7hA7kyHDnB8qKu7wRXKdztQGcJ0JssgTBETYQ5JCXKzBsrU1OmY74hy+NwqQs/UVs=
X-Received: by 2002:aca:6202:: with SMTP id w2mr3290407oib.5.1610138005384;
 Fri, 08 Jan 2021 12:33:25 -0800 (PST)
MIME-Version: 1.0
References: <20210108201457.3078600-1-lee.jones@linaro.org>
 <20210108201457.3078600-8-lee.jones@linaro.org>
In-Reply-To: <20210108201457.3078600-8-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 8 Jan 2021 15:33:13 -0500
Message-ID: <CADnq5_NeuyCvFFTiRL6vi0ebNcmjCTCK1aCPE-NoOmNrimbZPQ@mail.gmail.com>
Subject: Re: [PATCH 07/40] drm/amd/pm/powerplay/hwmgr/ppatomctrl: Fix
 documentation for 'mpll_param'
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

T24gRnJpLCBKYW4gOCwgMjAyMSBhdCAzOjE1IFBNIExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFy
by5vcmc+IHdyb3RlOgo+Cj4gRml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdh
cm5pbmcocyk6Cj4KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vcG0vcG93ZXJwbGF5
L2h3bWdyL3BwYXRvbWN0cmwuYzoyOTA6IHdhcm5pbmc6IEZ1bmN0aW9uIHBhcmFtZXRlciBvciBt
ZW1iZXIgJ21wbGxfcGFyYW0nIG5vdCBkZXNjcmliZWQgaW4gJ2F0b21jdHJsX2dldF9tZW1vcnlf
cGxsX2RpdmlkZXJzX3NpJwo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9wbS9wb3dl
cnBsYXkvaHdtZ3IvcHBhdG9tY3RybC5jOjI5MDogd2FybmluZzogRXhjZXNzIGZ1bmN0aW9uIHBh
cmFtZXRlciAnZGl2aWRlcnMnIGRlc2NyaXB0aW9uIGluICdhdG9tY3RybF9nZXRfbWVtb3J5X3Bs
bF9kaXZpZGVyc19zaScKPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vcG0vcG93ZXJw
bGF5L2h3bWdyL3BwYXRvbWN0cmwuYzozMzk6IHdhcm5pbmc6IEZ1bmN0aW9uIHBhcmFtZXRlciBv
ciBtZW1iZXIgJ21wbGxfcGFyYW0nIG5vdCBkZXNjcmliZWQgaW4gJ2F0b21jdHJsX2dldF9tZW1v
cnlfcGxsX2RpdmlkZXJzX3ZpJwo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9wbS9w
b3dlcnBsYXkvaHdtZ3IvcHBhdG9tY3RybC5jOjMzOTogd2FybmluZzogRXhjZXNzIGZ1bmN0aW9u
IHBhcmFtZXRlciAnZGl2aWRlcnMnIGRlc2NyaXB0aW9uIGluICdhdG9tY3RybF9nZXRfbWVtb3J5
X3BsbF9kaXZpZGVyc192aScKPgo+IENjOiBFdmFuIFF1YW4gPGV2YW4ucXVhbkBhbWQuY29tPgo+
IENjOiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Cj4gQ2M6ICJDaHJp
c3RpYW4gS8O2bmlnIiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgo+IENjOiBEYXZpZCBBaXJs
aWUgPGFpcmxpZWRAbGludXguaWU+Cj4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5j
aD4KPiBDYzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBDYzogZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwo+IFNpZ25lZC1vZmYtYnk6IExlZSBKb25lcyA8bGVlLmpvbmVz
QGxpbmFyby5vcmc+CgpBcHBsaWVkLiAgVGhhbmtzIQoKQWxleAoKPiAtLS0KPiAgZHJpdmVycy9n
cHUvZHJtL2FtZC9wbS9wb3dlcnBsYXkvaHdtZ3IvcHBhdG9tY3RybC5jIHwgNCArKy0tCj4gIDEg
ZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wbS9wb3dlcnBsYXkvaHdtZ3IvcHBhdG9tY3RybC5j
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wbS9wb3dlcnBsYXkvaHdtZ3IvcHBhdG9tY3RybC5jCj4g
aW5kZXggODNhNjUwNGUwOTNjYi4uYjEwMzhkMzBjOGRjYyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL3BtL3Bvd2VycGxheS9od21nci9wcGF0b21jdHJsLmMKPiArKysgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL3BtL3Bvd2VycGxheS9od21nci9wcGF0b21jdHJsLmMKPiBAQCAtMjc5
LDcgKzI3OSw3IEBAIHN0YXRpYyBjb25zdCBBVE9NX1ZPTFRBR0VfT0JKRUNUX1YzICphdG9tY3Ry
bF9sb29rdXBfdm9sdGFnZV90eXBlX3YzKAo+ICAgKgo+ICAgKiBAaHdtZ3I6ICAgICAgICAgICBp
bnB1dCBwYXJhbWV0ZXI6IHBvaW50ZXIgdG8gSHdNZ3IKPiAgICogQGNsb2NrX3ZhbHVlOiAgICAg
aW5wdXQgcGFyYW1ldGVyOiBtZW1vcnkgY2xvY2sKPiAtICogQGRpdmlkZXJzOiAgICAgICAgb3V0
cHV0IHBhcmFtZXRlcjogbWVtb3J5IFBMTCBkaXZpZGVycwo+ICsgKiBAbXBsbF9wYXJhbTogICAg
ICBvdXRwdXQgcGFyYW1ldGVyOiBtZW1vcnkgY2xvY2sgcGFyYW1ldGVycwo+ICAgKiBAc3Ryb2Jl
X21vZGU6ICAgICBpbnB1dCBwYXJhbWV0ZXI6IDEgZm9yIHN0cm9iZSBtb2RlLCAgMCBmb3IgcGVy
Zm9ybWFuY2UgbW9kZQo+ICAgKi8KPiAgaW50IGF0b21jdHJsX2dldF9tZW1vcnlfcGxsX2Rpdmlk
ZXJzX3NpKAo+IEBAIC0zMzIsNyArMzMyLDcgQEAgaW50IGF0b21jdHJsX2dldF9tZW1vcnlfcGxs
X2RpdmlkZXJzX3NpKAo+ICAgKgo+ICAgKiBAaHdtZ3I6ICAgICAgICAgICAgICAgICBpbnB1dCBw
YXJhbWV0ZXI6IHBvaW50ZXIgdG8gSHdNZ3IKPiAgICogQGNsb2NrX3ZhbHVlOiAgICAgICAgICAg
aW5wdXQgcGFyYW1ldGVyOiBtZW1vcnkgY2xvY2sKPiAtICogQGRpdmlkZXJzOiAgICAgICAgICAg
ICAgb3V0cHV0IHBhcmFtZXRlcjogbWVtb3J5IFBMTCBkaXZpZGVycwo+ICsgKiBAbXBsbF9wYXJh
bTogICAgICAgICAgICBvdXRwdXQgcGFyYW1ldGVyOiBtZW1vcnkgY2xvY2sgcGFyYW1ldGVycwo+
ICAgKi8KPiAgaW50IGF0b21jdHJsX2dldF9tZW1vcnlfcGxsX2RpdmlkZXJzX3ZpKHN0cnVjdCBw
cF9od21nciAqaHdtZ3IsCj4gICAgICAgICAgICAgICAgIHVpbnQzMl90IGNsb2NrX3ZhbHVlLCBw
cF9hdG9tY3RybF9tZW1vcnlfY2xvY2tfcGFyYW0gKm1wbGxfcGFyYW0pCj4gLS0KPiAyLjI1LjEK
Pgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gZHJp
LWRldmVsIG1haWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbApf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
