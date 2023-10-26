Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D1F77D89FC
	for <lists+dri-devel@lfdr.de>; Thu, 26 Oct 2023 23:03:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E43810E8AC;
	Thu, 26 Oct 2023 21:03:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com
 [IPv6:2607:f8b0:4864:20::112a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 791A010E8AF
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Oct 2023 21:03:38 +0000 (UTC)
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-5a87ac9d245so10707347b3.3
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Oct 2023 14:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698354217; x=1698959017; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Zs0BNJRXsqWeQVO5EP1NdVB6zhate3LzWauL+0ezX08=;
 b=mxgBAvERvpYe+e1nOirxXz/36VV0AbBBMU1IdbyfoYqP/YUb3NXxhgWTcCQ/UaGCLQ
 Zo6uYQfugxti+e03BjZq0lu78BJee6OAGfn/52i6IeJ0KjnoqJny/6hn9CRzraWSd/uY
 mSg+bDg5MRAE/kq4R7nd8QuhNtTIS4I3bAo1VtVpr5wV9C4Pp+4IJqIthJap0vHNcrTr
 q62b4/m9K1gMhXG72lKdn3mZUHsiVhGBUmjbgt7KgZLd/w1kDuWnJxZfiE+j9V5iXb1n
 WBtn2MitaHlWodKawq+6rkVp8LZJ8bqnFA1zWkLs6QkAUvhqzVWwHAT/8q007eKYn+jF
 bEEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698354217; x=1698959017;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Zs0BNJRXsqWeQVO5EP1NdVB6zhate3LzWauL+0ezX08=;
 b=nLBbYcpm1vHiP++ffFaHabfayEZoTGNyjP5edd4kmG+VfapZYrF87c1H+1UQAzTCTL
 TiZJs2qtSVICIqiwqBb6uyJvl/n6f191YnxTL0uCadRDjeUThS5SuwG0nyy3APeL6l71
 voxL/bho0OPzgTY1X93jRlskynr18x/FsxXIS31C11MJTOMxh3NlNnrK3Oypy8Zm3Q+F
 MHfJdSpOE4lehgBXitgiNfeVS6kZig+fdFJhmkJwjEOn9EoWxDfFQ2LhqBaU0LEXRF1t
 jTZLLf85CRRk1Ym+FCubpnZGS4GuGi02r9vFzl3hgW2hQcr6hakH1MofvJ9+X9dSLbxO
 fJBA==
X-Gm-Message-State: AOJu0Yxd3zjFkhE9oKHBcEVkF5wWvtdLx35Z3dS0Uz3aKE8TNvL/Yres
 2XXPMNd44TH6Lgi4TJcJhQu9uhL3CCnZbO1ilS2dHw==
X-Google-Smtp-Source: AGHT+IGIsaJR47ax6gzi+WxPKaKzmFJWDCzTOh00EWTxuEonpZFhqFrNTeIAYKVTU0ES42JDfdCmgRnw1PCX7ZDNeZ8=
X-Received: by 2002:a81:d209:0:b0:5ad:47ba:fa43 with SMTP id
 x9-20020a81d209000000b005ad47bafa43mr666424ywi.35.1698354217574; Thu, 26 Oct
 2023 14:03:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230928111630.1217419-1-dmitry.baryshkov@linaro.org>
 <20230928111630.1217419-16-dmitry.baryshkov@linaro.org>
 <b779b911-dff3-420c-9bf9-5b7bef24337c@linaro.org>
In-Reply-To: <b779b911-dff3-420c-9bf9-5b7bef24337c@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 27 Oct 2023 00:03:26 +0300
Message-ID: <CAA8EJppFi6jJ=PKCdwBqM8hXdgp41XTY=QZkdiHkPPJ9KdTfTA@mail.gmail.com>
Subject: Re: [PATCH v3 15/15] drm/msm/hdmi: drop old HDMI PHY code
To: Konrad Dybcio <konrad.dybcio@linaro.org>
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
Cc: Kishon Vijay Abraham I <kishon@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 27 Oct 2023 at 00:00, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
>
>
> On 9/28/23 13:16, Dmitry Baryshkov wrote:
> > Drop source files used by old HDMI PHY and HDMI PLL drivers.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/hdmi/hdmi_phy.c      | 216 -------
> >   drivers/gpu/drm/msm/hdmi/hdmi_phy_8960.c |  51 --
> >   drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c | 765 -----------------------
> >   drivers/gpu/drm/msm/hdmi/hdmi_phy_8x60.c | 141 -----
> >   drivers/gpu/drm/msm/hdmi/hdmi_phy_8x74.c |  44 --
> >   drivers/gpu/drm/msm/hdmi/hdmi_pll_8960.c | 458 --------------
> >   6 files changed, 1675 deletions(-)
> >   delete mode 100644 drivers/gpu/drm/msm/hdmi/hdmi_phy.c
> >   delete mode 100644 drivers/gpu/drm/msm/hdmi/hdmi_phy_8960.c
> >   delete mode 100644 drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c
> Uh-oh, is the 8996 HDMI phy accounted for somwhere else?

Yes, it is the QMP PHY now.


-- 
With best wishes
Dmitry
