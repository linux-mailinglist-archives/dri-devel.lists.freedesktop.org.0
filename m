Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD36C12874
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2019 09:08:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDD7C8979F;
	Fri,  3 May 2019 07:08:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EBD78979F
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2019 07:08:22 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id e56so4819677ede.7
 for <dri-devel@lists.freedesktop.org>; Fri, 03 May 2019 00:08:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=QvBnNkRMXwHIgEa5W66EcyJWzoOFI4GvKsXrnbNGh/k=;
 b=NW5o/EMXcgytvaMlkqwisPudOf+ffZxfEX9//v8Ui2Ex/YYX3K880J0AYo9PdtyJAL
 mIiqv/xa12dUTnBWI2g/ZcSHm62p8HB+0UxVq86zAMJcKi+N1XbATXltx6isL7CoVmfD
 +7gFVrBvUK9dWanIMT2qqtTM4QWQOvBFkRRE/3Lvd5gvCQr3ACC2g2Sdcyzl8xVRzFgq
 jsrQCan3SUo9QBTTnKQcAuu+vHtclXgTUDJGO2NA2B1aegOIBx5N+1Qb9qb60zgqx+T+
 n+Dp+bJKpfUjemh4aCmh/3LyJzDZMVNZDhvXpFmgUEieyvBHsu928Zvyqr4HwXvTZF4f
 aCOg==
X-Gm-Message-State: APjAAAWgMgtw2u7VXk8ZB0gLs3n2VVVyewJPlQpDrSh0wpqL0bsqmSQH
 8IxuA2ETfO8ShlQCph0ps2u+1w==
X-Google-Smtp-Source: APXvYqxo7SgMSZQyJUvrEoLsXSwyHDr2zC9S7rlFZu9uyGtfvPyc3FZEWKgr/T/SuKYq7JCs4k45Iw==
X-Received: by 2002:a17:906:5fd7:: with SMTP id
 k23mr4759290ejv.201.1556867300753; 
 Fri, 03 May 2019 00:08:20 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id 16sm222506ejv.64.2019.05.03.00.08.19
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 03 May 2019 00:08:19 -0700 (PDT)
Date: Fri, 3 May 2019 09:08:17 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Sean Paul <sean@poorly.run>
Subject: Re: [PATCH 1/2] drm/doc: Remove atomic_state_helper.h from
 drm-kms-helpers.rst
Message-ID: <20190503070817.GD3271@phenom.ffwll.local>
References: <20190502202449.237184-1-sean@poorly.run>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190502202449.237184-1-sean@poorly.run>
X-Operating-System: Linux phenom 4.14.0-3-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=QvBnNkRMXwHIgEa5W66EcyJWzoOFI4GvKsXrnbNGh/k=;
 b=WeTnqq3IGyxt1zpef2er/4Ulm5OV/KoHrCjI5/BDjtlH2dWxE66N/WllCMwYJQGnE/
 56FZyih3Qn1KFmqCYXb2k49oM3N+OKN48fKEYqhhlkxOyi0fDkru7SDcKNFn6JbH74WJ
 O3YixJYzmZs4oOMa+XLRctsKOBJHpQQ26e5v4=
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
 dri-devel@lists.freedesktop.org, Maxime Ripard <maxime.ripard@bootlin.com>,
 Sean Paul <seanpaul@chromium.org>, Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBNYXkgMDIsIDIwMTkgYXQgMDQ6MjQ6MjlQTSAtMDQwMCwgU2VhbiBQYXVsIHdyb3Rl
Ogo+IEZyb206IFNlYW4gUGF1bCA8c2VhbnBhdWxAY2hyb21pdW0ub3JnPgo+IAo+IFRoZXJlIGFy
ZSBubyBzdHJ1Y3R1cmVkIGNvbW1lbnRzIGluIHRoZSBmaWxlLCBzbyBpdCBnZW5lcmF0ZXMgdGhp
cwo+IHdhcm5pbmcgb24gY29tcGlsYXRpb246Cj4gCj4gaW5jbHVkZS9kcm0vZHJtX2F0b21pY19z
dGF0ZV9oZWxwZXIuaDoxOiB3YXJuaW5nOiBubyBzdHJ1Y3R1cmVkIGNvbW1lbnRzIGZvdW5kCj4g
Cj4gRml4ZXM6IDllZjhhOWRjNGIyMSAoImRybTogRXh0cmFjdCBkcm1fYXRvbWljX3N0YXRlX2hl
bHBlci5baGNdIikKPiBDYzogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4Lmlu
dGVsLmNvbT4KPiBDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+Cj4g
Q2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KPiBDYzogRGFuaWVsIFZldHRlciA8
ZGFuaWVsQGZmd2xsLmNoPgo+IENjOiBNYWFydGVuIExhbmtob3JzdCA8bWFhcnRlbi5sYW5raG9y
c3RAbGludXguaW50ZWwuY29tPgo+IENjOiBNYXhpbWUgUmlwYXJkIDxtYXhpbWUucmlwYXJkQGJv
b3RsaW4uY29tPgo+IENjOiBTZWFuIFBhdWwgPHNlYW5AcG9vcmx5LnJ1bj4KPiBDYzogZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IFNpZ25lZC1vZmYtYnk6IFNlYW4gUGF1bCA8c2Vh
bnBhdWxAY2hyb21pdW0ub3JnPgoKUmV2aWV3ZWQtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52
ZXR0ZXJAZmZ3bGwuY2g+Cgo+IC0tLQo+ICBEb2N1bWVudGF0aW9uL2dwdS9kcm0ta21zLWhlbHBl
cnMucnN0IHwgMyAtLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDMgZGVsZXRpb25zKC0pCj4gCj4gZGlm
ZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZ3B1L2RybS1rbXMtaGVscGVycy5yc3QgYi9Eb2N1bWVu
dGF0aW9uL2dwdS9kcm0ta21zLWhlbHBlcnMucnN0Cj4gaW5kZXggMTQxMDJhZTAzNWRjLi5lNzgw
NGE5ZWVmOWYgMTAwNjQ0Cj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9ncHUvZHJtLWttcy1oZWxwZXJz
LnJzdAo+ICsrKyBiL0RvY3VtZW50YXRpb24vZ3B1L2RybS1rbXMtaGVscGVycy5yc3QKPiBAQCAt
NzcsOSArNzcsNiBAQCBBdG9taWMgU3RhdGUgUmVzZXQgYW5kIEluaXRpYWxpemF0aW9uCj4gIEF0
b21pYyBTdGF0ZSBIZWxwZXIgUmVmZXJlbmNlCj4gIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tCj4gIAo+IC0uLiBrZXJuZWwtZG9jOjogaW5jbHVkZS9kcm0vZHJtX2F0b21pY19zdGF0ZV9o
ZWxwZXIuaAo+IC0gICA6aW50ZXJuYWw6Cj4gLQo+ICAuLiBrZXJuZWwtZG9jOjogZHJpdmVycy9n
cHUvZHJtL2RybV9hdG9taWNfc3RhdGVfaGVscGVyLmMKPiAgICAgOmV4cG9ydDoKPiAgCj4gLS0g
Cj4gU2VhbiBQYXVsLCBTb2Z0d2FyZSBFbmdpbmVlciwgR29vZ2xlIC8gQ2hyb21pdW0gT1MKPiAK
Ci0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgpo
dHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
