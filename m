Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24E43108A9C
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2019 10:15:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C5C56E029;
	Mon, 25 Nov 2019 09:15:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E5816E029
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2019 09:15:43 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id i12so17019418wro.5
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2019 01:15:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=JFrAWQg5VHmsGYe4+ulutCSjzH21NVLqB6Exy0kRKDQ=;
 b=buAUQOb7s/sVMq5EM1Y8CC+67Cnjo32kMdB+g92MDi8F+a0OTjwhka2hf6E6nAwXFO
 d9RqF52e2jcInSvJ3h0JExN+BFI25JlXABvocg912H6uB5heOtfyuVTx7TujH//LcV6W
 mJjGF3AYyMYDiXkRTmHb5rvKHUrjHP53/nxE7+Q6WLG3ie/2GoFRAebXrIQmHAQSKkrC
 69q/6/ovX9zJJIhyK76jnoTlsDAPOZlDC2yP2puKq/NvKVtzpRHE7hPjtSV7izB95R63
 jqv+WB2MOiDuEtKsWp0H0FiwXPwjToddYTHf0ZDMjFzspHE1ijzmyP41K4/i1qE+o6iv
 gunQ==
X-Gm-Message-State: APjAAAUSrgfLVfFMBWLZaUEgF6Q72upHGv0QrU2COuJu33YfEQC9ty7b
 cahhLA+Zn3SepM+3H9phx2OX3Q==
X-Google-Smtp-Source: APXvYqzmOWiNsNKRY7lPNAjGw3EA02LJmhUU4N8tom41Z06w5j+DpbVeLzLFrrsIMa6FUexnpRiT+A==
X-Received: by 2002:a5d:4247:: with SMTP id s7mr30680725wrr.381.1574673341925; 
 Mon, 25 Nov 2019 01:15:41 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id y8sm9947231wru.59.2019.11.25.01.15.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Nov 2019 01:15:40 -0800 (PST)
Date: Mon, 25 Nov 2019 10:15:38 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 4/4] drm/hisilicon/hibmc: Export VRAM MM information to
 debugfs
Message-ID: <20191125091538.GH29965@phenom.ffwll.local>
References: <20191122083044.6627-1-tzimmermann@suse.de>
 <20191122083044.6627-5-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191122083044.6627-5-tzimmermann@suse.de>
X-Operating-System: Linux phenom 5.3.0-2-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=JFrAWQg5VHmsGYe4+ulutCSjzH21NVLqB6Exy0kRKDQ=;
 b=bxUWJ2dM9837ObQ3AsgXUhkceoQ4XKgu2S1+7FLQYv8KDuIFoKhxpVxeGmAq4IxBOK
 Di1U3esOzy35xYbO1BHpy6wUoFpQaBPeOorLAWt6FzsoAaICFxyiNMDSxGHzd44Ao05b
 KqXXJU7s/7vwDB2Lp4z/qEBeokV1facSPv/Xk=
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
Cc: yuehaibing@huawei.com, airlied@linux.ie, puck.chen@hisilicon.com,
 dri-devel@lists.freedesktop.org, z.liuxinliang@hisilicon.com,
 kong.kongxinwei@hisilicon.com, hslester96@gmail.com, kraxel@redhat.com,
 zourongrong@gmail.com, sam@ravnborg.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBOb3YgMjIsIDIwMTkgYXQgMDk6MzA6NDRBTSArMDEwMCwgVGhvbWFzIFppbW1lcm1h
bm4gd3JvdGU6Cj4gVGhpcyBjaGFuZ2UgbWFrZXMgaW5mb3JtYXRpb24gYWJvdXQgVlJBTSBjb25z
dW1wdGlvbiBhdmFpbGFibGUgb24KPiBkZWJ1Z2ZzLiBTZWUKPiAKPiAgIC9zeXMva2VybmVsL2Rl
YnVnL2RyaS8wL3ZyYW0tbW0KPiAKPiBmb3IgYW4gb3ZlcnZpZXcgb2YgaG93IFZSQU0gaXMgYmVp
bmcgdXNlZC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1h
bm5Ac3VzZS5kZT4KClJldmlld2VkLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZm
d2xsLmNoPgoKV3J0IG1lcmdpbmc6IEknZCB3YWl0IDItMyB3ZWVrcyBmb3IgdGVzdGluZyBmcm9t
IG1haW50YWluZXJzLCB0aGVuIG1lcmdlCmVpdGhlciB3YXkuIEVpdGhlciBpdCB3b3Jrcywgb3Ig
d2UndmUgZm91bmQgc29tZW9uZSB3aG8gY2FyZXMgZW5vdWdoIHRvCnRlc3QgcGF0Y2hlcyBpZiBz
b21ldGhpbmcgYnJva2UgaW4gaGVyZSA6LSkKLURhbmllbAoKPiAtLS0KPiAgZHJpdmVycy9ncHUv
ZHJtL2hpc2lsaWNvbi9oaWJtYy9oaWJtY19kcm1fZHJ2LmMgfCAxICsKPiAgMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9oaXNp
bGljb24vaGlibWMvaGlibWNfZHJtX2Rydi5jIGIvZHJpdmVycy9ncHUvZHJtL2hpc2lsaWNvbi9o
aWJtYy9oaWJtY19kcm1fZHJ2LmMKPiBpbmRleCAxMTNkMjdiOGE4ZjEuLjExZDFiMDc2MWM5YSAx
MDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaGlzaWxpY29uL2hpYm1jL2hpYm1jX2RybV9k
cnYuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9oaXNpbGljb24vaGlibWMvaGlibWNfZHJtX2Ry
di5jCj4gQEAgLTU1LDYgKzU1LDcgQEAgc3RhdGljIHN0cnVjdCBkcm1fZHJpdmVyIGhpYm1jX2Ry
aXZlciA9IHsKPiAgCS5kZXNjCQkJPSAiaGlibWMgZHJtIGRyaXZlciIsCj4gIAkubWFqb3IJCQk9
IDEsCj4gIAkubWlub3IJCQk9IDAsCj4gKwkuZGVidWdmc19pbml0CQk9IGRybV92cmFtX21tX2Rl
YnVnZnNfaW5pdCwKPiAgCS5kdW1iX2NyZWF0ZSAgICAgICAgICAgID0gaGlibWNfZHVtYl9jcmVh
dGUsCj4gIAkuZHVtYl9tYXBfb2Zmc2V0ICAgICAgICA9IGRybV9nZW1fdnJhbV9kcml2ZXJfZHVt
Yl9tbWFwX29mZnNldCwKPiAgCS5nZW1fcHJpbWVfbW1hcAkJPSBkcm1fZ2VtX3ByaW1lX21tYXAs
Cj4gLS0gCj4gMi4yMy4wCj4gCgotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwg
SW50ZWwgQ29ycG9yYXRpb24KaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
