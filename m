Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BB982F668A
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jan 2021 18:00:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DADD6E038;
	Thu, 14 Jan 2021 17:00:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FE786E027;
 Thu, 14 Jan 2021 17:00:17 +0000 (UTC)
Received: by mail-oi1-x22b.google.com with SMTP id s2so6600940oij.2;
 Thu, 14 Jan 2021 09:00:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=/UHww9UxEy8O5ddy3Z1qobR+2YB3UWaKDvVfxtlmBEo=;
 b=fm7879TPMuqn6zeUsgjjlbMj6T6iVc83EMD4rt0Bg4IkYlW3X88SVlgYf5dBWl7ARr
 1HElkn/Nzs7Ov7VJ5KF6sVMytePOZlP+y7ecj1clay24dyo/aHL3kMuPaoh3WVTkd/rD
 571l/xxD1SEsLpTAug7vtvHRucxSQytdov7CRIM+cORqhErs3d2HVNWkUsPQigDyr2LS
 Z2EyS6x7IJ4K4/jklK+CwCCuz/QKbGdZvVkniyb2wGemGxe1PfKrHLhRy/z4ow8Yzl3d
 x6pitrYRUIlh6ABFJOGkoplH1QR70Iy5RnNpZuw9nIldGVP9E1KUomh7vFWOiboJ3StQ
 N0qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=/UHww9UxEy8O5ddy3Z1qobR+2YB3UWaKDvVfxtlmBEo=;
 b=RLKO/SO1voEjI19+rzidov/DhLgkCtAB64M5hXxNbaTRzx92h5XZQuywsCcNajH/6P
 DBE7NBQgm8sCBGSAQRFKBrzEtJgALz8w0yxpPY8U+NqnXtSV2r5Dg7QNeAVJDODs/PX/
 0MbqpeoNa+BpmUrrgBTy7vYCplGaOJS2t5HxcI36N0Z6yTH2c2E5tHMpqaL/jAYzr0cA
 4IPBhtPeieSr14dHlyEPsirQli29X+95tS3+ZM2JgWMHXCoU50b2yukzi353Oz9dZVAM
 kRRV2h6jGULJNaUoEJz8tuJG/gYewbhjgXH7tt+Y1/oOo3ZKHCdGNPEkioXHYeffhG+C
 bagw==
X-Gm-Message-State: AOAM531lUdWqfRAcqKcxsUDRw6Xfrruy+UF0JzoFhhmHEwOGfHdEp5x0
 fStDDZrcVgNVlXRUfaL20844Ay74UZNlhPuNzgcjJL0d
X-Google-Smtp-Source: ABdhPJyWraPPWDcrYW6tPAvpgVNXAKBM98P9xyKbK2CBh+Yq2e6sd3oJQFeG8LyeOlmrpo++XKxW3Qe1uLqyNwf9xco=
X-Received: by 2002:aca:4f97:: with SMTP id d145mr3048870oib.123.1610643616487; 
 Thu, 14 Jan 2021 09:00:16 -0800 (PST)
MIME-Version: 1.0
References: <20210111191926.3688443-1-lee.jones@linaro.org>
 <20210111191926.3688443-29-lee.jones@linaro.org>
In-Reply-To: <20210111191926.3688443-29-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 14 Jan 2021 12:00:05 -0500
Message-ID: <CADnq5_Mi081XymGX5n-pbyx=3mgjx0M1LTBuqv--dTKPbPBBfg@mail.gmail.com>
Subject: Re: [PATCH 28/40] drm/amd/display/dc/calcs/dce_calcs: Demote
 non-conformant kernel-doc function headers
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

T24gTW9uLCBKYW4gMTEsIDIwMjEgYXQgMjoyMCBQTSBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5h
cm8ub3JnPiB3cm90ZToKPgo+IEZpeGVzIHRoZSBmb2xsb3dpbmcgVz0xIGtlcm5lbCBidWlsZCB3
YXJuaW5nKHMpOgo+Cj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2Rpc3BsYXkvZGMv
Y2FsY3MvZGNlX2NhbGNzLmM6Mjc1Mzogd2FybmluZzogRnVuY3Rpb24gcGFyYW1ldGVyIG9yIG1l
bWJlciAndmJpb3MnIG5vdCBkZXNjcmliZWQgaW4gJ2lzX2Rpc3BsYXlfY29uZmlndXJhdGlvbl9z
dXBwb3J0ZWQnCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2Rpc3BsYXkvZGMvY2Fs
Y3MvZGNlX2NhbGNzLmM6Mjc1Mzogd2FybmluZzogRnVuY3Rpb24gcGFyYW1ldGVyIG9yIG1lbWJl
ciAnY2FsY3Nfb3V0cHV0JyBub3QgZGVzY3JpYmVkIGluICdpc19kaXNwbGF5X2NvbmZpZ3VyYXRp
b25fc3VwcG9ydGVkJwo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9kaXNwbGF5L2Rj
L2NhbGNzL2RjZV9jYWxjcy5jOjMwMzA6IHdhcm5pbmc6IEZ1bmN0aW9uIHBhcmFtZXRlciBvciBt
ZW1iZXIgJ2N0eCcgbm90IGRlc2NyaWJlZCBpbiAnYndfY2FsY3MnCj4gIGRyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1Ly4uL2Rpc3BsYXkvZGMvY2FsY3MvZGNlX2NhbGNzLmM6MzAzMDogd2Fybmlu
ZzogRnVuY3Rpb24gcGFyYW1ldGVyIG9yIG1lbWJlciAnZGNlaXAnIG5vdCBkZXNjcmliZWQgaW4g
J2J3X2NhbGNzJwo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9kaXNwbGF5L2RjL2Nh
bGNzL2RjZV9jYWxjcy5jOjMwMzA6IHdhcm5pbmc6IEZ1bmN0aW9uIHBhcmFtZXRlciBvciBtZW1i
ZXIgJ3ZiaW9zJyBub3QgZGVzY3JpYmVkIGluICdid19jYWxjcycKPiAgZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvLi4vZGlzcGxheS9kYy9jYWxjcy9kY2VfY2FsY3MuYzozMDMwOiB3YXJuaW5n
OiBGdW5jdGlvbiBwYXJhbWV0ZXIgb3IgbWVtYmVyICdwaXBlJyBub3QgZGVzY3JpYmVkIGluICdi
d19jYWxjcycKPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9kYy9jYWxj
cy9kY2VfY2FsY3MuYzozMDMwOiB3YXJuaW5nOiBGdW5jdGlvbiBwYXJhbWV0ZXIgb3IgbWVtYmVy
ICdwaXBlX2NvdW50JyBub3QgZGVzY3JpYmVkIGluICdid19jYWxjcycKPiAgZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9kYy9jYWxjcy9kY2VfY2FsY3MuYzozMDMwOiB3YXJu
aW5nOiBGdW5jdGlvbiBwYXJhbWV0ZXIgb3IgbWVtYmVyICdjYWxjc19vdXRwdXQnIG5vdCBkZXNj
cmliZWQgaW4gJ2J3X2NhbGNzJwo+Cj4gQ2M6IEhhcnJ5IFdlbnRsYW5kIDxoYXJyeS53ZW50bGFu
ZEBhbWQuY29tPgo+IENjOiBMZW8gTGkgPHN1bnBlbmcubGlAYW1kLmNvbT4KPiBDYzogQWxleCBE
ZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgo+IENjOiAiQ2hyaXN0aWFuIEvDtm5p
ZyIgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KPiBDYzogRGF2aWQgQWlybGllIDxhaXJsaWVk
QGxpbnV4LmllPgo+IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+Cj4gQ2M6IExl
ZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+Cj4gQ2M6IGFtZC1nZnhAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCj4gQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBTaWduZWQt
b2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgoKQXBwbGllZC4gIFRoYW5r
cyEKCkFsZXgKCj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jYWxjcy9k
Y2VfY2FsY3MuYyB8IDUgKystLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwg
MyBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3Bs
YXkvZGMvY2FsY3MvZGNlX2NhbGNzLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMv
Y2FsY3MvZGNlX2NhbGNzLmMKPiBpbmRleCBmNjljMmI4NGQ0MzJiLi45NjdkNmQ4MGJkMzhlIDEw
MDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jYWxjcy9kY2VfY2Fs
Y3MuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jYWxjcy9kY2VfY2Fs
Y3MuYwo+IEBAIC0yNzQzLDcgKzI3NDMsNyBAQCB2b2lkIGJ3X2NhbGNzX2luaXQoc3RydWN0IGJ3
X2NhbGNzX2RjZWlwICpid19kY2VpcCwKPiAgICAgICAgIGtmcmVlKHZiaW9zKTsKPiAgfQo+Cj4g
LS8qKgo+ICsvKgo+ICAgKiBDb21wYXJlIGNhbGN1bGF0ZWQgKHJlcXVpcmVkKSBjbG9ja3MgYWdh
aW5zdCB0aGUgY2xvY2tzIGF2YWlsYWJsZSBhdAo+ICAgKiBtYXhpbXVtIHZvbHRhZ2UgKG1heCBQ
ZXJmb3JtYW5jZSBMZXZlbCkuCj4gICAqLwo+IEBAIC0zMDE0LDEzICszMDE0LDEyIEBAIHN0YXRp
YyBib29sIGFsbF9kaXNwbGF5c19pbl9zeW5jKGNvbnN0IHN0cnVjdCBwaXBlX2N0eCBwaXBlW10s
Cj4gICAgICAgICByZXR1cm4gdHJ1ZTsKPiAgfQo+Cj4gLS8qKgo+ICsvKgo+ICAgKiBSZXR1cm46
Cj4gICAqICAgICB0cnVlIC0gIERpc3BsYXkocykgY29uZmlndXJhdGlvbiBzdXBwb3J0ZWQuCj4g
ICAqICAgICAgICAgICAgIEluIHRoaXMgY2FzZSAnY2FsY3Nfb3V0cHV0JyBjb250YWlucyBkYXRh
IGZvciBIVyBwcm9ncmFtbWluZwo+ICAgKiAgICAgZmFsc2UgLSBEaXNwbGF5KHMpIGNvbmZpZ3Vy
YXRpb24gbm90IHN1cHBvcnRlZCAobm90IGVub3VnaCBiYW5kd2lkdGgpLgo+ICAgKi8KPiAtCj4g
IGJvb2wgYndfY2FsY3Moc3RydWN0IGRjX2NvbnRleHQgKmN0eCwKPiAgICAgICAgIGNvbnN0IHN0
cnVjdCBid19jYWxjc19kY2VpcCAqZGNlaXAsCj4gICAgICAgICBjb25zdCBzdHJ1Y3QgYndfY2Fs
Y3NfdmJpb3MgKnZiaW9zLAo+IC0tCj4gMi4yNS4xCj4KPiBfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwo+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiBkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVsCg==
