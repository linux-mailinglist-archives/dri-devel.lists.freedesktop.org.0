Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67A50841B71
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jan 2024 06:30:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C4BF112DA4;
	Tue, 30 Jan 2024 05:29:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com
 [209.85.128.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67AFD112DA4
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jan 2024 05:29:38 +0000 (UTC)
Received: by mail-yw1-f169.google.com with SMTP id
 00721157ae682-602cd92a75bso35509677b3.2
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jan 2024 21:29:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706592518; x=1707197318; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=2oJh1bKyRcnDu3I/s/TzC/Ns9zc3sl/RT0aJDndm2Vc=;
 b=gyeBhbmwe+jtLI7NaGwOt+K9pfOgzO2+rkgYlbnMQBE4sCLt8QBF+TvqOAS0H0rJ6M
 usfvHzQqKzBYVzse/tzPQAh1omPE9wla9OemdRfiRxxWopsTg2W8cIYoVOoQBj4mgVzX
 Iu1lWnwol4eiEVv2mcmZPBXsKyzW0yoDVeYngi/D4/8RVtK7Z2qeFpJ43LcAMSG7iO8Q
 xZFY7KMzn/DPYHZmBhgTwLBgzs9R6v+3nMNRluojCIfV/83p7G1wuiqbCaLxhJxEExui
 Jct18el9hl3XbLFq6afP6w4WgmnlKTN7isVa26jhHANjwrPTsRQsPWcxvX0XanfWvJcm
 8QEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706592518; x=1707197318;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2oJh1bKyRcnDu3I/s/TzC/Ns9zc3sl/RT0aJDndm2Vc=;
 b=U6j46hL0KAwRGJ0ZiZiVNq4A+RmvyoT+J+hkl9Ud88UHML0N6DoylvLEXBIO2FfWU/
 sVWlxegYSBzq8gC7bxfAi/8HBBLXQSrtTr6BNtcbHFOWj1cV+KAX6okGvkQbOJnh8clG
 EUf59dQ5TZR85ifFP7fi5vbV/ksXU4UGof8b5nFFHJt/7sXn3T7KjGjnTvMGMmyy4S5b
 liiS7mf9qfTq5sGvX5fwAy/l8KnUIcYLFIeC+BiX7l7hvCeZTHcYSMb7NnR+iBwTzCSH
 QY9K12b+tWS2dSJh1EHR3+1Sh5bmNmNWyO6mXTB/lL6EalZLRjcB6E3PDJ+UGnssWyCT
 PIcg==
X-Gm-Message-State: AOJu0Yydt6rOBmlf98tIsxJ9fp+JI9DgeEBUOAP9YvdC3mF3bJrBDAy+
 bIiDsfF9yL90knDmNDR04CeU9vXBr5HQxN3fdOGrJT5AiExYr52ySBltFItYavESQguSVKaYTRR
 YlPR4zkrA4PJszEIHaRsaisDKAw/jIFH+J4Lp2w==
X-Google-Smtp-Source: AGHT+IEBeZK6o5mTWaHuXZc5czAJkaQBsE1YXq8D2mI1bESooCew7XQ+bzt2Z20I5hi2iOCdiRQM/foKk25JAp6O7IA=
X-Received: by 2002:a81:e205:0:b0:5ff:bb43:2a69 with SMTP id
 p5-20020a81e205000000b005ffbb432a69mr4689799ywl.40.1706592517782; Mon, 29 Jan
 2024 21:28:37 -0800 (PST)
MIME-Version: 1.0
References: <20240125193834.7065-1-quic_parellan@quicinc.com>
 <20240125193834.7065-8-quic_parellan@quicinc.com>
 <301cdbe2-7377-4b0f-bd24-5131f8928c29@linaro.org>
 <09a10811-ea7c-3e99-d5eb-755aac4ecf0e@quicinc.com>
 <CAA8EJpqFcY8yBmdW8qpMiS1p3bqY2+pgXtvR0Br9-p_VAUnN+Q@mail.gmail.com>
 <31630fe2-045d-c5f1-4019-e8a8b89928c3@quicinc.com>
 <CAA8EJpr+tqWgj78LuPeDztQb+Tt_Zs0OKPaRsV1E-jqpRQJO6Q@mail.gmail.com>
 <1727d3ab-900b-9c7b-2afa-a47b0bb3c713@quicinc.com>
 <CAA8EJprhZ+AyjjUM46_qmYeOytX60ncLbFw0mC7V5bBT4MoN6w@mail.gmail.com>
 <697b153b-fb8e-6b58-fc4f-92f814f86d0f@quicinc.com>
In-Reply-To: <697b153b-fb8e-6b58-fc4f-92f814f86d0f@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 30 Jan 2024 07:28:26 +0200
Message-ID: <CAA8EJpp+k9u4L4O9_V4Ypu-8ROUkVkRt3pL5Tot+eGC39EqNaw@mail.gmail.com>
Subject: Re: [PATCH 07/17] drm/msm/dpu: disallow widebus en in INTF_CONFIG2
 when DP is YUV420
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
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
Cc: neil.armstrong@linaro.org, marijn.suijten@somainline.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, seanpaul@chromium.org, quic_jesszhan@quicinc.com,
 Paloma Arellano <quic_parellan@quicinc.com>, quic_khsieh@quicinc.com,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 30 Jan 2024 at 06:10, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 1/29/2024 5:43 PM, Dmitry Baryshkov wrote:
> > On Tue, 30 Jan 2024 at 03:07, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >>
> >>
> >>
> >> On 1/29/2024 4:03 PM, Dmitry Baryshkov wrote:
> >>> On Tue, 30 Jan 2024 at 01:51, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >>>>
> >>>>
> >>>>
> >>>> On 1/27/2024 9:33 PM, Dmitry Baryshkov wrote:
> >>>>> On Sun, 28 Jan 2024 at 07:16, Paloma Arellano <quic_parellan@quicinc.com> wrote:
> >>>>>>
> >>>>>>
> >>>>>> On 1/25/2024 1:26 PM, Dmitry Baryshkov wrote:
> >>>>>>> On 25/01/2024 21:38, Paloma Arellano wrote:
> >>>>>>>> INTF_CONFIG2 register cannot have widebus enabled when DP format is
> >>>>>>>> YUV420. Therefore, program the INTF to send 1 ppc.
> >>>>>>>
> >>>>>>> I think this is handled in the DP driver, where we disallow wide bus
> >>>>>>> for YUV 4:2:0 modes.
> >>>>>> Yes we do disallow wide bus for YUV420 modes, but we still need to
> >>>>>> program the INTF_CFG2_DATA_HCTL_EN. Therefore, it is necessary to add
> >>>>>> this check.
> >>>>>
> >>>>> As I wrote in my second email, I'd prefer to have one if which guards
> >>>>> HCTL_EN and another one for WIDEN
> >>>>>
> >>>> Its hard to separate out the conditions just for HCTL_EN . Its more
> >>>> about handling the various pixel per clock combinations.
> >>>>
> >>>> But, here is how I can best summarize it.
> >>>>
> >>>> Lets consider DSI and DP separately:
> >>>>
> >>>> 1) For DSI, for anything > DSI version 2.5 ( DPU version 7 ).
> >>>>
> >>>> This is same the same condition as widebus today in
> >>>> msm_dsi_host_is_wide_bus_enabled().
> >>>>
> >>>> Hence no changes needed for DSI.
> >>>
> >>> Not quite. msm_dsi_host_is_wide_bus_enabled() checks for the DSC being
> >>> enabled, while you have written that HCTL_EN should be set in all
> >>> cases on a corresponding platform.
> >>>
> >>
> >> Agreed. This is true, we should enable HCTL_EN for DSI irrespective of
> >> widebus for the versions I wrote.
> >>
> >> Basically for the non-compressed case.
> >>
> >> I will write something up to fix this for DSI. I think this can go as a
> >> bug fix.
> >>
> >> But that does not change the DP conditions OR in other words, I dont see
> >> anything wrong with this patch yet.
> >>
> >>>>
> >>>> 2) For DP, whenever widebus is enabled AND YUV420 uncompressed case
> >>>> as they are independent cases. We dont support YUV420 + DSC case.
> >>>>
> >>>> There are other cases which fall outside of this bucket but they are
> >>>> optional ones. We only follow the "required" ones.
> >>>>
> >>>> With this summary in mind, I am fine with what we have except perhaps
> >>>> better documentation above this block.
> >>>>
> >>>> When DSC over DP gets added, I am expecting no changes to this block as
> >>>> it will fall under the widebus_en case.
> >>>>
> >>>> With this information, how else would you like the check?
> >>>
> >>> What does this bit really change?
> >>>
> >>
> >> This bit basically just tells that the data sent per line is programmed
> >> with INTF_DISPLAY_DATA_HCTL like this cap is suggesting.
> >>
> >>           if (ctx->cap->features & BIT(DPU_DATA_HCTL_EN)) {
> >>                   DPU_REG_WRITE(c, INTF_CONFIG2, intf_cfg2);
> >>                   DPU_REG_WRITE(c, INTF_DISPLAY_DATA_HCTL,
> >> display_data_hctl);
> >>                   DPU_REG_WRITE(c, INTF_ACTIVE_DATA_HCTL, active_data_hctl);
> >>           }
> >>
> >> Prior to that it was programmed with INTF_DISPLAY_HCTL in the same function.
> >
> > Can we enable it unconditionally for DPU >= 5.0?
> >
>
> There is a corner-case that we should not enable it when compression is
> enabled without widebus as per the docs :(

What about explicitly disabling it in such a case?
I mean something like:

if (dpu_core_rev >= 5.0 && !(enc->hw_dsc && !enc->wide_bus_en))
   intf_cfg |= INTF_CFG2_HCTL_EN;


>
> For DP there will not be a case like that because compression and
> widebus go together but for DSI, it is possible.
>
> So I found that the reset value of this register does cover all cases
> for DPU >= 7.0 so below fix will address the DSI concern and will fix
> the issue even for YUV420 cases such as this one for DPU >= 7.0
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> index 6bba531d6dc4..cbd5ebd516cd 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> @@ -168,6 +168,8 @@ static void dpu_hw_intf_setup_timing_engine(struct
> dpu_hw_intf *ctx,
>           * video timing. It is recommended to enable it for all cases,
> except
>           * if compression is enabled in 1 pixel per clock mode
>           */
> +
> +       intf_cfg2 = DPU_REG_READ(c, INTF_CONFIG2);
>          if (p->wide_bus_en)
>                  intf_cfg2 |= INTF_CFG2_DATABUS_WIDEN |
> INTF_CFG2_DATA_HCTL_EN;
>
>
> But, this does not still work for DPU < 7.0 such as sc7180 if we try
> YUV420 over DP on that because its DPU version is 6.2 so we will have to
> keep this patch for those cases.
>
> >>
> >>>>
> >>>>>>>
> >>>>>>>>
> >>>>>>>> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
> >>>>>>>> ---
> >>>>>>>>      drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c | 4 +++-
> >>>>>>>>      1 file changed, 3 insertions(+), 1 deletion(-)
> >>>>>>>>
> >>>>>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> >>>>>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> >>>>>>>> index 6bba531d6dc41..bfb93f02fe7c1 100644
> >>>>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> >>>>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> >>>>>>>> @@ -168,7 +168,9 @@ static void
> >>>>>>>> dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *ctx,
> >>>>>>>>           * video timing. It is recommended to enable it for all cases,
> >>>>>>>> except
> >>>>>>>>           * if compression is enabled in 1 pixel per clock mode
> >>>>>>>>           */
> >>>>>>>> -    if (p->wide_bus_en)
> >>>>>>>> +    if (dp_intf && fmt->base.pixel_format == DRM_FORMAT_YUV420)
> >>>>>>>> +        intf_cfg2 |= INTF_CFG2_DATA_HCTL_EN;
> >>>>>>>> +    else if (p->wide_bus_en)
> >>>>>>>>              intf_cfg2 |= INTF_CFG2_DATABUS_WIDEN | INTF_CFG2_DATA_HCTL_EN;
> >>>>>>>>            data_width = p->width;
> >>>>>>>
> >>>>>
> >>>>>
> >>>>>
> >>>
> >>>
> >>>
> >
> >
> >



-- 
With best wishes
Dmitry
