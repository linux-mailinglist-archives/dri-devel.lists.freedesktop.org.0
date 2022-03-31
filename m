Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6574D4ED830
	for <lists+dri-devel@lfdr.de>; Thu, 31 Mar 2022 13:07:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EF4E10F2DD;
	Thu, 31 Mar 2022 11:07:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com
 [IPv6:2607:f8b0:4864:20::f29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8AFB10F2D1
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Mar 2022 11:07:06 +0000 (UTC)
Received: by mail-qv1-xf29.google.com with SMTP id kc20so19455853qvb.3
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Mar 2022 04:07:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ldzs2F+pKkHk9BDqjLFNwahVpE2pkUr1lDp8VpHB0F0=;
 b=sxpAq4RyE4MDaDjOhTdULxpJkKhIpld+2IKOfgYrFTJsv161z0NLODgT5cziftMAL/
 34sJikLyLgMJ2yVfrv6jUQYyNt1R8809q8HZUt0PUglCQ5qDQzLjSawn6yBAxe6/pTRd
 uqUXXb5CYlJ3NJlKba1MHQgtqCcrII6M2lRngbtk9mgLNm1SDnNf96ZL1tXLAD1uebqL
 7QfsCF93n58zMXrcICooqJODwjL6pdUVwd3sE5oZL1DbL2Ga172uYdNZ/vBQUb4k0Ro8
 pNUM3ttK9nsS14DaqubkSx2aJVrpihNCt5NgjHUXKhbNmXkHCac3P8SzkuDwGmjcD17z
 3Mhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ldzs2F+pKkHk9BDqjLFNwahVpE2pkUr1lDp8VpHB0F0=;
 b=7k93emDS9v457GF/XWkLw+V5KBZXV1XjfNx+QobPOtWBCnK8hOMBNZf7SOJEbM2vT7
 QnrOfujdavZ/bWdHuYSOhC6bDOC383iwd/0Vl2E5thNNyg7wtD8QyCTiTuQ1iKQcB81X
 K8M/grO2+Fhxm/WSD4bNhY0gPLMGB3d9Uh+zjsO47CrTasPpwHfxk0FiBXXkY6lpbjYI
 Au6y7nMHvuLFQjuUJ5JBzYxOqMxg5xWw9lkd0yHRRvWO+5/DTldItNAyIDASH2FgUKc1
 0So8NQGkEkB1HFvn7+4yryRz3txUKgM/dk8V6HXxRqTrSEXEyqJCVxoCAK98dS53BNU8
 LS+A==
X-Gm-Message-State: AOAM530RZU0pvaB4vQIbx0K/aMn2WKTISZrOMKJWOGdj/kFzXjUXwq3z
 SzbGCxSkEgUZ+issYr9QxVDXn0a3FchhdGd6+IJFZw==
X-Google-Smtp-Source: ABdhPJysJW04r/FtfLF+DfHPjBtKXZZz0wvOwBbCbh0AUcpnQjKZqUj63zSb3lGB5W34YZecDd6lon6RfoauABQcy+c=
X-Received: by 2002:a05:6214:20e4:b0:441:7bed:5ccd with SMTP id
 4-20020a05621420e400b004417bed5ccdmr30970783qvk.119.1648724825924; Thu, 31
 Mar 2022 04:07:05 -0700 (PDT)
MIME-Version: 1.0
References: <1648656179-10347-1-git-send-email-quic_sbillaka@quicinc.com>
 <1648656179-10347-5-git-send-email-quic_sbillaka@quicinc.com>
 <CAA8EJprMvik_6xmGt2oZGpDG9FoMtC_ojuw+oTjPLTck4Hu3WA@mail.gmail.com>
 <MW4PR02MB7186669BA1B19FA4F184B558E1E19@MW4PR02MB7186.namprd02.prod.outlook.com>
 <d9ac1cee-d4fc-09ae-b2df-82ae2ecd57fb@linaro.org>
 <MW4PR02MB71864413E9E3624D2F48F046E1E19@MW4PR02MB7186.namprd02.prod.outlook.com>
In-Reply-To: <MW4PR02MB71864413E9E3624D2F48F046E1E19@MW4PR02MB7186.namprd02.prod.outlook.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 31 Mar 2022 14:06:54 +0300
Message-ID: <CAA8EJpooNVxOUa20fACGf3rTVcHBvLKP2=7Eb0x8oxxE7f2iGg@mail.gmail.com>
Subject: Re: [PATCH v6 4/8] drm/msm/dp: avoid handling masked interrupts
To: Sankeerth Billakanti <sbillaka@qti.qualcomm.com>
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
Cc: quic_kalyant <quic_kalyant@quicinc.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "Sankeerth Billakanti \(QUIC\)" <quic_sbillaka@quicinc.com>,
 "dianders@chromium.org" <dianders@chromium.org>,
 "Abhinav Kumar \(QUIC\)" <quic_abhinavk@quicinc.com>,
 quic_vproddut <quic_vproddut@quicinc.com>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "swboyd@chromium.org" <swboyd@chromium.org>,
 "sean@poorly.run" <sean@poorly.run>,
 "seanpaul@chromium.org" <seanpaul@chromium.org>,
 "Aravind Venkateswaran \(QUIC\)" <quic_aravindh@quicinc.com>,
 "Kuogee Hsieh \(QUIC\)" <quic_khsieh@quicinc.com>,
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 31 Mar 2022 at 14:05, Sankeerth Billakanti
<sbillaka@qti.qualcomm.com> wrote:
>
> Hi Dmitry,
>
> > On 31/03/2022 08:53, Sankeerth Billakanti (QUIC) wrote:
> > > Hi Dmitry,
> > >
> > >> On Wed, 30 Mar 2022 at 19:03, Sankeerth Billakanti
> > >> <quic_sbillaka@quicinc.com> wrote:
> > >>>
> > >>> The interrupt register will still reflect the connect and disconnect
> > >>> interrupt status without generating an actual HW interrupt.
> > >>> The controller driver should not handle those masked interrupts.
> > >>>
> > >>> Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
> > >>> ---
> > >>>   drivers/gpu/drm/msm/dp/dp_catalog.c | 5 +++--
> > >>>   1 file changed, 3 insertions(+), 2 deletions(-)
> > >>>
> > >>> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c
> > >>> b/drivers/gpu/drm/msm/dp/dp_catalog.c
> > >>> index 3c16f95..1809ce2 100644
> > >>> --- a/drivers/gpu/drm/msm/dp/dp_catalog.c
> > >>> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
> > >>> @@ -608,13 +608,14 @@ u32 dp_catalog_hpd_get_intr_status(struct
> > >>> dp_catalog *dp_catalog)  {
> > >>>          struct dp_catalog_private *catalog = container_of(dp_catalog,
> > >>>                                  struct dp_catalog_private, dp_catalog);
> > >>> -       int isr = 0;
> > >>> +       int isr, mask;
> > >>>
> > >>>          isr = dp_read_aux(catalog, REG_DP_DP_HPD_INT_STATUS);
> > >>>          dp_write_aux(catalog, REG_DP_DP_HPD_INT_ACK,
> > >>>                                   (isr & DP_DP_HPD_INT_MASK));
> > >>> +       mask = dp_read_aux(catalog, REG_DP_DP_HPD_INT_MASK);
> > >>>
> > >>> -       return isr;
> > >>> +       return isr & (DP_DP_HPD_STATE_STATUS_MASK | mask);
> > >>
> > >> I suspect that the logic is inverted here. Shouldn't it be:
> > >>
> > >> return isr & DP_DP_HPD_STATE_STATUS_MASK & mask;
> > >>
> > >> ?
> > >>
> > >
> > > The value of DP_DP_HPD_STATE_STATUS_MASK is 0xE0000000 and the
> > value
> > > of the read interrupt mask variable could be is 0xF.
> > >
> > > The mask value is indicated via the register, REG_DP_DP_HPD_INT_MASK,
> > bits 3:0.
> > > The HPD status is indicated via a different read-only register
> > REG_DP_DP_HPD_INT_STATUS, bits 31:29.
> >
> > I see. Maybe the following expression would be better?
> >
> > return isr & (mask & ~DP_DP_HPD_INT_MASK);

Ugh, excuse me please. I meant:

return isr & (mask | ~DP_DP_HPD_INT_MASK);

> >
>
> I believe the confusion occurred because the DP_DP_HPD_STATE_STATUS_CONNECTED and others were defined under the same register definition as REG_DP_DP_HPD_INT_MASK
> I will rearrange the definitions below.
>
> #define REG_DP_DP_HPD_INT_MASK          (0x0000000C)
> #define DP_DP_HPD_PLUG_INT_MASK         (0x00000001)
> #define DP_DP_IRQ_HPD_INT_MASK          (0x00000002)
> #define DP_DP_HPD_REPLUG_INT_MASK       (0x00000004)
> #define DP_DP_HPD_UNPLUG_INT_MASK       (0x00000008)
> #define DP_DP_HPD_INT_MASK              (DP_DP_HPD_PLUG_INT_MASK | \
>                                                 DP_DP_IRQ_HPD_INT_MASK | \
>                                                 DP_DP_HPD_REPLUG_INT_MASK | \
>                                                 DP_DP_HPD_UNPLUG_INT_MASK)
>
> Below are status bits from register REG_DP_DP_HPD_INT_STATUS
>
> #define DP_DP_HPD_STATE_STATUS_CONNECTED        (0x40000000)
> #define DP_DP_HPD_STATE_STATUS_PENDING          (0x20000000)
> #define DP_DP_HPD_STATE_STATUS_DISCONNECTED     (0x00000000)
> #define DP_DP_HPD_STATE_STATUS_MASK             (0xE0000000)
>
> DP_DP_HPD_INT_MASK is 0xF and scope of mask variable is also 0xF (bits 3:0), mask & ~DP_DP_HPD_INT_MASK is 0 always.
>
> For DP, we want to enable all interrupts.
> So the programmed mask value is 0xF. We want to return 0x40000001 for connect and 8 for disconnect
>
> For eDP, we want to disable the connect and disconnect interrupts. So, the mask will be 0x6 (i.e. DP_DP_IRQ_HPD_INT_MASK | DP_DP_HPD_REPLUG_INT_MASK)
> We want to return 0x40000000 (or 0x20000000 based on hpd line status) and 0 for eDP connect and disconnect respectively.
>
> > >
> > > isr & DP_DP_HPD_STATE_STATUS_MASK & mask, will return 0 always.
> > >
> > >>>   }
> > >>>
> > >>>   int dp_catalog_ctrl_get_interrupt(struct dp_catalog *dp_catalog)
> > >>> --
> > >>> 2.7.4
> > >>>
> > >>
> > >>
> > >> --
> > >> With best wishes
> > >> Dmitry
> > >
> > > Thank you,
> > > Sankeerth
> >
> >
> > --
> > With best wishes
> > Dmitry
>
> Thank you,
> Sankeerth



-- 
With best wishes
Dmitry
