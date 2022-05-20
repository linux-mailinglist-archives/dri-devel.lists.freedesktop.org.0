Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A60652EFEF
	for <lists+dri-devel@lfdr.de>; Fri, 20 May 2022 18:03:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96CEA10E700;
	Fri, 20 May 2022 16:03:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com
 [IPv6:2607:f8b0:4864:20::72f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8D0410E723
 for <dri-devel@lists.freedesktop.org>; Fri, 20 May 2022 16:03:10 +0000 (UTC)
Received: by mail-qk1-x72f.google.com with SMTP id bs17so7260667qkb.0
 for <dri-devel@lists.freedesktop.org>; Fri, 20 May 2022 09:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Rl6lj9qx0jl8NDnbz3wyyCTgYol3jXu1zxcrwsJAVY0=;
 b=hEocKPTB0k/SuvhhyFT5SNEVGtwTVR9duxGaCyxkEPY5PB/c8W8gWNKQ7wBHvRQDTN
 v9JzO9ixObe7EqTnDEf+inUVqwi6/umiSrQFKktXHWrFUYsML5SMrrO8CRU51wbuky3i
 Wl+xXCZOIJ3zhbLnT8eJCt4tUv+9hDCNqaXW/v79Pfq2q6zMeOCAuRCwBBK6qpk8D5Nd
 +YGCkUJyHdekQg4X91lKQuCIjd/kPPyhS5Uv76TlZrckHPyN51WKd42D6fHaO5E2v4pk
 r5vGMgpedKX1tbFxC2h0WBTKV2GYdZ9xdxdoV5NUIjV14YE66alofZdAacWqFHmzdGDW
 czSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Rl6lj9qx0jl8NDnbz3wyyCTgYol3jXu1zxcrwsJAVY0=;
 b=HzeorzZg8e8SDF8kCdj2qoKAZVZlgdbCL3QIeT16+uclRpEJlN22MflIk2RlJQ+u56
 71D4w6S2SvjcFsbd9JyxymuY2WIqHl9/ErfE+TD2nVaUH5fsyivQacvBY78fZMhPbryn
 ++OezoUfTRw/X3MhGNyVSsLlQAp68d+RqqsgB9EMJFdjOyu+BKVvTRnlMgPfJ8AnJhsk
 yWbFK28bmKb72fPMy5Pt7596qPXME8pEza5nKovXcce+7tdPoCsQvqUo0tvhX+CeShVp
 YwsG3zomg0S11CrqiReiMDahYHMRxdRCQzGrje7f+vFt78Ue635KT1ZVPfjiPdn3KPpt
 3zHw==
X-Gm-Message-State: AOAM533396nad+PykzaoA8Mzo48brUh5qbVQOs+Fl41L1ECgG64V7aNr
 NVPPzDT9m1Z9UtmeepKmnwDsJjyuEXyp/GOLE0x1bw==
X-Google-Smtp-Source: ABdhPJyZI37QRWTmfOC38IDzqhvOTFVeCbuF71qmUeFydjmoyAbLvyiloaSslSvLRc7a3lrInN3ClO7mlUtVPua/8TU=
X-Received: by 2002:a05:620a:4311:b0:67e:8a0f:4cd5 with SMTP id
 u17-20020a05620a431100b0067e8a0f4cd5mr6809701qko.363.1653062589769; Fri, 20
 May 2022 09:03:09 -0700 (PDT)
MIME-Version: 1.0
References: <1653001902-26910-1-git-send-email-quic_khsieh@quicinc.com>
 <1653001902-26910-2-git-send-email-quic_khsieh@quicinc.com>
 <CAE-0n52yT6S4TLpc2e2-kkbMB2Fu2PcZskG-ZFLo7y1YVTyazQ@mail.gmail.com>
 <609bb4fc-1503-81ef-6fd8-dbb862c4ef80@quicinc.com>
In-Reply-To: <609bb4fc-1503-81ef-6fd8-dbb862c4ef80@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 20 May 2022 19:02:58 +0300
Message-ID: <CAA8EJpqaGqHrdtX6NUHs2YOgeievpkbm8JbwQOU8+KoW4YNf2g@mail.gmail.com>
Subject: Re: [PATCH v6 1/3] phy: qcom-edp: add regulator_set_load to edp phy
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
Cc: vkoul@kernel.org, quic_sbillaka@quicinc.com, quic_abhinavk@quicinc.com,
 airlied@linux.ie, freedreno@lists.freedesktop.org, dianders@chromium.org,
 dri-devel@lists.freedesktop.org, bjorn.andersson@linaro.org, agross@kernel.org,
 linux-arm-msm@vger.kernel.org, quic_aravindh@quicinc.com,
 Stephen Boyd <swboyd@chromium.org>, sean@poorly.run,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 20 May 2022 at 18:09, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
>
> On 5/19/2022 5:19 PM, Stephen Boyd wrote:
> > Quoting Kuogee Hsieh (2022-05-19 16:11:40)
> >> diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
> >> index cacd32f..78b7306 100644
> >> --- a/drivers/phy/qualcomm/phy-qcom-edp.c
> >> +++ b/drivers/phy/qualcomm/phy-qcom-edp.c
> >> @@ -87,14 +87,19 @@ struct qcom_edp {
> >>
> >>          struct clk_bulk_data clks[2];
> >>          struct regulator_bulk_data supplies[2];
> >> +       int enable_load[2];
> >>   };
> >>
> >>   static int qcom_edp_phy_init(struct phy *phy)
> >>   {
> >>          struct qcom_edp *edp = phy_get_drvdata(phy);
> >>          int ret;
> >> +       int i;
> >>
> >> -       ret = regulator_bulk_enable(ARRAY_SIZE(edp->supplies), edp->supplies);
> >> +       for (i = 0; i < 2; i++)
> > Use ARRAY_SIZE(edp->supplies)?
> >
> >> +               regulator_set_load(edp->supplies[i].consumer, edp->enable_load[i]);
> >> +
> >> +       ret = regulator_bulk_enable(2, edp->supplies);
> > Why is ARRAY_SIZE() usage removed?
>
>
> remove it base on Dmitry's comment.

Ugh. I asked to remove the num_consumers variable, not the ARRAY_SIZE.

>
> I will restore it back to use ARRY_SIZE
>
>
> >
> >>          if (ret)
> >>                  return ret;
> >>



-- 
With best wishes
Dmitry
