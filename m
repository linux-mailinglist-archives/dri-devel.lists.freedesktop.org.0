Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 453AE4305D9
	for <lists+dri-devel@lfdr.de>; Sun, 17 Oct 2021 03:30:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7E9C6E57E;
	Sun, 17 Oct 2021 01:30:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B86D6E57E
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Oct 2021 01:30:10 +0000 (UTC)
Received: by mail-ot1-x334.google.com with SMTP id
 b4-20020a9d7544000000b00552ab826e3aso786611otl.4
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Oct 2021 18:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=ubDJVQq78uVYhJbYvgkSAR8BkeRUeNLoFmCL9We36F0=;
 b=flYkLHhlsDBt7e3MlODNLUfbSjUku5qphnfo9uSFkDOvVTyMIbxeq1/Hq9T6WyHtvg
 XJO/07qz87PhIw/OmVM1eQ+/AkpkXbeyxhk/sQGsNfActPTAz4bUJuD5rXjt9MGYxaGJ
 80bs7G6KMq3j5xCfoFO+v1KZos7l6gKi2rAWQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=ubDJVQq78uVYhJbYvgkSAR8BkeRUeNLoFmCL9We36F0=;
 b=WF2pLWlccJ98DwXixWyzs3NHjPkMXzWfHt6F1nO87+LP9H/X69RW2KJ1c96lgs+1+h
 X9/Cath5/wt1Otv++KEL3LRQrKZ/dceQbXPejXipX9ijtqpNHDI/Wz8ev7PQwN/mpflp
 bjngs1syOtPJsZK1Gm9bxIwL+lqNT1P+lSEL205z/ZuHy3Ngu3EjGxsjLpMIvwubZMaR
 VNky4a1dhcgs0WKVIS1jUCpaDHca/yXZE/sxabiqb6Zgx86PpKK5yLmGjuGiqG1OARk2
 CQsWrTZbjuTABmSQj72lJuhkum3IAB3KhOF61jvJUDfjqmIusVHw23uO8pRiCi9aehIu
 mgCg==
X-Gm-Message-State: AOAM533aYFbnUbisAes5BcElWN72rKPIew5ammFr3NkZ+HMCb8fQE5zg
 lEvkTtoMwxzVfa31lyAJRuOiN1+NCLzY1VmgMoNW/g==
X-Google-Smtp-Source: ABdhPJwr06h9bD3MmzMdWkXAGp+iEIqQozkRjbdPwjgtYY8VoqiNVHLEO5C2EDLfQSqnSUcnH8rKmBifxGT81/0YlVc=
X-Received: by 2002:a05:6830:4187:: with SMTP id
 r7mr9420950otu.126.1634434209334; 
 Sat, 16 Oct 2021 18:30:09 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 16 Oct 2021 20:30:08 -0500
MIME-Version: 1.0
In-Reply-To: <20211016221843.2167329-4-bjorn.andersson@linaro.org>
References: <20211016221843.2167329-1-bjorn.andersson@linaro.org>
 <20211016221843.2167329-4-bjorn.andersson@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Sat, 16 Oct 2021 20:30:08 -0500
Message-ID: <CAE-0n52t0UF8usgvb5=8c9wdb_r+WKt7oNDncaVY=x8WZkVUWA@mail.gmail.com>
Subject: Re: [PATCH v5 3/7] drm/msm/dp: Allow specifying connector_type per
 controller
To: Abhinav Kumar <abhinavk@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Kalyan Thota <kalyan_t@codeaurora.org>, 
 Kuogee Hsieh <khsieh@codeaurora.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
Cc: Rob Herring <robh+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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

Quoting Bjorn Andersson (2021-10-16 15:18:39)
> As the following patches introduced support for multiple DP blocks in a
> platform and some of those block might be eDP it becomes useful to be
> able to specify the connector type per block.
>
> Although there's only a single block at this point, the array of descs
> and the search in dp_display_get_desc() are introduced here to simplify
> the next patch, that does introduce support for multiple DP blocks.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
