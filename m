Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFDE08CA3BB
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2024 23:16:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 412F610E8A3;
	Mon, 20 May 2024 21:16:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="MsjR1e8H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E145E10E8A3
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2024 21:16:47 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-2e73359b8fbso8565941fa.2
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2024 14:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716239806; x=1716844606; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=VG+wyOOGGLfw+B2ijipUditBjceEdzKS6/pyMdE87yA=;
 b=MsjR1e8HdJrvI7IEjvMbhjs7gC56PGSjyJQth3Qax5r0pq6/ico0A0uLT1IGCCbQo1
 fy86W170Hmfdggca+K4ypSGPt2R33/U4j/yQY5EXYQwK867vi3YZ+dgJySba4VI3ycqA
 UiZbKJzMtw46tfwbSrQpPOtxlc3mUroUP2kcBDJKT/q+wTGg7jOQjQZ3s9tM+gw4amzA
 sfJmKoClsPSpKA+TdqWGKjZDTyQ6kbDuYm2DRAWx5NPLlFC0V9TuL0so1QSD316IocyZ
 j4s61QL8LjQLYXuZHElbFvcIQWnzs+hxBL6HPoHoT1iMrNgOdcvxk6ymW4DVddM/bpgj
 3/mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716239806; x=1716844606;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VG+wyOOGGLfw+B2ijipUditBjceEdzKS6/pyMdE87yA=;
 b=qQHkZ+BPk4HJPEVZbpoJ8PK758MLeALbegHhAN6A1X1mbh6KuKNfepPzvDnxCXxTHH
 vLnOXt+cYrrfcWK1MagnM8GK1x7yjQ+vC5voHHCyuTPKimsiPCcbT4DEgIe8YlrPgUeN
 JKLhsbGCtLXo6QclxTWb1k+lRN0ZF+DoIGSyKNFQSfZEcaC2qr8JFeXLPpYBZlxq0uQQ
 zE4V4xxjwjbmFOTSy2+KwIM3CCtEbtE3pT+xGjyjOBjcc6Oo1dqwIujXkrZggpA6C2EE
 ZBJgp5k8PasL4+B1ryjToPM/THLUYDJuUAbtJv8BuLV6KuSycMMeV4znZTim/t9q6iam
 t32Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWo9mLwaEpyOXQYhQnvxMyYzx4w52lV1XiMSIsdxsswc+sUAi0O+sAdNp+AHfcd2xpjOUfIugfHxEFaiMValdt/hjXLrQ0gQ6i1ujU82wWM
X-Gm-Message-State: AOJu0YwNDydAd816F38kGGJAjgXimTsi+71EDo8zko0z9iNoqVHnZWMH
 LTBkcIvCoIrxtceUagK/8GIYHAKjHZMwG49NLNzinDmMQOCDGS2c1pKqYMW+VaI=
X-Google-Smtp-Source: AGHT+IEp/sEhG115TKoHU/cBHnUXls0SY/sGKzpT+eTYnWDyBk/vRVw2jF5iCZxcKZkZcJlt8gQnsQ==
X-Received: by 2002:a2e:a40f:0:b0:2e4:a21a:bf7d with SMTP id
 38308e7fff4ca-2e51ff5234cmr312792631fa.21.1716239805722; 
 Mon, 20 May 2024 14:16:45 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2e4d0ce2733sm34965821fa.31.2024.05.20.14.16.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 May 2024 14:16:45 -0700 (PDT)
Date: Tue, 21 May 2024 00:16:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Adam Ford <aford173@gmail.com>
Cc: Sui Jingfeng <sui.jingfeng@linux.dev>, Liu Ying <victor.liu@nxp.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 andrzej.hajda@intel.com, 
 neil.armstrong@linaro.org, rfoss@kernel.org, Laurent.pinchart@ideasonboard.com,
 jonas@kwiboo.se, jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch, 
 biju.das.jz@bp.renesas.com, u.kleine-koenig@pengutronix.de,
 jani.nikula@intel.com, bli@bang-olufsen.dk
Subject: Re: [PATCH] drm/bridge: adv7511: Exit interrupt handling when
 necessary
Message-ID: <lpgtwv74vlazlzpurey3qdhs6qygauw2xr3g4gcfp6kvbio4zj@2puyycoaqqay>
References: <20240516101006.2388767-1-victor.liu@nxp.com>
 <evnxopqt5be56vxuxqdj4l3mcd5nrrvucio7jhwgg4emraai3t@gherubdynyip>
 <e2d4e8b4-bab4-448f-8b67-21f2902fdcd2@linux.dev>
 <CAA8EJppH1rYQ5pzkGP+V-=cOPBYMWm=ZK2Ei1ttjOiN6GRDP+w@mail.gmail.com>
 <acc508e2-b067-47ef-b3e2-fcac51403fe0@linux.dev>
 <CAA8EJpowLnrnV8ezXYj=oWBFFTa6LqkPFFHc9F49un6AYgZvzw@mail.gmail.com>
 <CAHCN7x+5L+fjkDgR_mJ2BQ1M52oBZyU0nUca1Uvhyh1pFSJChw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHCN7x+5L+fjkDgR_mJ2BQ1M52oBZyU0nUca1Uvhyh1pFSJChw@mail.gmail.com>
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

On Mon, May 20, 2024 at 07:46:05AM -0500, Adam Ford wrote:
> On Mon, May 20, 2024 at 7:00 AM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> >
> > On Mon, 20 May 2024 at 14:48, Sui Jingfeng <sui.jingfeng@linux.dev> wrote:
> > >
> > > Hi,
> > >
> > >
> > > On 5/20/24 19:13, Dmitry Baryshkov wrote:
> > > > On Mon, 20 May 2024 at 14:11, Sui Jingfeng <sui.jingfeng@linux.dev> wrote:
> > > >>
> > > >> Hi,
> > > >>
> > > >> On 5/20/24 06:11, Dmitry Baryshkov wrote:
> > > >>> On Thu, May 16, 2024 at 06:10:06PM +0800, Liu Ying wrote:
> > > >>>> Commit f3d9683346d6 ("drm/bridge: adv7511: Allow IRQ to share GPIO pins")
> > > >>>> fails to consider the case where adv7511->i2c_main->irq is zero, i.e.,
> > > >>>> no interrupt requested at all.
> > > >>>>
> > > >>>> Without interrupt, adv7511_wait_for_edid() could return -EIO sometimes,
> > > >>>> because it polls adv7511->edid_read flag by calling adv7511_irq_process()
> > > >>>> a few times, but adv7511_irq_process() happens to refuse to handle
> > > >>>> interrupt by returning -ENODATA.  Hence, EDID retrieval fails randomly.
> 
> Sorry about that.  I did some testing and didn't see any regressions,
> but if it was random, it's likely I just was lucky to not see it.
> 
> > > >>>>
> > > >>>> Fix the issue by checking adv7511->i2c_main->irq before exiting interrupt
> > > >>>> handling from adv7511_irq_process().
> > > >>>>
> > > >>>> Fixes: f3d9683346d6 ("drm/bridge: adv7511: Allow IRQ to share GPIO pins")
> > > >>>> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> > > >>>> ---
> > > >>>>    drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 3 ++-
> > > >>>>    1 file changed, 2 insertions(+), 1 deletion(-)
> > > >>>>
> > > >>>> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> > > >>>> index 6089b0bb9321..2074fa3c1b7b 100644
> > > >>>> --- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> > > >>>> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> > > >>>> @@ -479,7 +479,8 @@ static int adv7511_irq_process(struct adv7511 *adv7511, bool process_hpd)
> > > >>>>               return ret;
> > > >>>>
> > > >>>>       /* If there is no IRQ to handle, exit indicating no IRQ data */
> > > >>>> -    if (!(irq0 & (ADV7511_INT0_HPD | ADV7511_INT0_EDID_READY)) &&
> > > >>>> +    if (adv7511->i2c_main->irq &&
> > > >>>> +        !(irq0 & (ADV7511_INT0_HPD | ADV7511_INT0_EDID_READY)) &&
> > > >>>>           !(irq1 & ADV7511_INT1_DDC_ERROR))
> > > >>>>               return -ENODATA;
> > > >>>
> > > >>> I think it might be better to handle -ENODATA in adv7511_wait_for_edid()
> > > >>> instead. WDYT?
> > > >>>
> > > >>
> > > >> I think this is may deserve another patch.
> > > >
> > > > My point is that the IRQ handler is fine to remove -ENODATA here,
> > >
> > > [...]
> > >
> > > > there is no pending IRQ that can be handled.
> > >
> > > But there may has other things need to do in the adv7511_irq_process()
> > > function.
> >
> > But the function returns anyway. So, we know that the condition is broken.
> 
> When I originally submitted the patch, I only added the shared IRQ
> flag without any IRQ condition checks, IRQ because I didn't want to
> break anything. The feedback I got was to check to see if the IRQ was
> intended by the device.  My focus was the adv7511_drv.c file because
> that appears to be what the registered IRQ hander was, but after
> looking through adv7511_cec, I see that adv7511_cec_irq_process checks
> adv_cec_tx_raw_status and returns if there is nothing to do.
> 
> Would it make sense to move the if statement  did the following things:
> 
> -  Make adv7511_cec_irq_process return an int and modify it to return
> 0 in normal operation or return -ENODATA where there is nothing to do.
> It already has the checks in place to determine if there is work to
> do, so the impact here should be minimal.
> 
> - Move the check I added on whether or not there is an interrupt  to
> the very end of adv7511_irq_process just before the return 0.
> 
> - Instead of blindly returning 0, modify the if statement to read the
> state of the return code of adv7511_cec_irq_process and the IRQ flags
> it already checks.  If ADV7511_INT0_HPD, ADV7511_INT0_EDID_READY and
> ADV7511_INT1_DDC_ERROR are all not true and adv7511_cec_irq_process
> returned early, return ENODATA, but if any of the interrupts was
> present and adv7511_cec_irq_process did work, it would return 0.
> 
> I think that would cover the situation where adv7511_cec_irq_process
> would get called, and also prevent a false return of the IRQ being
> handled when this part didn't handle anything.
> 
> It would look something like:
> 
> cec_irq = adv7511_cec_irq_process(adv7511, irq1);
> 
> /* If there is no IRQ to handle, exit indicating no IRQ data */)
> if (!(irq0 & (ADV7511_INT0_HPD | ADV7511_INT0_EDID_READY)) &&
>    !(irq1 & ADV7511_INT1_DDC_ERROR) &&
>   cec_irq ==  -ENODATA)
>         return -ENODATA;
> else
>         return 0
> 
> 
> OR...
> 
> 
> Another alternative to all this is to modify the check that I added to
> verify all the following flags which are currently checked in
> adv7511_cec_irq_process :
> 
> ADV7511_INT1_CEC_TX_READY
> ADV7511_INT1_CEC_TX_ARBIT_LOST
> ADV7511_INT1_CEC_TX_RETRY_TIMEOUT
> ADV7511_INT1_CEC_RX_READY1
> ADV7511_INT1_CEC_RX_READY2
> ADV7511_INT1_CEC_RX_READY3
> 
> It would look something like:
> 
> /* If there is no IRQ to handle, exit indicating no IRQ data */
> if (!(irq0 & (ADV7511_INT0_HPD | ADV7511_INT0_EDID_READY)) &&
>    !(irq1 & ADV7511_INT1_DDC_ERROR) &&
>    !(irq1 & ADV7511_INT1_CEC_TX_READY) &&
>   !(irq1 & ADV7511_INT1_CEC_TX_ARBIT_LOST) &&
>   !(irq1 & ADV7511_INT1_CEC_TX_RETRY_TIMEOUT) &&
>   !(irq1 & ADV7511_INT1_CEC_RX_READY1) &&
>   !(irq1 & ADV7511_INT1_CEC_RX_READY2) &&
>   !(irq1 & ADV7511_INT1_CEC_RX_READY3))
> return -ENODATA;

This definitely looks ugly. At least it should be a mask.

I have a slightly different solution:

Make adv7511_irq_process return <0 for error, IRQ_NONE or IRQ_HANDLED.
This would also require tracking whether HPD, EDID or CEC processing
actually took place (add temp var for the current 'handled' status, make
adv7511_cec_irq_process() return IRQ_HANDLED too).

> 
> 
> Please let me know what is preferred or if there is a third possible solution.
> 
> I can write up a patch with a fixes tag later today when I get back to
> my build machine.
> 
> adam
> >
> > >
> > > > So instead of continuing
> > > > the execution when we know that IRQ bits are not set,
> > >
> > > Even when IRQ bits are not set, it just means that there is no HPD
> > > and no EDID ready-to-read signal. HDMI CEC interrupts still need
> > > to process.
> >
> > Yes. Let's get the CEC fixed. Then maybe we won't need this commit at all.
> >
> > >
> > >
> > > > it's better to
> > > > ignore -ENODATA in the calling code and go on with msleep().
> > > >
> > >
> > > So, It's confusing to ignore the -ENODATA here.
> >
> > [BTW: you had quotation levels wrong in two places, I've fixed them]
> >
> > --
> > With best wishes
> > Dmitry

-- 
With best wishes
Dmitry
