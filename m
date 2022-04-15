Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45FAF502F58
	for <lists+dri-devel@lfdr.de>; Fri, 15 Apr 2022 21:41:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05CB910E22C;
	Fri, 15 Apr 2022 19:41:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 069DD10E22C
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Apr 2022 19:41:11 +0000 (UTC)
Received: by mail-oi1-x229.google.com with SMTP id 12so9165509oix.12
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Apr 2022 12:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=9F4ViBP1B5lwRe2e2GOjDx7R3bqEzOXyftxCKevZkTo=;
 b=djiFHbU71h427KMMGiu8O39Z5qNmrcZo7U8qtlL2H+qzkMAgoE3ZBXAywvKa96Fna4
 4bVsWymVwZojVFq9YVAwHiVnjdEt24eKSIOuoQZoqLSdIWUnZDnAucNA/WNDDnhFJFvs
 XQ9u+xan4EH3Ox3JXCPkvzQVsp8yjFZMqC7qM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=9F4ViBP1B5lwRe2e2GOjDx7R3bqEzOXyftxCKevZkTo=;
 b=suIDlKdiwPIASG/fmRuSZGgS5gwnlNjQuPUgpwWxjblXkPp8X0KGo/fy+Rlw7VC7/J
 yPRpO4ojXuhG/TzCx5500IjrkCYWIkFDQyoRTDynwA1ddfNys/blV69+MiElojiZCiJy
 LXZpnOH3a+Ei1WvSW/Brzy8GzfrA0k0+aZggCCBxxq6lPH4RK0TZQdqBBv+FbCAsHcWf
 NqbxnOtRdiWTx8XWmJusWFulSo3CI7CIiBwcqSWaNxNEEbJvgmYQC0WGzaKh/+mP2L9F
 RebEGysRZCeeC2PFnsUrYkeisvCTQgRobsWI2SSEP++SBVEd8XxbXXtPIipuZKfBGeGQ
 4Kng==
X-Gm-Message-State: AOAM532cL1RkTGKEmnT0B/Ud59p9a6W1GICOiZJcH+0isMQjrCV6DvsA
 76tnFC69bVi4/AjrkWMyIcd0NK8pWaXEaMrYXOwVMg==
X-Google-Smtp-Source: ABdhPJy9Jcxm6UCGAvjnJS200A66cR1gcelPmdS+jYEZAoTEUiln8LGRS79Rzd5M4yf03+OIX6kjS8zcPbz4n4TeoO8=
X-Received: by 2002:aca:bd41:0:b0:2ec:ff42:814f with SMTP id
 n62-20020acabd41000000b002ecff42814fmr238562oif.63.1650051670191; Fri, 15 Apr
 2022 12:41:10 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 15 Apr 2022 12:41:09 -0700
MIME-Version: 1.0
In-Reply-To: <1650049782-8421-1-git-send-email-quic_abhinavk@quicinc.com>
References: <1650049782-8421-1-git-send-email-quic_abhinavk@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Fri, 15 Apr 2022 12:41:09 -0700
Message-ID: <CAE-0n51MLxEoBegCj1eR2ee=ZP6cDqmp5tUAu+RM4XycNn3=mw@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: remove unused hotplug and edid macros from
 msm_drv.h
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, freedreno@lists.freedesktop.org
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
Cc: dri-devel@lists.freedesktop.org, quic_khsieh@quicinc.com,
 seanpaul@chromium.org, dmitry.baryshkov@linaro.org, quic_jesszhan@quicinc.com,
 quic_aravindh@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Abhinav Kumar (2022-04-15 12:09:42)
> Remove unused MSM_DISPLAY_CAP_HOT_PLUG and MSM_DISPLAY_CAP_EDID
> macros from msm_drv.h.
>
> Even if we need these, there are drm equivalent ones present.
>
> Reported-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
