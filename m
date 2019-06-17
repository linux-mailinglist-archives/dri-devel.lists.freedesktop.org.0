Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E792B48635
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2019 16:56:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EE96890B9;
	Mon, 17 Jun 2019 14:55:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
 [209.85.160.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 844B4890AF;
 Mon, 17 Jun 2019 14:55:58 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id x47so10993529qtk.11;
 Mon, 17 Jun 2019 07:55:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nLt9ZHlsi0Mo2ZjZlBll3f1E3rXQj8ngnIQB0JKvcQ8=;
 b=VsuvDsQ8FPZ87O8GOqztkQ//SKcJznLBhgctyY1rDQ6323No9V9C13NJ40kdKbTKVM
 IEHdiubLpkKPH/XVL6G0B+ISZwZAfCOQzUTWHsx+jU57gHNTKEpcJFgv7zt87m4xcxJN
 n9F3nccdjZFCcER5yWzmtI7+/NTb/Bd69U2Mu7O0pb+/mkCTnLaC+ubjQVRyre2EYMIT
 zuLSseeRdZ7V6wPhgE1lCt1UO3hElsTEbNj5ALTuznK+G8CyfcpB81INYOJiOEXVWwnL
 +RYiS24unXU3Tp3UY79l/jpi1+nCp9koFFnoH8vxcrwIG+iLKOGjPa/NJceNDCcvqXsF
 R3DA==
X-Gm-Message-State: APjAAAVadn4BgsDdBmrc9vTr3DOFuQtehhHojw3cPlJWfMSe8A1UCBU2
 1tUayt3tKJAoq2RAZJUB+AZ9iM0ngpPBoW1noGc=
X-Google-Smtp-Source: APXvYqx3pBYXn/aH9OmUnV1E8DvaJlX+VwTvOQB7RTbuTrROkMdV/xIuWGgCG5AUexpYMZQTA9GZIYm4cMyrwmEQCVE=
X-Received: by 2002:aed:33a4:: with SMTP id v33mr60323126qtd.18.1560783357568; 
 Mon, 17 Jun 2019 07:55:57 -0700 (PDT)
MIME-Version: 1.0
References: <20190617123915.926526-1-arnd@arndb.de>
 <20190617144109.GA14528@ravnborg.org>
In-Reply-To: <20190617144109.GA14528@ravnborg.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 17 Jun 2019 16:55:40 +0200
Message-ID: <CAK8P3a2tPrYxDpP7EU34=+N3P5+jwSX4XkA1AV6K-YYCQNt_sw@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: include missing linux/delay.h
To: Sam Ravnborg <sam@ravnborg.org>
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Eric Yang <eric.yang2@amd.com>, Thomas Lim <Thomas.Lim@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 amd-gfx@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>,
 Tony Cheng <tony.cheng@amd.com>, dri-devel <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, Charlene Liu <charlene.liu@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Anthony Koo <Anthony.Koo@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKdW4gMTcsIDIwMTkgYXQgNDo0MSBQTSBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9y
Zy5vcmc+IHdyb3RlOgo+IE9uIE1vbiwgSnVuIDE3LCAyMDE5IGF0IDAyOjM4OjU1UE0gKzAyMDAs
IEFybmQgQmVyZ21hbm4gd3JvdGU6Cj4gPiBTb21lIHJhbmRjb25maWcgYnVpbGRzIGZhaWwgdG8g
Y29tcGlsZSB0aGUgZGNuMTAgY29kZSBiZWNhdXNlIG9mCj4gPiBhIG1pc3NpbmcgZGVjbGFyYXRp
b246Cj4gPgo+ID4gZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9kYy9kY24x
MC9kY24xMF9od19zZXF1ZW5jZXIuYzogSW4gZnVuY3Rpb24gJ2RjbjEwX2FwcGx5X2N0eF9mb3Jf
c3VyZmFjZSc6Cj4gPiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9kaXNwbGF5L2RjL2Rj
bjEwL2RjbjEwX2h3X3NlcXVlbmNlci5jOjIzNzg6MzogZXJyb3I6IGltcGxpY2l0IGRlY2xhcmF0
aW9uIG9mIGZ1bmN0aW9uICd1ZGVsYXknIFstV2Vycm9yPWltcGxpY2l0LWZ1bmN0aW9uLWRlY2xh
cmF0aW9uXQo+ID4KPiA+IEluY2x1ZGUgdGhlIGFwcHJvcHJpYXRlIGtlcm5lbCBoZWFkZXIuCj4g
Pgo+ID4gRml4ZXM6IDllZDQzZWY4NGQ5ZCAoImRybS9hbWQvZGlzcGxheTogQWRkIFVuZGVyZmxv
dyBBc3NlcnRzIHRvIGRjIikKPiA+IFNpZ25lZC1vZmYtYnk6IEFybmQgQmVyZ21hbm4gPGFybmRA
YXJuZGIuZGU+Cj4gPiAtLS0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNu
MTAvZGNuMTBfaHdfc2VxdWVuY2VyLmMgfCAxICsKPiA+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKykKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5
L2RjL2RjbjEwL2RjbjEwX2h3X3NlcXVlbmNlci5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNw
bGF5L2RjL2RjbjEwL2RjbjEwX2h3X3NlcXVlbmNlci5jCj4gPiBpbmRleCAxYWM5YTRmMDM5OTAu
LmQ4N2RkYzdkZTljNiAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxh
eS9kYy9kY24xMC9kY24xMF9od19zZXF1ZW5jZXIuYwo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9kaXNwbGF5L2RjL2RjbjEwL2RjbjEwX2h3X3NlcXVlbmNlci5jCj4gPiBAQCAtMjIsNiAr
MjIsNyBAQAo+ID4gICAqIEF1dGhvcnM6IEFNRAo+ID4gICAqCj4gPiAgICovCj4gPiArI2luY2x1
ZGUgPGxpbnV4L2RlbGF5Lmg+Cj4gPgo+ID4gICNpbmNsdWRlIDxsaW51eC9kZWxheS5oPgo+ID4g
ICNpbmNsdWRlICJkbV9zZXJ2aWNlcy5oIgo+Cj4gU29tZXRoaW5nIGhhcyBnb25lIHdyb25nIGhl
cmUsIGFzIHlvdSBhZGQgYSBzZWNvbmQgaW5jbHVkZSBvZiBsaW51eC9kZWxheS5oLgo+Cj4gV2Ug
aGFkIHRoaXMgcHJvYmxlbSBiZWZvcmUsIHdoaWNoIEFsZXggZml4ZWQgYnkgYXBwbHlpbmcgYSBw
YXRjaCB0bwo+IGluY2x1ZGUgbGludXgvZGVsYXkuaAoKTXkgbWlzdGFrZSwgc29ycnkgYWJvdXQg
dGhhdC4gSSBoYWQgd3JpdHRlbiBhbmQgdGVzdGVkIHRoZSBwYXRjaCBvbgpsYXN0IHdlZWsncyBs
aW51eC1uZXh0IGVybmVsIGFuZCBzZW50IGl0IG91dCB0b2RheSBhZnRlciByZWJhc2luZyBpdCwg
YnV0IGRpZApub3QgY2xvc2VseSBsb29rIGF0IHRoZSByZXN1bHRpbmcgcGF0Y2ggYWZ0ZXIgdGhl
IHJlYmFzZS4KCiAgICAgICAgICAgQXJuZApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
