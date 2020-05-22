Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 27F7D1DEF16
	for <lists+dri-devel@lfdr.de>; Fri, 22 May 2020 20:22:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8412A6EA24;
	Fri, 22 May 2020 18:22:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com
 [IPv6:2607:f8b0:4864:20::e44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B36B6EA24
 for <dri-devel@lists.freedesktop.org>; Fri, 22 May 2020 18:22:52 +0000 (UTC)
Received: by mail-vs1-xe44.google.com with SMTP id 1so6566764vsl.9
 for <dri-devel@lists.freedesktop.org>; Fri, 22 May 2020 11:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nRpc3FlkyJfZ3AzDx1k4B+KYooU7hfXK0+bh5YWQUT8=;
 b=iJwzC0nGRrdpqM+uYBus1lZJmLTJ1WZjAPapj+B5sXJDiBWTikY1mNrK8yss/i8Uoz
 k90pcgPWg4KhOEP8Xk/wB9+iKrnTlqXIKHFIF/ypG8qzXbRqxDo9EUkqRTSov/W/VHcE
 sSKvs4Qu7xLc8mc+Ynq48xyLS9RrMy6v/P+GSXeHZL0PEHfgW5Z9DiGzh3bYKGDs62qN
 glPHp6BDdsL/vloqirQjgXV44Nw7pQTtq1/6JMYfdO5Lt0a5tqlkXoAuEc25ITuChk8/
 E4Z6Kou23M2+Qytdfv6N+9AwHoJQrU5puF/g1MDYi0emOTpm0GjhJgbZAS0b83tXIzgB
 V2Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nRpc3FlkyJfZ3AzDx1k4B+KYooU7hfXK0+bh5YWQUT8=;
 b=fWcNpyHgHX0MZVSmLuzbPRkRwgi7OmNcyFtWVfGC8QS8SH5w4ZtTHLOrTrJRzhhMKL
 tCoJ8GCTieVWMjj8pB7FEAGzQU7jhWxOwm9/KKKM/DUWPp3k6slwSVJDD++LzOEQH44b
 vXxp+PVSYrzPdP7+GBu7nv4bm4tE7dbM/JlsPYy7ogY/gkQdX6tDzNOwoH7AL+iNHgXE
 C7OGjoBWQ6cQgdyMLWcqTz4A/0ri1/pf+qMpj/MfgJLXrNLnQ8Yyu6jGaIQXvmSo/Ibg
 Gj70lfeeg32VmxCZ9U0bMLhHYz2txTMFKrRhJB9ZhAMPFCD1mUunSzE3Rqeh3+vl7tek
 pygw==
X-Gm-Message-State: AOAM530bxQ2vCUJSAY95IcGP0H7n4/lPYakrLK80cNhRq/2u3KcH/BME
 Xk370JSIqLeOQV1E1F5lLgVrbUQ00D+3ewkJK9A=
X-Google-Smtp-Source: ABdhPJxh45CBDmh48ZBOgWFO+wRiOCUEhrYJEhN/uqv09qF9jDsFxcGYbY0km9LUl9jjYIytYOfzBsf3J51ZExfC9Aw=
X-Received: by 2002:a67:de0a:: with SMTP id q10mr12554064vsk.138.1590171771367; 
 Fri, 22 May 2020 11:22:51 -0700 (PDT)
MIME-Version: 1.0
References: <20200522135246.10134-1-tzimmermann@suse.de>
In-Reply-To: <20200522135246.10134-1-tzimmermann@suse.de>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Fri, 22 May 2020 19:19:53 +0100
Message-ID: <CACvgo52ajrBxHoyVZKf08GkNSa77NWkufDPXcB=dcWmvMQZuKw@mail.gmail.com>
Subject: Re: [PATCH 00/21] drm: Convert most CMA-based drivers to GEM object
 functions
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: alexandre.belloni@bootlin.com, linux-aspeed@lists.ozlabs.org,
 Neil Armstrong <narmstrong@baylibre.com>, Dave Airlie <airlied@linux.ie>,
 Liviu Dudau <liviu.dudau@arm.com>, Philippe Cornu <philippe.cornu@st.com>,
 Paul Cercueil <paul@crapouillou.net>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mihail Atanassov <mihail.atanassov@arm.com>, Sam Ravnborg <sam@ravnborg.org>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 =?UTF-8?B?TWFyZWsgVmHFoXV0?= <marex@denx.de>,
 Alexey Brodkin <abrodkin@synopsys.com>, ludovic.desroches@microchip.com,
 Xinliang Liu <xinliang.liu@linaro.org>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 "james qian wang \(Arm Technology China\)" <james.qian.wang@arm.com>,
 joel@jms.id.au, NXP Linux Team <linux-imx@nxp.com>,
 Chen Feng <puck.chen@hisilicon.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Alison Wang <alison.wang@nxp.com>, Jyri Sarha <jsarha@ti.com>,
 Chen-Yu Tsai <wens@csie.org>, Vincent Abriou <vincent.abriou@st.com>,
 Sascha Hauer <kernel@pengutronix.de>,
 LAKML <linux-arm-kernel@lists.infradead.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, bbrezillon@kernel.org,
 andrew@aj.id.au, ML dri-devel <dri-devel@lists.freedesktop.org>,
 nicolas.ferre@microchip.com, Yannick Fertre <yannick.fertre@st.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, khilman@baylibre.com,
 Rongrong Zou <zourongrong@gmail.com>, Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

On Fri, 22 May 2020 at 14:53, Thomas Zimmermann <tzimmermann@suse.de> wrote:

>  32 files changed, 52 insertions(+), 226 deletions(-)
>
We need more diffstat like this. With this series the .gem_print_info
is no longer set.
Feel free to follow-up and nuke it, alongside the glue in drm_gem.c.

There's a small comment in the kirin patch - with that resolved the series is:
Acked-by: Emil Velikov <emil.velikov@collabora.com>

-Emil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
