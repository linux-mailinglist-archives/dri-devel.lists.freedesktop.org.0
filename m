Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 44D7C55A5B7
	for <lists+dri-devel@lfdr.de>; Sat, 25 Jun 2022 03:15:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94F6B10E706;
	Sat, 25 Jun 2022 01:15:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x31.google.com (mail-oa1-x31.google.com
 [IPv6:2001:4860:4864:20::31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3F3510E706
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Jun 2022 01:15:20 +0000 (UTC)
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-101e1a33fe3so5949176fac.11
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jun 2022 18:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=EHOMV/tMxEFeh2Jng8BcJ4ThhtxwYK4Dk9aplz67guk=;
 b=dGn3J5hQVt31ATY+uLJZzcCFaJ2JarOQfjsSRAoyAOLFZ/LZ6aRroA1lMOzHRyV1ki
 5QBWVFvxporoAtTgNCi1cvCtAv8z6W0TjsGa4P3ZhTS3w9IbIPsHxqOrTcoJyQvTCtmT
 KMlEKexTypASbOy9WZvAz+s2jPY5gfTr5oDQk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=EHOMV/tMxEFeh2Jng8BcJ4ThhtxwYK4Dk9aplz67guk=;
 b=W9Ml0t93NjY+p1QoUNrm7Ca1zurri9gaLZOA6VgdXgY0iVsndgOoekwCEM5hRvdMk/
 Hbu1n0Q81pCYRfdFYsVkWamNzSnlxsZM1NVf01Dpp4TgDXxjZvi6EESx/9LWW7+bSKDK
 h1W9HDXkvka2FjtSMETX6ZCficFD8o1n9EdnD98LvCtz80Vj9bJ9fII4VsNCVC8e0CuM
 1GsJ9LvgybE5df/K/F2dWA4NrY9XvGP8pxx8pCAM7uUWK8qJEzHBLKV32aLBF1OsD+x0
 sHUjqeWbsVl7tp9s46MhON00VwgbER34v8BN5CKwTKxel/pHA6VVwk0cxGR9Xl/O3I9p
 gSnQ==
X-Gm-Message-State: AJIora8+8J6Bh8MouivpwhndQAvaHTxbwD+69mH0DojkCjE8JxQHSGRu
 MdWhJfU8wzITzH03nB9YP9/PPnRD3V01VuWu+NwFIw==
X-Google-Smtp-Source: AGRyM1sqn6raMG8ZnZmf/2BHjOiUNC2au51zyE6rJgQNmVhLHQ9NGqlBsSYe0+jwNvxHxItIz1kyFnssvhq/pbyt8OU=
X-Received: by 2002:a05:6870:b627:b0:102:f25:a460 with SMTP id
 cm39-20020a056870b62700b001020f25a460mr1138464oab.193.1656119719962; Fri, 24
 Jun 2022 18:15:19 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 24 Jun 2022 18:15:19 -0700
MIME-Version: 1.0
In-Reply-To: <1a2e7574-8f78-d48e-a189-020ffcd39f60@quicinc.com>
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
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Fri, 24 Jun 2022 18:15:19 -0700
Message-ID: <CAE-0n52L1fvvpEH56+HD_UXuV61tMvhh8Qjp781bW9tTKRQymw@mail.gmail.com>
Subject: Re: [PATCH v1 2/3] drm/msm/dp: decoupling dp->id out of dp
 controller_id at scxxxx_dp_cfg table
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>
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
Cc: vkoul@kernel.org, quic_sbillaka@quicinc.com, airlied@linux.ie,
 freedreno@lists.freedesktop.org, dianders@chromium.org,
 dri-devel@lists.freedesktop.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 agross@kernel.org, linux-arm-msm@vger.kernel.org, quic_aravindh@quicinc.com,
 bjorn.andersson@linaro.org, sean@poorly.run, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2022-06-24 18:02:50)
>
> On 6/24/2022 5:46 PM, Dmitry Baryshkov wrote:
> > On Sat, 25 Jun 2022 at 03:28, Dmitry Baryshkov
> > <dmitry.baryshkov@linaro.org> wrote:
> >> On Sat, 25 Jun 2022 at 03:23, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
> >>> On 6/24/2022 5:21 PM, Dmitry Baryshkov wrote:
> >>>> On Sat, 25 Jun 2022 at 03:19, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
> >>>>> How can I have eDP call dpu_encoder_init() before DP calls with
> >>>>> _dpu_kms_initialize_displayport()?
> >>>> Why do you want to do it? They are two different encoders.
> >>> eDP is primary display which in normal case should be bring up first if
> >>> DP is also presented.
> >> I do not like the concept of primary display. It is the user, who must
> >> decide which display is primary to him. I have seen people using just
> >> external monitors and ignoring built-in eDP completely.from
>
> >> Also, why does the bring up order matters here? What do you gain by
> >> bringing up eDP before the DP?
> > I should probably rephrase my question to be more clear. How does
> > changing the order of DP vs eDP bringup help you 'to fix screen
> > corruption'.
>
> it did fix the primary display correction issue if edp go first and i do
> not know the root cause yet.
>
> We are still investigating it.
>
> However I do think currently msm_dp_config sc7280_dp_cfg has issues need
> be addressed.
>

What issues exist with sc7280_dp_cfg? It looks correct to me.
