Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB4D18228E
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2019 18:38:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2388C6E4D4;
	Mon,  5 Aug 2019 16:38:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93BB16E4D4
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2019 16:38:46 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id d24so79817458ljg.8
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Aug 2019 09:38:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=xrn+xiXO8gDyOFHkSRhbmaLjmSi7wBD1YvY5/OQihxk=;
 b=CI+lqo2lso9+QiTDVWInhTAVaClrhOi4yj7PkWulJ9by8/AyLYW1HKlhWND2Aw3HoT
 tvrdW2N/DuOb0HGDhYD6Ex6Gz1PrcUN2EA/KXdf0pbQvC5vM/37G09299OD+E89iGTx6
 KUiBym2Khd/CNQTiNKAIqdxguCpmpYSh4z8AqUrpBMl5AcjCG+tWie3cdApP57F7F0u3
 PrgdVHRP6RdtoNPUbcQZZekKLyXEtilP4fK3xVIbjuxdhKp+sdEqLcAnvb5RspKQ23CO
 MYJVHhhHlPVaEojX2HzSfUs6zahoNAvQ67aaMwywnGP3LckrqToHuS4ZNeGEwbpqrhck
 Mi3w==
X-Gm-Message-State: APjAAAVEwK7x8e6hLOQW3Pl4QTrLn+MOX/WUgMJPu00Hv/u2U5uaY5zF
 HfuetI8tV5rxcuYcAzh2X+1VDJhlcc2ZQ/aKkR03N+C2
X-Google-Smtp-Source: APXvYqxnFz+tc9rAR4eBN8ol9s5bRowbJjpZJEyxMFKgvVfnFPDilGgq0kU/5a0WiSKoV3NLNlUORHCiULvZUdJu6xE=
X-Received: by 2002:a2e:8195:: with SMTP id e21mr10506534ljg.62.1565023124958; 
 Mon, 05 Aug 2019 09:38:44 -0700 (PDT)
MIME-Version: 1.0
References: <1564996456-55677-1-git-send-email-zhangshaokun@hisilicon.com>
In-Reply-To: <1564996456-55677-1-git-send-email-zhangshaokun@hisilicon.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 5 Aug 2019 18:38:33 +0200
Message-ID: <CACRpkdYkr_hEketgWQ4V-6KUtw=RxnygMABMB1RtDosjAQQPRg@mail.gmail.com>
Subject: Re: [PATCH -next] drm/pl111: Fix unused variable warning
To: Shaokun Zhang <zhangshaokun@hisilicon.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=xrn+xiXO8gDyOFHkSRhbmaLjmSi7wBD1YvY5/OQihxk=;
 b=ZZXQe+ECbEtsaeYE/u739NXXyH7a1EkfaatCwZc/2eLCA1mGLzxsFOoGC3eWSjQt69
 QY0Bd8Rm/xJlkmEUxwObaU1trHvB1eeK9ZxCxqCkiJcjsx38VpTBF+dvPxmD/JJpBU7p
 Mxvmr5KZjDs9fMaVRp3zrSvyTJQvYnGkMIV1WfzG2SVN1MBGENh7TUFoZPswGJozHa0O
 VEIDkeD/SGj9OhDAFsdX38h6MpD+87M1+AArNI3B72wzyC/dmf9e929YyNsNEMnPuZgz
 Ff6iPsA+t0IHZLJ78WM1a6klh40b7g7IDy86p83LeybaqB5vJTXILGwXj2QgFo+6hAR/
 +G3w==
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
Cc: David Airlie <airlied@linux.ie>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBBdWcgNSwgMjAxOSBhdCAxMToxNiBBTSBTaGFva3VuIFpoYW5nCjx6aGFuZ3NoYW9r
dW5AaGlzaWxpY29uLmNvbT4gd3JvdGU6Cgo+IHZlcnMvZ3B1L2RybS9wbDExMS9wbDExMV9kaXNw
bGF5LmM6IEluIGZ1bmN0aW9uIOKAmHBsMTExX2Rpc3BsYXlfaW5pdOKAmToKPiBkcml2ZXJzL2dw
dS9kcm0vcGwxMTEvcGwxMTFfZGlzcGxheS5jOjU1MToxNzogd2FybmluZzogdW51c2VkIHZhcmlh
YmxlCj4g4oCYZGV24oCZIFstV3VudXNlZC12YXJpYWJsZV0KPiAgIHN0cnVjdCBkZXZpY2UgKmRl
diA9IGRybS0+ZGV2Owo+ICAgICAgICAgICAgICAgICAgXgo+IEZpeGVzOiBkNjc4MWU0OTAxNzkg
KCJkcm0vcGwxMTE6IERyb3Agc3BlY2lhbCBwYWRzIGNvbmZpZyBjaGVjayIpCj4gQ2M6IExpbnVz
IFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz4KPiBDYzogRXJpYyBBbmhvbHQgPGVy
aWNAYW5ob2x0Lm5ldD4KPiBDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgo+IENj
OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+Cj4gU2lnbmVkLW9mZi1ieTogU2hhb2t1
biBaaGFuZyA8emhhbmdzaGFva3VuQGhpc2lsaWNvbi5jb20+CgpJIGFwcGxpZWQgaXQsIHRoYW5r
cyBhIGxvdCBTYWhva3VuIQoKWW91cnMsCkxpbnVzIFdhbGxlaWoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
