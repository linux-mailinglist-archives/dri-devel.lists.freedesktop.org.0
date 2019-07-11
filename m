Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDDE565A8B
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jul 2019 17:35:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB9366E176;
	Thu, 11 Jul 2019 15:35:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-xc43.google.com (mail-yw1-xc43.google.com
 [IPv6:2607:f8b0:4864:20::c43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA2AA6E176
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jul 2019 15:35:44 +0000 (UTC)
Received: by mail-yw1-xc43.google.com with SMTP id z197so4059489ywd.13
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jul 2019 08:35:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=y1sGbjP5JcON7yUjLcE+tLYokrqEYZhCCXQUdk3dTig=;
 b=ktjtOfuX3XAw6+uqP5BvAIHv6TwSGVblVCx0BhaPmyHdN9UHg1pgL/IXXN9L172gmc
 RvRD8nR/p5M3sK3DPmyMf/9NBVIqBTj+dZ+zrtbhGGJCpQU3dL5+vVKpvXO54krBTJY1
 24gydAzgKE+shtEKjSoU4FB4qyghDhPRVZRCI9sqeRj2mbLOxi2z5wcQpC6Kl3saLnDg
 DC8RJbe1rIjdp5WASxF7DflU50jAPyUdNOCBm9rv/WSGvOPgg/SJPjogzHOsR/Ep/ktJ
 VR5N7IyaatF2N0U9VlM+ffFn7YTdKunG91X3qu1m5aDCvCOgLpva8u+lpAtmtaJc00nH
 OZeA==
X-Gm-Message-State: APjAAAUazEVfsi2Y5+hfqMQBTZ7B6KwyXrYXNi4x0jZtI1LWb64Bgr+s
 ey4NC/wRJEO2UPXxwYRIvg/Vqg==
X-Google-Smtp-Source: APXvYqwQr8nVyLIiObgtRjIxbGUxESuzrZdHwMvpkJMPKWN9dmsPd6qd4FahPeWIz6d1NIsoOUYLIA==
X-Received: by 2002:a81:7dc6:: with SMTP id y189mr2436377ywc.162.1562859344042; 
 Thu, 11 Jul 2019 08:35:44 -0700 (PDT)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id a203sm1365197ywe.69.2019.07.11.08.35.43
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 11 Jul 2019 08:35:43 -0700 (PDT)
Date: Thu, 11 Jul 2019 11:35:43 -0400
From: Sean Paul <sean@poorly.run>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH 1/5] drm/fb-helper: Include prototype for
 drm_fb_helper_modinit()
Message-ID: <20190711153543.GC136584@art_vandelay>
References: <20190710125143.9965-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190710125143.9965-1-ville.syrjala@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=y1sGbjP5JcON7yUjLcE+tLYokrqEYZhCCXQUdk3dTig=;
 b=ROkwwpsxXFkqXiaCXDw7rRXgKAk+8zwDN4gO4xBiKyBXDrAafxNlbFoMdxJN6L/fIc
 NRpcSLJ3dFFec35B9wsylpfKXskAzxLkMH+h881wYsWxrcNUkhdlqA1LhejqeGCQowbs
 pRZ9GVqXD9eBEJxEm6lAKG9RQckDxg3k8B76YdO7HecSErBLIRcQ/T4J2Li6gr3MUkzL
 em4whgCpS6dq0jDsyj5+Ovbmq942D2xEd6WyASpuojPEQmPIp3hsXUgLhUv4MBKhK8L7
 FAY9wOegG3ut9fIgbM1DAWd3F9k1upHmF640d1cHdrk+O1jNJXR/DfEpRTz5l4aV34BP
 KGPg==
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdWwgMTAsIDIwMTkgYXQgMDM6NTE6MzlQTSArMDMwMCwgVmlsbGUgU3lyamFsYSB3
cm90ZToKPiBGcm9tOiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwu
Y29tPgo+IAo+IFNwYXJzZSBjb21wbGFpbnM6Cj4gZHJpdmVycy9ncHUvZHJtL2RybV9mYl9oZWxw
ZXIuYzoyNDA5OjEyOiB3YXJuaW5nOiBzeW1ib2wgJ2RybV9mYl9oZWxwZXJfbW9kaW5pdCcgd2Fz
IG5vdCBkZWNsYXJlZC4gU2hvdWxkIGl0IGJlIHN0YXRpYz8KPiAKPiBJbmNsdWRlIHRoZSBoZWFk
ZXIgd2l0aCB0aGUgY29ycmVjdCBwcm90b3R5cGUuCj4gCj4gU2lnbmVkLW9mZi1ieTogVmlsbGUg
U3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KClJldmlld2VkLWJ5OiBT
ZWFuIFBhdWwgPHNlYW5AcG9vcmx5LnJ1bj4KCj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9kcm1f
ZmJfaGVscGVyLmMgfCAxICsKPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4gCj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZmJfaGVscGVyLmMgYi9kcml2ZXJzL2dw
dS9kcm0vZHJtX2ZiX2hlbHBlci5jCj4gaW5kZXggYTdiYTViNDkwMmQ2Li5iNzVhZTg1NTViYWYg
MTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9mYl9oZWxwZXIuYwo+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9kcm1fZmJfaGVscGVyLmMKPiBAQCAtNDYsNiArNDYsNyBAQAo+ICAjaW5j
bHVkZSA8ZHJtL2RybV9wcmludC5oPgo+ICAjaW5jbHVkZSA8ZHJtL2RybV92YmxhbmsuaD4KPiAg
Cj4gKyNpbmNsdWRlICJkcm1fY3J0Y19oZWxwZXJfaW50ZXJuYWwuaCIKPiAgI2luY2x1ZGUgImRy
bV9pbnRlcm5hbC5oIgo+ICAKPiAgc3RhdGljIGJvb2wgZHJtX2ZiZGV2X2VtdWxhdGlvbiA9IHRy
dWU7Cj4gLS0gCj4gMi4yMS4wCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVsCgotLSAKU2VhbiBQYXVsLCBTb2Z0d2FyZSBFbmdpbmVlciwgR29v
Z2xlIC8gQ2hyb21pdW0gT1MKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
