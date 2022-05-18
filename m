Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 568A852C4CC
	for <lists+dri-devel@lfdr.de>; Wed, 18 May 2022 22:57:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D29110F3D5;
	Wed, 18 May 2022 20:57:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E700710F3C3
 for <dri-devel@lists.freedesktop.org>; Wed, 18 May 2022 20:57:19 +0000 (UTC)
Received: by mail-oi1-x22b.google.com with SMTP id q8so4130383oif.13
 for <dri-devel@lists.freedesktop.org>; Wed, 18 May 2022 13:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=6+Q6Ia54N+h/zYeULcAq/1r7inK8vu27VxH+3POr9pM=;
 b=FCfIeQDz7BEFc2r1x1Z4vqS879fyQaltiuhbDf7kyIEd01e9EjWvx8V2uS0KxqL2cg
 5/ooo7xWRr1jJIr5XJpmK+kAO0lupumix2aX+yD4rTulnRzInTvkOc4yJBq5JIoeAPDA
 O0GRoo1gzcQSR3ssnr/qC1+mGHSgg0b45C9bM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=6+Q6Ia54N+h/zYeULcAq/1r7inK8vu27VxH+3POr9pM=;
 b=PJw9Km9gXWIIfWI4vR5eI3mVDh8ML0VkAaugBqVx8ypYVilUiZrMUR/Z1UX0oTg4bC
 Ik1LW6TuAOTY3pZDW1fyOJcMJn49Hoj4jtKd4gXEWvY2+534pGYjjwjysk2wkWe20Cyu
 UVU06xR8nH85YzXNpuAH96Hf/YPzUsqyLhU+YuG4Ci2FA/vcm0qhs1GatHjRDeX9qQQm
 UI8xyKkoyYeSNHSdPl6Xpz63fLdmnAaFuNIr76/fbwB54V/QdqTN64Ob6Qx/d/v/qcwF
 Mh9ccx+qBL9FIiiTJXcrw2/piqltlO79pbcCFZjU/rtANfcqP5g4pf5SNAd/nihVxyd+
 tUOg==
X-Gm-Message-State: AOAM532Y6HNnSjFoFVT7tfyl8dvc0RQoqBkHbOLXdOFtAqc95AmSx+v/
 39cFz4oJBByDOrZqhtyiZx0vX7+mSDMdsmIbvEj10A==
X-Google-Smtp-Source: ABdhPJwOntt7o/KNEDNeAfpwY3gBusWaODLEh84L1Zfcy+bCLj4aybWd7ofKRirQbZPT5O0ha6jImqVdDYDMAgS1OwE=
X-Received: by 2002:a05:6808:14c2:b0:326:c129:d308 with SMTP id
 f2-20020a05680814c200b00326c129d308mr796441oiw.193.1652907438996; Wed, 18 May
 2022 13:57:18 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 18 May 2022 13:57:18 -0700
MIME-Version: 1.0
In-Reply-To: <1652905444-10130-4-git-send-email-quic_khsieh@quicinc.com>
References: <1652905444-10130-1-git-send-email-quic_khsieh@quicinc.com>
 <1652905444-10130-4-git-send-email-quic_khsieh@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Wed, 18 May 2022 13:57:18 -0700
Message-ID: <CAE-0n51VJZ-mq+9=YH1J-F7rv7-8eA6A3DxpSDPRvssppKPFqQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] drm/msm/dp: delete vdda regulator related
 functions from eDP/DP controller
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org, airlied@linux.ie,
 bjorn.andersson@linaro.org, daniel@ffwll.ch, dianders@chromium.org, 
 dmitry.baryshkov@linaro.org, dri-devel@lists.freedesktop.org, 
 robdclark@gmail.com, sean@poorly.run, vkoul@kernel.org
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, linux-kernel@vger.kernel.org,
 quic_aravindh@quicinc.com, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2022-05-18 13:24:04)
> Vdda regulators are related to both eDP and DP phy so that it should be
> managed at eDP and DP phy driver instead of controller. This patch removes
> vdda regulators related functions out of eDP/DP controller.
>
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
