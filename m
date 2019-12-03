Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4829410FE8B
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 14:20:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E49796E138;
	Tue,  3 Dec 2019 13:20:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34A086E138
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2019 13:20:38 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id u17so3798543lja.4
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Dec 2019 05:20:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dM7DxIKsuRuWaeq1kSkAx5tZP4LQ1yRPP8TIc6mxOpk=;
 b=Zpf2nUORBBtSLVrNQV5nl67ZFiRHNm1jk5Z9U8aL29ap6Hr8pwVdbBGW0x07lX7Cou
 x45PXsG5M5enajNwWQ9zY8qrwZifzgyYtMkxomFHfHw0tUpqJVcYP+9GubGBPPQFPgDr
 EDSYrhUESjc9ujTAml7iFtWP/C/burWANThMfsGphWgU28kqmjM89LRakewPGf+hk22n
 L19CuLE7JAvhsXmLMC2W7bOVLE2QiQFfd8crJCroxTeMIvvhLTM2s7t/sqXfFyA3Srpk
 TWSFy1cBhxfzgSu/mq0HMBBnoZmo/q8t5HW4K+o66BE/LSgL/IjMFEIWX+0jAe64LKb0
 Vq4A==
X-Gm-Message-State: APjAAAX7MAP5PBCbHK2OnEpa3cZNqFwJ6wT/G5Fu+NvH3DxvBA3jMILB
 driHqhjywrrGHCgOO1MMId3dEsQS0OS2XXUP1ASj1g==
X-Google-Smtp-Source: APXvYqzTzhKdgwJ8WJIcY2A5WR+ez0+zwm8p5MUMtgC+M9HuNmXbczoLdnQOw0NdPlAjvpjtAI7gsHbZmOicQtBst1Q=
X-Received: by 2002:a2e:8045:: with SMTP id p5mr2556134ljg.251.1575379236563; 
 Tue, 03 Dec 2019 05:20:36 -0800 (PST)
MIME-Version: 1.0
References: <20191202193230.21310-1-sam@ravnborg.org>
 <20191202193230.21310-27-sam@ravnborg.org>
In-Reply-To: <20191202193230.21310-27-sam@ravnborg.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 3 Dec 2019 14:20:25 +0100
Message-ID: <CACRpkdZcLeJuOiPPa81qj17ifi3T0YxPq0zPP0oqNv-8pvzeKg@mail.gmail.com>
Subject: Re: [PATCH v1 26/26] drm/panel: tpo-tpg110: use drm_panel backlight
 support
To: Sam Ravnborg <sam@ravnborg.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=dM7DxIKsuRuWaeq1kSkAx5tZP4LQ1yRPP8TIc6mxOpk=;
 b=ZrU6IFrNs/v9Z2rJ1KSkzGUV8fZWcRdhMKoXG6DN0M3+iAn1ApiRmE3ZgJ94Uo+9wZ
 DzuzeCNox0Z3xZRWRhWq9NS7Kq69iqJ360qMic+xi3WSoWvVfcJIHPlubUEr1YqjPC6n
 SXn0dfovwrRDvRAR6nMb9zlsIw6BuH674zeFIB8i/F1/gIumJJ3bD7wOLIyyAD+Ch5OE
 m/5UDp46mghUjs7ZT/ryJZOV8cAlXyc2Lu2UOO2gh5yc7puCj66NVcdtTPnHrWtBY2u6
 W3zW+ts6HbCNkFX+sFqM/OCNNJVzIuEg+uhrXbWD/7147S61i6ovPikcw7eFS0ik9JEC
 sNog==
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
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, NXP Linux Team <linux-imx@nxp.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Jitao Shi <jitao.shi@mediatek.com>,
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
Lm9yZz4gd3JvdGU6Cgo+IFVzZSB0aGUgYmFja2xpZ2h0IHN1cHBvcnQgaW4gZHJtX3BhbmVsIHRv
IHNpbXBsaWZ5IHRoZSBkcml2ZXIKPgo+IFNpZ25lZC1vZmYtYnk6IFNhbSBSYXZuYm9yZyA8c2Ft
QHJhdm5ib3JnLm9yZz4KPiBDYzogTGludXMgV2FsbGVpaiA8bGludXMud2FsbGVpakBsaW5hcm8u
b3JnPgo+IENjOiBUaGllcnJ5IFJlZGluZyA8dGhpZXJyeS5yZWRpbmdAZ21haWwuY29tPgo+IENj
OiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+CgpSZXZpZXdlZC1ieTogTGludXMgV2Fs
bGVpaiA8bGludXMud2FsbGVpakBsaW5hcm8ub3JnPgoKVGhhbmtzIGZvciBjbGVhbmluZyBhbGwg
b2YgdGhpcyB1cCEKCkxpbnVzIFdhbGxlaWoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
