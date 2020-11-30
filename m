Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BFEB2C90B3
	for <lists+dri-devel@lfdr.de>; Mon, 30 Nov 2020 23:11:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05AD689798;
	Mon, 30 Nov 2020 22:11:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F32BA89798;
 Mon, 30 Nov 2020 22:11:29 +0000 (UTC)
Received: by mail-ot1-x341.google.com with SMTP id n12so12926737otk.0;
 Mon, 30 Nov 2020 14:11:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ETFvsz7DPdLzPT7VlFuUB/Fkyqm4Ejp9KpTAnp1NCwQ=;
 b=ndXitIrz54miGNcQSrozcAEwWCdIJKXgWMZk62ZLI2HkixdmOHzTQM+TZwhUgswJ4n
 EjtZGRieJtB+0N/H5SeXKdDjNiF3NU0v3Gvn6b2lIrHOCoEcaPTBsPt3oP5j+1g02XNZ
 ZJkr3nA+Zsdc/ZMJP20Amy8Zs4N9o/TNrBEFB1OSzfr0Ls7aVKdz7n9ZDyQy7JdVoddS
 Ax8ALMpE96jLs3MGl1xTeVQa0ig64u9ryjgZgwhsujSftvi1u6jb7RyaQO/48nVF2mX8
 sXTjXQvr7v9PW3qT5IW1n5Z1fMBOZMDgexlhM4Oxo82n6ZXYW+IB4JBrmh6Z/RW3XxWD
 gZTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ETFvsz7DPdLzPT7VlFuUB/Fkyqm4Ejp9KpTAnp1NCwQ=;
 b=HqmrVuRqirfjzSTNNUCjGXUA/0ba2vRTVfyeG/fYUCnZe9COllKPMoKFjm97muFA73
 qX+NWdQETjvIcEiasoZA7xnybU8V2eEgeBWuPnq/whr+B5zV9JguI/jdgX57PD3fBBTD
 mMHEoKs1mcbrTOB5jRG7hB8g11g5WgNna9owhSAg7DKi6m6JSxdP6qs1xiyp2Fp8uWQZ
 iJqIcYa+9bSSxlbtE0BW4uQOXLeAO4f4zuzphDyCysywnIyBrr/HSWTSLOe+5EW+R5d4
 QpJHQXd1xQephpFq3IBlgm2KPNaTwjpbwC6XVFHt6JZ1ZnKb7spIEJfSM7fvVXdj3D7A
 loVQ==
X-Gm-Message-State: AOAM531PngpHsphEhheqGK+0anGvSGXOYFa14AR6PGvogFU36DtJfYHy
 jG14eekl4elZsh8ntU4LUyoRmKiI38vvQJ//y3CpMM5A
X-Google-Smtp-Source: ABdhPJwhOON7aAvHf5vEQnbPq+Zn1bRIyLJ221qqr9kjhkdxurNXiMOF4uiyqatAIebwHcYfxEj/y1hCzwWzyz0SJjM=
X-Received: by 2002:a05:6830:22e4:: with SMTP id
 t4mr18967658otc.23.1606774289360; 
 Mon, 30 Nov 2020 14:11:29 -0800 (PST)
MIME-Version: 1.0
References: <20201124193824.1118741-1-lee.jones@linaro.org>
 <20201124193824.1118741-12-lee.jones@linaro.org>
In-Reply-To: <20201124193824.1118741-12-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 30 Nov 2020 17:11:18 -0500
Message-ID: <CADnq5_Oev8Kfxa1HGR=NRBktOMUe9N_11WKBYDzgi8MfB3BOtQ@mail.gmail.com>
Subject: Re: [PATCH 11/40] drm/amd/amdgpu/psp_v11_0: Make local function
 'psp_v11_0_wait_for_bootloader()' static
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
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBOb3YgMjQsIDIwMjAgYXQgMjo0NSBQTSBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5h
cm8ub3JnPiB3cm90ZToKPgo+IEZpeGVzIHRoZSBmb2xsb3dpbmcgVz0xIGtlcm5lbCBidWlsZCB3
YXJuaW5nKHMpOgo+Cj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3BzcF92MTFfMC5jOjIy
Mzo1OiB3YXJuaW5nOiBubyBwcmV2aW91cyBwcm90b3R5cGUgZm9yIOKAmHBzcF92MTFfMF93YWl0
X2Zvcl9ib290bG9hZGVy4oCZIFstV21pc3NpbmctcHJvdG90eXBlc10KPgo+IENjOiBBbGV4IERl
dWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Cj4gQ2M6ICJDaHJpc3RpYW4gS8O2bmln
IiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgo+IENjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRA
bGludXguaWU+Cj4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KPiBDYzogSGF3
a2luZyBaaGFuZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPgo+IENjOiBhbWQtZ2Z4QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwo+IENjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gU2ln
bmVkLW9mZi1ieTogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4KCkFwcGxpZWQuICBU
aGFua3MhCgpBbGV4Cgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9wc3BfdjEx
XzAuYyB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9u
KC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvcHNwX3YxMV8w
LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9wc3BfdjExXzAuYwo+IGluZGV4IGVkZDJk
NmJkMWQ4NmEuLmJkNDI0OGM5M2M0OWYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvcHNwX3YxMV8wLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9w
c3BfdjExXzAuYwo+IEBAIC0yMjAsNyArMjIwLDcgQEAgc3RhdGljIGludCBwc3BfdjExXzBfaW5p
dF9taWNyb2NvZGUoc3RydWN0IHBzcF9jb250ZXh0ICpwc3ApCj4gICAgICAgICByZXR1cm4gZXJy
Owo+ICB9Cj4KPiAtaW50IHBzcF92MTFfMF93YWl0X2Zvcl9ib290bG9hZGVyKHN0cnVjdCBwc3Bf
Y29udGV4dCAqcHNwKQo+ICtzdGF0aWMgaW50IHBzcF92MTFfMF93YWl0X2Zvcl9ib290bG9hZGVy
KHN0cnVjdCBwc3BfY29udGV4dCAqcHNwKQo+ICB7Cj4gICAgICAgICBzdHJ1Y3QgYW1kZ3B1X2Rl
dmljZSAqYWRldiA9IHBzcC0+YWRldjsKPgo+IC0tCj4gMi4yNS4xCj4KPiBfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
