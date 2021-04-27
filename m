Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA27236CC4F
	for <lists+dri-devel@lfdr.de>; Tue, 27 Apr 2021 22:32:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A83186E5C8;
	Tue, 27 Apr 2021 20:32:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com
 [IPv6:2607:f8b0:4864:20::734])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA0416E5C5
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Apr 2021 20:32:36 +0000 (UTC)
Received: by mail-qk1-x734.google.com with SMTP id t17so32928112qkg.4
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Apr 2021 13:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MS2OKshcN9CSvcsL4kOUzkvKDXWvU+Khw/xmOoW8cW4=;
 b=Y2KfOM9B7tcQyksUcZTgdHSTiQUSbkIxaACvwM8Qgl5LTTYUCUOOTMSOznIx3LHZat
 f210Af5bhrCdExTxjdefK37x6wBWCpNmPdJn9lMb+6ocib4CQsccvop/VLQX/c92g8AH
 AbVIrteY7C86ct1uByniufzia2nQWO1cR98TntIjtGq2aHBCFrKA0uzLK9IxqTpCF5Kk
 UCEvFAioCQJuBXytGDIupg+rfso4IBKEx7v61hkPrsXDlNwDBx1I14mVxeft8riJjAlC
 NHL4uqJFZcbvMT+ZyLx6V3IWZm4V/2O5hK7RjtyV6k1++g+HmkZf/eHOKXJsDCBdr676
 wcpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MS2OKshcN9CSvcsL4kOUzkvKDXWvU+Khw/xmOoW8cW4=;
 b=iKSh8apLk3jaZLxYQPJNC3E911tHRvxtR4UYuCMx3Kr4bFxHRm2p7+Z1MUHdRhXRLt
 9AG4EbkPw2n+nTQ2lUnw1N12+hegreq39lFBIm0Pa/MsKbCbW1s+HkfDhzNUSlAPVEPv
 thrpCN4QFJBLbXwvQEkz7Jv1LAhenZ1su/gt3+iQTUlJShVQmh4kv2r1+Jn+7GCz2dqE
 Pt9vPekSE3EvqnGbhgNxpkzIMIdOX/BjwMMPat12/bSJEXm6X5LVW363F2svoSSb2bYn
 wx+hrozOteyY7w0UlHBuJlQURSNek26s6ebhKE/oyVA3OiZ8nZCzxZ9S1pbAuxTyeaK/
 2msQ==
X-Gm-Message-State: AOAM532V0jqJcRRyX3E4nC9J4r9y0juOTz3yHxlnhT/O+2rNRxWlkAT/
 KN2FIvVW3yg0hVnGxAZOEtD9VLmvYvWkS1rAwdQQug==
X-Google-Smtp-Source: ABdhPJw1EdEd6zejUOKbfHG+ZNTPCYNGSXF1R3iDGZDvIXz5bBFaf98cJhngTYHkwNE95OwNyXJw0VCHyWm59Qhyl6Y=
X-Received: by 2002:ae9:c319:: with SMTP id n25mr25708607qkg.162.1619555556018; 
 Tue, 27 Apr 2021 13:32:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210427001828.2375555-1-dmitry.baryshkov@linaro.org>
 <20210427001828.2375555-4-dmitry.baryshkov@linaro.org>
 <f4a6a51ea5cc5bfbf747eb5544951076@codeaurora.org>
In-Reply-To: <f4a6a51ea5cc5bfbf747eb5544951076@codeaurora.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 27 Apr 2021 23:32:25 +0300
Message-ID: <CAA8EJprcOVqoFK+e66rDZenjFeMOqREEP-LRfmuSkJc2F5u-2A@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH v2 3/4] drm/msm: get rid of msm_iomap_size
To: Abhinav Kumar <abhinavk@codeaurora.org>
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
Cc: freedreno <freedreno@lists.freedesktop.org>,
 Jonathan Marek <jonathan@marek.ca>, Stephen Boyd <sboyd@kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, David Airlie <airlied@linux.ie>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 27 Apr 2021 at 22:30, <abhinavk@codeaurora.org> wrote:
>
> Hi Dmitry
>
> On 2021-04-26 17:18, Dmitry Baryshkov wrote:
> > Instead of looping throught the resources each time to get the DSI CTRL
> > area size, get it at the ioremap time.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> We will have to call into the individual modules anyway everytime we
> take a snapshot as only they have access to the required clocks and the
> base address.
>
> So even though there is nothing wrong with this change, it still adds a
> size member
> which can be avoided because we have to call into the module anyway.
>
> Any strong preference to store the size as opposed to just getting it
> when we take
> the snapshot?

Locality. We ioremap the resource from one piece of code and then we
get it's length from a completely different piece of code. If we ever
change e.g. the ioremap'ed resource name, we'd have to also update
snapshot users.
With this patch these changes are done in a transparent way. Whichever
we do with the regions in future, there is always a valid base + size
combo.

>
> > ---
> >  drivers/gpu/drm/msm/dsi/dsi_host.c |  5 +++--
> >  drivers/gpu/drm/msm/msm_drv.c      | 27 +++++++++------------------
> >  drivers/gpu/drm/msm/msm_drv.h      |  3 ++-
> >  3 files changed, 14 insertions(+), 21 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c
> > b/drivers/gpu/drm/msm/dsi/dsi_host.c
> > index 1a63368c3912..b3ee5c0bce12 100644
> > --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> > +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> > @@ -102,6 +102,7 @@ struct msm_dsi_host {
> >       int id;
> >
> >       void __iomem *ctrl_base;
> > +     phys_addr_t ctrl_size;
> >       struct regulator_bulk_data supplies[DSI_DEV_REGULATOR_MAX];
> >
> >       struct clk *bus_clks[DSI_BUS_CLK_MAX];
> > @@ -1839,7 +1840,7 @@ int msm_dsi_host_init(struct msm_dsi *msm_dsi)
> >               goto fail;
> >       }
> >
> > -     msm_host->ctrl_base = msm_ioremap(pdev, "dsi_ctrl", "DSI CTRL");
> > +     msm_host->ctrl_base = msm_ioremap_size(pdev, "dsi_ctrl", "DSI CTRL",
> > &msm_host->ctrl_size);
> >       if (IS_ERR(msm_host->ctrl_base)) {
> >               pr_err("%s: unable to map Dsi ctrl base\n", __func__);
> >               ret = PTR_ERR(msm_host->ctrl_base);
> > @@ -2494,7 +2495,7 @@ void msm_dsi_host_snapshot(struct msm_disp_state
> > *disp_state, struct mipi_dsi_ho
> >
> >       pm_runtime_get_sync(&msm_host->pdev->dev);
> >
> > -     msm_disp_snapshot_add_block(disp_state,
> > msm_iomap_size(msm_host->pdev, "dsi_ctrl"),
> > +     msm_disp_snapshot_add_block(disp_state, msm_host->ctrl_size,
> >                       msm_host->ctrl_base, "dsi%d_ctrl", msm_host->id);
> >
> >       pm_runtime_put_sync(&msm_host->pdev->dev);
> > diff --git a/drivers/gpu/drm/msm/msm_drv.c
> > b/drivers/gpu/drm/msm/msm_drv.c
> > index 92fe844b517b..be578fc4e54f 100644
> > --- a/drivers/gpu/drm/msm/msm_drv.c
> > +++ b/drivers/gpu/drm/msm/msm_drv.c
> > @@ -124,7 +124,7 @@ struct clk *msm_clk_get(struct platform_device
> > *pdev, const char *name)
> >  }
> >
> >  static void __iomem *_msm_ioremap(struct platform_device *pdev, const
> > char *name,
> > -                               const char *dbgname, bool quiet)
> > +                               const char *dbgname, bool quiet, phys_addr_t *psize)
> >  {
> >       struct resource *res;
> >       unsigned long size;
> > @@ -153,37 +153,28 @@ static void __iomem *_msm_ioremap(struct
> > platform_device *pdev, const char *name
> >       if (reglog)
> >               printk(KERN_DEBUG "IO:region %s %p %08lx\n", dbgname, ptr, size);
> >
> > +     if (psize)
> > +             *psize = size;
> > +
> >       return ptr;
> >  }
> >
> >  void __iomem *msm_ioremap(struct platform_device *pdev, const char
> > *name,
> >                         const char *dbgname)
> >  {
> > -     return _msm_ioremap(pdev, name, dbgname, false);
> > +     return _msm_ioremap(pdev, name, dbgname, false, NULL);
> >  }
> >
> >  void __iomem *msm_ioremap_quiet(struct platform_device *pdev, const
> > char *name,
> >                               const char *dbgname)
> >  {
> > -     return _msm_ioremap(pdev, name, dbgname, true);
> > +     return _msm_ioremap(pdev, name, dbgname, true, NULL);
> >  }
> >
> > -unsigned long msm_iomap_size(struct platform_device *pdev, const char
> > *name)
> > +void __iomem *msm_ioremap_size(struct platform_device *pdev, const
> > char *name,
> > +                       const char *dbgname, phys_addr_t *psize)
> >  {
> > -     struct resource *res;
> > -
> > -     if (name)
> > -             res = platform_get_resource_byname(pdev, IORESOURCE_MEM, name);
> > -     else
> > -             res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > -
> > -     if (!res) {
> > -             dev_dbg(&pdev->dev, "failed to get memory resource: %s\n",
> > -                             name);
> > -             return 0;
> > -     }
> > -
> > -     return resource_size(res);
> > +     return _msm_ioremap(pdev, name, dbgname, false, psize);
> >  }
> >
> >  void msm_writel(u32 data, void __iomem *addr)
> > diff --git a/drivers/gpu/drm/msm/msm_drv.h
> > b/drivers/gpu/drm/msm/msm_drv.h
> > index 15cb34451ded..c33fc1293789 100644
> > --- a/drivers/gpu/drm/msm/msm_drv.h
> > +++ b/drivers/gpu/drm/msm/msm_drv.h
> > @@ -450,9 +450,10 @@ struct clk *msm_clk_bulk_get_clock(struct
> > clk_bulk_data *bulk, int count,
> >       const char *name);
> >  void __iomem *msm_ioremap(struct platform_device *pdev, const char
> > *name,
> >               const char *dbgname);
> > +void __iomem *msm_ioremap_size(struct platform_device *pdev, const
> > char *name,
> > +             const char *dbgname, phys_addr_t *size);
> >  void __iomem *msm_ioremap_quiet(struct platform_device *pdev, const
> > char *name,
> >               const char *dbgname);
> > -unsigned long msm_iomap_size(struct platform_device *pdev, const char
> > *name);
> >  void msm_writel(u32 data, void __iomem *addr);
> >  u32 msm_readl(const void __iomem *addr);
> >  void msm_rmw(void __iomem *addr, u32 mask, u32 or);



-- 
With best wishes
Dmitry
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
