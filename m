Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE5BE2EFA02
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jan 2021 22:13:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F95C6E8DC;
	Fri,  8 Jan 2021 21:13:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F053A6E8DC;
 Fri,  8 Jan 2021 21:13:40 +0000 (UTC)
Received: by mail-oi1-x232.google.com with SMTP id 9so12895755oiq.3;
 Fri, 08 Jan 2021 13:13:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=B+8hnVZITAMIkeafbj19vWqz4gaQsqmqqDzoGimH9ao=;
 b=tE/gVRzmGZ/6pMkoQIhOgaMPi0Ic5aaIXYvui3z4H+8orGwuphAlkCNt7VJRbPyjZ6
 QLkxZvuM7XVChAnlAGBUa6jvnMJKSHMeVrUWsXyTnnDzN9DA/Za0K6NqkBO+pJXce+3M
 WgwXXGH+JEARnOzAB92+VCmCUUz6X3gD8Lu59o6ATeK8QE1l3RJEqDnpEEh0Pis3MMFu
 THSJH/Tge3KjjYwphFxVYBAotowaHYQIGn38N3W+1+08v4nVb9NKynN3MdM0HFSPi4S5
 +lLYQ42/wNcYWwM76DznGmNunYkOWG2OuLJmhzs7n7VGgwBess8gV1FEAWVmnwjePOv/
 nKBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=B+8hnVZITAMIkeafbj19vWqz4gaQsqmqqDzoGimH9ao=;
 b=jt5UaDJecS5qYPS5y01mMbIejdXrqhp41cacMzu77F9NJJhhi1Y0bAOM7XfJpdvzaY
 nif7KLlLU6r6EGZP10zVzJiv/lAFjNCXxOKmR0oZlSgZ72BNNSh6wQAv9FToesTDNdF0
 DjKEe51p5Yo6S0R1qP+Kb1Tq1EpEFrHSOCr8Fh9MG/DAdl+NiJVbjUf1txU/7Oeff2Bk
 nFmNlyivzT3uvfxb/nRAKnloSgU37s6B76UjQtne0RzCoMpAUCBrN7/gK1FJIRflwbRI
 D4xp0CzeHkqIvHumXTVXyahnPxrD4Pa+fRnrw/HQiMaT6gjC4AsamlrxO/uzkfa/sigL
 2Zfg==
X-Gm-Message-State: AOAM530KWnF437PHta4BoYKbHyZL/VD6CwLns+DUCPTcooLogSp+shOz
 zTQartNTHSxc90UPnEgtCUsAn7ramgvsyKAycDM=
X-Google-Smtp-Source: ABdhPJww350+9N9LUdUp2F3/FBMccu07YTAbrdlVovNeowk5hu7ZrXoBnvSqbjZxtgdi3/moNtRBojEjjPGsvKluDq4=
X-Received: by 2002:a54:4083:: with SMTP id i3mr3484762oii.120.1610140420341; 
 Fri, 08 Jan 2021 13:13:40 -0800 (PST)
MIME-Version: 1.0
References: <20210108201457.3078600-1-lee.jones@linaro.org>
 <20210108201457.3078600-26-lee.jones@linaro.org>
In-Reply-To: <20210108201457.3078600-26-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 8 Jan 2021 16:13:29 -0500
Message-ID: <CADnq5_N7pcv4Dx85n5QygAHX=Bx=FhEqJMpnQ3m_uuKtuGCPKQ@mail.gmail.com>
Subject: Re: [PATCH 25/40] drm/amd/display/dc/dce/dce_link_encoder: Make
 functions invoked by reference static
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
Cc: Leo Li <sunpeng.li@amd.com>, Mauro Rossi <issor.oruam@gmail.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKYW4gOCwgMjAyMSBhdCAzOjE1IFBNIExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFy
by5vcmc+IHdyb3RlOgo+Cj4gRml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdh
cm5pbmcocyk6Cj4KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9kYy9k
Y2UvZGNlX2xpbmtfZW5jb2Rlci5jOjEyMDA6Njogd2FybmluZzogbm8gcHJldmlvdXMgcHJvdG90
eXBlIGZvciDigJhkY2U2MF9saW5rX2VuY29kZXJfZW5hYmxlX2RwX291dHB1dOKAmSBbLVdtaXNz
aW5nLXByb3RvdHlwZXNdCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2Rpc3BsYXkv
ZGMvZGNlL2RjZV9saW5rX2VuY29kZXIuYzoxMjM5OjY6IHdhcm5pbmc6IG5vIHByZXZpb3VzIHBy
b3RvdHlwZSBmb3Ig4oCYZGNlNjBfbGlua19lbmNvZGVyX2VuYWJsZV9kcF9tc3Rfb3V0cHV04oCZ
IFstV21pc3NpbmctcHJvdG90eXBlc10KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4v
ZGlzcGxheS9kYy9kY2UvZGNlX2xpbmtfZW5jb2Rlci5jOjE0Mjk6Njogd2FybmluZzogbm8gcHJl
dmlvdXMgcHJvdG90eXBlIGZvciDigJhkY2U2MF9saW5rX2VuY29kZXJfZHBfc2V0X3BoeV9wYXR0
ZXJu4oCZIFstV21pc3NpbmctcHJvdG90eXBlc10KPgo+IENjOiBIYXJyeSBXZW50bGFuZCA8aGFy
cnkud2VudGxhbmRAYW1kLmNvbT4KPiBDYzogTGVvIExpIDxzdW5wZW5nLmxpQGFtZC5jb20+Cj4g
Q2M6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KPiBDYzogIkNocmlz
dGlhbiBLw7ZuaWciIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cj4gQ2M6IERhdmlkIEFpcmxp
ZSA8YWlybGllZEBsaW51eC5pZT4KPiBDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNo
Pgo+IENjOiBNYXVybyBSb3NzaSA8aXNzb3Iub3J1YW1AZ21haWwuY29tPgo+IENjOiBhbWQtZ2Z4
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IENjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCj4gU2lnbmVkLW9mZi1ieTogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4KCkFw
cGxpZWQuICBUaGFua3MhCgpBbGV4Cgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3Bs
YXkvZGMvZGNlL2RjZV9saW5rX2VuY29kZXIuYyB8IDYgKysrLS0tCj4gIDEgZmlsZSBjaGFuZ2Vk
LCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZS9kY2VfbGlua19lbmNvZGVyLmMgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlL2RjZV9saW5rX2VuY29kZXIuYwo+IGluZGV4IDIx
MDQ2NmIyZDg2MzEuLjBlZjJmNGQ5ZDhiZjMgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9kaXNwbGF5L2RjL2RjZS9kY2VfbGlua19lbmNvZGVyLmMKPiArKysgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlL2RjZV9saW5rX2VuY29kZXIuYwo+IEBAIC0xMTk3LDcg
KzExOTcsNyBAQCB2b2lkIGRjZTExMF9saW5rX2VuY29kZXJfZW5hYmxlX2RwX21zdF9vdXRwdXQo
Cj4KPiAgI2lmIGRlZmluZWQoQ09ORklHX0RSTV9BTURfRENfU0kpCj4gIC8qIGVuYWJsZXMgRFAg
UEhZIG91dHB1dCAqLwo+IC12b2lkIGRjZTYwX2xpbmtfZW5jb2Rlcl9lbmFibGVfZHBfb3V0cHV0
KAo+ICtzdGF0aWMgdm9pZCBkY2U2MF9saW5rX2VuY29kZXJfZW5hYmxlX2RwX291dHB1dCgKPiAg
ICAgICAgIHN0cnVjdCBsaW5rX2VuY29kZXIgKmVuYywKPiAgICAgICAgIGNvbnN0IHN0cnVjdCBk
Y19saW5rX3NldHRpbmdzICpsaW5rX3NldHRpbmdzLAo+ICAgICAgICAgZW51bSBjbG9ja19zb3Vy
Y2VfaWQgY2xvY2tfc291cmNlKQo+IEBAIC0xMjM2LDcgKzEyMzYsNyBAQCB2b2lkIGRjZTYwX2xp
bmtfZW5jb2Rlcl9lbmFibGVfZHBfb3V0cHV0KAo+ICB9Cj4KPiAgLyogZW5hYmxlcyBEUCBQSFkg
b3V0cHV0IGluIE1TVCBtb2RlICovCj4gLXZvaWQgZGNlNjBfbGlua19lbmNvZGVyX2VuYWJsZV9k
cF9tc3Rfb3V0cHV0KAo+ICtzdGF0aWMgdm9pZCBkY2U2MF9saW5rX2VuY29kZXJfZW5hYmxlX2Rw
X21zdF9vdXRwdXQoCj4gICAgICAgICBzdHJ1Y3QgbGlua19lbmNvZGVyICplbmMsCj4gICAgICAg
ICBjb25zdCBzdHJ1Y3QgZGNfbGlua19zZXR0aW5ncyAqbGlua19zZXR0aW5ncywKPiAgICAgICAg
IGVudW0gY2xvY2tfc291cmNlX2lkIGNsb2NrX3NvdXJjZSkKPiBAQCAtMTQyNiw3ICsxNDI2LDcg
QEAgdm9pZCBkY2UxMTBfbGlua19lbmNvZGVyX2RwX3NldF9waHlfcGF0dGVybigKPgo+ICAjaWYg
ZGVmaW5lZChDT05GSUdfRFJNX0FNRF9EQ19TSSkKPiAgLyogc2V0IERQIFBIWSB0ZXN0IGFuZCB0
cmFpbmluZyBwYXR0ZXJucyAqLwo+IC12b2lkIGRjZTYwX2xpbmtfZW5jb2Rlcl9kcF9zZXRfcGh5
X3BhdHRlcm4oCj4gK3N0YXRpYyB2b2lkIGRjZTYwX2xpbmtfZW5jb2Rlcl9kcF9zZXRfcGh5X3Bh
dHRlcm4oCj4gICAgICAgICBzdHJ1Y3QgbGlua19lbmNvZGVyICplbmMsCj4gICAgICAgICBjb25z
dCBzdHJ1Y3QgZW5jb2Rlcl9zZXRfZHBfcGh5X3BhdHRlcm5fcGFyYW0gKnBhcmFtKQo+ICB7Cj4g
LS0KPiAyLjI1LjEKPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
