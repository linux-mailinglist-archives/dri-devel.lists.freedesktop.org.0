Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF33A1EDCC1
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jun 2020 07:49:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 017B2898AF;
	Thu,  4 Jun 2020 05:49:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04C07898AF
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jun 2020 05:49:44 +0000 (UTC)
Received: by mail-ot1-x342.google.com with SMTP id k15so3865362otp.8
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Jun 2020 22:49:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rqE9XL7eLOP6VB2UAD3Y6E2HkrlmXmVJB3VWo1bq1oI=;
 b=MO5dE3Kx5mjbbliZCC3Gq5PDpWA7a4nuo502DQJrzpCLIvVdxVrbSrhn74AyABYIoe
 lPCMdk1MiPSMBUJxStAfD2Su3qCsvH+iKP1NSA01m8nK3q/DVksrqqgSCWEylPM4Lo1J
 DvKD4hPGE7nIB6NWD+ZthQokSHEdGis3ScNwkMkisKvt8Cb6ttOjq+zpZOfiWse/jeLN
 zJJ/yBzFvL9cHvN+W8MTHmf2Ya3i9bg663uKHwXJ0mF6bymN33x+Wu91is148k50hiPr
 6/41J7NSxZwfGsh5uWd1z2SbPWNMvEGi5QlrzZ0gGX+TxgBKXXguGWSzfIZeyoRkCBsQ
 Ulag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rqE9XL7eLOP6VB2UAD3Y6E2HkrlmXmVJB3VWo1bq1oI=;
 b=cpM80qzLdHKipy+RQdieDEb9L+EYifxvP4CBby2wYtCqrAdlWXhYFxmHZdr40Oo8q0
 Zn30MN8d/67IPQLSobijaZPikB1BR/dm6I5zZmC1S/qWfezthol2BVD1AkPs9UL4l9Bf
 mv5kGbZWkPLINJm9oGX70tD26ZAF74iO4JkiHuL+grFlfF6J04zmDTrZdUy4OpyIcbiC
 Lvj7zc/7Vwy1cGXrmxpr2kDEuvYl40IApb9sRDQXnli30JMoQHgJ+zlT/b9ArOTcjhap
 hPGejAQY7lyxQukNkuA17YucKg6NfzEQGUlGLwk5ewdxjmMiXzvmJnG1jHu2RMeVMKS4
 BWNA==
X-Gm-Message-State: AOAM530YD6b/X0ZFlhTTCsqQkr9dXChRzlS7/menYX5cXkcxdvVw5jpy
 qZAFqLraBq5gjeETPZ9xUu0qUDqmuAQJb8Xz5fdZwQ==
X-Google-Smtp-Source: ABdhPJwFoZcJcGd1oTntB+jTXRYWvHT8WC7Bu9Lm72cHxLY7c0uxSsBeE0QpIpftyseCEEqnkhlM5eJ1pCAOFhWaj6M=
X-Received: by 2002:a05:6830:2439:: with SMTP id
 k25mr2447692ots.352.1591249783290; 
 Wed, 03 Jun 2020 22:49:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200603083132.4610-1-tzimmermann@suse.de>
 <20200603083132.4610-9-tzimmermann@suse.de>
In-Reply-To: <20200603083132.4610-9-tzimmermann@suse.de>
From: John Stultz <john.stultz@linaro.org>
Date: Wed, 3 Jun 2020 22:49:31 -0700
Message-ID: <CALAqxLWnxsv8wuMjAWw=MAcf+2oyFLH2M=Av7owZCMgUpQexNw@mail.gmail.com>
Subject: Re: [PATCH v2 08/23] drm/hisilicon/kirin: Use GEM CMA object functions
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
> The kirin driver uses the default implementation for CMA functions. The
> DRM_GEM_CMA_DRIVER_OPS macro now sets these defaults in struct drm_driver.
>
> Using DRM_GEM_CMA_DRIVER_OPS introduces several changes: the driver now
> sets .gem_create_object to drm_cma_gem_create_object_default_funcs(),
> which sets CMA GEM object functions. GEM object functions implement the
> rsp operations where possible. Corresponding interfaces in struct drm_driver
> are cleared. Prime import now uses drm_gem_cma_prime_import_sg_table_vmap(),
> which maps the imported buffer upon import. Mmap operations are performed
> by drm_gem_prime_mmap(), which goes through GEM file operations. These
> changes have been part of the aspeed driver for some time.
>
> v2:
>         * use DRM_GEM_CMA_DRIVER_OPS
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
