Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D7B2DAB70
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2019 13:47:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23FE16EA5B;
	Thu, 17 Oct 2019 11:47:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A09BA6EA5B
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2019 11:47:31 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id p7so2222993wmp.4
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2019 04:47:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=9EgRoWT1S/esycl2KztK0v8EdhOHABE+DCs/Zs7xJ2g=;
 b=gHaGikKH7zqEOIi8RBoinb8ZOghezHa1ezj7oEhRiIzhsnnsYwsW53WpPX0JiLyiPM
 zq6EEt86INBNpP1DNAFzTtYDO3nHSc7HtzQ/O0f4ePviegwTX6jXwDcxMOrNLnbF3nOY
 XQdQ0pFtQybLzrqWy1d+dsvLuErA+DcvBzbxvIZacJXJGzE85PlTd3e+pIbA9fbEGwK2
 asymfvmzKcHiN18yCM13MqnVBkT6TqCmx46XMobRfvtMIbqFInZwtv7MyeaY98uhyMfD
 mSFyDTnR6GibYa8T0D+CplVWBDZVNh7uYW3MKTaHiv3r8n3TGlM/scCukFbDgsFfFe3N
 QEbg==
X-Gm-Message-State: APjAAAWp5Sx/8sQjywckMXVkrLWhacg51JeSn29MgkaDIzXzBEPcZrmr
 FDtc7H0VSrzNb79SeCoOAZaJ6Q==
X-Google-Smtp-Source: APXvYqzhSWmeuMPlHQbLiJ024kOkuwLOq4wR8LHDKVRH96iLuA31ZMAoJouWa9QvRJfI5cC0Eh+JAA==
X-Received: by 2002:a1c:a8c7:: with SMTP id r190mr2320221wme.148.1571312850183; 
 Thu, 17 Oct 2019 04:47:30 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id z189sm2554703wmc.25.2019.10.17.04.47.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Oct 2019 04:47:29 -0700 (PDT)
Date: Thu, 17 Oct 2019 12:47:27 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH] backlight: pwm_bl: configure pwm only once per backlight
 toggle
Message-ID: <20191017114727.fy5tg2kgi6mr2sei@holly.lan>
References: <20191017081059.31761-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191017081059.31761-1-u.kleine-koenig@pengutronix.de>
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=9EgRoWT1S/esycl2KztK0v8EdhOHABE+DCs/Zs7xJ2g=;
 b=yk8pv0ZohxDRImGSseeQ94X4SFOB1f3whjH3gE0/kgd3BhXkwMfQuiFzfbo8kV7hWL
 WTWM5jOHJQqpVMIQwPB2qoXZmWLkGSYH+S7jw4dL81rSOAtR8ODMKEa03GnNzonNBqpi
 sqEgotnNJCGaaZli7QevDDrC0zvNJl48PllosPtH5bRKowTt0nfgPFT/dNYS/2PY+Bvu
 si1brAfp1c2sqxZ9sWW55jeccgEsLJTjQXkzdK+FUUgm/Ic48qG2BKOAr7kFARZL0lng
 O01Bak48rOIOgUgIOSFMUG0kZndFotRdFxYs+W1sGMpY1MAkI5HRrYvnEiSIvgyLfO6X
 0Fog==
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
Cc: linux-pwm@vger.kernel.org, linux-fbdev@vger.kernel.org,
 Adam Ford <aford173@gmail.com>, dri-devel@lists.freedesktop.org,
 Thierry Reding <thierry.reding@gmail.com>, kernel@pengutronix.de,
 Jingoo Han <jingoohan1@gmail.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBPY3QgMTcsIDIwMTkgYXQgMTA6MTA6NTlBTSArMDIwMCwgVXdlIEtsZWluZS1Lw7Zu
aWcgd3JvdGU6Cj4gQSBwcmV2aW91cyBjaGFuZ2UgaW4gdGhlIHB3bSBjb3JlIChuYW1lbHkgMDFj
Y2Y5MDNlZGQ2ICgicHdtOiBMZXQKPiBwd21fZ2V0X3N0YXRlKCkgcmV0dXJuIHRoZSBsYXN0IGlt
cGxlbWVudGVkIHN0YXRlIikpIGNoYW5nZWQgdGhlCj4gc2VtYW50aWMgb2YgcHdtX2dldF9zdGF0
ZSgpIGFuZCBkaXNjbG9zZWQgYW4gKGFzIGl0IHNlZW1zKSBjb21tb24KPiBwcm9ibGVtIGluIGxv
d2xldmVsIFBXTSBkcml2ZXJzLiBCeSBub3QgcmVseWluZyBvbiB0aGUgcGVyaW9kIGFuZCBkdXR5
Cj4gY3ljbGUgYmVpbmcgcmV0cmlldmFibGUgZnJvbSBhIGRpc2FibGVkIFBXTSB0aGlzIHR5cGUg
b2YgcHJvYmxlbSBpcwo+IHdvcmtlZCBhcm91bmQuCj4gCj4gQXBhcnQgZnJvbSB0aGlzIGlzc3Vl
IG9ubHkgY2FsbGluZyB0aGUgcHdtX2dldF9zdGF0ZS9wd21fYXBwbHlfc3RhdGUKPiBjb21ibyBv
bmNlIGlzIGFsc28gbW9yZSBlZmZlY3RpdmUuCgpJJ20gb25seSBpbnRlcmVzdGVkIGluIHRoZSBz
ZWNvbmQgcGFyYWdyYXBoIGhlcmUuCgpUaGVyZSBzZWVtcyB0byBiZSBhIHJlYXNvbmFibGUgY29u
c2Vuc3VzIHRoYXQgdGhlIGkuTVgyNyBhbmQgY3Jvcy1lYwpQV00gZHJpdmVycyBzaG91bGQgYmUg
Zml4ZWQgZm9yIHRoZSBiZW5lZml0IG9mIG90aGVyIFBXTSBjbGllbnRzLgpTbyB3ZSBtYWtlIHRo
aXMgY2hhbmdlIGJlY2F1c2UgaXQgbWFrZXMgdGhlIHB3bS1ibCBiZXR0ZXIuLi4gbm90IHRvCndv
cmsgYXJvdW5kIGJ1Z3MgOy0pLgoKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92aWRlby9iYWNrbGln
aHQvcHdtX2JsLmMgYi9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9wd21fYmwuYwo+IGluZGV4IDc0
NmVlYmM0MTFkZi4uZGRlYmQ2MmIzOTc4IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvdmlkZW8vYmFj
a2xpZ2h0L3B3bV9ibC5jCj4gKysrIGIvZHJpdmVycy92aWRlby9iYWNrbGlnaHQvcHdtX2JsLmMK
PiBAQCAtNjcsNDAgKzYyLDI3IEBAIHN0YXRpYyB2b2lkIHB3bV9iYWNrbGlnaHRfcG93ZXJfb24o
c3RydWN0IHB3bV9ibF9kYXRhICpwYikKPiAgCj4gIHN0YXRpYyB2b2lkIHB3bV9iYWNrbGlnaHRf
cG93ZXJfb2ZmKHN0cnVjdCBwd21fYmxfZGF0YSAqcGIpCj4gIHsKPiAtCXN0cnVjdCBwd21fc3Rh
dGUgc3RhdGU7Cj4gLQo+IC0JcHdtX2dldF9zdGF0ZShwYi0+cHdtLCAmc3RhdGUpOwo+IC0JaWYg
KCFwYi0+ZW5hYmxlZCkKPiAtCQlyZXR1cm47Cj4gLQoKV2h5IHJlbW92ZSB0aGUgcGItPmVuYWJs
ZWQgY2hlY2s/IEkgdGhvdWdodCB0aGF0IHdhcyB0aGVyZSB0byBlbnN1cmUgd2UKZG9uJ3QgbWVz
cyB1cCB0aGUgcmVndWxhciByZWZlcmVuY2UgY291bnRzLgoKCkRhbmllbC4KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
