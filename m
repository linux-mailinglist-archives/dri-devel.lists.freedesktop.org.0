Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBA6ED1927
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2019 21:44:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 186A66EA4F;
	Wed,  9 Oct 2019 19:44:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb44.google.com (mail-yb1-xb44.google.com
 [IPv6:2607:f8b0:4864:20::b44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD4766EA51
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2019 19:44:26 +0000 (UTC)
Received: by mail-yb1-xb44.google.com with SMTP id r2so1143989ybg.3
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Oct 2019 12:44:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=ity2t0ZXkXS9+wC2EaCwHJN2zzRBu7hyEJEc0VGVKy4=;
 b=f2ieRRz/L9o9NSwHyr0syhzDRpgrlvOwd4wMsnA/PpxOxeeyMiKJYj1xlscnHI8ZNg
 BHgKJ8PQNtP9PNzAGcrYaCFhfo/foJUjUNSz/7+MVa8sw5zON4msfhmLPU17HvZz7JnE
 l1d76I2O7gDpRVWJ5F6uDnDbeM6AcCLUyHgwEa3ZKgRWQ6u/hcNmTEbfKYKW4sCSWWAk
 OGcuK1/9p0T96Ku4ojFRHNlcpLMNlEovf6DatwAHYkexFczk6gfynJAa5MFotv9rxIdR
 6J7HYgNm4UVy50bHtrQ4zS7MyeymiA1/i2oV20YW0zCzSrKuaLACCMOAvtHJNM29w7oi
 S5Cg==
X-Gm-Message-State: APjAAAVVnuoW8uwzHMnURlwScs+PkIel43rzm4XRMkuKEN7++FHo2j7r
 Y1yVmD4ADTao61qvTvV+/ygu8q7buz4=
X-Google-Smtp-Source: APXvYqwpIgpKfTsa5RMbWz3yrYtJwgYuNfk6vKJSA6ROKoDUS/crOvwVWKNGO6X+jpazYcr0pRb4RA==
X-Received: by 2002:a25:bacb:: with SMTP id a11mr3062708ybk.483.1570650264565; 
 Wed, 09 Oct 2019 12:44:24 -0700 (PDT)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id v15sm800544ywa.39.2019.10.09.12.44.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Oct 2019 12:44:24 -0700 (PDT)
Date: Wed, 9 Oct 2019 15:44:23 -0400
From: Sean Paul <sean@poorly.run>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] Documentation: Fix warning in drm-kmsc-helpers.rst
Message-ID: <20191009194423.GG85762@art_vandelay>
References: <20191007151921.27099-1-sean@poorly.run>
 <20191009161313.GQ16989@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191009161313.GQ16989@phenom.ffwll.local>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=ity2t0ZXkXS9+wC2EaCwHJN2zzRBu7hyEJEc0VGVKy4=;
 b=Gn6MCV1TPTQW1s7rG+YSuNef8I28ywmgl0xbMxUMg6nKGYH0T3hYo6bRnzYFiE3nNO
 U3i5gOtAxLTfsk7k9X8qmBkUnMDQ+YpdDHckQxsEaqX5XnAaux12oL9xZDJLxRkkBJkx
 1E8IBcSHC2MpDzunKQuCoKKT7A1T0vH89di+UrroVLZm1jPNuqDPKanR4LetA4TymNSd
 tnHM9ln/Ykd7f8gJdGrvr0KfIIi31WCFCd5DmgXIgwE5PEZ7ulmafWs63igUwCNPuzwO
 y5yNZlYG0dtVikXXVCvG4fZcfdLK6MKsldIL38h40HdK7+xB3p6zqdm97Pkt1yITqv5W
 bsQw==
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
Cc: linux-doc@vger.kernel.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Sean Paul <seanpaul@chromium.org>,
 Maxime Ripard <mripard@kernel.org>, Daniel Vetter <daniel.vetter@intel.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBPY3QgMDksIDIwMTkgYXQgMDY6MTM6MTNQTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBPbiBNb24sIE9jdCAwNywgMjAxOSBhdCAxMToxOTowMUFNIC0wNDAwLCBTZWFuIFBh
dWwgd3JvdGU6Cj4gPiBGcm9tOiBTZWFuIFBhdWwgPHNlYW5wYXVsQGNocm9taXVtLm9yZz4KPiA+
IAo+ID4gRml4ZXMgdGhlIGZvbGxvd2luZyB3YXJuaW5nOgo+ID4gLi4vaW5jbHVkZS9kcm0vZHJt
X2F0b21pY19zdGF0ZV9oZWxwZXIuaDoxOiB3YXJuaW5nOiBubyBzdHJ1Y3R1cmVkIGNvbW1lbnRz
IGZvdW5kCj4gPiAKPiA+IEZpeGVzOiA5ZWY4YTlkYzRiMjEgKCJkcm06IEV4dHJhY3QgZHJtX2F0
b21pY19zdGF0ZV9oZWxwZXIuW2hjXSIpCj4gPiBDYzogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5z
eXJqYWxhQGxpbnV4LmludGVsLmNvbT4KPiA+IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0
dGVyQGludGVsLmNvbT4KPiA+IENjOiBNYWFydGVuIExhbmtob3JzdCA8bWFhcnRlbi5sYW5raG9y
c3RAbGludXguaW50ZWwuY29tPgo+ID4gQ2M6IE1heGltZSBSaXBhcmQgPG1yaXBhcmRAa2VybmVs
Lm9yZz4KPiA+IENjOiBTZWFuIFBhdWwgPHNlYW5AcG9vcmx5LnJ1bj4KPiA+IENjOiBEYXZpZCBB
aXJsaWUgPGFpcmxpZWRAbGludXguaWU+Cj4gPiBDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZm
d2xsLmNoPgo+ID4gQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiA+IFNpZ25l
ZC1vZmYtYnk6IFNlYW4gUGF1bCA8c2VhbnBhdWxAY2hyb21pdW0ub3JnPgo+IAo+IFJldmlld2Vk
LWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgo+IAoKVGhhbmtzIGZv
ciB0aGUgcmV2aWV3LCBwdXNoZWQgdG8gZHJtLW1pc2MtbmV4dCAod2l0aCBjb3JyZWN0IGZpbGUg
bmFtZSBpbgpzdWJqZWN0KS4KClNlYW4KCj4gPiAtLS0KPiA+ICBEb2N1bWVudGF0aW9uL2dwdS9k
cm0ta21zLWhlbHBlcnMucnN0IHwgMyAtLS0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMyBkZWxldGlv
bnMoLSkKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZ3B1L2RybS1rbXMtaGVs
cGVycy5yc3QgYi9Eb2N1bWVudGF0aW9uL2dwdS9kcm0ta21zLWhlbHBlcnMucnN0Cj4gPiBpbmRl
eCAzODY4MDA4ZGI4YTkuLjk2NjhhN2ZlMjQwOCAxMDA2NDQKPiA+IC0tLSBhL0RvY3VtZW50YXRp
b24vZ3B1L2RybS1rbXMtaGVscGVycy5yc3QKPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vZ3B1L2Ry
bS1rbXMtaGVscGVycy5yc3QKPiA+IEBAIC03Nyw5ICs3Nyw2IEBAIEF0b21pYyBTdGF0ZSBSZXNl
dCBhbmQgSW5pdGlhbGl6YXRpb24KPiA+ICBBdG9taWMgU3RhdGUgSGVscGVyIFJlZmVyZW5jZQo+
ID4gIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gPiAgCj4gPiAtLi4ga2VybmVsLWRv
Yzo6IGluY2x1ZGUvZHJtL2RybV9hdG9taWNfc3RhdGVfaGVscGVyLmgKPiA+IC0gICA6aW50ZXJu
YWw6Cj4gPiAtCj4gPiAgLi4ga2VybmVsLWRvYzo6IGRyaXZlcnMvZ3B1L2RybS9kcm1fYXRvbWlj
X3N0YXRlX2hlbHBlci5jCj4gPiAgICAgOmV4cG9ydDoKPiA+ICAKPiA+IC0tIAo+ID4gU2VhbiBQ
YXVsLCBTb2Z0d2FyZSBFbmdpbmVlciwgR29vZ2xlIC8gQ2hyb21pdW0gT1MKPiA+IAo+IAo+IC0t
IAo+IERhbmllbCBWZXR0ZXIKPiBTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24K
PiBodHRwOi8vYmxvZy5mZndsbC5jaAoKLS0gClNlYW4gUGF1bCwgU29mdHdhcmUgRW5naW5lZXIs
IEdvb2dsZSAvIENocm9taXVtIE9TCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
