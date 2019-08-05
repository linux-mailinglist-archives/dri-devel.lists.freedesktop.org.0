Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 071E281BB3
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2019 15:16:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C769A6E437;
	Mon,  5 Aug 2019 13:16:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A4136E42C
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2019 13:16:37 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id 31so84414959wrm.1
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Aug 2019 06:16:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=aboHDvQ6ED+izD2UcWUy5SYRhwe6k8n3aFGpiqq6F94=;
 b=Y6LrPN2o7p7XmPOSYMdhTqdLveH2KdwVEc9cGGCe19X+UUK2+zuUSyFYAo+4lhzURG
 MyEjweO/fZW5QfSiTPYjtM7i9f18mYPi1+8WkNvseZlDG+h57H1dVNWzNIR9T+T0XkAo
 1084/PTqMw3yMiVYuvvk5f9EsYSYL3GruZH6z9zLP8Lc41pqJ3hid/SY8hHQmOTEoBi/
 43DoTGLP0oEtD9HrYw6nSjMwYQQII27XKH9e73Cw2limqicTv3MJuig/ztZoBy4LFZV3
 oDhcwDExET1J0SsJivvoyjyBoX327DoUdSEXGd8YZwnnfzCm7WyrgY/7dmTIdkHn05wf
 5c3A==
X-Gm-Message-State: APjAAAWcOT9KrquGCpL5J9pKgIBPVJMm8Ed6tcS8R7vhKarX90nnt0Tb
 44fLLplkl7YASiBhKWh162M=
X-Google-Smtp-Source: APXvYqzjHltu287XVkm0ryMGRX0Isuk446ECENvX2h1IZhSqC098PAq939JkQVreUtJBofYhKAusxA==
X-Received: by 2002:a5d:60c5:: with SMTP id x5mr74740880wrt.253.1565010995650; 
 Mon, 05 Aug 2019 06:16:35 -0700 (PDT)
Received: from arch-x1c3 ([2a00:5f00:102:0:9665:9cff:feee:aa4d])
 by smtp.gmail.com with ESMTPSA id m7sm71200354wrx.65.2019.08.05.06.16.33
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 05 Aug 2019 06:16:34 -0700 (PDT)
Date: Mon, 5 Aug 2019 14:15:55 +0100
From: Emil Velikov <emil.l.velikov@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v1 14/16] drm/panel: call prepare/enable only once
Message-ID: <20190805131555.GA5005@arch-x1c3>
References: <20190804201637.1240-1-sam@ravnborg.org>
 <20190804201637.1240-15-sam@ravnborg.org>
 <20190805105928.GI29747@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190805105928.GI29747@pendragon.ideasonboard.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=aboHDvQ6ED+izD2UcWUy5SYRhwe6k8n3aFGpiqq6F94=;
 b=HJrPdg5vi2acXiTXn2D4z0i7Hr8w9XxLP/M4z2UnD9KSie//GRJr+D7i+HBERo0EyL
 E5xRuusW/sVxMjetijNBd1r+m4y7aPO+7292NQ5ydJqR2IJKF77JAsI54CE17Ta/cdZg
 QrG3JXUa8RWfSFu9Yj8ueDmPzGjfRvEczwrUzyAF6NXpZFHS1fbblvXfUprPBAeDuSVs
 G7kkZpSxO2LtflLSGMe98WVsft4eKAhlMb+AWUwtjg4FVC3SvA0PDrhI7UFd5lX9acGL
 rtGWgEtJiIGVcoJsqWbo5ZVbH0otl6VcYaaYQhB+ovNxMBCVQULGfy9jPcC4aONgj/Ka
 qTpA==
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, Marek Vasut <marex@denx.de>,
 linux-samsung-soc@vger.kernel.org, Sean Paul <sean@poorly.run>,
 Allison Randal <allison@lohutok.net>, Krzysztof Kozlowski <krzk@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Kukjin Kim <kgene@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>, Jonas Karlman <jonas@kwiboo.se>,
 Alison Wang <alison.wang@nxp.com>, Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 Alexios Zavras <alexios.zavras@intel.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 linux-tegra@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Vincent Abriou <vincent.abriou@st.com>, linux-arm-kernel@lists.infradead.org,
 Jernej Skrabec <jernej.skrabec@siol.net>, Enrico Weigelt <info@metux.net>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS8wOC8wNSwgTGF1cmVudCBQaW5jaGFydCB3cm90ZToKPiBIaSBTYW0sCj4gCj4gVGhh
bmsgeW91IGZvciB0aGUgcGF0Y2guCj4gCj4gT24gU3VuLCBBdWcgMDQsIDIwMTkgYXQgMTA6MTY6
MzVQTSArMDIwMCwgU2FtIFJhdm5ib3JnIHdyb3RlOgo+ID4gTWFueSBwYW5lbCBkcml2ZXJzIGR1
cGxpY2F0ZSBsb2dpYyB0byBwcmV2ZW50IHByZXBhcmUgdG8gYmUgY2FsbGVkCj4gPiBmb3IgYSBw
YW5lbCB0aGF0IGlzIGFscmVhZHkgcHJlcGFyZWQuCj4gPiBMaWtld2lzZSBmb3IgZW5hYmxlLgo+
ID4gCj4gPiBJbXBsZW1lbnQgdGhpcyBsb2dpYyBpbiBkcm1fcGFuZWwgc28gdGhlIGluZGl2aWR1
YWwgZHJpdmVycwo+ID4gbm8gbG9uZ2VyIG5lZWRzIHRoaXMuCj4gPiBBIHBhbmVsIGlzIGNvbnNp
ZGVyZWQgcHJlcGFyZWQvZW5hYmxlZCBvbmx5IGlmIHRoZSBwcmVwYXJlL2VuYWJsZSBjYWxsCj4g
PiBzdWNjZWVkcy4KPiA+IEZvciBkaXNhYmxlL3VucHJlcGFyZSBpdCBpcyB1bmNvbmRpdGlvbmFs
bHkgY29uc2lkZXJlZAo+ID4gZGlzYWJsZWQvdW5wcmVwYXJlZC4KPiA+IAo+ID4gVGhpcyBhbGxv
d3MgY2FsbHMgdG8gcHJlcGFyZS9lbmFibGUgYWdhaW4sIGV2ZW4gaWYgdGhlcmUgd2VyZQo+ID4g
c29tZSBpc3N1ZSBkaXNhYmxpbmcgYSByZWd1bGF0b3Igb3Igc2ltaWxhciBkdXJpbmcgZGlzYWJs
ZS91bnByZXBhcmUuCj4gCj4gSXMgdGhpcyB0aGUgcmlnaHQgcGxhY2UgdG8gaGFuZGxlIHRoaXMg
PyBTaG91bGRuJ3QgdGhlIHVwcGVyIGxheWVycwo+IGVuc3VyZSB0aGFuIGVuYWJsZS9kaXNhYmxl
IGFuZCBwcmVwYXJlL3VucHJlcGFyZSBhcmUgY29ycmVjdHkgYmFsYW5jZWQsCj4gYW5kIG5vdCBj
YWxsZWQgbXVsdGlwbGUgdGltZXMgPyBBZGRpbmcgZW5hYmxlZCBhbmQgcHJlcGFyZWQgc3RhdGUg
dG8KPiBkcm1fcGFuZWwgbm90IG9ubHkgZG9lc24ndCBhbGlnbiB3ZWxsIHdpdGggYXRvbWljIHN0
YXRlIGhhbmRsaW5nLCBidXQKPiBhbHNvIHdvdWxkIGhpZGUgaXNzdWVzIGluIHVwcGVyIGxheWVy
cyB0aGF0IHNob3VsZCByZWFsbHkgYmUgZml4ZWQKPiB0aGVyZS4KPiAKRnVsbHkgYWdyZWVkLiBN
aXN0YWtlcyBoYXBwZW4gLSBoaWRpbmcgdGhlbSwgYnkgcmV0dXJuaW5nICJzdWNjZXNzIiBkb2Vz
Cm5vdCBzb3VuZCBsaWtlIGEgd2lzZSBhcHByb2FjaC4KCkhUSApFbWlsCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
