Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B061D54FE8F
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jun 2022 22:55:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FDD910E426;
	Fri, 17 Jun 2022 20:55:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [IPv6:2607:f8b0:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3112210E4A2
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 20:55:02 +0000 (UTC)
Received: by mail-ot1-x331.google.com with SMTP id
 111-20020a9d0378000000b0060c2db66d44so3932267otv.6
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 13:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=liQN5qtUNa2mM5mknDTOFWHHb8rU09mHks8H0tyK+vE=;
 b=J/KAuPGEsivDv33XuIq2xTcMGgDRqhWxAoD+Tzk+nDWGl9jDGTOWTx0nunPwD4byDk
 FaeETdidas6GwYYNf1qBFXlMcUPvUXBOHATyBbGzeOHRWh76uVa1SqUK1Kll7jRZIw75
 m1oOrl/2PfMWsQC460Gdx9AksE90kx/JDqn1U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=liQN5qtUNa2mM5mknDTOFWHHb8rU09mHks8H0tyK+vE=;
 b=2KnNCRSDBCMw+VHln+soAJ1rtU/nZCRMsuCilLgjlHRK6NU8WcUx8GD3l9mGw466Do
 PfRlhyRbPY12UbCUZwqmlegY5e02NNDqltrz6xzvS+U25ZcXsvieouaLkqyACvuLtu4g
 4DLU7/IYti6X65kA6k1qni3iJ8wCRWIwYmZIVia0+X9TM8nPsQiSQB5Pyvz7egpWielt
 NCfRTt3WsdH18ThQY9VPZrkYmkt379deBvaonj3+lbOyyCI3Cr7Bns0zyuyOalfKQhZH
 DD/FWRdo3KndsfE4rQE3xLubAtPI1ufhlYy9QkluAGTxiwroTNEPBiUGexvHOxsekL2m
 Iw0Q==
X-Gm-Message-State: AJIora9Yh9cQgGuDclYSgd4Xl+3m27IgY+fis5LkycYBGHeJeBDXdO9x
 zNVTWNpYqsw9SxyObUnkR+9B04aw5/Ima9Mh+ykXaA==
X-Google-Smtp-Source: AGRyM1vP9nApPqYwQndj8FDnlRLdyc8637CAsZQ8w99xEFsa/MBvPzT9PmZCzFl4LEkTZBvNBWJiuG/QFQco0VTetAk=
X-Received: by 2002:a9d:729b:0:b0:60c:21bd:97c0 with SMTP id
 t27-20020a9d729b000000b0060c21bd97c0mr4957121otj.77.1655499301490; Fri, 17
 Jun 2022 13:55:01 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 17 Jun 2022 13:55:01 -0700
MIME-Version: 1.0
In-Reply-To: <20220616085057.432353-1-dmitry.baryshkov@linaro.org>
References: <20220616085057.432353-1-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Fri, 17 Jun 2022 13:55:01 -0700
Message-ID: <CAE-0n50Mrq=iwoEx60uyv7CKXWYJkjMZPgYtNnmfpKka_y3y5w@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/hdmi: support attaching the "next" bridge
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, 
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
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2022-06-16 01:50:57)
> There might be a chain of bridges attached to the HDMI node
> (including but not limited to the display-connector bridge). Add support
> for attaching them right to the HDMI bridge chain.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
