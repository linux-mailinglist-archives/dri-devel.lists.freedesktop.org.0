Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D6A39264303
	for <lists+dri-devel@lfdr.de>; Thu, 10 Sep 2020 11:57:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19C9C6E8ED;
	Thu, 10 Sep 2020 09:57:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A9406E8F4
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Sep 2020 09:57:22 +0000 (UTC)
Received: by mail-ot1-x343.google.com with SMTP id y5so4848259otg.5
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Sep 2020 02:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=b8o/OdIgmicw5SsCNp3Naz/+qmsku0fW0+vnOAgjeRQ=;
 b=lbENKBHnK8HQLUtN6t8VplidxfCxoX5K4jZeqGoVssrXlDImvZTG2rwIZ+Qd6Ad7Xg
 gP+UfXPkjv7Ljx+8p6viF0DjMEN6qv+iCguJagt9gvXXLucWEFBFfLPON39taOecj1tT
 TbIkQDfFk+YjILy4vCnwBCK5BAwbkvF4eqc44=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=b8o/OdIgmicw5SsCNp3Naz/+qmsku0fW0+vnOAgjeRQ=;
 b=OZF7Vu9drJMWzJkkv8NpA3yz06tzB6nhVwBOz9KwXtl+c0ZSojuHMGkrnwNvvWIGpz
 o6Q0UV07vmyLu4NDpT8W+wmmm3C9fGy1SGcbHErIscPwSa6+HTrpgiEq1O7OzxrZwgBx
 AFL6jmnjCB/tHBIgu8oOJPSZVOrG+D8x/nHP6Btcpn0HNaSHpbkpGGTuAd74U1n+4x3B
 HMB/RzwaZqpN1+cZRthWUXt4x+u8BknxcmmoGx73cnSuyqgk1ODNjx7AXTT4iKq6nC8D
 gcAas/WCAo1pKCpNhjaEFZ6YnwBXpTn1FCrbltiC9pYKMCEXN2I0DZ7pqAvYq4dNX1jT
 VMwg==
X-Gm-Message-State: AOAM533kL9c9nORyK39E69Ah4hdZNGromONCbfPJ5cKO9fKegoMBJuuM
 q3pVbVepUpq/jJqsTA6mkyR37juOFY1Nh3FYimM9ZA==
X-Google-Smtp-Source: ABdhPJyKbkeuE1movR4GhbYugiEC9r5oz6JkFiWCCSIKzBoYaqZy8qzK822tETc4HGQtg9spjqqob/CkaHFshNtZwrU=
X-Received: by 2002:a05:6830:14d9:: with SMTP id
 t25mr3575661otq.188.1599731841886; 
 Thu, 10 Sep 2020 02:57:21 -0700 (PDT)
MIME-Version: 1.0
References: <20200910095250.7663-1-laurentiu.palcu@oss.nxp.com>
In-Reply-To: <20200910095250.7663-1-laurentiu.palcu@oss.nxp.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 10 Sep 2020 11:57:10 +0200
Message-ID: <CAKMK7uGsJcg81a_cGebBgk3pwxj4VPrFfmV5AF+5fRyK3_Pigw@mail.gmail.com>
Subject: Re: [PATCH] drm/imx/dcss: fix compilation issue on 32bit
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
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
Cc: David Airlie <airlied@linux.ie>, Sascha Hauer <s.hauer@pengutronix.de>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Sep 10, 2020 at 11:53 AM Laurentiu Palcu
<laurentiu.palcu@oss.nxp.com> wrote:
>
> When compiling for 32bit platforms, the compilation fails with:
>
> ERROR: modpost: "__aeabi_ldivmod"
> [drivers/gpu/drm/imx/dcss/imx-dcss.ko] undefined!
> ERROR: modpost: "__aeabi_uldivmod"
> [drivers/gpu/drm/imx/dcss/imx-dcss.ko] undefined!
>
> This patch adds a dependency on ARM64 since no 32bit SoCs have DCSS, so far.

Usual way to fix this correctly is using the right division macros,
not limiting the driver to 64bit. But this works for now, would be
good to fix this properly for compile-testing and all that.

> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> Reported-by: Daniel Vetter <daniel@ffwll.ch>

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Please push to drm-misc-next.
-Daniel



---
>  drivers/gpu/drm/imx/dcss/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/imx/dcss/Kconfig b/drivers/gpu/drm/imx/dcss/Kconfig
> index 69860de8861f..2b17a964ff05 100644
> --- a/drivers/gpu/drm/imx/dcss/Kconfig
> +++ b/drivers/gpu/drm/imx/dcss/Kconfig
> @@ -3,7 +3,7 @@ config DRM_IMX_DCSS
>         select IMX_IRQSTEER
>         select DRM_KMS_CMA_HELPER
>         select VIDEOMODE_HELPERS
> -       depends on DRM && ARCH_MXC
> +       depends on DRM && ARCH_MXC && ARM64
>         help
>           Choose this if you have a NXP i.MX8MQ based system and want to use the
>           Display Controller Subsystem. This option enables DCSS support.
> --
> 2.17.1
>


-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
