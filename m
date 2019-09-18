Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 88331B6478
	for <lists+dri-devel@lfdr.de>; Wed, 18 Sep 2019 15:33:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8E2D6F382;
	Wed, 18 Sep 2019 13:33:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
 [209.85.167.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B6DA6F382;
 Wed, 18 Sep 2019 13:33:36 +0000 (UTC)
Received: by mail-oi1-f196.google.com with SMTP id k20so5981298oih.3;
 Wed, 18 Sep 2019 06:33:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=IC0q0Es9HxTLSb0PNX9pAw25DkwUzoXEjlENlSs4w9s=;
 b=bsRyFNeAdesqQP5aYfSbU6ilcWptZOxLJI9owtfuSqmTMjDr0Gj6z17hXqXe9tmtd1
 UisR4lt6YNcTGitLuBLt0XHthko7cjh9HGKBjWCqzoZh4IOwgtATweeajMsyxAICkn/A
 nI4ArtPk6V54CakSEcZUaSEkz0smriQr8KCbBNw2oDzr5RnNudCOJ/TiY99WyyjY87wo
 bfpJPDijLIB6nWH/q9HLdVuHiXVQsp3J6e+UgyRyPvDZ1ngoz3rtfkb0UjmSwDx/plCk
 /5CFJ34VdMxv7QdsRLvTjPBqa6EyQNd7C53J4x1cKdmCuJwECOEo2PgEkY+U5pIoDF4O
 CwNQ==
X-Gm-Message-State: APjAAAXVRigDULPIwm8HOGjA2+ZgoNfvOWyd1ji2KueC5PBalFkBo080
 R4HzjxoqQ5HblTdyTe0Bvg==
X-Google-Smtp-Source: APXvYqzFKo2zD3kzQfStRe6u5Z04KLvlPbxnoLNER1RO58XbbuUaDka1izzgYXa3YK3Q2YrDvoHnFg==
X-Received: by 2002:aca:f50b:: with SMTP id t11mr2237475oih.1.1568813615350;
 Wed, 18 Sep 2019 06:33:35 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id n9sm632424otn.4.2019.09.18.06.33.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Sep 2019 06:33:34 -0700 (PDT)
Date: Wed, 18 Sep 2019 08:33:33 -0500
From: Rob Herring <robh@kernel.org>
To: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
Subject: Re: [PATCH v2 2/2] dt-bindings: etnaviv: Add #cooling-cells
Message-ID: <20190918133333.GA21684@bogus>
References: <cover.1568255903.git.agx@sigxcpu.org>
 <6e9d761598b2361532146f43161fd05f3eee6545.1568255903.git.agx@sigxcpu.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6e9d761598b2361532146f43161fd05f3eee6545.1568255903.git.agx@sigxcpu.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: devicetree@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Anson Huang <Anson.Huang@nxp.com>, Carlo Caione <ccaione@baylibre.com>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>,
 "Angus Ainslie \(Purism\)" <angus@akkea.ca>, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Abel Vesa <abel.vesa@nxp.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAxMSBTZXAgMjAxOSAxOTo0MDozNiAtMDcwMCwgPT9VVEYtOD9xP0d1aWRvPTIwRz1D
Mz1CQ250aGVyPz0gd3JvdGU6Cj4gQWRkICNjb29saW5nLWNlbGxzIGZvciB3aGVuIHRoZSBncHUg
YWN0cyBhcyBhIGNvb2xpbmcgZGV2aWNlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEd1aWRvIEfDvG50
aGVyIDxhZ3hAc2lneGNwdS5vcmc+Cj4gLS0tCj4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rp
c3BsYXkvZXRuYXZpdi9ldG5hdml2LWRybS50eHQgICAgICAgICAgfCAxICsKPiAgMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4gCgpBY2tlZC1ieTogUm9iIEhlcnJpbmcgPHJvYmhAa2Vy
bmVsLm9yZz4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
