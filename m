Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87FA56D2EA
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jul 2019 19:41:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5384A6E447;
	Thu, 18 Jul 2019 17:41:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-xc42.google.com (mail-yw1-xc42.google.com
 [IPv6:2607:f8b0:4864:20::c42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 368286E449
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2019 17:41:03 +0000 (UTC)
Received: by mail-yw1-xc42.google.com with SMTP id n205so12524448ywb.10
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2019 10:41:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=f6qnUMPXnkWnmFRN12Yc+hxpIH+RTY5J9v4Al67WV/s=;
 b=WSRFkMcPKIN7MjEGnIHHVwPFoMfq2hY9wt70X5kvn0M4iJqqsTQYUESHsNFQ4fMSuk
 6DBB87cijnBpYmaInyWT7YeOox0CVtMPvx5iAD8gpo/eZFh6mfehai56pCh00nP21aop
 w3Mm12E79XEWPxzZnw8b1eQHv4OJU2ULxmiKQNCU5tTcEpaOF+2wliZj025DwbrvWXyK
 j07G/ppCov0l4S7N+JOP8+BQQHxhEvGFEyS1pUSjjFQ3U2V6LWTVGlM8LDeEX58VSykC
 lmM76XmU8iSLBbfDw8SzL7U0n/+gu+0OuM97SzIxHJDgCUfChqfLuTZia2exy9sRcZn1
 qr8Q==
X-Gm-Message-State: APjAAAUzTmt3rHaIUw2zRlat0dzqfghIx78TA4x60PuJXi3T/cNjbLwc
 /fXKCXUeedfvt+E0MBHjfdesKQ==
X-Google-Smtp-Source: APXvYqwhUJ/qcdaunEQ7i8P6wOE1BiEEzgCQrUD7jLZZMpnXGfaFaEs1Xa1X+PNaBbyZ0+t1OVUIhg==
X-Received: by 2002:a81:6dd6:: with SMTP id
 i205mr28057860ywc.180.1563471661869; 
 Thu, 18 Jul 2019 10:41:01 -0700 (PDT)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id w193sm1185400ywa.72.2019.07.18.10.41.01
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 18 Jul 2019 10:41:01 -0700 (PDT)
Date: Thu, 18 Jul 2019 13:41:01 -0400
From: Sean Paul <sean@poorly.run>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v1 03/11] drm: drop uapi dependency from drm_vblank.h
Message-ID: <20190718174101.GF31819@art_vandelay>
References: <20190718161507.2047-1-sam@ravnborg.org>
 <20190718161507.2047-4-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190718161507.2047-4-sam@ravnborg.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=f6qnUMPXnkWnmFRN12Yc+hxpIH+RTY5J9v4Al67WV/s=;
 b=Qro9GngmvMiiB3Z6FB8mN1PItY3TPbrhYXja5d21Qp0UaqJYrDAhOXDuA8N5Fo3kIa
 N/EH4G9LKvGVKw0Jr1GostJiiZkK1Jf05d3cSCHzMnzCretOwL87CciZ9crkt+1zlGPx
 TYr3i4wNKa7NTaU52E/1d/ScA8X7LXyaEKAgtQHB0ayR3nF9ZsFk7TEEs0SaOBd6551u
 B2ZjnuFK80UNJRr2GEryped1kSagz7pGkfAR0veiRFxmKArE/75NYgRIAElrxXtxUuZq
 O9OH5gzsp52Ju2LqPSCZhUecFNXlZU1RqWHlCWMB9hz4EcwiA6rtVNalLeX64/osjrje
 oN1A==
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Liviu Dudau <Liviu.Dudau@arm.com>, dri-devel@lists.freedesktop.org,
 Maxime Ripard <maxime.ripard@bootlin.com>, Thierry Reding <treding@nvidia.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
 Boris Brezillon <bbrezillon@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdWwgMTgsIDIwMTkgYXQgMDY6MTQ6NTlQTSArMDIwMCwgU2FtIFJhdm5ib3JnIHdy
b3RlOgo+IGRybV92YmxhbmsuaCBpbmNsdWRlZCB1YXBpL2RybS9kcm0uaC4KPiBJdCB0dXJucyBv
dXQgdGhpcyBpbmNsdWRlIHdhcyBub3QgcmVxdWlyZWQgLSBkZWxldGUgaXQuCj4gCj4gTm90ZTog
dWFwaS9kcm0vZHJtLmggaXMgaW5jbHVkZWQgaW5kaXJlY3QgdmlhIGRybV9maWxlLmgsCj4gYnV0
IHRoZXJlIGFyZSBubyBkZXBlbmRlbmNpZXMgaW4gZHJtX3ZibGFuay5oIHNvIHRoZSByZW1vdmFs
Cj4gaXMgbGVnaXQuCj4gCj4gU2lnbmVkLW9mZi1ieTogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJv
cmcub3JnPgo+IFJldmlld2VkLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xs
LmNoPgo+IENjOiBNYWFydGVuIExhbmtob3JzdCA8bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50
ZWwuY29tPgo+IENjOiBNYXhpbWUgUmlwYXJkIDxtYXhpbWUucmlwYXJkQGJvb3RsaW4uY29tPgo+
IENjOiBTZWFuIFBhdWwgPHNlYW5AcG9vcmx5LnJ1bj4KPiBDYzogRGF2aWQgQWlybGllIDxhaXJs
aWVkQGxpbnV4LmllPgo+IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+Cj4gQ2M6
IFN0ZWZhbiBBZ25lciA8c3RlZmFuQGFnbmVyLmNoPgo+IENjOiBUaGllcnJ5IFJlZGluZyA8dHJl
ZGluZ0BudmlkaWEuY29tPgoKUmV2aWV3ZWQtYnk6IFNlYW4gUGF1bCA8c2VhbkBwb29ybHkucnVu
PgoKPiAtLS0KPiAgaW5jbHVkZS9kcm0vZHJtX3ZibGFuay5oIHwgMSAtCj4gIDEgZmlsZSBjaGFu
Z2VkLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2RybV92Ymxh
bmsuaCBiL2luY2x1ZGUvZHJtL2RybV92YmxhbmsuaAo+IGluZGV4IGU1MjhiYjJmNjU5ZC4uOWZl
NGJhOGJjNjIyIDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvZHJtL2RybV92YmxhbmsuaAo+ICsrKyBi
L2luY2x1ZGUvZHJtL2RybV92YmxhbmsuaAo+IEBAIC0zMCw3ICszMCw2IEBACj4gIAo+ICAjaW5j
bHVkZSA8ZHJtL2RybV9maWxlLmg+Cj4gICNpbmNsdWRlIDxkcm0vZHJtX21vZGVzLmg+Cj4gLSNp
bmNsdWRlIDx1YXBpL2RybS9kcm0uaD4KPiAgCj4gIHN0cnVjdCBkcm1fZGV2aWNlOwo+ICBzdHJ1
Y3QgZHJtX2NydGM7Cj4gLS0gCj4gMi4yMC4xCj4gCgotLSAKU2VhbiBQYXVsLCBTb2Z0d2FyZSBF
bmdpbmVlciwgR29vZ2xlIC8gQ2hyb21pdW0gT1MKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
