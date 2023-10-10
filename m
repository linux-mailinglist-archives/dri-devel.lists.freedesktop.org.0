Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A2A97C044B
	for <lists+dri-devel@lfdr.de>; Tue, 10 Oct 2023 21:19:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4334910E11E;
	Tue, 10 Oct 2023 19:19:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F8D410E3D2
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Oct 2023 19:19:21 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-50567477b29so7863753e87.3
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Oct 2023 12:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1696965559; x=1697570359;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc:subject:date:message-id
 :reply-to; bh=AvjZzz7pnTqNFU2kq8efpY866MOjCfg9gpj/PxH4/+k=;
 b=JOVduy6X+Xf59gJvP3cuSApC302olN7Ym2KJPGGQt/wWwqJ72lH6pd8yDPSxYbT57Z
 UgKZGWUpAFkMAduCiXuXKnYdlooF7S3VN7h5NswBsnw/7ogSbgOmhKJlSagOBGGwAXdF
 xqM0IpsAWmG6lLyQdUriYzsy1MDCKsHkAMed0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696965559; x=1697570359;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AvjZzz7pnTqNFU2kq8efpY866MOjCfg9gpj/PxH4/+k=;
 b=CeDkanhTiWkdYRFk4ppme8NCs0OUnfT0zd+q3OjdzsloU6igsxfbjAC55EARaIXHPy
 8DLd1uDbLu90YlzPgG0y9VasS1T26vdIfRcB1oqZ5CPxLYpK2GjTdmtQI84owApkNWQi
 r9smcP2HzyITTayTAibCiQhoaQ1fLuO3uVubR0O5goot0WNZVTPWfL3PJCagRPEi17tC
 wOoJe5cesfYDQb13I9HjjasAB38NfgyD5+fqd9DFTrHjuVM2jiKEfXKM9tdeuMazdazG
 fYZ+Anc42KUlb2JYBLUrLs7DVQJWAEflPg7lZeF18hW3YmV5jEO+8pp4Uzx7jQopwp3L
 Jxmg==
X-Gm-Message-State: AOJu0YytXearIfufPF1xqF4IZbCyVKHQzLStx6qPqDx9Xkx8eq6DlFDr
 FEjftOuLKdRxLtUhjZQqir5rZvcpb7I1kvaO2UEsRz0GlhoISP9c
X-Google-Smtp-Source: AGHT+IFq1y8usHuuOq0+zCRJnPaJsNG4I0nxxNL8AuiMb1KSaafC1SKCCoNyc4Vky58f9BXOh0ClpevLdtstLOMN0FI=
X-Received: by 2002:a05:6512:ac5:b0:500:8f66:5941 with SMTP id
 n5-20020a0565120ac500b005008f665941mr19661687lfu.50.1696965559028; Tue, 10
 Oct 2023 12:19:19 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 10 Oct 2023 19:19:18 +0000
MIME-Version: 1.0
In-Reply-To: <1696632910-21942-1-git-send-email-quic_khsieh@quicinc.com>
References: <1696632910-21942-1-git-send-email-quic_khsieh@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Tue, 10 Oct 2023 19:19:18 +0000
Message-ID: <CAE-0n50GR2YXpZVANQEns4W5TEFoR7n80PFuoyMOs8vo=MDkgw@mail.gmail.com>
Subject: Re: [PATCH v7 0/7] incorporate pm runtime framework and eDP clean up
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org,
 airlied@gmail.com, 
 andersson@kernel.org, daniel@ffwll.ch, dianders@chromium.org, 
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
 marijn.suijten@somainline.org, quic_jesszhan@quicinc.com,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2023-10-06 15:55:03)
> The purpose of this patch series is to incorporate pm runtime framework
> into MSM eDP/DP driver so that eDP panel can be detected by DRM eDP panel
> driver during system probe time. During incorporating procedure, original
> customized pm realted fucntions, such as dp_pm_prepare(), dp_pm_suspend(),
> dp_pm_resume() and dp_pm_prepare(), are removed and replaced with functions
> provided by pm runtiem framework such as pm_runtime_force_suspend() and
> pm_runtime_force_resume(). In addition, both eDP aux-bus and irq handler
> are bound at system probe time too.
>
> Kuogee Hsieh (7):
>   drm/msm/dp: tie dp_display_irq_handler() with dp driver
>   drm/msm/dp: rename is_connected with link_ready
>   drm/msm/dp: use drm_bridge_hpd_notify() to report HPD status changes
>   drm/msm/dp: move parser->parse() and dp_power_client_init() to probe
>   drm/msm/dp: incorporate pm_runtime framework into DP driver
>   drm/msm/dp: delete EV_HPD_INIT_SETUP
>   drm/msm/dp: move of_dp_aux_populate_bus() to eDP probe()
>
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c |   4 -
>  drivers/gpu/drm/msm/dp/dp_aux.c         |  39 +++-
>  drivers/gpu/drm/msm/dp/dp_display.c     | 333 ++++++++++++--------------------

Tested-by: Stephen Boyd <swboyd@chromium.org> # Trogdor.Lazor

I ran some suspend cycles too with the lid open and closed.
