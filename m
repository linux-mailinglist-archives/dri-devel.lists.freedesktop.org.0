Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8392010AEC1
	for <lists+dri-devel@lfdr.de>; Wed, 27 Nov 2019 12:33:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C04BF6E519;
	Wed, 27 Nov 2019 11:33:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F99F6E517
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Nov 2019 11:33:40 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id y23so133994wma.0
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Nov 2019 03:33:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=b/oO5LgHIVezHDa0lWHiVZRMYVl3WjVpcB8Rma2bE0Q=;
 b=rcK/v37K6ZDKiUo2DRtm3Yiz53IdydDgrWO+tHhXchGFgoUWm1WmKEz9gynmctwvMy
 BkT6uYOoYm1A50F09DaK7h6b6skoSDeeIPnoCfEYatwb7Y4qFKFpcn4ngGpsi7/NOIsS
 mGQgKGn6INDQc7opzmqiiY7R63n74RvISsSUyWnuh31fBgGPxyRNVolZ/vGztTq/lsWA
 PY2ZGV08dOZC7UByga0eS64g8Gjd1d3FwstHmGYl2vf6kz68z9JRcakLaNfPgM3KCGh1
 Owr8YpV4hhYnkx1YWQ4Q1xVJ8erIIyUu0bHeGECmEhC008QIkIqU/gL8X9Mw7NxDjba1
 cbiw==
X-Gm-Message-State: APjAAAWJ0ZEPniFynWr4v/P+1W2BgEvZZlftee+NZd0+y2HMF/bl5AkR
 NCsZly6P9+GxTjZeSRmFmLxEKw==
X-Google-Smtp-Source: APXvYqxdj4Cb0sM2R96ZUr1ajQFtYGm88VO/1g5Vy4S4C3IPuqYDDBKqaecA00hOMA81KjJPgvGlUg==
X-Received: by 2002:a1c:3d8a:: with SMTP id k132mr3750438wma.144.1574854418904; 
 Wed, 27 Nov 2019 03:33:38 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id m15sm18702608wrq.97.2019.11.27.03.33.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Nov 2019 03:33:38 -0800 (PST)
Date: Wed, 27 Nov 2019 12:33:36 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Yannick Fertre <yannick.fertre@st.com>
Subject: Re: [PATCH] drm/bridge/synopsys: dsi: check post disable
Message-ID: <20191127113336.GB406127@phenom.ffwll.local>
Mail-Followup-To: Yannick Fertre <yannick.fertre@st.com>,
 Philippe Cornu <philippe.cornu@st.com>,
 Benjamin Gaignard <benjamin.gaignard@st.com>,
 David Airlie <airlied@linux.ie>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 dri-devel@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <1574850165-13135-1-git-send-email-yannick.fertre@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1574850165-13135-1-git-send-email-yannick.fertre@st.com>
X-Operating-System: Linux phenom 5.3.0-2-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=b/oO5LgHIVezHDa0lWHiVZRMYVl3WjVpcB8Rma2bE0Q=;
 b=DSeeNl4igiUFnQKTSKwXvgHohVfm3OC/tKrYXjjxIPHl/mKpkRiGsJPZvB0LRQMR9/
 snerCB4pXivXSs9anz2HALpOv2YGaoW118K6PyfcfnYTaemYeB591cJoLMnYhBRclEY6
 EP2UpXz33jTdNZJF/IeZy2+EPIyJ2ogsioj3I=
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
Cc: Alexandre Torgue <alexandre.torgue@st.com>, David Airlie <airlied@linux.ie>,
 Philippe Cornu <philippe.cornu@st.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Benjamin Gaignard <benjamin.gaignard@st.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBOb3YgMjcsIDIwMTkgYXQgMTE6MjI6NDVBTSArMDEwMCwgWWFubmljayBGZXJ0cmUg
d3JvdGU6Cj4gRnJvbTogWWFubmljayBGZXJ0csOpIDx5YW5uaWNrLmZlcnRyZUBzdC5jb20+Cj4g
Cj4gU29tZSBicmlkZ2VzIGRpZCBub3QgcmVnaXN0ZXJlZCB0aGUgcG9zdF9kaXNhYmxlIGZ1bmN0
aW9uLgo+IFRvIGF2b2lkIGEgY3Jhc2gsIGNoZWNrIGl0IGJlZm9yZSBjYWxsaW5nLgo+IAo+IFNp
Z25lZC1vZmYtYnk6IFlhbm5pY2sgRmVydHJlIDx5YW5uaWNrLmZlcnRyZUBzdC5jb20+CgpSZXZp
ZXdlZC1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KCj4gLS0tCj4g
IGRyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctbWlwaS1kc2kuYyB8IDMgKystCj4g
IDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1taXBpLWRzaS5jIGIv
ZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1taXBpLWRzaS5jCj4gaW5kZXggY2M4
MDZiYS4uMWUzNzIzMyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9w
c3lzL2R3LW1pcGktZHNpLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lz
L2R3LW1pcGktZHNpLmMKPiBAQCAtODg2LDcgKzg4Niw4IEBAIHN0YXRpYyB2b2lkIGR3X21pcGlf
ZHNpX2JyaWRnZV9wb3N0X2Rpc2FibGUoc3RydWN0IGRybV9icmlkZ2UgKmJyaWRnZSkKPiAgCSAq
IFRoaXMgbmVlZHMgdG8gYmUgZml4ZWQgaW4gdGhlIGRybV9icmlkZ2UgZnJhbWV3b3JrIGFuZCB0
aGUgQVBJCj4gIAkgKiBuZWVkcyB0byBiZSB1cGRhdGVkIHRvIG1hbmFnZSBvdXIgb3duIGNhbGwg
Y2hhaW5zLi4uCj4gIAkgKi8KPiAtCWRzaS0+cGFuZWxfYnJpZGdlLT5mdW5jcy0+cG9zdF9kaXNh
YmxlKGRzaS0+cGFuZWxfYnJpZGdlKTsKPiArCWlmIChkc2ktPnBhbmVsX2JyaWRnZS0+ZnVuY3Mt
PnBvc3RfZGlzYWJsZSkKPiArCQlkc2ktPnBhbmVsX2JyaWRnZS0+ZnVuY3MtPnBvc3RfZGlzYWJs
ZShkc2ktPnBhbmVsX2JyaWRnZSk7Cj4gIAo+ICAJaWYgKGRzaS0+c2xhdmUpIHsKPiAgCQlkd19t
aXBpX2RzaV9kaXNhYmxlKGRzaS0+c2xhdmUpOwo+IC0tIAo+IDIuNy40Cj4gCgotLSAKRGFuaWVs
IFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KaHR0cDovL2Jsb2cu
ZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
