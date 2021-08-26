Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D7493F82E8
	for <lists+dri-devel@lfdr.de>; Thu, 26 Aug 2021 09:14:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A9CB6E530;
	Thu, 26 Aug 2021 07:14:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97B796E530
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Aug 2021 07:14:12 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id u25so3228274oiv.5
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Aug 2021 00:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=aRiLbWEP9NQgwwctmdG3N2zfgTjntvnVENFb+awS0zA=;
 b=F81Cr3R6yT7asoMk0pyICvtOXoQZAXvI1ZnDNCPSezR35pdJ3glHU/05ASNiivAux1
 fSfqjB1WU7WW801D5dDdGncQYjxSGvFnL/wsbjCe2P3mYZLuDRXxDNkfrGdnRoesZ4pm
 DIf81ahimaKl/WhY/sF0MPtxSm6wmliMthhJI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=aRiLbWEP9NQgwwctmdG3N2zfgTjntvnVENFb+awS0zA=;
 b=ZbP15Mmu78bzkmyJHDPXTis+NxQv1Lj0fMbig1l/HXUd6hRxefcickaU0vWKkXh7F0
 DyCRo3Pqi7Tqu/6Zx4b5YmeDHUZ/LUK77IEXICqOK8YQ9O6sx5hyUvWEaF7nhTiAnzC2
 VhOTMBpnwtjs2kjcWYW2G8BWz87ruFsV5idXiOZw98etQ1nl7ssuMfznOuMPXzNCcWLT
 OVoBNR79GPijmRHDRKndSuV9Vvi3a1vsTUxDYd3Cif/PGoy1+Q2diwKPhinS6PA5cEuo
 V01ve6lSchVk7/y176+Ij9A5j575BPSk5m8MQ3WPmJrSApqqX0a6zOtLzgX1TnE+tC+c
 a8og==
X-Gm-Message-State: AOAM533h9inaWzwHMTkO9a4maIjq288CaaW+J17wBchg8tjb+h9EM0Oe
 Iknb46DzhqqohYUyCsC3Ni4ZIHDShzK2t4i1pBUlMg==
X-Google-Smtp-Source: ABdhPJzUDekyoWqTfrkclEr8+8sWlzJ7PWjVoXwVhqtZb33xoA6jHZ+GqQ45EOn0Awx+UlXeZahflBl7bsDJeh8AC6Y=
X-Received: by 2002:a05:6808:181a:: with SMTP id
 bh26mr10217298oib.166.1629962051961; 
 Thu, 26 Aug 2021 00:14:11 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 26 Aug 2021 07:14:11 +0000
MIME-Version: 1.0
In-Reply-To: <20210825234233.1721068-6-bjorn.andersson@linaro.org>
References: <20210825234233.1721068-1-bjorn.andersson@linaro.org>
 <20210825234233.1721068-6-bjorn.andersson@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Thu, 26 Aug 2021 07:14:11 +0000
Message-ID: <CAE-0n50FhJgE-Z3DvdhfTZxRbwCx50TT2An_i=Xorf=OBE0MYQ@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] drm/msm/dp: Add sc8180x DP controllers
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

Quoting Bjorn Andersson (2021-08-25 16:42:33)
> The sc8180x has 2 DP and 1 eDP controllers, add support for these to the
> DP driver.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
