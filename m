Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BBE262451C3
	for <lists+dri-devel@lfdr.de>; Sat, 15 Aug 2020 21:24:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 582716E3FE;
	Sat, 15 Aug 2020 19:24:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 704736E3FE
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Aug 2020 19:24:13 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id t23so13328770ljc.3
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Aug 2020 12:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=E7PzPNqEActvy7NXEpibTBBQfS70Ip8yyz+qKzsTdls=;
 b=u9c9Cnv8r19BYrwuJlWuM4e23kqae7G72R6GlDU0HqoLliIPf8inwhG579ht04YLA5
 JthAvAZPxwvh2hmHklZ2mZzshxwpxji7MW/tf6+bG7QrBmUk43+DBP3vv84QWqHsa0SO
 o3QCAZrwzrY2InGx9W+ks1oJHx03xgmgFvGfrXhQ57vwoC1v2eeum6DnjtnwrFD6lSfV
 I8l7dSNSQhOHx4LEMSIGaPTtR0kXpufgid1PexN0Yo5vyFmzysbZEiesJOSF3LXI/AVb
 cAJrg5FyybdR7Wxj3BuCca5ntwcsG1d1/XPwRNKL3fkooWl3k8DTUrmXAi6waeW4wb5V
 oyCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=E7PzPNqEActvy7NXEpibTBBQfS70Ip8yyz+qKzsTdls=;
 b=Sf2NqbkJ0gzJHnxyCLR6H650yqmRqJYQQYH2bOGXpmGmjAkYEPA2gmWY0gNypoJN00
 jLmEqbqGlwg8spWJ9cELHQYhD4b4PxleJ56VgjLdg7kYoqwy/JYUVWD3KczLixkUn3U6
 CUR1h3l+ZyAk9mOD5uAUgoHU+QCkIdENhXmfN3jMFTd9H0Wcrxbch2UXcBo6RE6s9ENt
 PjmWOMdUBRvJxu2PZDBEVDIneuPl/KSvO5iG0nN9gaTjKNIOM3UaNON/lE/ZSxUPXCxa
 9V5OKA+hj4ULMIb2uiVDOfNOuGDCDEI00wHKbvtgCfgMIBLVXJzinZ9ZRv1EVva1HpYA
 YIbw==
X-Gm-Message-State: AOAM530DVffiCgZenNnkBpJlvu7YCO2wadL4zvUF3Ue60jbW/KWA9kXi
 CzZgKPdx6BqWo+gH4MbOf21Zc+nK5dvQzdy3WtY4dw==
X-Google-Smtp-Source: ABdhPJyd+sqJLp8RwzcKhWQOTVnHaM/D6ihSdE+ef9wePEVUj3TmFqoseDhvwHs/bArfI+oj7OuvBht07BeyrWEfKqk=
X-Received: by 2002:a2e:6a17:: with SMTP id f23mr3611099ljc.338.1597519451567; 
 Sat, 15 Aug 2020 12:24:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200815125406.1153224-1-sam@ravnborg.org>
 <20200815125406.1153224-2-sam@ravnborg.org>
In-Reply-To: <20200815125406.1153224-2-sam@ravnborg.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 15 Aug 2020 21:23:59 +0200
Message-ID: <CACRpkdYhYUJGXgHfqsMPoQXPpBma4jOLyEB=wOPXY09RMsVq3A@mail.gmail.com>
Subject: Re: [PATCH v1 1/5] drm/panel: samsung: Use dev_ based logging
To: Sam Ravnborg <sam@ravnborg.org>
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
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 David Airlie <airlied@linux.ie>,
 =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>,
 Jerry Han <hanxu5@huaqin.corp-partner.google.com>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Jani Nikula <jani.nikula@intel.com>, Thierry Reding <thierry.reding@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Robert Chiras <robert.chiras@nxp.com>,
 Icenowy Zheng <icenowy@aosc.io>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU2F0LCBBdWcgMTUsIDIwMjAgYXQgMjo1NCBQTSBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9y
Zy5vcmc+IHdyb3RlOgoKPiBTdGFuZGFyZGl6ZSBvbiB0aGUgZGV2XyBiYXNlZCBsb2dnaW5nIGFu
ZCBkcm9wIHRoZSBpbmNsdWRlIG9mIGRybV9wcmludC5oLgo+IEZpeCBhIGZldyBjYXNlcyB3aGVy
ZSAieEAiIHdhcyB1c2VkIHdoZW4gcHJpbnRpbmcgdGhlIG1vZGUuCj4KPiBTaWduZWQtb2ZmLWJ5
OiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+Cj4gQ2M6IFRoaWVycnkgUmVkaW5nIDx0
aGllcnJ5LnJlZGluZ0BnbWFpbC5jb20+Cj4gQ2M6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3Jn
Lm9yZz4KPiBDYzogR3VpZG8gR8O8bnRoZXIgPGFneEBzaWd4Y3B1Lm9yZz4KPiBDYzogTGludXMg
V2FsbGVpaiA8bGludXMud2FsbGVpakBsaW5hcm8ub3JnPgo+IENjOiBMYXVyZW50IFBpbmNoYXJ0
IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+CgpBdCBvbmUgcG9pbnQgSSB3YXMg
dG9sZCB0byBub3QgdXNlIGRldl8qIGJ1dCB1c2UgRFJNX0RFVioKbWFjcm9zIGluc3RlYWQuICJP
SyB0aGUgRFJNIHBlb3BsZSB3YW50IGl0IHRoaXMgd2F5LCBubwpiaWcgZGVhbC4iIEJ1dCBJJ2Qg
cmF0aGVyIGRvIGl0IGxpa2UgdGhpcyBzbzoKUmV2aWV3ZWQtYnk6IExpbnVzIFdhbGxlaWogPGxp
bnVzLndhbGxlaWpAbGluYXJvLm9yZz4KCllvdXJzLApMaW51cyBXYWxsZWlqCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
