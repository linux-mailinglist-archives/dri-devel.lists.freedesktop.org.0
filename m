Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43D192BA51
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2019 20:47:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A8B689A5C;
	Mon, 27 May 2019 18:47:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D78B789A5C
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2019 18:47:54 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id w11so27980350edl.5
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2019 11:47:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=IHRWKQ5Q05xXzagqWdvbMcM2HAtyD2LyApxM28334u0=;
 b=h09kJZWLpO0V0KzxYNre5xUjNLJPd3DWCOIQsNyHzgZG9tkbBCmmLY0EI6FRCYUeKy
 xhNO4XLRJJfr1MyDsPoWDiexrhykUwmEJjy7Og1X14aGxJH+6QcIe0mThM/yIV7tn/PS
 EI+VUdp9ypK1eo8UQWOkwLndYonCGQREqrFn85qQSGRN7vlIeEWxMMLCUmmnMMTUSlhR
 xMV5PRoy7kjYFvPLaV4zxcsNttlA/YDKBGpW9MnIBO0aXfl/YlGGjYAWIIEEyjTlJsH9
 xekbCbxKfUpkYTzw1bMjntqW8lWSmbdgaN+Flx/tx41H5IoC6b2dDzQfgbe2TMsjw+F3
 Trzg==
X-Gm-Message-State: APjAAAWd49DadvKjg/9kM+lPOtJMj5LzZKiAWcz8lg/vUUG+sPE+Lf27
 w/Me3QYlgi1uKCAVeoxpAb8ucvNKfBI=
X-Google-Smtp-Source: APXvYqwPbuF+WXYRE8Vni4+NHRq8AtsNAsq+NodzZXbrmCzZ/634UrEcLtY7YBZXQiBMf2OhVX70kg==
X-Received: by 2002:a17:907:397:: with SMTP id
 ss23mr1036963ejb.226.1558982873564; 
 Mon, 27 May 2019 11:47:53 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id v16sm3529039edm.56.2019.05.27.11.47.52
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 27 May 2019 11:47:52 -0700 (PDT)
Date: Mon, 27 May 2019 20:47:50 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH] drm/damage-helper: Use NULL instead of 0
Message-ID: <20190527184750.GR21222@phenom.ffwll.local>
References: <20190527183714.11168-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190527183714.11168-1-festevam@gmail.com>
X-Operating-System: Linux phenom 4.14.0-3-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=IHRWKQ5Q05xXzagqWdvbMcM2HAtyD2LyApxM28334u0=;
 b=TokbSP8kcIuGsdACEcxhking+px04F9WaSwUuPllJI2ER37GjzPXDpQcKYkTLym5kf
 YYl+CLzaYwIBrb0ESRsfv5NOuzsACQIgCN791sAMRdwPLDxUJ+ch39yd5QyvIApBmxmF
 OmeLqYBxBXHmv4GuDcd6iIDJxjGR4B1UDPr08=
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
Cc: maxime.ripard@bootlin.com, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBNYXkgMjcsIDIwMTkgYXQgMDM6Mzc6MTRQTSAtMDMwMCwgRmFiaW8gRXN0ZXZhbSB3
cm90ZToKPiBUaGUgJ2NsaXBzJyBtZW1iZXIgaXMgYSBwb2ludGVyLCBzbyBhc3NpZ24gTlVMTCBp
bnN0ZWFkIG9mIDAuCj4gCj4gVGhpcyBmaXhlcyB0aGUgZm9sbG93aW5nIHNwYXJzZSB3YXJuaW5n
Ogo+IAo+IGRyaXZlcnMvZ3B1L2RybS9kcm1fZGFtYWdlX2hlbHBlci5jOjI4OTozMTogd2Fybmlu
ZzogVXNpbmcgcGxhaW4gaW50ZWdlciBhcyBOVUxMIHBvaW50ZXIKPiAKPiBTaWduZWQtb2ZmLWJ5
OiBGYWJpbyBFc3RldmFtIDxmZXN0ZXZhbUBnbWFpbC5jb20+CgpBcHBsaWVkLCB0aGFua3MgZm9y
IHlvdXIgcGF0Y2guCi1EYW5pZWwKCj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fZGFtYWdl
X2hlbHBlci5jIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVs
ZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9kYW1hZ2VfaGVs
cGVyLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2RhbWFnZV9oZWxwZXIuYwo+IGluZGV4IGVlNjdj
OTY4NDFmYS4uODIzMGRhYzAxYTg5IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1f
ZGFtYWdlX2hlbHBlci5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9kYW1hZ2VfaGVscGVy
LmMKPiBAQCAtMjg2LDcgKzI4Niw3IEBAIGRybV9hdG9taWNfaGVscGVyX2RhbWFnZV9pdGVyX2lu
aXQoc3RydWN0IGRybV9hdG9taWNfaGVscGVyX2RhbWFnZV9pdGVyICppdGVyLAo+ICAJaXRlci0+
cGxhbmVfc3JjLnkyID0gKHN0YXRlLT5zcmMueTIgPj4gMTYpICsgISEoc3RhdGUtPnNyYy55MiAm
IDB4RkZGRik7Cj4gIAo+ICAJaWYgKCFpdGVyLT5jbGlwcyB8fCAhZHJtX3JlY3RfZXF1YWxzKCZz
dGF0ZS0+c3JjLCAmb2xkX3N0YXRlLT5zcmMpKSB7Cj4gLQkJaXRlci0+Y2xpcHMgPSAwOwo+ICsJ
CWl0ZXItPmNsaXBzID0gTlVMTDsKPiAgCQlpdGVyLT5udW1fY2xpcHMgPSAwOwo+ICAJCWl0ZXIt
PmZ1bGxfdXBkYXRlID0gdHJ1ZTsKPiAgCX0KPiAtLSAKPiAyLjE3LjEKPiAKPiBfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKCi0tIApEYW5pZWwgVmV0
dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgpodHRwOi8vYmxvZy5mZnds
bC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
