Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DE735423506
	for <lists+dri-devel@lfdr.de>; Wed,  6 Oct 2021 02:31:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CE0D6E499;
	Wed,  6 Oct 2021 00:31:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [IPv6:2607:f8b0:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 108166E48E
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Oct 2021 00:31:51 +0000 (UTC)
Received: by mail-oi1-x234.google.com with SMTP id z11so1694813oih.1
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Oct 2021 17:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=m+MQKr5bcojm+sq7twaLg9pOUyJH5Cs+bOJrOsgta0s=;
 b=GS/JhV0jd+qpvRnhjBqMFbLHcJyA18vDoEZRkcsyl70o2Zw9rFeYG2+GLxajHYUhQ/
 9mlZAfVZPGpCekxLKcIrOYPDk6TZJ9bRQRpE+bDcTzj2V5QnhwTSC+QryLhGHxlbHKJW
 pYDjcJibQ+zO4NJCsKj6a/Do0AGe+60gkzyXQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=m+MQKr5bcojm+sq7twaLg9pOUyJH5Cs+bOJrOsgta0s=;
 b=tO1SwyTyGbdxtF6xkjpgmmsbmBzNS642+oCtinUs0EGen3TF/69c2b1vo4fugAQ54a
 83IBNNyVzVPzxBgJnAkV8KW5FlD4VoHCF8tKOH5DawxqlotCHt6G9Z6hAc7cZs5Vwsyc
 XVhWl/+r21x6vM+9EPaA86Am7rOJJvt5Issxo6e0y2VdPS44n7Ao+Gp/0pdVlqvo6rpA
 zvi0n/QHEtX3yO2t1PeiF7sfPBFwDARCKvV/0aeB4d/Hz1EhhRg34hVC5GlxzipzNtR6
 41ParMv2i9AY2+JnnLWuvM0J16sQl13xqbElYhBtYier+ho1C9EJFO5Xkoz/MWg6Ak0V
 Woqg==
X-Gm-Message-State: AOAM533vcmy/MeiX3ihCxlC9vo1kYMUb5yZtm14PpOfWLvOXlV0xSQU8
 +oFgWVNCcU0d+jDx7eiQDsTmvBfDkKxfN9leyhhGOA==
X-Google-Smtp-Source: ABdhPJzMWWttSwSsQa0qR8s31oOrQHsLnN0nu6wJj4lnGpC7laluIjYD8fdeIhSf0clYnnBS2KZ1NOlkP+u5kDOTJRg=
X-Received: by 2002:aca:42d7:: with SMTP id p206mr5002008oia.32.1633480310393; 
 Tue, 05 Oct 2021 17:31:50 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 5 Oct 2021 17:31:50 -0700
MIME-Version: 1.0
In-Reply-To: <20211005231323.2663520-4-bjorn.andersson@linaro.org>
References: <20211005231323.2663520-1-bjorn.andersson@linaro.org>
 <20211005231323.2663520-4-bjorn.andersson@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Tue, 5 Oct 2021 17:31:49 -0700
Message-ID: <CAE-0n53wHmorZ4HdhJmXTf+Z0j++LFut_aTryuCAa8ONW3iuLA@mail.gmail.com>
Subject: Re: [PATCH v4 3/7] drm/msm/dp: Allow specifying connector_type per
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

Quoting Bjorn Andersson (2021-10-05 16:13:19)
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 5d3ee5ef07c2..eaf08f9e7d87 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -115,8 +115,25 @@ struct dp_display_private {
>         struct dp_audio *audio;
>  };
>
> +struct msm_dp_desc {
> +       phys_addr_t io_start;
> +       int connector_type;

unsigned?

> +};
> +
