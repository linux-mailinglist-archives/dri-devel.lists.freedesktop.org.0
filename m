Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 19C2F7DC804
	for <lists+dri-devel@lfdr.de>; Tue, 31 Oct 2023 09:17:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B424410E41C;
	Tue, 31 Oct 2023 08:17:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com
 [IPv6:2607:f8b0:4864:20::b36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D025010E41C
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Oct 2023 08:17:03 +0000 (UTC)
Received: by mail-yb1-xb36.google.com with SMTP id
 3f1490d57ef6-d81d09d883dso4698047276.0
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Oct 2023 01:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698740223; x=1699345023; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Smwqa/VxxxvV+NAJpecN+RuY1E+JDILev1nYuilsBMI=;
 b=ILhuhPQ1jJ3FgEFNtR7Ou1GVJIsMEaKDp+JJnJObJ+Z6rbcPtcDpNDlWT/BY9jP3tX
 fx7sBM6sXQ6UTDiq2e/wttnIviIupW8HFaV9yweCK+tTuLiP6CMj/j2MdhVxn0KvM1Uv
 ReJbhd6YNC79d6wNLziyde764s4L3EZsXXC+XV4m4eCJD1VGtEhzPEybuYzz+x1C7f3m
 g4ApxUU3ysq2Jw7KW+qAPPoSzHeYcyaXBd4K+xi/vVckNPI/jtApXovZCviuZI3ANX9z
 62zGyIUj9SdZhtFHe2znhngfnc2BAVxWprPNxJUAMrYUJsvlpOe8niyvfcQBYejYO9Xd
 HPHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698740223; x=1699345023;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Smwqa/VxxxvV+NAJpecN+RuY1E+JDILev1nYuilsBMI=;
 b=a5H4p3r2PWsOGqDT6QDyXmxQA7N6r4eqOttFkxQAKbniTP5vReBNYheOeghn/dC0zk
 2BV8pCULR+zvD4aisLA2LI6axjwTlQjQTe+ujFYtKon78fQqF9qahxh9Mfq3e/NcAqV/
 jm8RQCKdFnfrNWHBMNIxhGSgJRVxvLo0ozp6O78QhrpDvPlpk2g6EKAAe+yZcVz1hlRW
 xnt2kDP8qdWAxcEgKT7wPFB74RkGbyA0RCU/cfuwjKCKeFYth3RI2IpGZMWlHY++Jbp6
 3WYwRhFicET0IGwV49LwBv225seGVKnVrZJh23EP/YIUOU/kIqDHkcsNQRdKPQPW/A6k
 odjg==
X-Gm-Message-State: AOJu0YzVlR7VJqYAFMRPFH9Y5b9YxqWEnK6VUnmNOvEeZBN5qLFGE+m2
 1Uq0ZMTWohcoYDLus8sdInQDhWbVo98UEliR2fMKDw==
X-Google-Smtp-Source: AGHT+IHWifJqXC6H9D9kHYHXl1DQa3F7wXkSKAOFkAJmE2UoxCTGIcCFzuVkIhkNunb7Tg2gq9HFmGzJe/dab3ccdIE=
X-Received: by 2002:a25:238e:0:b0:da1:2a2b:4c5b with SMTP id
 j136-20020a25238e000000b00da12a2b4c5bmr9488785ybj.41.1698740222839; Tue, 31
 Oct 2023 01:17:02 -0700 (PDT)
MIME-Version: 1.0
References: <20231006131450.2436688-1-dmitry.baryshkov@linaro.org>
 <20231006131450.2436688-7-dmitry.baryshkov@linaro.org>
 <8785c8bd-1f07-b94f-d002-a3228b791a8a@quicinc.com>
In-Reply-To: <8785c8bd-1f07-b94f-d002-a3228b791a8a@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 31 Oct 2023 10:16:51 +0200
Message-ID: <CAA8EJppLGU1ZUCNxkb5TxzMyHGB1CsqhLSxrhrN0L9JDPRQnQg@mail.gmail.com>
Subject: Re: [PATCH v6 06/10] drm/msm/dpu: deduplicate some (most) of SSPP
 sub-blocks
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

On Mon, 30 Oct 2023 at 21:52, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 10/6/2023 6:14 AM, Dmitry Baryshkov wrote:
> > As we have dropped the variadic parts of SSPP sub-blocks declarations,
> > deduplicate them now, reducing memory cruft.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   .../msm/disp/dpu1/catalog/dpu_3_0_msm8998.h   | 16 +--
> >   .../msm/disp/dpu1/catalog/dpu_4_0_sdm845.h    | 16 +--
> >   .../msm/disp/dpu1/catalog/dpu_5_0_sm8150.h    | 16 +--
> >   .../msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h   | 16 +--
> >   .../msm/disp/dpu1/catalog/dpu_5_4_sm6125.h    |  6 +-
> >   .../msm/disp/dpu1/catalog/dpu_6_0_sm8250.h    | 16 +--
> >   .../msm/disp/dpu1/catalog/dpu_6_2_sc7180.h    |  8 +-
> >   .../msm/disp/dpu1/catalog/dpu_6_3_sm6115.h    |  4 +-
> >   .../msm/disp/dpu1/catalog/dpu_6_4_sm6350.h    |  8 +-
> >   .../msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h   |  4 +-
> >   .../msm/disp/dpu1/catalog/dpu_6_9_sm6375.h    |  4 +-
> >   .../msm/disp/dpu1/catalog/dpu_7_0_sm8350.h    | 16 +--
> >   .../msm/disp/dpu1/catalog/dpu_7_2_sc7280.h    |  8 +-
> >   .../msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h  | 16 +--
> >   .../msm/disp/dpu1/catalog/dpu_8_1_sm8450.h    | 16 +--
> >   .../msm/disp/dpu1/catalog/dpu_9_0_sm8550.h    | 20 ++--
> >   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 97 +++++--------------
> >   17 files changed, 120 insertions(+), 167 deletions(-)
> >
>
> <snip>
>
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> > index e60427f54b27..860feb9c54e6 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> > @@ -77,7 +77,7 @@ static const struct dpu_sspp_cfg sm8550_sspp[] = {
> >               .name = "sspp_0", .id = SSPP_VIG0,
> >               .base = 0x4000, .len = 0x344,
> >               .features = VIG_SC7180_MASK,
> > -             .sblk = &sm8550_vig_sblk_0,
> > +             .sblk = &dpu_vig_sblk_qseed3_3_2,
>
> Some of this naming doesnt sound right to me. What I had suggested was
> just dpu_vig_sblk_scaler_x_y but what is used is dpu_vig_sblk_qseedx_x_y
>
> This is not correct because technically sm8550 was qseed4 as its scaler
> version is > 0x3000
>
> So this adds some discrepancy in the naming.

And as I wrote, scaler is also not correct. We know qseed2 and rgb
scalers, which use different versioning (if they have versions at
all). I used qseed3, as it is the base version of the qseed3 / 3lite /
4 scalers. Of course we can switch back to 3/3lite/4, but I thought
that it was not that related to the hardware.

-- 
With best wishes
Dmitry
