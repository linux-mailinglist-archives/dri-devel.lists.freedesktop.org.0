Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 63B7041E1D
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2019 09:44:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC70C89369;
	Wed, 12 Jun 2019 07:44:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
 [209.85.208.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D855D89369
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 07:44:38 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id a21so14196626ljh.7
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 00:44:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=X8qI+K1xZjRK+NdOOz86FF5j+ZtlRB7/6DTVTXKF734=;
 b=Q5gzM1K4jfwHzYjsepfKsRM5nUN2mboVrC5yi8cyKHyggTuT32w595GYQiumHvqGY1
 9GN1TnCRxczHTj/uLUtnOUmsXgJkIZOoaaR+U55tOLRGxLXBjlUwkbq4JCAAHJI831Sk
 f6iZTjnf8whtrSLyyInPMpU108BQev1x8grEBPvyuZi+9pFjiDyIWTjnwexJalSuL2us
 e7ek3gyk0tF0U0ZkyXlq02P9kH927m9uShVN71P/ZfMjUEjt0gopGnjwUSx1m6ODbyD1
 ongNVUqhW/5sQdvAIJqGKqc2mZ50sV20/ZeHP+rpNSiZGInvluFKNC6mgogBEHyuYNRD
 dQZA==
X-Gm-Message-State: APjAAAWvUks8D4JFcLAdtoGitAfnj8ti8asExMmHHmkDBDFAKBRX1gLR
 MEWVqyfqcDKWfN1tDTpNv0C/WtsMLAbgpUYlsFM=
X-Google-Smtp-Source: APXvYqwqjvmsWovfy3c/DnJKFE/85y6DDp5DqVaHiqxmI7nQIoKcXFnH2pWr0W3phGJ5tzE4bmOKa0Deili3rUO1d5Q=
X-Received: by 2002:a2e:91c5:: with SMTP id u5mr3517346ljg.65.1560325477287;
 Wed, 12 Jun 2019 00:44:37 -0700 (PDT)
MIME-Version: 1.0
References: <20190606142220.1392-1-jacopo+renesas@jmondi.org>
 <20190606142220.1392-9-jacopo+renesas@jmondi.org>
In-Reply-To: <20190606142220.1392-9-jacopo+renesas@jmondi.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 12 Jun 2019 09:44:24 +0200
Message-ID: <CAMuHMdX1c81RMbURNnCRW7OtZbDfSWsKSY+rMc_1GADuLom=ew@mail.gmail.com>
Subject: Re: [PATCH 08/20] clk: renesas: r8a77995: Add CMM clocks
To: Jacopo Mondi <jacopo+renesas@jmondi.org>
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
Cc: muroya@ksk.co.jp, VenkataRajesh.Kalakodima@in.bosch.com,
 David Airlie <airlied@linux.ie>, Koji Matsuoka <koji.matsuoka.xm@renesas.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Harsha.ManjulaMallikarjun@in.bosch.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdW4gNiwgMjAxOSBhdCA0OjIyIFBNIEphY29wbyBNb25kaSA8amFjb3BvK3JlbmVz
YXNAam1vbmRpLm9yZz4gd3JvdGU6Cj4gQWRkIGNsb2NrIGRlZmluaXRpb25zIGZvciBDTU0gdW5p
dHMgb24gUmVuZXNhcyBSLUNhciBHZW4zIEQzLgo+Cj4gU2lnbmVkLW9mZi1ieTogSmFjb3BvIE1v
bmRpIDxqYWNvcG8rcmVuZXNhc0BqbW9uZGkub3JnPgoKUmV2aWV3ZWQtYnk6IEdlZXJ0IFV5dHRl
cmhvZXZlbiA8Z2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU+CmkuZS4gd2lsbCBxdWV1ZSBpbiBjbGst
cmVuZXNhcy1mb3ItdjUuMy4KCkdye29ldGplLGVldGluZ31zLAoKICAgICAgICAgICAgICAgICAg
ICAgICAgR2VlcnQKCi0tIApHZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExp
bnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LW02OGsub3JnCgpJbiBwZXJzb25hbCBjb252
ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4g
QnV0CndoZW4gSSdtIHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1l
ciIgb3Igc29tZXRoaW5nIGxpa2UgdGhhdC4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAtLSBMaW51cyBUb3J2YWxkcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
