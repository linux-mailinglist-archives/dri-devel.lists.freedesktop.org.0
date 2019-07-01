Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2D5A5B935
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jul 2019 12:44:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E54989B45;
	Mon,  1 Jul 2019 10:44:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x943.google.com (mail-ua1-x943.google.com
 [IPv6:2607:f8b0:4864:20::943])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CDE289B45
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jul 2019 10:44:44 +0000 (UTC)
Received: by mail-ua1-x943.google.com with SMTP id j2so4871446uaq.5
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Jul 2019 03:44:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=WX6fYo0tjWEm+jIPcDuoExJOMzPpIHhPxoDwzmrfsBs=;
 b=ZbirytyBcaYREVweSGqbtMiVyP0j8Be+guEss3m5aG+SdhJLjyaM4B0CwsL3U0/n6n
 KrLczJnd/EgbaIY9JOwN2y/rEYTA1lWH8Us2EA2oVqxwn6Rh325wMqqt/hlCO6TjVbsG
 4H3Yujy4ILONN3yGnVOyco/eQLMnBK7gPIVqhrtkXIaVK5AXaqNxGrfojdlO8q0Yr0QN
 qHv/2qoRJUFD46nFDPMh7XjJYzqZgeWHEu95PtC6RL5rGtQCQCmH7yXk8xMR2ErVP845
 AEsbkH9VlK51hLAARxfRb6d2l0BwyvqEiJVOP0qUrBYt6Z6Pl0ZrDrPwSaGOlG7WLUNH
 htEg==
X-Gm-Message-State: APjAAAVUgFlJoyxLnQjhSS1wSu6LfOfoB9a4dANZ6jJCbJOpZl1GyTDD
 uaW4GMM6ZkaEl624Clj9/m7RETsMw+oHrZakMMw=
X-Google-Smtp-Source: APXvYqwp5Kwdsh6LIklwJg8PY5OOUniDnMV2v/nDpVblYLk+Jq5Z1lo/3nWvNownCq7qyz/dT2umZ7nOlhpuD/HoJB8=
X-Received: by 2002:ab0:5973:: with SMTP id o48mr4773151uad.19.1561977883403; 
 Mon, 01 Jul 2019 03:44:43 -0700 (PDT)
MIME-Version: 1.0
References: <20190630061922.7254-1-sam@ravnborg.org>
 <20190630061922.7254-34-sam@ravnborg.org>
In-Reply-To: <20190630061922.7254-34-sam@ravnborg.org>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Mon, 1 Jul 2019 11:44:57 +0100
Message-ID: <CACvgo51hO+i6LryjeQhEivq3ta0Vnd=ZxFrrW0Gn8vVQebSybw@mail.gmail.com>
Subject: Re: [PATCH v1 33/33] drm/hisilicon: drop use of drmP.h
To: Sam Ravnborg <sam@ravnborg.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=WX6fYo0tjWEm+jIPcDuoExJOMzPpIHhPxoDwzmrfsBs=;
 b=XqKXocgWSBa9OQSTAzEh8jxzU0yalIz8v864yBG1siz1Oa37LbLAdcAel/hBxuAcR5
 /xOxrOZS6pGu+g+IImCYQZQjQAkspQBuKRhLjlmw4GepZCqs3ZU83N3V1XDGvspWXoOh
 6TrypGnvEhvRqLq17qqUQ7u5lhaeKORW/132X7TDkkLH0PusxnadZxkWP+jZh1x8aRFU
 MB7FpvFYuiEsLYbIy+9+VPgngZbCgXj+Vuz4qHoLouKxfr6oKhuARtupWVkSu8oCTWnn
 CuXvBHxVVnqtI5ujl+gUL6ih3lkOXLY1YF/YWsjs6v/zfzFiTfuo4c7zeGC+tbxK4wV2
 ZqWQ==
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, Hans de Goede <hdegoede@redhat.com>,
 David Airlie <airlied@linux.ie>, Chen Feng <puck.chen@hisilicon.com>,
 John Garry <john.garry@huawei.com>, Souptick Joarder <jrdr.linux@gmail.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Junwei Zhang <Jerry.Zhang@amd.com>, Xinliang Liu <z.liuxinliang@hisilicon.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rongrong Zou <zourongrong@gmail.com>, Alex Deucher <alexander.deucher@amd.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Allison Randal <allison@lohutok.net>,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU3VuLCAzMCBKdW4gMjAxOSBhdCAwNzoyMCwgU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcu
b3JnPiB3cm90ZToKPgo+IERyb3AgdGhlIGRlcHJlY2F0ZWQgZHJtUC5oIGhlYWRlciBmaWxlLgo+
Cj4gTWFkZSB0aGUgaGVhZGVyIGZpbGUgc2VsZmNvbnRhaW5lZCwgYW5kIGRyb3BwZWQgdW51c2Vk
IGhlYWRlciBmaWxlcy4KPiBGaXhlZCBmYWxsb3V0IGluIHJlbWFpbmluZyBmaWxlcy4KPgo+IFNp
Z25lZC1vZmYtYnk6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KPiBDYzogWGlubGlh
bmcgTGl1IDx6LmxpdXhpbmxpYW5nQGhpc2lsaWNvbi5jb20+Cj4gQ2M6IFJvbmdyb25nIFpvdSA8
em91cm9uZ3JvbmdAZ21haWwuY29tPgo+IENjOiBYaW53ZWkgS29uZyA8a29uZy5rb25neGlud2Vp
QGhpc2lsaWNvbi5jb20+Cj4gQ2M6IENoZW4gRmVuZyA8cHVjay5jaGVuQGhpc2lsaWNvbi5jb20+
Cj4gQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KPiBDYzogRGFuaWVsIFZldHRl
ciA8ZGFuaWVsQGZmd2xsLmNoPgo+IENjOiBHZXJkIEhvZmZtYW5uIDxrcmF4ZWxAcmVkaGF0LmNv
bT4KPiBDYzogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+Cj4gQ2M6IFNh
bSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KPiBDYzogQWxsaXNvbiBSYW5kYWwgPGFsbGlz
b25AbG9odXRvay5uZXQ+Cj4gQ2M6IEhhcnJ5IFdlbnRsYW5kIDxoYXJyeS53ZW50bGFuZEBhbWQu
Y29tPgo+IENjOiBUaG9tYXMgR2xlaXhuZXIgPHRnbHhAbGludXRyb25peC5kZT4KPiBDYzogU291
cHRpY2sgSm9hcmRlciA8anJkci5saW51eEBnbWFpbC5jb20+Cj4gQ2M6IEpvaG4gR2FycnkgPGpv
aG4uZ2FycnlAaHVhd2VpLmNvbT4KPiBDYzogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hl
ckBhbWQuY29tPgo+IENjOiAiQ2hyaXN0aWFuIEvDtm5pZyIgPGNocmlzdGlhbi5rb2VuaWdAYW1k
LmNvbT4KPiBDYzogSnVud2VpIFpoYW5nIDxKZXJyeS5aaGFuZ0BhbWQuY29tPgo+IENjOiBHcmVn
IEtyb2FoLUhhcnRtYW4gPGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnPgo+IENjOiBIYW5zIGRl
IEdvZWRlIDxoZGVnb2VkZUByZWRoYXQuY29tPgo+IENjOiBDSyBIdSA8Y2suaHVAbWVkaWF0ZWsu
Y29tPgo+IENjOiBCZW5qYW1pbiBHYWlnbmFyZCA8YmVuamFtaW4uZ2FpZ25hcmRAbGluYXJvLm9y
Zz4KPiBDYzogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQu
Y29tPgo+IENjOiBKYW5pIE5pa3VsYSA8amFuaS5uaWt1bGFAaW50ZWwuY29tPgo+IENjOiBFbWls
IFZlbGlrb3YgPGVtaWwudmVsaWtvdkBjb2xsYWJvcmEuY29tPgo+IENjOiBFcmljIEFuaG9sdCA8
ZXJpY0BhbmhvbHQubmV0Pgo+IENjOiAiTm9yYWxmIFRyw7hubmVzIiA8bm9yYWxmQHRyb25uZXMu
b3JnPgo+IC0tLQo+IFRoZSBsaXN0IG9mIGNjOiB3YXMgdG9vIGxhcmdlIHRvIGFkZCBhbGwgcmVj
aXBpZW50cyB0byB0aGUgY292ZXIgbGV0dGVyLgo+IFBsZWFzZSBmaW5kIGNvdmVyIGxldHRlciBo
ZXJlOgo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL2FyY2hpdmVzL2RyaS1kZXZlbC8y
MDE5LUp1bmUvdGhyZWFkLmh0bWwKPiBTZWFyY2ggZm9yICJkcm06IGRyb3AgdXNlIG9mIGRybXAu
aCBpbiBkcm0tbWlzYyIKPgpTcGVha2luZyBvZiBsb25nIENDIGxpc3QsIG1vc3QgcGF0Y2hlcyBh
cmUgb2sgeWV0IHRoaXMgaGFzIGdvbmUgYSBiaXQgY3JhenkuCkhvdyBkaWQgeW91IG1hbmFnZSB0
byBwdWxsIHN1Y2ggYSBsb25nIGxpc3Q/IFRoZSBnZXRfbWFpbnRhaW5lci5wbApzY3JpcHQgc2hv
d3MgYSB0b3RhbCBvZiAxNyBmb3IgYWxsIG9mIGhpYm1jIGFuZCBraXJpbi4KCkVpdGhlciB3YXks
IHNpbmNlIHlvdSd2ZSBidWlsdC10ZXN0ZWQgdGhlc2UgKGFuZCBjb25mbGljdHMgYXJlIGEKbWF0
dGVyIG9mICNpbmNsdWRlKSBmb3IgdGhlIGxvdDoKQWNrZWQtYnk6IEVtaWwgVmVsaWtvdiA8ZW1p
bC52ZWxpa292QGNvbGxhYm9yYS5jb20+CgotRW1pbApfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
