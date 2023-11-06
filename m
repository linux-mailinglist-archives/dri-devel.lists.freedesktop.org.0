Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDC727E2F9E
	for <lists+dri-devel@lfdr.de>; Mon,  6 Nov 2023 23:12:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9E2210E448;
	Mon,  6 Nov 2023 22:12:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com
 [IPv6:2607:f8b0:4864:20::1129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDC7510E44D
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Nov 2023 22:11:59 +0000 (UTC)
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-5a7d9d357faso58239557b3.0
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Nov 2023 14:11:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699308719; x=1699913519; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=TGM/lCcxyrtlyI0/1HNh1y04S/ydjRYuctHpQFy0HgE=;
 b=b9reIAJFMzZ2yGo43J0bdC1x9EpePaztqILKe3Gs3DJDYNNNV21JG4zlr24FaBzHiT
 Rjse1pyvBvx9zt4wbSA09GkCRmKX7D0I4ymIfU+hzCqK5E4jjfEHJuZrt/cfm5zThfrm
 Y8jWbiCxxmH09DBHgt8SpEWfjh/SDlhCMpHvO1fXjNb9Rl45cCz2miza+T1QmfQX7NcY
 zaok6Ror1jKG3ufMoPn6QuTVSSJesunDHtpzZVZr9JFoz0atu+3IAZBAWDykoaZjTGQ9
 cg8Ya4QFx8lyZ/oMIwag15YWKPU0ltZX+3gvASW3pHLlR3bUKSXOmts3BzX/ao+6QOLW
 gPSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699308719; x=1699913519;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TGM/lCcxyrtlyI0/1HNh1y04S/ydjRYuctHpQFy0HgE=;
 b=PqwUacvNBAdYoi+aCw1Xc1IcQBn4vTKsKZ72LOH3F67SJcD0g3S1e9eCgND/CO7wq1
 470g9l9VpkzfwvaBCDCDIUmnclLG+lmc3xehsQOpRXiCG+XPLGhHncAbxrO0b0vhQ51R
 LlBh9P8rFIhgk8+BK6eHQICfN3yBa3G14kOE5TPApsygHtc9tTIV6mJlhwR8dCFfuL0e
 McA9pp8W0htRcuV4fSVeoKoimfvB3DTdzC/ZHwIkqPU1ET1uHzsORzXQeptBWl1xQFca
 0DS9ZkV5KfbQnu0eskV6vWTNudGkCslFHnGMbTneAc6TmcCOMFHDiUs7pw5UXWVQ4gVy
 VJ9A==
X-Gm-Message-State: AOJu0YxtIWBiTMyvLjdWfe/qCbZsKRhyP4JKpiu7J/nIsUrAgibdY8DL
 IgGehsMqywo/pxABB7eXPQkopjXDGFjO/5UvL6v/kw==
X-Google-Smtp-Source: AGHT+IH4OKDEo0z40E9ned6EK3zJyr56Otbk/sjKYRo1vUt/B3CisEMRaJv/JlQGTxVvoMPU5l/04Q9U9RkfcQ4U0Ds=
X-Received: by 2002:a81:990d:0:b0:5af:196c:dfcc with SMTP id
 q13-20020a81990d000000b005af196cdfccmr10650083ywg.8.1699308718929; Mon, 06
 Nov 2023 14:11:58 -0800 (PST)
MIME-Version: 1.0
References: <20231009171139.2691218-1-dmitry.baryshkov@linaro.org>
 <e4c94f9d-773a-e894-d655-41afeb01dae1@quicinc.com>
In-Reply-To: <e4c94f9d-773a-e894-d655-41afeb01dae1@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 7 Nov 2023 00:11:47 +0200
Message-ID: <CAA8EJprpBy6UhtScRkFS24TgKevBOb9nVBFCqPhEof=-k58Mwg@mail.gmail.com>
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

On Mon, 6 Nov 2023 at 20:39, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
> Sorry for the delay in getting back on this. There was quite a bit of
> history digging I had to do myself to give a certain response.
>
>
> On 10/9/2023 10:11 AM, Dmitry Baryshkov wrote:
> > On sc7280 there are two clk bits for WB2: control and status. While
> > programming the VBIF params of WB, the driver should be toggling the
> > former bit, while the sc7280_mdp struct lists the latter one.
> >
>
> No, this is not correct. Both are control bits. But for the context of
> where this is being used today, that is setting the VBIF OT limit, we
> should be using the VBIF_CLI one. So the below change itself is correct
> but not the commit text.

Maybe you can update dt bindings for the SDE driver? Because they
clearly speak about the control and status bits.

>
> We need to make the same change on sm8250 WB2 as well as this register
> is present there too. In fact, anything >=msm8994 for setting VBIF OT
> for WB2 we should be using VBIF_CLI bits of register MDP_CLK_CTRL2
> (offset 0x2bc).
>
> For anything >=sm8550, we need to use WB_2_CLK_CTRL present within the
> WB block and not the one in the top.
>
> Hence for this change, we can do below:
>
> -> update the commit text to indicate both are control bits but for the
> vbif ot context we should using the corrected one
> -> if you can also add sm8250 in the same change i can ack it and pick it up
>
> Have you re-validated WB with this change? If not, let me know I shall
> while picking this up for -fixes.

No, I haven't validated this on sc7280. I'll try this on sm8250 and
then I'll send v2.

>
> > Correct that to ensure proper programming sequence for WB2 on sc7280.
> >
> > Fixes: 3ce166380567 ("drm/msm/dpu: add writeback support for sc7280")
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> > index 3b5061c4402a..9195cb996f44 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> > @@ -25,7 +25,7 @@ static const struct dpu_mdp_cfg sc7280_mdp = {
> >               [DPU_CLK_CTRL_DMA0] = { .reg_off = 0x2ac, .bit_off = 8 },
> >               [DPU_CLK_CTRL_DMA1] = { .reg_off = 0x2b4, .bit_off = 8 },
> >               [DPU_CLK_CTRL_DMA2] = { .reg_off = 0x2c4, .bit_off = 8 },
> > -             [DPU_CLK_CTRL_WB2] = { .reg_off = 0x3b8, .bit_off = 24 },
> > +             [DPU_CLK_CTRL_WB2] = { .reg_off = 0x2bc, .bit_off = 16 },
> >       },
> >   };
> >



-- 
With best wishes
Dmitry
