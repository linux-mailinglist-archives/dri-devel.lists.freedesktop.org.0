Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23CF651B395
	for <lists+dri-devel@lfdr.de>; Thu,  5 May 2022 01:38:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A925410F900;
	Wed,  4 May 2022 23:38:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F18D610F900
 for <dri-devel@lists.freedesktop.org>; Wed,  4 May 2022 23:38:08 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id i19so5691179eja.11
 for <dri-devel@lists.freedesktop.org>; Wed, 04 May 2022 16:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YXeq/XPiJwEkXU3dI75Tl8dYba/oZ3LQ1VjEhaH9Vwg=;
 b=F8ZAHz6WSgNmgenOXICnR5VtLZmMglppgmbrbMqwX6PNKEjGhmfLbTITzRwZBewfUH
 /b5EfJyVCZr6ehKbYwB5lu3juAduuJ9CSsx6et/o9QODUmwNkM5rS8cqpMUwF6jSf0r6
 C//ckdHWg9VL4W9ByKAQIt66nwfQW6b5QZvls=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YXeq/XPiJwEkXU3dI75Tl8dYba/oZ3LQ1VjEhaH9Vwg=;
 b=p9ShCSQ0B8AzI90ZagWKNRh7N1uWbnOWaGwPiwS24uiqIKtCvi8lqmenVSDtP9aGEF
 C6n8K2tlo8bAcHy5XmSuUs6nN6+tPCZ798eP+eRS1DOpTabk70v/oRZs2U8hO8HnGifX
 lhbBGZlibake7n+5Bx3hhcL1sevHhRWvtUHBLhOM4d1fG9SZZYTY7MAAFhfDKzZhWfpY
 csRsKrs6eIPmc4Xl1jnDmoEu+igCFs0AV4lzKGd7kIzhK6V894+a0jVV1DVcjvRzrOm2
 oh7YvzQtJYlPRV404x1Ip8risfSecyWJdrsmcD5cRVkn7Owdj4rEBoNkBo9AOehLjxh2
 ELwQ==
X-Gm-Message-State: AOAM533LmkI3Ta/Jum/tdPZ3Ul/Qg0lsSztLHlhcGDrTw3t6k+9u9+6j
 7bjJ80BqOWsts6IxIFwlmGP+uUD208DbbbPm60w=
X-Google-Smtp-Source: ABdhPJzGc0nP/V92wjCpytNZf23jYUE4/bcu6u6CIPbifAI4bVUrUxn3iCHPfPPtmrqRkg3i3R9EmA==
X-Received: by 2002:a17:907:6e90:b0:6f3:d2f2:6062 with SMTP id
 sh16-20020a1709076e9000b006f3d2f26062mr22414515ejc.376.1651707487192; 
 Wed, 04 May 2022 16:38:07 -0700 (PDT)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com.
 [209.85.221.51]) by smtp.gmail.com with ESMTPSA id
 q2-20020a1709064c8200b006f3ef214dccsm105862eju.50.2022.05.04.16.38.06
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 May 2022 16:38:06 -0700 (PDT)
Received: by mail-wr1-f51.google.com with SMTP id i5so3923025wrc.13
 for <dri-devel@lists.freedesktop.org>; Wed, 04 May 2022 16:38:06 -0700 (PDT)
X-Received: by 2002:a05:6000:c7:b0:20a:d8c1:d044 with SMTP id
 q7-20020a05600000c700b0020ad8c1d044mr18472545wrx.422.1651707485535; Wed, 04
 May 2022 16:38:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220504154909.1.Iaebd35e60160fc0f2a50fac3a0bf3b298c0637c8@changeid>
 <CAA8EJpqfKKELrkRS89ssDU_bP67_sJ06B6VGGSmR_=D4bV-wZg@mail.gmail.com>
In-Reply-To: <CAA8EJpqfKKELrkRS89ssDU_bP67_sJ06B6VGGSmR_=D4bV-wZg@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 4 May 2022 16:37:52 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VEHn6QxhN9c6xaceaXBwre4K0Tvnr-ESd+SOqL9D4ZHw@mail.gmail.com>
Message-ID: <CAD=FV=VEHn6QxhN9c6xaceaXBwre4K0Tvnr-ESd+SOqL9D4ZHw@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: Fix shutdown
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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
Cc: LKML <linux-kernel@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 freedreno <freedreno@lists.freedesktop.org>, Lv Ruyi <lv.ruyi@zte.com.cn>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Xu Wang <vulab@iscas.ac.cn>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <sean@poorly.run>,
 Vinod Polimera <quic_vpolimer@quicinc.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, May 4, 2022 at 4:29 PM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Thu, 5 May 2022 at 01:49, Douglas Anderson <dianders@chromium.org> wrote:
> >
> > When rebooting on my sc7280-herobrine based device, I got a
> > crash. Upon debugging, I found that I was in msm_drv_shutdown() and my
> > "pdev" was the one associated with mdss_probe().
> >
> > From source, I found that mdss_probe() has the line:
> >   platform_set_drvdata(pdev, mdss);
> > ...where "mdss" is of type "struct msm_mdss *".msm_drv_probe
> >
> > Also from source, I saw that in msm_drv_shutdown() we have the line:
> >   struct msm_drm_private *priv = platform_get_drvdata(pdev);
> >
> > This is a mismatch and is the root of the problem.
> >
> > Further digging made it apparent that msm_drv_shutdown() is only
> > supposed to be used for parts of the msm display framework that also
> > call msm_drv_probe() but mdss_probe() doesn't call
> > msm_drv_probe(). Let's remove the shutdown functon from msm_mdss.c.
> >
> > Digging a little further, code inspection found that two drivers that
> > use msm_drv_probe() weren't calling msm_drv_shutdown(). Let's add it
> > to them.
> >
> > Fixes: ecb23f2e3009 ("drm/msm: split the main platform driver")
>
> More likely:
> Fixes: 6874f48bb8b0 ("drm/msm: make mdp5/dpu devices master components")

Oh, I see! The commit I tagged is the one that set the shutdown in
msm_mdss.c, but at the time of that commit it actually _did_ call
msm_drv_probe().

v2 coming right up.

-Doug
