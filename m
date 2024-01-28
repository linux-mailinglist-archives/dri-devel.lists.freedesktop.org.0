Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4530F83F419
	for <lists+dri-devel@lfdr.de>; Sun, 28 Jan 2024 06:35:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E010B10F01C;
	Sun, 28 Jan 2024 05:34:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com
 [209.85.128.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 479F210EFE6
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Jan 2024 05:34:45 +0000 (UTC)
Received: by mail-yw1-f179.google.com with SMTP id
 00721157ae682-602c714bdbeso12591977b3.1
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Jan 2024 21:34:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706420024; x=1707024824; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=56XAf/FBuLB1j5RG9WDWEta1SAD1AD0IDjZoes74Lew=;
 b=eaWjTahrnkr7efWO6ywHYk+C/DTuqJ4rkYyKaz7aJG8upzDh4iBUjK4Ke36fimPVI9
 XuH1xZI+eZgfoYrpu3QeoWCcksYwhxG2bEo/7xCVMBQ0D69r70hPh3PKu61SeWFcLtYp
 3lMnAEOV9tzmISeFHrUvk/LWhxaJ3V+JxpOL4qdnbtklU0ZBIR/rN1Dlm+Z/rH0jMfvl
 CkKw/RVlQD9eLQN48nanNuCm9xU9zoGBBBWGKISdPqPKPUV0/Tft2agmLwfKjfp+dAYr
 JNPbnWCsOHdxEcoJQJ883Zpeqx7NRH5l34p0TTOAMkxVzMvdTnj1eln4CRGccVaONQV2
 W9kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706420024; x=1707024824;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=56XAf/FBuLB1j5RG9WDWEta1SAD1AD0IDjZoes74Lew=;
 b=E1B4XP+YFn6zjfPaaMUQqtp9pzpfd+j3tdpmZOXb2KhKsQFamJMj+bixuSGCWr+Xfi
 cVtJF1SZ1DGUmb5w2Qa6E6/OHZLsozOW1AwIi6xawXma7sGKFDpksdjb0mvpLEZ2z85+
 dCdKtzxIcXnAMlxeBtaL9CzP+k/7oG65GOU6P4zsXSHS5SZ1sdCSqs1iVw1fBDbPJn6q
 IrjTcWmdbwfCrWAyarj6tU2mMvzzMUwfQufUgJiHSTs7MNGNzFGdm6yyofbu/J+rOinp
 aek+Cy1RzrfpBO3qMI8Q3eQPfz10tAwXpycQWeTkdd7QjcsqNijZsfhHT6lO5yB7Thxp
 BEIQ==
X-Gm-Message-State: AOJu0YwMpdtv/+M9RWxuZ+R27fhytQNXl1/XujB3vVZovEiFtTBsjyk5
 WfMDZovukJ0c0FkzyHHRqLuQwZ0hjx2VxDURwdPRmcLRqVB5G5+ri3DyGoRBVndFGFonabBvMP2
 EMoe5ShdwXc5vyqnNEzer9aNYqAxDpPgKxF5f5Q==
X-Google-Smtp-Source: AGHT+IEv2+PacdRXZDKioe8I+TcZjohETPUc05yqNHeQGeD9/yFMR3y1yGV/rRoXycuQG3f5WggV7ajr/dbVj0hPs9A=
X-Received: by 2002:a81:a803:0:b0:5ff:944b:6121 with SMTP id
 f3-20020a81a803000000b005ff944b6121mr1684730ywh.20.1706420024412; Sat, 27 Jan
 2024 21:33:44 -0800 (PST)
MIME-Version: 1.0
References: <20240125193834.7065-1-quic_parellan@quicinc.com>
 <20240125193834.7065-8-quic_parellan@quicinc.com>
 <301cdbe2-7377-4b0f-bd24-5131f8928c29@linaro.org>
 <09a10811-ea7c-3e99-d5eb-755aac4ecf0e@quicinc.com>
In-Reply-To: <09a10811-ea7c-3e99-d5eb-755aac4ecf0e@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 28 Jan 2024 07:33:33 +0200
Message-ID: <CAA8EJpqFcY8yBmdW8qpMiS1p3bqY2+pgXtvR0Br9-p_VAUnN+Q@mail.gmail.com>
Subject: Re: [PATCH 07/17] drm/msm/dpu: disallow widebus en in INTF_CONFIG2
 when DP is YUV420
To: Paloma Arellano <quic_parellan@quicinc.com>
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
Cc: neil.armstrong@linaro.org, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, seanpaul@chromium.org, marijn.suijten@somainline.org,
 quic_jesszhan@quicinc.com, quic_khsieh@quicinc.com,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 28 Jan 2024 at 07:16, Paloma Arellano <quic_parellan@quicinc.com> wrote:
>
>
> On 1/25/2024 1:26 PM, Dmitry Baryshkov wrote:
> > On 25/01/2024 21:38, Paloma Arellano wrote:
> >> INTF_CONFIG2 register cannot have widebus enabled when DP format is
> >> YUV420. Therefore, program the INTF to send 1 ppc.
> >
> > I think this is handled in the DP driver, where we disallow wide bus
> > for YUV 4:2:0 modes.
> Yes we do disallow wide bus for YUV420 modes, but we still need to
> program the INTF_CFG2_DATA_HCTL_EN. Therefore, it is necessary to add
> this check.

As I wrote in my second email, I'd prefer to have one if which guards
HCTL_EN and another one for WIDEN

> >
> >>
> >> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
> >> ---
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c | 4 +++-
> >>   1 file changed, 3 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> >> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> >> index 6bba531d6dc41..bfb93f02fe7c1 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> >> @@ -168,7 +168,9 @@ static void
> >> dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *ctx,
> >>        * video timing. It is recommended to enable it for all cases,
> >> except
> >>        * if compression is enabled in 1 pixel per clock mode
> >>        */
> >> -    if (p->wide_bus_en)
> >> +    if (dp_intf && fmt->base.pixel_format == DRM_FORMAT_YUV420)
> >> +        intf_cfg2 |= INTF_CFG2_DATA_HCTL_EN;
> >> +    else if (p->wide_bus_en)
> >>           intf_cfg2 |= INTF_CFG2_DATABUS_WIDEN | INTF_CFG2_DATA_HCTL_EN;
> >>         data_width = p->width;
> >



-- 
With best wishes
Dmitry
