Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D23181BF7
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2019 15:19:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECEAB89C33;
	Mon,  5 Aug 2019 13:19:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE50289C33
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2019 13:19:30 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id v19so73008390wmj.5
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Aug 2019 06:19:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=wZEl8RSr4zALt6HddkMAzZ6K0ziDRyO7RsNxOehkOiE=;
 b=nvyh+6ZrY+sH8GsoiKOoq13MOmNHvOfCdlaTOiL8Vs6/4V00oN0sKWibLjvatUV9Oj
 Si6SLahG/5ZYvYx6aKDtJJ/Zdn2c8RQyFFC5C83jHAGpPNXzYB8ULQ443ZiKTAFEPQGr
 HviIpgUW8g+u93naz1GLa648JjSRl47zih1PCNSbwHXv1BRo/8Zb+FYzjhpOKt9Q1ILG
 S8Owj9IjIvwSiD17j1NCw8CDW79aoxL5UlVEzA+QEurCKKRNajv240OSEIiXYiJILJgE
 suZT7wvF3fnl7WKc/zxilB2ee67Xg/GXkAmaSuf/FpDna8va5f5xrJLSqYEEYi4kdouv
 /23A==
X-Gm-Message-State: APjAAAWYvxQcSHtP1kt44c9hxk2GTDhS2r6SCKfzUzCfodeY/pAxY5pb
 Pe6bChKQVnK21ra2nEtn9MM=
X-Google-Smtp-Source: APXvYqz0P/wJNV1ZR/CdjYZA1JlXDnZhL8I26T1UonnCxIy55h0flNA3Au+YawBd5h4PH/RoOAm9rg==
X-Received: by 2002:a1c:c14b:: with SMTP id r72mr18774070wmf.166.1565011169278; 
 Mon, 05 Aug 2019 06:19:29 -0700 (PDT)
Received: from arch-x1c3 ([2a00:5f00:102:0:9665:9cff:feee:aa4d])
 by smtp.gmail.com with ESMTPSA id f12sm92043233wrg.5.2019.08.05.06.19.28
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 05 Aug 2019 06:19:28 -0700 (PDT)
Date: Mon, 5 Aug 2019 14:18:50 +0100
From: Emil Velikov <emil.l.velikov@gmail.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v1 0/16] drm: panel related updates
Message-ID: <20190805131850.GB5005@arch-x1c3>
References: <20190804201637.1240-1-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190804201637.1240-1-sam@ravnborg.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=wZEl8RSr4zALt6HddkMAzZ6K0ziDRyO7RsNxOehkOiE=;
 b=V8q6yIyItLRstyanR2xSd1hs5HNdY6xTpt01gxfk74f35YvVIYsURM8Sf4v0pRqCS0
 FtjGfKUlwJhtZrhIcLxxL8lQA5s2eG85dXDzb+lShA+GBozmrSw6NCpqBCyNaO4LTA/t
 MWleThgwXCDjqV1w8rYSqMlVpIm4jLzZAOSCD3H+EDt3mUaez+JXfQp734Y9F2sAvKwe
 lZzebNEk3ENrf33vty7LYwLhwu2pJhCVHwfhBdYd7btGPRVNVTbchr4M26Mir3MndSpr
 fqVAkor4XbugBI8g9vzZBe1KCojrYtJu2nKbLrP4A/vcqvUir0yzbfiwv+x8CwAvm8k8
 17YA==
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
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Marek Vasut <marex@denx.de>, linux-samsung-soc@vger.kernel.org,
 Vincent Abriou <vincent.abriou@st.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Kukjin Kim <kgene@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>, Jonas Karlman <jonas@kwiboo.se>,
 Alison Wang <alison.wang@nxp.com>, Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 Alexios Zavras <alexios.zavras@intel.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 linux-tegra@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Sean Paul <sean@poorly.run>, Allison Randal <allison@lohutok.net>,
 linux-arm-kernel@lists.infradead.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 Enrico Weigelt <info@metux.net>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS8wOC8wNCwgU2FtIFJhdm5ib3JnIHdyb3RlOgo+IFRoZSBmaXJzdCA5IHBhdGNoZXMg
cmVwbGFjZXMgZGlyZWN0IHVzZSBvZiB0aGUgZHJtX3BhbmVsCj4gZnVuY3Rpb24gcG9pbnRlcnMg
d2l0aCB0aGVpciBkcm1fcGFuZWxfKiBjb3VudGVycGFydHMuCj4gVGhlIGZ1bmN0aW9uIHBvaW50
ZXJzIGFyZSBvbmx5IHN1cHBvc2VkIHRvIGJlIHVzZWQgYnkKPiB0aGUgZHJtX3BhbmVsIGluZnJh
c3RydWN0dXJlIGFuZCBkaXJlY3QgdXNlIGFyZSBkaXNjb3VyYWdlZC4KPiAKPiBpbGk5MzIyIGlz
IHVwZGF0ZWQgdG8gaGFuZGxlIGJ1c19mbGFncyBpbiBnZXRfbW9kZXMgbGlrZSBldmVyeW9uZSBl
bHNlLgo+IFRoaXMgaXMgaW4gcHJlcGFyYXRpb24gZm9yIGEgbGF0ZXIgcGF0Y2ggc2VyaWVzIHdo
ZXJlIGNvbnRyb2xsZXIKPiBiZWNvbWVzIGFuIGFydWd1bWVudCB0byBnZXRfbW9kZXMoKSBhbmQg
bm90IGxpa2UgdG9kYXkgd2hlcmUgZHJtX3BhbmVsCj4gaXMgYXR0YWNoZWQgdG8gYSBjb250cm9s
bGVyLgo+IAo+IFRoZSByZW1haW5pbmcgcGF0Y2hlcyBtb3ZlIGZ1bmN0aW9uYWxpdHkgdG8gdGhl
IGRybV9wYW5lbCBjb3JlIHRoYXQKPiB0b2RheSBhcmUgcmVwZWF0ZWQgaW4gbWFueSBkcml2ZXJz
Lgo+IEFzIHByZXBhcmF0aW9uIGZvciB0aGlzIHRoZSBpbmxpbmUgZnVuY3Rpb25zIGFyZSBtb3Zl
ZCB0byBkcm1fcGFuZWwuYwo+IGFuZCBrZXJuZWwtZG9jIGlzIG1hZGUgaW5saW5lLgo+IHBhbmVs
LXNpbXBsZSBpcyB1cGRhdGVkIHRvIGJlbmVmaXQgZnJvbSB0aGUgYWRkaXRpb25hbCBpbmZyYXN0
cnVjdHVyZQo+IGFuZCBpcyBhbiBleGFtcGxlIGZvciB0aGUgc2ltcGxpZmljYXRpb25zIHRoYXQg
Y2FuIGJlIGRvbmUuCj4gCj4gVGhlIHBhdGNoc2V0IGhhcyBiZWVuIHRlc3RlZCBvbiBteSBlbWJl
ZGRlZCB0YXJnZXQsCj4gYW5kIGJ1aWxkIHRlc3RlZC4KPiAKPiBGZWVkYmFjayB3ZWxjb21lIQo+
IAo+IFRoZSAiZml4IG9wZW5jb2RlZCIgcGF0Y2hlcyBhcmUgYWxsIGluZGVwZW5kZW50IGFuZCBj
YW4gYmUgYXBwbGllZAo+IG91dCBvZiBvcmRlci4gVGhleSB3ZXJlIGtlcHQgaGVyZSB0byBrZWVw
IHBhbmVsIHJlbGF0ZWQgcGF0Y2hlcyBpbiBvbmUgc2VyaWVzLgo+IAo+IAlTYW0KPiAKVGhhbmtz
IGZvciB3b3JraW5nIG9uIHRoaXMgU2FtLgoKUGF0Y2hlcyAxLTEzIGFyZToKUmV2aWV3ZWQtYnk6
IEVtaWwgVmVsaWtvdiA8ZW1pbC52ZWxpa292QGNvbGxhYm9yYS5jb20+CgotRW1pbApfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
