Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BF115814E
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2019 13:18:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7DBC6E0C5;
	Thu, 27 Jun 2019 11:18:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D0FA6E0C5
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2019 11:18:34 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id x25so1949120ljh.2
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2019 04:18:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8n9+wAZmn5Fd4Bzu+75sf62mEboo0TEMxpHy4S/JDDc=;
 b=jUPJPLEfmVS61e7YocIHGK5RN+6J0+nqw5jkSrlUCF6NmMrJtzKsUTwirpbFz4UqGe
 4dgYguMb6qAElvby1ssEzkllWd39xR71vJvZUSYoBF2PLlm7W+Sp30Q2m4rCS5M+QtdE
 9AMKRzKJHlZ1BgW0vo+GnTsNhRAxjMlyqPefyEyMqnrZ4KBBpVeLC7jZNPEgIrb9Oc9M
 bIAVSisgLnO8H/qvKNIXmznVIzp3XdBOwSuvz8cdcsvc6+iJ3qk1JNEI/m/e4PI1KiR3
 Ld+7cuNjjNDR6/FMDEQrSZc8RBo1g8XTG/sIXTHGuRQKMQO7UaoX8IAzUKXUCysU4S1R
 TO1g==
X-Gm-Message-State: APjAAAU5/msFd81Nyi86BRSgLp+glxfhZT4zE134MwiJV7y53jlTkxPQ
 vlU4A9I61s1tRWycHg82boZ0mgqHKUHhTYyNmWgnDA==
X-Google-Smtp-Source: APXvYqyJgd2+Ftd/iJyvgwExAYZa4Qg2yTKy4cVImG+ErCp4ffuDePBsvOgPaNQqma8bvu1LdZ28/ackt3s9WUPQPiw=
X-Received: by 2002:a2e:2c14:: with SMTP id s20mr2275133ljs.54.1561634312954; 
 Thu, 27 Jun 2019 04:18:32 -0700 (PDT)
MIME-Version: 1.0
References: <20190625163434.13620-1-brgl@bgdev.pl>
 <20190625163434.13620-9-brgl@bgdev.pl>
In-Reply-To: <20190625163434.13620-9-brgl@bgdev.pl>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 27 Jun 2019 12:18:21 +0100
Message-ID: <CACRpkdanZPmKrRwY9nvEGx=BzoVFxzU7ENgvoOzH+0u=-YTC0A@mail.gmail.com>
Subject: Re: [PATCH 08/12] ARM: davinci: da850-evm: switch to using a fixed
 regulator for lcdc
To: Bartosz Golaszewski <brgl@bgdev.pl>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=8n9+wAZmn5Fd4Bzu+75sf62mEboo0TEMxpHy4S/JDDc=;
 b=cEL9oCZ+zomWJ2LmSGc4fuxflwhDPejxyVo6c+Rrs/G5ajtyDASQo492gEPQbHBHeC
 kq2jja8VgsqeyP+QTo5k9C1iud716f33VVhYiaF0S1ifrCTPqGBA3agxt3h4qp8PogBb
 HAjqSFBfrIo3Brf1SoGU3Lrycq3Z/djnv+/ohRmtMo8JSvOptyWZ4wR2DbecRgcyamsL
 sAkedb2FQ4o9w3DtYSfbMDvQNMVvQ36osCybYA/9i+32Df7OcVRSOfvO1IubOE+6SGOy
 pCkSz7JgrJFkWpR8mCBCB7y10iOSH5pbaz+CXHodmK0K3BaNNWlRFQbn954OwIf5nzV0
 hYUg==
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 David Lechner <david@lechnology.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jingoo Han <jingoohan1@gmail.com>, Kevin Hilman <khilman@kernel.org>,
 Sekhar Nori <nsekhar@ti.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, linux-fbdev@vger.kernel.org,
 Lee Jones <lee.jones@linaro.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdW4gMjUsIDIwMTkgYXQgNTozNSBQTSBCYXJ0b3N6IEdvbGFzemV3c2tpIDxicmds
QGJnZGV2LnBsPiB3cm90ZToKCj4gRnJvbTogQmFydG9zeiBHb2xhc3pld3NraSA8YmdvbGFzemV3
c2tpQGJheWxpYnJlLmNvbT4KPgo+IE5vdyB0aGF0IHRoZSBkYTh4eCBmYmRldiBkcml2ZXIgc3Vw
cG9ydHMgcG93ZXIgY29udHJvbCB3aXRoIGFuIGFjdHVhbAo+IHJlZ3VsYXRvciwgc3dpdGNoIHRv
IHVzaW5nIGEgZml4ZWQgcG93ZXIgc3VwcGx5IGZvciBkYTg1MC1ldm0uCj4KPiBTaWduZWQtb2Zm
LWJ5OiBCYXJ0b3N6IEdvbGFzemV3c2tpIDxiZ29sYXN6ZXdza2lAYmF5bGlicmUuY29tPgoKUmV2
aWV3ZWQtYnk6IExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz4KCllvdXJz
LApMaW51cyBXYWxsZWlqCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
