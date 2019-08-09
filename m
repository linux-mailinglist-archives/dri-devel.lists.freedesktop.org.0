Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E4D09883ED
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2019 22:29:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C546F6EE96;
	Fri,  9 Aug 2019 20:29:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-xc44.google.com (mail-yw1-xc44.google.com
 [IPv6:2607:f8b0:4864:20::c44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA9976EE96
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Aug 2019 20:29:12 +0000 (UTC)
Received: by mail-yw1-xc44.google.com with SMTP id z63so36047940ywz.9
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Aug 2019 13:29:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=LlRnIPT2zpDxA7In/mDGHv7By+s0gRf6iTmnZ8cYKn8=;
 b=HxXmLCQAH0dgSPLFToKYCLllGZD13tYoSu9PtBX6WbsAmtc4B99Xc96mM25yJ1Kkg9
 Pt+0lg1tflwzBCzlzz6rUYpLFYvV4O+RnicQTtZfx2ZFTu11s1z3MGOUc7oH77jSmIJ5
 mblrXyZbqbJUBY14p5Ia/mUfW4Oi7P0i2Jn76TQBlG03/RkJK/3/3OtlXSVMFNjA2Uyo
 u3G87SdgBrcKSc8k1F713aJPvpUsy+qelRBkujginkroOUeO7Q3r+aeg5jw64nHc3vo6
 2n39f9Ocfh7VrpFTXq/tavVkJJCoz4NCfIFbPdVocXITBlwMFrVusUsUgKIyAVbTydGp
 C35w==
X-Gm-Message-State: APjAAAXdwEQlfB3oByWx1mDR/dhaKwuxWbC2OWgPhY9Hp/A9Gk0kUgHV
 vCcWmCaV8rkP6jxae5haeuO+zg==
X-Google-Smtp-Source: APXvYqx1Go+vHVv2Zo314xPOjqi+hY+ZyM1cZAT7HSIKIkvz+YZFP7kUeELeQS/hu+TamZMOPIZ/HQ==
X-Received: by 2002:a81:5957:: with SMTP id n84mr14625763ywb.234.1565382551902; 
 Fri, 09 Aug 2019 13:29:11 -0700 (PDT)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id a130sm1306214ywe.27.2019.08.09.13.29.11
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 09 Aug 2019 13:29:11 -0700 (PDT)
Date: Fri, 9 Aug 2019 16:29:11 -0400
From: Sean Paul <sean@poorly.run>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH] drm: Fix kerneldoc warns in connector-related docs
Message-ID: <20190809202911.GE104440@art_vandelay>
References: <20190807162808.119141-1-sean@poorly.run>
 <20190807173023.GA30025@ravnborg.org>
 <20190809190553.GD104440@art_vandelay>
 <20190809201551.GA30284@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190809201551.GA30284@ravnborg.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=LlRnIPT2zpDxA7In/mDGHv7By+s0gRf6iTmnZ8cYKn8=;
 b=QRbQOYcUOSQogTufBPa91TGBUkwAK0oO9DW97lCyI/2ONP9fyfJrJ9XODihyCphAVp
 lUFpyjHKxTokkcKt27fl6rDVeH4ok2z8btKMOifC412hsft+G9fojOEquAscMMGfyRex
 j57JShsaTMDNm5uDmUAzrHw1dJgo4/nU7Qy/Pg3LU2ZACNJFIPmksoOiiU4dEiC9elXo
 p1+CeKOP2TtzVRPrAiS87Yw7h3OIIPH8m839DkIDcojgCPj/dYHbV/Ae4b+RaN9bgnC5
 itASD3LIkWntTb4ovi/niN5azRN5yS8B6RCb55LwU0J2VvOPi7xjPwyJ5MncCZfu4Y+Z
 zTwg==
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
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>,
 Jani Nikula <jani.nikula@intel.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Maxime Ripard <maxime.ripard@bootlin.com>,
 Sean Paul <seanpaul@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBBdWcgMDksIDIwMTkgYXQgMTA6MTU6NTFQTSArMDIwMCwgU2FtIFJhdm5ib3JnIHdy
b3RlOgo+IEhpIFNlYW4uCj4gCj4gPiA+ID4gLS0tIGEvaW5jbHVkZS9kcm0vZHJtX2Nvbm5lY3Rv
ci5oCj4gPiA+ID4gKysrIGIvaW5jbHVkZS9kcm0vZHJtX2Nvbm5lY3Rvci5oCj4gPiA+ID4gQEAg
LTU0Myw4ICs1NDMsOCBAQCBzdHJ1Y3QgZHJtX2Nvbm5lY3Rvcl9zdGF0ZSB7Cj4gPiA+ID4gIAkg
Kgo+ID4gPiA+ICAJICogVGhpcyBpcyBhbHNvIHVzZWQgaW4gdGhlIGF0b21pYyBoZWxwZXJzIHRv
IG1hcCBlbmNvZGVycyB0byB0aGVpcgo+ID4gPiA+ICAJICogY3VycmVudCBhbmQgcHJldmlvdXMg
Y29ubmVjdG9ycywgc2VlCj4gPiA+ID4gLQkgKiAmZHJtX2F0b21pY19nZXRfb2xkX2Nvbm5lY3Rv
cl9mb3JfZW5jb2RlcigpIGFuZAo+ID4gPiA+IC0JICogJmRybV9hdG9taWNfZ2V0X25ld19jb25u
ZWN0b3JfZm9yX2VuY29kZXIoKS4KPiA+ID4gPiArCSAqICZkcm1fYXRvbWljX2dldF9vbGRfY29u
bmVjdG9yX2Zvcl9lbmNvZGVyIGFuZAo+ID4gPiA+ICsJICogJmRybV9hdG9taWNfZ2V0X25ld19j
b25uZWN0b3JfZm9yX2VuY29kZXIuCj4gPiA+IFBsZWFzZSBmaXggdGhpcyB0byB1c2UgKCkgZm9y
IHRoZSBmdW5jdGlvbnMgYW5kIGRyb3AgdGhlICImIi4KPiA+ID4gVGhpcyBpcyB3aGF0IHdlIHVz
ZSBpbiBkcm0ga2VybmVsLWRvYyBmb3IgZnVuY3Rpb25zLgo+ID4gPiBTZWUgZm9yIGV4YW1wbGUg
ZnVuY3Rpb24gcmVmZXJlbmNlcyBpbiBkb2Mgb2Ygd3JpdGViYWNrX2pvYiBpbiB0aGUgc2FtZSBm
aWxlLgo+ID4gCj4gPiBEb2luZyB0aGlzIHdvbid0IGdldCBhIGh5cGVybGluayBpbiB0aGUgZG9j
cy4gSXQgc2VlbXMgbGlrZSB0aGVzZSBob29rcyBhcmVuJ3QKPiA+IHJlY29nbml6ZWQgYXMgZnVu
Y3Rpb25zIGJ5IHNwaGlueCAobm90IHN1cmUgZGlkbid0IGxvb2sgaW50byBpdCB0b28gZGVlcGx5
KS4gVGhlCj4gPiBvdGhlciAiX2Z1bmNzLioiIGhvb2tzIGFyZSBhbHNvIGhhbmRsZWQgd2l0aCAn
JicgKHRoZXJlIGFyZSBsb3RzIG9mIGV4YW1wbGVzIGluCj4gPiBkcm1fY29ubmVjdG9yLmgpLgo+
ID4gCj4gPiBJIHRoaW5rIHByZXNlcnZpbmcgdGhlIGh5cGVybGlua3MgcHJvYmFibHkgb3V0d2Vp
Z2hzIHRoZSBtaXNzaW5nICgpLCB0aG91Z2h0cz8KPiAKPiBIbW0sIEkgYWN0dWFsbHkgdGVzdGVk
IGl0IGhlcmUgLSB3aXRoIHNwaGlueF8xLjQuOS4KPiBUaGUgbGlua3Mgd2FzIHByZXNlcnZlZCwg
dGhlIG9ubHkgZGlmZmVyZW5jZSB3YXMgdGhhdCB0aGV5IGhhZCB0aGUgKCkKPiBwcmVmaXhlZCB0
byB0aGVpciBuYW1lLgo+IAo+IERvIHlvdSBoYXBwZW4gdG8gdXNlIGFuIG9sZGVyIHNwaGlueCB2
ZXJzaW9uPwoKSSdtIG9uIDEuNy45LiBJIGp1c3QgcmVjaGVja2VkIGFuZCB3YXMgYSBiaXQgY29u
ZnVzZWQgaW4gbXkgbGFzdCBtYWlsLiBUaGUKZHJtX2F0b21pY19nZXRfKl9jb25uZWN0b3JfZm9y
X2VuY29kZXIgbGlua3MgZG8gd29yayB3aXRoICgpLCBpdCdzIHRoZSBvbmVzCmRybV9jb25uZWN0
b3JfaGVscGVyX2Z1bmNzIGluIHRoZSBwYXJhZ3JhcGggYWJvdmUgdGhhdCBuZWVkIHRoZSAnJicu
IFNvIEknbGwKc3dpdGNoIHVwIHRoZXNlIDIgYW5kIGxlYXZlIHRoZSBvdGhlcnMgYXMtaXMuIENv
b2w/CgpTZWFuCgo+IAo+IAlTYW0KCi0tIApTZWFuIFBhdWwsIFNvZnR3YXJlIEVuZ2luZWVyLCBH
b29nbGUgLyBDaHJvbWl1bSBPUwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
