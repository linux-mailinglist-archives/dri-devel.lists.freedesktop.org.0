Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 29B788DBB9
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2019 19:27:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FAEB6E79B;
	Wed, 14 Aug 2019 17:27:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 748806E79B
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2019 17:27:31 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id f22so7741152edt.4
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2019 10:27:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=+2YJRbop7obhJvx6M/oXULPH/J+nom3HFlj8fZHLgck=;
 b=i2jbwJzYOoFvaLf6ix9j3Ph20JjwvsBhrJxZrQnPSuyaOYpqzeD+Z4ySqT1VzDwD5K
 7ek7Bqin7c4yCECnHw6vw0bAkUrmCVqQdcX1JrBccgf2uR9zGkmqjepqkwh9jM3sZtCs
 mcSyAp/swN+a1ptO+TNY1IztXbj9Zn66a1yk25rLaGsShC6Z7M21IjYWM30FIZ3HZY8Q
 60hsN7QlDZaqgqRa1l2iTzvFygMpKZHMVOWJsgQjLjX6DOvD0f35yxF/4cFcstJvMa9A
 mYEqtkRF+6VbTXSSTMeYn4PXrLkgXeH/r0OaOkSekO6YED1/7NcLrSzJcTBG4SIyL1eE
 NKeg==
X-Gm-Message-State: APjAAAXZ9GIgPHc7ijUBIeRvHmZBrUoEpqZe3ojUgdUVOfVLlUXWVLy7
 rYYl4x0znD16wiheD5Av7T/rzA==
X-Google-Smtp-Source: APXvYqxDenh8FqJ/E7jAQeR7LkcaMiSGhd2axDUeDfcgpFNQ91SfeEo1ZCMhZXrO8haciNGMe7XFWQ==
X-Received: by 2002:a50:ed94:: with SMTP id h20mr814730edr.59.1565803650087;
 Wed, 14 Aug 2019 10:27:30 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id f6sm72806edk.79.2019.08.14.10.27.29
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 14 Aug 2019 10:27:29 -0700 (PDT)
Date: Wed, 14 Aug 2019 19:27:27 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Nishka Dasgupta <nishkadg.linux@gmail.com>
Subject: Re: [PATCH] drm/aspeed: gfc_crtc: Make structure aspeed_gfx_funcs
 constant
Message-ID: <20190814172727.GQ7444@phenom.ffwll.local>
References: <20190813063355.25549-1-nishkadg.linux@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190813063355.25549-1-nishkadg.linux@gmail.com>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=+2YJRbop7obhJvx6M/oXULPH/J+nom3HFlj8fZHLgck=;
 b=S4LZ0ZhIFTLmy+dmmZbaLaOg0YS4AVm25WTeqTC5q04TLFmuKXix6ea6GroX69AccQ
 TVsyDYKimeexBM+zMbTI7uThBz1wKxoZ2LA/DsPjtLnCxTpInBlf253wnioU/rbc30kx
 lxmEzhEsWTICGjuh7wAQdG5twlk69J1nGF1g0=
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
Cc: linux-aspeed@lists.ozlabs.org, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, andrew@aj.id.au, joel@jms.id.au,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBBdWcgMTMsIDIwMTkgYXQgMTI6MDM6NTVQTSArMDUzMCwgTmlzaGthIERhc2d1cHRh
IHdyb3RlOgo+IFRoZSBzdGF0aWMgc3RydWN0dXJlIGFzcGVlZF9nZnhfZnVuY3MsIG9mIHR5cGUK
PiBkcm1fc2ltcGxlX2Rpc3BsYXlfcGlwZV9mdW5jcywgaXMgdXNlZCBvbmx5IGFzIGFuIGFyZ3Vt
ZW50IHRvCj4gZHJtX3NpbXBsZV9kaXNwbGF5X3BpcGVfaW5pdCgpLCB3aGljaCBkb2VzIG5vdCBt
b2RpZnkgaXQuIEhlbmNlIG1ha2UgaXQKPiBjb25zdGFudCB0byBwcm90ZWN0IGl0IGZyb20gdW5p
bnRlbmRlZCBtb2RpZmljYXRpb24uCj4gSXNzdWUgZm91bmQgd2l0aCBDb2NjaW5lbGxlLgo+IAo+
IFNpZ25lZC1vZmYtYnk6IE5pc2hrYSBEYXNndXB0YSA8bmlzaGthZGcubGludXhAZ21haWwuY29t
PgoKQXBwbGllZCwgdGhhbmtzIGZvciB5b3VyIHBhdGNoLgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9k
cm0vYXNwZWVkL2FzcGVlZF9nZnhfY3J0Yy5jIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2FzcGVlZC9hc3BlZWRfZ2Z4X2NydGMuYyBiL2RyaXZlcnMvZ3B1L2RybS9hc3BlZWQvYXNw
ZWVkX2dmeF9jcnRjLmMKPiBpbmRleCAxNWRiOWU0MjZlYzQuLjIxODRiOGJlNmZkNCAxMDA2NDQK
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXNwZWVkL2FzcGVlZF9nZnhfY3J0Yy5jCj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2FzcGVlZC9hc3BlZWRfZ2Z4X2NydGMuYwo+IEBAIC0yMTUsNyArMjE1
LDcgQEAgc3RhdGljIHZvaWQgYXNwZWVkX2dmeF9kaXNhYmxlX3ZibGFuayhzdHJ1Y3QgZHJtX3Np
bXBsZV9kaXNwbGF5X3BpcGUgKnBpcGUpCj4gIAl3cml0ZWwocmVnIHwgQ1JUX0NUUkxfVkVSVElD
QUxfSU5UUl9TVFMsIHByaXYtPmJhc2UgKyBDUlRfQ1RSTDEpOwo+ICB9Cj4gIAo+IC1zdGF0aWMg
c3RydWN0IGRybV9zaW1wbGVfZGlzcGxheV9waXBlX2Z1bmNzIGFzcGVlZF9nZnhfZnVuY3MgPSB7
Cj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX3NpbXBsZV9kaXNwbGF5X3BpcGVfZnVuY3MgYXNw
ZWVkX2dmeF9mdW5jcyA9IHsKPiAgCS5lbmFibGUJCT0gYXNwZWVkX2dmeF9waXBlX2VuYWJsZSwK
PiAgCS5kaXNhYmxlCT0gYXNwZWVkX2dmeF9waXBlX2Rpc2FibGUsCj4gIAkudXBkYXRlCQk9IGFz
cGVlZF9nZnhfcGlwZV91cGRhdGUsCj4gLS0gCj4gMi4xOS4xCj4gCgotLSAKRGFuaWVsIFZldHRl
cgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KaHR0cDovL2Jsb2cuZmZ3bGwu
Y2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
