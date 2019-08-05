Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2F90814AA
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2019 11:01:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3F346E379;
	Mon,  5 Aug 2019 09:01:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0BB56E2E1
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2019 09:01:47 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id p17so78646622ljg.1
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Aug 2019 02:01:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ofL+84/X8WTQ87INym+beTDzeijUUSg8XFUdF2WJ2nY=;
 b=jMQ/igcG+Y8P85IPsA8xFhGTZSMngT+HCPmAj3jku42MDPoFPjNnPvP4UtD3qeiwva
 o8hq9VSTmRzfUsk6UL7IhWhhzhj7aG4LHGl61OlhZEH++LzxkwV47yQInYqZV56mTP/M
 fggg2XUJLLL3zIzYkOQFcNLZZtgrW9rAMOtAlx2krQLVmBGfLd+InzOIrcWMDVTWPQzm
 vCT4znZe96JalsUHUK95WWqVfhav5zPDK9IM8gGgpo6BnAsLJyywhV1NEKsJ/R4aTVC6
 XBSqeN/0+fEa61An027fqbo7/bHlxhD7hkjlZqsWmdFcMUq0Fwp+IxfaIlFcOZh/T7mt
 qYMA==
X-Gm-Message-State: APjAAAW/Yc0ZuBDX+XfH8ob58wn6CXENFEANaxz5Sf6dikbZfOZdvGG5
 0dKMdm+Tsfxy4aVhc9ZCr14Jx9g/O//JZJFT1jVJ5kCC
X-Google-Smtp-Source: APXvYqyy6J/Oydbl1XgI8D9WR+GWwiKIDSANNwFAP8xjqs4qVcz/MsRWaN94GdaujXiAmgVlHAwCD5VXOfoYorScUgQ=
X-Received: by 2002:a2e:2c14:: with SMTP id s20mr16260537ljs.54.1564995705613; 
 Mon, 05 Aug 2019 02:01:45 -0700 (PDT)
MIME-Version: 1.0
References: <20190629125933.679-1-linus.walleij@linaro.org>
 <CACRpkdZ-6qBxzTTY4=CV+-ZmnTRPmPNAWrHMb_cMXTYdaNeYQQ@mail.gmail.com>
In-Reply-To: <CACRpkdZ-6qBxzTTY4=CV+-ZmnTRPmPNAWrHMb_cMXTYdaNeYQQ@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 5 Aug 2019 11:01:34 +0200
Message-ID: <CACRpkdaf7ZOr-ci0VnYcS=cVpmHyvQrDS2PY_tE18ZfhLfmRGA@mail.gmail.com>
Subject: Re: [PATCH 1/7] drm/msm/mdp4: Drop unused GPIO include
To: "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=ofL+84/X8WTQ87INym+beTDzeijUUSg8XFUdF2WJ2nY=;
 b=HmmKYJ7mhl+/8zgV9AOWeEOrzP4ybrJE9LPi6oF9/4j1y1StKRkLvw3DtlIUUtQwuE
 gCDxlJNM1DvxV89sqaeJ0toUIG+U4tE8sIKq5Dd/5U6w3hx5i8swa1xLCQYKyMNkXkcZ
 339+gnXSRpxc91M+kGqwLni0gcEs37hlPMyfftjiD2YsRS/RwRFoAbuG14NcUAH2iUTh
 K4CZxw1SQEirbsAbhXBwme1CPbreRdfMGuORnDUe83NO9lWk1irmvVb7FokaCIt3/yfo
 HHQm7fIHSOd7JZpxApSeRGwiKwNDJCyobxFYtzlpWJkRw6LhOwJ0dYGu7VnO6m6DTvce
 7Fow==
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
Cc: MSM <linux-arm-msm@vger.kernel.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU3VuLCBKdWwgMjgsIDIwMTkgYXQgMTI6MDIgUE0gTGludXMgV2FsbGVpaiA8bGludXMud2Fs
bGVpakBsaW5hcm8ub3JnPiB3cm90ZToKPiBPbiBTYXQsIEp1biAyOSwgMjAxOSBhdCAzOjAxIFBN
IExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz4gd3JvdGU6Cj4KPiA+IFRo
aXMgZmlsZSBpcyBub3QgdXNpbmcgYW55IHN5bWJvbHMgZnJvbSA8bGludXgvZ3Bpby5oPiBzbyBq
dXN0Cj4gPiBkcm9wIHRoaXMgaW5jbHVkZS4KPiA+Cj4gPiBDYzogUm9iIENsYXJrIDxyb2JkY2xh
cmtAZ21haWwuY29tPgo+ID4gQ2M6IFNlYW4gUGF1bCA8c2VhbkBwb29ybHkucnVuPgo+ID4gQ2M6
IGxpbnV4LWFybS1tc21Admdlci5rZXJuZWwub3JnCj4gPiBDYzogZnJlZWRyZW5vQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwo+ID4gU2lnbmVkLW9mZi1ieTogTGludXMgV2FsbGVpaiA8bGludXMud2Fs
bGVpakBsaW5hcm8ub3JnPgo+Cj4gUm9iICYgZnJpZW5kczogY2FuIHRoaXMgYmUgbWVyZ2VkIHRv
IHdoZXJldmVyIHlvdSBtZXJnZQo+IHRoZSBNU00gRFJNIHBhdGNoZXM/IElmIGl0IGlzIGluIGRy
bS1taXNjIEkgY2FuIGFwcGx5IGl0Cj4gYnV0IEkgbmVlZCBzb21lIEFDS3MuCgpQaW5nIG9uIHRo
aXMhCgpZb3VycywKTGludXMgV2FsbGVpagpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
