Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E197E319C
	for <lists+dri-devel@lfdr.de>; Tue,  7 Nov 2023 00:49:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A73910E464;
	Mon,  6 Nov 2023 23:49:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com
 [IPv6:2607:f8b0:4864:20::b29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D73E310E45E
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Nov 2023 23:49:15 +0000 (UTC)
Received: by mail-yb1-xb29.google.com with SMTP id
 3f1490d57ef6-d9ca471cf3aso5330608276.2
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Nov 2023 15:49:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699314555; x=1699919355; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=tQFqDSAgiWaPIVshMRb+fCRuV7mmBlmC784sMYp/hys=;
 b=AXXmwsQDgYvtlxo9EjslXJsmJIQnEHwrcbZpg/ZiwhHZJAHorz0/5mU+zayYvr5EVL
 NJzaXMu5skw69/H3Lwf96lqjne0m71SRKoHYtMGO+rTaxZqzfg+5TsTra0gIKIIqA0+v
 +CCN5V0HNh0oEZtS3uho1ujF0yXUDhC6PLSbNYGa0aNosSy2QtYdfj5AowAxGIHr9Lup
 70oXilPdjOJ2Yxad32+o1mNtamZUOvuGyKNccz9mNYxk1sbUc9IOcv5JusahC4sq/3V4
 QBm2cXkEwyyyrqtomLNdsVQXSrgvIyfEc5WXoObI+uCxMj3Oh94tS1hGsPxU0ocpYkq7
 ttfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699314555; x=1699919355;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tQFqDSAgiWaPIVshMRb+fCRuV7mmBlmC784sMYp/hys=;
 b=df9wgXPo7/IAzLhJ4vbQ3seM1+2kZZr3pGjAyeaqRQwAJ+KnnD6mZ3Db1oAWIDuuAM
 FYrXsHFbs2/kgKInZqkhFeoBnxXoPqV7jmdnbQGW9dmvCUrOIN9XigJS43wKmXIUWgDJ
 Mc/1uKISAnaYcuJ0JtSsN7FdKLH8yzv8E1LTDxMfyGhItYhitCpbNZDuJGy8GuWwomR8
 EexogJ3Eh7eORcJW2KUYHZXmEE3nti0Q4G2znDK+tSd6nPMMMxsq/zeo28gcaR8ZWyHN
 2yOCnRrFjUWuvUQ6su1CbCek3ZMDcp2hWUOCVkIyY4SMeWFFSKWsukxUqmyejhVlwByo
 JE1Q==
X-Gm-Message-State: AOJu0Yx34jsF5CTCJLQb1VFHML4WWVAgcFCl0HMt3DanMvyC+qWEse1Y
 1ekjLlgXPWR8EaGme0NGG7Yp8YTSno5SVsLckE/Zog==
X-Google-Smtp-Source: AGHT+IFAkvpy/g1sY/1xUwAKmKYfgd46amCuq1aXEiffyp4vSVs/pWccSw/DXuVqcLLSwjX8OS1pefTcKi6rRIgLSoM=
X-Received: by 2002:a05:6902:1204:b0:d7b:90c6:683c with SMTP id
 s4-20020a056902120400b00d7b90c6683cmr35829665ybu.26.1699314554997; Mon, 06
 Nov 2023 15:49:14 -0800 (PST)
MIME-Version: 1.0
References: <20231009171139.2691218-1-dmitry.baryshkov@linaro.org>
 <e4c94f9d-773a-e894-d655-41afeb01dae1@quicinc.com>
 <CAA8EJprpBy6UhtScRkFS24TgKevBOb9nVBFCqPhEof=-k58Mwg@mail.gmail.com>
 <1ac30bfd-86d9-8186-1aee-f201b8ff4370@quicinc.com>
In-Reply-To: <1ac30bfd-86d9-8186-1aee-f201b8ff4370@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 7 Nov 2023 01:49:03 +0200
Message-ID: <CAA8EJppY0V20rF1kV-b8X2xuCQ6ZHy_+0YGp5s6b_Srvq-LLNg@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dpu: correct clk bit for WB2 block
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
Cc: freedreno@lists.freedesktop.org, Bjorn Andersson <andersson@kernel.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 linux-arm-msm@vger.kernel.org, Marijn Suijten <marijn.suijten@somainline.org>,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 7 Nov 2023 at 01:30, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 11/6/2023 2:11 PM, Dmitry Baryshkov wrote:
> > On Mon, 6 Nov 2023 at 20:39, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >>
> >> Sorry for the delay in getting back on this. There was quite a bit of
> >> history digging I had to do myself to give a certain response.
> >>
> >>
> >> On 10/9/2023 10:11 AM, Dmitry Baryshkov wrote:
> >>> On sc7280 there are two clk bits for WB2: control and status. While
> >>> programming the VBIF params of WB, the driver should be toggling the
> >>> former bit, while the sc7280_mdp struct lists the latter one.
> >>>
> >>
> >> No, this is not correct. Both are control bits. But for the context of
> >> where this is being used today, that is setting the VBIF OT limit, we
> >> should be using the VBIF_CLI one. So the below change itself is correct
> >> but not the commit text.
> >
> > Maybe you can update dt bindings for the SDE driver? Because they
> > clearly speak about the control and status bits.
> >
>
> There is nothing to update here if we both are referring to the same
> entries in the dt bindings.
>
> qcom,sde-wb-clk-status = <0x3bc 20>;
>
> the clk status is indeed bit 20 of 0x3bc.
>
> What we have before your patch was bit 24 of 0x3b8 which was indeed
> clk_ctl bit for wb2. But the only issue was it was not the vbif_cli one.
>
> So we are talking about two different registers?

Ah, excuse me then, I didn't notice 24 vs 20.

>
> >>
> >> We need to make the same change on sm8250 WB2 as well as this register
> >> is present there too. In fact, anything >=msm8994 for setting VBIF OT
> >> for WB2 we should be using VBIF_CLI bits of register MDP_CLK_CTRL2
> >> (offset 0x2bc).
> >>
> >> For anything >=sm8550, we need to use WB_2_CLK_CTRL present within the
> >> WB block and not the one in the top.
> >>
> >> Hence for this change, we can do below:
> >>
> >> -> update the commit text to indicate both are control bits but for the
> >> vbif ot context we should using the corrected one
> >> -> if you can also add sm8250 in the same change i can ack it and pick it up
> >>
> >> Have you re-validated WB with this change? If not, let me know I shall
> >> while picking this up for -fixes.
> >
> > No, I haven't validated this on sc7280. I'll try this on sm8250 and
> > then I'll send v2.
> >
> >>
> >>> Correct that to ensure proper programming sequence for WB2 on sc7280.
> >>>
> >>> Fixes: 3ce166380567 ("drm/msm/dpu: add writeback support for sc7280")
> >>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>> ---
> >>>    drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h | 2 +-
> >>>    1 file changed, 1 insertion(+), 1 deletion(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> >>> index 3b5061c4402a..9195cb996f44 100644
> >>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> >>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> >>> @@ -25,7 +25,7 @@ static const struct dpu_mdp_cfg sc7280_mdp = {
> >>>                [DPU_CLK_CTRL_DMA0] = { .reg_off = 0x2ac, .bit_off = 8 },
> >>>                [DPU_CLK_CTRL_DMA1] = { .reg_off = 0x2b4, .bit_off = 8 },
> >>>                [DPU_CLK_CTRL_DMA2] = { .reg_off = 0x2c4, .bit_off = 8 },
> >>> -             [DPU_CLK_CTRL_WB2] = { .reg_off = 0x3b8, .bit_off = 24 },
> >>> +             [DPU_CLK_CTRL_WB2] = { .reg_off = 0x2bc, .bit_off = 16 },
> >>>        },
> >>>    };
> >>>
> >
> >
> >



-- 
With best wishes
Dmitry
