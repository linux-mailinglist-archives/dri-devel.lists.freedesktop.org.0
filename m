Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71E087222E6
	for <lists+dri-devel@lfdr.de>; Mon,  5 Jun 2023 12:05:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74BEE10E281;
	Mon,  5 Jun 2023 10:05:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com
 [IPv6:2607:f8b0:4864:20::b2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC1F910E281
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jun 2023 10:05:48 +0000 (UTC)
Received: by mail-yb1-xb2a.google.com with SMTP id
 3f1490d57ef6-bb167972cffso5885245276.1
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Jun 2023 03:05:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685959547; x=1688551547;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=/FS41Ih+vUtWqsRP9xk/SSbQ/TsVgc3IcFrySxyXAOw=;
 b=XYdvYRCtVg88YsxqwOeTmZpVKBps/jJvevf/4HoPJA9d8x95OX/S5meaL79fdZ+lcf
 TYo9EiIJxuqP8I6qT3/hs4a+sekKaLD3qHISTEdhINV/jCa8UfLVBQTVAnCtBimV9HIV
 IsUz2k1t2TnpiUzXKWYKOHwU1KsgmdGBhGasng7QrDgprD5hdibslehcmb3AUAEFF/2U
 hqxRhA4nXn7swnfehttcvH80+nzB/igq5TC0Su5RC38Rpqp3M9iDIK+J7E5QgGsnR6MU
 d/l+lwzxIjkgtyTDbWPAk2rmmdCzaivtkfhcI9PBvyBhf1/WvOcHQZwgRrqJZkHFIMCV
 UiCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685959547; x=1688551547;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/FS41Ih+vUtWqsRP9xk/SSbQ/TsVgc3IcFrySxyXAOw=;
 b=JiHaBSEQcqRDRWZMw1vY3Q8B1g8obalKIJ+Ln6+u1+hWq7FoIzte8qHNLV1VLYpTzd
 qE1GvIVltDHdJA0KD0sSTuHAj6lDsQlf9+Ul1w7CXNSNNiKCeNjgg4RcMDCwhgbNrXQL
 YdgW71U+XaiirhjTSat58yqABAtnhy0Ny8eZWKwwSki643XGNuxJOaZBNGbymlN2mXEv
 kZo+8eo+H7jRd6+V0B1Km2K0WrOpLjEwK5t/SfkNVqwNwhcRIyAR5awv9emVmVZKrJOD
 B5iXiC4QiHgoc+nZmYQ/0JXrxTsUDsVg0J3bEbae3JrqK+8FNoCpmtViptuimns3kuqF
 MXkA==
X-Gm-Message-State: AC+VfDyjVTo6zj5JVoEtDptWY5TGBYGS8OTIVuIAWvGMzetyMC9PdRAl
 YuD/wd2PMP0VRm5lgqlBkxOxS6OU8LL/TYJM0o+Rvg==
X-Google-Smtp-Source: ACHHUZ7ZahqapikQv5X3CgkTgJs9qJu2UzKM4VpKBCDBA8zf8Pp37d7CHhoxAHvX6jPlV3ZKeHf2tzZIaPEO8cq6JLY=
X-Received: by 2002:a0d:f447:0:b0:561:e561:9fd7 with SMTP id
 d68-20020a0df447000000b00561e5619fd7mr10796136ywf.39.1685959547562; Mon, 05
 Jun 2023 03:05:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230523151646.28366-1-johan+linaro@kernel.org>
 <ZH2ys6dVeL02JLCU@hovoldconsulting.com>
In-Reply-To: <ZH2ys6dVeL02JLCU@hovoldconsulting.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 5 Jun 2023 13:05:36 +0300
Message-ID: <CAA8EJprBNzw4o4m0sn2OoOqnwioQWNcTPcKoKGqxLWGc_8xjWA@mail.gmail.com>
Subject: Re: [PATCH] Revert "drm/msm/dp: set self refresh aware based on PSR
 support"
To: Johan Hovold <johan@kernel.org>
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
Cc: freedreno@lists.freedesktop.org,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>, regressions@lists.linux.dev,
 Sean Paul <sean@poorly.run>, Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Stephen Boyd <swboyd@chromium.org>, Vinod Polimera <quic_vpolimer@quicinc.com>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 5 Jun 2023 at 13:02, Johan Hovold <johan@kernel.org> wrote:
>
> [ +CC: Thorsten and regzbot so they can help with tracking this
> regression ]
>
> #regzbot introduced: v6.3..v6.4-rc1
>
> On Tue, May 23, 2023 at 05:16:46PM +0200, Johan Hovold wrote:
> > This reverts commit 1844e680d56bb0c4e0489138f2b7ba2dc1c988e3.
> >
> > PSR support clearly is not ready for mainline and specifically breaks
> > virtual terminals which are no longer updated when PSR is enabled (e.g.
> > no keyboard input is echoed, no cursor blink).
> >
> > Disable PSR support for now by reverting commit 1844e680d56b
> > ("drm/msm/dp: set self refresh aware based on PSR support").
> >
> > Cc: Vinod Polimera <quic_vpolimer@quicinc.com>
> > Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> > ---
> >
> > Bjorn reported that PSR support broke virtual terminals two months ago,
> > but this is still broken in 6.4-rc3:
> >
> >       https://lore.kernel.org/lkml/20230326162723.3lo6pnsfdwzsvbhj@ripper/
> >
> > despite the following series that claimed to address this:
> >
> >       https://lore.kernel.org/lkml/1680271114-1534-1-git-send-email-quic_vpolimer@quicinc.com
> >
> > Let's revert until this has been fixed properly.
>
> Virtual terminals are still broken with 6.4-rc5 on the Lenovo ThinkPad
> X13s two weeks after I reported this, and there has been no indication
> of any progress in the other related thread:
>
>         https://lore.kernel.org/lkml/ZHYPHnWoDbXB-fqe@hovoldconsulting.com
>
> Seems like it is time to merge this revert to get this sorted.
>
> Rob, Abhinav, Dmitry, can either of you merge this one and get it into
> 6.4-rc6?

Rob sent the pull request few hours ago, see
https://lore.kernel.org/dri-devel/CAF6AEGuHujkFjRa6ys36Uyh0KUr4Hd16u1EMqJo8tOZ3ifVubQ@mail.gmail.com/

-- 
With best wishes
Dmitry
