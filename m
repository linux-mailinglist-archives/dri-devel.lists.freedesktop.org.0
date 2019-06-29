Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B64D5ACBC
	for <lists+dri-devel@lfdr.de>; Sat, 29 Jun 2019 19:46:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AA276E9AE;
	Sat, 29 Jun 2019 17:46:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 184B56E9AA;
 Sat, 29 Jun 2019 17:46:37 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id e3so16350711edr.10;
 Sat, 29 Jun 2019 10:46:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oS4u77vgav7S0otvzH8LMeZADY7EGXm5N/CxQuMHfSM=;
 b=f4gBi02GE+UQIFwSqWiesz0Bs2fmwakf2mKPMDkgHQKJcaWhIREpT9FoVwiyFp3h+a
 200rQ+JQsdut/fPjSwYqUHzlXTLTBiFcUrk5o61WEIamsuRsfgg3SuPJsJn+cRTkWD/R
 t7XpPrQgLVaflLco82vx3HciUU06tLpklHHIrBLl5jSZAGrtZqx3cVgitBgvTgXP7RgI
 G9iQ/5y90rR4X++eL3qADQd2atvLX2oV0r75T+Pg2ck8AYT6PxbpLMHmBWBUjMYbVd/L
 iEPcaz1Gd6LgYnLNr5foj7mnQpmMxTdBdrYDX6JmT2R8Cx2Ll2e6x0TCqw2RFMt+HEIV
 ciiA==
X-Gm-Message-State: APjAAAUnaqariF5bRGXDjSnqiRrtqWiZZDiNjJtk4CSGplv5QwHPM0VB
 dVr05jEcys7jaf/ox1Q/X6ZIcJ/XEBDUfoXxlYI=
X-Google-Smtp-Source: APXvYqxYvVZOgGBFm54TxrTpBfq0bzHSSjreYYrXi4UK5pPO6x/a3qS8QtwnZtalBDYLKjsMIZD67Pz++TiVcu+4dtc=
X-Received: by 2002:a17:906:418:: with SMTP id
 d24mr14904800eja.258.1561830395655; 
 Sat, 29 Jun 2019 10:46:35 -0700 (PDT)
MIME-Version: 1.0
References: <20190628162831.20645-1-jeffrey.l.hugo@gmail.com>
In-Reply-To: <20190628162831.20645-1-jeffrey.l.hugo@gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Sat, 29 Jun 2019 10:46:20 -0700
Message-ID: <CAF6AEGuLvgfWYdGm-0caGbWcvzt7raCWkz_sBCxFKV99YQZmeg@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: Transition console to msm framebuffer
To: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=oS4u77vgav7S0otvzH8LMeZADY7EGXm5N/CxQuMHfSM=;
 b=e+6e1QTxfFgkzcdZhJunA6Ct+8ha0O1DfUbQjgsjQqjYps2ZvV5kba2ZIPGmElFafJ
 6ZkRRwzhAIJgI74zdMnptFXDGOABgiwuQ+dKf6eFGw2khIogKOm2ewQGLI+1hM4rfl1Y
 pcih2gIwTBVn5/lpQTywXclzvmomMyF72zvVKr32AVD6hw9KShCO4afyQOgakWHv3SzN
 wFU71HUBq7Sri2Or86N2o4k4SERnsbmcHEB0U6lmoe0vkxukquZ3OfAub1Ebz5/WjBMX
 bC0AaO/vseVQxG6Ut2MPs/dPFnEF7M2beW01+Bo/J1MmxKzYa2hJjppTCCuG/k3aDQki
 aw8Q==
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
Cc: freedreno <freedreno@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdW4gMjgsIDIwMTkgYXQgOToyOCBBTSBKZWZmcmV5IEh1Z28gPGplZmZyZXkubC5o
dWdvQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBJZiBib290aW5nIGEgZGV2aWNlIHVzaW5nIEVGSSwg
ZWZpZmIgd2lsbCBsaWtlbHkgY29tZSB1cCBhbmQgY2xhaW0gdGhlCj4gY29uc29sZS4gIFdoZW4g
dGhlIG1zbSBkaXNwbGF5IHN0YWNrIGZpbmFsbHkgY29tZXMgdXAsIHdlIHdhbnQgdGhlCj4gY29u
c29sZSB0byBtb3ZlIG92ZXIgdG8gdGhlIG1zbSBmYiwgc28gYWRkIHN1cHBvcnQgdG8ga2ljayBv
dXQgYW55Cj4gZmlybXdhcmUgYmFzZWQgZnJhbWVidWZmZXJzIHRvIGFjY29tcGxpc2ggdGhlIGNv
bnNvbGUgdHJhbnNpdGlvbi4KPgo+IFN1Z2dlc3RlZC1ieTogUm9iIENsYXJrIDxyb2JkY2xhcmtA
Z21haWwuY29tPgo+IFNpZ25lZC1vZmYtYnk6IEplZmZyZXkgSHVnbyA8amVmZnJleS5sLmh1Z29A
Z21haWwuY29tPgoKbGd0bSwKClJldmlld2VkLWJ5OiBSb2IgQ2xhcmsgPHJvYmRjbGFya0BnbWFp
bC5jb20+CgoKPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL21zbS9tc21fZmJkZXYuYyB8IDMgKysr
Cj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vbXNtL21zbV9mYmRldi5jIGIvZHJpdmVycy9ncHUvZHJtL21zbS9tc21fZmJk
ZXYuYwo+IGluZGV4IDI0MjlkNWU2Y2U5Zi4uZTM4MzZjNzcyNWE2IDEwMDY0NAo+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9tc20vbXNtX2ZiZGV2LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbXNt
L21zbV9mYmRldi5jCj4gQEAgLTE2OSw2ICsxNjksOSBAQCBzdHJ1Y3QgZHJtX2ZiX2hlbHBlciAq
bXNtX2ZiZGV2X2luaXQoc3RydWN0IGRybV9kZXZpY2UgKmRldikKPiAgICAgICAgIGlmIChyZXQp
Cj4gICAgICAgICAgICAgICAgIGdvdG8gZmluaTsKPgo+ICsgICAgICAgLyogdGhlIGZ3IGZiIGNv
dWxkIGJlIGFueXdoZXJlIGluIG1lbW9yeSAqLwo+ICsgICAgICAgZHJtX2ZiX2hlbHBlcl9yZW1v
dmVfY29uZmxpY3RpbmdfZnJhbWVidWZmZXJzKE5VTEwsICJtc20iLCBmYWxzZSk7Cj4gKwo+ICAg
ICAgICAgcmV0ID0gZHJtX2ZiX2hlbHBlcl9pbml0aWFsX2NvbmZpZyhoZWxwZXIsIDMyKTsKPiAg
ICAgICAgIGlmIChyZXQpCj4gICAgICAgICAgICAgICAgIGdvdG8gZmluaTsKPiAtLQo+IDIuMTcu
MQo+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
