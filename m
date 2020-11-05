Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 645882A85B3
	for <lists+dri-devel@lfdr.de>; Thu,  5 Nov 2020 19:07:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 905A86EDD8;
	Thu,  5 Nov 2020 18:07:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AE7C6EDD8
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Nov 2020 18:07:29 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id p1so2821444wrf.12
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Nov 2020 10:07:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=d1inljLFK+JaRhB9KNZIg3IoNamPlcVu2A0CttkNcBw=;
 b=OEtFpYNMWECXs8vospWA+5QAYXWVJxspuz8X8Cop2NEBzQPRcaWjzUQfKnH8wNvPg9
 PZfPCm32EFukv70xI7uVxzGI02mZS9q9tXZa8BRUZ0F1as/c5Cg+ncQpvGCzRmM48i0J
 HyzCCOYvB+38Y5tpjCr1C2CzeKDEr6RsQHuIakffEqC923AkJDk9JqxPfjeuGUICVlQP
 qtG4Ra6j/vKYXeAJq+37LhOMb/6TSiOIUFR1mq9UzI4yrzWXygixzhQ1UJJqLi9ZdUw5
 3CA0HZCjjooCTh0PhPaa5hFw8Q6NiJpgmXX9vX4fNoDfaDYqDJpHP4goZ0UHr2at61K1
 a9Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=d1inljLFK+JaRhB9KNZIg3IoNamPlcVu2A0CttkNcBw=;
 b=Ig+ez6VTcxt/zT/adsGUMGhdhjdAjdi5TDLftNg2dhFPvmRadHE2UQd2sa4dI/TsXt
 v705qGa6J5xnWUMP3P/1XQt7p6LITPWmK5ejRd+LL0Ob+eJHayAx0/GE9aHsYWAnlhv8
 Ughv+iL2eSX8XyX9XuyqfWuRxb0X8qpTj4AulECjP50cVv7vRh+uAZZXu5no9Lju1xaQ
 u3f4ZMlo39OPXM91CmAUkUhfwPLn7cEyhflGB4F4jQM3ZfXBrenD4wTl4xRPfk26PcJ/
 auQzjMO3n0nT3CrZXjlaQ2t2H7dI3oLOUvwz5agQWV90V1YeVShQjJkjgZP2xHIbP1xS
 UD9A==
X-Gm-Message-State: AOAM530+g7kzj1Fy5OvHZJR346zOga4L2uTFs+bXlPPtkQauanD2FzPo
 NkTbBuDCm1txR4uY0j2XIE5x4A==
X-Google-Smtp-Source: ABdhPJxPuM4D9vpAN18NV+Ds+4RJzWtjyP3sPDcasmK67rp1Vn8gnLSLHhoFx4XXvDsazFpPQsvsdw==
X-Received: by 2002:a5d:4ac1:: with SMTP id y1mr4545973wrs.27.1604599647755;
 Thu, 05 Nov 2020 10:07:27 -0800 (PST)
Received: from dell ([91.110.221.242])
 by smtp.gmail.com with ESMTPSA id a17sm4042380wra.61.2020.11.05.10.07.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2020 10:07:27 -0800 (PST)
Date: Thu, 5 Nov 2020 18:07:25 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH 08/19] gpu: drm: omapdrm: dss: dsi: Rework and remove a
 few unused variables
Message-ID: <20201105180725.GO4488@dell>
References: <20201105144517.1826692-1-lee.jones@linaro.org>
 <20201105144517.1826692-9-lee.jones@linaro.org>
 <74399fab-6af5-77d3-e0eb-749774eb2837@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <74399fab-6af5-77d3-e0eb-749774eb2837@ti.com>
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAwNSBOb3YgMjAyMCwgVG9taSBWYWxrZWluZW4gd3JvdGU6Cgo+IE9uIDA1LzExLzIw
MjAgMTY6NDUsIExlZSBKb25lcyB3cm90ZToKPiA+IEZpeGVzIHRoZSBmb2xsb3dpbmcgVz0xIGtl
cm5lbCBidWlsZCB3YXJuaW5nKHMpOgo+ID4gCj4gPiAgZHJpdmVycy9ncHUvZHJtL29tYXBkcm0v
ZHNzL2RzaS5jOiBJbiBmdW5jdGlvbiDigJhfZHNpX3ByaW50X3Jlc2V0X3N0YXR1c+KAmToKPiA+
ICBkcml2ZXJzL2dwdS9kcm0vb21hcGRybS9kc3MvZHNpLmM6MTEzMTo2OiB3YXJuaW5nOiB2YXJp
YWJsZSDigJhs4oCZIHNldCBidXQgbm90IHVzZWQgWy1XdW51c2VkLWJ1dC1zZXQtdmFyaWFibGVd
Cj4gPiAgZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vZHNzL2RzaS5jOiBJbiBmdW5jdGlvbiDigJhk
c2lfdXBkYXRl4oCZOgo+ID4gIGRyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL2Rzcy9kc2kuYzozOTQz
OjEwOiB3YXJuaW5nOiB2YXJpYWJsZSDigJhkaOKAmSBzZXQgYnV0IG5vdCB1c2VkIFstV3VudXNl
ZC1idXQtc2V0LXZhcmlhYmxlXQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL2Rzcy9kc2ku
YzozOTQzOjY6IHdhcm5pbmc6IHZhcmlhYmxlIOKAmGR34oCZIHNldCBidXQgbm90IHVzZWQgWy1X
dW51c2VkLWJ1dC1zZXQtdmFyaWFibGVdCj4gPiAKPiA+IENjOiBUb21pIFZhbGtlaW5lbiA8dG9t
aS52YWxrZWluZW5AdGkuY29tPgo+ID4gQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5p
ZT4KPiA+IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+Cj4gPiBDYzogTGF1cmVu
dCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPgo+ID4gQ2M6IGRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiA+IFNpZ25lZC1vZmYtYnk6IExlZSBKb25l
cyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+Cj4gPiAtLS0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vb21h
cGRybS9kc3MvZHNpLmMgfCA5ICsrLS0tLS0tLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2Vy
dGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCj4gCj4gSSdkIHVzZSAiZHJtL29tYXA6IGRzaTogIiBz
dWJqZWN0IHByZWZpeCwgdGhlIGN1cnJlbnQgb25lIGlzIGZpbmUgdG9vOgo+IAo+IFJldmlld2Vk
LWJ5OiBUb21pIFZhbGtlaW5lbiA8dG9taS52YWxrZWluZW5AdGkuY29tPgo+IAo+IFNob3VsZCBJ
IHBpY2sgdGhpcyB1cCBvciBkbyB5b3Ugd2FudCB0byBrZWVwIHRoZSBzZXJpZXMgaW50YWN0PwoK
SWYgeW91IGFyZSBpbiBhIHBvc2l0aW9uIHRvIHRha2UgaXQsIHBsZWFzZSBkbyBzby4KCkkgcmVi
YXNlIGV2ZXJ5IGRheSwgc28gaXQgd2lsbCBqdXN0IHZhbmlzaCBmcm9tIG15IHdvcmtpbmcgc2V0
LgoKLS0gCkxlZSBKb25lcyBb5p2O55C85pavXQpTZW5pb3IgVGVjaG5pY2FsIExlYWQgLSBEZXZl
bG9wZXIgU2VydmljZXMKTGluYXJvLm9yZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9yIEFy
bSBTb0NzCkZvbGxvdyBMaW5hcm86IEZhY2Vib29rIHwgVHdpdHRlciB8IEJsb2cKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
