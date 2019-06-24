Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 28E4251F13
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2019 01:24:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDA8889EB4;
	Mon, 24 Jun 2019 23:24:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9FC089EB4
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 23:24:37 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id j2so8369076pfe.6
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 16:24:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=97J2mQ8W9rxbq9xESMLvP971OTTkTA5uAArzuGfjVX8=;
 b=W06CDN5ZRduCAMobqK49HnGdyO6ycRbfZlV06mo1x6FDTFWJ6Csq76dYMHN/pEafUS
 TPENoeTSwamIDJC0AUT2iWeIIJOZTqbYXYTooMPLVaui/qwqC7d2m0kFGMLCDBeWBUm2
 UdX8dTdM5bIW1XzI1fWURfML2RdPLv2QBdrJPezD7mdMXhfEIZTPUuBxGSoC1xI0Fe0S
 1LvtPWJKMt6NUyxQnXt+lZH4pDmjysrqOxOATmrU1OnvanN55igzKOuhbHM3nx9c6Sw6
 7WtinoZDHPcgnRTr56KvYGEyAI4WI6jvDGdHB5kvdj+qwfgSJuR6d0I6NyWoP7y1YpYN
 Tunw==
X-Gm-Message-State: APjAAAWsbbyFstNS7/zn527qlKB14dGmOZh7WcDY+4EgP7cElQ9XXoWc
 DF4w5Lj7BhDyJMwPPi7QtpMvw6ZEbhQkMw==
X-Google-Smtp-Source: APXvYqyJ4qa0FiXJgxfwOsACg9uzcWq9QV35TxSpj/Rhhn6aABo5DnNey+XA0cB/QHxSOT2N21tfLw==
X-Received: by 2002:a63:f746:: with SMTP id f6mr11806300pgk.56.1561418677315; 
 Mon, 24 Jun 2019 16:24:37 -0700 (PDT)
Received: from localhost ([2601:602:9200:a1a5:559b:6f10:667f:4354])
 by smtp.googlemail.com with ESMTPSA id q1sm15808527pfn.178.2019.06.24.16.24.36
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 24 Jun 2019 16:24:36 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Julien Masson <jmasson@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 0/9] drm: meson: global clean-up (use proper macros,
 update comments ...)
In-Reply-To: <86zhm782g5.fsf@baylibre.com>
References: <86zhm782g5.fsf@baylibre.com>
Date: Mon, 24 Jun 2019 16:24:35 -0700
Message-ID: <7ho92mwor0.fsf@baylibre.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version;
 bh=97J2mQ8W9rxbq9xESMLvP971OTTkTA5uAArzuGfjVX8=;
 b=q/WqUD0hfVCG+bMiazVQEDX1BfPkf+2pUEhLqUL0KLAh7VEB54OkzB4glqfypnW1Vi
 JYJHp7jpzLg8iCwrFF4v9i/wNJm0f4KFcLQn2sJ+65DRtI/W2kniOHzCpcUcm9igWdgB
 4VwveWtICtwDSWbVZWAsrL2oDMD/CSjIOF6h5EimvwMtoi0Gy7GQSmI747P+E0aqeKVs
 jebJ/M3g/YzXrFslWpv5ExSiZtx6pQpkHlzCZyha0zeDRNp9IWXOCNhfVRrpF4PvsDD/
 j1flPIXcRJ4r0HQZc1LMMFO7T8dMliZD6E3xJUjuLbqCvastIIG3Wl03BdjT3a1sUiSz
 KNrA==
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
Cc: Julien Masson <jmasson@baylibre.com>, linux-amlogic@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SnVsaWVuIE1hc3NvbiA8am1hc3NvbkBiYXlsaWJyZS5jb20+IHdyaXRlczoKCj4gVGhpcyBwYXRj
aCBzZXJpZXMgYWltcyB0byBjbGVhbi11cCBkaWZmZXJlbnRzIHBhcnRzIG9mIHRoZSBkcm0gbWVz
b24KPiBjb2RlIHNvdXJjZS4KPgo+IENvdXBsZSBtYWNyb3MgaGF2ZSBiZWVuIGRlZmluZWQgYW5k
IHVzZWQgdG8gc2V0IHNldmVyYWwgcmVnaXN0ZXJzCj4gaW5zdGVhZCBvZiB1c2luZyBtYWdpYyBj
b25zdGFudHMuCj4KPiBJIGFsc28gdG9vayB0aGUgb3Bwb3J0dW5pdHkgdG86Cj4gLSBhZGQvcmVt
b3ZlL3VwZGF0ZSBjb21tZW50cwo+IC0gcmVtb3ZlIHVzZWxlc3MgY29kZQo+IC0gbWlub3IgZml4
L2ltcHJvdm1lbnQKCk5pY2Ugc2V0IG9mIGNsZWFudXBzLCB0aGFua3MhICBJIGVzcGVjaWFsbHkg
bGlrZSB0aGUgZXh0cmEgaW4tY29kZQpjb21tZW50cy4KCkNvdWxkIHlvdSBhbHNvIGFkZCB0byB0
aGUgY292ZXItbGV0dGVyIGhvdyB0aGlzIHdhcyB0ZXN0ZWQsIGFuZCBvbiB3aGF0CnBsYXRmb3Jt
cyBzbyB3ZSBrbm93IGl0J3Mgbm90IGdvaW5nIHRvIGludHJvZHVjZSBhbnkgcmVncmVzc2lvbnMu
CgpUaGFua3MsCgpLZXZpbgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
