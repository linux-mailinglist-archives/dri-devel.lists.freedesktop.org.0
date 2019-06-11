Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5954E3CAB0
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2019 14:06:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00DE5891D5;
	Tue, 11 Jun 2019 12:06:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91F21891D5
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 12:06:08 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id m23so11307446lje.12
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 05:06:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lZXirDOut9vTqPwIy2+NlkcxYvoX0FlWKfU61yeOlXc=;
 b=EtfDRJM0mM9oPb+VGnF3+Hio19L/dq2DNjNSuOlKQuNGTj6pDov08YgcFO0xILhGMX
 UMuhpmJc/dvWqFnTBQ4D9K9wcXsUO7o+ZpNYs5kffF7xtC9HqoRdoBDE/ZbwURklznCW
 fkmo9PdkgR0bxkcQJsGyE7tAwUZv2RlD+DV1z9sVQtEfUcucvSxVd0F24fLOba+Butw9
 E3HPWTr4SxiCXhFjpEaEa2u0R/WkP07k6L0/aUd5AE8pQh0NkPe2Fc3v0qFIr3KVERwa
 tjk6/+wHglpSgaJawV7kmq7dzOb/he23rE2tbHSPEHJYYraXY4s6jzq+V3nKXiuIyeza
 +dsQ==
X-Gm-Message-State: APjAAAVFVq/QIfcLLizMEo3KWef/lrSUcek/EkHWCcs9MNoHUEnddN/e
 4O0UhnKEtcw1L7c3vbgsgpTH0i7rjQGGyC9k61A=
X-Google-Smtp-Source: APXvYqyNbKW8MLdfiFF2bBbCPn6JlewYUZ4cSvk+vV6vxfgRu10IAU5IRNihSdhfyXPovuQjMfLgF6htx5YUpU9HpCk=
X-Received: by 2002:a2e:a318:: with SMTP id l24mr27777904lje.36.1560254767023; 
 Tue, 11 Jun 2019 05:06:07 -0700 (PDT)
MIME-Version: 1.0
References: <20190610175234.196844-1-dianders@chromium.org>
 <CAMavQKLRm8uYu3O=co5Ui7YjkK0hKHAd=+TA0oExfqnLc+TLFA@mail.gmail.com>
In-Reply-To: <CAMavQKLRm8uYu3O=co5Ui7YjkK0hKHAd=+TA0oExfqnLc+TLFA@mail.gmail.com>
From: Erico Nunes <nunes.erico@gmail.com>
Date: Tue, 11 Jun 2019 14:05:55 +0200
Message-ID: <CAK4VdL0jph-LzkRai=6nLahgrvG0cFNt5N3GNGjKAE-G0jc38A@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge/synopsys: dw-hdmi: Fix unwedge crash when no
 pinctrl entries
To: Sean Paul <sean@poorly.run>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=lZXirDOut9vTqPwIy2+NlkcxYvoX0FlWKfU61yeOlXc=;
 b=YnbqCKr3jMbW1jUhQ7uQsXIvK/YeDj1P1hgI7tJ+yc2M760ar+rV2fnGcMxMFQx1wT
 FiO54DDsoHx/hhRaCgxZ2iqXcQKCL8fvsP8wrc4ZlWO47rqYOxJV6vilfqgBx9UaGc19
 dusFW2VjVyYmmklpJOfiOsnPGkzLf8G4gxxQDFLdU2qryMV3Dp23bEQWkd06axjVSiXG
 ducOaewG12zHLktAQRNFRqdfSdzNduv62pfY/+nKDqAcU+Ks3v/7V+8z3F6IOcsKN0Kl
 +u7KB2SOYLU957Xzo3/dkqbsKM9+yCMXUHiGWah/opMPIJTsTSPnF4iDDTXkDov3Ulvu
 u+9w==
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
Cc: David Airlie <airlied@linux.ie>, Jonas Karlman <jonas@kwiboo.se>,
 Douglas Anderson <dianders@chromium.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, Neil Armstrong <narmstrong@baylibre.com>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Sean Paul <seanpaul@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Thomas Gleixner <tglx@linutronix.de>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKdW4gMTAsIDIwMTkgYXQgMTA6NTEgUE0gU2VhbiBQYXVsIDxzZWFuQHBvb3JseS5y
dW4+IHdyb3RlOgo+Cj4gT24gTW9uLCBKdW4gMTAsIDIwMTkgYXQgMTo1MiBQTSBEb3VnbGFzIEFu
ZGVyc29uIDxkaWFuZGVyc0BjaHJvbWl1bS5vcmc+IHdyb3RlOgo+ID4KPiA+IEluIGNvbW1pdCA1
MGY5NDk1ZWZlMzAgKCJkcm0vYnJpZGdlL3N5bm9wc3lzOiBkdy1oZG1pOiBBZGQgInVud2VkZ2Ui
Cj4gPiBmb3IgZGRjIGJ1cyIpIEkgc3R1cGlkbHkgdXNlZCBJU19FUlIoKSB0byBjaGVjayBmb3Ig
d2hldGhlciB3ZSBoYXZlIGFuCj4gPiAidW53ZWRnZSIgcGluY3RybCBzdGF0ZSBldmVuIHRob3Vn
aCBvbiBtb3N0IGZsb3dzIHRocm91Z2ggdGhlIGRyaXZlcgo+ID4gdGhlIHVud2VkZ2Ugc3RhdGUg
d2lsbCBqdXN0IGJlIE5VTEwuCj4gPgo+ID4gRml4IGl0IHNvIHRoYXQgd2UgY29uc2lzdGVudGx5
IHVzZSBOVUxMIGZvciBubyB1bndlZGdlIHN0YXRlLgo+ID4KPiA+IEZpeGVzOiA1MGY5NDk1ZWZl
MzAgKCJkcm0vYnJpZGdlL3N5bm9wc3lzOiBkdy1oZG1pOiBBZGQgInVud2VkZ2UiIGZvciBkZGMg
YnVzIikKPiA+IFJlcG9ydGVkLWJ5OiBFcmljbyBOdW5lcyA8bnVuZXMuZXJpY29AZ21haWwuY29t
Pgo+ID4gU2lnbmVkLW9mZi1ieTogRG91Z2xhcyBBbmRlcnNvbiA8ZGlhbmRlcnNAY2hyb21pdW0u
b3JnPgo+Cj4gVGhhbmtzIEVyaWNvIGZvciB0aGUgcmVwb3J0LCBhbmQgRG91ZyBmb3IgZml4aW5n
IHRoaXMgdXAgcXVpY2tseSwgSSd2ZSBhcHBsaWVkCj4gdGhlIHBhdGNoIHRvIGRybS1taXNjLW5l
eHQKCkl0IGRvZXMgZml4IHRoZSBpc3N1ZS4gVGhhbmsgeW91IGZvciB0aGUgcXVpY2sgZml4LgoK
RXJpY28KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
