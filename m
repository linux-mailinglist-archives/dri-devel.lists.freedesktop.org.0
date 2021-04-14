Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C57735EED4
	for <lists+dri-devel@lfdr.de>; Wed, 14 Apr 2021 10:06:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A9746E14C;
	Wed, 14 Apr 2021 08:06:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08FCF6E14C
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Apr 2021 08:06:49 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id
 f2-20020a17090a4a82b02900c67bf8dc69so12089085pjh.1
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Apr 2021 01:06:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=q9984cqzokao90tfGIrsxyiVIENON1Jfg91EKnCdof8=;
 b=fW80R42TJsY77DRXQCzB9SKLcnXcPGFlu4lBTxcOlTPXkbLueFvuA39mPoRWpgxGZF
 S+MadSGXRh3tyq8byLtrkINS+a+tgsH/0sKoMiriG08wQrsSYXAbSTuA44AsiZo2eTDz
 Br0zZj/hKm98rMUtUxyKbXKWVkAZs2TO8sqPzTbPAAQweb1J4V7Ru0N+JZJzWQswIriJ
 c0PEB7f1qsOVjGQnAob6UMrvph7Av6/H3wvhbGJ6JOqVFMVS+eN8/A3Ls08fVv7+eGPR
 eCEjlpmZnaFrBvb0FE0xNx3ybIoJX81tLvuEEQKXjiUf4kS6dau3jWUQFtgjBGemH8CB
 1whw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=q9984cqzokao90tfGIrsxyiVIENON1Jfg91EKnCdof8=;
 b=onoJYySqWqqbh5eX6oIDaxJe8r8blRgCmZS1sCe4LIHMRrdV3nIGbfHKYGzqZXEZ44
 V204zGtjU7jC3buhSvHXJFDQ9RBi8ZtJofcBWqdzkCCh+7imDgJYPhmPZgYm/2yThA9U
 RuwTuBge7gc5A/5ezlgSoogeJmRVuenpRMkErIFd7utn3mlZaPRRGeouxjg6efcsec5l
 Pg71jhP5iE+xSpeRd+DJDZKY/k+VOG6UOYEWSR7Zs+38Uw3KvaTpgFef8epF2XCNNefj
 d2YY4NOkVi2G71zxV0tRzDt+6Dgk6QVQt+MVJVrbDCrEl7qNWrBP8qvfweBqHMmviPI8
 Um5Q==
X-Gm-Message-State: AOAM533+lRQZciLRpWXTOXEHerZW39iRJzFphTZ6uC9+HIAwi9bpLqFn
 ifu6J7GQHVcng4ynlmWs8d+o2PkIXS64ruK+bPWjiAGa7fcyaQ==
X-Google-Smtp-Source: ABdhPJzEWdIhOr7juz3mZ7xnpTDpVDqoUyigBSUjrTKxFSeTivxg/jTYsNfrdGnGl+vl1J1spSTLtTsmuk227wJ+yOk=
X-Received: by 2002:a17:90a:4a8f:: with SMTP id
 f15mr2306382pjh.19.1618387608629; 
 Wed, 14 Apr 2021 01:06:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210412154648.3719153-1-narmstrong@baylibre.com>
 <20210412154648.3719153-3-narmstrong@baylibre.com>
 <CAG3jFysFb+y6ymXsBQatuwtPEYRTBnWTku0EpmNyR2gR5a=Y2w@mail.gmail.com>
 <3266977b-9d19-c81d-6fd7-b6fa0714b1ef@baylibre.com>
In-Reply-To: <3266977b-9d19-c81d-6fd7-b6fa0714b1ef@baylibre.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Wed, 14 Apr 2021 10:06:37 +0200
Message-ID: <CAG3jFysp+3__TfEyvKSf47q3nYsdRSbkb9LxX2pcJr356yAgKw@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] drm: bridge: add it66121 driver
To: Neil Armstrong <narmstrong@baylibre.com>
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: Phong LE <ple@baylibre.com>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Jonas Karlman <jonas@kwiboo.se>, linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, paul@crapouillou.net,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAxNCBBcHIgMjAyMSBhdCAwODoxMywgTmVpbCBBcm1zdHJvbmcgPG5hcm1zdHJvbmdA
YmF5bGlicmUuY29tPiB3cm90ZToKPgo+IEhpIFJvYiwKPgo+IExlIDEzLzA0LzIwMjEgw6AgMjI6
MjEsIFJvYmVydCBGb3NzIGEgw6ljcml0IDoKPiA+IEhleSBOZWlsICYgUGhvbmcsCj4gPgo+ID4g
VGhhbmtzIGZvciBzdWJtaXR0aW5nIHRoaXMgc2VyaWVzIQo+ID4KPiA+PiArCj4gPj4gK3N0YXRp
YyBjb25zdCBzdHJ1Y3QgZHJtX2JyaWRnZV9mdW5jcyBpdDY2MTIxX2JyaWRnZV9mdW5jcyA9IHsK
PiA+PiArICAgICAgIC5hdHRhY2ggPSBpdDY2MTIxX2JyaWRnZV9hdHRhY2gsCj4gPj4gKyAgICAg
ICAuZW5hYmxlID0gaXQ2NjEyMV9icmlkZ2VfZW5hYmxlLAo+ID4+ICsgICAgICAgLmRpc2FibGUg
PSBpdDY2MTIxX2JyaWRnZV9kaXNhYmxlLAo+ID4+ICsgICAgICAgLm1vZGVfc2V0ID0gaXQ2NjEy
MV9icmlkZ2VfbW9kZV9zZXQsCj4gPj4gKyAgICAgICAubW9kZV92YWxpZCA9IGl0NjYxMjFfYnJp
ZGdlX21vZGVfdmFsaWQsCj4gPj4gKyAgICAgICAuZGV0ZWN0ID0gaXQ2NjEyMV9icmlkZ2VfZGV0
ZWN0LAo+ID4+ICsgICAgICAgLmdldF9lZGlkID0gaXQ2NjEyMV9icmlkZ2VfZ2V0X2VkaWQsCj4g
Pj4gKyAgICAgICAuYXRvbWljX2dldF9vdXRwdXRfYnVzX2ZtdHMgPSBpdDY2MTIxX2JyaWRnZV9h
dG9taWNfZ2V0X291dHB1dF9idXNfZm10cywKPiA+PiArICAgICAgIC5hdG9taWNfZ2V0X2lucHV0
X2J1c19mbXRzID0gaXQ2NjEyMV9icmlkZ2VfYXRvbWljX2dldF9pbnB1dF9idXNfZm10cywKPiA+
PiArfTsKPiA+Cj4gPiBJIHdvdWxkIGxpa2UgdG8gc2VlIGFuIGltcGxlbWVudGF0aW9uIG9mIEhQ
RCwgc2luY2UgaXQgaXMgc3VwcG9ydGVkIGJ5Cj4gPiB0aGUgaGFyZHdhcmVbMV0gKGFuZCByZXF1
aXJlZCBieSB0aGUgZG9jdW1lbnRhdGlvbikuIElSUSBzdGF0dXMgYml0IDAKPiA+IHNlZW1zIHRv
IGJlIHRoZSByZXNwb25zaWJsZSBmb3Igbm90aWZ5aW5nIHVzIGFib3V0IGhvdCBwbHVnIGRldGVj
dGlvbgo+ID4gZXZlbnRzLgo+Cj4gSXQncyBpbXBsZW1lbnRlZCBpbiB0aGUgSVJRIGhhbmRsZXIg
d2l0aCB0aGUgSVQ2NjEyMV9JTlRfU1RBVFVTMV9IUERfU1RBVFVTIGV2ZW50Lgo+CgpJIGRpZG4n
dCBldmVuIGdldCB0aGF0IGZhciA6KQoKRWl0aGVyIHdheSwgdGhlIEhQRCBzdXBwb3J0IHNob3Vs
ZCBiZSBleHBvc2VkIGluIGRybV9icmlkZ2VfZnVuY3MKKC5ocGRfZW5hYmxlLCAuaHBkX2Rpc2Fi
bGUgKGFuZCBwb3NzaWJseSAuaHBkX25vdGlmeSkpIGFuZApkcm1fYnJpZGdlLm9wcyAoRFJNX0JS
SURHRV9PUF9IUEQpLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWwK
