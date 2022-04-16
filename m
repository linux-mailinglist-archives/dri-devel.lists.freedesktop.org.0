Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4030B5037D1
	for <lists+dri-devel@lfdr.de>; Sat, 16 Apr 2022 20:10:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D331310E3DA;
	Sat, 16 Apr 2022 18:10:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com
 [IPv6:2607:f8b0:4864:20::112f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7DF210E376
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Apr 2022 18:10:37 +0000 (UTC)
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-2db2add4516so109019237b3.1
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Apr 2022 11:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TQyXa5N+5U7AWUvtU85FavtGdfF9qIW7BLvXU5Z3KBE=;
 b=Vc0OiWKy7tLZQQEjqbdvpH5yJuYoNbTVn4rHHJX6BWbtkR5qJ2IxK8UY4IqUdmX1li
 K2CrzBj7y+L0HRRFaRekYP4oQdmuHvLXGvTFpIrLF+rIkTYnRVePa4pDPwSbuTblt7/Z
 n0RVgnNoKDU67iRf6gzyq9jVQfk1NlH7xBp/wHf2JoMqWu1fv3vZUiMESmBDaeq2yBFz
 V6bADInIXHmEBA/49EfFyl5hQ2zUv60d7RNIfZpnezBwykBLgjEIBqOWGTjmSI5cKjrj
 MVPw2EKPOjX4hjvAa9kneqMm+gIcR/JbO199SotXZ3pyJbrDkwtWFLx3WyR+Mbo+JDfa
 J+VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TQyXa5N+5U7AWUvtU85FavtGdfF9qIW7BLvXU5Z3KBE=;
 b=3zRfXXvDpgg73s+X4B2SLYTwQXfQza8U02V0+coVvoS8ZUUVqRTE+O9TL7tniOVImg
 z4uGp3vtC2F4vxB1fhb3cd6V2MO7bCdFTAH85WWJJXNN2V9S8ksyYifiACWdUy/gcCsK
 6JKvo0SC7rqPGPxsryrypEdvAkyH1DPkwgiWpw7KFLTS0XygCe9IRFTgKHG1ptQNpMtT
 T+OEBOk3kEqdE9I6QQZhK9ejU0G3qRgjoIXW5WJBomIOIryS71k254Kg86Wf2nxLBBCq
 bfMxzPXQiYaCnqyYbT7Al54pxVIXLm3pwQGaWGGzaRvGHk3tU3RjC9frzkNlrhBuC8i2
 MWBg==
X-Gm-Message-State: AOAM5322IKVlLvqo4mSUkBfL1AaFlUxshxLzbVuH/jMhE2d00cPX1DRg
 WdhTvYwzWIQZ8618aQA6fxdaAifLFivDr6Hsyht1sw==
X-Google-Smtp-Source: ABdhPJybbVGgDfVnqisaD6M45UdoMxT+mQttilTSKM57Uc1TnQMRMbmQhcdR5SYx5a4IYj/gzzmBTZMLmOrYhUXccF0=
X-Received: by 2002:a81:753:0:b0:2eb:ebe9:ff4f with SMTP id
 80-20020a810753000000b002ebebe9ff4fmr3644787ywh.255.1650132636893; Sat, 16
 Apr 2022 11:10:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220401231104.967193-1-dmitry.baryshkov@linaro.org>
 <20220416091229.pwek4wblroaabhio@SoMainline.org>
In-Reply-To: <20220416091229.pwek4wblroaabhio@SoMainline.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 16 Apr 2022 21:10:25 +0300
Message-ID: <CAA8EJppnMesPJrqv=FxEQzuvNM0Xyk_aSg-FUh-smfWcO=Tr2g@mail.gmail.com>
Subject: Re: drm/msm/dsi: fix error checks and return values for DSI xmit
 functions
To: Marijn Suijten <marijn.suijten@somainline.org>
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <sean@poorly.run>,
 Dan Carpenter <dan.carpenter@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 16 Apr 2022 at 12:12, Marijn Suijten
<marijn.suijten@somainline.org> wrote:
>
> Hi Dmitry,
>
> On 2022-04-02 02:11:04, Dmitry Baryshkov wrote:
> > As noticed by Dan ([1] an the followup thread) there are multiple issues
> > with the return values for MSM DSI command transmission callback. In
> > the error case it can easily return a positive value when it should
> > have returned a proper error code.
> >
> > This commits attempts to fix these issues both in TX and in RX paths.
> >
> > [1]: https://lore.kernel.org/linux-arm-msm/20211001123617.GH2283@kili/
> >
> > Fixes: a689554ba6ed ("drm/msm: Initial add DSI connector support")
> > Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>
> Thank you for your patience waiting for the requested tests; this patch
> seems to have no adverse effect on our cmdmode panels.
>
> Tested-by: Marijn Suijten <marijn.suijten@somainline.org>
>
> On the following devices:
> - Sony Xperia X (Loire Suzu, MSM8976), on Linux 5.17;
> - Sony Xperia 10 II (Seine PDX201, SM6125), on -next 20220318;
> - Sony Xperia XA2 Ultra (Nile Discovery, SDM630), on Linux 5.16.
>
> Apologies for the older kernel versions, that's what happens when having
> too many patches to dig through and too little hobby time to send them.
> Let me know if there's a patch dependency that you like to be included.

Thank you for the confirmation! No, no hidden dependencies.

>
> - Marijn
>
> > ---
> >  drivers/gpu/drm/msm/dsi/dsi_host.c | 21 ++++++++++++++-------
> >  1 file changed, 14 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> > index d51e70fab93d..8925f60fd9ec 100644
> > --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> > +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> > @@ -1341,10 +1341,10 @@ static int dsi_cmds2buf_tx(struct msm_dsi_host *msm_host,
> >                       dsi_get_bpp(msm_host->format) / 8;
> >
> >       len = dsi_cmd_dma_add(msm_host, msg);
> > -     if (!len) {
> > +     if (len < 0) {
> >               pr_err("%s: failed to add cmd type = 0x%x\n",
> >                       __func__,  msg->type);
> > -             return -EINVAL;
> > +             return len;
> >       }
> >
> >       /* for video mode, do not send cmds more than
> > @@ -1363,10 +1363,14 @@ static int dsi_cmds2buf_tx(struct msm_dsi_host *msm_host,
> >       }
> >
> >       ret = dsi_cmd_dma_tx(msm_host, len);
> > -     if (ret < len) {
> > -             pr_err("%s: cmd dma tx failed, type=0x%x, data0=0x%x, len=%d\n",
> > -                     __func__, msg->type, (*(u8 *)(msg->tx_buf)), len);
> > -             return -ECOMM;
> > +     if (ret < 0) {
> > +             pr_err("%s: cmd dma tx failed, type=0x%x, data0=0x%x, len=%d, ret=%d\n",
> > +                     __func__, msg->type, (*(u8 *)(msg->tx_buf)), len, ret);
> > +             return ret;
> > +     } else if (ret < len) {
> > +             pr_err("%s: cmd dma tx failed, type=0x%x, data0=0x%x, ret=%d len=%d\n",
> > +                     __func__, msg->type, (*(u8 *)(msg->tx_buf)), ret, len);
> > +             return -EIO;
> >       }
> >
> >       return len;
> > @@ -2092,9 +2096,12 @@ int msm_dsi_host_cmd_rx(struct mipi_dsi_host *host,
> >               }
> >
> >               ret = dsi_cmds2buf_tx(msm_host, msg);
> > -             if (ret < msg->tx_len) {
> > +             if (ret < 0) {
> >                       pr_err("%s: Read cmd Tx failed, %d\n", __func__, ret);
> >                       return ret;
> > +             } else if (ret < msg->tx_len) {
> > +                     pr_err("%s: Read cmd Tx failed, too short: %d\n", __func__, ret);
> > +                     return -ECOMM;
> >               }
> >
> >               /*



-- 
With best wishes
Dmitry
