Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED536555586
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 22:54:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 658EE10E55E;
	Wed, 22 Jun 2022 20:54:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc31.google.com (mail-oo1-xc31.google.com
 [IPv6:2607:f8b0:4864:20::c31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF4AB10E034
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 20:54:03 +0000 (UTC)
Received: by mail-oo1-xc31.google.com with SMTP id
 s1-20020a4adb81000000b00422e6bf0e92so1507864oou.13
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 13:54:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=zLM3H6dXb+4yal/kJHLEaxquP6RiiCYcAQJiPFIPgC8=;
 b=HskBGcQ2b9PGCBZ6Tnzgt6AnYSaE04gY5FShwZziCicLLASoVTQ/m5/Nx62jqEvxzq
 FaAqhHz0/i4OzvdA7rYGg/GbwDArNnQaPgeHYJP9iHp4LndZjDAOtSXD/H/u8Diu6s2v
 RRkvk/2yXmGKDKXqZnaanEF3T74mHT9aLGlKI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=zLM3H6dXb+4yal/kJHLEaxquP6RiiCYcAQJiPFIPgC8=;
 b=yx013whjiCHyEUw7EGQkrjIRtYpB6VkxtX+4BRXW54nPcH0TzxDy94NFvPKBH2pjLG
 JTrFdUUMJOfh112RZFAPM6ThXbBpmZX6bnu+ykqK3Fek4CyfoVItPcfpvz/ocJs0oyKM
 i+J+GQOzC4cG7dgT4H7pnK5SXVXPx+hx+PJEy1ty8CTIoRRdoLhs305vg0VrKIqS7xgH
 tuhoEq/7jROggUikYrjm0Bx/J+v62FDnaaSlMirThoDomW8EUmKkpjRd0GRkJTGV+L92
 JrUo6kr66LxStq1zIoG9Q1XlWf5Nj0xODkdn1CKb0riqbGLj5Ww0/5370V/I/f/k52EU
 HWfA==
X-Gm-Message-State: AJIora8ppxD7BkqI/Un44HQ/eYEf/rrxhefnstDJ4FYombVXA9ekmFjS
 ncG884sPg0msDFxTp57bOlv9DpR4wlLtPzIn0gLxFQ==
X-Google-Smtp-Source: AGRyM1vqwuYKRd2OLI2EjFJb+t6z5KjjkxkIrqC3zFBPKs8L9JJgfehG5mxRD8VQ6NVJjmHBWycT3gs/lPSd5dKK+JM=
X-Received: by 2002:a4a:ca95:0:b0:41c:e2c:ab2d with SMTP id
 x21-20020a4aca95000000b0041c0e2cab2dmr2199697ooq.1.1655931243137; Wed, 22 Jun
 2022 13:54:03 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 22 Jun 2022 16:54:02 -0400
MIME-Version: 1.0
In-Reply-To: <1655830891-19025-2-git-send-email-quic_khsieh@quicinc.com>
References: <1655830891-19025-1-git-send-email-quic_khsieh@quicinc.com>
 <1655830891-19025-2-git-send-email-quic_khsieh@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Wed, 22 Jun 2022 16:54:02 -0400
Message-ID: <CAE-0n52xHB4THaBztNY4THc8+vDGzD0YF-5_T9Baaj-Xdu4zGA@mail.gmail.com>
Subject: Re: [PATCH v15 1/3] phy: qcom-edp: add regulator_set_load to edp phy
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

Quoting Kuogee Hsieh (2022-06-21 10:01:29)
> This patch add regulator_set_load() before enable regulator at
> eDP phy driver.
>
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
