Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC0166D334
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jul 2019 19:52:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3528C6E45C;
	Thu, 18 Jul 2019 17:52:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb44.google.com (mail-yb1-xb44.google.com
 [IPv6:2607:f8b0:4864:20::b44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8D296E457
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2019 17:52:03 +0000 (UTC)
Received: by mail-yb1-xb44.google.com with SMTP id x188so6962314yba.8
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2019 10:52:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Ytxi1J+6NWcdsuePHv1vEGWkQEmEFR4ovcBSii3Z5X4=;
 b=AuARM3AZLirZ2qpTrMI/l9c35wJy5b6VT40Ihjzd+r3B2BgdT5LftkjDg6C5ETNOf4
 YblpW5nRLZ51/FVUG28JD/CA50n4/QvA4TRSCGw4ZxM0xf7cOxJbA7aFmt3+Xwr2IPyx
 bspLlJ68o86fiiCO8YnJjzfFQH5lijOLanXYug9KDlo0ZbjxuZYEEhnDHOzBYfg4gZYg
 UPPtmYkcIQFPNoqORvtOT8i23UZ64zqIRjXL/L3PBRnSy+5ivSlsejOLTuubBqr+LIOl
 egby6FgcnpyBvj74xvSWfEbCH5UFfqsjyVm4CxeXAw463PKoTZ2oxO1fJeteGxkXxYN5
 qVog==
X-Gm-Message-State: APjAAAUj+DpauFSFH8C3V1ZE/U7yK3RjY51ij3QDTaRQHZeICzR9E4VF
 +PCRGSEnqF+cpYLytb3gxE6f+w==
X-Google-Smtp-Source: APXvYqxXc2uyAAgBufPnLgYEUBonLIhhaICqxLwpJsNNFgCh2Xf1KYBy6azPnl6WFiy0oNc1vYPG0Q==
X-Received: by 2002:a25:b284:: with SMTP id k4mr31241127ybj.118.1563472322962; 
 Thu, 18 Jul 2019 10:52:02 -0700 (PDT)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id p128sm6929475ywp.24.2019.07.18.10.52.02
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 18 Jul 2019 10:52:02 -0700 (PDT)
Date: Thu, 18 Jul 2019 13:52:01 -0400
From: Sean Paul <sean@poorly.run>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v1 10/11] drm/mediatek: direct include of drm.h in
 mtk_drm_gem.c
Message-ID: <20190718175201.GM31819@art_vandelay>
References: <20190718161507.2047-1-sam@ravnborg.org>
 <20190718161507.2047-11-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190718161507.2047-11-sam@ravnborg.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Ytxi1J+6NWcdsuePHv1vEGWkQEmEFR4ovcBSii3Z5X4=;
 b=SWBkUNwOZudBXbT2gOLHDVwoeLAF4gW7eRLWLc8RCpBbf8UkED2HAwTr+JEJjeMHJk
 aeS0epOZWz7f4ug7ZVRqDNf00V/5XvUD2U/agsp/8L1Fdc6UX60pnsjZZ2jrksV1xj6M
 ZZj1NlbdD1INB2bcNpUsvambY4bJ+u4xMf4l5CgirZeeOuiAMDewiSgYMD0WrxzBnAFu
 7wjx0g3iA0FWkrSixn7pB+WD4HBQx3HTVn3H+NZuo5d1piEbfzy8FtDfa5q3uiKUvBN0
 TigWYr+dfiODy3UimTvgkQ8gxUX4y8L6oZ4JN34/unRs9FDQZG9cxfpgX5c9q3ZbHUm7
 qFjA==
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
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
 Boris Brezillon <bbrezillon@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdWwgMTgsIDIwMTkgYXQgMDY6MTU6MDZQTSArMDIwMCwgU2FtIFJhdm5ib3JnIHdy
b3RlOgo+IERvIG5vdCByZWx5IG9uIGluY2x1ZGluZyBkcm0uaCBmcm9tIGRybV9maWxlLmgsCj4g
YXMgdGhlIGluY2x1ZGUgaW4gZHJtX2ZpbGUuaCB3aWxsIGJlIGRyb3BwZWQuCj4gCj4gU2lnbmVk
LW9mZi1ieTogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgoKUmV2aWV3ZWQtYnk6IFNl
YW4gUGF1bCA8c2VhbkBwb29ybHkucnVuPgoKPiBDYzogQ0sgSHUgPGNrLmh1QG1lZGlhdGVrLmNv
bT4KPiBDYzogUGhpbGlwcCBaYWJlbCA8cC56YWJlbEBwZW5ndXRyb25peC5kZT4KPiBDYzogTWF0
dGhpYXMgQnJ1Z2dlciA8bWF0dGhpYXMuYmdnQGdtYWlsLmNvbT4KPiBDYzogbGludXgtYXJtLWtl
cm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCj4gQ2M6IGxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJh
ZGVhZC5vcmcKPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZ2VtLmMg
fCAxICsKPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4gCj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2dlbS5jIGIvZHJpdmVycy9ncHUvZHJt
L21lZGlhdGVrL210a19kcm1fZ2VtLmMKPiBpbmRleCA5NDM0Zjg4YzYzNDEuLmNhNjcyZjFkMTQw
ZCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9nZW0uYwo+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2dlbS5jCj4gQEAgLTUsNiAr
NSw3IEBACj4gIAo+ICAjaW5jbHVkZSA8bGludXgvZG1hLWJ1Zi5oPgo+ICAKPiArI2luY2x1ZGUg
PGRybS9kcm0uaD4KPiAgI2luY2x1ZGUgPGRybS9kcm1fZGV2aWNlLmg+Cj4gICNpbmNsdWRlIDxk
cm0vZHJtX2dlbS5oPgo+ICAjaW5jbHVkZSA8ZHJtL2RybV9wcmltZS5oPgo+IC0tIAo+IDIuMjAu
MQo+IAoKLS0gClNlYW4gUGF1bCwgU29mdHdhcmUgRW5naW5lZXIsIEdvb2dsZSAvIENocm9taXVt
IE9TCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
