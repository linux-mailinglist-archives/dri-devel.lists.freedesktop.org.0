Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 94604EA1E4
	for <lists+dri-devel@lfdr.de>; Wed, 30 Oct 2019 17:38:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EF816EAD2;
	Wed, 30 Oct 2019 16:38:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa44.google.com (mail-vk1-xa44.google.com
 [IPv6:2607:f8b0:4864:20::a44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF4A76EAD2
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Oct 2019 16:38:10 +0000 (UTC)
Received: by mail-vk1-xa44.google.com with SMTP id g14so645878vkl.5
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Oct 2019 09:38:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=auF46VoPrwU8q8xbExiYoCGq7R2SVCAVuNRFF7Vo6Q4=;
 b=H6Vb88j4rgvmA6iJy0v0/5tRWRhF/yqgj7kF957K+5lTmKTuGcXzs/gD0tNzx/os3i
 Z/H7GUb0rVc9weyiY4ILEU63CiF2gXDK5+Gb7DX+QXYJYQxIAi/Glt82uGgna1aYAjUE
 3vr0i/6sdGRwcU0qsNNREp/CWeGy9hKkoLnsvoCrVyzeLAvI0O0ViEDczyP28BpXBnPo
 jDwpEIYFjbM0J0i34I8kifWxWC0utjitMLoS2mcRdz/w9EaAAU7Lk9y9ImCg/kYC6xsk
 u1j4+BHBQKt0m/xqLvUUAmvfXJnE4JXbZoGBB84ufEblt+yocrsy8W+J9mRBTx1wcsQR
 mjWA==
X-Gm-Message-State: APjAAAVGOU9K7whmRH6BPEK+/Fd9OvYC7KqNPsEZ2gk8tXhvFR/l5DMp
 D9b6w8oKV5u7XAAFF+DCCj+dXIq3VFPX4c61IkXflA==
X-Google-Smtp-Source: APXvYqyw9H3UJasnYEPOA7qM+enY1BBSO79cCLBJeHD/ItiLI84vSH2Emor68J8dEUpRPo37gqz04ssqn79oqqupric=
X-Received: by 2002:ac5:ce04:: with SMTP id j4mr164380vki.2.1572453489621;
 Wed, 30 Oct 2019 09:38:09 -0700 (PDT)
MIME-Version: 1.0
References: <20191024114305.15581-1-linus.walleij@linaro.org>
 <20191024114305.15581-2-linus.walleij@linaro.org>
 <20191025192518.GA19549@bogus>
In-Reply-To: <20191025192518.GA19549@bogus>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 30 Oct 2019 17:37:58 +0100
Message-ID: <CACRpkdY8+Xa=QeTE6OQvZ6ZVkT14OapRLvGEmdsOhi0+==LPiw@mail.gmail.com>
Subject: Re: [PATCH 2/3 v4] drm/panel: Add DT bindings for Sony ACX424AKP
To: Rob Herring <robh@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=auF46VoPrwU8q8xbExiYoCGq7R2SVCAVuNRFF7Vo6Q4=;
 b=jvpgtLZAzhD5tmCnWI0+PjA+GxKnP96UKlIC/iCxYisv9XAIoCfOSEZ+czAl5xWenM
 kEN0V+prh2T2uTepdHm3OgJYZ2bL36OEG0a32tUNVV1Jt52zdLFSLYWmVJ8+wyfce0ih
 Gf8Ywk3HbDcDdQj2bpgMAWbiyxRLw6sC85pWLLtzMZ1fFn515niR5tWHJx0vc3s+ZpvE
 axJEqpVx9cRBnl+fLit7piXAxxZ5pFstmeRw1/+yNLzxIAd0ZkLvGkoeF41pZUZm7qBl
 1gb58hhxrwBlycMrGbNCHlwKLW6nGbnjGttpeK5uJ9iprV5Tc4qnI/LCx9wUEMuenw1P
 v7BA==
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBPY3QgMjUsIDIwMTkgYXQgOToyNSBQTSBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwu
b3JnPiB3cm90ZToKPiBPbiBUaHUsIE9jdCAyNCwgMjAxOSBhdCAwMTo0MzowNFBNICswMjAwLCBM
aW51cyBXYWxsZWlqIHdyb3RlOgo+ID4gVGhpcyBhZGRzIGRldmljZSB0cmVlIGJpbmRpbmdzIGZv
ciB0aGUgU29ueSBBQ1g0MjRBS1AgcGFuZWwuCj4gPiBMZXQncyB1c2UgWUFNTC4KPgo+IEFsc28g
YnJva2VuLiBSdW4gJ21ha2UgZHRfYmluZGluZ19jaGVjaycuCgpUaGF0IGlzIHdoYXQgSSdtIGRv
aW5nLgoKbWFrZSAtZiBNYWtlZmlsZSAtajUgLWw0IEFSQ0g9YXJtIENST1NTX0NPTVBJTEU9YXJt
LWxpbnV4LWdudWVhYmloZi0KS0JVSUxEX09VVFBVVD0vaG9tZS9saW51cy9saW51eC1zdGVyaWNz
c29uL2J1aWxkLXV4NTAwCmR0X2JpbmRpbmdfY2hlY2sKICBDSEtEVCAgIERvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL3NvbnksYWN4NDI0YWtwLnlhbWwKICBD
SEtEVCAgIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2RzaS1jb250
cm9sbGVyLnlhbWwKICBTQ0hFTUEgIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9w
cm9jZXNzZWQtc2NoZW1hLnlhbWwKKC4uLikKCkknbSBhIGJpdCB1bnN1cmUgaG93IHRoaXMgdGhp
bmcgd29ya3MuIEFyZSB0aGUgc2V2ZXJhbCBwYXNzZXM/CkJlY2F1c2UgbGF0ZXIgb24gdGhpcyBi
cmVha3MgYmVjYXVzZSBvZiBhbiB1bnJlbGF0ZWQgZXJyb3IgaW4KdGhlIGJpbmRpbmdzIHVwc3Ry
ZWFtOgovaG9tZS9saW51cy9saW51eC1zdGVyaWNzc29uL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9yZWd1bGF0b3IvZml4ZWQtcmVndWxhdG9yLnlhbWw6CnByb3BlcnRpZXM6Y29t
cGF0aWJsZTplbnVtOjA6IHsnY29uc3QnOiAncmVndWxhdG9yLWZpeGVkJ30gaXMgbm90IG9mCnR5
cGUgJ3N0cmluZycKL2hvbWUvbGludXMvbGludXgtc3Rlcmljc3Nvbi9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvcmVndWxhdG9yL2ZpeGVkLXJlZ3VsYXRvci55YW1sOgpwcm9wZXJ0
aWVzOmNvbXBhdGlibGU6ZW51bToxOiB7J2NvbnN0JzogJ3JlZ3VsYXRvci1maXhlZC1jbG9jayd9
IGlzCm5vdCBvZiB0eXBlICdzdHJpbmcnCiguLi4pCgpUaGlzIGlzIHY1LjQtcmMxLgoKSXMgdGhl
cmUgYW55IHdheSBJIGNhbiBzZWxlY3RpdmVseSBtYWtlIGR0X2JpbmRpbmdzX2NoZWNrIGp1c3Qg
dGFyZ2V0CnRoZSBmaWxlcyBJIHdhbm5hIGNoZWNrIGFzIGFueSBicm9rZW5uZXNzIHVwc3RyZWFt
IGNhdXNlIHByb2JsZW1zCmxpa2UgdGhpcz8gKEFuZCBJIGFzc3VtZSB0aGF0IHdpbGwga2VlcCBo
YXBwZW5pbmcuKQoKWW91cnMsCkxpbnVzIFdhbGxlaWoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
