Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 96468436AAB
	for <lists+dri-devel@lfdr.de>; Thu, 21 Oct 2021 20:38:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AB356ECD8;
	Thu, 21 Oct 2021 18:38:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 830F86ECD8
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Oct 2021 18:38:02 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id i6so2115373lfv.9
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Oct 2021 11:38:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=ALLaW870u1D1a3B4tAR7fsm6fvwLLBmkhU/jhS/DyGQ=;
 b=RFcdf8vxBZSlF3NhN63EcUhe39FktWlYXAtFZyTy04hol6b95W6yQpfhhSBjy4r8m7
 VUFtR/fHTZJk1PPVMdk8JBd6hYmAzzWB601z67ELbEEb6wHw8OegxXMfZd5VyCpIvVmk
 Z1Ywi86yueW+7Pmna+OtBJkZ6nniow00mAWj0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=ALLaW870u1D1a3B4tAR7fsm6fvwLLBmkhU/jhS/DyGQ=;
 b=ohAJvRUAXSKmuIsh2Vn1Dq441KOzcEaTrqUPTiK/ZtXIpjUwZTr0zVQmfhKYm9zHRj
 zCupNY69xbZEfsQXGiSfYaNjOjYR66eFxoZCj6UwAxqmajYaaxW7Vjy412ZmBDofZ1yJ
 IXVGOHmNR0Iccw1dJCK+QX2mk973uEeFE/OF5jfGD1I2xCkDmMImyBNrPppkPMh0GhaU
 vQHlu7gGmjJfoEZ95xahL7BAMaTqsjlhLzGvDgeCun3UB/qFfnNNT4FF+ykwl9YZx14W
 4A0MzJBWrqkNZIj2H0C2mGTrvfVwk7z5dzozqD+t7Y9NDqQXiVW3wpmTdstUBIZmbvEA
 SW+w==
X-Gm-Message-State: AOAM530WzB3EuRH0/qF+1tCHs+ACrI389Ia8tOR21/aZIcdJ/dXFqeEr
 y4tlQFCBXFaofPCH9tiUh2Dwpl3iR1HeN7r47uq2LQ==
X-Google-Smtp-Source: ABdhPJzt5GhiXXEzu0cgd6TJgL13cjs2Vjd06K5GNoIpxGCZQz7SctOsayb2q+AEKJocwmLURo2d1holaUwo0FaEQVo=
X-Received: by 2002:a05:6512:63:: with SMTP id i3mr7201386lfo.74.1634841480855; 
 Thu, 21 Oct 2021 11:38:00 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 21 Oct 2021 11:38:00 -0700
MIME-Version: 1.0
In-Reply-To: <1634738333-3916-1-git-send-email-quic_mkrishn@quicinc.com>
References: <1634738333-3916-1-git-send-email-quic_mkrishn@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Thu, 21 Oct 2021 11:37:59 -0700
Message-ID: <CAE-0n52+B0dWa_axZpA1T3mL0rGp96Ov+HanNxGf+Dpr3sUogQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: msm: add DT bindings for sc7280
To: Krishna Manikandan <quic_mkrishn@quicinc.com>, devicetree@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: kalyan_t@codeaurora.org, sbillaka@codeaurora.org, abhinavk@codeaurora.org, 
 robdclark@gmail.com, bjorn.andersson@linaro.org, khsieh@codeaurora.org, 
 rajeevny@codeaurora.org, freedreno@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Krishna Manikandan (2021-10-20 06:58:50)
> MSM Mobile Display Subsystem (MDSS) encapsulates sub-blocks
> like DPU display controller, DSI, EDP etc. Add required DPU
> device tree bindings for SC7280.
>
> Signed-off-by: Krishna Manikandan <quic_mkrishn@quicinc.com>
>
> Changes in v2:
>   - Drop target from description (Stephen Boyd)
>   - Drop items from compatible (Stephen Boyd)
>   - Add clock names one per line for readability (Stephen Boyd)
>   - Use correct indendation (Stephen Boyd)

This changelog should come after the triple dash. qcom maintainers don't
want drm style changelogs in the commit text.

> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
