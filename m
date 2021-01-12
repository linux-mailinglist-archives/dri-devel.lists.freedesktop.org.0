Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37C702F3C14
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jan 2021 23:02:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0144C89762;
	Tue, 12 Jan 2021 22:02:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [IPv6:2607:f8b0:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB82D89686;
 Tue, 12 Jan 2021 22:02:00 +0000 (UTC)
Received: by mail-ot1-x333.google.com with SMTP id x5so3495741otp.9;
 Tue, 12 Jan 2021 14:02:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=D9gsZPObytvKcn447+TF9LzV4EXZkRYI4YcY8htrsGc=;
 b=sPt7pKQaIh44JNY9YvCx6hMWeR2E6Bz+xcd4DePCjP2wtKnLVlMLLG1AQk2jzK0/B5
 gUxpcF+378A7epie+uEgghTrnXwpPmpJckPI5aVRnk7BCZ7W3tpuOi/iGlawoUpX/ZW1
 fTWGp8jVZ81bsZDeEKwXNxpBM6/zNnyh6q868F9slbXx5zMc1RtOEBsc6oZN7Hr0ZiHt
 qougKv/OLjceQGW/az+LKoOnL1KzTj3Hc7Y0DmXdTcm9aHrL/K36HQwyQsQ28z4fMzzg
 dXzwbaoIrisBAZxgvg6X2Y4/OPXZmBOeGDqc85t9GqSHhccPsgnZvbCUiM5Wn4aABUpS
 gjtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=D9gsZPObytvKcn447+TF9LzV4EXZkRYI4YcY8htrsGc=;
 b=rFQviBRj+dnIw67t5ggiLCZviZx+dbieMB9cDbBX/++yNC4PyGWjBuoiP3aeueChgc
 y14RWFoIFPPHTqczXj9p55RzShwzvPlVHECy3eG8CAiNNHmMnzgsULK2ovv23xoYaY95
 HBC/1GXKLMrriYSWYypasBZHYlsOC91L+TqhTQxFc8MbmgvoGTlqGynf7NdVvdiyw9Jz
 UsPxFFeHoucDOzqccXFB9L1hVvyKWIdjEwKfzG9Ml+bXxfAq4D9VSsGVT0zckpnKYZVH
 C9InxrTxVdR2Pf6j99MqIekYHUBQUMmvEym60pvjKkhEQrDpi+PFFDJkyLfgkdL1ie3E
 ZwpQ==
X-Gm-Message-State: AOAM5322UpELqxKmGnARzq24rWG8h4b2Wuu+SwCk2Aoz0uaEig41m2UP
 MGmTF99nB5jrVrCByw+HEcoyttEbRRzKBVfjJLs=
X-Google-Smtp-Source: ABdhPJyH9TmT3duJ5BJ3Q5qQc492fFRernj0HfUAJ1cYFU4Replxuz542maoEPin8PTSfYUiT22X0mAvvvAZkbMf7nM=
X-Received: by 2002:a05:6830:1b7b:: with SMTP id
 d27mr1066032ote.132.1610488918883; 
 Tue, 12 Jan 2021 14:01:58 -0800 (PST)
MIME-Version: 1.0
References: <20210111191926.3688443-1-lee.jones@linaro.org>
 <20210111191926.3688443-7-lee.jones@linaro.org>
In-Reply-To: <20210111191926.3688443-7-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 12 Jan 2021 17:01:47 -0500
Message-ID: <CADnq5_N_b0VKC1RtpsxAYuk0FZkttzVDv8en0PoQK70rRdhQkA@mail.gmail.com>
Subject: Re: [PATCH 06/40]
 drm/amd/display/dc/gpio/diagnostics/hw_translate_diag:
 Include our own header containing prototypes
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
Z3Bpby9kaWFnbm9zdGljcy9od190cmFuc2xhdGVfZGlhZy5jOjM3OjY6IHdhcm5pbmc6IG5vIHBy
ZXZpb3VzIHByb3RvdHlwZSBmb3Ig4oCYZGFsX2h3X3RyYW5zbGF0ZV9kaWFnX2ZwZ2FfaW5pdOKA
mSBbLVdtaXNzaW5nLXByb3RvdHlwZXNdCj4KPiBDYzogSGFycnkgV2VudGxhbmQgPGhhcnJ5Lndl
bnRsYW5kQGFtZC5jb20+Cj4gQ2M6IExlbyBMaSA8c3VucGVuZy5saUBhbWQuY29tPgo+IENjOiBB
bGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Cj4gQ2M6ICJDaHJpc3RpYW4g
S8O2bmlnIiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgo+IENjOiBEYXZpZCBBaXJsaWUgPGFp
cmxpZWRAbGludXguaWU+Cj4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KPiBD
YzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBDYzogZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwo+IFNpZ25lZC1vZmYtYnk6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFy
by5vcmc+CgpBcHBsaWVkLiAgVGhhbmtzIQoKQWxleAoKPiAtLS0KPiAgLi4uL2dwdS9kcm0vYW1k
L2Rpc3BsYXkvZGMvZ3Bpby9kaWFnbm9zdGljcy9od190cmFuc2xhdGVfZGlhZy5jICB8IDEgKwo+
ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZ3Bpby9kaWFnbm9zdGljcy9od190cmFuc2xhdGVfZGlh
Zy5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2dwaW8vZGlhZ25vc3RpY3MvaHdf
dHJhbnNsYXRlX2RpYWcuYwo+IGluZGV4IGJmOTA2ODg0NjkyNzEuLmU1MTM4YTVhOGViNWEgMTAw
NjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2dwaW8vZGlhZ25vc3Rp
Y3MvaHdfdHJhbnNsYXRlX2RpYWcuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxh
eS9kYy9ncGlvL2RpYWdub3N0aWNzL2h3X3RyYW5zbGF0ZV9kaWFnLmMKPiBAQCAtMjQsNiArMjQs
NyBAQAo+ICAgKi8KPgo+ICAjaW5jbHVkZSAiZG1fc2VydmljZXMuaCIKPiArI2luY2x1ZGUgImh3
X3RyYW5zbGF0ZV9kaWFnLmgiCj4gICNpbmNsdWRlICJpbmNsdWRlL2dwaW9fdHlwZXMuaCIKPgo+
ICAjaW5jbHVkZSAiLi4vaHdfdHJhbnNsYXRlLmgiCj4gLS0KPiAyLjI1LjEKPgo+IF9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gZHJpLWRldmVsIG1haWxp
bmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbApfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
