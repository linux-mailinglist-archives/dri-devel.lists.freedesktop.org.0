Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 47DEE10FECB
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 14:27:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48BB6894C3;
	Tue,  3 Dec 2019 13:27:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 882FC894C3
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2019 13:27:47 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id a17so2903951lfi.13
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Dec 2019 05:27:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=w5kvvsNqTWUYowCw16IbU3x1YCmaOiYf5tGr6DU/4Oo=;
 b=dghSHeea4q4UXRX9dV5m0JbZ8RuXubsckQD6Ap1jeEZ25nAREPrudRKzaoIJ02W6d+
 hmJwXZTvzSSdYZ9hzr/OA4tXsW81sQAl+yNktSuj64lq9DMOK9NfI4npjlNFQyLAk6iG
 RPQeotN60Mpsdjbn11KhDgiAJoU9eWZV9Rdjc6nn3n1O1PBPFYnDgS7GeF3s9fUCGE15
 RmITw1Ma8hMBrlKvMgkyBOm5BOTDxnOewWJXfnYSbo0+c7YgqvXIyPyjQ3D7tHin05/C
 VVCNj3yu4+zpdMFaRZ2mugO7Qu6tHye7H+R4ek+p/HBa3E5pfqhL7zRRRs782WNl4xFF
 3WOA==
X-Gm-Message-State: APjAAAWxM9bS3KBJilgSfydzCtyU1+fatUKJSHNBuxF5YaNycBJv4uYj
 UGPDzfVOBOGWurko74pXWPY5EzwDnNVxzC4UJPdGfA==
X-Google-Smtp-Source: APXvYqyofMBPFWLLzB1STopamPLWqp8a6SLsme2LKB0JzU+G9blqUgnpYL5l6F2TBybbdU6uzjI0Yo9WQ+oH5mP/T40=
X-Received: by 2002:a19:f701:: with SMTP id z1mr2657953lfe.133.1575379666036; 
 Tue, 03 Dec 2019 05:27:46 -0800 (PST)
MIME-Version: 1.0
References: <20191202193230.21310-1-sam@ravnborg.org>
 <20191202193230.21310-9-sam@ravnborg.org>
In-Reply-To: <20191202193230.21310-9-sam@ravnborg.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 3 Dec 2019 14:27:34 +0100
Message-ID: <CACRpkdbiyVcUDrxuCK_wgsB6Vn+XZptsc9H3zB0cXxjeOtw+Ug@mail.gmail.com>
Subject: Re: [PATCH v1 08/26] drm/panel: drop drm_device from drm_panel
To: Sam Ravnborg <sam@ravnborg.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=w5kvvsNqTWUYowCw16IbU3x1YCmaOiYf5tGr6DU/4Oo=;
 b=Kf2TrLzoeW7GPO93jICax9H7npFli7nKkPrAa/7pensbMPErLdSyO5cAPXKjgJ5SwW
 dQrNoMOKIZ0oZKLp96BDVuif4EmGi5MgCrhh0N20691gPfYKiIWpucl1bpxPv8HyWwEO
 sV/o0T5vo3zUWjf4mn/5JFm4iQ9eVy7Qwu71lDN9Y0jhqghCBoOVDyB/uDoKZVeoM5qE
 lirCwRmMcZeJCvVkm4a8hz6Ijs6Aw/lR6XRBXo/Au/eoIX7M/1cljIRGuyDeppCzGaRX
 SiP6V0C53L9KztUCT76fN77bWsENOXX1T2+wgpTdxmhUZRMwMYpW+0PGCrTHVh2H+JbJ
 2ZrQ==
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
Lm9yZz4gd3JvdGU6Cgo+IFRoZSBwYW5lbCBkcml2ZXJzIHVzZWQgZHJtX3BhbmVsLmRybSBmb3Ig
dHdvIHB1cnBvc2VzOgo+IDEpIEFyZ3VtZW50IHRvIGRybV9tb2RlX2R1cGxpY2F0ZSgpCj4gMikg
ZHJtLT5kZXYgd2FzIHVzZWQgaW4gZXJyb3IgbWVzc2FnZXMKPgo+IFRoZSBmaXJzdCB1c2FnZSBp
cyByZXBsYWNlZCB3aXRoIGRybV9jb25uZWN0b3IuZGV2Cj4gLSBkcm1fY29ubmVjdG9yIGlzIGFs
cmVhZHkgY29ubmVjdGVkIHRvIGEgZHJtX2RldmljZQo+ICAgYW5kIHdlIGhhdmUgYSB2YWxpZCBj
b25uZWN0b3IKPgo+IFRoZSBzZWNvbmQgdXNhZ2UgaXMgcmVwbGFjZWQgd2l0aCBkcm1fcGFuZWwu
ZGV2Cj4gLSB0aGlzIG1ha2VzIGRyaXZlcnMgbW9yZSBjb25zaXN0ZW50IGluIHRoZWlyIGRldiBh
cmd1bWVudAo+ICAgdXNlZCBmb3IgZGV2X2VycigpIGFuZCBmcmllbmRzCj4KPiBXaXRoIHRoZXNl
IHJlcGxhY2VtZW50cyB0aGVyZSBhcmUgbm8gbW9yZSB1c2VzIG9mIGRybV9wYW5lbC5kcm0sCj4g
c28gaXQgaXMgcmVtb3ZlZCBmcm9tIHN0cnVjdCBkcm1fcGFuZWwuCj4gV2l0aCB0aGlzIGNoYW5n
ZSBkcm1fcGFuZWxfYXR0YWNoKCkgYW5kIGRybV9wYW5lbF9kZXRhY2goKQo+IG5vIGxvZ25lciBo
YXMgYW55IHVzZSBhcyB0aGV5IGFyZSBlbXB0eSBmdW5jdGlvbnMuCj4KPiBTaWduZWQtb2ZmLWJ5
OiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+Cj4gQ2M6IFRoaWVycnkgUmVkaW5nIDx0
aGllcnJ5LnJlZGluZ0BnbWFpbC5jb20+Cj4gQ2M6IExhdXJlbnQgUGluY2hhcnQgPExhdXJlbnQu
cGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4KPiBDYzogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJv
cmcub3JnPgo+IENjOiBNYWFydGVuIExhbmtob3JzdCA8bWFhcnRlbi5sYW5raG9yc3RAbGludXgu
aW50ZWwuY29tPgo+IENjOiBNYXhpbWUgUmlwYXJkIDxtcmlwYXJkQGtlcm5lbC5vcmc+Cj4gQ2M6
IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KPiBDYzogRGFuaWVsIFZldHRlciA8ZGFu
aWVsQGZmd2xsLmNoPgo+IENjOiBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxsZWlqQGxpbmFyby5v
cmc+Cj4gQ2M6IEphZ2FuIFRla2kgPGphZ2FuQGFtYXJ1bGFzb2x1dGlvbnMuY29tPgo+IENjOiBT
dGVmYW4gTWF2cm9kaWV2IDxzdGVmYW5Ab2xpbWV4LmNvbT4KPiBDYzogUm9iZXJ0IENoaXJhcyA8
cm9iZXJ0LmNoaXJhc0BueHAuY29tPgo+IENjOiAiR3VpZG8gR8O8bnRoZXIiIDxhZ3hAc2lneGNw
dS5vcmc+Cj4gQ2M6IFB1cmlzbSBLZXJuZWwgVGVhbSA8a2VybmVsQHB1cmkuc20+CgpSZXZpZXdl
ZC1ieTogTGludXMgV2FsbGVpaiA8bGludXMud2FsbGVpakBsaW5hcm8ub3JnPgoKWW91cnMsCkxp
bnVzIFdhbGxlaWoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
