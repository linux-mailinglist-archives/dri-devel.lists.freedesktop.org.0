Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F400955BAD1
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jun 2022 17:39:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8714010E478;
	Mon, 27 Jun 2022 15:39:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com
 [IPv6:2607:f8b0:4864:20::f2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FE8510E478
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jun 2022 15:39:11 +0000 (UTC)
Received: by mail-qv1-xf2b.google.com with SMTP id 59so15282998qvb.3
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jun 2022 08:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tGHpc9v4ZCMNdJ9NQhZJ5H1k92hYzQTSlPYYZud8X1I=;
 b=xQWAPBTTIhVQhksDJ8SQhq5YkJ3JB9vPfTqgFFG4CUdhMwxCpNu4R1/LfEULM/n21+
 zkKghcQb6PoQa4YcXy79yo1wMwSc0r2BidbBAbJ1NwK9fG2czyhRIkU9+Adq2+SSBHyd
 uX2Vg/8xEDsJ5t9PVo6VJuEAVcgLkMxoI3uY1OiVlPjJCHquDTKk+iRxYrSWqv1nuQBP
 9S0qCMpuT224v6otYJUuTPaBDSZtAZy/4ZT/OdbyiusYywVLClseH5V8HKF2Imzm0tsg
 0DQdBJcoq5mgBAbioB2WOcG8YtYYKQLElCxgZ0ed2N+UFCRXmmYZaBRhv3ZSZQa4WPmo
 6EaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tGHpc9v4ZCMNdJ9NQhZJ5H1k92hYzQTSlPYYZud8X1I=;
 b=SoERA4KB/TxFD3rhPfYUFqbjSJ1Jm4p8+5+WSJKFAb5KrFQbE8xF9zAqHSVnR0RiD7
 FvvCyPC1jh0dyjZQWLhainV62w95Gm8fYf4OZxrHbfKRlysvmet0XXoVx7Mk20/JiovO
 Zsc/q6WW2QxWZyPTT1rYXygQOpB1QRT6Mp9yX/P/Nci7J4pD3hiwFQ58zRyJTbGY+g1x
 sFjCZJS2Va5Dv6jhTyPTDtZRdWmz2KFy5ipU735JT7RVDZrW8kdFMdqNSmlIxfUXb67V
 R/z1i680mRrXQt9asIJW7ONTCi77aruKHmi6C2/Cez13nztehU058tLTV+gq/HVezL2/
 SsVQ==
X-Gm-Message-State: AJIora/Y+FIb7TtpKZDmMR4vgxfWCoEBdICHbpXYTHaKKMp/o5spU3we
 kT3eHUdPOZifKHx2875nTP4vq4JgU8zHSMfeniWXpw==
X-Google-Smtp-Source: AGRyM1uU6Dx/UDeMD3519ioenI9SxoOtfqH7zR2iki7/D0bO2iset7jb3RERavSGfQgMto8/UpwFn/xIj0aB0434K00=
X-Received: by 2002:ac8:5c96:0:b0:31a:c19a:7da1 with SMTP id
 r22-20020ac85c96000000b0031ac19a7da1mr3219570qta.62.1656344350582; Mon, 27
 Jun 2022 08:39:10 -0700 (PDT)
MIME-Version: 1.0
References: <1656090912-18074-1-git-send-email-quic_khsieh@quicinc.com>
 <66ff4642-f268-f5b0-7e28-b196368c508a@quicinc.com>
 <5cf094cf-343a-82d7-91c4-1284683f9748@quicinc.com>
 <CAA8EJprqq=vxXT2DmEWii_Ajx2UbkHRexPTT58xFcWkBa_D5hA@mail.gmail.com>
 <26263c16-8cbc-ccca-6081-7eba14635d73@quicinc.com>
 <CAA8EJpqEoXXA=eKGHRGuQ3VOHnmEShY8u_SMZ6WFWORCFhFcrw@mail.gmail.com>
 <8445f93a-00f0-64af-5650-07f2bc487742@quicinc.com>
 <CAA8EJpqB2KPyvFehK9WRGgiVnqvD24cz5BcHsw8a5PQ2Vs1oKA@mail.gmail.com>
 <CAA8EJppZdyutyNBG+OFinickQoDxg0i4GwbaNQubo_LSRWNh4w@mail.gmail.com>
 <1a2e7574-8f78-d48e-a189-020ffcd39f60@quicinc.com>
 <CAE-0n52L1fvvpEH56+HD_UXuV61tMvhh8Qjp781bW9tTKRQymw@mail.gmail.com>
 <9b197183-5306-bf19-0195-2dc1bb72c33b@quicinc.com>
In-Reply-To: <9b197183-5306-bf19-0195-2dc1bb72c33b@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 27 Jun 2022 18:38:58 +0300
Message-ID: <CAA8EJppnELtjmOp+Yp7rbrrjf9UixBb82Uvfyg9ofcq+EqaOnw@mail.gmail.com>
Subject: Re: [PATCH v1 2/3] drm/msm/dp: decoupling dp->id out of dp
 controller_id at scxxxx_dp_cfg table
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
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
Cc: vkoul@kernel.org, quic_sbillaka@quicinc.com, dianders@chromium.org,
 airlied@linux.ie, freedreno@lists.freedesktop.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 bjorn.andersson@linaro.org, agross@kernel.org, linux-arm-msm@vger.kernel.org,
 quic_aravindh@quicinc.com, Stephen Boyd <swboyd@chromium.org>, sean@poorly.run,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 27 Jun 2022 at 18:33, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
>
> On 6/24/2022 6:15 PM, Stephen Boyd wrote:
> > Quoting Kuogee Hsieh (2022-06-24 18:02:50)
> >> On 6/24/2022 5:46 PM, Dmitry Baryshkov wrote:
> >>> On Sat, 25 Jun 2022 at 03:28, Dmitry Baryshkov
> >>> <dmitry.baryshkov@linaro.org> wrote:
> >>>> On Sat, 25 Jun 2022 at 03:23, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
> >>>>> On 6/24/2022 5:21 PM, Dmitry Baryshkov wrote:
> >>>>>> On Sat, 25 Jun 2022 at 03:19, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
> >>>>>>> How can I have eDP call dpu_encoder_init() before DP calls with
> >>>>>>> _dpu_kms_initialize_displayport()?
> >>>>>> Why do you want to do it? They are two different encoders.
> >>>>> eDP is primary display which in normal case should be bring up first if
> >>>>> DP is also presented.
> >>>> I do not like the concept of primary display. It is the user, who must
> >>>> decide which display is primary to him. I have seen people using just
> >>>> external monitors and ignoring built-in eDP completely.from
> >>>> Also, why does the bring up order matters here? What do you gain by
> >>>> bringing up eDP before the DP?
> >>> I should probably rephrase my question to be more clear. How does
> >>> changing the order of DP vs eDP bringup help you 'to fix screen
> >>> corruption'.
> >> it did fix the primary display correction issue if edp go first and i do
> >> not know the root cause yet.
> >>
> >> We are still investigating it.
> >>
> >> However I do think currently msm_dp_config sc7280_dp_cfg has issues need
> >> be addressed.
> >>
> > What issues exist with sc7280_dp_cfg? It looks correct to me.
>
>
> If we are going to bring up a new chipset with edp as primary only, i am
> not sure the below configuration will work?
>
> > static const struct msm_dp_config sc7280_dp_cfg = {
> >          .descs = (const struct msm_dp_desc[]) {
> >                  [MSM_DP_CONTROLLER_1] = { .io_start = 0x0aea0000, .connector_type = DRM_MODE_CONNECTOR_eDP, .wide_bus_en = true },
> >          },
> >          .num_descs = 1,
> > };

As I wrote in one of the comments, there is an issue with num_descs
being not obvious (in your example it should be 2, not 1). I thought
about dropping it and looping until the MSM_DP_CONTROLLER_COUNT, but
this would result in other kinds of hard-to-catch issues. Let me muse
about it.

-- 
With best wishes
Dmitry
