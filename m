Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B454C9895
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2019 08:50:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 186166E22F;
	Thu,  3 Oct 2019 06:50:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BF136E22F
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Oct 2019 06:50:29 +0000 (UTC)
Received: by mail-io1-xd41.google.com with SMTP id h144so3009907iof.7
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Oct 2019 23:50:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tt/S1MK2hfNRmcchY+VX0l8ftGF+jAU5aVZJF+oZt2U=;
 b=Z6aORcMR1pdhbCXu4a2lXRl9XpVr4IMxdCbr47TgS1IYaCC9DlFMM9aGyJ4cZGnpWG
 9GQVDt6UXVNGrCv5cvlm0UshUYJPIVM9Y3bwxZj26aVN4tru1TXSjBdjl9bUlO9vxWAo
 EWGuoxZxP4qch3xxa2cqsh4KZG95GaEzMSkZ4KZNV3xeHYzHSPy7GExLj0W+WI79ZJQ+
 1Ac6dM3K/mkkyC/UNGS5cZ8pCbaPbhX1LvHrwHA+7ypu9kMqaibI9BHM5Wj7IRQXXV7z
 WB7F4M7uik7rdk7VgAbCz/HsLmImdLG9YfPeQBbeStSDi83WKLLFrwPHuzyF2pbT0Ohp
 ZhiQ==
X-Gm-Message-State: APjAAAV2Xmske35YuUQxybYi2MXB/XO2oD7PYsrG4hi5Vfea1Z0OH4QP
 oCblB8RrH5UVQ69yz/U9mmnRNmDtWBRw+gjtffxbjA==
X-Google-Smtp-Source: APXvYqw9C5okno4/FEmbGgjCtziH8L0ligLd5zphx/vdqtLp/tQvohb/XmjYoGGwm1th0cj3JsX+zL0a2/erxOU/7LI=
X-Received: by 2002:a92:c74d:: with SMTP id y13mr8565455ilp.77.1570085428660; 
 Wed, 02 Oct 2019 23:50:28 -0700 (PDT)
MIME-Version: 1.0
References: <20191003064527.15128-1-jagan@amarulasolutions.com>
 <20191003064527.15128-7-jagan@amarulasolutions.com>
In-Reply-To: <20191003064527.15128-7-jagan@amarulasolutions.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Thu, 3 Oct 2019 12:20:17 +0530
Message-ID: <CAMty3ZD95L83dzsBwNghfahZ2mfmmOn0iA40t534i91UN7P_uQ@mail.gmail.com>
Subject: Re: [PATCH v11 6/7] drm/panel: Add Bananapi S070WV20-CT16 ICN6211
 MIPI-DSI to RGB bridge
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=tt/S1MK2hfNRmcchY+VX0l8ftGF+jAU5aVZJF+oZt2U=;
 b=it//+pUV0o+AfLtqgd58MPT3/eGz5NZ/3fJdCcTXH9p/mKoqt8vNSKVtRXo25SyElS
 ubjXKxRDSeAb4aFRKo/9jZCkbm00Q4lM4bVPvOUs6Y+y+15CztcT7PA8pPFcNzG3tmlC
 Xla/5zwL8a+0Cm7HMHu0mixFm6s4bazOxYl0E=
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
Cc: devicetree <devicetree@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-sunxi <linux-sunxi@googlegroups.com>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Icenowy Zheng <icenowy@aosc.io>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBPY3QgMywgMjAxOSBhdCAxMjoxNiBQTSBKYWdhbiBUZWtpIDxqYWdhbkBhbWFydWxh
c29sdXRpb25zLmNvbT4gd3JvdGU6Cj4KPiBCYW5hbmFwaSBTMDcwV1YyMC1DVDE2IElDTjYyMTEg
aXMgODAweDQ4MCwgNC1sYW5lIE1JUEktRFNJIHRvIFJHQiBicmlkZ2UKPiBwYW5lbCB3aGljaCBj
YW4gYmUgdXNlZCB0byBjb25uZWN0IHZpYSBEU0kgcG9ydCBvbiBCUEktTTY0IGJvYXJkLAo+IHNv
IGFkZCBhIGRyaXZlciBmb3IgaXQuCj4KPiBUaGUgc2FtZSBwYW5lbCBQQ0IgY29tZXMgd2l0aCBw
YXJhbGxlbCBSQkcgd2hpY2ggaXMgc3VwcG9ydGVkIHZpYQo+IHBhbmVsLXNpbXBsZSBkcml2ZXIg
d2l0aCAiYmFuYW5hcGksczA3MHd2MjAtY3QxNiIgY29tcGF0aWJsZS4KPgo+IFNpZ25lZC1vZmYt
Ynk6IEphZ2FuIFRla2kgPGphZ2FuQGFtYXJ1bGFzb2x1dGlvbnMuY29tPgo+IC0tLQo+ICBkcml2
ZXJzL2dwdS9kcm0vcGFuZWwvS2NvbmZpZyAgICAgICAgICAgICAgICAgfCAgIDkgKwo+ICBkcml2
ZXJzL2dwdS9kcm0vcGFuZWwvTWFrZWZpbGUgICAgICAgICAgICAgICAgfCAgIDEgKwo+ICAuLi4v
cGFuZWwvcGFuZWwtYmFuYW5hcGktczA3MHd2MjAtaWNuNjIxMS5jICAgfCAyOTMgKysrKysrKysr
KysrKysrKysrCgpUaGlzIHdvdWxkIGJlIGFuIG92ZXJsYXkgcGF0Y2gsIHdoaWNoIGRvZXNuJ3Qg
bmVlZCB0byBtZWdlLiBwbGVhc2UKY29ycmVjdCB0aGUgc2FtZS4KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
