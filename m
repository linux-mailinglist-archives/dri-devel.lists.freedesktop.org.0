Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 173738CE61
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2019 10:28:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4892F6E434;
	Wed, 14 Aug 2019 08:28:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2942A6E434
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2019 08:28:24 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id a30so15655770lfk.12
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2019 01:28:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=J83KZGJM1H+25Ep5nDkozma8SkGK+OcDZldJ6QzwaH0=;
 b=dql3A7RryeHe9gLaKYCHK75S6KPWdwgnSc/9rCin7I4g+6xj6ayz5/8EF99jjXvSkv
 u2S+cjelM+5uRIGM9SjKc9ksoVATbOHVEhArXOgqaj1r8XB/iilvA6rDnw+JFtoxgxbB
 9p/LVXaXCRkGnD4zN8Ayv723lUmaQFIpsKDIpp7uvh7xiiCGDqiY5HL3OUMWI+b5jWZS
 uy1Zk7MCfCKdDb/xhw1BO3Ds+u1hsJv2xGYSVy5+VWuOlpHRpKriBxKbaX9u8FrZcl9r
 uT+p8DcbPRxwfg5yTEUY/J9wL39tw3/bgFuepEOS0OaL535cbDJc6OIL2vEyZfJsJCi0
 l6Ng==
X-Gm-Message-State: APjAAAWj5J3a4pD07ImoJh2zOYscxGlkUW/3vQCeD+OzM5UMMFxis7V9
 2TB7JoEXPUoN7rHUQV/HGvl7cjSCSAd45XMChrQSxg==
X-Google-Smtp-Source: APXvYqx/pKIYf3ADrbaWtwPl1LapITMRPkDGA7rLXKcmW0V2qmaOIyExXYgPPecgdSpyox9WXnP5n7P2WaFpzCnXOK0=
X-Received: by 2002:ac2:59d0:: with SMTP id x16mr26028436lfn.60.1565771302470; 
 Wed, 14 Aug 2019 01:28:22 -0700 (PDT)
MIME-Version: 1.0
References: <20190812073020.19109-1-geert@linux-m68k.org>
In-Reply-To: <20190812073020.19109-1-geert@linux-m68k.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 14 Aug 2019 10:28:10 +0200
Message-ID: <CACRpkdZAA8N6igrNaXcT5m62Fz2irRL-tyRZnjWgsxfacB2aow@mail.gmail.com>
Subject: Re: [PATCH] m68k: atari: Rename shifter to shifter_st to avoid
 conflict
To: Geert Uytterhoeven <geert@linux-m68k.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=J83KZGJM1H+25Ep5nDkozma8SkGK+OcDZldJ6QzwaH0=;
 b=cUmVYG8UsBSWCZJv2pd/lU/PNItzi2UNLiW0TfIkMtuhz/f0dnCZQBVRRPzmjzbDU1
 rdC1UiKranq4PCx9s8pGLDdNWlc7JTJqMhRBsGlJk7PTqFNy1P03hYYsmPkCfCPrboHE
 0D/9A510sxkFeysavEIqfp66pVKT46ihtgpDP36P8Z3A4hJbbaT/WITBlrYDFwxlDNcN
 zLMkVCuS8HXPJzOiNrSXY8IyUTRz7gMllIMp1c64kuJZOjJK6HczBxJ2Av8+QOz7gA+0
 T4EXfGOohdgKCjLCVyIixyz3hWalVsJruTGIoJAsFUhUGYsjdb9sJ/UEHSaA2BoPhqiD
 jY7w==
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
Cc: Michael Schmitz <schmitzmic@gmail.com>, linux-fbdev@vger.kernel.org,
 kbuild test robot <lkp@intel.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>, Stefan Wahren <wahrenst@gmx.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBBdWcgMTIsIDIwMTkgYXQgOTozMCBBTSBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0
QGxpbnV4LW02OGsub3JnPiB3cm90ZToKCj4gV2hlbiB0ZXN0LWNvbXBpbGluZyB0aGUgQkNNMjgz
NSBwaW4gY29udHJvbCBkcml2ZXIgb24gbTY4azoKPgo+ICAgICBJbiBmaWxlIGluY2x1ZGVkIGZy
b20gYXJjaC9tNjhrL2luY2x1ZGUvYXNtL2lvX21tLmg6MzI6MCwKPiAgICAgICAgICAgICAgICAg
ICAgICBmcm9tIGFyY2gvbTY4ay9pbmNsdWRlL2FzbS9pby5oOjgsCj4gICAgICAgICAgICAgICAg
ICAgICAgZnJvbSBpbmNsdWRlL2xpbnV4L2lvLmg6MTMsCj4gICAgICAgICAgICAgICAgICAgICAg
ZnJvbSBpbmNsdWRlL2xpbnV4L2lycS5oOjIwLAo+ICAgICAgICAgICAgICAgICAgICAgIGZyb20g
aW5jbHVkZS9saW51eC9ncGlvL2RyaXZlci5oOjcsCj4gICAgICAgICAgICAgICAgICAgICAgZnJv
bSBkcml2ZXJzL3BpbmN0cmwvYmNtL3BpbmN0cmwtYmNtMjgzNS5jOjE3Ogo+ICAgICBkcml2ZXJz
L3BpbmN0cmwvYmNtL3BpbmN0cmwtYmNtMjgzNS5jOiBJbiBmdW5jdGlvbiAnYmNtMjcxMV9wdWxs
X2NvbmZpZ19zZXQnOgo+ICAgICBhcmNoL202OGsvaW5jbHVkZS9hc20vYXRhcmlody5oOjE5MDoy
MjogZXJyb3I6IGV4cGVjdGVkIGlkZW50aWZpZXIgb3IgJygnIGJlZm9yZSAndm9sYXRpbGUnCj4g
ICAgICAjIGRlZmluZSBzaGlmdGVyICgoKih2b2xhdGlsZSBzdHJ1Y3QgU0hJRlRFUiAqKVNIRl9C
QVMpKQo+Cj4gInNoaWZ0ZXIiIGlzIGEgdG9vIGdlbmVyaWMgbmFtZSBmb3IgYSBnbG9iYWwgZGVm
aW5pdGlvbi4KPgo+IEFzIHRoZSBjb3JyZXNwb25kaW5nIGRlZmluaXRpb24gZm9yIEF0YXJpIFRU
IGlzIGFscmVhZHkgY2FsbGVkCj4gInNoaWZ0ZXJfdHQiLCBmaXggdGhpcyBieSByZW5hbWluZyB0
aGUgZGVmaW5pdGlvbiBmb3IgQXRhcmkgU1QgdG8KPiAic2hpZnRlcl9zdCIuCj4KPiBSZXBvcnRl
ZC1ieToga2J1aWxkIHRlc3Qgcm9ib3QgPGxrcEBpbnRlbC5jb20+Cj4gU3VnZ2VzdGVkLWJ5OiBN
aWNoYWVsIFNjaG1pdHogPHNjaG1pdHptaWNAZ21haWwuY29tPgo+IFNpZ25lZC1vZmYtYnk6IEdl
ZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4ay5vcmc+CgpGaW5hbGx5IHdlIGNhbiB1
c2UgdGhlIHNoIHBmYyBwaW4gY29udHJvbGxlciBvbiBvdXIgbTY4ayBBdGFyaS4KCk5vdyBpZiBJ
IGNhbiBvbmx5IHJlc29sZGVyIHRoZSBjYXBhY2l0b3JzIG9uIG15IEF0YXJpIFRUIFNUCmJlZm9y
ZSB0aGUgYm9hcmQgc2VsZi1kZXN0cnVjdHMgSSB3aWxsIG9uZSBkYXkgdGVzdCB0aGlzLgoKUmV2
aWV3ZWQtYnk6IExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz4KCllvdXJz
LApMaW51cyBXYWxsZWlqCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
