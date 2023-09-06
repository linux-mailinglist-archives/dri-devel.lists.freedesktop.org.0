Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 573AB7945ED
	for <lists+dri-devel@lfdr.de>; Thu,  7 Sep 2023 00:04:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 214F810E72C;
	Wed,  6 Sep 2023 22:04:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C236410E72C
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Sep 2023 22:04:35 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-5009d4a4897so454462e87.0
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Sep 2023 15:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1694037874; x=1694642674;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc:subject:date:message-id
 :reply-to; bh=s4j0fXDx0veW0oHGlyRxz1wFWfTQnf1+IJzl7yxdqZI=;
 b=aeV0TsomNK46cUFzjt+a2WUYZkAEYcDCBA8fRu+7Y1ikSIMBOmsHxAUj1JwZx6RQhZ
 kHndrc3yVV8CBffnf29ByvXOo6JyFlwYQ3gptoOQoIYiuhNnbIkiweLkLFz3FdPPRDoP
 iCCqEthsGXSFuEOnV9K+SJLy3Akt2fv6Gixes=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1694037874; x=1694642674;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=s4j0fXDx0veW0oHGlyRxz1wFWfTQnf1+IJzl7yxdqZI=;
 b=ISaB3vHF2bSfWQDA2+RSLwtCY52r3nVkyQrLyDmz2azQbPLCOpVqhAvQQgnALe/MRU
 iQ/GC1XGLaJ0YvmoE/Uxy6AAZe0fet2kV80EKpSG+C9/AeGDz+hL4SOOdzKFho4RuurM
 D6uenbAWFI3Aii1n4TDShazBEbo3dlsc9NnHKUn21XHq3RQSafI3dyKW/tmd7py8bLpB
 PY4JxkvWMHn8LFd1oJa9HLHMONKsK2tdRFFZ+LRCYsQwEN//qEocKwnn7nqaL178REnH
 72K+7lh3R8L+fLi/siaGLfIm6GOVmnSVBNVJraWVEFqk5etuxGrFx6LMKaBPgVtHRfy2
 TfTg==
X-Gm-Message-State: AOJu0Yw71sbvfXrK5OkiPmougiloIb5vTN2ddeOLG4i/Jr2faSzsG6af
 TXmj9G+fuR/rEJS8BSXa1lhKZ0zSzJinWIUfQhT7sQ==
X-Google-Smtp-Source: AGHT+IHogaYquQ/PSAv/DYcZmNikDOVlv8huAQHfNnOBb8UD02P+ah517cBedi3ixoKQSI3JIRzAa2e4TiStFXwOIxA=
X-Received: by 2002:ac2:5f8b:0:b0:500:ac10:1641 with SMTP id
 r11-20020ac25f8b000000b00500ac101641mr2914398lfe.46.1694037873986; Wed, 06
 Sep 2023 15:04:33 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 6 Sep 2023 17:04:33 -0500
MIME-Version: 1.0
In-Reply-To: <20230904020454.2945667-8-dmitry.baryshkov@linaro.org>
References: <20230904020454.2945667-1-dmitry.baryshkov@linaro.org>
 <20230904020454.2945667-8-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Wed, 6 Sep 2023 17:04:33 -0500
Message-ID: <CAE-0n51WNOZashWbEYQ0hUu1SnrS2m1-Y2Aq1S0mfkzm2p8uig@mail.gmail.com>
Subject: Re: [PATCH v3 7/8] drm/msm/dpu: drop useless check from
 dpu_encoder_phys_cmd_te_rd_ptr_irq()
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, Rob Clark <robdclark@gmail.com>,
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
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2023-09-03 19:04:53)
> The dpu_encoder_phys_cmd_te_rd_ptr_irq() function uses neither hw_intf
> nor hw_pp data, so we can drop the corresponding check.
>
> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
