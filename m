Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E295378FD9
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jul 2019 17:51:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 146C789E1B;
	Mon, 29 Jul 2019 15:51:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF41E89E1B
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jul 2019 15:51:04 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id 62so37536720lfa.8
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jul 2019 08:51:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=F40lGZ5Y/dCEzpWTYTx/X4Zd/G360xL3G5J5Vnqc+uM=;
 b=ZH7NRy72Co/6lOZElmO0BuprcaiP6qp94xddn4I/2y5GaLaW2HS7UdOz9BC+mQQBKw
 kCE2m/HeT7KbwL0qgUsHb8KLHL0JOFHWyunovaWM9ddQpiqH9SNFtJqRX0q2Mt4UrULU
 oG9RQItrrpY5hcOz6mW3qHYnz1UgU8I3r4y5wBO55oNqRjNwI26/qVs0D7rXwamZ5jRD
 gcCdRpuqQgCSpF3UVHYL6+mfqCNRT7fhOLeB+2OMBl4fOiSNM+/gAshCwwvr1OMfcflF
 vLLahE39swCMGp59OQcrp+1p8LHyiFj5h3PRdHDvJZJtGf9iH5NX0sXLzN3q/KQyaOZO
 OSOQ==
X-Gm-Message-State: APjAAAUcllZB1mW1GgnewmoUrJdJ2n0dpfzL/v4Zo6Qyh8SZoJWVR/DP
 vGWqLBx/VxyQCjhumKsNgHtc4aF6PbUmd2b06nk=
X-Google-Smtp-Source: APXvYqz50dj+aOYazfoYgFD9FrzD9jcB50OsVJ3zrOY1O1BGw/6yhvdJJWEWXNUVAehrLxtX7rYRMbWvyMGcjidXX2s=
X-Received: by 2002:a05:6512:146:: with SMTP id
 m6mr51844088lfo.90.1564415463082; 
 Mon, 29 Jul 2019 08:51:03 -0700 (PDT)
MIME-Version: 1.0
References: <20190729141349.28465-1-sebastien.szymanski@armadeus.com>
 <CAOMZO5CFqQEdqgwyHZ2E2F22QDgG8SUjBM0y4Y6qyn8Tqo4O0g@mail.gmail.com>
 <20190729143749.GB16927@ravnborg.org>
In-Reply-To: <20190729143749.GB16927@ravnborg.org>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 29 Jul 2019 12:51:08 -0300
Message-ID: <CAOMZO5Aew=fWnu1wweSBdFpN2SrChR9r+RST+C2RWwbsOyzRxg@mail.gmail.com>
Subject: Re: [PATCH 1/1] drm: mxsfb: add i.MX6UL in Kconfig
To: Sam Ravnborg <sam@ravnborg.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=F40lGZ5Y/dCEzpWTYTx/X4Zd/G360xL3G5J5Vnqc+uM=;
 b=CGv3ctCI/3RASXmbu+U1Fwxxnk0jZXexm3jertP+lBvqUZI3bFLHLlOtbyxOuy41Xm
 3qYf/aJtU8yPT8euw4MhXEYPXTEa3KNYh65Z96R5TezfKKl5a5K7vuhz/JUGhIeFRZMY
 ar6o0P02kszB6mIxSn0cOsMRQYnWRnVn/zEBTj3diHu8TqLsCAUQMMufpsVaDwCw1NLd
 HXPxTcaXERLzC3QiZGPaJeWy8jRbcL7xfF+C5uiQ6q8IioubGfNeD8lw5+DJMl1EOHxV
 /xVTBhc+K3BxASrYhpd6xTemyIvfi1OHeECJJm/BBngR3YPbVb/PGXXdbgF939+/sRMB
 I3nw==
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
Cc: Marek Vasut <marex@denx.de>, David Airlie <airlied@linux.ie>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Julien BOIBESSOT <julien.boibessot@armadeus.com>,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 =?UTF-8?Q?S=C3=A9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>,
 Shawn Guo <shawnguo@kernel.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgU2FtLAoKT24gTW9uLCBKdWwgMjksIDIwMTkgYXQgMTE6MzcgQU0gU2FtIFJhdm5ib3JnIDxz
YW1AcmF2bmJvcmcub3JnPiB3cm90ZToKCj4gQ291bGQgd2UgdGhyb3cgYSBDT01QSUxFX1RFU1Qg
aW4gdGhlIG1peCBzbyB3ZSBnZXQgYmV0dGVyIGJ1aWxkCj4gY292ZXJhZ2UgdG9vPwoKVGhlcmUg
aXMgbm8gYXJjaGl0ZWN0dXJlIGRlcGVuZGVuY3kgdG8gYnVpbGQgdGhpcyBkcml2ZXIsIHNvIHdl
CmFscmVhZHkgaGF2ZSBidWlsZCBjb3ZlcmFnZSBmb3IgaXQuCgpSZWdhcmRzLAoKRmFiaW8gRXN0
ZXZhbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
