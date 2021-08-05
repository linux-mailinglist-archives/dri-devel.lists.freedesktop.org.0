Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 719C63E1130
	for <lists+dri-devel@lfdr.de>; Thu,  5 Aug 2021 11:20:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8609B6E47E;
	Thu,  5 Aug 2021 09:20:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE9D46E47E
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Aug 2021 09:20:17 +0000 (UTC)
Received: by mail-io1-xd35.google.com with SMTP id h1so5808181iol.9
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Aug 2021 02:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Gmxmbal5kN8ALwaA2TjN7nOaacEIqVHPBww5o4ZLZEc=;
 b=OTPZ/ue8FcpPntTRetaZvV8hc8RlWy4XkuE+tMA6Qhva/AlRgX3auNlI7HPA6+z1o3
 RQdc8lK1I0XdtJI+wvPo5hcETJGwZY7n8z+rIKfMMvwyUuP7J+/Zyg7x4ldMpuR+qC+D
 X0V7XPd7lHhuJMx+yufSuxAxE8aloRNUKA6oOJ9Y+GpQN3rZ0TBLxhGMkbfXaY+gMMMk
 5Hab3YAiMmwkbdY/qIvj5rRVxj08OiMDIl/xKygyhWEek6Cl0gyVorEotDqenuPEei5h
 PFeiWo277J9nvXLcWtdbffBURbQzRqze1M9GrvmBL+FI7tvWiV2vM7PJvdbowaGyxUAU
 BZVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Gmxmbal5kN8ALwaA2TjN7nOaacEIqVHPBww5o4ZLZEc=;
 b=WP+eFp64ybqsx7F73eGg/hmh98/YiXPcyzPUt5EbWsJyJ1YKthqe9LiLL/o+ffjn8H
 tZIez6z/ghwFYaiLG/6A2yAgKemtmKU/aQnSNKeMmEEzuLWrxXxuZXjlXMQ69kiW/oP8
 BzHTN76dSO2GO1ErSuMrh2wtri5/Th2+/4h/cEzZbqXm7ENIavC6UIyyAUTyHYhH0+6B
 p/kpr4xDrjRLR5ldM2ewXQiIIQycuw6k42qLnrRmmtORdvhLQp2VbbxN8ferDZiEeIwk
 9Qk/TCRg+WTwdhJ+1kFG4BMKE4dAYnHc9vvRPmwVYKmPBpaO21GkRjlMr5cZxZR7/6f6
 pbMQ==
X-Gm-Message-State: AOAM530CLW/Pj+kiLpbgzinfaKNrry1XACVsBpeOBAARxTS4xrKVqgI7
 Cx9K1qL40wksK5hOVRP/IdUrBsH/ag+3ph1uoMg=
X-Google-Smtp-Source: ABdhPJzj90GzKVMvuigvCbMYK6QaClIQIGsSj4o9T55BNJMS+gKSjLMfX+sql1HcMcsIKDElrvqSZjS0mJLvMJ7GhxQ=
X-Received: by 2002:a02:b047:: with SMTP id q7mr3722748jah.130.1628155217097; 
 Thu, 05 Aug 2021 02:20:17 -0700 (PDT)
MIME-Version: 1.0
References: <1627098243-2742-1-git-send-email-dillon.minfei@gmail.com>
 <1627098243-2742-3-git-send-email-dillon.minfei@gmail.com>
 <CACRpkdYReUdg_7oSTqcsA_+9tS9w6MH90=KV1rGyr4YWT=NW-w@mail.gmail.com>
In-Reply-To: <CACRpkdYReUdg_7oSTqcsA_+9tS9w6MH90=KV1rGyr4YWT=NW-w@mail.gmail.com>
From: Dillon Min <dillon.minfei@gmail.com>
Date: Thu, 5 Aug 2021 17:19:41 +0800
Message-ID: <CAL9mu0LfcLS1iNQnamxA_oTrxu8eEBpUm+u92V2d9-8qz6hvow@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] ARM: dts: stm32: fix dtbs_check warning on ili9341
 dts binding
To: Linus Walleij <linus.walleij@linaro.org>, 
 Alexandre TORGUE <Alexandre.torgue@foss.st.com>,
 Peter Robinson <pbrobinson@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, 
 Dave Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>, 
 kbuild-all@lists.01.org, linux-stm32@st-md-mailman.stormreply.com, 
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

Hi Linus

Thanks.

On Thu, 5 Aug 2021 at 17:11, Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Sat, Jul 24, 2021 at 5:44 AM <dillon.minfei@gmail.com> wrote:
>
> > From: Dillon Min <dillon.minfei@gmail.com>
> >
> > Since the compatible string defined from ilitek,ili9341.yaml is
> > "st,sf-tc240t-9370-t", "ilitek,ili9341"
> >
> > so, append "ilitek,ili9341" to avoid the below dtbs_check warning.
> >
> > arch/arm/boot/dts/stm32f429-disco.dt.yaml: display@1: compatible:
> > ['st,sf-tc240t-9370-t'] is too short
> >
> > Fixes: a726e2f000ec ("ARM: dts: stm32: enable ltdc binding with ili9341, gyro l3gd20 on stm32429-disco board")
> > Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
> > Reported-by: kernel test robot <lkp@intel.com>
> > ---
> > v4: no change.
>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>
> Please funnel this patch through the STM and ARM SoC tree.

Sure, I will let Alex know. Thanks for your help on this driver.

Hi Alex,
Should I send v5 with Linus's Reviewed-by tag on this patch? thanks.

Best Regards
Dillon

>
> Yours,
> Linus Walleij
