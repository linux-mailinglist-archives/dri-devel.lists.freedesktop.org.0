Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40F805241B5
	for <lists+dri-devel@lfdr.de>; Thu, 12 May 2022 02:52:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 026D810E74E;
	Thu, 12 May 2022 00:52:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com
 [IPv6:2001:4860:4864:20::33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 175FE10E74E
 for <dri-devel@lists.freedesktop.org>; Thu, 12 May 2022 00:52:29 +0000 (UTC)
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-e2fa360f6dso4934330fac.2
 for <dri-devel@lists.freedesktop.org>; Wed, 11 May 2022 17:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=SO048bkaqtJpnNOMEvZB35O9DTWVZ1Wg9kxc4ycyFjg=;
 b=cOc/ULhNS4VZgkhofRchN39m+cfbPtZsxhK2XKYkfT2dFHetpaa89L2NTSPaoYADiZ
 DPkgapU/gqwvkkJPzoL3lwgAIpTKGEqV+rQOpuUTp5THjNE1vXdLfxej+k05z8TDHrKI
 eoPWGslKfu1cmud7L+fcfMsfQuuk2c64zlCnI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=SO048bkaqtJpnNOMEvZB35O9DTWVZ1Wg9kxc4ycyFjg=;
 b=OlEDwnG9SLqtCCIMUdwqu0PNrwCuZ4L/6nKF4CHrnnmJicYZx9kEfGJeUG4ep7QfiQ
 mnqr/lYvGPkTHolqxVIWptz2DzG9aH1ssFznHWY9HDih1A5U/gz4H9bHbCHdxjkCZiBy
 Z/xkNHadxyiqw+QldoGQdIuWd2mg7nP+zHB6LM82KPuSgG17lk33Zu5vUijs6gdBKOVb
 327rh5NGWd0KcYXOH9ZNbcW5KYcsUO58UxCyn+VjS0O64jg6RjN/Z8dErs4F1vo6OHvu
 2qEE++p7dQAbEFdTM3YcOde0OGPC9Q89YjESx/YJ3l37rF6LLFVTrgd7YTsOf4AQL2jL
 +QUA==
X-Gm-Message-State: AOAM533qAhVEGQVpHWOgYStd9lgix6WVvlyIawziQ4qaaNrmbDQc7/su
 64980cJU8WVC6aAZnnB5avuH+C4xW9SBqlVebQ3HBw==
X-Google-Smtp-Source: ABdhPJwX4oTvClZRn3k1F+TWgXVFBrjhZFK8ryObp71Dxi76wH3GSTdge9rwubpK0xGCkBygRmrlaUl0Lz8oFCYnoDg=
X-Received: by 2002:a05:6870:40c1:b0:ed:9a12:3f95 with SMTP id
 l1-20020a05687040c100b000ed9a123f95mr4167327oal.193.1652316748287; Wed, 11
 May 2022 17:52:28 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 11 May 2022 17:52:27 -0700
MIME-Version: 1.0
In-Reply-To: <20220507114009.1696278-1-dmitry.baryshkov@linaro.org>
References: <20220507114009.1696278-1-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Wed, 11 May 2022 17:52:27 -0700
Message-ID: <CAE-0n51+94O20QW2rWqV2LBeb+5zoi4HNfRp=Sus-Z+tM5FRJA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dpu: remove NULL-ness check in dpu_hw_intr_destroy
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark <robdclark@gmail.com>,
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
Cc: kernel test robot <lkp@intel.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2022-05-07 04:40:09)
> There is no need to check that kfree() argument is not NULL. Remove
> extra check and call kfree() unconditionally.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
