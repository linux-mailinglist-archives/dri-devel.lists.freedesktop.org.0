Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F66423AA2A
	for <lists+dri-devel@lfdr.de>; Mon,  3 Aug 2020 18:05:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1CF9897F9;
	Mon,  3 Aug 2020 16:05:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com
 [IPv6:2a00:1450:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3C4289D5B;
 Mon,  3 Aug 2020 16:05:39 +0000 (UTC)
Received: by mail-ej1-x642.google.com with SMTP id g19so25376870ejc.9;
 Mon, 03 Aug 2020 09:05:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ah4YH4xbs7o/4fq+m4lwGvpsZR2W5DSohgKfYKy8nDY=;
 b=RRT3NoZzMjb6Id7P0RK+UDCMsf5oZdEydsvBjoMiJcskzKRpOUEsQzx6qIvuoQlmDT
 u8vRodRqxLsPWN5Dbj2lA2PviILlK5OwWWUFTbYWQTvS9W6fhhBrOsCEbN5MkJ3IG9HW
 eIgu3QAEawQBR3Cv2vkjl2bXrYrf8zIgZ3UWAZ6DMQY0sW+2ac/IuRcOKVyhVykmSWRX
 Y74nTh4lPAbGDNg+C2zB/FD976THLzC5hXy9pS2ljImHkaOpf7cXMGodgJMan0Toee4N
 qte5ce3imkSfVSwKVxqNEM4LVNSKw9WHeyqYDiqh+Vos87hWhPJkMXhyevGdBlz6A9UA
 aKJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ah4YH4xbs7o/4fq+m4lwGvpsZR2W5DSohgKfYKy8nDY=;
 b=nnzYWJBKCbIbWD9JmnLj/Z8p8yw03mJN8Lig6l5SJVTPtXNY96xRAn474miKD6z3zr
 h7m1ARYRdzTDxi9i8x/ygCY5fLq2xrhCxYP+IE2Cvf8/LHmRnajRzR5rsUrIm7Adu5CM
 y8GJ7GpkAkp/p2VFnknoSpkaUFvJOaaO1FvlfEOKS5cjyTAFSyi7WDagkVtfcQ0ADZon
 MAesCW4JM6I/Tcp99QicePu+9AiUWht6Wp7hH9EOFRd+9/88Njlfa7plPfG/yCAWituP
 l8fn3FN9BOO3bisZjJQ0ZUUXtbGCVG+dgbD7taqU4eNBlBZ38r0+fNLLqjJnxG2VfLAa
 e8QQ==
X-Gm-Message-State: AOAM531sMCR5SYBkqVtg077KuL673LdfeCz9b9qlBgobjSlJBAkSfGM/
 JPzh2yCucfW7R2C02u6DsIj/aOGG35FQ1ZYzCh0=
X-Google-Smtp-Source: ABdhPJxIp3nRKzPD7aLMKkOD0USdNBngKLF1wq5jJex6eDWi4SWxesozUtiIOxBttUwOihyMdPPdYfhg8CuqAY8V+Gs=
X-Received: by 2002:a17:906:3449:: with SMTP id
 d9mr17737671ejb.460.1596470738295; 
 Mon, 03 Aug 2020 09:05:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200726111215.22361-1-konradybcio@gmail.com>
 <20200726111215.22361-5-konradybcio@gmail.com>
 <20200803110016.GL12965@vkoul-mobl>
In-Reply-To: <20200803110016.GL12965@vkoul-mobl>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 3 Aug 2020 09:06:22 -0700
Message-ID: <CAF6AEGtW29BtJPq1xDEtvtkPHFVWEd_QJk5FpJEQPbmofnS64Q@mail.gmail.com>
Subject: Re: [PATCH 4/9] drm/msm/dsi: Add phy configuration for SDM630/636/660
To: Vinod Koul <vkoul@kernel.org>
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
Cc: Krzysztof Wilczynski <kw@linux.com>,
 Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, David Airlie <airlied@linux.ie>,
 Michael Turquette <mturquette@baylibre.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 AngeloGioacchino Del Regno <kholk11@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, linux-clk <linux-clk@vger.kernel.org>,
 Konrad Dybcio <konradybcio@gmail.com>, Kishon Vijay Abraham I <kishon@ti.com>,
 martin.botka1@gmail.com, Andy Gross <agross@kernel.org>,
 Brian Masney <masneyb@onstation.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Xiaozhe Shi <xiaozhes@codeaurora.org>, Rob Herring <robh+dt@kernel.org>,
 Sean Paul <sean@poorly.run>, Ben Dooks <ben.dooks@codethink.co.uk>,
 Felipe Balbi <balbi@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux USB List <linux-usb@vger.kernel.org>,
 Harigovindan P <harigovi@codeaurora.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 zhengbin <zhengbin13@huawei.com>, Manu Gautam <mgautam@codeaurora.org>,
 freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 3, 2020 at 4:00 AM Vinod Koul <vkoul@kernel.org> wrote:
>
> On 26-07-20, 13:12, Konrad Dybcio wrote:
> > These SoCs make use of the 14nm phy, but at different
> > addresses than other 14nm units.
> >
> > Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
> > ---
> >  .../devicetree/bindings/display/msm/dsi.txt    |  1 +
> >  drivers/gpu/drm/msm/dsi/phy/dsi_phy.c          |  2 ++
> >  drivers/gpu/drm/msm/dsi/phy/dsi_phy.h          |  1 +
> >  drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c     | 18 ++++++++++++++++++
>
> Is there a reason why dsi phy needs to be here and not in phy subsystem
> drivers/phy/ ?

*maybe* it would be possible to split out all of the dsi (and hdmi)
phy to drivers/phy.  But splitting out just the new ones wouldn't be
practical (it would duplicate a lot of code, and make the rest of the
dsi code have to deal with both cases).  And unlike dp/usb-c I'm not
really sure I see an advantage to justify the churn.

BR,
-R

>
> >  4 files changed, 22 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/display/msm/dsi.txt b/Documentation/devicetree/bindings/display/msm/dsi.txt
> > index af95586c898f..7884fd7a85c1 100644
> > --- a/Documentation/devicetree/bindings/display/msm/dsi.txt
> > +++ b/Documentation/devicetree/bindings/display/msm/dsi.txt
> > @@ -87,6 +87,7 @@ Required properties:
> >    * "qcom,dsi-phy-20nm"
> >    * "qcom,dsi-phy-28nm-8960"
> >    * "qcom,dsi-phy-14nm"
> > +  * "qcom,dsi-phy-14nm-660"
> >    * "qcom,dsi-phy-10nm"
> >    * "qcom,dsi-phy-10nm-8998"
> >  - reg: Physical base address and length of the registers of PLL, PHY. Some
> > diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> > index f509ebd77500..009f5b843dd1 100644
> > --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> > +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> > @@ -499,6 +499,8 @@ static const struct of_device_id dsi_phy_dt_match[] = {
> >  #ifdef CONFIG_DRM_MSM_DSI_14NM_PHY
> >       { .compatible = "qcom,dsi-phy-14nm",
> >         .data = &dsi_phy_14nm_cfgs },
> > +     { .compatible = "qcom,dsi-phy-14nm-660",
> > +       .data = &dsi_phy_14nm_660_cfgs },
> >  #endif
> >  #ifdef CONFIG_DRM_MSM_DSI_10NM_PHY
> >       { .compatible = "qcom,dsi-phy-10nm",
> > diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> > index 24b294ed3059..ef8672d7b123 100644
> > --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> > +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> > @@ -45,6 +45,7 @@ extern const struct msm_dsi_phy_cfg dsi_phy_28nm_lp_cfgs;
> >  extern const struct msm_dsi_phy_cfg dsi_phy_20nm_cfgs;
> >  extern const struct msm_dsi_phy_cfg dsi_phy_28nm_8960_cfgs;
> >  extern const struct msm_dsi_phy_cfg dsi_phy_14nm_cfgs;
> > +extern const struct msm_dsi_phy_cfg dsi_phy_14nm_660_cfgs;
> >  extern const struct msm_dsi_phy_cfg dsi_phy_10nm_cfgs;
> >  extern const struct msm_dsi_phy_cfg dsi_phy_10nm_8998_cfgs;
> >
> > diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> > index 1594f1422372..519400501bcd 100644
> > --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> > +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> > @@ -161,3 +161,21 @@ const struct msm_dsi_phy_cfg dsi_phy_14nm_cfgs = {
> >       .io_start = { 0x994400, 0x996400 },
> >       .num_dsi_phy = 2,
> >  };
> > +
> > +const struct msm_dsi_phy_cfg dsi_phy_14nm_660_cfgs = {
> > +     .type = MSM_DSI_PHY_14NM,
> > +     .src_pll_truthtable = { {false, false}, {true, false} },
> > +     .reg_cfg = {
> > +             .num = 1,
> > +             .regs = {
> > +                     {"vcca", 17000, 32},
> > +             },
> > +     },
> > +     .ops = {
> > +             .enable = dsi_14nm_phy_enable,
> > +             .disable = dsi_14nm_phy_disable,
> > +             .init = dsi_14nm_phy_init,
> > +     },
> > +     .io_start = { 0xc994400, 0xc996000 },
> > +     .num_dsi_phy = 2,
> > +};
> > --
> > 2.27.0
>
> --
> ~Vinod
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
