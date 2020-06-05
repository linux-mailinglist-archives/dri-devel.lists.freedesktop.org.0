Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF1071EFCD6
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jun 2020 17:43:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE6CC6E938;
	Fri,  5 Jun 2020 15:43:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com
 [IPv6:2607:f8b0:4864:20::e44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2DBD6E938
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jun 2020 15:43:30 +0000 (UTC)
Received: by mail-vs1-xe44.google.com with SMTP id d21so5481551vsh.12
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Jun 2020 08:43:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DaW399j0+D4Xs4eLuSFZIWJCp5uF7FjJvuMOF1CdS3Y=;
 b=i/zJbAE3NTHr49faEOZ7ZTHaYM7oUsJamCx6nbaX2UCDODIsmWrg+aqIFKnVge6CBF
 wwHYqMAdZpdr6OqiNA3aLJqJm6ov9hIfBJqXiQX9HZlDErwMKiO6UkbuJscfEnKONPqv
 GSCVChfRAiND595Toqa2q9wswFZ5gyJyayy+8BYc/vfMNd+Qrp+5FjnUj7+NiV8c7mOA
 xXQ0VZ7PbQbRLB3AN6DghTdJa2U0D6BS4Dvx4PRgKZ89RJWjYwPGDIHbcfMIkykKNUm6
 pzIwLueLW0R8fi3LomqTTgvsvJDJTD5dIzeFfihfvVojfObFi6vT3toqEVF5paJUKlqU
 dfzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DaW399j0+D4Xs4eLuSFZIWJCp5uF7FjJvuMOF1CdS3Y=;
 b=K+OXWW/19CJKJnUslDHJzvgj0OvpqbP8q2WNnQOXk2c4qMxq3Ovz/b/mhBBzSW0kvD
 PqBlKxyLtrYluL3Dea17ZlyGyvw3pWtSsy3bbG34kSGGtUYyu5u5jbjGmhVSTfwACcKS
 peneRairL6w1yRGHnFF+aJBqydx4dA8n9BykK0+/jJMZcrAXPe9mWhKqMgYlqpUrv2ns
 Y0UTTT0uKcOqHwOtanbk1E2+UPMqX/31AeJZlxrB2dafrH72ZSzjF4OQbLFQAAVRM7+/
 QchQP3nWZU7ZBm+jmbt/YJF4u63fvq+NKs++4ONYY/63MnnCaOzeSs1lE3i34MyPWhNQ
 Ousg==
X-Gm-Message-State: AOAM532/fopWfevjVi9MdCupmiNCH8hjAoERR44JCS/sh8BEEmE0q7tH
 VNfR4UuVEqU/kWhM75spdkNqCCDzasHqqUAny7s=
X-Google-Smtp-Source: ABdhPJxeKLY63wzlnnXqjrGE1JM6FGhy2Qm1G31LDK7A50GrY+xaSvvt+Lka3vuuxrfsliwVnK3NAwnwuIHsjVYUAtw=
X-Received: by 2002:a67:c18a:: with SMTP id h10mr7469670vsj.186.1591371809904; 
 Fri, 05 Jun 2020 08:43:29 -0700 (PDT)
MIME-Version: 1.0
References: <20200605073247.4057-1-tzimmermann@suse.de>
In-Reply-To: <20200605073247.4057-1-tzimmermann@suse.de>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Fri, 5 Jun 2020 16:40:07 +0100
Message-ID: <CACvgo501LS_pcuiM_=BonJTnWEkcjC4m5yueEeJyv_c9Q8MAvQ@mail.gmail.com>
Subject: Re: [PATCH v3 00/43] Convert most CMA-based drivers to GEM object
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

On Fri, 5 Jun 2020 at 08:33, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> Most of the CMA-based drivers use the default implementation for the
> callbacks in struct drm_driver. With this patch, these interfaces are
> initialized with a common helper macro and GEM object functions replace
> several deprecated interfaces.
>
> To address Laurent's comment on the amount of changes per patch, I re-
> organized the series.
>
>  1) There are now DRIVER_OPS macros for drivers that require a virtual
>     address on imported buffers, and macros for drivers that don't. Therefore,
>     drivers don't switch to drm_gem_cma_prime_import_sg_table_vmap()
>     implicitly when they begin using the DRIVER_OPS macro.
>
>  2) I split each driver's patch into two: the first converts the driver to
>     GEM CMA object functions, the second introduces the DRIVER_OPS macro.
>     Neither patch should result in a functional change. I kept existing R-b
>     and A-b tags on both patches. Existing Tested-by tags are only on the
>     final patch, as that's closest to what has been tested.
>
>  3) I dropped the conversion to drm_gem_prime_mmap() from the patchset. As
>     part of this change, the CMA object functions could provide an mmap
>     function, which is worth it's own series. The patch for aspeed requires
>     drm_gem_prime_mmap(), so I removed it from the series.
>
> Patches 1 to 3 update the existing macro and helper to similar naming as with
> SHMEM, add a new DRIVER_OPS macro, and add helpers for drivers that override
> the default implementation for .dumb_create(). The remaining patches up to
> the final one convert the drivers. The kirin driver also changes to the
> default dumb_create function. The final patch deletes .gem_print_info from
> struct drm_driver.
>
> I don't have much of the hardware, so it's only compile-tested on aarch64,
> arm and x86-64 only. Several patches have Tested-by tags.
>

For the whole updated series:
Reviewed-by: Emil Velikov <emil.velikov@collabora.com>

-Emil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
