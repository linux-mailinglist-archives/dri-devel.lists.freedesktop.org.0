Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93BAB3E10EB
	for <lists+dri-devel@lfdr.de>; Thu,  5 Aug 2021 11:11:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E72C89D57;
	Thu,  5 Aug 2021 09:11:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C84F989CA4
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Aug 2021 09:11:45 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id u3so9697077lff.9
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Aug 2021 02:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JGy6Zf1Gz/DvNLOUOgVqZw1voM6TCsaMrfyL2VVTA2M=;
 b=Czpou3fdBuvMRgQdRobXPBNmSPmet30GmWm2xaQ8xlkiaXiT9pq1VJ5Sz3m72V5qwc
 3gA09WBzEqX4wBMbAWb2aL+u3uxCI5tSmxJK2GrkgtzaztR0jzf0hXqnh/rxekaLRzCH
 XQ9NRRqtzN5mRX5BxSFi8xj4rJHxMs28Tw4tL+iOXcP378akJNAZm9rLVJ3kQ7Gx/wqU
 hmc9MxNHu7e2hVUrAzorRfo7qKK8MPzvzo8I0Z4M4QcsLfDNwbKFbO3Onvasga885UF+
 MuD438vz+7ymSeAsFMLiFokCcNh8DTEfPEy5F5HPk3V4dvqE2xr2ESyF0X6dAPBaiE+4
 WRVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JGy6Zf1Gz/DvNLOUOgVqZw1voM6TCsaMrfyL2VVTA2M=;
 b=C4hz6UDbZPgKAeDCT8hZ7UeP0OQmX2twgAco7w6bZu/GPAEGV4rvjRWJvDV4Jw45Bd
 NSqx6/nxRIy5GP66hPqu3FFwk0/3p5wrk5h+2IYqMSun93nZHAjiN95fpqhIHKLMrkcP
 9cFj4uL9sFRsuR9tdPITgXQffZl61dY151k3OhyRmaNlHUtD/zdXH31SrXU7AlaT448C
 OMJd6/mTFFxnPTaEx5zOqkJp0hL6G/FLAv6ExS3h0yEf3FPOeeFaNRBNgdjGUIKqKGZO
 uuvb7mIvLFw7NIQ/pX031Cm68Vv8ag3UvhIK57D52Ia7hL083b2DB+YFPA5ubcGNLDcf
 dRig==
X-Gm-Message-State: AOAM533Iy1OEURgH8rOjTVq49qC0r09V/TszCSSCFwop4qQ23VsHv2Zt
 HY16llbCXSAwypmsMCXAwTRqDdeFaKSipZGZtM6DdA==
X-Google-Smtp-Source: ABdhPJxrf9wmOoKiTifiOSKjkHpaxgSpZEW0ggxZq8N4Li6hZYEwsHuFZuOzq7JEu33rr4FIZfdLktcn7Mucw0+3gv4=
X-Received: by 2002:a05:6512:132a:: with SMTP id
 x42mr2814304lfu.291.1628154703391; 
 Thu, 05 Aug 2021 02:11:43 -0700 (PDT)
MIME-Version: 1.0
References: <1627098243-2742-1-git-send-email-dillon.minfei@gmail.com>
 <1627098243-2742-3-git-send-email-dillon.minfei@gmail.com>
In-Reply-To: <1627098243-2742-3-git-send-email-dillon.minfei@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 5 Aug 2021 11:11:31 +0200
Message-ID: <CACRpkdYReUdg_7oSTqcsA_+9tS9w6MH90=KV1rGyr4YWT=NW-w@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] ARM: dts: stm32: fix dtbs_check warning on ili9341
 dts binding
To: dillon min <dillon.minfei@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, 
 Dave Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>, kbuild-all@lists.01.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Jul 24, 2021 at 5:44 AM <dillon.minfei@gmail.com> wrote:

> From: Dillon Min <dillon.minfei@gmail.com>
>
> Since the compatible string defined from ilitek,ili9341.yaml is
> "st,sf-tc240t-9370-t", "ilitek,ili9341"
>
> so, append "ilitek,ili9341" to avoid the below dtbs_check warning.
>
> arch/arm/boot/dts/stm32f429-disco.dt.yaml: display@1: compatible:
> ['st,sf-tc240t-9370-t'] is too short
>
> Fixes: a726e2f000ec ("ARM: dts: stm32: enable ltdc binding with ili9341, gyro l3gd20 on stm32429-disco board")
> Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
> Reported-by: kernel test robot <lkp@intel.com>
> ---
> v4: no change.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Please funnel this patch through the STM and ARM SoC tree.

Yours,
Linus Walleij
