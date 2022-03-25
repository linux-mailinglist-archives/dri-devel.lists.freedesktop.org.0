Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EEC524E783F
	for <lists+dri-devel@lfdr.de>; Fri, 25 Mar 2022 16:44:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C789310E933;
	Fri, 25 Mar 2022 15:44:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4995210E8E4
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Mar 2022 15:44:07 +0000 (UTC)
Received: by mail-oi1-x22e.google.com with SMTP id e189so8543251oia.8
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Mar 2022 08:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=NTzdvac9E0u5O5EPdTfHeL5fU+o6Dn+5DnAx+2wLf6o=;
 b=g+lsR8A0mCNGF0M7c8zVcfz9bk7XjWwfiPgATYcttSfsfYKhPqNI90t5V2pWyy3K/1
 zAiD6PcZ12g+jb0DsJg0Yhamr+ZkPZRB3Ez1pjct4VJUeGobr3ShTQNlbb3YFYps5UdP
 YOiYo/iYBVpj1inq4H0Yqn1/nC7z8g//qULAg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=NTzdvac9E0u5O5EPdTfHeL5fU+o6Dn+5DnAx+2wLf6o=;
 b=3Pbku4I1LnK0+TDGYDpe8KivwPJFHEKXKu3WfeWOBFOA5LPDekryWCbr7hYBagF7jj
 uzcLbUuAivihg7jILdwifZGIdmUd/XHK+xXaaWOwg20KPopA5P+Lp26EPRhbSjwRw2pr
 1LNEy/69q0AJQzBA92wTxxGktuCiSnVSaDORcfqWQMNChBTVORqNgU0ipoR/ILTPz4u4
 mSsvVe9vm12cLFDtThjQO4YB0yI2d7I0WNb3VoKwsMii7h6BLocV60l9O+v9+4wekHeY
 QqVZ/BWfcn2BLw0aKf1NdA3C+ScpQJYlA+jTdvUosGiC0MSBRfPKXbMsEBFNRqmuqmp8
 R6zA==
X-Gm-Message-State: AOAM532IdHjlVSLllOpEA9oHa0HQz9et8ULTXz3crdd40R9ueRrraC+b
 OE13DhL5leNqAk+30u5f0A8j6Uci7gCnJ+nuzhZsxw==
X-Google-Smtp-Source: ABdhPJzl30pBr3/fWa4oAQpF/qcn7kXpetXINFM32PJnH9fEu6pMQU5faHK/sBE2DSjy0V8/NLr5FZhyK+g1+pShkp4=
X-Received: by 2002:aca:a9c8:0:b0:2da:45b6:b796 with SMTP id
 s191-20020acaa9c8000000b002da45b6b796mr5189697oie.193.1648223046578; Fri, 25
 Mar 2022 08:44:06 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 25 Mar 2022 10:44:06 -0500
MIME-Version: 1.0
In-Reply-To: <20220325121736.2162912-7-dmitry.baryshkov@linaro.org>
References: <20220325121736.2162912-1-dmitry.baryshkov@linaro.org>
 <20220325121736.2162912-7-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Fri, 25 Mar 2022 10:44:06 -0500
Message-ID: <CAE-0n514UcsaTkv=P7KvvQYo_ohDsAAozjnjbQKeFY-z4EQVXQ@mail.gmail.com>
Subject: Re: [PATCH v4 6/6] drm/msm: make mdp5/dpu devices master components
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2022-03-25 05:17:36)
> The msm_mdss serves several roles at this moment. It provides IRQ domain
> used by MDP5 and DPU drivers but it also serves as a component master
> for both those usecases. MDP4 (which does not have separate MDSS device)
> is the component master on it's own.
> Remove this assymmetry and make both MDP5 and DPU component masters too.
> This removes a need to care about drm/components from msm_mdss driver,
> removes an mdss pointer from struct msm_drm_private and simplifies the
> interface between mdp5/dpu and msm_drv.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
