Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07BAD1EDCC0
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jun 2020 07:49:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04D896E191;
	Thu,  4 Jun 2020 05:49:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 919B36E191
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jun 2020 05:49:15 +0000 (UTC)
Received: by mail-ot1-x344.google.com with SMTP id v13so3866677otp.4
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Jun 2020 22:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JrpK8Y8QAB9MvZ9xumZeQTznRTvQNGD/2K8KcvSfyTk=;
 b=w8L80Xf8lmfERwYk8n1coCJXm+0ErdkgMudQnWhsutMXRpLrhtcUB5IOZAdXvXW7gI
 zF+Zz8u6TcvAxHvvR2oL59q/t4gNz0hDvCN7jRiV9BZ5dkmBOIb/a3UrPMwsC6Du7BCP
 BOc1BLYQoEsoFKgwG3hk8/36f8kQ20GRu/XMop+Gipz55+5whEjgTxmsWAU36YHHsmK5
 VL2LlenUNOptmBHpPGc5VQujTf49oGpd7ksMjUyRhwjG4YWUh1/4ZcJJW8O62pQ4CLjt
 6XKDu553a1stV8Gvq257ojwqPLUalbOrlHOTbNns9pFtIkOs0MlbVrwK6zt0ycRitSL3
 vq7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JrpK8Y8QAB9MvZ9xumZeQTznRTvQNGD/2K8KcvSfyTk=;
 b=S9SXMSze0xufy5oA6nuI38zfOOe/dqgPDaCiR280Z5YQn5fHwvhq9SNp6UxIWGMovr
 w2oAJloG2jrf50EwYrR0+hStQt8qEvy6LoB40ind294WfEcj5TJX9Y+GtOlFh4EO+Qah
 x3k8ibG4P1ORbRz6Ym9twRtLt0koh/ShGu//VrjEwBF6+3r6o5C9FvHPKVEm1eQ+yE4c
 5hfya9PqZyIVkmDc2NWCR89TSm0RwXNpQk9XvvS6O606QkL4/sjT9KdSf/hBmgesaCeK
 htynG8yWI/nL5yBRaUttA65eqybMC2AqVYciscvfnPG3N7aQZguX0UD5mQJOz8Zdm7AF
 Khug==
X-Gm-Message-State: AOAM531FaqDxqFyuUV6CX5mfLsqEYy4ijtAxWHTbI7CMKSnS4O7iBWdr
 2wb762UTbwlg3ny0XrO011jui3+A/bl+rxFC70uw9g==
X-Google-Smtp-Source: ABdhPJx2VgCDOicTZ0mcQ18nPR1dUAvV9shrNs6HBMcETfcU1RtSKRzNootiuRiuHS6q/webDw8kzSyzyfojDp0RYus=
X-Received: by 2002:a9d:b82:: with SMTP id 2mr2410621oth.221.1591249754802;
 Wed, 03 Jun 2020 22:49:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200603083132.4610-1-tzimmermann@suse.de>
 <20200603083132.4610-8-tzimmermann@suse.de>
In-Reply-To: <20200603083132.4610-8-tzimmermann@suse.de>
From: John Stultz <john.stultz@linaro.org>
Date: Wed, 3 Jun 2020 22:49:03 -0700
Message-ID: <CALAqxLWG7XN_A70omeZn03x8zc5aEBrStQDkm8MtUNRxm0sD+w@mail.gmail.com>
Subject: Re: [PATCH v2 07/23] drm/hisilicon/kirin: Set .dumb_create to
 drm_gem_cma_dumb_create()
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-aspeed@lists.ozlabs.org, Neil Armstrong <narmstrong@baylibre.com>,
 David Airlie <airlied@linux.ie>, Liviu Dudau <liviu.dudau@arm.com>,
 philippe.cornu@st.com, paul@crapouillou.net,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, mihail.atanassov@arm.com,
 Sam Ravnborg <sam@ravnborg.org>, alexandre.torgue@st.com, marex@denx.de,
 Xu YiPing <xuyiping@hisilicon.com>, abrodkin@synopsys.com,
 ludovic.desroches@microchip.com, Xinliang Liu <z.liuxinliang@hisilicon.com>,
 Xinliang Liu <xinliang.liu@linaro.org>,
 XinWei Kong <kong.kongxinwei@hisilicon.com>, tomi.valkeinen@ti.com,
 james.qian.wang@arm.com, joel@jms.id.au,
 Emil Velikov <emil.velikov@collabora.com>, dl-linux-imx <linux-imx@nxp.com>,
 Feng Chen <puck.chen@hisilicon.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 alison.wang@nxp.com, jsarha@ti.com, Chen-Yu Tsai <wens@csie.org>,
 vincent.abriou@st.com, Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 mcoquelin.stm32@gmail.com, bbrezillon@kernel.org, andrew@aj.id.au,
 dri-devel <dri-devel@lists.freedesktop.org>, nicolas.ferre@microchip.com,
 yannick.fertre@st.com, kieran.bingham+renesas@ideasonboard.com,
 Kevin Hilman <khilman@baylibre.com>, Rongrong Zou <zourongrong@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 3, 2020 at 1:31 AM Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> The kirin drivers uses drm_gem_cma_dumb_create_internal() for its
> .dumb_create implementation. The function is meant for internal use
> only by drivers that require additional buffer setup.
>
> Kirin does not do an additional setup, so convert it over to
> drm_gem_cma_dumb_create().
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Acked-by: Emil Velikov <emil.velikov@collabora.com>
> Cc: Xu YiPing <xuyiping@hisilicon.com>
> Cc: Rongrong Zou <zourongrong@gmail.com>
> Cc: Xinliang Liu <z.liuxinliang@hisilicon.com>


Thanks for sending this out! Works fine on my HiKey board.

Tested-by: John Stultz <john.stultz@linaro.org>

thanks
-john
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
