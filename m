Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14E0C4C9B4E
	for <lists+dri-devel@lfdr.de>; Wed,  2 Mar 2022 03:42:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8A8F10E2F5;
	Wed,  2 Mar 2022 02:42:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2b.google.com (mail-oo1-xc2b.google.com
 [IPv6:2607:f8b0:4864:20::c2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C68B910E2F5
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Mar 2022 02:42:25 +0000 (UTC)
Received: by mail-oo1-xc2b.google.com with SMTP id
 i10-20020a4aab0a000000b002fccf890d5fso444302oon.5
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Mar 2022 18:42:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Ykgq7t6xR8v30M7/6cP1OGyqZn4ErnnZl659hWeMgBI=;
 b=BBIzc32KIZEAnw5oPsFXsG8vQEQuwqR4lQ0ElGZCTRbVUPJD2voVG850DWnPjYxltq
 s9Z50JToZOtqxF7NmrjosIfBt01RBfnMhOMJgqUfK2Gv9nkr5Bey+SzYz8dpnqc3fxes
 fdoy56H4ywGyy2xS7zYe2orZfghFsFAhkQ5a2yYanFErT/i5i35/XEkQB2VcE0aeBb4K
 A9jKCzma05T6V5VCZf510scXKy1EPY9CKqonAPPh3TsJxwS4ii3H13J4/rrMDhWrzv/B
 tS+5qhsfYbqMHi4pTotvz0T4CDeMMgNcugvRmSqq7gHKz+5d9dhl12G31V9QLQEGFPbx
 hCtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Ykgq7t6xR8v30M7/6cP1OGyqZn4ErnnZl659hWeMgBI=;
 b=oFN+JjKJly54oU88BkKTACsQDrFD99mM6zqopAKKeG0fUOxrwiZjeIxrZQxt0e5kah
 758oEJg8TiOpHijYmseXHPY7ANxh/l5TbpDxhFaEDjYONO3/sLViHvzI727WUwo9RVDg
 uYnhmRZAM8jjQSYE9ctboGdl/ikUXQjwrK4cFIvdpdn3yqzUKejCQg7To1rbGo7GB7dU
 3HP5phWiiM9N01ofNeWZwWiZI1OUvWi40cwUFbq8Pg8YQRX2TM11ruI2hkZExQm72NKA
 5/3wishiH2URumJButXG03FdqPEeJraSi4BpPo05E2b5U8W/8Q+x4F42ug0hGOTylvEW
 AO9w==
X-Gm-Message-State: AOAM532HCR6WvLtW/GSvkxZZZn6HjZuhHyMA8+jK4Vfyw0ZgzCBBJDj6
 7VP7pnMYrQAS3NZzhjTE7DItCQ==
X-Google-Smtp-Source: ABdhPJwAg6PZVBHi6qfO5RvrzICxtMuFCam0r5vQpkQL45yF9sPlOztuyMXIA3oidh0VGNJ7eRrFlQ==
X-Received: by 2002:a05:6870:d906:b0:d7:10a2:7fd8 with SMTP id
 gq6-20020a056870d90600b000d710a27fd8mr9530472oab.123.1646188944896; 
 Tue, 01 Mar 2022 18:42:24 -0800 (PST)
Received: from ripper ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
 by smtp.gmail.com with ESMTPSA id
 u36-20020a056808152400b002d94715f853sm447946oiw.31.2022.03.01.18.42.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Mar 2022 18:42:24 -0800 (PST)
Date: Tue, 1 Mar 2022 18:44:16 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v2 2/2] drm/msm/dpu: Issue MDSS reset during initialization
Message-ID: <Yh7aAMZWJPjAeC1V@ripper>
References: <20220302012931.4107196-1-bjorn.andersson@linaro.org>
 <20220302012931.4107196-2-bjorn.andersson@linaro.org>
 <CAA8EJppiNbJhrdFgJ0sESBM5m3oyazS-8dG8919xdZu50fZ8aQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA8EJppiNbJhrdFgJ0sESBM5m3oyazS-8dG8919xdZu50fZ8aQ@mail.gmail.com>
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
Cc: devicetree@vger.kernel.org, Loic Poulain <loic.poulain@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue 01 Mar 17:47 PST 2022, Dmitry Baryshkov wrote:

> On Wed, 2 Mar 2022 at 04:27, Bjorn Andersson <bjorn.andersson@linaro.org> wrote:
> >
> > It's typical for the bootloader to bring up the display for showing a
> > boot splash or efi framebuffer. But in some cases the kernel driver ends
> > up only partially configuring (in particular) the DPU, which might
> > result in e.g. that two different data paths attempts to push data to
> > the interface - with resulting graphical artifacts.
> >
> > Naturally the end goal would be to inherit the bootloader's
> > configuration and provide the user with a glitch free handover from the
> > boot configuration to a running DPU.
> >
> > But as implementing seamless transition from the bootloader
> > configuration to the running OS will be a considerable effort, start by
> > simply resetting the entire MDSS to its power-on state, to avoid the
> > partial configuration.
> >
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > ---
> >
> > Changes since v1:
> > - Rather than trying to deconfigure individual pieces of the DPU, reset the
> >   entire block.
> >
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c | 18 ++++++++++++++++++
> >  drivers/gpu/drm/msm/msm_drv.c            |  4 ++++
> >  drivers/gpu/drm/msm/msm_kms.h            |  1 +
> >  3 files changed, 23 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
> > index b10ca505f9ac..419eaaefe606 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
> > @@ -7,6 +7,7 @@
> >  #include <linux/irqchip.h>
> >  #include <linux/irqdesc.h>
> >  #include <linux/irqchip/chained_irq.h>
> > +#include <linux/reset.h>
> >  #include "dpu_kms.h"
> >
> >  #define to_dpu_mdss(x) container_of(x, struct dpu_mdss, base)
> > @@ -31,6 +32,7 @@ struct dpu_mdss {
> >         void __iomem *mmio;
> >         struct clk_bulk_data *clocks;
> >         size_t num_clocks;
> > +       struct reset_control *reset;
> >         struct dpu_irq_controller irq_controller;
> >  };
> >
> > @@ -197,10 +199,18 @@ static void dpu_mdss_destroy(struct msm_mdss *mdss)
> >         dpu_mdss->mmio = NULL;
> >  }
> >
> > +static int dpu_mdss_reset(struct msm_mdss *mdss)
> > +{
> > +       struct dpu_mdss *dpu_mdss = to_dpu_mdss(mdss);
> > +
> > +       return reset_control_reset(dpu_mdss->reset);
> > +}
> > +
> >  static const struct msm_mdss_funcs mdss_funcs = {
> >         .enable = dpu_mdss_enable,
> >         .disable = dpu_mdss_disable,
> >         .destroy = dpu_mdss_destroy,
> > +       .reset = dpu_mdss_reset,
> >  };
> >
> >  int dpu_mdss_init(struct platform_device *pdev)
> > @@ -227,6 +237,13 @@ int dpu_mdss_init(struct platform_device *pdev)
> >         }
> >         dpu_mdss->num_clocks = ret;
> >
> > +       dpu_mdss->reset = devm_reset_control_get_optional_exclusive(&pdev->dev, NULL);
> > +       if (IS_ERR(dpu_mdss->reset)) {
> > +               ret = PTR_ERR(dpu_mdss->reset);
> > +               DPU_ERROR("failed to acquire mdss reset, ret=%d", ret);
> > +               goto reset_parse_err;
> > +       }
> > +
> >         dpu_mdss->base.dev = &pdev->dev;
> >         dpu_mdss->base.funcs = &mdss_funcs;
> >
> > @@ -252,6 +269,7 @@ int dpu_mdss_init(struct platform_device *pdev)
> >  irq_error:
> >         _dpu_mdss_irq_domain_fini(dpu_mdss);
> >  irq_domain_error:
> > +reset_parse_err:
> >  clk_parse_err:
> >         if (dpu_mdss->mmio)
> >                 devm_iounmap(&pdev->dev, dpu_mdss->mmio);
> > diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> > index 129fa841ac22..7595f83da3f1 100644
> > --- a/drivers/gpu/drm/msm/msm_drv.c
> > +++ b/drivers/gpu/drm/msm/msm_drv.c
> > @@ -388,6 +388,10 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
> >         if (ret)
> >                 return ret;
> >
> > +       /* Issue a reset of the entire MDSS */
> > +       if (priv->mdss && priv->mdss->funcs->reset)
> > +               priv->mdss->funcs->reset(priv->mdss);
> > +
> 
> I think this is incorrect. In this way reset happens after all
> subdevice are probed. They might have programmed some state of the
> corresponding block. The clocks are already registered, so the clock
> framework will be out of sync.

I went back and forth through the drivers and I believe at least the
idea is that we probe all the drivers, which will acquire some
resources.

Then in bind() we actually start to access the hardware (and acquire
more resources, for some reason).

> I think the reset should happen before calling of_platform_populate(),
> so the device state is consistent with the driver.
> 

Perhaps I'm misunderstanding the component framework, but I was under
the impression that if any of the subcomponents fails to probe because
of lacking resources, this could be printed on the efifb before we reset
the hardware. Making errors slightly more user friendly.

I.e. in the timeframe between of_platform_populate() and
component_bind_all() below...


But if you believe I'm incorrect on the assumptions about the hardware
not being accessed before this point, I can move the reset before
of_platform_populate() - this is the last piece needed to have
functional eDP on sc8180x.

> Also see the https://git.linaro.org/people/dmitry.baryshkov/kernel.git/log/?h=dpu-mdss-rework,
> which reworks the mdss driver and mdss probing.
> 

There seems to be some room for reducing duplication between the two
drivers, so this seems reasonable.

Regards,
Bjorn

> >         /* Bind all our sub-components: */
> >         ret = component_bind_all(dev, ddev);
> >         if (ret)
> > diff --git a/drivers/gpu/drm/msm/msm_kms.h b/drivers/gpu/drm/msm/msm_kms.h
> > index 2a4f0526cb98..716a34fca1cd 100644
> > --- a/drivers/gpu/drm/msm/msm_kms.h
> > +++ b/drivers/gpu/drm/msm/msm_kms.h
> > @@ -205,6 +205,7 @@ struct msm_mdss_funcs {
> >         int (*enable)(struct msm_mdss *mdss);
> >         int (*disable)(struct msm_mdss *mdss);
> >         void (*destroy)(struct msm_mdss *mdss);
> > +       int (*reset)(struct msm_mdss *mdss);
> >  };
> >
> >  struct msm_mdss {
> > --
> > 2.33.1
> >
> 
> 
> -- 
> With best wishes
> Dmitry
