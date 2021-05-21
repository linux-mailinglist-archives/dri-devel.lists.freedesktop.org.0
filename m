Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B62738C8FA
	for <lists+dri-devel@lfdr.de>; Fri, 21 May 2021 16:11:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B86C6F87F;
	Fri, 21 May 2021 14:11:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72FB46F87F;
 Fri, 21 May 2021 14:10:00 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id a11so20286874ioo.0;
 Fri, 21 May 2021 07:10:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rgp+As3KlbEBKSyVtxsdvRFYlyX0rJUqDcyGgOG4188=;
 b=rCvHAT1e9N+Z+rjcivIbW+yWiuaTrYUO4h7otm2/sRCHaUk8pHxU4B3+PkmI3d0ZRJ
 2tAzBYA0FogjgbAW9UHIPwWHSJqgoogcJk+KIxo9bKBoFrhp5PDLOIkEL9pExfV5qjoo
 WgzhYo/qWms4xYCdozWOV/TKQivldqCSJmrbLDXIAazejM/OtE+9GQCH4nacmJzStpjG
 BjJf4OjkQJ44BYLrYcH1vgch1bc9kA1cg2kKmfMtI/+126z7oFd71CzcEoYOufDuYUy2
 yk0jOfGH+/6HiIgsfUp30JWLGgCVUWja0/QtiKJ8pn7eVEIIW2BgHxpDpAUalZn3IwKh
 vAUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rgp+As3KlbEBKSyVtxsdvRFYlyX0rJUqDcyGgOG4188=;
 b=akM+ZnxbbzwAC8b0YHYfQhyReWC/JWgFIqbrEFgYQt7hHb0AiqGu91nhfO2Y3E94OA
 CHA7z6l0rqzrQP4YfiUuX3m2i7BrDxwOtkgX/hFp9bUzsWGBwp5KY1eV8R5YT8gokA78
 H4bqy1k1mJeVfYejQvXQDYNA5rjX4JIL1Nz22kWRQfBVYOA3q80N9MeK9+s07ANG290A
 m/uvqNgymTbV+4m7lOyBi9s1DAprqC0DRjquctjwHXMs5bLw5zbUCyQZJ54qywD9ci8M
 nTIef3JFitnDAkOgDIXX0QGX/jr5Tx2LFEUp5jsvN45DnKu7Dt7QSYt6ycAvGpsVEqsp
 pE2A==
X-Gm-Message-State: AOAM532BtXvi+gIG/oVsx3AdfPXa46+0cra98oMKfkGd1M0xr4ic514x
 Un4AggJBbWBts5R8sDzeQv8wpbshJDThP46v1ZI=
X-Google-Smtp-Source: ABdhPJx963ZKIoMW0yX6SSKHV7v9iBzcVj51DKJpySvD2v+xqvtzSsBZXXpCXXZJOjbXRyJqMGA75GXapMiUzwK9shY=
X-Received: by 2002:a05:6602:14c8:: with SMTP id
 b8mr11637904iow.209.1621606199837; 
 Fri, 21 May 2021 07:09:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210521124946.3617862-1-vkoul@kernel.org>
In-Reply-To: <20210521124946.3617862-1-vkoul@kernel.org>
From: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date: Fri, 21 May 2021 08:09:49 -0600
Message-ID: <CAOCk7Nqep_Db+z3fr5asHZ1u0j8+6fKkPFs2Ai8CbA_zGqV6ZA@mail.gmail.com>
Subject: Re: [Freedreno] [RFC PATCH 00/13] drm/msm: Add Display Stream
 Compression Support
To: Vinod Koul <vkoul@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Fri, 21 May 2021 14:11:28 +0000
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
Cc: DTML <devicetree@vger.kernel.org>, Jonathan Marek <jonathan@marek.ca>,
 David Airlie <airlied@linux.ie>, MSM <linux-arm-msm@vger.kernel.org>,
 lkml <linux-kernel@vger.kernel.org>, Abhinav Kumar <abhinavk@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 21, 2021 at 6:50 AM Vinod Koul <vkoul@kernel.org> wrote:
>
> Display Stream Compression (DSC) compresses the display stream in host which
> is later decoded by panel. This series enables this for Qualcomm msm driver.
> This was tested on Google Pixel3 phone which use LGE SW43408 panel.
>
> The changes include adding DT properties for DSC then hardware blocks support
> required in DPU1 driver and support in encoder. We also add support in DSI
> and introduce required topology changes.
>
> In order for panel to set the DSC parameters we add dsc in drm_panel and set
> it from the msm driver.
>
> Complete changes which enable this for Pixel3 along with panel driver (not
> part of this series) and DT changes can be found at:
> git.linaro.org/people/vinod.koul/kernel.git pixel/dsc_rfc
>
> Comments welcome!

This feels backwards to me.  I've only skimmed this series, and the DT
changes didn't come through for me, so perhaps I have an incomplete
view.

DSC is not MSM specific.  There is a standard for it.  Yet it looks
like everything is implemented in a MSM specific way, and then pushed
to the panel.  So, every vendor needs to implement their vendor
specific way to get the DSC info, and then push it to the panel?
Seems wrong, given there is an actual standard for this feature.

Additionally, we define panel properties (resolution, BPP, etc) at the
panel, and have the display drivers pull it from the panel.  However,
for DSC, you do the reverse (define it in the display driver, and push
it to the panel).  If the argument is that DSC properties can be
dynamic, well, so can resolution.  Every panel for MSM MTPs supports
multiple resolutions, yet we define that with the panel in Linux.

Finally, I haven't seen the DT bits, but I'm concerned about using DT
for this.  It inherently excludes ACPI systems.  You appear to have
sdm845 support in this series, but what about ACPI boot on the Lenovo
C630 for example?  Or any of the 8cx laptops?  We don't read the panel
resolution, etc from DT, so why the DSC?

I'm glad that work is being done to add DSC to Linux, it's something I
struggled with when working on the 8998 mtp, and I realize this is a
bit of a drive-by review.  However, it seems like there should be a
better way.

>
> Vinod Koul (13):
>   drm/dsc: Add dsc pps header init function
>   dt-bindings: msm/dsi: Document Display Stream Compression (DSC)
>     parameters
>   drm/msm/dsi: add support for dsc data
>   drm/msm/disp/dpu1: Add support for DSC
>   drm/msm/disp/dpu1: Add support for DSC in pingpong block
>   drm/msm/disp/dpu1: Add DSC support in RM
>   drm/msm/disp/dpu1: Add DSC for SDM845 to hw_catalog
>   drm/msm/disp/dpu1: Add DSC support in hw_ctl
>   drm/msm/disp/dpu1: Don't use DSC with mode_3d
>   drm/msm/disp/dpu1: Add support for DSC in encoder
>   drm/msm/disp/dpu1: Add support for DSC in topology
>   drm/msm/dsi: Add support for DSC configuration
>   drm/msm/dsi: Pass DSC params to drm_panel
>
>  .../devicetree/bindings/display/msm/dsi.txt   |  15 +
>  drivers/gpu/drm/drm_dsc.c                     |  11 +
>  drivers/gpu/drm/msm/Makefile                  |   1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   | 204 +++++++++++-
>  .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  |  11 +
>  .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  |   2 +
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |  22 ++
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  26 ++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c    |  12 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h    |   2 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c    | 221 +++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h    |  79 +++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h   |  13 +
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c   |  32 ++
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h   |  14 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h       |   1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c        |  32 ++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h        |   1 +
>  drivers/gpu/drm/msm/dsi/dsi.xml.h             |  10 +
>  drivers/gpu/drm/msm/dsi/dsi_host.c            | 293 +++++++++++++++++-
>  drivers/gpu/drm/msm/msm_drv.h                 |  32 ++
>  include/drm/drm_dsc.h                         |  16 +
>  include/drm/drm_panel.h                       |   7 +
>  23 files changed, 1043 insertions(+), 14 deletions(-)
>  create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
>  create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h
>
> --
> 2.26.3
>
> _______________________________________________
> Freedreno mailing list
> Freedreno@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/freedreno
