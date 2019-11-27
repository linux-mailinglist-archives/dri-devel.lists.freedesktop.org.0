Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BE5A10B549
	for <lists+dri-devel@lfdr.de>; Wed, 27 Nov 2019 19:10:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB2496E44A;
	Wed, 27 Nov 2019 18:10:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7C1F6E44A
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Nov 2019 18:10:37 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id s14so1853599wmh.4
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Nov 2019 10:10:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=cbv/8/r3sfhd+NMk4eKHS1W+CsksoJnBQ/vFeBDEews=;
 b=iaCrf5NVAXS4jxbaAyi6aZTjp3zaGHQHs8kOlnc3LLflQdzoghTgQ6NdXshilMMHog
 thechcDFR7UVsl8CGrCk3CkM5mryrlOy7sUNW09Zx4w7kKD6dBykcXkOHSVv3kSMyze4
 cR7yQaT/K9TKdV5TWCGXUBNGebtpEG3US2uGgNsJ2ejiEGtwt/aiUQVHfdpXM73bbwwP
 RBckKzLTAWtl4cIfsX1uy5rdHlmuUUS9FPuC4VPzdu7ieUeUYwaaoYz6vrFMVswMMzd7
 ee1MC2K/ZcFr+bL1C32KyfIvs4ZjwJhLbY+AKch5yZjwfrhTThJa4EcUdPgUDJPSivOJ
 m+dA==
X-Gm-Message-State: APjAAAUTOseCDJmHOmaHm4dR0CG82dcnzClyjMm0OHEDGnSKao4t5yYd
 eJpc+aATspcILTOC4Ng+8WFU1A==
X-Google-Smtp-Source: APXvYqzT8jaNqsYVNrsvu4LEeci1CDFvdEtIFSjKTmi0obdbFp5KUyHs9EfQvXEQTmYckN8AwBDGHw==
X-Received: by 2002:a05:600c:2257:: with SMTP id
 a23mr5940479wmm.143.1574878236283; 
 Wed, 27 Nov 2019 10:10:36 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id g11sm7742001wmh.27.2019.11.27.10.10.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Nov 2019 10:10:35 -0800 (PST)
Date: Wed, 27 Nov 2019 19:10:33 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Mihail Atanassov <Mihail.Atanassov@arm.com>
Subject: Re: [PATCH] drm/mediatek: Fix build break
Message-ID: <20191127181033.GF406127@phenom.ffwll.local>
Mail-Followup-To: Mihail Atanassov <Mihail.Atanassov@arm.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 nd <nd@arm.com>, CK Hu <ck.hu@mediatek.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20191127170513.42251-1-mihail.atanassov@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191127170513.42251-1-mihail.atanassov@arm.com>
X-Operating-System: Linux phenom 5.3.0-2-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=cbv/8/r3sfhd+NMk4eKHS1W+CsksoJnBQ/vFeBDEews=;
 b=EUqC/uYyOQLRXEtsbXGbq5CLVRefhyQ+qJRAcGcsLyvHr6z7hJsxzKw6xqplaCJ7oW
 2vGwh6hRhxvmaeycEjkOAoLO6jgGGXS1+FEW2lE1eHsWd3mxTu694LM41fWeoIpBH7Vg
 YhUg+vlDlYJk9n5tYVNZtLLEKm/64IfgV4D5I=
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
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 nd <nd@arm.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBOb3YgMjcsIDIwMTkgYXQgMDU6MDU6MzJQTSArMDAwMCwgTWloYWlsIEF0YW5hc3Nv
diB3cm90ZToKPiBDYXVzZWQgYnkgZmlsZSByZW1vdmFsIHdpdGhvdXQgYWRqdXN0aW5nIHRoZSBN
YWtlZmlsZS4KPiAKPiBGaXhlczogZDI2OGY0MmU2ODU2ICgiZHJtL21lZGlhdGVrOiBkb24ndCBv
cGVuLWNvZGUgZHJtX2dlbV9mYl9jcmVhdGUiKQo+IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwu
dmV0dGVyQGZmd2xsLmNoPgo+IENjOiBDSyBIdSA8Y2suaHVAbWVkaWF0ZWsuY29tPgo+IENjOiBQ
aGlsaXBwIFphYmVsIDxwLnphYmVsQHBlbmd1dHJvbml4LmRlPgo+IENjOiBNYXR0aGlhcyBCcnVn
Z2VyIDxtYXR0aGlhcy5iZ2dAZ21haWwuY29tPgo+IENjOiBsaW51eC1hcm0ta2VybmVsQGxpc3Rz
LmluZnJhZGVhZC5vcmcKPiBDYzogbGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwo+
IFNpZ25lZC1vZmYtYnk6IE1paGFpbCBBdGFuYXNzb3YgPG1paGFpbC5hdGFuYXNzb3ZAYXJtLmNv
bT4KCkRyYXQsIGtidWlsZCBzdGlsbCBzdWNrcyBpZiB5b3UgZG9udCBkbyBhIGNsZWFuIHJlYnVp
bGQgOi0vCgpUaGFua3MgZm9yIHRoZSBwYXRjaCwgSSBwdXNoZWQgaXQuCi1EYW5pZWwKPiAtLS0K
PiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL01ha2VmaWxlIHwgMSAtCj4gIDEgZmlsZSBjaGFu
Z2VkLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRp
YXRlay9NYWtlZmlsZSBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9NYWtlZmlsZQo+IGluZGV4
IDgwNjdhNGJlODMxMS4uNTA0NGRmYjhlM2Q2IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9tZWRpYXRlay9NYWtlZmlsZQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9NYWtl
ZmlsZQo+IEBAIC03LDcgKzcsNiBAQCBtZWRpYXRlay1kcm0teSA6PSBtdGtfZGlzcF9jb2xvci5v
IFwKPiAgCQkgIG10a19kcm1fZGRwLm8gXAo+ICAJCSAgbXRrX2RybV9kZHBfY29tcC5vIFwKPiAg
CQkgIG10a19kcm1fZHJ2Lm8gXAo+IC0JCSAgbXRrX2RybV9mYi5vIFwKPiAgCQkgIG10a19kcm1f
Z2VtLm8gXAo+ICAJCSAgbXRrX2RybV9wbGFuZS5vIFwKPiAgCQkgIG10a19kc2kubyBcCj4gLS0g
Cj4gMi4yMy4wCj4gCgotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwg
Q29ycG9yYXRpb24KaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
