Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 832AC10953C
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2019 22:44:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B08089DBA;
	Mon, 25 Nov 2019 21:44:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5483889DD8
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2019 21:44:48 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id i12so19962416wrn.11
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2019 13:44:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=n+v5U8atuAjADWA+1AVFkDmw+F2L0+AE0oofBhxVG6M=;
 b=JgDddENVzZlbLMrayM7jdjA+E54E6qgl6iz0sdJDzuZVUGXns7fgDAQeGwF2lnvNMC
 0gokNbY4+1MGKsuz3gU1z/oOFwG0muqQ/2qta9KzmrWyGnb8CBYyOgHX7MV61LK9s9QK
 BPch+EqY2+Eb5mttcj2/gDIt/7iLu1xOK8w1D+52soUnnE3fcBCDpNQzNHEfW2Ssozwd
 YmDP4WWNgaXiTbjWPc/1oFJN8U2idqO3M+w9UXU56vqWVxH1Klri5NeYCzgkF0Gd/q9n
 L6A5EKF51w7q9vEq9GkY7kuYHwOg4TSm6Dk8mogIrBHWuNosD+umVz2GpZ8HX0ok9Nxc
 FUYw==
X-Gm-Message-State: APjAAAUTbB7bkDt4B1w413tcf2c1OxSitYWvtr5KiM/SA3ZTJmnZxQZK
 UBE5EONYmnNh9H3D6LNs6WBJI8fPPEk=
X-Google-Smtp-Source: APXvYqypNDqoWMrV+BK6rLaVUuofYV7iwu5AWWNZ/19S6v91/X7af1NCQyXJHpxaVWCovF/VKDSxMg==
X-Received: by 2002:adf:d1a3:: with SMTP id w3mr2077943wrc.9.1574718286617;
 Mon, 25 Nov 2019 13:44:46 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id p9sm12130745wrs.55.2019.11.25.13.44.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Nov 2019 13:44:45 -0800 (PST)
Date: Mon, 25 Nov 2019 22:44:43 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 05/15] drm/armada: Delete dma_buf->k(un)map implemenation
Message-ID: <20191125214443.GN29965@phenom.ffwll.local>
References: <20191118103536.17675-1-daniel.vetter@ffwll.ch>
 <20191118103536.17675-6-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191118103536.17675-6-daniel.vetter@ffwll.ch>
X-Operating-System: Linux phenom 5.3.0-2-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=n+v5U8atuAjADWA+1AVFkDmw+F2L0+AE0oofBhxVG6M=;
 b=VPk++KmdYXBI8Y9J2NjXqXsOD7AS3bl34UeWCQeK7WfJkvjuVONsaa3c6wcTJ7f+3L
 DGq+mmSBVJUz+6qEFlv+EOZS2eXYSWz/XQOH+81TnQuGlqdObUchVTO6bNnzcVZZK4AF
 oaJrTXbTqpZpixgUExwDeSvd/dlAKg7Oy3ok0=
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Russell King <linux@armlinux.org.uk>, Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBOb3YgMTgsIDIwMTkgYXQgMTE6MzU6MjZBTSArMDEwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBJdCdzIGEgZHVtbXkgYW55d2F5Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IERhbmllbCBW
ZXR0ZXIgPGRhbmllbC52ZXR0ZXJAaW50ZWwuY29tPgo+IENjOiBSdXNzZWxsIEtpbmcgPGxpbnV4
QGFybWxpbnV4Lm9yZy51az4KCkkgbWVyZ2VkIHRoZSBlbnRpcmUgc2VyaWVzIGV4Y2VwdCB0aGlz
IG9uZSBhbmQgdGhlIGZpbmFsIHBhdGNoLCBzaWxsCndhaXRpbmcgYSBiaXQgbW9yZSBmb3IgYW4g
YWNrIG9uIHRoaXMgcGVyaGFwcy4KLURhbmllbAoKPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2Fy
bWFkYS9hcm1hZGFfZ2VtLmMgfCAxMiAtLS0tLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDEy
IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJtYWRhL2Fy
bWFkYV9nZW0uYyBiL2RyaXZlcnMvZ3B1L2RybS9hcm1hZGEvYXJtYWRhX2dlbS5jCj4gaW5kZXgg
OTNjZjhiOGJmY2ZmLi45NzY2ODVmMjkzOWUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2FybWFkYS9hcm1hZGFfZ2VtLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYXJtYWRhL2FybWFk
YV9nZW0uYwo+IEBAIC00NjEsMTYgKzQ2MSw2IEBAIHN0YXRpYyB2b2lkIGFybWFkYV9nZW1fcHJp
bWVfdW5tYXBfZG1hX2J1ZihzdHJ1Y3QgZG1hX2J1Zl9hdHRhY2htZW50ICphdHRhY2gsCj4gIAlr
ZnJlZShzZ3QpOwo+ICB9Cj4gIAo+IC1zdGF0aWMgdm9pZCAqYXJtYWRhX2dlbV9kbWFidWZfbm9f
a21hcChzdHJ1Y3QgZG1hX2J1ZiAqYnVmLCB1bnNpZ25lZCBsb25nIG4pCj4gLXsKPiAtCXJldHVy
biBOVUxMOwo+IC19Cj4gLQo+IC1zdGF0aWMgdm9pZAo+IC1hcm1hZGFfZ2VtX2RtYWJ1Zl9ub19r
dW5tYXAoc3RydWN0IGRtYV9idWYgKmJ1ZiwgdW5zaWduZWQgbG9uZyBuLCB2b2lkICphZGRyKQo+
IC17Cj4gLX0KPiAtCj4gIHN0YXRpYyBpbnQKPiAgYXJtYWRhX2dlbV9kbWFidWZfbW1hcChzdHJ1
Y3QgZG1hX2J1ZiAqYnVmLCBzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSkKPiAgewo+IEBAIC00
ODEsOCArNDcxLDYgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBkbWFfYnVmX29wcyBhcm1hZGFfZ2Vt
X3ByaW1lX2RtYWJ1Zl9vcHMgPSB7Cj4gIAkubWFwX2RtYV9idWYJPSBhcm1hZGFfZ2VtX3ByaW1l
X21hcF9kbWFfYnVmLAo+ICAJLnVubWFwX2RtYV9idWYJPSBhcm1hZGFfZ2VtX3ByaW1lX3VubWFw
X2RtYV9idWYsCj4gIAkucmVsZWFzZQk9IGRybV9nZW1fZG1hYnVmX3JlbGVhc2UsCj4gLQkubWFw
CQk9IGFybWFkYV9nZW1fZG1hYnVmX25vX2ttYXAsCj4gLQkudW5tYXAJCT0gYXJtYWRhX2dlbV9k
bWFidWZfbm9fa3VubWFwLAo+ICAJLm1tYXAJCT0gYXJtYWRhX2dlbV9kbWFidWZfbW1hcCwKPiAg
fTsKPiAgCj4gLS0gCj4gMi4yNC4wCj4gCgotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdp
bmVlciwgSW50ZWwgQ29ycG9yYXRpb24KaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
