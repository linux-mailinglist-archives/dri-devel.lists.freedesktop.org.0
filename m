Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6938B104507
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2019 21:28:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65F966E7D2;
	Wed, 20 Nov 2019 20:28:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AC726E7D2
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2019 20:28:23 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id d5so618111ljl.4
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2019 12:28:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hIzUKaoECvunhbN29FjzqY9PEax2EkF9njXNYkmUhLU=;
 b=Gn+VSMxM9dralWUSgwCSqplb2/E0WymkP0iF1Aoz4lYrexkDOfASPBbyTkhQEHlVE1
 9XrG/CFMIpy/wqmu29TWTa5zSs+JlW33tq6ADVeg36/DwmJ2Qg+y77ZQzK1SIZ0pnBtA
 k8uktZhttUOKQ4s489ETCzdO4S4UkmaJpVo9UX313uVPBTZvF8agtucPBGz4d5lLpoY6
 9jRVct64eKUtYQSz9sKys6csXKjG26nPvZ/sEW8kOsMgnPqF3zc6goB47oUiF0rG4q5A
 AjeKpLd1hoNEIWRyrmHniGX9oATh0wStC049zy2xrJ/ECJSNCZdOKAfKcGR8Hp5v5e/H
 BrUQ==
X-Gm-Message-State: APjAAAUEm4tqT0SXSfH2NYCkWMb1QOcGIP0OPRMrD5pEGqhrRa/J3avZ
 gYM3kcucTEdWWbkw39hgo+ycdHDsoAmT4NWMB3RQDRp3xe0=
X-Google-Smtp-Source: APXvYqw2KwqjpIV0V6oRLeXHrwRQZnmr1x4FciKMFTAVp2odcq+17a0QwOb1FYvEVa0z4PF5XdX7LJo0w89Qd9BnXr8=
X-Received: by 2002:a2e:90b:: with SMTP id 11mr4289023ljj.233.1574281701154;
 Wed, 20 Nov 2019 12:28:21 -0800 (PST)
MIME-Version: 1.0
References: <20191119214234.27932-1-linus.walleij@linaro.org>
In-Reply-To: <20191119214234.27932-1-linus.walleij@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 20 Nov 2019 21:28:09 +0100
Message-ID: <CACRpkdYr93nZDcTqoMxB4NMEALweqBRNL8mzYQD_ZYzxoWWKUA@mail.gmail.com>
Subject: Re: [PATCH] drm/mcde: Support using DSI in LP mode
To: "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>, 
 Inki Dae <inki.dae@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=hIzUKaoECvunhbN29FjzqY9PEax2EkF9njXNYkmUhLU=;
 b=yCT/Yu8RcVXCHsJMDqy5t57P24BBlombjpiids+RS7GhDXg7DTcLYZJvyJ3g3u0AOt
 JHf5TcDOTI1Q0AkXOV4226pn1sZpzTM7pWhDpaATRlbOoCyku5rNp3xlhADwZwgUGOCU
 Vbh/lNG0jnKXmbvVF9NVcUy5lOKqWSzRQKGyvyxCShGLbPN9M6+6e59PHv9LmrH8EfcR
 8s1V6u5cw3FziVZ4g7shVaaQl4nqcRqEBVsIbJ2pXprCJPJEtDcNLpD9QqLtDksuMu76
 JV1cjcdXaGdaBiPZMIPp7kN/wWXrFjcCSmiXTm/goRPvfCsMvVxN6t+ZMv/3O4m8pyKG
 s0gg==
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
Cc: Stephan Gerhold <stephan@gerhold.net>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBOb3YgMTksIDIwMTkgYXQgMTA6NDIgUE0gTGludXMgV2FsbGVpaiA8bGludXMud2Fs
bGVpakBsaW5hcm8ub3JnPiB3cm90ZToKCj4gSXQgaXMgcG9zc2libGUgdG8gc2V0IGEgZmxhZyBp
biB0aGUgc3RydWN0IG1pcGlfZHNpX2RldmljZQo+IHNvIHRoZSBwYW5lbCBpcyBoYW5kbGVkIGlu
IGxvdyBwb3dlciAoTFApIG1vZGUuIFNvbWUgZGlzcGxheXMKPiBvbmx5IHN1cHBvcnQgdGhpcyBt
b2RlIGFuZCBpdCBpcyBhbHNvIGdvb2QgZm9yIHRlc3RpbmcuCj4KPiBDYzogU3RlcGhhbiBHZXJo
b2xkIDxzdGVwaGFuQGdlcmhvbGQubmV0Pgo+IFNpZ25lZC1vZmYtYnk6IExpbnVzIFdhbGxlaWog
PGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz4KCklua2k6IHRoaXMgaXMgdGhlIHBhdGNoIG1ha2lu
ZyB0aGUgTUNERSB1c2UgTFAgbW9kZSBvbgphbGwgY29tbWFuZHMgYWxzbyBzY3JlZW4gdXBkYXRl
cyBvbiBjb21tYW5kLW1vZGUgcGFuZWxzLgoKSWYgdGhpcyBpcyBob3cgdGhlIGZsYWcgaXMgaW50
ZW5kZWQgcGxlYXNlIEFDSyB0aGlzIGFuZCBJJ2xsIG1ha2UKYSBwYXRjaCB0byB0aGUgZG9jdW1l
bnRhdGlvbiBhcyB3ZWxsIG1ha2luZyBpdCBjbGVhciB0aGF0IHRoaXMKaXMgdGhlIGludGVuZGVk
IHNlbWFudGljcyBvZiB0aGUgZmxhZy4KCllvdXJzLApMaW51cyBXYWxsZWlqCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
