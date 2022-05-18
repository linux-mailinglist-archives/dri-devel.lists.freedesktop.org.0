Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F229A52C4C7
	for <lists+dri-devel@lfdr.de>; Wed, 18 May 2022 22:53:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46F5310E2C1;
	Wed, 18 May 2022 20:53:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com
 [IPv6:2607:f8b0:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22E0610E2C1
 for <dri-devel@lists.freedesktop.org>; Wed, 18 May 2022 20:53:41 +0000 (UTC)
Received: by mail-oi1-x236.google.com with SMTP id n24so4122445oie.12
 for <dri-devel@lists.freedesktop.org>; Wed, 18 May 2022 13:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=UNqWZZ/W5ko5bopxO2cXE64dq+vAay+pJVcB9JPEK7k=;
 b=MZU6ZApL+VJ2nR/SOYL+8sNV8dz7t8gWj15O7ujNs2F9Fz+Vn9RCogVeN1vvAnRWRS
 ilsC9DGDD64NEGVFzpPB1wzxKAVfzks8J0UC+0ZH1/CCa+nGcAPbTMg0RH+kWk0nCnip
 XhfMZL6B6uOhpLcXD57lGxIbgFNNO8i1wISrQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=UNqWZZ/W5ko5bopxO2cXE64dq+vAay+pJVcB9JPEK7k=;
 b=rDXCfXTnY3JV+IGGsrf412CdT9DLTCwqzeXvOfoIomgPE7aYVIlvYffJl2GjHPhNYO
 2PFZnwpq17MaH9TqJyQfOkNkL7I5eKiFsefoDrjHfoRxV1dPzneZwx8+S+0UbdUceEfb
 EYKCPAJRgE6qEMQxd3WmEcciersJGEGqi+0DLTBHYBFGJck8h3vfw2MiD+8aXW1EYOsv
 BbwEVuvOdp3KNCmofg+Gme9cnADoAVq0K+ehBq0skmJel7FnExmuKOu8v/oZtakzkeS2
 UE4BDyOpOc60e6py3djz6qh8PvqoU+qzFKL2c3lKEjNV5fvwyODeHa+IRiJUWy3hv+1q
 aPKA==
X-Gm-Message-State: AOAM531cysB2rnPlSjn8dDmCzgocJBzw7vMv5Zc0ImV0wlGTpNuEw9Da
 ssNU3KiCc/9joe+ApHuj0iWmpRviaTVyr1AlydO4GQ==
X-Google-Smtp-Source: ABdhPJydobKed7t7rxB1Dk5wydK9YkQwNJ01ZtS6wCryK3YwFULkGDQ1slIBbwUS+XCTTygMr92gMAt/aKu+AoKQ+Hw=
X-Received: by 2002:a05:6808:23c3:b0:326:bd8d:7993 with SMTP id
 bq3-20020a05680823c300b00326bd8d7993mr892931oib.63.1652907220416; Wed, 18 May
 2022 13:53:40 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 18 May 2022 13:53:40 -0700
MIME-Version: 1.0
In-Reply-To: <1652905444-10130-3-git-send-email-quic_khsieh@quicinc.com>
References: <1652905444-10130-1-git-send-email-quic_khsieh@quicinc.com>
 <1652905444-10130-3-git-send-email-quic_khsieh@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Wed, 18 May 2022 13:53:39 -0700
Message-ID: <CAE-0n53o234QGNiDZ20Bmtrxcr03wUEbTgM82i1-sF4VhT=JsQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] phy/qualcomm: add regulator_set_load to dp phy
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

Quoting Kuogee Hsieh (2022-05-18 13:24:03)
> This patch add regulator_set_load() before enable regulator at
> DP phy driver.
>
> Changes in v2:
> -- no regulator_set_load() before disable regulator
>
> Changes in v3:
> --  split into two patches

Same changelog comment

>
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
