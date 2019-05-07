Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AA14716246
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2019 12:55:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A69D46E797;
	Tue,  7 May 2019 10:55:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D2966E797
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2019 10:55:20 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id u21so4765649lja.5
 for <dri-devel@lists.freedesktop.org>; Tue, 07 May 2019 03:55:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=VXRQC0UsjauveYOiCa1HYIm6GnidpMCvjvUYDOoy8Kk=;
 b=YJUULS5PcbbdtFQ8wPZVWyvsKy3c6TsH543+ughn2vrAuRFkuqJPm9jroqoCvxcW3L
 V+vkgdg/8wVoNCevcJoyQ+5d40t/yVT10GflAoJuzdZN90gG7lJ5vGm52uQZU2c2Rtzg
 dtblmew7u1p+VCHBHpUsAA4JvFBmWSwKFI1vBD4mJ0l1DZ1q1NlPqwlkpmShOHV462Lw
 BNK2QFMU3mFA8JQUPrhN4AhpYo2k/CQK680EgeO0YurLp6d63OltOpTU+3Vx8ZQv6Z6W
 QdE4uTcE7f/fwfE8psqB61iT7pQgTLxMU/ehpFCLvpz6Ki+L7kQ7+4pogqUT4a4/VseF
 r0yw==
X-Gm-Message-State: APjAAAWnDZLYtfn5VUQZGLfhib97moNCk+aNK47lcHpNgqPSLj/gjZ+Z
 /yDZfjQRqYAMm1O66Nkb4W2VfcbcnWfN3ezknck=
X-Google-Smtp-Source: APXvYqzG7AIMRfvZsHfREXhwZ2Vicp5dmMb3CrEXJw5WkOuq4TRI1BSQoriBbA7VwVewocx0xBmOjkzmaCaPMCXnOmg=
X-Received: by 2002:a2e:390c:: with SMTP id g12mr18105225lja.174.1557226518508; 
 Tue, 07 May 2019 03:55:18 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1557215047.git.agx@sigxcpu.org>
 <299e28042e0a24c0cde593873bdfb15e18187a92.1557215047.git.agx@sigxcpu.org>
In-Reply-To: <299e28042e0a24c0cde593873bdfb15e18187a92.1557215047.git.agx@sigxcpu.org>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 7 May 2019 07:55:23 -0300
Message-ID: <CAOMZO5CQXmmw50J3Pjy8wKOr+BBEo_-B9ChV32bq1Re4_0-4CQ@mail.gmail.com>
Subject: Re: [PATCH v10 2/2] phy: Add driver for mixel mipi dphy found on
 NXP's i.MX8 SoCs
To: =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=VXRQC0UsjauveYOiCa1HYIm6GnidpMCvjvUYDOoy8Kk=;
 b=VYDBlMQM/nMdmQESkPNOIOO0h9ONTG/hgvDy8XsTml1o4qUTDLnhRfle9wOL/Zaklv
 va6dq8w70Itj6U1a0GNuU53NVSeQs+Q9lAbDTHZiUh+C+h/TgpwHaZIBejQg3Qw7TqiJ
 o0ISt0SNZCrwyBVZwDgyDHFTeGtQXJZmLvamAW0ayMpIs26LlnmNy7C4hivNW+Rq4Sdm
 HzBc0KFQsIdMtAqpLaeadJXI0mSLZcJOFcmIIejiZZtn1YNFT/XUO9vCu2ckz5yrNVTZ
 aqPylUWrfsjepkTy7Al4ppslefHU6G3Xu6BjPt/OyzO1KDl75KQip4qak1B1XeKUb4ep
 qTaw==
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Sam Ravnborg <sam@ravnborg.org>, Abel Vesa <abel.vesa@nxp.com>,
 Kishon Vijay Abraham I <kishon@ti.com>, NXP Linux Team <linux-imx@nxp.com>,
 Robert Chiras <robert.chiras@nxp.com>, Thierry Reding <treding@nvidia.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Johan Hovold <johan@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>,
 =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, Li Jun <jun.li@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBNYXkgNywgMjAxOSBhdCA0OjQ3IEFNIEd1aWRvIEfDvG50aGVyIDxhZ3hAc2lneGNw
dS5vcmc+IHdyb3RlOgo+Cj4gVGhpcyBhZGRzIHN1cHBvcnQgZm9yIHRoZSBNaXhlbCBEUEhZIGFz
IGZvdW5kIG9uIGkuTVg4IENQVXMgYnV0IHNpbmNlCj4gdGhpcyBpcyBhbiBJUCBjb3JlIGl0IHdp
bGwgbGlrZWx5IGJlIGZvdW5kIG9uIG90aGVycyBpbiB0aGUgZnV0dXJlLiBTbwo+IGluc3RlYWQg
b2YgYWRkaW5nIHRoaXMgdG8gdGhlIG53bCBob3N0IGRyaXZlciBtYWtlIGl0IGEgZ2VuZXJpYyBQ
SFkKPiBkcml2ZXIuCj4KPiBUaGUgZHJpdmVyIHN1cHBvcnRzIHRoZSBpLk1YOE1RLiBTdXBwb3J0
IGZvciBpLk1YOFFNIGFuZCBpLk1YOFFYUCBjYW4gYmUKPiBhZGRlZCBvbmNlIHRoZSBuZWNlc3Nh
cnkgc3lzdGVtIGNvbnRyb2xsZXIgYml0cyBhcmUgaW4gdmlhCj4gbWl4ZWxfZHBoeV9kZXZkYXRh
Lgo+Cj4gU2lnbmVkLW9mZi1ieTogR3VpZG8gR8O8bnRoZXIgPGFneEBzaWd4Y3B1Lm9yZz4KPiBD
by1kZXZlbG9wZWQtYnk6IFJvYmVydCBDaGlyYXMgPHJvYmVydC5jaGlyYXNAbnhwLmNvbT4KPiBT
aWduZWQtb2ZmLWJ5OiBSb2JlcnQgQ2hpcmFzIDxyb2JlcnQuY2hpcmFzQG54cC5jb20+CgpSZXZp
ZXdlZC1ieTogRmFiaW8gRXN0ZXZhbSA8ZmVzdGV2YW1AZ21haWwuY29tPgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
