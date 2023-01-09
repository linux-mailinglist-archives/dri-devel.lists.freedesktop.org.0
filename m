Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E4F76620FF
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jan 2023 10:08:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EACB10E0D3;
	Mon,  9 Jan 2023 09:08:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com
 [IPv6:2607:f8b0:4864:20::b2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FBC910E0D3
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jan 2023 09:08:21 +0000 (UTC)
Received: by mail-yb1-xb2b.google.com with SMTP id l139so7864870ybl.12
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jan 2023 01:08:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=WyzaMNbovLz5e0f2Pj2AVJV48B77i8KtmFksLIp0GoE=;
 b=iXGaRlr7cxQs3VBPA8A5uTISSRojwoueFyMX7G6tweRggPW+GPYeqDgsqNkHStZSQJ
 t6Cgb20KuNRVfq5lvZF/plnYMCuKLDkpaeywH75qWRo7V9ccg3wOkmrRfDDE3tvSUFMu
 jgtXkleXxqKNPndI7DJvBLsxqWl4g2EfeSGHoZbFWP1ctsTp7T2IfaRsnfUYVGlO/hww
 aySl2ma/XK1VvC1Z5DXbs7qRrpNqAK6ralW1vU2H5Uem+UGGXgxHVAlh28GCMPopYRyA
 Y0Q6Qj+lIHE4kS6bCir36+Frf1wnEXF927Xcbv4XGk7vGi5VxpuOt4NJYOzTFrv30xgJ
 zXIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WyzaMNbovLz5e0f2Pj2AVJV48B77i8KtmFksLIp0GoE=;
 b=T2WZH1gzW074WSdKckuXgxcQMNvGqHJxMVerb2QdSnb92lV70Zq9r+fCGu3b4C/DiX
 GF1uBFTMyvn7mmJcu6H1p/+ip0iG8veYMnYyDCb3UvJq9WShel3EvQAA+L6q/RnXd6KE
 StxcA7E/G8KYIcl9KU3nkxGjlbaOxZCMBEUYysMyLmXh2U38O/Vg7w1meMN82XGRijFJ
 62+/qjEjWs3z43gVW7EqpyewpG/7gHTPBdHPCqutnTR1sBc/w9KVAnP2z7N0COZzG1+L
 lgjlyI4aUIHfkicIgjb156bnWRWxSMwTiE144yjGlXS8/TLQ6PRQEU17owE/6zeEhwwD
 RE6A==
X-Gm-Message-State: AFqh2kpQQassy2tPqNJlDQFrE2wwqpP2RTPWm4yx9XrQ/jXNuGzTyhPZ
 8Ec15U9zTaK1RZDUtG2pnV8UF8csucFL3qtQo03Bzg==
X-Google-Smtp-Source: AMrXdXv7heUksktJrLuJT2/sl9qccUjvu0Os6fLmv3Ph8ZSTHk+gDOCAM7/Xr9au1wvH0fDjgfiSNEu1ReJh6u/Mtxo=
X-Received: by 2002:a25:e90c:0:b0:73a:3b94:47fc with SMTP id
 n12-20020a25e90c000000b0073a3b9447fcmr7036713ybd.152.1673255300641; Mon, 09
 Jan 2023 01:08:20 -0800 (PST)
MIME-Version: 1.0
References: <20221221231943.1961117-1-marijn.suijten@somainline.org>
 <20221221231943.1961117-7-marijn.suijten@somainline.org>
 <42b45762-7fb9-2694-9fab-039ee09e4709@linaro.org>
 <20230109082118.v2abyucljztsflxj@SoMainline.org>
In-Reply-To: <20230109082118.v2abyucljztsflxj@SoMainline.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 9 Jan 2023 11:08:09 +0200
Message-ID: <CAA8EJppTfJ6LnTEUWVASk1U6v3OX3MH71vuOhUk_Aa_HoraQ_w@mail.gmail.com>
Subject: Re: [PATCH v2 6/8] drm/msm/dpu: Remove num_enc from topology struct
 in favour of num_dsc
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
Cc: Konrad Dybcio <konrad.dybcio@somainline.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 phone-devel@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
 Haowen Bai <baihaowen@meizu.com>, Vinod Koul <vkoul@kernel.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Jani Nikula <jani.nikula@intel.com>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Stephen Boyd <swboyd@chromium.org>, Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht, Sean Paul <sean@poorly.run>,
 Loic Poulain <loic.poulain@linaro.org>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Vladimir Lypak <vladimir.lypak@gmail.com>,
 Douglas Anderson <dianders@chromium.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, sunliming <sunliming@kylinos.cn>,
 freedreno@lists.freedesktop.org, Vinod Polimera <quic_vpolimer@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 9 Jan 2023 at 10:21, Marijn Suijten
<marijn.suijten@somainline.org> wrote:
>
> On 2023-01-09 01:31:57, Dmitry Baryshkov wrote:
> > On 22/12/2022 01:19, Marijn Suijten wrote:
> > > Downstream calls this num_enc yet the DSC patches introduced a new
> > > num_dsc struct member, leaving num_enc effectively unused.
> > >
> > > Fixes: 7e9cc175b159 ("drm/msm/disp/dpu1: Add support for DSC in topology")
> > > Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> > > ---
> > >   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 9 ++++-----
> > >   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c      | 4 ++--
> > >   drivers/gpu/drm/msm/msm_drv.h               | 2 --
> > >   3 files changed, 6 insertions(+), 9 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > > index 9c6817b5a194..a158cd502d38 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > > @@ -579,19 +579,18 @@ static struct msm_display_topology dpu_encoder_get_topology(
> > >                     topology.num_dspp = topology.num_lm;
> > >     }
> > >
> > > -   topology.num_enc = 0;
> > >     topology.num_intf = intf_count;
> > >
> > >     if (dpu_enc->dsc) {
> > > -           /* In case of Display Stream Compression (DSC), we would use
> > > -            * 2 encoders, 2 layer mixers and 1 interface
> > > +           /*
> > > +            * In case of Display Stream Compression (DSC), we would use
> > > +            * 2 DSC encoders, 2 layer mixers and 1 interface
> > >              * this is power optimal and can drive up to (including) 4k
> > >              * screens
> > >              */
> > > -           topology.num_enc = 2;
> > >             topology.num_dsc = 2;
> > > -           topology.num_intf = 1;
> > >             topology.num_lm = 2;
> > > +           topology.num_intf = 1;
> >
> > Unless there is a reason, please move num_intf assignment back while
> > preparing v3.
>
> The assignment was reordered to match the order described in the comment
> right above, such that this reads more naturally.  Not sure if it's
> worth sending that as a separate fix, or drop it entirely.

I see. Sounds logical then. Let's keep it as is.

>
> > With that fixed:
> >
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>
> <snip>



-- 
With best wishes
Dmitry
