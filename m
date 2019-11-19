Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C15D102E30
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2019 22:22:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFA686E9B1;
	Tue, 19 Nov 2019 21:22:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D00DB6E3F5
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2019 21:22:35 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id z10so25626192wrs.12
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2019 13:22:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=DlXKb9BgYz6v1KMFvMMPAiIkp2F3kVOgCpxH+j84Lwc=;
 b=Dh/YF5xqkBp46JXWHX/rKDl28MqrQcwwhPi+z4fTxkG8HxSAOwbI+hZ+irPpfAkWBH
 AMeoccWDByW+cEzxgK6118rW77ePpelg9TjqOYbiw41v8FIikkSNH/414jodqdVEsTQv
 sDAtjIZCnFqUu40zfdbsM3zc89w9DJdNjsIQnr8ed/hsCiU2/iQQVW53pHv6TFtTSF02
 gVlVOAPz7aRymO7sb1HLfFEWAWth1cILu7ZTLlNhyX+gsoQWdKUWsps0bD0n87V3Bjxp
 S27kQf62Cppee8ZWC5RZmJChzuuQq/a9Wmg1HUsj6z2LnLG8DG4hoJdRJgtbJ4Bkvnuv
 tSzQ==
X-Gm-Message-State: APjAAAXpyevBdLMfKBjgUHSGu63DqY2G3qWNAla09rIgLjuo4uPkPbpA
 OzW8clsMHK3Ajfsph1bEVSCnvw==
X-Google-Smtp-Source: APXvYqw1WQXBpMoG44fK0X22TCogCXWRV/ybRJc8btr4U8n/otAyw4dscEzByPiiWpPs5oLTQWkcmw==
X-Received: by 2002:adf:de0a:: with SMTP id b10mr40657112wrm.268.1574198554470; 
 Tue, 19 Nov 2019 13:22:34 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id b2sm3035487wrr.76.2019.11.19.13.22.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Nov 2019 13:22:33 -0800 (PST)
Date: Tue, 19 Nov 2019 22:22:31 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH 2/8] drm/atmel: ditch fb_create wrapper
Message-ID: <20191119212231.GE30416@phenom.ffwll.local>
References: <20191115092120.4445-1-daniel.vetter@ffwll.ch>
 <20191115092120.4445-3-daniel.vetter@ffwll.ch>
 <20191115103324.1fbeca63@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191115103324.1fbeca63@collabora.com>
X-Operating-System: Linux phenom 5.2.0-3-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=DlXKb9BgYz6v1KMFvMMPAiIkp2F3kVOgCpxH+j84Lwc=;
 b=TGShtLEHdu3HRj6tfTSQUMGYhrOov7aFOBwaj1LQTzzN1p2LNThZ3aJN2awfMO2+uz
 bVL9pmYvcj6kLNdmGTP00mf/WiaXxIGAK2gMrSLN53soNxtUi1DhxSWQEgZaX3QGb3VF
 B54T3Jlqd7rF8dDGfwSLOVODjwjAsD/lKx7Aw=
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Sam Ravnborg <sam@ravnborg.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBOb3YgMTUsIDIwMTkgYXQgMTA6MzM6MjRBTSArMDEwMCwgQm9yaXMgQnJlemlsbG9u
IHdyb3RlOgo+IE9uIEZyaSwgMTUgTm92IDIwMTkgMTA6MjE6MTQgKzAxMDAKPiBEYW5pZWwgVmV0
dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPiB3cm90ZToKPiAKPiA+IFNwb3R0ZWQgd2hpbGUg
bG9va2luZyB0aHJvdWdoIHRoZW0gYWxsLgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBEYW5pZWwg
VmV0dGVyIDxkYW5pZWwudmV0dGVyQGludGVsLmNvbT4KPiA+IENjOiBTYW0gUmF2bmJvcmcgPHNh
bUByYXZuYm9yZy5vcmc+Cj4gPiBDYzogQm9yaXMgQnJlemlsbG9uIDxiYnJlemlsbG9uQGtlcm5l
bC5vcmc+Cj4gCj4gQWNrZWQtYnk6IEJvcmlzIEJyZXppbGxvbiA8Ym9yaXMuYnJlemlsbG9uQGNv
bGxhYm9yYS5jb20+CgpNZXJnZWQsIHRoYW5rcyBmb3IgdGFraW5nIGEgbG9vay4KLURhbmllbAoK
PiAKPiA+IENjOiBOaWNvbGFzIEZlcnJlIDxuaWNvbGFzLmZlcnJlQG1pY3JvY2hpcC5jb20+Cj4g
PiBDYzogQWxleGFuZHJlIEJlbGxvbmkgPGFsZXhhbmRyZS5iZWxsb25pQGJvb3RsaW4uY29tPgo+
ID4gQ2M6IEx1ZG92aWMgRGVzcm9jaGVzIDxsdWRvdmljLmRlc3JvY2hlc0BtaWNyb2NoaXAuY29t
Pgo+ID4gQ2M6IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwo+ID4gLS0tCj4g
PiAgZHJpdmVycy9ncHUvZHJtL2F0bWVsLWhsY2RjL2F0bWVsX2hsY2RjX2RjLmMgfCA4ICstLS0t
LS0tCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCA3IGRlbGV0aW9ucygtKQo+
ID4gCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2F0bWVsLWhsY2RjL2F0bWVsX2hs
Y2RjX2RjLmMgYi9kcml2ZXJzL2dwdS9kcm0vYXRtZWwtaGxjZGMvYXRtZWxfaGxjZGNfZGMuYwo+
ID4gaW5kZXggOTI2NDAyOThhZDQxLi44ZGM5MTdhMTI3MGIgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0vYXRtZWwtaGxjZGMvYXRtZWxfaGxjZGNfZGMuYwo+ID4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2F0bWVsLWhsY2RjL2F0bWVsX2hsY2RjX2RjLmMKPiA+IEBAIC01NTcsMTIgKzU1
Nyw2IEBAIHN0YXRpYyBpcnFyZXR1cm5fdCBhdG1lbF9obGNkY19kY19pcnFfaGFuZGxlcihpbnQg
aXJxLCB2b2lkICpkYXRhKQo+ID4gIAlyZXR1cm4gSVJRX0hBTkRMRUQ7Cj4gPiAgfQo+ID4gIAo+
ID4gLXN0YXRpYyBzdHJ1Y3QgZHJtX2ZyYW1lYnVmZmVyICphdG1lbF9obGNkY19mYl9jcmVhdGUo
c3RydWN0IGRybV9kZXZpY2UgKmRldiwKPiA+IC0JCXN0cnVjdCBkcm1fZmlsZSAqZmlsZV9wcml2
LCBjb25zdCBzdHJ1Y3QgZHJtX21vZGVfZmJfY21kMiAqbW9kZV9jbWQpCj4gPiAtewo+ID4gLQly
ZXR1cm4gZHJtX2dlbV9mYl9jcmVhdGUoZGV2LCBmaWxlX3ByaXYsIG1vZGVfY21kKTsKPiA+IC19
Cj4gPiAtCj4gPiAgc3RydWN0IGF0bWVsX2hsY2RjX2RjX2NvbW1pdCB7Cj4gPiAgCXN0cnVjdCB3
b3JrX3N0cnVjdCB3b3JrOwo+ID4gIAlzdHJ1Y3QgZHJtX2RldmljZSAqZGV2Owo+ID4gQEAgLTY1
Nyw3ICs2NTEsNyBAQCBzdGF0aWMgaW50IGF0bWVsX2hsY2RjX2RjX2F0b21pY19jb21taXQoc3Ry
dWN0IGRybV9kZXZpY2UgKmRldiwKPiA+ICB9Cj4gPiAgCj4gPiAgc3RhdGljIGNvbnN0IHN0cnVj
dCBkcm1fbW9kZV9jb25maWdfZnVuY3MgbW9kZV9jb25maWdfZnVuY3MgPSB7Cj4gPiAtCS5mYl9j
cmVhdGUgPSBhdG1lbF9obGNkY19mYl9jcmVhdGUsCj4gPiArCS5mYl9jcmVhdGUgPSBkcm1fZ2Vt
X2ZiX2NyZWF0ZSwKPiA+ICAJLmF0b21pY19jaGVjayA9IGRybV9hdG9taWNfaGVscGVyX2NoZWNr
LAo+ID4gIAkuYXRvbWljX2NvbW1pdCA9IGF0bWVsX2hsY2RjX2RjX2F0b21pY19jb21taXQsCj4g
PiAgfTsKPiAKCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jw
b3JhdGlvbgpodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
