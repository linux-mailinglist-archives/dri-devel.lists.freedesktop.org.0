Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A64319AC61
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2019 12:04:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B6CE6EC6E;
	Fri, 23 Aug 2019 10:04:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D3D66EC72
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2019 10:04:26 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id h15so8300033ljg.10
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2019 03:04:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9BFkYW/yPTsrnc55vLAdsGeMjLKzfyBX0Sxpn9MG5K4=;
 b=GLsEezBMwsXCue5Ljh67iML/T7uZArGu5flF1LB8N2XKref2vTEvnrH5jMalmKMwDt
 4j23qtaOjgIXJwoxtBZRLU2X7pbct3pkAaBHwKaXV7ui57dACclApRvkwXk3ZoGbZZnL
 Q0smPT5ibBM0Xu0shaHBuch09uyozTBVoJ8jzbGLIfGdxa9uEr1G+PDju/taz59Zv4XO
 wEM+Lkq2TjsDbFW3qhR2ZeZGo0jQXH57Uv7o3wSUhISboxsEjXJf9M2Km5yJKW1RK+cR
 fKWsWFVhwP3/LMkCFANc8sLV12MtD0B6JGpJjTO6HxTMAQauFHZeMFWcdMW6XjURkYee
 MtSA==
X-Gm-Message-State: APjAAAWSltQ5bzXP5164FwcXWAaZ4WBNJmOYdLhbDfsFwiFggCtSK6fE
 SI2cyQTv0TCbWKqDjcWiVQRVrBQWlFy35YzTldi8Uw==
X-Google-Smtp-Source: APXvYqzWRuGRQYXs15tagKrCWF42nddfFSPCEcDrh50HXQpQyaklCenV+F0PDzvnyErPg3QQ61hMuAdW4KQS2nnxEVU=
X-Received: by 2002:a05:651c:28c:: with SMTP id
 b12mr2471353ljo.69.1566554664839; 
 Fri, 23 Aug 2019 03:04:24 -0700 (PDT)
MIME-Version: 1.0
References: <20190823014033.2971-1-laurent.pinchart@ideasonboard.com>
 <20190823014033.2971-2-laurent.pinchart@ideasonboard.com>
In-Reply-To: <20190823014033.2971-2-laurent.pinchart@ideasonboard.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 23 Aug 2019 12:04:13 +0200
Message-ID: <CACRpkda83VmZQGPDrmKxZ=TFDwc8e2GSgyT24UGmPqkFa5tF4g@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/bridge: panel: Use drm_panel.type instead of
 explicit connector_type
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=9BFkYW/yPTsrnc55vLAdsGeMjLKzfyBX0Sxpn9MG5K4=;
 b=Og2oWhphjPIEBqSz8WGuf8VMV29iKL4h0bbxIErP6B0e3u9u2eyp5tStE3r6fQGRP8
 JyuYhvXA/0cB4hNXLOS/1BbNC4sQ5dQenSmqld38fiMWJDs51UQQXVNLZRld9eLkZoVf
 ufkfKLlKmF2rAjDTExcfWx8Iy5si8HlGHPj4pAvg2Wglii3yyEQxetJnKua89kjwaVOi
 Z2EJl04QYye81F0HnDuxVTg/Jo8JR2hyqU3VvdReLKX4J4dBCBGmYDinCCILPi7eC7Ml
 7G2w23J+jqN4ObfCNjfNXWQQ7WcEWAuVLx0BIPEx6XLFXsXac9DErfvK4Z5RhRV7QP7r
 fJUg==
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Philippe Cornu <philippe.cornu@st.com>, Paul Cercueil <paul@crapouillou.net>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Robert Chiras <robert.chiras@nxp.com>,
 Alexandre Torgue <alexandre.torgue@st.com>, Jonas Karlman <jonas@kwiboo.se>,
 Jyri Sarha <jsarha@ti.com>, Vincent Abriou <vincent.abriou@st.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Purism Kernel Team <kernel@puri.sm>,
 Stefan Mavrodiev <stefan@olimex.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Yannick Fertre <yannick.fertre@st.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBBdWcgMjMsIDIwMTkgYXQgMzo0MCBBTSBMYXVyZW50IFBpbmNoYXJ0CjxsYXVyZW50
LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+IHdyb3RlOgoKPiBUaGUgZHJtIHBhbmVsIGJyaWRn
ZSBjcmVhdGVzIGEgY29ubmVjdG9yIHVzaW5nIGEgY29ubmVjdG9yIHR5cGUgZXhwbGljaXQKPiBw
YXNzZWQgYnkgdGhlIGRpc3BsYXkgY29udHJvbGxlciBvciBicmlkZ2UgZHJpdmVyIHRoYXQgaW5z
dGFudGlhdGVzIHRoZQo+IHBhbmVsIGJyaWRnZS4gTm93IHRoYXQgZHJtX3BhbmVsIHJlcG9ydHMg
aXRzIGNvbm5lY3RvciB0eXBlLCB1c2UgaXQgYW5kCj4gcmVtb3ZlIHRoZSBjb25uZWN0b3JfdHlw
ZSBhcmd1bWVudCB0byBkcm1fcGFuZWxfYnJpZGdlX2FkZCgpIGFuZAo+IGRldm1fZHJtX3BhbmVs
X2JyaWRnZV9hZGQoKS4KPgo+IFNpZ25lZC1vZmYtYnk6IExhdXJlbnQgUGluY2hhcnQgPGxhdXJl
bnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4KClJldmlld2VkLWJ5OiBMaW51cyBXYWxsZWlq
IDxsaW51cy53YWxsZWlqQGxpbmFyby5vcmc+CgpZb3VycywKTGludXMgV2FsbGVpagpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
