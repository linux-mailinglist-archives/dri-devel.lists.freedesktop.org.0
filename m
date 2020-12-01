Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 971362C9386
	for <lists+dri-devel@lfdr.de>; Tue,  1 Dec 2020 01:02:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A24289D84;
	Tue,  1 Dec 2020 00:02:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AD4089D67;
 Tue,  1 Dec 2020 00:02:44 +0000 (UTC)
Received: by mail-ot1-x343.google.com with SMTP id 79so13131325otc.7;
 Mon, 30 Nov 2020 16:02:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=K/9NUHkJty1ovLR+EfZmMVNsAinmnqg1MiYad0AFs6s=;
 b=RaRFmByruZ8FV7wlqHl1H8uwNDlL6Ks/8bAHzq5xOWJCD8e9ehAinGROIYEjswXxUc
 pkULXah4E7Ba0XEApCjgZvfna4bCtcajYclcDgPRE/bueGd+Etkta/zE5xBjMNHt1eMw
 nml5UvH9hDaOkaEXXJG4qTLIKLosZ3yMzd6cW8fTEc3FrDNtXytTuNPcSFgmuo4xpEIF
 S8IzjK+kIg6wZl/S2s94mZv+cV1mqL2d2Q4iwa/bN2hgmYOcurA/VV3uIqUnGCFODBC6
 uIFQGAVbxgMqYryN6/hukJzH8tdixBPNPLgPKVXWl9TKAhYr5OziYJRHuoAsKXOg32ZP
 zLVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=K/9NUHkJty1ovLR+EfZmMVNsAinmnqg1MiYad0AFs6s=;
 b=be/d9FQ0dRYOOa30m+/qpoR2SUqo2glPaXxuctCk8JNaZtHoDCelb/PBfObQUQQvt4
 0Rc6pulSoI0zLlKZqpChu+0HF+Z4J9DHVSXBJizjN/UC8+K5qWUY6WQevTp0U5wvu8Pl
 exAouZvKkjSejzEIJuxKD1rPrIW2RPQUga5ubd7KchTtKub5DfHiG7wRQxJIK/yZDB5q
 a182OF41XHI1DEEmp3nGKkJL7UhOec8Yi0fmjT11k9ZzI+k1nEk8lyr2ieaAJ2JGaqA5
 nbvAAiH0KyIemQ6MyN0jHDNmGdPNbb3zNHExsJ3AM3IU2XwCjFPtEycyVK6PlTbhbfTh
 VXWA==
X-Gm-Message-State: AOAM532uZTm0BsZFE+1KTK3yPWSsMsc6B1Ivvpz304VDAfI5OxUQf4Aq
 RtXocOUaNxuIp44bPFav0lrAjRPVrX1YACaGnw8=
X-Google-Smtp-Source: ABdhPJzsga2CJsXwChU5oXdvjGrHF1f1fA+NX9FOpgzTyse1D46AuR3fhdViOw3/ESWYgDPB6VE78BrXP4K3VJjON20=
X-Received: by 2002:a9d:5388:: with SMTP id w8mr19042743otg.311.1606780963550; 
 Mon, 30 Nov 2020 16:02:43 -0800 (PST)
MIME-Version: 1.0
References: <20201126134240.3214176-1-lee.jones@linaro.org>
 <20201126134240.3214176-36-lee.jones@linaro.org>
In-Reply-To: <20201126134240.3214176-36-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 30 Nov 2020 19:02:31 -0500
Message-ID: <CADnq5_PXEFXCBfpGKWPCohe30GuV0O1fvyaX_CL1LoheWBti7Q@mail.gmail.com>
Subject: Re: [PATCH 35/40] drm/amd/display/amdgpu_dm/amdgpu_dm_color: Demote a
 misuse and fix another kernel-doc header
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

T24gVGh1LCBOb3YgMjYsIDIwMjAgYXQgODo0NCBBTSBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5h
cm8ub3JnPiB3cm90ZToKPgo+IEZpeGVzIHRoZSBmb2xsb3dpbmcgVz0xIGtlcm5lbCBidWlsZCB3
YXJuaW5nKHMpOgo+Cj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2Rpc3BsYXkvYW1k
Z3B1X2RtL2FtZGdwdV9kbV9jb2xvci5jOjEyODogd2FybmluZzogRnVuY3Rpb24gcGFyYW1ldGVy
IG9yIG1lbWJlciAnbHV0JyBub3QgZGVzY3JpYmVkIGluICdfX2RybV9sdXRfdG9fZGNfZ2FtbWEn
Cj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdw
dV9kbV9jb2xvci5jOjEyODogd2FybmluZzogRnVuY3Rpb24gcGFyYW1ldGVyIG9yIG1lbWJlciAn
Z2FtbWEnIG5vdCBkZXNjcmliZWQgaW4gJ19fZHJtX2x1dF90b19kY19nYW1tYScKPiAgZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX2NvbG9y
LmM6MTI4OiB3YXJuaW5nOiBGdW5jdGlvbiBwYXJhbWV0ZXIgb3IgbWVtYmVyICdpc19sZWdhY3kn
IG5vdCBkZXNjcmliZWQgaW4gJ19fZHJtX2x1dF90b19kY19nYW1tYScKPiAgZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX2NvbG9yLmM6NDI2
OiB3YXJuaW5nOiBGdW5jdGlvbiBwYXJhbWV0ZXIgb3IgbWVtYmVyICdkY19wbGFuZV9zdGF0ZScg
bm90IGRlc2NyaWJlZCBpbiAnYW1kZ3B1X2RtX3VwZGF0ZV9wbGFuZV9jb2xvcl9tZ210Jwo+Cj4g
Q2M6IEhhcnJ5IFdlbnRsYW5kIDxoYXJyeS53ZW50bGFuZEBhbWQuY29tPgo+IENjOiBMZW8gTGkg
PHN1bnBlbmcubGlAYW1kLmNvbT4KPiBDYzogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hl
ckBhbWQuY29tPgo+IENjOiAiQ2hyaXN0aWFuIEvDtm5pZyIgPGNocmlzdGlhbi5rb2VuaWdAYW1k
LmNvbT4KPiBDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgo+IENjOiBEYW5pZWwg
VmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+Cj4gQ2M6IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCj4gQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBTaWduZWQtb2ZmLWJ5
OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgoKQXBwbGllZC4gIFRoYW5rcyEKCkFs
ZXgKCj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1
X2RtX2NvbG9yLmMgfCA0ICsrLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwg
MiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3Bs
YXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9jb2xvci5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNw
bGF5L2FtZGdwdV9kbS9hbWRncHVfZG1fY29sb3IuYwo+IGluZGV4IDVkZjA1ZjBkMThiYzkuLjE1
N2ZlNGVmYmI1OTkgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2Ft
ZGdwdV9kbS9hbWRncHVfZG1fY29sb3IuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlz
cGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX2NvbG9yLmMKPiBAQCAtMTE5LDcgKzExOSw3IEBAIHN0
YXRpYyBib29sIF9faXNfbHV0X2xpbmVhcihjb25zdCBzdHJ1Y3QgZHJtX2NvbG9yX2x1dCAqbHV0
LCB1aW50MzJfdCBzaXplKQo+ICAgICAgICAgcmV0dXJuIHRydWU7Cj4gIH0KPgo+IC0vKioKPiAr
LyoKPiAgICogQ29udmVydCB0aGUgZHJtX2NvbG9yX2x1dCB0byBkY19nYW1tYS4gVGhlIGNvbnZl
cnNpb24gZGVwZW5kcyBvbiB0aGUgc2l6ZQo+ICAgKiBvZiB0aGUgbHV0IC0gd2hldGhlciBvciBu
b3QgaXQncyBsZWdhY3kuCj4gICAqLwo+IEBAIC00MTMsNyArNDEzLDcgQEAgaW50IGFtZGdwdV9k
bV91cGRhdGVfY3J0Y19jb2xvcl9tZ210KHN0cnVjdCBkbV9jcnRjX3N0YXRlICpjcnRjKQo+ICAv
KioKPiAgICogYW1kZ3B1X2RtX3VwZGF0ZV9wbGFuZV9jb2xvcl9tZ210OiBNYXBzIERSTSBjb2xv
ciBtYW5hZ2VtZW50IHRvIERDIHBsYW5lLgo+ICAgKiBAY3J0YzogYW1kZ3B1X2RtIGNydGMgc3Rh
dGUKPiAtICogQCBkY19wbGFuZV9zdGF0ZTogdGFyZ2V0IERDIHN1cmZhY2UKPiArICogQGRjX3Bs
YW5lX3N0YXRlOiB0YXJnZXQgREMgc3VyZmFjZQo+ICAgKgo+ICAgKiBVcGRhdGUgdGhlIHVuZGVy
bHlpbmcgZGNfc3RyZWFtX3N0YXRlJ3MgaW5wdXQgdHJhbnNmZXIgZnVuY3Rpb24gKElURikgaW4K
PiAgICogcHJlcGFyYXRpb24gZm9yIGhhcmR3YXJlIGNvbW1pdC4gVGhlIHRyYW5zZmVyIGZ1bmN0
aW9uIHVzZWQgZGVwZW5kcyBvbgo+IC0tCj4gMi4yNS4xCj4KPiBfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiBk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVsCg==
