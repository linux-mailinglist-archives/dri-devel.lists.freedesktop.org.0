Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2198378DD6
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jul 2019 16:27:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 592FB89BFB;
	Mon, 29 Jul 2019 14:27:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD90589BFB
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jul 2019 14:27:34 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id p17so58819195ljg.1
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jul 2019 07:27:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=IfFtsX7/KQzCdNl+4EmQ+q1A1wAgR9VhDhbJ3xDy0FI=;
 b=tQuAnP2C0YEr9wk/g3167tJ8fOhbbDCFmzz238+v8SmzIgliSdHHv8ep9Q5W9WRtAA
 UsD5MIV0ccyGr3rN4g7byeyj09+5PvAWQT8d97cjp7cCqaW71b5Wo9YN72TqX790/3nd
 ApAQpi51hYREBD6O46MuMQQfttwPwaRs+mez/A6KDhlyg/rH0wGYtRu1daRD989t/2yb
 enCgXvTJm+LhquaJw8SPZ9MmAN7HTS6Njb+EhJRP+CMrBwGc9HWWdnrW6EwL8YYsYhpI
 LzLysfBd1DISuaIj9VjgxjNXA67iVofVNNDOGdKRL3IOMYsXkjfOu/qa8UGKykdkYLRV
 qC4A==
X-Gm-Message-State: APjAAAWyj8m9rT958CzzkhWyxfxwuPZzAjMjes7iygyp1h0k9pPrGmDq
 2j/sGYl5Vup+56fIIY7ipIdn1RBbyIxA24OoUwUvbdLAOM4=
X-Google-Smtp-Source: APXvYqxyvYnlrpXV+q974vRNYgN8Q7Dgy+WEUgJJaPMwdxJhAwANTp+qf0ki5yF5XNm5+lqtCYtJQUee5dZGKBZE/u4=
X-Received: by 2002:a2e:a311:: with SMTP id l17mr56352974lje.214.1564410453056; 
 Mon, 29 Jul 2019 07:27:33 -0700 (PDT)
MIME-Version: 1.0
References: <20190729141349.28465-1-sebastien.szymanski@armadeus.com>
In-Reply-To: <20190729141349.28465-1-sebastien.szymanski@armadeus.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 29 Jul 2019 11:27:37 -0300
Message-ID: <CAOMZO5CFqQEdqgwyHZ2E2F22QDgG8SUjBM0y4Y6qyn8Tqo4O0g@mail.gmail.com>
Subject: Re: [PATCH 1/1] drm: mxsfb: add i.MX6UL in Kconfig
To: =?UTF-8?Q?S=C3=A9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=IfFtsX7/KQzCdNl+4EmQ+q1A1wAgR9VhDhbJ3xDy0FI=;
 b=TL/ogVAqOph3tA0zqcygELc5HLq5Orqtel3nHcqIUrSjaAeJOmKqUg57nswgEvcMRr
 3ttzxGwo4apa/dW3yhpCmu2eiXrSeVqCvMQT9QnjrfsXjljf1kU/piOxks/XVJ/2LeE/
 sUbVgSzK9xKTHJPaCAC/mlQp7J4uz7nvMPnbMFVDn8m9FlEXmNBEvbQIlI4j1RzY5UYb
 rwpqX0kwYO5RQg9VkKfESEcOLg/hv3c9HZTNy7Y3jszlZY9tSg6b375WdHH6brWKc7nO
 DZmBm+Y6gIHA9LueWGA4k+dGAhJPDW//+TnhgStSquXKm59+YelelakFb+8M+Xk+H0b+
 1HFg==
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
Cc: Marek Vasut <marex@denx.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>,
 Julien BOIBESSOT <julien.boibessot@armadeus.com>,
 NXP Linux Team <linux-imx@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgU8OpYmFzdGllbiwKCk9uIE1vbiwgSnVsIDI5LCAyMDE5IGF0IDExOjE0IEFNIFPDqWJhc3Rp
ZW4gU3p5bWFuc2tpCjxzZWJhc3RpZW4uc3p5bWFuc2tpQGFybWFkZXVzLmNvbT4gd3JvdGU6Cgo+
ICBjb25maWcgRFJNX01YU0ZCCj4gLSAgICAgICB0cmlzdGF0ZSAiaS5NWDIzL2kuTVgyOC9pLk1Y
NlNYIE1YU0ZCIExDRCBjb250cm9sbGVyIgo+ICsgICAgICAgdHJpc3RhdGUgImkuTVgyMy9pLk1Y
MjgvaS5NWDZTWC9pLk1YNlVMIE1YU0ZCIExDRCBjb250cm9sbGVyIgoKVGhpcyBJUCBpcyBhbHNv
IGZvdW5kIG9uIGkuTVg2U0wsIGkuTVg3RCwgaS5NWDdTLCBpLk1YOE0sIGkuTVg4UVhQLCBldGMK
CkkgdGhpbmsgaXQgd291bGQgYmUgYmV0dGVyIGlmIHdlIGRvIG5vdCBrZWVwIGluY3JlYXNpbmcg
dGhlIGxpc3Qgb2YKc3VwcG9ydGVkIFNvQ3MgaW4gdGhlIEtjb25maWcgdGV4dC4KCldoYXQgYWJv
dXQganVzdCBoYXZpbmcgdGhlIHRleHQgbGlrZSB0aGlzIGluc3RlYWQ/Cgp0cmlzdGF0ZSAiTVhT
RkIgTENEIGNvbnRyb2xsZXIiCgo+ICAgICAgICAgZGVwZW5kcyBvbiBEUk0gJiYgT0YKPiAgICAg
ICAgIGRlcGVuZHMgb24gQ09NTU9OX0NMSwo+ICAgICAgICAgc2VsZWN0IERSTV9NWFMKPiBAQCAt
MTQsNyArMTQsNyBAQCBjb25maWcgRFJNX01YU0ZCCj4gICAgICAgICBzZWxlY3QgRFJNX0tNU19D
TUFfSEVMUEVSCj4gICAgICAgICBzZWxlY3QgRFJNX1BBTkVMCj4gICAgICAgICBoZWxwCj4gLSAg
ICAgICAgIENob29zZSB0aGlzIG9wdGlvbiBpZiB5b3UgaGF2ZSBhbiBpLk1YMjMvaS5NWDI4L2ku
TVg2U1ggTVhTRkIKPiArICAgICAgICAgQ2hvb3NlIHRoaXMgb3B0aW9uIGlmIHlvdSBoYXZlIGFu
IGkuTVgyMy9pLk1YMjgvaS5NWDZTWC9pLk1YNlVMIE1YU0ZCCj4gICAgICAgICAgIExDRCBjb250
cm9sbGVyLgoKYW5kIGhlcmUgaXQgd291bGQgYmVjb21lOgoKQ2hvb3NlIHRoaXMgb3B0aW9uIGlm
IHlvdSB3YW50IHRvIHN1cHBvcnQgdGhlIE1YU0ZCIExDRCBjb250cm9sbGVyLgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
