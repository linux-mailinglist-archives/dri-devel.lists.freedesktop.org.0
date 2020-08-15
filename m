Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB7042451C9
	for <lists+dri-devel@lfdr.de>; Sat, 15 Aug 2020 22:19:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAEB589FC9;
	Sat, 15 Aug 2020 20:19:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B376989CD7;
 Sat, 15 Aug 2020 20:19:49 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id k8so10702474wma.2;
 Sat, 15 Aug 2020 13:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zIzNxA4BRTbs45wz2IBTfdONSpn/S4dV1mOfjSjFesQ=;
 b=jE3b9gKVGX5Fk2XQYlJoQ9uC/GrRVyBZX0DJDN3AJAxFJULHvvIK2ex9pvr+pWVW6X
 LAWRom/Q6eGx5wTFkQlktCzOrPNhzZe8gzqy3MqtZPJHCAiANJNEqJ0+S5XkpNNE8wF+
 Wj8zHZ3ogrzsnKSIzaGROnT3CG1Ex/QgqY8omexs3fKkR6brl1sorYPZBV7smPDL/i0O
 BlTZe8jkjajnVX8J7XlB/Ba3+EXRCUisSGzot3/9ui6Qvqs1HLvdSjDqRKaz3sWe6WtU
 lginAKDasczM0r5brn7c0fg6LVFVMjUdOMagynJngPDA9icPpat9jIBAKlyjyWpRAFDm
 UDng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zIzNxA4BRTbs45wz2IBTfdONSpn/S4dV1mOfjSjFesQ=;
 b=Yjs289KWghEOeGSTK7oEV1zGZoD9CdzDSHtxXnATufZlqtosKEz9+eeZfH7N0ZlLXg
 Kc2zsMAtifj0SXmn9lbzOahamZdqIin4R5L2dpoKuhoNU15FUcFQnCFpGA/pLfjuj9HE
 0G1nhDBXKy98kquZ3teQIUzDrha3HJuVB7N//YwLMHYAUJxgf2rLPh3gP1xm5PXfeXGo
 SHHLMRNQJ1F/1L66aB21dyKVLtnSrxL45w3LE1G/fzHiZ3vB6nv99yK4veo/PhTyaSG3
 pmFz/tSkzYIy3gxuH4rd0S+Z+Dkuc45bZfQ0qJoKnUlarGjsqZYCk08SD1KTePTnRDkY
 IcMQ==
X-Gm-Message-State: AOAM531xI8799nfLm6wJXZjyL7cMPl1aM4/o2NDD220TPaLkK7AOiozS
 0R6/7lPJ0/TREFuaOJo5dYkt2zMFL5hKA4E6iBo=
X-Google-Smtp-Source: ABdhPJyrGCbvhPVezyVJPPQnDejn5AGE+M7MmxTTrCOoiHRMgdeH5nxJu5TAlm48/n6OtYNzlDFZP/YcRo0XSEVEupY=
X-Received: by 2002:a1c:e919:: with SMTP id q25mr7743939wmc.123.1597522787277; 
 Sat, 15 Aug 2020 13:19:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200812044223.19279-1-tanmay@codeaurora.org>
 <20200812044223.19279-4-tanmay@codeaurora.org>
 <821b5cf9-5ca0-7026-fd99-9a32285ed030@linaro.org>
In-Reply-To: <821b5cf9-5ca0-7026-fd99-9a32285ed030@linaro.org>
From: Rob Clark <robdclark@gmail.com>
Date: Sat, 15 Aug 2020 13:20:35 -0700
Message-ID: <CAF6AEGtcfXodN1_HSdTcH402FdwTk15Nt6p3F=QYeSRhTc+hqw@mail.gmail.com>
Subject: Re: [PATCH v10 3/5] drm/msm/dp: add support for DP PLL driver
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, khsieh@codeaurora.org,
 Sean Paul <seanpaul@chromium.org>, Tanmay Shah <tanmay@codeaurora.org>,
 Vara Reddy <varar@codeaurora.org>, aravindh@codeaurora.org,
 freedreno <freedreno@lists.freedesktop.org>,
 Chandan Uddaraju <chandanu@codeaurora.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Aug 14, 2020 at 10:05 AM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
>
> On 12/08/2020 07:42, Tanmay Shah wrote:
>  > From: Chandan Uddaraju <chandanu@codeaurora.org>
>  >
>  > Add the needed DP PLL specific files to support
>  > display port interface on msm targets.
>
> [skipped]
>
>  > diff --git a/drivers/gpu/drm/msm/dp/dp_pll_private.h
> b/drivers/gpu/drm/msm/dp/dp_pll_private.h
>  > new file mode 100644
>  > index 000000000000..475ba6ed59ab
>  > --- /dev/null
>  > +++ b/drivers/gpu/drm/msm/dp/dp_pll_private.h
>  > @@ -0,0 +1,98 @@
>  > +/* SPDX-License-Identifier: GPL-2.0-only */
>  > +/*
>  > + * Copyright (c) 2016-2020, The Linux Foundation. All rights reserved.
>  > + */
>  > +
>  > +#ifndef __DP_PLL_10NM_H
>  > +#define __DP_PLL_10NM_H
>  > +
>  > +#include "dp_pll.h"
>  > +#include "dp_reg.h"
>  > +
>  > +#define DP_VCO_HSCLK_RATE_1620MHZDIV1000    1620000UL
>  > +#define DP_VCO_HSCLK_RATE_2700MHZDIV1000    2700000UL
>  > +#define DP_VCO_HSCLK_RATE_5400MHZDIV1000    5400000UL
>  > +#define DP_VCO_HSCLK_RATE_8100MHZDIV1000    8100000UL
>  > +
>  > +#define NUM_DP_CLOCKS_MAX            6
>  > +
>  > +#define DP_PHY_PLL_POLL_SLEEP_US        500
>  > +#define DP_PHY_PLL_POLL_TIMEOUT_US        10000
>  > +
>  > +#define DP_VCO_RATE_8100MHZDIV1000        8100000UL
>  > +#define DP_VCO_RATE_9720MHZDIV1000        9720000UL
>  > +#define DP_VCO_RATE_10800MHZDIV1000        10800000UL
>  > +
>  > +struct dp_pll_vco_clk {
>  > +    struct clk_hw hw;
>  > +    unsigned long    rate;        /* current vco rate */
>  > +    u64        min_rate;    /* min vco rate */
>  > +    u64        max_rate;    /* max vco rate */
>  > +    void        *priv;
>  > +};
>  > +
>  > +struct dp_pll_db {
>
> This struct should probably go into dp_pll_10nm.c. dp_pll_7nm.c, for
> example, will use slightly different structure.

Note that sboyd has a WIP series to move all of the pll code out to a
phy driver.  If there is work already happening on 7nm support, it
might be better to go with the separate phy driver approach?  I'm
still a bit undecided about whether to land the dp code initially with
the pll stuff in drm, and then continue refactoring to move to
separate phy driver upstream, or to strip out the pll code from the
beginning.  If you/someone is working on 7nm support, then feedback
about which approach is easier is welcome.

https://lore.kernel.org/dri-devel/20200611091919.108018-1-swboyd@chromium.org/

BR,
-R
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
