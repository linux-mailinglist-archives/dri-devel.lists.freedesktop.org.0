Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A92235A174
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2019 18:55:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77A226E520;
	Fri, 28 Jun 2019 16:55:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 757C66E520
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2019 16:55:34 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id w13so11619138eds.4
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2019 09:55:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=nPEsQ/InDl+e/F80mRdFMYAs+zxC+5vffAAYZOZceH8=;
 b=Zk/8cocR3PYTIVDfAyf6OD6sJr3GSLT1fXxsaPg0BWRDPT3Jw9FSwXtxjSuWJmQzz9
 yySmHjrb2DsWyIEm1rN5d072gcSjWSWxli2n8kPeJ/LzDwysr2taGdx8u9wZv4CmaUQn
 7WdtMW+oXAqsA7dmARCiskQJukNIuvuoy5lIVTELklEdCIKGYXU770tds8tzXNE0JkzN
 ObN3CC3zMl7vCUD/7QJy/x8qjnsrawV9zoh9ooHACNWfqpZIGPLg4KY/tmhNYPetTO23
 o+XdHrTMg8ty9p7SrDthbfk9FRNvZNgifTRivQ/5FPZVD1Q3mlRe7nzuM6N2M3XaRbtE
 +3tw==
X-Gm-Message-State: APjAAAUrhLvb2SoeyYDMEL6IcLrDdcMlQIv+b5WLybqSJ4la5CLOUDKD
 J+Re14MTjvK2VV5MDZ9LWsOaQw==
X-Google-Smtp-Source: APXvYqyfh35fWjOEEI/Tb3KgG8diX5tekakyWs72UBssSbinxoJ4Ig7vdrA9VoTFEWQZraBKb5gDAA==
X-Received: by 2002:a50:94a2:: with SMTP id s31mr12760884eda.290.1561740933146; 
 Fri, 28 Jun 2019 09:55:33 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id g2sm832202edg.81.2019.06.28.09.55.31
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 28 Jun 2019 09:55:32 -0700 (PDT)
Date: Fri, 28 Jun 2019 18:55:29 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 3/4] drm/hibmc: Leave struct
 drm_driver.gem_free_object_unlocked to NULL
Message-ID: <20190628165529.GU12905@phenom.ffwll.local>
References: <20190628122659.31887-1-tzimmermann@suse.de>
 <20190628122659.31887-4-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190628122659.31887-4-tzimmermann@suse.de>
X-Operating-System: Linux phenom 4.19.0-5-amd64
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=nPEsQ/InDl+e/F80mRdFMYAs+zxC+5vffAAYZOZceH8=;
 b=jwg304sOTkNk0ZyD7Cxc9gTE0mQUwkupjvOBZU09JZy68OKBg4pDk8IpJde4/x6d3d
 hjBTrAlOw2s92FAynq37LH2vcwdwbkfAnapi5glfOZKt+arUmkJ+L0IAB2TkFzjWstlJ
 rGfnLm96rrTeDFSm8iSBPlFp8xCnM/x8FG/z8=
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
Cc: maxime.ripard@bootlin.com, sam@ravnborg.org,
 dri-devel@lists.freedesktop.org, z.liuxinliang@hisilicon.com,
 kong.kongxinwei@hisilicon.com, kraxel@redhat.com, puck.chen@hisilicon.com,
 zourongrong@gmail.com, airlied@redhat.com, sean@poorly.run
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdW4gMjgsIDIwMTkgYXQgMDI6MjY6NThQTSArMDIwMCwgVGhvbWFzIFppbW1lcm1h
bm4gd3JvdGU6Cj4gVGhlIEdFTSBvYmplY3QncyBmcmVlIGZ1bmN0aW9uIGlzIG5vdyBjYWxsZWQg
dGhyb3VnaAo+IHN0cnVjdCBkcm1fZ2VtX29iamVjdF9mdW5jcy5mcmVlLgo+IAo+IFNpZ25lZC1v
ZmYtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPgo+IC0tLQo+ICBk
cml2ZXJzL2dwdS9kcm0vaGlzaWxpY29uL2hpYm1jL2hpYm1jX2RybV9kcnYuYyB8IDIgLS0KPiAg
MSBmaWxlIGNoYW5nZWQsIDIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9oaXNpbGljb24vaGlibWMvaGlibWNfZHJtX2Rydi5jIGIvZHJpdmVycy9ncHUvZHJt
L2hpc2lsaWNvbi9oaWJtYy9oaWJtY19kcm1fZHJ2LmMKPiBpbmRleCBjZTg5ZTU2OTM3YjAuLjBl
ZmNjZjM2NTEwMSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaGlzaWxpY29uL2hpYm1j
L2hpYm1jX2RybV9kcnYuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9oaXNpbGljb24vaGlibWMv
aGlibWNfZHJtX2Rydi5jCj4gQEAgLTUxLDggKzUxLDYgQEAgc3RhdGljIHN0cnVjdCBkcm1fZHJp
dmVyIGhpYm1jX2RyaXZlciA9IHsKPiAgCS5kZXNjCQkJPSAiaGlibWMgZHJtIGRyaXZlciIsCj4g
IAkubWFqb3IJCQk9IDEsCj4gIAkubWlub3IJCQk9IDAsCj4gLQkuZ2VtX2ZyZWVfb2JqZWN0X3Vu
bG9ja2VkID0KPiAtCQlkcm1fZ2VtX3ZyYW1fZHJpdmVyX2dlbV9mcmVlX29iamVjdF91bmxvY2tl
ZCwKPiAgCS5kdW1iX2NyZWF0ZSAgICAgICAgICAgID0gaGlibWNfZHVtYl9jcmVhdGUsCj4gIAku
ZHVtYl9tYXBfb2Zmc2V0ICAgICAgICA9IGRybV9nZW1fdnJhbV9kcml2ZXJfZHVtYl9tbWFwX29m
ZnNldCwKClRoaXMgb25lIGxvb2tzIGxpa2UgaXQgY291bGQgcmVtb3ZlZCB0b28/IEFuZCB0aGVu
IHlvdSBjYW4gZGl0Y2ggdGhlCkVYUE9SVF9TWU1CT0wgYW5kIGtlcm5lbGRvYyBmb3IgdGhhdCBv
bmUgdG9vIEkgdGhpbmsuIEFueXdheSBnb29kCmZvbGxvdy11cC4gT24gdGhlIHNlcmllczoKClJl
dmlld2VkLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgoKQnV0IGl0
J3MgdG9vIGhvdCBoZXJlLCBzbyBtYXliZSBvbmx5IGNvdW50IHRoYXQgYXMgYW4gYWNrIDotKQoK
Q2hlZXJzLCBEYW5pZWwKCj4gIAkuaXJxX2hhbmRsZXIJCT0gaGlibWNfZHJtX2ludGVycnVwdCwK
PiAtLSAKPiAyLjIxLjAKPiAKCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJ
bnRlbCBDb3Jwb3JhdGlvbgpodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
