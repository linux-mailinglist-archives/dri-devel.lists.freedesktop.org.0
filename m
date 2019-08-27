Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A5D259E6B7
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2019 13:25:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C079898B7;
	Tue, 27 Aug 2019 11:25:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
 [209.85.167.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F28BC898B7
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2019 11:25:40 +0000 (UTC)
Received: by mail-oi1-f196.google.com with SMTP id k22so14620292oiw.11
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2019 04:25:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sbe+mD9TjSIALmM4jOBGJ1BaowYoqtIQG+RaLF5qQhI=;
 b=VQqb/B87iY5zikBG6RldAB1RQouHFC7yRHSo3HxqR47MtjLXhV4RrUc85chOsGc+N6
 YZo5E+HMSY8k46eDuU1XkME75vgoojeDINDRFB7Ho/G9E9ejVVrJEs70Wx1OvpaY9nAp
 1iPYVmvIcDQNwCli+O9U/9vIqLRgsKiBlClcOxsfDwRpsaqjbfHEuilYuKxXqq5ZTPkR
 qxIT/SZe7ch+s9XGHyIMTxk9vXZMEunB+OVOy0q62uIyG+6OB4Y1RKoZUWUaNzr1eo+E
 cZ73nfX9e76VL7P2KPpIuyO5QUDTlqKyAASoXeBtxVt7thoKBKMnB8rQvdOqw5Dq2y3z
 spwA==
X-Gm-Message-State: APjAAAWHAvSK0L9qvvIRXdcPrE/6du3KlM6Qg/IZR8OeXU7R/+SuI/bY
 lm34Pxe09EV6my9LhfcF+GZRqsFj5tO1ibKSD28=
X-Google-Smtp-Source: APXvYqyBmLm+aF54MGwelCc+w4hkzT2alLYfQdaYjb4e9WDwRSce6dti3GUc+LGiArPFcvFQ7bgcck/G/b9VD42wTiI=
X-Received: by 2002:a54:478d:: with SMTP id o13mr15817144oic.54.1566905140208; 
 Tue, 27 Aug 2019 04:25:40 -0700 (PDT)
MIME-Version: 1.0
References: <20190827110854.12574-1-peda@axentia.se>
 <20190827110854.12574-3-peda@axentia.se>
In-Reply-To: <20190827110854.12574-3-peda@axentia.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 27 Aug 2019 13:25:29 +0200
Message-ID: <CAMuHMdU1PEyqh8e5n3_xp1NT8YdPYXEyHDiaVQYOYKYKCm8y1A@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] fbdev: fbmem: allow overriding the number of
 bootup logos
To: Peter Rosin <peda@axentia.se>
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
Cc: "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 Jonathan Corbet <corbet@lwn.net>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Matthew Wilcox <willy@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBBdWcgMjcsIDIwMTkgYXQgMTowOSBQTSBQZXRlciBSb3NpbiA8cGVkYUBheGVudGlh
LnNlPiB3cm90ZToKPiBQcm9iYWJseSBtb3N0IHVzZWZ1bCBpZiB5b3Ugd2FudCBubyBsb2dvIGF0
IGFsbCwgb3IgaWYgeW91IG9ubHkgd2FudCBvbmUKPiBsb2dvIHJlZ2FyZGxlc3Mgb2YgaG93IG1h
bnkgQ1BVIGNvcmVzIHlvdSBoYXZlLgo+Cj4gU2lnbmVkLW9mZi1ieTogUGV0ZXIgUm9zaW4gPHBl
ZGFAYXhlbnRpYS5zZT4KClJldmlld2VkLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0QGxp
bnV4LW02OGsub3JnPgoKR3J7b2V0amUsZWV0aW5nfXMsCgogICAgICAgICAgICAgICAgICAgICAg
ICBHZWVydAoKLS0gCkdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXgg
YmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4ay5vcmcKCkluIHBlcnNvbmFsIGNvbnZlcnNh
dGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQK
d2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBv
ciBzb21ldGhpbmcgbGlrZSB0aGF0LgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0t
IExpbnVzIFRvcnZhbGRzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
