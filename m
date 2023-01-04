Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E09265DB81
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jan 2023 18:48:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 311EF10E468;
	Wed,  4 Jan 2023 17:48:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com
 [IPv6:2607:f8b0:4864:20::b34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95D5D10E468
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Jan 2023 17:48:29 +0000 (UTC)
Received: by mail-yb1-xb34.google.com with SMTP id g4so37360391ybg.7
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Jan 2023 09:48:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=h6ernteAwaoJavQln9yDUlEHLQyyCv6s+N2K/1h5NJc=;
 b=c8T0coN2VqEx+gs0ROuXhPs7kCS4obyZ/UI06gKIGvD0Ihja5IGREFjVP+Xxd98hZj
 JmN6Hn34JL/q+Xe5Chb4rHZLYeJKTGtGlwWMd5x8kJy8znBPKE6/o5tJ2P9UAXTSSgnK
 MtzmlTkj/kIwQNIChRWNpZlXaR43D3nX6jpSSo5VuCbxd3//AF2ac8LKvsJKTEs4ot09
 LLNkYJuein+LHqM/4NmAVGNItnrA3aVURF2hHR0cB7punrzIHp1y8EDj1LJdZQ7uQNcu
 zvLexEulaVLFfNrInPdeLZZaK9a/1BABQAZqTJfRnANh7asjBt/H+PsBVOddTmRPWC86
 0uug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=h6ernteAwaoJavQln9yDUlEHLQyyCv6s+N2K/1h5NJc=;
 b=sIGmo75NRRPVDVCj2zE5nuwzsYDKs4Gwotm4n5FI0m/iyEyG1rEXuY2EgmoVhYRocj
 7W/K/PFj/28/RTI7V6b3jAw0fOhhmldrX6ErqodoCzGzGWcFHywRrJNelltjqcTb5FWM
 YYdZj7fE7d/jQXLxZrknAoXTB5sDdRH3je/bIbjO2O6Cx9S292LxhTSZR+ZmhuidZyTi
 0p4uJj7ojIoQ/f7CFcqhv4trPIp918uOmZQ+3TlBWyAXY6/mFzTPVEDe+DsLNONvrRIT
 otPgMN++DY56ESU6sz7sFe0Jlpb5ITSx0mzg8jrKdO6nEdpFr3uyWjx5OV6lrz+fjzhZ
 4Ctw==
X-Gm-Message-State: AFqh2krsBEzixu23LZ2V3ubwOLmRDity6lwxxeS+LcGL+et8UvK11NeB
 /JzkHtc86OClqsrxnqbQn6dcTwuuoSlQ5QGejXAnRN834MlLmA==
X-Google-Smtp-Source: AMrXdXuACj2NxKuibRwSdOimb0397QQRnaQeVI/kN9TdsBU3F52F+lvf5NW7TBxyVHHjkeuwiN4WM5G/dxrKKeA1TIs=
X-Received: by 2002:a25:606:0:b0:709:9335:236e with SMTP id
 6-20020a250606000000b007099335236emr4325601ybg.288.1672854508646; Wed, 04 Jan
 2023 09:48:28 -0800 (PST)
MIME-Version: 1.0
References: <20230103-topic-sm8550-upstream-mdss-dsi-v1-0-9ccd7e652fcd@linaro.org>
 <20230103-topic-sm8550-upstream-mdss-dsi-v1-3-9ccd7e652fcd@linaro.org>
 <96ccae6f-3788-e030-480f-7aa2478ca560@linaro.org>
 <de3860ba-40f9-cdd5-097c-e015f6b19255@linaro.org>
In-Reply-To: <de3860ba-40f9-cdd5-097c-e015f6b19255@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 4 Jan 2023 19:48:17 +0200
Message-ID: <CAA8EJpoi8QFpvR0qWpNpenZKzEZAQpwp3gNpGd3RwHovgC+Odw@mail.gmail.com>
Subject: Re: [PATCH 3/6] drm/msm/dpu: add support for SM8550
To: neil.armstrong@linaro.org
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
Cc: freedreno@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonathan Marek <jonathan@marek.ca>, devicetree@vger.kernel.org,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 4 Jan 2023 at 12:08, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>
> On 04/01/2023 10:45, Dmitry Baryshkov wrote:
> > On 04/01/2023 11:08, Neil Armstrong wrote:
> >> Add definitions for the display hardware used on Qualcomm SM8550
> >> platform.
> >>
> >> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> >> ---
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 197 +++++++++++++++++++++++++
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h |   1 +
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h    |   2 +
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c        |   1 +
> >>   4 files changed, 201 insertions(+)
> >>
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> >> index b4ca123d8e69..adf5e25269dc 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>
> <snip>
>
> >> @@ -776,6 +821,45 @@ static const struct dpu_ctl_cfg sm8450_ctl[] = {
> >>       },
> >>   };
> >> +static const struct dpu_ctl_cfg sm8550_ctl[] = {
> >> +    {
> >> +    .name = "ctl_0", .id = CTL_0,
> >> +    .base = 0x15000, .len = 0x290,?
> >> +    .features = BIT(DPU_CTL_ACTIVE_CFG) | BIT(DPU_CTL_SPLIT_DISPLAY) | BIT(DPU_CTL_FETCH_ACTIVE),
> >
> > CTL_SC7280_MASK | BIT(DPU_CTL_SPLIT_DISPLAY) ?
>
> Indeed DPU_CTL_VM_CFG is missing, will switch to that.
>
> >
> >> +    .intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
> >> +    },
> >> +    {
> >> +    .name = "ctl_1", .id = CTL_1,
> >> +    .base = 0x16000, .len = 0x290,
> >> +    .features = BIT(DPU_CTL_ACTIVE_CFG) | BIT(DPU_CTL_SPLIT_DISPLAY) | BIT(DPU_CTL_FETCH_ACTIVE),
> >> +    .intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
> >> +    },
> >> +    {
> >> +    .name = "ctl_2", .id = CTL_2,
> >> +    .base = 0x17000, .len = 0x290,
> >> +    .features = BIT(DPU_CTL_ACTIVE_CFG) | BIT(DPU_CTL_FETCH_ACTIVE),
> >
> > CTL_SC7280_MASK?
>
> Ack
>
> >
> >> +    .intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
> >> +    },
> >> +    {
> >> +    .name = "ctl_3", .id = CTL_3,
> >> +    .base = 0x18000, .len = 0x290,
> >> +    .features = BIT(DPU_CTL_ACTIVE_CFG) | BIT(DPU_CTL_FETCH_ACTIVE),
> >> +    .intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
> >> +    },
> >> +    {
> >> +    .name = "ctl_4", .id = CTL_4,
> >> +    .base = 0x19000, .len = 0x290,
> >> +    .features = BIT(DPU_CTL_ACTIVE_CFG) | BIT(DPU_CTL_FETCH_ACTIVE),
> >> +    .intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
> >> +    },
> >> +    {
> >> +    .name = "ctl_5", .id = CTL_5,
> >> +    .base = 0x1a000, .len = 0x290,
> >> +    .features = BIT(DPU_CTL_ACTIVE_CFG) | BIT(DPU_CTL_FETCH_ACTIVE),
> >> +    .intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 23),
> >> +    },
> >> +};
> >> +
> >>   static const struct dpu_ctl_cfg sc7280_ctl[] = {
> >>       {
> >>       .name = "ctl_0", .id = CTL_0,
>
> <snip>
>
> >> @@ -1268,6 +1386,16 @@ static const struct dpu_pingpong_sub_blks sc7280_pp_sblk = {
> >>       .len = 0x20, .version = 0x20000},
> >>   };
> >> +#define PP_BLK_DIPHER(_name, _id, _base, _merge_3d, _sblk, _done, _rdptr) \
> >> +    {\
> >> +    .name = _name, .id = _id, \
> >> +    .base = _base, .len = 0, \
> >
> > len = 0 looks incorrect. Any particular reason why can't we use plain PP_BLK here?
>
> The TE block has been moved to the DSI INTF blocks since SM8350 I think, or earlier.

I think, 8150. Marijn has been working on adding support for INTF-based TE.

> This removes the DPU_PINGPONG_DITHER feature used downstream to enable the PP TE callbacks.
> Since there's only the DIPHER sub-block remaining, this is why I set len to 0.

I went on with some research. Usually PP len is 0xd4. However it seems
since 8350 (since the change of DSC block) the PP size should be 0x0),
despite dowsnstream DTs having sde-pp-size=0xd4 for sm8350 and sm8450
(or 0x4 for neo, DPU 9.1.0).
So, it looks like you are correct here (and we should fix 8350/8450
patches instead).

>
> >
> >> +    .features = BIT(DPU_PINGPONG_DITHER), \
> >> +    .merge_3d = _merge_3d, \
> >> +    .sblk = &_sblk, \
> >> +    .intr_done = _done, \
> >> +    .intr_rdptr = _rdptr, \
> >> +    }
> >>   #define PP_BLK_TE(_name, _id, _base, _merge_3d, _sblk, _done, _rdptr) \
> >>       {\
> >>       .name = _name, .id = _id, \
>
> <snip>
>


-- 
With best wishes
Dmitry
