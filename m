Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72E2A342B69
	for <lists+dri-devel@lfdr.de>; Sat, 20 Mar 2021 10:28:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36BA36EB4C;
	Sat, 20 Mar 2021 09:28:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe32.google.com (mail-vs1-xe32.google.com
 [IPv6:2607:f8b0:4864:20::e32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C60DE89D43;
 Sat, 20 Mar 2021 09:28:07 +0000 (UTC)
Received: by mail-vs1-xe32.google.com with SMTP id z68so4816996vsb.10;
 Sat, 20 Mar 2021 02:28:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ym1aYFZ2eQ19MevTlNBGf+SRQwy6XhDZ2AMwQHDehC4=;
 b=ufLwQXyh5oBM9tOqcPs+noHs1Hv/IxB7Pkrs9VtL4w/Vag5unQnjP6sumkHxks16bM
 MfvFWKEykZMVFkf8zL1s261dpK/9ZvubHVsVbjsc9p4YXGde5453Wx8JVJ7XgKIkW4pe
 5jCmo/XDoE9JRDwtd9++gLhpL60FC4vVdz/MG/zT8MpAyGqvD4oqf8TrIA9bHjXFskqr
 evt8NADA9IkcH7OyQTDmwSVzVDytTTw9azPiAjfOJ+66MkyWs2J49J+O4+Z7dtwU+mHW
 PxCjkZ98q9re3T2jLJF7yWJBbQVu6i/DjyuEJiTi+s7nJSdJEdny1lHlNDS0FULcu+LJ
 5V6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ym1aYFZ2eQ19MevTlNBGf+SRQwy6XhDZ2AMwQHDehC4=;
 b=euAZew0Jf37D6ouL0ACOlurep5fRuNNzbezAZmHuI9r1SS7wWiXw/jqbtoec+98kc5
 96fbslnogu6Skf2u7YWcG+JxkltkTydMw4VseHKsJGjBNvIgpedRtJme02e1AnqHaw9+
 KnmrcMlm1uT9+wd9ZVlQ3NmPTrBeNassxbqTup4r2OzUV21g24TmiyvckGPJU/TGQjqA
 NEsE5UvSJK3icJL4daE4KPqG/m1CtSKqlC3lqgDzndsbjHP/vpflOR/uHnnylbygnU1M
 qRaz+Gyb/DxacuQy0IYWrMW5/aLiDqQL8BeProZA+gjyAGmcl2jVMhsByUciMJoGw7+U
 mXeA==
X-Gm-Message-State: AOAM530LVzNfz3nTJjASN2cYCZzqr/v1vu/JNCHgC4vHgw5dRtW5Kyo5
 Ym6O9343oUvdFAeN5C9rk77nYrU+ACCII7f/z4Q9UnEoVyA=
X-Google-Smtp-Source: ABdhPJz8Z7cmxvYpYLcBkNOsZaxUhdgUopDtV7OydHL2PC+Nh5BuUXBDidxepV8E+0nBqRyKJzY4qAgtpZbxSUdfnKI=
X-Received: by 2002:a05:6102:b05:: with SMTP id
 b5mr4955359vst.29.1616232486902; 
 Sat, 20 Mar 2021 02:28:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210319190607.2903545-1-l.stach@pengutronix.de>
In-Reply-To: <20210319190607.2903545-1-l.stach@pengutronix.de>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Sat, 20 Mar 2021 10:27:55 +0100
Message-ID: <CAH9NwWdOSiWTNpyzxXHasjcNrhOtK3Su66kaQsGA_kz7AUp53A@mail.gmail.com>
Subject: Re: [PATCH] drm/fourcc: add Vivante TS modifiers
To: Lucas Stach <l.stach@pengutronix.de>
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
Cc: Sascha Hauer <kernel@pengutronix.de>,
 The etnaviv authors <etnaviv@lists.freedesktop.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 patchwork-lst@pengutronix.de
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTHVjYXMKCkFtIEZyLiwgMTkuIE3DpHJ6IDIwMjEgdW0gMjA6MDYgVWhyIHNjaHJpZWIgTHVj
YXMgU3RhY2ggPGwuc3RhY2hAcGVuZ3V0cm9uaXguZGU+Ogo+Cj4gVml2YW50ZSBUUyAodGlsZS1z
dGF0dXMpIGJ1ZmZlciBtb2RpZmllcnMuIFRoZXkgY2FuIGJlIGNvbWJpbmVkIHdpdGggYWxsIG9m
Cj4gdGhlIFZpdmFudGUgY29sb3IgYnVmZmVyIHRpbGluZyBtb2RpZmllcnMsIHNvIHRoZXkgYXJl
IGtpbmQgb2YgYSBtb2RpZmllcgo+IG1vZGlmaWVyLiBJZiBhIFRTIG1vZGlmaWVyIGlzIHByZXNl
bnQgd2UgaGF2ZSBhIGFkZGl0aW9uYWwgcGxhbmUgZm9yIHRoZQo+IFRTIGJ1ZmZlciBhbmQgdGhl
IG1vZGlmaWVyIGRlZmluZXMgdGhlIGxheW91dCBvZiB0aGlzIFRTIGJ1ZmZlci4KPgoKSSBhbSB1
bnN1cmUgd2h5IHlvdSB3YW50IHRvIGhhdmUgdGhlIFRTIG1vZGlmaWVycyBpbiBkcm1fZm91cmNj
LmguIENhbgp5b3Ugc2hhcmUgc29tZSBpbnNpZ2h0IG9uIHRoaXM/CgotLSAKZ3JlZXRzCi0tCkNo
cmlzdGlhbiBHbWVpbmVyLCBNU2MKCmh0dHBzOi8vY2hyaXN0aWFuLWdtZWluZXIuaW5mby9wcml2
YWN5cG9saWN5Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
