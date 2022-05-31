Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E11FC5398DB
	for <lists+dri-devel@lfdr.de>; Tue, 31 May 2022 23:39:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8CC110E6FE;
	Tue, 31 May 2022 21:39:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 638F510E6FE
 for <dri-devel@lists.freedesktop.org>; Tue, 31 May 2022 21:39:10 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id y13so25593eje.2
 for <dri-devel@lists.freedesktop.org>; Tue, 31 May 2022 14:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZSLV3GBQBnlAV5yFp3A4v28u1Gnmik85ogLelASJBlM=;
 b=G6+2ri/VlQ8yFwFXj74MfREI3aG4EAj3Tv4RTyXriFCkuNZgqqsE6YEb+RI1MiiG6u
 jUrvLmn+pmyEOMkFGPDQlwvGDysPypwMJAL+4flzyKzCAEFIQRRucXeADWRCWhYR2I6f
 ciei005AA9QQiQXNIDi8ojvPdlBRv+7S4gA7I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZSLV3GBQBnlAV5yFp3A4v28u1Gnmik85ogLelASJBlM=;
 b=jQGxIYizQW/4PGWf81bb53dGwjIrx4s+oee3zT39ATVh6sFlnB9+y6QL5kBfiKdys+
 PsxyFmRSQG9DQDlRenoZk1Y1nbA9XNwyLqPEB7B+fWnJ5B/4SzznQrsHqGozRpnVNvdW
 6vWCr2G+6RugEQEnG686or99ZNCBYk4Cxu0P3QtBlREdAm4ZyfBp0NwTPu4cycsptyJs
 DSWFKTRfNJJDWrvrf+vjOsmzOAuBCk+tGVo90hSV1G9xohXXAyyyA7sAH0SyFuCHTypP
 v3/IgKf+VfZ3FKQIlZp8m5meH5D9pJTY88S8MtAgkqZnYVRSv1XT4LU2LoERpCQGtWcj
 VGZA==
X-Gm-Message-State: AOAM531/0I1IMmYbkE7EIUzdjdkJI/nJcu+tA806naoA71sMz+v8B5M2
 W7lDZlIw+EWkwxdpa+WhIKnvWiy6fnV4+3s3
X-Google-Smtp-Source: ABdhPJxAUXAysSCuRumGEGZXSFJo5wG1eldXOHn1MqAo5UlPq1H5mE1/8kxn3GzeQzQ32XkSv1BGdg==
X-Received: by 2002:a17:907:72d2:b0:703:9177:7d1f with SMTP id
 du18-20020a17090772d200b0070391777d1fmr3308793ejc.144.1654033149023; 
 Tue, 31 May 2022 14:39:09 -0700 (PDT)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com.
 [209.85.221.42]) by smtp.gmail.com with ESMTPSA id
 h17-20020a1709060f5100b006f3ef214da6sm5435085ejj.12.2022.05.31.14.39.07
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 May 2022 14:39:08 -0700 (PDT)
Received: by mail-wr1-f42.google.com with SMTP id h5so12248939wrb.0
 for <dri-devel@lists.freedesktop.org>; Tue, 31 May 2022 14:39:07 -0700 (PDT)
X-Received: by 2002:a05:6000:1548:b0:20f:c4e3:637a with SMTP id
 8-20020a056000154800b0020fc4e3637amr41857017wry.513.1654033146812; Tue, 31
 May 2022 14:39:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220531072757.1.Ie7f6d4bf8cce28131da31a43354727e417cae98d@changeid>
 <1ce24f74-3c9e-60ed-46ad-3ba714fb7c61@quicinc.com>
In-Reply-To: <1ce24f74-3c9e-60ed-46ad-3ba714fb7c61@quicinc.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 31 May 2022 14:38:54 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WP9-W-_rQMNbCb6JYrz9FT3wG1J1irwMZB_0ug4-jK9Q@mail.gmail.com>
Message-ID: <CAD=FV=WP9-W-_rQMNbCb6JYrz9FT3wG1J1irwMZB_0ug4-jK9Q@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dpu: Move min BW request and full BW disable back
 to mdss
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
Cc: Kalyan Thota <quic_kalyant@quicinc.com>, David Airlie <airlied@linux.ie>,
 freedreno <freedreno@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, May 31, 2022 at 2:29 PM Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
> > @@ -136,6 +178,13 @@ static int msm_mdss_enable(struct msm_mdss *msm_mdss)
> >   {
> >       int ret;
> >
> > +     /*
> > +      * Several components have AXI clocks that can only be turned on if
> > +      * the interconnect is enabled (non-zero bandwidth). Let's make sure
> > +      * that the interconnects are at least at a minimum amount.
> > +      */
> > +     msm_mdss_icc_request_bw(msm_mdss, MIN_IB_BW);
> > +
>
> This patch does two things :
>
> 1) Move the min icc vote from the dpu_runtime_resume() path to the
> msm_mdss_enable() so that while resuming, we add the min vote to the
> parent device. We do need a min vote before turning on the AXI clk as
> per this comment mentioned in c33b7c0389e1 (drm/msm/dpu: add support for
> clk and bw scaling for display)
>
>
> @@ -1101,8 +1129,15 @@ static int __maybe_unused
> dpu_runtime_resume(struct device *dev)
>          struct drm_encoder *encoder;
>          struct drm_device *ddev;
>          struct dss_module_power *mp = &dpu_kms->mp;
> +       int i;
>
>          ddev = dpu_kms->dev;
> +
> +       /* Min vote of BW is required before turning on AXI clk */
> +       for (i = 0; i < dpu_kms->num_paths; i++)
> +               icc_set_bw(dpu_kms->path[i], 0,
> +                       dpu_kms->catalog->perf.min_dram_ib);
>
> So I understand and I am fine with this part.
>
> 2) Add a min vote in msm_mdss_init().
>
> This is the part I am not able to fully follow.
>
> If we only need to add the min vote before voting for the clocks, adding
> it in mdss_mdss_enable() should be enough.
>
> Do we need this part of adding the min vote to the msm_mdss_init()?
>
> If so, why?

Ah, good question. Mostly I was matching how things were done before
commit a670ff578f1f ("drm/msm/dpu: always use mdp device to scale
bandwidth"). Before that commit we used to put the min vote in the
init path.

...but you're right, I don't see any good reason for it. I'll send a
v2 removing that line from msm_mdss_init().

-Doug
