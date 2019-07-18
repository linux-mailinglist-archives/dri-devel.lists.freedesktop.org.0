Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97B546D329
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jul 2019 19:51:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DE036E454;
	Thu, 18 Jul 2019 17:51:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-xc43.google.com (mail-yw1-xc43.google.com
 [IPv6:2607:f8b0:4864:20::c43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88FEC6E455
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2019 17:51:27 +0000 (UTC)
Received: by mail-yw1-xc43.google.com with SMTP id n205so12537941ywb.10
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2019 10:51:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=HclqU1Hi0W57E2gKsEu2RVOLJkHR4HLSFJNAFC1/Q8g=;
 b=nB3u9ohJXpbH2bqqCNN4bpbQaWRcc1GFfcgfcKi1ucaw0txLaKkI9WMdVJGkfQgmHg
 QSeO+XDVZfA8Dp1r4UwIv6b03rq5/APlDbLxgOCcHORcTG3knqBiofcSgh9cA2OuFA6Z
 K/5dpbe8ak1Vot3Q2jfsXQ1hTpyadDsucwgOFnFVwgQ/sAGSxj+LNed2tXXKEemHcxGR
 eQfMsDXt4naMdFETJSopJaPqbz/Nb2VWyugvl3IXqntn0bhkrZ000W9jF14f07L6/dP8
 lOPmLFIC/rovNosyQamrHjyNLzUhCUdcv8HlCP0Vt7WWbkS9uGqH3XOTgtVr7dXSxPLE
 oJZA==
X-Gm-Message-State: APjAAAV0W43JWo2qVfqBq93u1MI9ygV0cdszbLj75Z5H3Ra8whak6qFx
 Y8czDURselufpCAz6JU1tow+Mw==
X-Google-Smtp-Source: APXvYqz/hgPZl3J9zJ4rzgI3lHx4jd7KFLGFW7byJ9gOKdbCM4y5GD4mmEkDv1a0XOVFBA/waQ2A2g==
X-Received: by 2002:a81:23ca:: with SMTP id
 j193mr28745543ywj.332.1563472286787; 
 Thu, 18 Jul 2019 10:51:26 -0700 (PDT)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id b63sm6624338ywb.12.2019.07.18.10.51.26
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 18 Jul 2019 10:51:26 -0700 (PDT)
Date: Thu, 18 Jul 2019 13:51:26 -0400
From: Sean Paul <sean@poorly.run>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v1 07/11] drm: direct include of drm.h in
 drm_gem_shmem_helper.c
Message-ID: <20190718175126.GJ31819@art_vandelay>
References: <20190718161507.2047-1-sam@ravnborg.org>
 <20190718161507.2047-8-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190718161507.2047-8-sam@ravnborg.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=HclqU1Hi0W57E2gKsEu2RVOLJkHR4HLSFJNAFC1/Q8g=;
 b=HH0FL1tbuy7uPalwAKfC6ZHeRdaAnjcbTG9jFdzr2xbYH2DBAdmQ6Gb3M0+NvdIgNr
 41U4nFb7yULWA1ReJDB7gNtwAk6OiSbmGBqMrNsOkCY79FynHXMTRu51lPTxWDmap6Kg
 ZzFDoT/Hp+sskhyBFUd7cc+gHOehddjeuD35fJQadoMfpcxw0ngzUkp+bukgbsyFqDTc
 D1HRS48zMjajSM2IN2HSDvw+F+p9uM83hMJx/KeC6jDvY/OdYcP6pBA8CGK2UjS7WDgr
 FxOKGlekYtktN9Zu2ZDRAySgP3nnL37wl+4D/vf6V64m5LkSg/66nWDiwv/oREhIIM24
 LLGg==
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

T24gVGh1LCBKdWwgMTgsIDIwMTkgYXQgMDY6MTU6MDNQTSArMDIwMCwgU2FtIFJhdm5ib3JnIHdy
b3RlOgo+IERvIG5vdCByZWx5IG9uIGluY2x1ZGluZyBkcm0uaCBmcm9tIGRybV9maWxlLmgsCj4g
YXMgdGhlIGluY2x1ZGUgaW4gZHJtX2ZpbGUuaCB3aWxsIGJlIGRyb3BwZWQuCj4gCj4gU2lnbmVk
LW9mZi1ieTogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgoKUmV2aWV3ZWQtYnk6IFNl
YW4gUGF1bCA8c2VhbkBwb29ybHkucnVuPgoKPiBDYzogTWFhcnRlbiBMYW5raG9yc3QgPG1hYXJ0
ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNvbT4KPiBDYzogTWF4aW1lIFJpcGFyZCA8bWF4aW1l
LnJpcGFyZEBib290bGluLmNvbT4KPiBDYzogU2VhbiBQYXVsIDxzZWFuQHBvb3JseS5ydW4+Cj4g
Q2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KPiBDYzogRGFuaWVsIFZldHRlciA8
ZGFuaWVsQGZmd2xsLmNoPgo+IENjOiBFcmljIEFuaG9sdCA8ZXJpY0BhbmhvbHQubmV0Pgo+IENj
OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4KPiBDYzogUm9iIEhlcnJp
bmcgPHJvYmhAa2VybmVsLm9yZz4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fc2ht
ZW1faGVscGVyLmMgfCAxICsKPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4gCj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX3NobWVtX2hlbHBlci5jIGIvZHJp
dmVycy9ncHUvZHJtL2RybV9nZW1fc2htZW1faGVscGVyLmMKPiBpbmRleCA0NzJlYTVkODFmODIu
LjJmNjQ2NjdhYzgwNSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV9zaG1l
bV9oZWxwZXIuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX3NobWVtX2hlbHBlci5j
Cj4gQEAgLTEwLDYgKzEwLDcgQEAKPiAgI2luY2x1ZGUgPGxpbnV4L3NsYWIuaD4KPiAgI2luY2x1
ZGUgPGxpbnV4L3ZtYWxsb2MuaD4KPiAgCj4gKyNpbmNsdWRlIDxkcm0vZHJtLmg+Cj4gICNpbmNs
dWRlIDxkcm0vZHJtX2RldmljZS5oPgo+ICAjaW5jbHVkZSA8ZHJtL2RybV9kcnYuaD4KPiAgI2lu
Y2x1ZGUgPGRybS9kcm1fZ2VtX3NobWVtX2hlbHBlci5oPgo+IC0tIAo+IDIuMjAuMQo+IAoKLS0g
ClNlYW4gUGF1bCwgU29mdHdhcmUgRW5naW5lZXIsIEdvb2dsZSAvIENocm9taXVtIE9TCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
