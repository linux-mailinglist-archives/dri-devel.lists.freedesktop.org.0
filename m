Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 923B27DDCB
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2019 16:24:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9704F6E663;
	Thu,  1 Aug 2019 14:24:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-xc44.google.com (mail-yw1-xc44.google.com
 [IPv6:2607:f8b0:4864:20::c44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDA046E663
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Aug 2019 14:24:11 +0000 (UTC)
Received: by mail-yw1-xc44.google.com with SMTP id m16so26183646ywh.12
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Aug 2019 07:24:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=YASKrLlbJRP8fvLhH4iPtQLrp26GJFL1b4mQHAA3AZs=;
 b=LlKpvpz/XM1/onQyVtrVFuItVEMyy44WeAWmnunH/o9HC3zti/F+vcaQbDMHFQiKX7
 vUG4FlPVp+OQlN4bjxMLb4FxHQy/we0RQXzgPmxzEVj7NefIofdeN2QnkrvhLMrOCNLn
 zNHtL8KkrjYw6iwA/eGa9q0Ugup0MeIjqPeeaY0TlUbF1GmoVjbVsocQuflVRPiBGn3X
 HzaacXXraUOtasYH+VcstKNZwfvy9V2Fuf+zeoZVMAsxpr8slmYwZaNEGXSUZTBb6oF2
 f704CPhMo+cGfVVCbl//bpB4YkKgdeuiNVr+Ysx2OhdY1SF+9i/g5eJLoWgeAHmXVCLs
 N0UQ==
X-Gm-Message-State: APjAAAXQijHM1qYfYymD+sHJf2f/y+dG5Yomtk+fBQZit5F6AoyIoZnz
 f5fqFbBuu/+BfC8UHmkj7E8Slg==
X-Google-Smtp-Source: APXvYqwX5+pgDm5RwnFmpQ4KELkPqv3W0V2bu85OXQs2pia4gyCUw5jUZwHp2+qbU88Muf0rrb0reg==
X-Received: by 2002:a81:2710:: with SMTP id n16mr74951691ywn.209.1564669451110; 
 Thu, 01 Aug 2019 07:24:11 -0700 (PDT)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id m124sm16302442ywc.51.2019.08.01.07.24.10
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 01 Aug 2019 07:24:10 -0700 (PDT)
Date: Thu, 1 Aug 2019 10:24:10 -0400
From: Sean Paul <sean@poorly.run>
To: Anders Roxell <anders.roxell@linaro.org>
Subject: Re: [PATCH 1/3] drm: msm: a6xx: Mark expected switch fall-through
Message-ID: <20190801142410.GU104440@art_vandelay>
References: <20190726112746.19410-1-anders.roxell@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190726112746.19410-1-anders.roxell@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=YASKrLlbJRP8fvLhH4iPtQLrp26GJFL1b4mQHAA3AZs=;
 b=G3SrUa45PitiX3FLd4WSjcX0/D+PiaY3ftdOKTBVZWYrr05t6Z6UnYx8gHIv5sJto+
 aCH/f0iQR7qVNrhpKy4gGNgVHUVddCtXJfJ6G5eiNLeQmyBFyS+UCxErnVxgHyVOoaeB
 KeIOjIaizmbgQZPOcF/whbIjQ1fcRaRLiU33ofo953MELCgPiTphUff8t3Gd1M6ILcG3
 EGx3NN3+gzUPFQzJXVyps1G8XxykDIhvujKRCZmlQdvJlIboje1DtreCzOsY5h/o7CaE
 9JTHaJUUW/53+gdSWR3WTjlxCxO+u27XJ5mW2ayEn2CTXrJGaGE3GeicDecNjo6tfCZE
 wfWQ==
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
Cc: freedreno@lists.freedesktop.org, airlied@linux.ie,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, sean@poorly.run
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdWwgMjYsIDIwMTkgYXQgMDE6Mjc6NDZQTSArMDIwMCwgQW5kZXJzIFJveGVsbCB3
cm90ZToKPiBXaGVuIGZhbGwtdGhyb3VnaCB3YXJuaW5ncyB3YXMgZW5hYmxlZCBieSBkZWZhdWx0
IHRoZSBmb2xsb3dpbmcgd2FybmluZwo+IHdhcyBzdGFydGluZyB0byBzaG93IHVwOgo+IAo+IC4u
L2RyaXZlcnMvZ3B1L2RybS9tc20vYWRyZW5vL2E2eHhfZ3B1LmM6IEluIGZ1bmN0aW9uIOKAmGE2
eHhfc3VibWl04oCZOgo+IC4uL2RyaXZlcnMvZ3B1L2RybS9tc20vYWRyZW5vL2E2eHhfZ3B1LmM6
MTE2Ojc6IHdhcm5pbmc6IHRoaXMgc3RhdGVtZW50IG1heSBmYWxsCj4gIHRocm91Z2ggWy1XaW1w
bGljaXQtZmFsbHRocm91Z2g9XQo+ICAgICBpZiAocHJpdi0+bGFzdGN0eCA9PSBjdHgpCj4gICAg
ICAgIF4KPiAuLi9kcml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVuby9hNnh4X2dwdS5jOjExODozOiBu
b3RlOiBoZXJlCj4gICAgY2FzZSBNU01fU1VCTUlUX0NNRF9CVUY6Cj4gICAgXn5+fgo+IAo+IFJl
d29yayBzbyB0aGF0IHRoZSBjb21waWxlciBkb2Vzbid0IHdhcm4gYWJvdXQgZmFsbC10aHJvdWdo
Lgo+IAo+IEZpeGVzOiBkOTM1MTJlZjBmMGUgKCJNYWtlZmlsZTogR2xvYmFsbHkgZW5hYmxlIGZh
bGwtdGhyb3VnaCB3YXJuaW5nIikKPiBTaWduZWQtb2ZmLWJ5OiBBbmRlcnMgUm94ZWxsIDxhbmRl
cnMucm94ZWxsQGxpbmFyby5vcmc+CgpIaSBBbmRlcnMsClRoYW5rIHlvdSBmb3IgeW91ciBwYXRj
aGVzLiBKb3JkYW4gaGFkIHByZXZpb3VzbHkgc2VudCB0aGUgc2FtZSBmaXhlcyBpbgoiZHJtL21z
bTogQW5ub3RhdGUgaW50ZW50aW9uYWwgc3dpdGNoIHN0YXRlbWVudCBmYWxsIHRocm91Z2hzIiBv
bmUgZGF5IGVhcmxpZXIKdGhhbiB5b3Vycywgc28gSSdsbCBwaWNrIHVwIHRoYXQgcGF0Y2guCgpU
aGFua3MgYWdhaW4hCgpTZWFuCgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVuby9h
Nnh4X2dwdS5jIHwgMSArCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+IAo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVuby9hNnh4X2dwdS5jIGIvZHJpdmVy
cy9ncHUvZHJtL21zbS9hZHJlbm8vYTZ4eF9ncHUuYwo+IGluZGV4IGJlMzljZjAxZTUxZS4uNjQ0
YTZlZTUzZjA1IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tc20vYWRyZW5vL2E2eHhf
Z3B1LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVuby9hNnh4X2dwdS5jCj4gQEAg
LTExNSw2ICsxMTUsNyBAQCBzdGF0aWMgdm9pZCBhNnh4X3N1Ym1pdChzdHJ1Y3QgbXNtX2dwdSAq
Z3B1LCBzdHJ1Y3QgbXNtX2dlbV9zdWJtaXQgKnN1Ym1pdCwKPiAgCQljYXNlIE1TTV9TVUJNSVRf
Q01EX0NUWF9SRVNUT1JFX0JVRjoKPiAgCQkJaWYgKHByaXYtPmxhc3RjdHggPT0gY3R4KQo+ICAJ
CQkJYnJlYWs7Cj4gKwkJCS8qIEZhbGwgdGhyb3VnaCAqLwo+ICAJCWNhc2UgTVNNX1NVQk1JVF9D
TURfQlVGOgo+ICAJCQlPVVRfUEtUNyhyaW5nLCBDUF9JTkRJUkVDVF9CVUZGRVJfUEZFLCAzKTsK
PiAgCQkJT1VUX1JJTkcocmluZywgbG93ZXJfMzJfYml0cyhzdWJtaXQtPmNtZFtpXS5pb3ZhKSk7
Cj4gLS0gCj4gMi4yMC4xCj4gCgotLSAKU2VhbiBQYXVsLCBTb2Z0d2FyZSBFbmdpbmVlciwgR29v
Z2xlIC8gQ2hyb21pdW0gT1MKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
