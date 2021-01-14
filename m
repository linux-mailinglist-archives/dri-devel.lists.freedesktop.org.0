Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B93BE2F66AA
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jan 2021 18:07:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D41876E112;
	Thu, 14 Jan 2021 17:07:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCEE46E112;
 Thu, 14 Jan 2021 17:07:44 +0000 (UTC)
Received: by mail-oi1-x235.google.com with SMTP id 15so6610485oix.8;
 Thu, 14 Jan 2021 09:07:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=7486gkH3QYVYP1H7a3/P8S4AjfVYRwRaV8aYoWWDGU4=;
 b=UPXqgGLLhjZHqaA/0z5zTaUcyuLGro//8Cc4RYeqs1kp31Mr5SuL1TDokyXoCeyUyV
 vuPwMN3/mfHoKebzVSGpnd/5HNB//w2TsPSdtzA+Fc02kg2h42pQQlwviKRESqehT/x9
 svv+ThIMiglBFXfm2+NAED1J4zWGfvsWC2mc1iWRSz+u4iwxeXLuinLe+6wYzv4ZzohF
 vzXSHAYwbRB2Uq7bXFKCrIQaJ7wtx29MlqE/+hefnvbjCEKoOHGFdx5RTW5Se7ra+XyZ
 UtTxWju6k73K1lqGiGw3W1OmQiQISI7jtuDTTvFL7oW7T9jtCPsGiwa0QSvqxmREPcqC
 l2dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=7486gkH3QYVYP1H7a3/P8S4AjfVYRwRaV8aYoWWDGU4=;
 b=eZBLfyqRh21De/GffL8imae/+ec1dvrGYuLt/q8qKpc2phZdmuuzSBjn6loW8YnF+B
 ASdzrCKd0so3ogtPDF+3i93v0fN3yYS9VIoKPMgmTo+eVjyuR9vEZg/Hma8y5vkSVmjG
 UJT5Id5v5du923Ac98Ttn9na4qVNKm3cL8ObeB592ML003wzW0X+ekp4R/HqiF/J1lQZ
 NJD3DliBY7lueqyvReFV7s27UWGMVXJEDSQuf9pwA/Rsx5JO4cgEg9USiEi0F3swzPoh
 KaSOsxJwnD6+RXYoh5C1OirbrZ0Vy4jvNYOCrAhgQ4qErYX73D/nn9DBrWwPF11NQQnK
 rjeg==
X-Gm-Message-State: AOAM530eIJ35Cqptz/u4CbgFXks7rV35KWG5bZsGP7uO30I6vYcNqBNv
 dPlu4tidF61OQg4oCZKiHvxKx+QA6rb8787SVP8=
X-Google-Smtp-Source: ABdhPJy3CSJg6Y3Nrh+dYHt/7/ZiW1PsBoYoCx8IQlmCtRjk+2wRG///PbZmKyl2TxgtmBac9rTmSeaur/4vTKkBGFY=
X-Received: by 2002:a54:4083:: with SMTP id i3mr3107195oii.120.1610644064266; 
 Thu, 14 Jan 2021 09:07:44 -0800 (PST)
MIME-Version: 1.0
References: <20210113080752.1003793-1-lee.jones@linaro.org>
 <20210113080752.1003793-7-lee.jones@linaro.org>
In-Reply-To: <20210113080752.1003793-7-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 14 Jan 2021 12:07:33 -0500
Message-ID: <CADnq5_PDmfpf_gQAtNq19jfWSc2NqZNcDahwFN4jzQ7O-boaBg@mail.gmail.com>
Subject: Re: [PATCH 06/30] drm/amd/display/dc/core/dc_resource: Staticify
 local functions
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

T24gV2VkLCBKYW4gMTMsIDIwMjEgYXQgMzowOCBBTSBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5h
cm8ub3JnPiB3cm90ZToKPgo+IEZpeGVzIHRoZSBmb2xsb3dpbmcgVz0xIGtlcm5lbCBidWlsZCB3
YXJuaW5nKHMpOgo+Cj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2Rpc3BsYXkvZGMv
Y29yZS9kY19yZXNvdXJjZS5jOjExMjA6NTogd2FybmluZzogbm8gcHJldmlvdXMgcHJvdG90eXBl
IGZvciDigJhzaGlmdF9ib3JkZXJfbGVmdF90b19kc3TigJkgWy1XbWlzc2luZy1wcm90b3R5cGVz
XQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9kaXNwbGF5L2RjL2NvcmUvZGNfcmVz
b3VyY2UuYzoxMTMxOjY6IHdhcm5pbmc6IG5vIHByZXZpb3VzIHByb3RvdHlwZSBmb3Ig4oCYcmVz
dG9yZV9ib3JkZXJfbGVmdF9mcm9tX2RzdOKAmSBbLVdtaXNzaW5nLXByb3RvdHlwZXNdCj4KPiBD
YzogSGFycnkgV2VudGxhbmQgPGhhcnJ5LndlbnRsYW5kQGFtZC5jb20+Cj4gQ2M6IExlbyBMaSA8
c3VucGVuZy5saUBhbWQuY29tPgo+IENjOiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVy
QGFtZC5jb20+Cj4gQ2M6ICJDaHJpc3RpYW4gS8O2bmlnIiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQu
Y29tPgo+IENjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+Cj4gQ2M6IERhbmllbCBW
ZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KPiBDYzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKPiBDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IFNpZ25lZC1vZmYtYnk6
IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+CgpBcHBsaWVkLiAgVGhhbmtzIQoKQWxl
eAoKPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNfcmVzb3Vy
Y2UuYyB8IDYgKysrLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVs
ZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2Rj
L2NvcmUvZGNfcmVzb3VyY2UuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3Jl
L2RjX3Jlc291cmNlLmMKPiBpbmRleCAwN2MyMjU1NjQ4MGJlLi5kNDIzMDkyYzQ1ZGNkIDEwMDY0
NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjX3Jlc291cmNl
LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19yZXNvdXJj
ZS5jCj4gQEAgLTExMTcsNyArMTExNyw3IEBAIHN0YXRpYyB2b2lkIGNhbGN1bGF0ZV9pbml0c19h
bmRfYWRqX3ZwKHN0cnVjdCBwaXBlX2N0eCAqcGlwZV9jdHgpCj4gICAqIFdlIGFsc28gbmVlZCB0
byBtYWtlIHN1cmUgcGlwZV9jdHgtPnBsYW5lX3Jlcy5zY2xfZGF0YS5oX2FjdGl2ZSB1c2VzIHRo
ZQo+ICAgKiBvcmlnaW5hbCBoX2JvcmRlcl9sZWZ0IHZhbHVlIGluIGl0cyBjYWxjdWxhdGlvbi4K
PiAgICovCj4gLWludCBzaGlmdF9ib3JkZXJfbGVmdF90b19kc3Qoc3RydWN0IHBpcGVfY3R4ICpw
aXBlX2N0eCkKPiArc3RhdGljIGludCBzaGlmdF9ib3JkZXJfbGVmdF90b19kc3Qoc3RydWN0IHBp
cGVfY3R4ICpwaXBlX2N0eCkKPiAgewo+ICAgICAgICAgaW50IHN0b3JlX2hfYm9yZGVyX2xlZnQg
PSBwaXBlX2N0eC0+c3RyZWFtLT50aW1pbmcuaF9ib3JkZXJfbGVmdDsKPgo+IEBAIC0xMTI4LDgg
KzExMjgsOCBAQCBpbnQgc2hpZnRfYm9yZGVyX2xlZnRfdG9fZHN0KHN0cnVjdCBwaXBlX2N0eCAq
cGlwZV9jdHgpCj4gICAgICAgICByZXR1cm4gc3RvcmVfaF9ib3JkZXJfbGVmdDsKPiAgfQo+Cj4g
LXZvaWQgcmVzdG9yZV9ib3JkZXJfbGVmdF9mcm9tX2RzdChzdHJ1Y3QgcGlwZV9jdHggKnBpcGVf
Y3R4LAo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaW50IHN0b3JlX2hfYm9y
ZGVyX2xlZnQpCj4gK3N0YXRpYyB2b2lkIHJlc3RvcmVfYm9yZGVyX2xlZnRfZnJvbV9kc3Qoc3Ry
dWN0IHBpcGVfY3R4ICpwaXBlX2N0eCwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIGludCBzdG9yZV9oX2JvcmRlcl9sZWZ0KQo+ICB7Cj4gICAgICAgICBwaXBlX2N0
eC0+c3RyZWFtLT5kc3QueCAtPSBzdG9yZV9oX2JvcmRlcl9sZWZ0Owo+ICAgICAgICAgcGlwZV9j
dHgtPnN0cmVhbS0+dGltaW5nLmhfYm9yZGVyX2xlZnQgPSBzdG9yZV9oX2JvcmRlcl9sZWZ0Owo+
IC0tCj4gMi4yNS4xCj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwo+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
Cg==
