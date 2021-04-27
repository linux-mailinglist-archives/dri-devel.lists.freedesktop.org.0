Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F82136CE7D
	for <lists+dri-devel@lfdr.de>; Wed, 28 Apr 2021 00:12:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D41089F01;
	Tue, 27 Apr 2021 22:12:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDC0689F01
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Apr 2021 22:12:38 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1619561558; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=ZZTj7FiylGjNBbDgsDgdz8DmIO9flj5bpksv2ey1C2s=;
 b=nJKJhUh18x1K6pSBz98lYFyvOPoA+6GE78ChM6WGo7LxuQwNBF7h7DLCN4ykJpkEjDQhILZI
 TOpxYKeMvLXTQ8JjtIBp5rPM+U9Q75PJ3YTSrLdca8TxkcGu0zI1HJG+aYd2MmbZB3ClyDcB
 qaUiwvteUA4t5SHYwwUfom87fOE=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 60888c56febcffa80fd046d9 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 27 Apr 2021 22:12:38
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id EB004C433F1; Tue, 27 Apr 2021 22:12:37 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id A96D3C433D3;
 Tue, 27 Apr 2021 22:12:33 +0000 (UTC)
MIME-Version: 1.0
Date: Tue, 27 Apr 2021 15:12:33 -0700
From: abhinavk@codeaurora.org
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [Freedreno] [PATCH v2 3/4] drm/msm: get rid of msm_iomap_size
In-Reply-To: <CAA8EJprcOVqoFK+e66rDZenjFeMOqREEP-LRfmuSkJc2F5u-2A@mail.gmail.com>
References: <20210427001828.2375555-1-dmitry.baryshkov@linaro.org>
 <20210427001828.2375555-4-dmitry.baryshkov@linaro.org>
 <f4a6a51ea5cc5bfbf747eb5544951076@codeaurora.org>
 <CAA8EJprcOVqoFK+e66rDZenjFeMOqREEP-LRfmuSkJc2F5u-2A@mail.gmail.com>
Message-ID: <240cf1a9bfaa4ee958d856277cd215b6@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
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
Cc: Sean Paul <sean@poorly.run>, Jonathan Marek <jonathan@marek.ca>,
 Stephen Boyd <sboyd@kernel.org>, "open list:DRM DRIVER
 FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>, "open list:DRM DRIVER
 FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, David Airlie <airlied@linux.ie>,
 freedreno <freedreno@lists.freedesktop.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-04-27 13:32, Dmitry Baryshkov wrote:
> On Tue, 27 Apr 2021 at 22:30, <abhinavk@codeaurora.org> wrote:
>> 
>> Hi Dmitry
>> 
>> On 2021-04-26 17:18, Dmitry Baryshkov wrote:
>> > Instead of looping throught the resources each time to get the DSI CTRL
>> > area size, get it at the ioremap time.
>> >
>> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> We will have to call into the individual modules anyway everytime we
>> take a snapshot as only they have access to the required clocks and 
>> the
>> base address.
>> 
>> So even though there is nothing wrong with this change, it still adds 
>> a
>> size member
>> which can be avoided because we have to call into the module anyway.
>> 
>> Any strong preference to store the size as opposed to just getting it
>> when we take
>> the snapshot?
> 
> Locality. We ioremap the resource from one piece of code and then we
> get it's length from a completely different piece of code. If we ever
> change e.g. the ioremap'ed resource name, we'd have to also update
> snapshot users.
> With this patch these changes are done in a transparent way. Whichever
> we do with the regions in future, there is always a valid base + size
> combo.
> 
Alright, no further concerns from my side on this:

Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>

>> 
>> > ---
>> >  drivers/gpu/drm/msm/dsi/dsi_host.c |  5 +++--
>> >  drivers/gpu/drm/msm/msm_drv.c      | 27 +++++++++------------------
>> >  drivers/gpu/drm/msm/msm_drv.h      |  3 ++-
>> >  3 files changed, 14 insertions(+), 21 deletions(-)
>> >
>> > diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c
>> > b/drivers/gpu/drm/msm/dsi/dsi_host.c
>> > index 1a63368c3912..b3ee5c0bce12 100644
>> > --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
>> > +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
>> > @@ -102,6 +102,7 @@ struct msm_dsi_host {
>> >       int id;
>> >
>> >       void __iomem *ctrl_base;
>> > +     phys_addr_t ctrl_size;
>> >       struct regulator_bulk_data supplies[DSI_DEV_REGULATOR_MAX];
>> >
>> >       struct clk *bus_clks[DSI_BUS_CLK_MAX];
>> > @@ -1839,7 +1840,7 @@ int msm_dsi_host_init(struct msm_dsi *msm_dsi)
>> >               goto fail;
>> >       }
>> >
>> > -     msm_host->ctrl_base = msm_ioremap(pdev, "dsi_ctrl", "DSI CTRL");
>> > +     msm_host->ctrl_base = msm_ioremap_size(pdev, "dsi_ctrl", "DSI CTRL",
>> > &msm_host->ctrl_size);
>> >       if (IS_ERR(msm_host->ctrl_base)) {
>> >               pr_err("%s: unable to map Dsi ctrl base\n", __func__);
>> >               ret = PTR_ERR(msm_host->ctrl_base);
>> > @@ -2494,7 +2495,7 @@ void msm_dsi_host_snapshot(struct msm_disp_state
>> > *disp_state, struct mipi_dsi_ho
>> >
>> >       pm_runtime_get_sync(&msm_host->pdev->dev);
>> >
>> > -     msm_disp_snapshot_add_block(disp_state,
>> > msm_iomap_size(msm_host->pdev, "dsi_ctrl"),
>> > +     msm_disp_snapshot_add_block(disp_state, msm_host->ctrl_size,
>> >                       msm_host->ctrl_base, "dsi%d_ctrl", msm_host->id);
>> >
>> >       pm_runtime_put_sync(&msm_host->pdev->dev);
>> > diff --git a/drivers/gpu/drm/msm/msm_drv.c
>> > b/drivers/gpu/drm/msm/msm_drv.c
>> > index 92fe844b517b..be578fc4e54f 100644
>> > --- a/drivers/gpu/drm/msm/msm_drv.c
>> > +++ b/drivers/gpu/drm/msm/msm_drv.c
>> > @@ -124,7 +124,7 @@ struct clk *msm_clk_get(struct platform_device
>> > *pdev, const char *name)
>> >  }
>> >
>> >  static void __iomem *_msm_ioremap(struct platform_device *pdev, const
>> > char *name,
>> > -                               const char *dbgname, bool quiet)
>> > +                               const char *dbgname, bool quiet, phys_addr_t *psize)
>> >  {
>> >       struct resource *res;
>> >       unsigned long size;
>> > @@ -153,37 +153,28 @@ static void __iomem *_msm_ioremap(struct
>> > platform_device *pdev, const char *name
>> >       if (reglog)
>> >               printk(KERN_DEBUG "IO:region %s %p %08lx\n", dbgname, ptr, size);
>> >
>> > +     if (psize)
>> > +             *psize = size;
>> > +
>> >       return ptr;
>> >  }
>> >
>> >  void __iomem *msm_ioremap(struct platform_device *pdev, const char
>> > *name,
>> >                         const char *dbgname)
>> >  {
>> > -     return _msm_ioremap(pdev, name, dbgname, false);
>> > +     return _msm_ioremap(pdev, name, dbgname, false, NULL);
>> >  }
>> >
>> >  void __iomem *msm_ioremap_quiet(struct platform_device *pdev, const
>> > char *name,
>> >                               const char *dbgname)
>> >  {
>> > -     return _msm_ioremap(pdev, name, dbgname, true);
>> > +     return _msm_ioremap(pdev, name, dbgname, true, NULL);
>> >  }
>> >
>> > -unsigned long msm_iomap_size(struct platform_device *pdev, const char
>> > *name)
>> > +void __iomem *msm_ioremap_size(struct platform_device *pdev, const
>> > char *name,
>> > +                       const char *dbgname, phys_addr_t *psize)
>> >  {
>> > -     struct resource *res;
>> > -
>> > -     if (name)
>> > -             res = platform_get_resource_byname(pdev, IORESOURCE_MEM, name);
>> > -     else
>> > -             res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>> > -
>> > -     if (!res) {
>> > -             dev_dbg(&pdev->dev, "failed to get memory resource: %s\n",
>> > -                             name);
>> > -             return 0;
>> > -     }
>> > -
>> > -     return resource_size(res);
>> > +     return _msm_ioremap(pdev, name, dbgname, false, psize);
>> >  }
>> >
>> >  void msm_writel(u32 data, void __iomem *addr)
>> > diff --git a/drivers/gpu/drm/msm/msm_drv.h
>> > b/drivers/gpu/drm/msm/msm_drv.h
>> > index 15cb34451ded..c33fc1293789 100644
>> > --- a/drivers/gpu/drm/msm/msm_drv.h
>> > +++ b/drivers/gpu/drm/msm/msm_drv.h
>> > @@ -450,9 +450,10 @@ struct clk *msm_clk_bulk_get_clock(struct
>> > clk_bulk_data *bulk, int count,
>> >       const char *name);
>> >  void __iomem *msm_ioremap(struct platform_device *pdev, const char
>> > *name,
>> >               const char *dbgname);
>> > +void __iomem *msm_ioremap_size(struct platform_device *pdev, const
>> > char *name,
>> > +             const char *dbgname, phys_addr_t *size);
>> >  void __iomem *msm_ioremap_quiet(struct platform_device *pdev, const
>> > char *name,
>> >               const char *dbgname);
>> > -unsigned long msm_iomap_size(struct platform_device *pdev, const char
>> > *name);
>> >  void msm_writel(u32 data, void __iomem *addr);
>> >  u32 msm_readl(const void __iomem *addr);
>> >  void msm_rmw(void __iomem *addr, u32 mask, u32 or);
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
