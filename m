Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 447306D2DB
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jul 2019 19:36:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59DB86E440;
	Thu, 18 Jul 2019 17:36:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-xc43.google.com (mail-yw1-xc43.google.com
 [IPv6:2607:f8b0:4864:20::c43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34FBA6E440
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2019 17:36:36 +0000 (UTC)
Received: by mail-yw1-xc43.google.com with SMTP id g19so11897613ywe.2
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2019 10:36:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=GcxDt0FJq/Q5nQPNi8FyeQ+pWfJar+1/aIszgyAzxqc=;
 b=d15Zcgy/kb9IXuiJMkC6r255+ev2dej8MeR7FaorJEiTVdOz/j2f8O6yGPaOeviC3O
 OHGhPhBUaitK5h0gcsMzyFbm9oedcupgiC+9fCGzEErtPemaGK3hf1pZPVURUbh0AG+v
 0RQTqBaiNiRJzyuV2dw2qHcIG5C+svxjwy1m7HcKv+a5RTJDXrteynYi9Ln5UT5aslaE
 shjEGB4kbag1oVk9o7U8KFze23KfVx3RTbgIa8ehiNLPFgC2JYhoC32ZGYfxK0ct23sH
 SRnarKyI5YH8s1hDWrKqm1O3QEFhaQgqPMqRFo2EuYlv56o0pwxP/PrdygD05lyUwWXe
 lE6A==
X-Gm-Message-State: APjAAAUAe3whjL8GGWkpSrdYbZNhrGCPe3EJZ81YrJrrGm+f6AvEDaV3
 A2dygn/HwDK+5MfsOROEBEiRLQ==
X-Google-Smtp-Source: APXvYqy83QIZS5TdGzUNaA3dWvj2m8DDjthwvTWjojfBcTlcP/oTRJZ6UAzdGN0lxGtCHnn5fvBIoQ==
X-Received: by 2002:a81:98f:: with SMTP id 137mr30487003ywj.293.1563471395250; 
 Thu, 18 Jul 2019 10:36:35 -0700 (PDT)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id j207sm6575870ywj.35.2019.07.18.10.36.34
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 18 Jul 2019 10:36:34 -0700 (PDT)
Date: Thu, 18 Jul 2019 13:36:34 -0400
From: Sean Paul <sean@poorly.run>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v1 01/11] drm/panel: make drm_panel.h self-contained
Message-ID: <20190718173634.GD31819@art_vandelay>
References: <20190718161507.2047-1-sam@ravnborg.org>
 <20190718161507.2047-2-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190718161507.2047-2-sam@ravnborg.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=GcxDt0FJq/Q5nQPNi8FyeQ+pWfJar+1/aIszgyAzxqc=;
 b=OdFu2z7pBe3my11Ww4bUV5tI7KuWrWNF2YKs9uuWrX5z3s6d6Ad9/bXXTrJicDQm8G
 5xbcwJ8FAkd+gRq9jNEj9wSWALLA6AiPeG81ujeFQXwz1ojoSFYKHUskb/Z4XENyTRZK
 P5bVB8YZwpY8Fgpq3x4kZIeJ2+Gsx+6aky7pXn/G4SJZF/bT6D+CsqBBfvS/Hw+/MwKM
 vvoqwEayWpw0pm2dgiwIOkU5wunXHzIzy8IiSlPVSdYIXjEHc9qHq930U5w/FBzytLbr
 uqwmmKiBGQa5cLIHW9xHuQRH9fWI2Ln0+9XCAmYVfJrNz7IZlgqyQ88LeStgwHfk7JuJ
 hapA==
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
Cc: David Airlie <airlied@linux.ie>, Liviu Dudau <Liviu.Dudau@arm.com>,
 dri-devel@lists.freedesktop.org, Maxime Ripard <maxime.ripard@bootlin.com>,
 Thierry Reding <treding@nvidia.com>, Jani Nikula <jani.nikula@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
 Boris Brezillon <bbrezillon@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdWwgMTgsIDIwMTkgYXQgMDY6MTQ6NTdQTSArMDIwMCwgU2FtIFJhdm5ib3JnIHdy
b3RlOgo+IEZyb206IEphbmkgTmlrdWxhIDxqYW5pLm5pa3VsYUBpbnRlbC5jb20+Cj4gCj4gRml4
IGJ1aWxkIHdhcm5pbmcgaWYgZHJtX3BhbmVsLmggaXMgYnVpbHQgd2l0aCBDT05GSUdfT0Y9biBv
cgo+IENPTkZJR19EUk1fUEFORUw9biBhbmQgaW5jbHVkZWQgd2l0aG91dCB0aGUgcHJlcmVxdWlz
aXRlIGVyci5oOgo+IAo+IC4vaW5jbHVkZS9kcm0vZHJtX3BhbmVsLmg6IEluIGZ1bmN0aW9uIOKA
mG9mX2RybV9maW5kX3BhbmVs4oCZOgo+IC4vaW5jbHVkZS9kcm0vZHJtX3BhbmVsLmg6MjAzOjk6
IGVycm9yOiBpbXBsaWNpdCBkZWNsYXJhdGlvbiBvZiBmdW5jdGlvbiDigJhFUlJfUFRS4oCZIFst
V2Vycm9yPWltcGxpY2l0LWZ1bmN0aW9uLWRlY2xhcmF0aW9uXQo+ICAgcmV0dXJuIEVSUl9QVFIo
LUVOT0RFVik7Cj4gICAgICAgICAgXn5+fn5+fgo+IC4vaW5jbHVkZS9kcm0vZHJtX3BhbmVsLmg6
MjAzOjk6IGVycm9yOiByZXR1cm5pbmcg4oCYaW504oCZIGZyb20gYSBmdW5jdGlvbiB3aXRoIHJl
dHVybiB0eXBlIOKAmHN0cnVjdCBkcm1fcGFuZWwgKuKAmSBtYWtlcyBwb2ludGVyIGZyb20gaW50
ZWdlciB3aXRob3V0IGEgY2FzdCBbLVdlcnJvcj1pbnQtY29udmVyc2lvbl0KPiAgIHJldHVybiBF
UlJfUFRSKC1FTk9ERVYpOwo+ICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn4KPiAKPiBGaXhlczog
NWZhOGU0YTIyMTgyICgiZHJtL3BhbmVsOiBNYWtlIG9mX2RybV9maW5kX3BhbmVsKCkgcmV0dXJu
IGFuIEVSUl9QVFIoKSBpbnN0ZWFkIG9mIE5VTEwiKQo+IENjOiBCb3JpcyBCcmV6aWxsb24gPGJv
cmlzLmJyZXppbGxvbkBib290bGluLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBKYW5pIE5pa3VsYSA8
amFuaS5uaWt1bGFAaW50ZWwuY29tPgo+IEFja2VkLWJ5OiBUaGllcnJ5IFJlZGluZyA8dHJlZGlu
Z0BudmlkaWEuY29tPgo+IFJldmlld2VkLWJ5OiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5v
cmc+CgpSZXZpZXdlZC1ieTogU2VhbiBQYXVsIDxzZWFuQHBvb3JseS5ydW4+Cgo+IC0tLQo+ICBp
bmNsdWRlL2RybS9kcm1fcGFuZWwuaCB8IDEgKwo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKykKPiAKPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vZHJtX3BhbmVsLmggYi9pbmNsdWRl
L2RybS9kcm1fcGFuZWwuaAo+IGluZGV4IDhjNzM4YzBlNmU5Zi4uMjYzNzc4MzYxNDFjIDEwMDY0
NAo+IC0tLSBhL2luY2x1ZGUvZHJtL2RybV9wYW5lbC5oCj4gKysrIGIvaW5jbHVkZS9kcm0vZHJt
X3BhbmVsLmgKPiBAQCAtMjQsNiArMjQsNyBAQAo+ICAjaWZuZGVmIF9fRFJNX1BBTkVMX0hfXwo+
ICAjZGVmaW5lIF9fRFJNX1BBTkVMX0hfXwo+ICAKPiArI2luY2x1ZGUgPGxpbnV4L2Vyci5oPgo+
ICAjaW5jbHVkZSA8bGludXgvZXJybm8uaD4KPiAgI2luY2x1ZGUgPGxpbnV4L2xpc3QuaD4KPiAg
Cj4gLS0gCj4gMi4yMC4xCj4gCgotLSAKU2VhbiBQYXVsLCBTb2Z0d2FyZSBFbmdpbmVlciwgR29v
Z2xlIC8gQ2hyb21pdW0gT1MKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
