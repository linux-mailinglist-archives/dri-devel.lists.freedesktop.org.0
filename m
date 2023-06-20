Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C4F873773A
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 00:10:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AB5510E0F4;
	Tue, 20 Jun 2023 22:10:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com
 [IPv6:2607:f8b0:4864:20::b2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0240810E0F4
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jun 2023 22:10:19 +0000 (UTC)
Received: by mail-yb1-xb2a.google.com with SMTP id
 3f1490d57ef6-bd6d9d7da35so5343088276.0
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jun 2023 15:10:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687299018; x=1689891018;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=HT6ELgc+vEC14zQPUFAPOU0wYVcABKowburaLkoJ0d0=;
 b=HcyyIFeN1ZxhVpCBerZe43HsXI5lOg7/21g6EDpY4iszu/RN/Q3ijZPgtygCMKkSy9
 N402Yer6LMFngtacQ+V7n+n4oHlu3YCFtASsd1sf5FhYISqoCy2Kl9R3uGdeqsre8foZ
 NObMszuLwIQO7ycCF+vTi2uHx+b6pSF+mNi1wCD4rYtqhGLgq06u5C7q0NzFKId33F/q
 8NjcEyQaBolQC0Hb6cYALvoJC9rWqxIL0YIrNPKmltVtwAl6z/fH3qW27ABuLMY96k9J
 hy4E9kustuyBgb16zcle/svxA3VcNm+Zyne3ovN3AnGHC0/zRCAFX8jLYcrQzJmx2Zop
 NY3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687299018; x=1689891018;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HT6ELgc+vEC14zQPUFAPOU0wYVcABKowburaLkoJ0d0=;
 b=EhDl3PxDavxdMmJRnW/Z9fKW0uGieC8yRRifFCkfyfUru1YHbFk5riAMCPLqdaJM3B
 0lqkxKDJPqOWq16Ii/5qu7ArY3R66+leAkwprIgi6sALhJwp5YLIsd5Wpb+LaK0vUZnr
 TYjpX9VWAgb9w2aJWtFa8m8dukDf/hsMxEr3MJ5LhEZxJCCxhX3BlGXHbGV3x7dbAPPl
 5knyM0My4eK0YE3LvQrW0qo8cGjV9Gh+fGxxXjadPwIR6Ysy43Oyi4TjA/AC4tEYPVYQ
 l3jfTkd4Nv4W1PFtYKjqQYe5HKpKgM0aeyGXiwqf+NdmYkXcQYBcC8k7CzRHvCYrkm7H
 XmYw==
X-Gm-Message-State: AC+VfDxI7uZnHC6T1GPbtPHxqH0KuRzfTzv0ch6l4JhcjN0AmVBxj5cd
 VP4bd6H2Bl83siMfOf0Lf+dGKJrDzG5NpUFc/Mqojw==
X-Google-Smtp-Source: ACHHUZ7tcg7Z6mJMMRDBN/3gvi9it77FLENhgYELAPTS/1pofBQFcnxnDO3fll3mdrxErWeqREJ5qWQMTZHaXF4YOs0=
X-Received: by 2002:a25:cb81:0:b0:ba8:58b5:71aa with SMTP id
 b123-20020a25cb81000000b00ba858b571aamr10791467ybg.9.1687299018527; Tue, 20
 Jun 2023 15:10:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230525-add-widebus-support-v1-0-c7069f2efca1@quicinc.com>
 <20230525-add-widebus-support-v1-2-c7069f2efca1@quicinc.com>
 <c74c9e0e-d059-f0e3-4350-03089c37131a@linaro.org>
 <cce68370-3fd9-4c9a-258e-af0d5d057fda@quicinc.com>
 <n2c5qlujxhbbj2aqlgj7fetzoteood5h4hmbwt4mapi77xlvmt@bpourzaideti>
 <81a5e241-ec82-7414-8752-4ce3cb084959@linaro.org>
 <f14f2c31-38c2-0600-3a29-17e83afececf@quicinc.com>
In-Reply-To: <f14f2c31-38c2-0600-3a29-17e83afececf@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 21 Jun 2023 01:10:07 +0300
Message-ID: <CAA8EJpoW_QBqti3e8Aji5JpKA9LhnTCy+tHZD-Et1aFbWabubw@mail.gmail.com>
Subject: Re: [PATCH 2/3] drm/msm/dpu: Set DATABUS_WIDEN on command mode
 encoders
To: Jessica Zhang <quic_jesszhan@quicinc.com>
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
Cc: freedreno@lists.freedesktop.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Marijn Suijten <marijn.suijten@somainline.org>,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 21 Jun 2023 at 00:38, Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
>
>
>
> On 6/16/2023 5:35 PM, Dmitry Baryshkov wrote:
> > On 17/06/2023 00:54, Marijn Suijten wrote:
> >> On 2023-06-16 14:18:39, Abhinav Kumar wrote:
> >>>
> >>>
> >>> On 6/14/2023 12:56 AM, Dmitry Baryshkov wrote:
> >>>> On 14/06/2023 04:57, Jessica Zhang wrote:
> >>>>> Add a DPU INTF op to set the DATABUS_WIDEN register to enable the
> >>>>> databus-widen mode datapath.
> >>>>>
> >>>>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> >>>>> ---
> >>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c |  3 +++
> >>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c          | 12
> >>>>> ++++++++++++
> >>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h          |  3 +++
> >>>>>    3 files changed, 18 insertions(+)
> >>>>>
> >>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> >>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> >>>>> index b856c6286c85..124ba96bebda 100644
> >>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> >>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> >>>>> @@ -70,6 +70,9 @@ static void _dpu_encoder_phys_cmd_update_intf_cfg(
> >>>>>        if (intf_cfg.dsc != 0 &&
> >>>>> phys_enc->hw_intf->ops.enable_compression)
> >>>>>
> >>>>> phys_enc->hw_intf->ops.enable_compression(phys_enc->hw_intf);
> >>>>> +
> >>>>> +    if (phys_enc->hw_intf->ops.enable_widebus)
> >>>>> +        phys_enc->hw_intf->ops.enable_widebus(phys_enc->hw_intf);
> >>>>
> >>>> No. Please provide a single function which takes necessary
> >>>> configuration, including compression and wide_bus_enable.
> >>>>
> >>>
> >>> There are two ways to look at this. Your point is coming from the
> >>> perspective that its programming the same register but just a different
> >>> bit. But that will also make it a bit confusing.
> >
> > My point is to have a high-level function that configures the INTF for
> > the CMD mode. This way it can take a structure with necessary
> > configuration bits.
>
> Hi Dmitry,
>
> After discussing this approach with Abhinav, we still have a few
> questions about it:
>
> Currently, only 3 of the 32 bits for INTF_CONFIG2 are being used (the
> rest are reserved with no plans of being programmed in the future). Does
> this still justify the use of a struct to pass in the necessary
> configuration?

Yes.

>
> In addition, it seems that video mode does all its INTF_CONFIG2
> configuration separately in dpu_hw_intf_setup_timing_engine(). If we
> have a generic set_intf_config2() op, it might be good to have it as
> part of a larger cleanup where we have both video and command mode use
> the generic op. What are your thoughts on this?

No. If I get your idea right, this would mean moving INTF_CONFIG2
knowledge to the caller, which, I think, is a bad idea.

>
> Thanks,
>
> Jessica Zhang
>
> >
> >>>
> >>> So lets say the function is called intf_cfg2_xxx(..., bool widebus, bool
> >>> data_compress)
> >>>
> >>> Now for the caller who wants to just enable widebus this will be
> >>>
> >>> intf_cfg2_xxx(....., true, false)
> >>>
> >>> if we want to do both
> >>>
> >>> intf_cfg2_xxx(...., true, true)
> >>>
> >>> the last one where we want to do just data_compress(highly unlikely and
> >>> not recommended)
> >>>
> >>> intf_cfg2_xxx(...., false, true)
> >>>
> >>> Now someone looking at the code will have to go and find out what each
> >>> bool is.
> >>>
> >>> Whereas with separate ops, its kind of implicit.
> >>
> >> That's why you never pass bools as function argument (edge-case if it is
> >> the only argument, and its meaning becomes clear from the function
> >> name).  Use enumerations anywhere else.
> >>
> >> - Marijn
> >>
> >>>
> >>> For that reason, I dont think this patch is bad at all.
> >
> > --
> > With best wishes
> > Dmitry
> >



-- 
With best wishes
Dmitry
