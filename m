Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 763A11D7B84
	for <lists+dri-devel@lfdr.de>; Mon, 18 May 2020 16:42:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C6846E214;
	Mon, 18 May 2020 14:42:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 521666E214
 for <dri-devel@lists.freedesktop.org>; Mon, 18 May 2020 14:42:25 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id u188so10755015wmu.1
 for <dri-devel@lists.freedesktop.org>; Mon, 18 May 2020 07:42:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=sqbm1kuBp8qAnZYYbL2asSt0x164XkBGqkOlCuOxgEk=;
 b=hJ6eo7yd1j5JjkVFBKAlBVTLIY/Hdg9+5+nZzZAuiZ+Aij5TkbYIGTSmODxocGqXbD
 5v9eTAq8dYX7BHnIr2BZh4+KVEXr86ywt3SWFCFtKuR6CHuznekiVdvuxA/L2/XRe/de
 O1wNf5JWO30BijpFUqCHA+rk11aeJojumQu6I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=sqbm1kuBp8qAnZYYbL2asSt0x164XkBGqkOlCuOxgEk=;
 b=Suijxkm1CGHcs5Smuk8aAHEn7YWp8wzCQ1wq1c5opaE1+rfeBebLV18fehKyxSJUsM
 qX0+/ltpOGI5PLene70Q6QDcVpn7OiJso3ALcOlA11jIydg49tFFggD0W/2eqpNwbGfz
 StS+dNOX9Bsw6HQ5bU5QkY1hlZ63RSy4QhmGm5UoUHSg0bxtW3qKvrz4a05824fJ9Jpf
 KUGHbWpNR3HvVK7FLLfI5rRS8NL/SnBMZDmPfYme7SFTEfkND3Rm+SfKKiRdvNH3eAyn
 IuJ6kgQafBYoh/syNGo4HlOHIrWOSRH0p9/HokWVUDBBKUiaJlZJdYlVnkmoYDPy0Ck7
 DWBA==
X-Gm-Message-State: AOAM533wQcqLNnF9yBv1OVGol+4XLmJocGq4koudcIafIi2qSl813RgW
 dRDfH3B6wu2t6L3NqBFlMDSbZOz6CEE=
X-Google-Smtp-Source: ABdhPJxrFViaghWvZDcabFL5A94ThlCB83h+St99wWF5qwGyuttLYaqp+V0pwhm9fhRJFODgT58b0w==
X-Received: by 2002:a05:600c:2104:: with SMTP id
 u4mr6824768wml.121.1589812943981; 
 Mon, 18 May 2020 07:42:23 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id f5sm16975124wrp.70.2020.05.18.07.42.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 May 2020 07:42:23 -0700 (PDT)
Date: Mon, 18 May 2020 16:42:21 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Chris Wilson <chris@chris-wilson.co.uk>
Subject: Re: [PATCH 1/4] drm: Include internal header for managed function
 declarations
Message-ID: <20200518144221.GO206103@phenom.ffwll.local>
References: <20200516212330.13633-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200516212330.13633-1-chris@chris-wilson.co.uk>
X-Operating-System: Linux phenom 5.6.0-1-amd64 
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU2F0LCBNYXkgMTYsIDIwMjAgYXQgMTA6MjM6MjdQTSArMDEwMCwgQ2hyaXMgV2lsc29uIHdy
b3RlOgo+IGRyaXZlcnMvZ3B1L2RybS9kcm1fbWFuYWdlZC5jOjYxOjY6IHdhcm5pbmc6IHN5bWJv
bCAnZHJtX21hbmFnZWRfcmVsZWFzZScgd2FzIG5vdCBkZWNsYXJlZC4gU2hvdWxkIGl0IGJlIHN0
YXRpYz8KPiAgIENDICAgICAgZHJpdmVycy9ncHUvZHJtL2RybV9tYW5hZ2VkLm8KPiBkcml2ZXJz
L2dwdS9kcm0vZHJtX21hbmFnZWQuYzo2MTo2OiB3YXJuaW5nOiBubyBwcmV2aW91cyBwcm90b3R5
cGUgZm9yIOKAmGRybV9tYW5hZ2VkX3JlbGVhc2XigJkgWy1XbWlzc2luZy1wcm90b3R5cGVzXQo+
ICB2b2lkIGRybV9tYW5hZ2VkX3JlbGVhc2Uoc3RydWN0IGRybV9kZXZpY2UgKmRldikKCkRyYXQh
IFRoYW5rcyBmb3IgZml4aW5nLgoKUmV2aWV3ZWQtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52
ZXR0ZXJAZmZ3bGwuY2g+Cgo+IAo+IEZpeGVzOiBjNjYwM2M3NDBlMGUgKCJkcm06IGFkZCBtYW5h
Z2VkIHJlc291cmNlcyB0aWVkIHRvIGRybV9kZXZpY2UiKQo+IFNpZ25lZC1vZmYtYnk6IENocmlz
IFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPgo+IENjOiBTYW0gUmF2bmJvcmcgPHNh
bUByYXZuYm9yZy5vcmc+Cj4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KPiAt
LS0KPiAgZHJpdmVycy9ncHUvZHJtL2RybV9tYW5hZ2VkLmMgfCAyICsrCj4gIDEgZmlsZSBjaGFu
Z2VkLCAyIGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ry
bV9tYW5hZ2VkLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX21hbmFnZWQuYwo+IGluZGV4IDljZWJm
ZTM3MGE2NS4uMWUxMzU2NTYwYzJlIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1f
bWFuYWdlZC5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9tYW5hZ2VkLmMKPiBAQCAtMTQs
NiArMTQsOCBAQAo+ICAjaW5jbHVkZSA8ZHJtL2RybV9kZXZpY2UuaD4KPiAgI2luY2x1ZGUgPGRy
bS9kcm1fcHJpbnQuaD4KPiAgCj4gKyNpbmNsdWRlICJkcm1faW50ZXJuYWwuaCIKPiArCj4gIC8q
Kgo+ICAgKiBET0M6IG1hbmFnZWQgcmVzb3VyY2VzCj4gICAqCj4gLS0gCj4gMi4yMC4xCj4gCgot
LSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KaHR0
cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVsCg==
