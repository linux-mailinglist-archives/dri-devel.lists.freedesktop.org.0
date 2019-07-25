Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24ED575219
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2019 17:06:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9B996E65E;
	Thu, 25 Jul 2019 15:06:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 146486E65E
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2019 15:06:44 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id a15so45325051wmj.5
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2019 08:06:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=9VtQKkWfK+zYdSn/FuhvWkGyTUaVAJL5pFGjK3Jszyw=;
 b=eLCnUguibNoO2AlHQKyGg0Y9TuGq1AUvYEBtbwHe3PmG+tVveephqBzdtjkSD8217Y
 J5PF8Ymq84Q9mWY97GAYOQ+lQ+xIF5FQN16cL8/ylhdwIriyyX5a0l/1g7gbvHgeoxiC
 0iiJP4kAHT6ttxjMlf+FDNTtKhRYliyYKt+d/wuEPOQgwnZUUUGP87Lq2LZwd/stbqBh
 mT2SarZ4ny0/AzEhv6SPFK7R7LicAlqwmQ+mCeXAJ0KaizwtgEnYtovqyQs782hv7ilk
 2KQe7OELWsr7PQGj2TTHDaxvhUi6IxJ7lk4VdAJX2u/g4PAfqq6Ei/sKXzn71e4H058/
 o4Hg==
X-Gm-Message-State: APjAAAWhqsowE521wV4d7D2AHETGQqnDK7lIKbQkh4jCbhFOpdEiQK49
 vYlUhe47PV74ch0Mcagjs4oBQg==
X-Google-Smtp-Source: APXvYqy7PYsDNSGGPztWvKILWoiMBkdSFcP1jE+VamLix3I9wR/Ic/qiQW/YzmKquGc9thA8U8t8FQ==
X-Received: by 2002:a7b:c7cb:: with SMTP id z11mr73281045wmk.24.1564067202435; 
 Thu, 25 Jul 2019 08:06:42 -0700 (PDT)
Received: from dell ([2.27.35.164])
 by smtp.gmail.com with ESMTPSA id f204sm73012839wme.18.2019.07.25.08.06.34
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 25 Jul 2019 08:06:41 -0700 (PDT)
Date: Thu, 25 Jul 2019 16:06:29 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v1 1/1] backlight: drop EARLY_EVENT_BLANK support
Message-ID: <20190725150629.GN23883@dell>
References: <20190725143224.GB31803@ravnborg.org>
 <20190725143934.GH15868@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190725143934.GH15868@phenom.ffwll.local>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=9VtQKkWfK+zYdSn/FuhvWkGyTUaVAJL5pFGjK3Jszyw=;
 b=NCfJmCd8P2t6v8IcsdtfxPzIXC8X1tdp4ymjAkfOUgseY6CuTV1UTCF6xEdaRLcCOP
 NzkX8U1rKRSvE5SxGe0uRSyuXSwDWi2BF9d13lHzCMxf4z/8aayrsozzCFTFlIdPZiIc
 9TP1m1z7SjSPpyBtWGLIfCZFuTBS2OfEZ+X7k2U5v/oR1Zvpq82pnlbP6LTt4Q1FATxC
 BgiCKNt4MIl6bOu7crachvPy0FyU86WagPmpZnJKyaahjcuGD2U5DE6ICe8QXjYgHFPP
 qxiiq+fzaA/H2Vgs1/BUC00xLaDTnh9n1wDhlZEsRMQLdETgn+aoSevPHwepmEsrPB1H
 z4PQ==
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
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
 Gerd Hoffmann <kraxel@redhat.com>, Jingoo Han <jingoohan1@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, Peter Rosin <peda@axentia.se>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAyNSBKdWwgMjAxOSwgRGFuaWVsIFZldHRlciB3cm90ZToKCj4gT24gVGh1LCBKdWwg
MjUsIDIwMTkgYXQgMDQ6MzI6MjRQTSArMDIwMCwgU2FtIFJhdm5ib3JnIHdyb3RlOgo+ID4gVGhl
cmUgd2FzIG5vIHVzZXJzIGxlZnQgLSBzbyBkcm9wIHRoZSBjb2RlIHRvIHN1cHBvcnQgRUFSTFlf
RkJfQkxBTksuCj4gPiBUaGlzIHBhdGNoIHJlbW92ZXMgdGhlIHN1cHBvcnQgaW4gYmFja2xpZ2h0
LAo+ID4gYW5kIGRyb3AgdGhlIG5vdGlmaWVyIGluIGZibWVtLgo+ID4gCj4gPiBUaGF0IEVBUkxZ
X0ZCX0JMQU5LIGlzIG5vdCB1c2VkIGNhbiBiZSB2ZXJpZmllZCB0aGF0IG5vIGRyaXZlciBzZXQg
YW55IG9mOgo+ID4gCj4gPiAgICAgbGNkX29wcy5lYXJseV9zZXRfcG93ZXIoKQo+ID4gICAgIGxj
ZF9vcHMucl9lYXJseV9zZXRfcG93ZXIoKQo+ID4gCj4gPiBOb3RpY2VkIHdoaWxlIGJyb3dzaW5n
IGJhY2tsaWdodCBjb2RlIGZvciBvdGhlciByZWFzb25zLgo+IAo+IEFoIEkgZGlkbid0IGdyZXAg
aGFyZCBlbm91Z2gsIEkgZGlkbid0IHJlYWxpemUgdGhhdCBubyBvbmUgc2V0cyB0aGUKPiBsY2Rf
b3BzLT4ocl8pZWFybHlfc2V0X3Bvd2VyIGhvb2tzLiBOaWNlIGZpbmQhCj4gCj4gUmV2aWV3ZWQt
Ynk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+Cj4gCj4gPiBTaWduZWQt
b2ZmLWJ5OiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+Cj4gPiBDYzogTGVlIEpvbmVz
IDxsZWUuam9uZXNAbGluYXJvLm9yZz4KPiA+IENjOiBEYW5pZWwgVGhvbXBzb24gPGRhbmllbC50
aG9tcHNvbkBsaW5hcm8ub3JnPgo+ID4gQ2M6IEppbmdvbyBIYW4gPGppbmdvb2hhbjFAZ21haWwu
Y29tPgo+ID4gQ2M6IEJhcnRsb21pZWogWm9sbmllcmtpZXdpY3ogPGIuem9sbmllcmtpZUBzYW1z
dW5nLmNvbT4KPiA+IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgo+
ID4gQ2M6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KPiA+IENjOiBNYWFydGVuIExh
bmtob3JzdCA8bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPgo+ID4gQ2M6ICJNaWNo
YcWCIE1pcm9zxYJhdyIgPG1pcnEtbGludXhAcmVyZS5xbXFtLnBsPgo+ID4gQ2M6IFBldGVyIFJv
c2luIDxwZWRhQGF4ZW50aWEuc2U+Cj4gPiBDYzogR2VyZCBIb2ZmbWFubiA8a3JheGVsQHJlZGhh
dC5jb20+Cj4gPiBDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+ID4gQ2M6IGxp
bnV4LWZiZGV2QHZnZXIua2VybmVsLm9yZwo+ID4gLS0tCj4gPiAKPiA+IEJ1aWxkIHRlc3RlZCB3
aXRoIHZhcmlvdXMgYXJjaGl0ZWN0dXJlcywgY29uZmlncy4KPiA+IAo+ID4gTGVlLCBEYW5pZWwg
LSBPSyB0byBjb21taXQgdG8gZHJtLW1pc2MtbmV4dCB3aGVyZSBmYmRldiBzdHVmZiBpcwo+ID4g
bWFpbnRhaW5lZCB0b2RheT8KPiAKPiBiYWNrbGlnaHQgaXMgc2VwYXJhdGUgZnJvbSBmYmRldiBp
biBMZWUncyBvd24gdHJlZSwgbm90IGluIGRybS1taXNjLiBJCj4gdGhpbmsgYXQgbGVhc3QuCgpU
aGF0J3MgY29ycmVjdC4gIFdlJ2xsIHNvcnQgdGhhdCBvbmNlIHdlIGhhdmUgYWxsIHRoZSBBY2tz
LgoKPiA+ICBkcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9sY2QuYyAgICB8ICA4IC0tLS0tLS0tCj4g
PiAgZHJpdmVycy92aWRlby9mYmRldi9jb3JlL2ZibWVtLmMgfCAxMiArLS0tLS0tLS0tLS0KPiA+
ICBpbmNsdWRlL2xpbnV4L2ZiLmggICAgICAgICAgICAgICB8ICA0IC0tLS0KPiA+ICBpbmNsdWRl
L2xpbnV4L2xjZC5oICAgICAgICAgICAgICB8IDEwIC0tLS0tLS0tLS0KPiA+ICA0IGZpbGVzIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAzMyBkZWxldGlvbnMoLSkKCi0tIApMZWUgSm9uZXMgW+ad
jueQvOaWr10KTGluYXJvIFNlcnZpY2VzIFRlY2huaWNhbCBMZWFkCkxpbmFyby5vcmcg4pSCIE9w
ZW4gc291cmNlIHNvZnR3YXJlIGZvciBBUk0gU29DcwpGb2xsb3cgTGluYXJvOiBGYWNlYm9vayB8
IFR3aXR0ZXIgfCBCbG9nCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
