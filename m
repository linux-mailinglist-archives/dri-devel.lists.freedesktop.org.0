Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 961D42F3BF9
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jan 2021 22:57:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D0478941D;
	Tue, 12 Jan 2021 21:57:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66F3F893ED;
 Tue, 12 Jan 2021 21:57:32 +0000 (UTC)
Received: by mail-oi1-x22b.google.com with SMTP id f132so3963872oib.12;
 Tue, 12 Jan 2021 13:57:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=bjYKw/mZXSGXW12duexWo6SJ7uate8q8HNfOvYGKdLs=;
 b=RdI/j+ZnCNl5us/umshUsZYsQ+OQFfIORN89cxi0qvxFbW11Z6RR4LIf3fCI7GVmKF
 7hdMNGS9EpFB9rqJHo6so/WD4x47hwwEAiOXBvN/q5ccHvthFZKKvL1Bek1gwVOb8/o9
 pCw7m7/aEIxXsDHS5l350wxxM4YB5i6MlwjrhPaYVusbiOTwquPNrpyOEwnaqjWsoF52
 WqsFoZhd+U2PWGje8dLnNMEvPneZCHJL088h29w5GR9fq0/Fhs/5Kjj7uhyC3+C5u93a
 hagDLr3jgBL1oDc/llXArfzRm+mdl+kmnHZwqjMpqiq92S+DSO5vtjg08es6WUN5aOt0
 nPQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=bjYKw/mZXSGXW12duexWo6SJ7uate8q8HNfOvYGKdLs=;
 b=nyQG0aW7xijnX3ThuZw3yaHfB4ENHkBydhHXUUSfWqWgyRy9uN3VlCPMQnUeHoixIf
 t38gBJLlhkrvurK5vpAN2E+5H7GE+01mEQiyZfLJp0t+47n/Eyg1SkgQjsIH7W77y3dC
 1FlS9a/iPzFr+gelb6iW0WZliMtpNJk2WLZH+PNawrq6LbcZ+u1Hp0Pn/nyZcZz73Zav
 fyLl98UoUYXQu2H0EOJih7v5rp8HjJ0/yJSbHQlP+2mz1CE0c11L8LAN/JEGGxtjWZpa
 nN+9QbHs2ke/O7o/ezA5R5rjIFlcxzsTGPje5E+EaRM/eyivVzfT6HTn5S+njiyOMuMy
 QFkw==
X-Gm-Message-State: AOAM532vtvj6CIbv+xHySEOIDpFXTyZKnN5gkWa13cBMGDxxz0voRsk6
 x399OaPPRPVUFLgVDc07whfvsK4RJQlQYrPW0r0=
X-Google-Smtp-Source: ABdhPJw8nEPrw/DF5mJev64+us3eTwmsz5935DNCpHhwFGdqdg0F/2lyp5XGK77gmS5equg4IGsH8mdyGGblxPy49no=
X-Received: by 2002:aca:6202:: with SMTP id w2mr725916oib.5.1610488651798;
 Tue, 12 Jan 2021 13:57:31 -0800 (PST)
MIME-Version: 1.0
References: <20210111191926.3688443-1-lee.jones@linaro.org>
 <20210111191926.3688443-2-lee.jones@linaro.org>
In-Reply-To: <20210111191926.3688443-2-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 12 Jan 2021 16:57:20 -0500
Message-ID: <CADnq5_OCbxmN+OPFcc1-ROFfJoLHnOgMnAQLNNrTuAS176MjMA@mail.gmail.com>
Subject: Re: [PATCH 01/40] drm/amd/display/dc/dce/dce_aux: Mark
 'dce_aux_transfer_raw' as __maybe_unused
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

T24gTW9uLCBKYW4gMTEsIDIwMjEgYXQgMjoxOSBQTSBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5h
cm8ub3JnPiB3cm90ZToKPgo+IEZpeGVzIHRoZSBmb2xsb3dpbmcgVz0xIGtlcm5lbCBidWlsZCB3
YXJuaW5nKHMpOgo+Cj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2Rpc3BsYXkvZGMv
ZGNlL2RjZV9hdXguYzogSW4gZnVuY3Rpb24g4oCYZGNlX2F1eF90cmFuc2Zlcl9yYXfigJk6Cj4g
IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2Rpc3BsYXkvZGMvZGNlL2RjZV9hdXguYzo1
Nzk6Nzogd2FybmluZzogdmFyaWFibGUg4oCYYnl0ZXNfcmVwbGllZOKAmSBzZXQgYnV0IG5vdCB1
c2VkIFstV3VudXNlZC1idXQtc2V0LXZhcmlhYmxlXQo+Cj4gQ2M6IEhhcnJ5IFdlbnRsYW5kIDxo
YXJyeS53ZW50bGFuZEBhbWQuY29tPgo+IENjOiBMZW8gTGkgPHN1bnBlbmcubGlAYW1kLmNvbT4K
PiBDYzogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgo+IENjOiAiQ2hy
aXN0aWFuIEvDtm5pZyIgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KPiBDYzogRGF2aWQgQWly
bGllIDxhaXJsaWVkQGxpbnV4LmllPgo+IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwu
Y2g+Cj4gQ2M6IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gQ2M6IGRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKPiBTaWduZWQtb2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25l
c0BsaW5hcm8ub3JnPgoKQXBwbGllZC4gIFRoYW5rcyEKCkFsZXgKCj4gLS0tCj4gIGRyaXZlcnMv
Z3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2UvZGNlX2F1eC5jIHwgMiArLQo+ICAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlL2RjZV9hdXguYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvZGlzcGxheS9kYy9kY2UvZGNlX2F1eC5jCj4gaW5kZXggMzIwNDI5MmE1YWVhZS4uZDUx
YjVmZTkxMjg3ZCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMv
ZGNlL2RjZV9hdXguYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2Uv
ZGNlX2F1eC5jCj4gQEAgLTU3Niw3ICs1NzYsNyBAQCBpbnQgZGNlX2F1eF90cmFuc2Zlcl9yYXco
c3RydWN0IGRkY19zZXJ2aWNlICpkZGMsCj4gICAgICAgICAqb3BlcmF0aW9uX3Jlc3VsdCA9IGdl
dF9jaGFubmVsX3N0YXR1cyhhdXhfZW5naW5lLCAmcmV0dXJuZWRfYnl0ZXMpOwo+Cj4gICAgICAg
ICBpZiAoKm9wZXJhdGlvbl9yZXN1bHQgPT0gQVVYX0NIQU5ORUxfT1BFUkFUSU9OX1NVQ0NFRURF
RCkgewo+IC0gICAgICAgICAgICAgICBpbnQgYnl0ZXNfcmVwbGllZCA9IDA7Cj4gKyAgICAgICAg
ICAgICAgIGludCBfX21heWJlX3VudXNlZCBieXRlc19yZXBsaWVkID0gMDsKPiAgICAgICAgICAg
ICAgICAgYnl0ZXNfcmVwbGllZCA9IHJlYWRfY2hhbm5lbF9yZXBseShhdXhfZW5naW5lLCBwYXls
b2FkLT5sZW5ndGgsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBw
YXlsb2FkLT5kYXRhLCBwYXlsb2FkLT5yZXBseSwKPiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICZzdGF0dXMpOwo+IC0tCj4gMi4yNS4xCj4KPiBfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
