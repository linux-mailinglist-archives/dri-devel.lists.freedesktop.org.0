Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EBCE4D8649
	for <lists+dri-devel@lfdr.de>; Mon, 14 Mar 2022 14:58:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5E3610E6A9;
	Mon, 14 Mar 2022 13:58:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAC5210E6A9
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Mar 2022 13:58:08 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id a8so34156215ejc.8
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Mar 2022 06:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/sGwhFLRtiH/ykUra8RNv5VtPDl39PfWAyeMQdseV4U=;
 b=E4HfJt2lpl5yMCJkmr268M1C6Xw1SdJiBIbXECMsySpxvvMRbBTqo3MSLg3VnfahpC
 P7LzLbgUQFA4BE/DsfILmqLQHUV+ASwOd5AcDTChMfwhP9mK0rdOs6tf3pdCjfyIgHEm
 lfiSNtrZ23gznqQr7osIXvkgdlCoTI2SO5lFQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/sGwhFLRtiH/ykUra8RNv5VtPDl39PfWAyeMQdseV4U=;
 b=sMjbaAQEe0Ja8FPF8eG+vhjlolxmrLW+M6w/nE9KXMRzeHK0/2zlO8hur5rfjbshav
 bRvUXLDWMiO1UOj0q7UQdkRm5hm71utLruFyX39OYx9eYfkAY9nqg5HX6OvLWC3tqeyC
 TteHzoC3jBU6r2DW/g7kF0YYyAukvYv/mgupBaiF4LZJBoatRdsPuuT7aep9LYOyP5Ri
 fVrLVdTE6mcYwrUAHTsjPBdxPvzswmxxZsnerO1DimSTkxuARDZnJ57S5WZZBosy7RP4
 9ygCpFEyMBZ5ZxWPRkgS6u4qJEUM6JRAmuQRUYhym7L1xe0icNxTSzEfQYKjj/fwqWCg
 JJYg==
X-Gm-Message-State: AOAM532KpvwUb/pIFNs2gRN4zwMFPap6Y5rkUhwT/nqInQaFU998u/S2
 gxfq6xhgjMsQ3SXlFXW+O03BrlQBkNRoKA==
X-Google-Smtp-Source: ABdhPJyg5lnnV8pDmSYLjmX76n+9qCnCfAmA3ng10pxt+UmwOOB9a4nQCYFOfbYBc/jIwdRDbCz/+Q==
X-Received: by 2002:a17:907:1c0e:b0:6db:41b2:8d98 with SMTP id
 nc14-20020a1709071c0e00b006db41b28d98mr18601884ejc.102.1647266287020; 
 Mon, 14 Mar 2022 06:58:07 -0700 (PDT)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com.
 [209.85.128.54]) by smtp.gmail.com with ESMTPSA id
 d11-20020a170906c20b00b006d584a09b9fsm6929993ejz.98.2022.03.14.06.58.05
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Mar 2022 06:58:06 -0700 (PDT)
Received: by mail-wm1-f54.google.com with SMTP id
 q7-20020a7bce87000000b00382255f4ca9so12089610wmj.2
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Mar 2022 06:58:05 -0700 (PDT)
X-Received: by 2002:a05:600c:a53:b0:38a:fc5:3a90 with SMTP id
 c19-20020a05600c0a5300b0038a0fc53a90mr3788786wmq.15.1647266285495; Mon, 14
 Mar 2022 06:58:05 -0700 (PDT)
MIME-Version: 1.0
References: <1646758500-3776-1-git-send-email-quic_vpolimer@quicinc.com>
 <1646758500-3776-2-git-send-email-quic_vpolimer@quicinc.com>
 <CAE-0n51bfqWs8yOiyQ-A_bEQ7CZSqavz8epcFEWYyZxxoRYFHg@mail.gmail.com>
 <BN0PR02MB8173F2E408848216D489D503E40C9@BN0PR02MB8173.namprd02.prod.outlook.com>
 <CAA8EJppt_NjOdJWGrP=8zwG1yEAyJBtnv4G5vLW3CHZ8WrGFvw@mail.gmail.com>
In-Reply-To: <CAA8EJppt_NjOdJWGrP=8zwG1yEAyJBtnv4G5vLW3CHZ8WrGFvw@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 14 Mar 2022 06:57:51 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Wy-ew3sbsQ_ojoAdAXeZPsRzwGJWqNQqpuZDb1GPknfg@mail.gmail.com>
Message-ID: <CAD=FV=Wy-ew3sbsQ_ojoAdAXeZPsRzwGJWqNQqpuZDb1GPknfg@mail.gmail.com>
Subject: Re: [PATCH v5 1/5] arm64/dts/qcom/sc7280: remove assigned-clock-rate
 property for mdp clk
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 Vinod Polimera <vpolimer@qti.qualcomm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 quic_vpolimer <quic_vpolimer@quicinc.com>, Stephen Boyd <swboyd@chromium.org>,
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, Mar 11, 2022 at 1:22 AM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Fri, 11 Mar 2022 at 11:06, Vinod Polimera <vpolimer@qti.qualcomm.com> wrote:
> >
> >
> >
> > > -----Original Message-----
> > > From: Stephen Boyd <swboyd@chromium.org>
> > > Sent: Wednesday, March 9, 2022 1:36 AM
> > > To: quic_vpolimer <quic_vpolimer@quicinc.com>;
> > > devicetree@vger.kernel.org; dri-devel@lists.freedesktop.org;
> > > freedreno@lists.freedesktop.org; linux-arm-msm@vger.kernel.org
> > > Cc: linux-kernel@vger.kernel.org; robdclark@gmail.com;
> > > dianders@chromium.org; quic_kalyant <quic_kalyant@quicinc.com>
> > > Subject: Re: [PATCH v5 1/5] arm64/dts/qcom/sc7280: remove assigned-clock-
> > > rate property for mdp clk
> > >
> > > WARNING: This email originated from outside of Qualcomm. Please be wary
> > > of any links or attachments, and do not enable macros.
> > >
> > > Quoting Vinod Polimera (2022-03-08 08:54:56)
> > > > Kernel clock driver assumes that initial rate is the
> > > > max rate for that clock and was not allowing it to scale
> > > > beyond the assigned clock value.
> > >
> > > How? I see ftbl_disp_cc_mdss_mdp_clk_src[] has multiple frequencies and
> > > clk_rcg2_shared_ops so it doesn't look like anything in the clk driver
> > > is preventing the frequency from changing beyond the assigned value.
> >
> > Folowing the comment of Stephen, i have checked a bit more. it appears that clock driver is not setting the max clock from assgined clocks, dpu driver is doing that.
> > i am planning to fix it as below.
> > 1) assign ULONG_MAX to max_rate while initializing clock in dpu driver.
> > 2) remove unnecessary checks in the core_perf library. If rate doesn't match with the entries in the opp table, it will throw error, hence furthur checks are not needed.
> > 3) no changes in dt are required. (we can drop all the posted ones)
>
> Why? They made perfect sense. The dts assignments should be replaced
> by the opp setting in the bind function, as this would also set the
> performance point of the respective power domain.

Right. You should still _post_ the dts patches. It's nice to avoid
unneeded "assigned-clocks" in the dts. The patch description should
just be clear that it relies on the driver patch and shouldn't land /
be backported without the driver patch.


> > Changes :
> > ```--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> > @@ -284,17 +284,6 @@ void dpu_core_perf_crtc_release_bw(struct drm_crtc *crtc)
> >         }
> >  }
> >
> > -static int _dpu_core_perf_set_core_clk_rate(struct dpu_kms *kms, u64 rate)
> > -{
> > -       struct dss_clk *core_clk = kms->perf.core_clk;
> > -
> > -       if (core_clk->max_rate && (rate > core_clk->max_rate))
> > -               rate = core_clk->max_rate;
> > -
> > -       core_clk->rate = rate;
> > -       return dev_pm_opp_set_rate(&kms->pdev->dev, core_clk->rate);
> > -}
> > -
> >  static u64 _dpu_core_perf_get_core_clk_rate(struct dpu_kms *kms)
> >  {
> >         u64 clk_rate = kms->perf.perf_tune.min_core_clk;
> > @@ -405,7 +394,7 @@ int dpu_core_perf_crtc_update(struct drm_crtc *crtc,
> >
> >                 trace_dpu_core_perf_update_clk(kms->dev, stop_req, clk_rate);
> >
> > -               ret = _dpu_core_perf_set_core_clk_rate(kms, clk_rate);
> > +               ret = dev_pm_opp_set_rate(&kms->pdev->dev, clk_rate);
> >                 if (ret) {
> >                         DPU_ERROR("failed to set %s clock rate %llu\n",
> >                                         kms->perf.core_clk->clk_name, clk_rate);
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_io_util.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_io_util.c
>
> This file has been removed in msm/next

To echo Dmitry, please make sure that your patch applies to msm-next,
As I understand it, that means the branch msm-next on:

https://gitlab.freedesktop.org/drm/msm.git

-Doug
