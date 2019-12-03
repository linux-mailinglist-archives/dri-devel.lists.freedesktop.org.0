Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 64CA510FEB9
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 14:25:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F7436E529;
	Tue,  3 Dec 2019 13:25:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77E596E529
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2019 13:25:18 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id q6so2931874lfb.6
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Dec 2019 05:25:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=9a1hL+PexI1M8Jq7K439+8ni7/mVSuwFTy8tepPE5ag=;
 b=MpvUUjZrMdU960r0EtG15FojBle8DUx33ue/ktr525fljvcfskijp2LxFQKjkfF3Lt
 e3j2giSUl9oS/5/RM9n2uEAnr/StS4vhrDN5iJjEjYdIvoEJ69E11ix6cCEa6uDVg0g3
 Q6fbvzgJIn5M19Loxw/EO9NGA30vv4FT8OVc3C2LhLErpk+r1s+8tqKKIVwuuE8ggmwK
 t3mSWAqP4EqsXvFZwe8Tyg1SEXPEgq5DXXChMF4BX63sboubWruNjVrR92kwU6JOFyfU
 yR1gWsrmO6LbTYsk/aBRFp8GAUXPqJ5qeg3kuiE2CsD6G6L5Y4xI8qwQdqB2QV77w5qG
 RHag==
X-Gm-Message-State: APjAAAX+MF1+nqpPKygzyH0JL3k1ftWjuSRh699DRjTuUqAuftQkczMD
 rJTogGhqeY1tlEU5LLurLd3NJeYcCCry3mR1lHXbhw==
X-Google-Smtp-Source: APXvYqxTXADDPAMH7cAkcCdHzl2vjK+aV5Roq/rNhp0U0HmtoXe1KfDsidebtQJoYG7+XHWaVda6PVL/JLS+4QQ0S+k=
X-Received: by 2002:a19:7611:: with SMTP id c17mr2569127lff.86.1575379516980; 
 Tue, 03 Dec 2019 05:25:16 -0800 (PST)
MIME-Version: 1.0
References: <20191202193230.21310-1-sam@ravnborg.org>
 <20191202193230.21310-6-sam@ravnborg.org>
In-Reply-To: <20191202193230.21310-6-sam@ravnborg.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 3 Dec 2019 14:25:04 +0100
Message-ID: <CACRpkdb9c__FUBWE6j6g9uFwYRE6CrX8gu2gbHZ-xPpZ+YkF6Q@mail.gmail.com>
Subject: Re: [PATCH v1 05/26] drm/panel: add drm_connector argument to
 get_modes()
To: Sam Ravnborg <sam@ravnborg.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=9a1hL+PexI1M8Jq7K439+8ni7/mVSuwFTy8tepPE5ag=;
 b=xvis201gXI3TiO7rQvoI1mKBfSgzASqAd5iNB/gKNTcG/vn4Yqzhacn1uV/53tfqU8
 kD2NRTag5a/3oe4AJYonE/5qZUY9d/e3gtDw1PcpmJ/wbepHuPFpAO2vAYkoiRl+EaUf
 eNzFxpDgdSJ7gWNidrFThpe2xiov+axfIBro+R28+EWkRF0w07eNS6dozJjhFBRBpmMt
 usXLfgmME3MTm5zAC5CIERmWX1iAN+xefTx1Q2ApRqbMrUAp3Ylf9AiZA9HwCUstvsYg
 6tssUWKZp25YEHHE3kRX0wSoNqFps0sLQNBE4276+BCka+7PILtOjKGV7mxPqc5LGtcR
 hgNg==
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
 =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 Stefan Mavrodiev <stefan@olimex.com>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, NXP Linux Team <linux-imx@nxp.com>,
 Robert Chiras <robert.chiras@nxp.com>, Jagan Teki <jagan@amarulasolutions.com>,
 Jitao Shi <jitao.shi@mediatek.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>, linux-tegra@vger.kernel.org,
 Sean Paul <sean@poorly.run>, Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Purism Kernel Team <kernel@puri.sm>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBEZWMgMiwgMjAxOSBhdCA4OjMzIFBNIFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3Jn
Lm9yZz4gd3JvdGU6Cgo+IFRvZGF5IHRoZSBicmlkZ2UgY3JlYXRlcyB0aGUgZHJtX2Nvbm5lY3Rv
ciwgYnV0IHRoYXQgaXMgcGxhbm5lZAo+IHRvIGJlIG1vdmVkIHRvIHRoZSBkaXNwbGF5IGRyaXZl
cnMuCj4gVG8gZmFjaWxpdGF0ZSB0aGlzLCB1cGRhdGUgZHJtX3BhbmVsX2Z1bmNzLmdldF9tb2Rl
cygpIHRvCj4gdGFrZSBkcm1fY29ubmVjdG9yIGFzIGFuIGFyZ3VtZW50Lgo+IEFsbCBwYW5lbCBk
cml2ZXJzIGltcGxlbWVudGluZyBnZXRfbW9kZXMoKSBhcmUgdXBkYXRlZC4KPgo+IFNpZ25lZC1v
ZmYtYnk6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KPiBDYzogVGhpZXJyeSBSZWRp
bmcgPHRoaWVycnkucmVkaW5nQGdtYWlsLmNvbT4KPiBDYzogTGF1cmVudCBQaW5jaGFydCA8bGF1
cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPgo+IENjOiBTYW0gUmF2bmJvcmcgPHNhbUBy
YXZuYm9yZy5vcmc+Cj4gQ2M6IE1hYXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmtob3JzdEBs
aW51eC5pbnRlbC5jb20+Cj4gQ2M6IE1heGltZSBSaXBhcmQgPG1yaXBhcmRAa2VybmVsLm9yZz4K
PiBDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgo+IENjOiBEYW5pZWwgVmV0dGVy
IDxkYW5pZWxAZmZ3bGwuY2g+Cj4gQ2M6IExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGlu
YXJvLm9yZz4KPiBDYzogSmFnYW4gVGVraSA8amFnYW5AYW1hcnVsYXNvbHV0aW9ucy5jb20+Cj4g
Q2M6IFN0ZWZhbiBNYXZyb2RpZXYgPHN0ZWZhbkBvbGltZXguY29tPgo+IENjOiBSb2JlcnQgQ2hp
cmFzIDxyb2JlcnQuY2hpcmFzQG54cC5jb20+Cj4gQ2M6ICJHdWlkbyBHw7xudGhlciIgPGFneEBz
aWd4Y3B1Lm9yZz4KPiBDYzogUHVyaXNtIEtlcm5lbCBUZWFtIDxrZXJuZWxAcHVyaS5zbT4KClRo
aXMgbG9va3MgcmVhc29uYWJsZSB0byBtZS4KClJldmlld2VkLWJ5OiBMaW51cyBXYWxsZWlqIDxs
aW51cy53YWxsZWlqQGxpbmFyby5vcmc+CgpZb3VycywKTGludXMgV2FsbGVpagpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
